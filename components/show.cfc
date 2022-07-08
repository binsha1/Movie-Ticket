<cfcomponent>

<!-----------------Show Time Functions ------------------------>
<!---------------- Create Show Time Function ------------------------>
<cffunction name="createShow" access="remote">
    <cfargument  name="movie" type="integer">
    <cfargument  name="theatre" type="integer">
    <cfargument  name="screen" type="integer">
    <cfargument  name="screen_time" type="integer">
    <cfargument  name="end_date" type="string">
    <cfargument  name="show_priority" type="string">        
    <cfargument  name="total_seats" type="string">        
    <cfif arguments.movie!="" && arguments.theatre!="" && arguments.screen!="" && arguments.screen_time!=""
        && arguments.end_date!="" && arguments.show_priority!="" && arguments.total_seats!="">
        <cfquery name="add_show" result="show_res">
            INSERT INTO movie_ticket.manage_shows(                        
                movie,
                theatre,
                screen,
                screen_time,
                end_date,                        
                priority,                      
                total_seats
                ) 
            VALUES(                            
                    <cfqueryparam value="#arguments.movie#" cfsqltype="CF_SQL_INTEGER">,
                    <cfqueryparam value="#arguments.theatre#" cfsqltype="CF_SQL_INTEGER">,
                    <cfqueryparam value="#arguments.screen#" cfsqltype="CF_SQL_INTEGER">,
                    <cfqueryparam value="#arguments.screen_time#" cfsqltype="CF_SQL_INTEGER">,
                    <cfqueryparam value="#arguments.end_date#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.show_priority#" cfsqltype="CF_SQL_VARCHAR">,                            
                    <cfqueryparam value="#arguments.total_seats#" cfsqltype="CF_SQL_VARCHAR">               
                                                                            
                    )
        </cfquery>
        <cfif show_res.RecordCount EQ 1>
            <cfset local.status=hash("1","sha")>
        </cfif>
    <cfelse>
            <cfset local.status=hash('4','sha')>
    </cfif>
    <cflocation  url="../admin/show_list.cfm?status=#local.status#" AddToken="no">    
</cffunction>
<!-----------------Show Time Functions ------------------------>
</cfcomponent>