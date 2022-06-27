<cfcomponent>
    <cffunction name="doLogin" access="remote" output="true" >
        <cfargument  name="user_name" type="string" required="true">
        <cfargument  name="pwd" type="string" required="true">        
        <cfset local.password=hash(arguments.pwd,'sha') >       
        <cfquery name="loginUser" datasource="movie_ticket" result="log_res">
            SELECT * FROM movie_ticket.login 
            WHERE user_name="#arguments.user_name#" AND password="#local.password#"
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
</cfcomponent>