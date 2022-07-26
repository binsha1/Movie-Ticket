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
    <cffunction  name="checkLogin" access="remote">
        <cfoutput>
        #IsUserLoggedIn()#
        </cfoutput>
        <cfif IsUserLoggedIn() EQ "NO">
            <cflocation  url="../modals/create_theatre.cfm" addtoken="no">

        </cfif>
    </cffunction>

</cfcomponent>

