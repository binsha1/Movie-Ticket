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
                movie_id,
                theatre_id,
                screen_id,
                screen_time_id,
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
<!-----------------Get All Show  ------------------------>
<cffunction name="showDetails" access="public" >        
        <cfquery name="show_details" result="show_data" >
            SELECT sh.id,m.poster,m.movie_name,th.theatre_name,m.release_date,m.duration,
            s.screen_name,st.start_time,st.show_name,sh.end_date,sh.priority
            FROM movie_ticket.manage_shows sh
            INNER JOIN movie_ticket.movie m ON sh.movie_id =m.id
            INNER JOIN movie_ticket.theatre th ON sh.theatre_id=th.id 
            INNER JOIN movie_ticket.screen s ON sh.screen_id=s.id
            INNER JOIN movie_ticket.screen_show_time st ON sh.screen_time_id =st.id
        </cfquery>  
        <cfreturn show_details> 
    </cffunction>

<!-----------------Get A Show Details ------------------------>
<cffunction name="getShowDetails" access="remote" returnFormat = "json" >    
        <cfargument  name="showId" type="integer">    
        <cfquery name="show_details" result="show_data" returntype="array" >
            SELECT sh.id,m.id as m_id,th.id as t_id,s.id as s_id,st.id as st_id,m.poster,m.movie_name,th.theatre_name,m.release_date,m.duration,
            s.screen_name,st.start_time,st.show_name,sh.end_date,sh.priority,sh.total_seats
            FROM movie_ticket.manage_shows sh
            INNER JOIN movie_ticket.movie m ON sh.movie_id =m.id
            INNER JOIN movie_ticket.theatre th ON sh.theatre_id=th.id 
            INNER JOIN movie_ticket.screen s ON sh.screen_id=s.id
            INNER JOIN movie_ticket.screen_show_time st ON sh.screen_time_id =st.id
            WHERE sh.id=<cfqueryparam value="#arguments.showId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>  
        <cfreturn show_details> 
    </cffunction>
<!-------------------Delete A Show --------------------------->
    <cffunction name="deleteShow" access="remote" output="true">
        <cfargument  name="id" type="string">        
        <cfset local.status=hash("5","sha")>        
        <cfquery name="delete_show"  result="show_del">
            DELETE FROM movie_ticket.manage_shows
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>        
        <cflocation  url="../admin/show_list.cfm?status=#local.status#" addtoken="no">  
    </cffunction>
<!-----------------Show Time Functions ------------------------>
</cfcomponent>