<cfcomponent>

<!-----------------Show Time Functions ------------------------>
<!---------------- Create Show Time Function ------------------------>
<cffunction name="createShow" access="remote" output="true">
    <cfargument  name="movie" type="integer">
    <cfargument  name="theatre" type="integer">
    <cfargument  name="screen" type="integer">
    <cfargument  name="screen_time" type="integer">
    <cfargument  name="end_date" type="string">
    <cfargument  name="show_priority" type="string">        
    <cfargument  name="total_seats" type="string">    
    <cfquery name="show_exists" result="exist_res">
        SELECT * FROM movie_ticket.manage_shows where movie_id=<cfqueryparam value="#arguments.movie#" cfsqltype="CF_SQL_INTEGER"> 
        and theatre_id=<cfqueryparam value="#arguments.theatre#" cfsqltype="CF_SQL_INTEGER"> 
        and screen_id=<cfqueryparam value="#arguments.screen#" cfsqltype="CF_SQL_INTEGER"> 
        and screen_time_id=<cfqueryparam value="#arguments.screen_time#" cfsqltype="CF_SQL_INTEGER"> 
    </cfquery>
    <cfquery name="movie_res" result="movie_details">
        SELECT * FROM movie_ticket.movie WHERE id=<cfqueryparam value="#arguments.movie#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    <cfoutput query='movie_res'>
        <cfset start_date=#release_date#>
    </cfoutput>    
    
    <cfif arguments.movie!="" && arguments.theatre!="" && arguments.screen!="" && arguments.screen_time!=""
        && arguments.end_date!="" && arguments.show_priority!="" && arguments.total_seats!="">
        <cfif dateCompare(arguments.end_date,start_date) NEQ -1>
            <cfif exist_res.RecordCount EQ 0>
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
                <cfset local.status=hash('3','sha')>
            </cfif>
        <cfelse>
            <cfset local.status=hash('6','sha')>
        </cfif>
    <cfelse>
            <cfset local.status=hash('4','sha')>
    </cfif>
    <cflocation  url="../admin/show_list.cfm?status=#local.status#" AddToken="no">    
</cffunction>

<!---------------- Edit Show Time Function ------------------------>
<cffunction name="editShow" access="remote">
    <cfargument  name="movie" type="integer">
    <cfargument  name="theatre" type="integer">
    <cfargument  name="screen" type="integer">
    <cfargument  name="screen_time" type="integer">
    <cfargument  name="end_date" type="string">
    <cfargument  name="show_priority" type="string">        
    <cfargument  name="total_seats" type="string">      
    <cfargument  name="id" type="integer"> 
    <cfquery name="show_exists" result="exist_res">
        SELECT * FROM movie_ticket.manage_shows where movie_id=<cfqueryparam value="#arguments.movie#" cfsqltype="CF_SQL_INTEGER"> 
        and theatre_id=<cfqueryparam value="#arguments.theatre#" cfsqltype="CF_SQL_INTEGER"> 
        and screen_id=<cfqueryparam value="#arguments.screen#" cfsqltype="CF_SQL_INTEGER"> 
        and screen_time_id=<cfqueryparam value="#arguments.screen_time#" cfsqltype="CF_SQL_INTEGER"> 
        and id!=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER"> 
    </cfquery>
    <cfquery name="movie_res" result="movie_details">
        SELECT * FROM movie_ticket.movie WHERE id=<cfqueryparam value="#arguments.movie#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
    <cfoutput query='movie_res'>
        <cfset start_date=#release_date#>
    </cfoutput>         
    <cfif arguments.movie!="" && arguments.theatre!="" && arguments.screen!="" && arguments.screen_time!=""
        && arguments.end_date!="" && arguments.show_priority!="" && arguments.total_seats!="" >
        <cfif dateCompare(arguments.end_date,start_date) NEQ -1>
            <cfif exist_res.RecordCount EQ 0>        
                <cfquery name="edit_show" result="edit_res">
                    UPDATE movie_ticket.manage_shows SET                   
                            movie_id=<cfqueryparam value="#arguments.movie#" cfsqltype="CF_SQL_INTEGER">,                           
                            theatre_id=<cfqueryparam value="#arguments.theatre#" cfsqltype="CF_SQL_INTEGER">,
                            screen_id=<cfqueryparam value="#arguments.screen#" cfsqltype="CF_SQL_INTEGER">,
                            screen_time_id=<cfqueryparam value="#arguments.screen_time#" cfsqltype="CF_SQL_INTEGER">,
                            end_date=<cfqueryparam value="#arguments.end_date#" cfsqltype="CF_SQL_VARCHAR">,
                            priority=<cfqueryparam value="#arguments.show_priority#" cfsqltype="CF_SQL_VARCHAR">,
                            total_seats=<cfqueryparam value="#arguments.total_seats#" cfsqltype="CF_SQL_VARCHAR">                                                   
                            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">               
                    
                </cfquery>
                <cfif edit_res.RecordCount EQ 1>
                    <cfset local.status=hash("2","sha")>
                </cfif>
            <cfelse>
                <cfset local.status=hash('3','sha')>
            </cfif>
        <cfelse>
            <cfset local.status=hash('6','sha')>
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
            SELECT sh.id,m.id as m_id,th.id as t_id,s.id as s_id,st.id as st_id,m.poster,m.movie_name,
            m.release_date,m.duration,m.language,m.movie_format,th.theatre_name,
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

<!-------------------Now Playing ShOW Details  --------------------------->
<cffunction name="nowDetails" access="public" >   
   <cfset local.Today = dateFormat(Now(),"yyyy-mm-dd")>     
        <cfquery name="show_details" result="show_data" >
            SELECT DISTINCT m.movie_name ,m.genre,sh.id,m.poster,m.language,m.release_date,m.duration,sh.total_seats,
            sh.end_date,sh.priority,m.id as m_id
            FROM movie_ticket.manage_shows sh
            INNER JOIN movie_ticket.movie m ON sh.movie_id =m.id            
            WHERE sh.end_date > <cfqueryparam value="#local.Today#" cfsqltype="cf_sql_date"> 
            AND m.release_date < <cfqueryparam value="#local.Today#" cfsqltype="cf_sql_date"> 
            OR sh.end_date=<cfqueryparam value="#local.Today#" cfsqltype="cf_sql_date"> 
            GROUP BY m.movie_name
        </cfquery>
        <cfreturn show_details> 
    </cffunction>

<!-------------------Upcoming Movie Details  --------------------------->
<cffunction name="comingDetails" access="public" >   
   <cfset local.Today = dateFormat(Now(),"yyyy-mm-dd")>     
        <cfquery name="show_details" result="show_data" >
            SELECT DISTINCT m.movie_name ,m.genre,sh.id,m.poster,m.language,m.release_date,m.duration,sh.total_seats,
            sh.end_date,sh.priority,m.id as m_id
            FROM movie_ticket.manage_shows sh
            INNER JOIN movie_ticket.movie m ON sh.movie_id =m.id            
            WHERE m.release_date > <cfqueryparam value="#local.Today#" cfsqltype="cf_sql_date">             
            GROUP BY m.movie_name
        </cfquery>
        <cfreturn show_details> 
    </cffunction>

<!-------------------All Movie Details  --------------------------->
<cffunction name="allDetails" access="public" >  

   <cfset local.Today = dateFormat(Now(),"yyyy-mm-dd")>     
        <cfquery name="show_details" result="show_data" >
            SELECT DISTINCT m.movie_name ,m.genre,sh.id,m.poster,m.language,m.release_date,m.duration,sh.total_seats,
            sh.end_date,sh.priority,m.id as m_id
            FROM movie_ticket.manage_shows sh
            INNER JOIN movie_ticket.movie m ON sh.movie_id =m.id            
            WHERE m.release_date > <cfqueryparam value="#local.Today#" cfsqltype="cf_sql_date"> 
            OR  sh.end_date > <cfqueryparam value="#local.Today#" cfsqltype="cf_sql_date">  
            OR  sh.end_date = <cfqueryparam value="#local.Today#" cfsqltype="cf_sql_date">          
            GROUP BY m.movie_name
        </cfquery>
        <cfreturn show_details> 
    </cffunction>
<cffunction  name="getMovieDate" access="remote">
    <cfargument  name="date" type="date">
    <cfset local.cdate=toBase64(arguments.date)>
    <cflocation url="../show.cfm?cdate=#local.cdate#" addtoken="no">       
</cffunction>
<cffunction name="showDate" access="remote" output="true" >  
    <cfargument  name="cdate" type="date">
    <cfquery name="date_details" result="date_res" >
        SELECT DISTINCT
                    m.movie_name,sh.id,m.poster,m.genre,
                    m.language,m.release_date,m.trailer_url,
                    m.duration,sh.total_seats,            
                    sh.end_date,sh.priority,
                    sh.id,
                    th.theatre_name,                   
                    s.screen_name,st.start_time,
                    st.show_name,m.id as m_id,th.id as t_id,s.id as s_id,st.id as st_id
                FROM movie_ticket.manage_shows sh
                INNER JOIN movie_ticket.movie m ON sh.movie_id =m.id               
                INNER JOIN movie_ticket.theatre th ON sh.theatre_id=th.id 
                INNER JOIN movie_ticket.screen s ON sh.screen_id=s.id
                INNER JOIN movie_ticket.screen_show_time st ON sh.screen_time_id =st.id
                WHERE sh.end_date > <cfqueryparam value="#arguments.cdate#" cfsqltype="cf_sql_date"> 
            AND m.release_date < <cfqueryparam value="#arguments.cdate#" cfsqltype="cf_sql_date"> 
            OR sh.end_date=<cfqueryparam value="#arguments.cdate#" cfsqltype="cf_sql_date"> 
            
                 
        </cfquery>
        <cfreturn date_details>  
    
   
</cffunction>
<cffunction name="todayDetails" access="public" >   
   <cfset local.Today = dateFormat(Now(),"yyyy-mm-dd")>   

        <cfquery name="show_details" result="show_data" >
            SELECT DISTINCT m.movie_name ,s.screen_name, th.theatre_name,m.genre,sh.id,m.poster,m.language,
            m.release_date,m.duration,sh.total_seats,m.trailer_url,
            sh.end_date,sh.priority,m.id as m_id
            FROM movie_ticket.manage_shows sh
            INNER JOIN movie_ticket.movie m ON sh.movie_id =m.id  
            INNER JOIN movie_ticket.theatre th ON sh.theatre_id=th.id
            INNER JOIN movie_ticket.screen s ON sh.screen_id=s.id           
            WHERE sh.end_date > <cfqueryparam value="#local.Today#" cfsqltype="cf_sql_date"> 
            AND m.release_date < <cfqueryparam value="#local.Today#" cfsqltype="cf_sql_date"> 
            OR sh.end_date=<cfqueryparam value="#local.Today#" cfsqltype="cf_sql_date"> 
            
        </cfquery>
        <cfreturn show_details> 
    </cffunction>

    <cffunction name="getMovieShows" access="public">
        <cfargument  name="movId" type="integer">
        <cfargument  name="pdate" type="date">
        <cfquery name="show_movie" result="show_res">
         SELECT DISTINCT m.movie_name ,s.screen_name,st.start_time, th.theatre_name,
            m.genre,sh.id,m.poster,m.language,m.wallpaper,
            m.release_date,m.duration,sh.total_seats,m.trailer_url,th.address,
            sh.end_date,sh.priority,m.id as m_id
            FROM movie_ticket.manage_shows sh
            INNER JOIN movie_ticket.movie m ON sh.movie_id =m.id  
            INNER JOIN movie_ticket.theatre th ON sh.theatre_id=th.id
            INNER JOIN movie_ticket.screen s ON sh.screen_id=s.id 
            INNER JOIN movie_ticket.screen_show_time st ON sh.screen_time_id=st.id
            WHERE m.id =<cfqueryparam value="#arguments.movId#" cfsqltype="CF_SQL_INTEGER"> AND sh.end_date > <cfqueryparam value="#arguments.pdate#" cfsqltype="cf_sql_date"> 
            AND m.release_date < <cfqueryparam value="#arguments.pdate#" cfsqltype="cf_sql_date"> 
            OR sh.end_date=<cfqueryparam value="#arguments.pdate#" cfsqltype="cf_sql_date">  ORDER BY st.start_time             
        </cfquery>


       
       
        <cfreturn show_movie>
        </cffunction>

        
    <cffunction name="seatSelect" access="remote">
        <cfargument name="total_seats" type="integer">
        <cfargument name="show_id" type="integer">
        <cfargument name="seats" type="integer">
        <cfargument name="cdate" type="date">
        <cfif arguments.total_seats GT arguments.seats>
            <cfset local.seat_num=toBase64(arguments.seats)>
            <cfset local.show_id=toBase64(arguments.show_id)>
            <cfset local.date=toBase64(arguments.cdate)>
            <cflocation  url="../seat_select.cfm?seat_num=#local.seat_num#&show_id=#local.show_id#&date=#local.date#" addtoken="no">
        <cfelse>
            <cfset local.status=hash('1','sha')>
            
        </cfif>
    </cffunction>
 
<!-----------------Show Time Functions ------------------------>


</cfcomponent>