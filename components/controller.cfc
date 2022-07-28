<cfcomponent>
    <cffunction name="doLogin" access="remote" output="true" >
        <cfargument  name="user_name" type="string" required="true">
        <cfargument  name="pwd" type="string" required="true">        
        <cfset local.password=hash(arguments.pwd,'sha') >       
        <cfquery name="loginUser" datasource="movie_ticket" result="log_res">
            SELECT * FROM movie_ticket.login 
            WHERE user_name=<cfqueryparam value="#arguments.user_name#" cfsqltype="CF_SQL_VARCHAR">
             AND password=<cfqueryparam value="#local.password#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>        
        <cfif log_res.recordCount EQ 1>                      
            <cfset session.sessionUser={'user_id'=loginUser.id,'user_name'=loginUser.user_name}>           
            <cfif loginUser.role=='admin'>
                <cflocation  url="../admin/dashboard.cfm" addtoken="no">
            </cfif>
        <cfelse>
            <cfset local.status=hash('1','sha')>
            <cflocation  url="../admin/index.cfm?status=#local.status#" addtoken="no">            
        </cfif>   
    </cffunction>

    <cffunction name="doAdminLogout" access="remote" output="false">
        <cfset structDelete(session, "sessionUser")>
        <cflocation url="../admin/index.cfm" addtoken="no">
    </cffunction>
    <cffunction name="userLogout" access="remote" output="false">
        <cfset structDelete(session, "userLog")>
        <cflocation url="../index.cfm" addtoken="no">
    </cffunction>

    <cffunction name="updatePass" access="remote" output="true">
        <cfargument  name="old_pass" type="string">
        <cfargument  name="new_pass" type="string">
        <cfargument  name="c_pass" type="string">
        <cfset local.pass=hash(arguments.new_pass,'sha')>
        <cfif arguments.old_pass!="" && arguments.new_pass!="" && arguments.c_pass!="">
            <cfif arguments.new_pass==arguments.c_pass> 
                <cfquery name="update_pass" result="pass_res">
                    UPDATE movie_ticket.login SET 
                    password=<cfqueryparam value="#local.pass#" cfsqltype="CF_SQL_VARCHAR">
                    WHERE role="admin"
                </cfquery>
                <cfif pass_res.RecordCount NEQ 0>
                    <cfset local.status=hash('1','sha')>
                </cfif>
            <cfelse>
                <cfset local.status=hash('3','sha')>
                <cflocation  url="../admin/update_password.cfm?status=#local.status#" addtoken="no">
            </cfif>
        <cfelse>
            <cfset local.status=hash('2','sha')>
        </cfif>
        <cflocation  url="../admin/update_password.cfm?status=#local.status#" addtoken="no">
    </cffunction>

    <cffunction name="userSignUp" access="remote">

        <cfargument  name="full_name" type="string">
        <cfargument  name="email" type="string">        
        <cfargument  name="pass" type="string">
        <cfset local.password = hash(arguments.pass,'sha')>   
        <cfquery name="address_email" result="email_res">
            SELECT * FROM movie_ticket.login
            WHERE email_id=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
       
        <cfif email_res.RecordCount NEQ 0>
            <cfset local.status=hash('2','sha')>
        </cfif>
        
        <cfif arguments.full_name!="" && arguments.email!="" && arguments.pass!="" >
            <cfif email_res.RecordCount EQ 0  >
                <cfquery name="signup" result="result">
                    INSERT INTO movie_ticket.login(
                        user_name,
                        password,
                        role,
                        email_id,
                        registered_on) 
                    VALUES(
                        <cfqueryparam value="#arguments.full_name#" cfsqltype="CF_SQL_VARCHAR">,
                        
                        <cfqueryparam value="#local.password#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="user" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR"> ,  
                        <cfqueryparam value="#datetimeformat(now(),"yyyy-mm-dd HH:n:s")#" cfsqltype="CF_SQL_TIMESTAMP">                 
                        )
                </cfquery>
                <cfif result.RecordCount EQ 1>
                    <cfset local.status=hash('2','sha')>
                    <cflocation  url="../login.cfm?status=#local.status#" addtoken="no">
                </cfif>
            <cfelse>
                <cflocation  url="../signup.cfm?status=#local.status#" addtoken="no">
            </cfif>
        <cfelse>
            <cfset local.status=hash('3','sha')>
            <cflocation  url="../signup.cfm?status=#local.status#" addtoken="no">
        </cfif>      
    </cffunction>
    <!----<cffunction  name="checkLogin" access="remote">
        <cfoutput>
        #IsUserLoggedIn()#
        </cfoutput>
        <cfif IsUserLoggedIn() EQ "NO">
            <cflocation  url="../modals/create_theatre.cfm" addtoken="no">

        </cfif>
    </cffunction>---->

     <cffunction name="userLogin" access="remote" output="true" >
        <cfargument  name="email" type="string" required="true">
        <cfargument  name="pass" type="string" required="true">
        <cfargument  name="show_id" type="integer">
        <cfargument  name="movie_id" type="integer">
        <cfargument  name="cdate" type="date">
           
        <cfset local.password=hash(arguments.pass,'sha') >       
        <cfquery name="userLogData"  result="user_log">
            SELECT * FROM movie_ticket.login 
            WHERE email_id=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
             AND password=<cfqueryparam value="#local.password#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>   
        <cfif user_log.recordCount EQ 1>                      
            <cfset session.userLog={'user_id'=userLogData.id,'user_name'=userLogData.user_name}>   
             <cfif userLogData.role=='user'>
                <cfif arguments.login_value EQ "0">
                    <cflocation  url="../index.cfm" addtoken="no">
                <cfelse>    
                    <cflocation  url="../book-ticket.cfm?id=#toBase64(arguments.show_id)#&mid=#toBase64(arguments.movie_id)#&date=#toBase64(arguments.cdate)#" addtoken="no">
                </cfif>
            </cfif>
        <cfelse>
            <cfset local.status=hash('1','sha')>
            <cflocation  url="../login.cfm?status=#local.status#" addtoken="no">            
        </cfif>   
    </cffunction>

    <cffunction  name="allUsers" access="public">
        <cfquery name="user_list" result="user_res">
            SELECT * from movie_ticket.login WHERE role="user"
        </cfquery>
        <cfreturn user_list>
    </cffunction>

    <cffunction  name="deleteUser" access="remote">
        <cfargument  name="id" type="integer">
        <cfquery name="user_list" result="user_res">
            DELETE from movie_ticket.login WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfset local.status=hash('1','sha')>
        <cflocation url="../admin/user_list.cfm?status=#local.status#" addtoken="no">
    </cffunction>

</cfcomponent>




