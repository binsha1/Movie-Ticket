<cfcomponent>
    <!------------------------Movie Functions ----------------------------> 
    <!-----------------------Create Movie --------------------------->
        <cffunction  name="createMovie" access="remote" output="true">
        <cfargument  name="movie_name" type="string">
        <cfargument  name="release_date" type="string">
        <cfargument  name="movie_format" type="string">
        <cfargument  name="genre" type="string">
        <cfargument  name="language" type="string">        
        <cfargument  name="duration" type="string">        
        <cfargument  name="trailer_url" type="string">
        <cfargument  name="poster" type="string">
        <cfargument  name="wallpaper" type="string">
        <cfargument  name="description" type="string">
         <cfset local.thisDir = expandPath("../uploads")>     
        <cfif len(trim(arguments.poster) ) >      
            <cffile action="upload" fileField="form.poster"  destination="#thisDir#" result="fileUpload" nameconflict="overwrite">
            <cfif fileupload.filesize lt 1000000>            
                <cfset local.poster=fileupload.serverfile >
            <cfelse>
                <cfset local.status=hash('6','sha')>  
            </cfif>
        </cfif>
        <cfif len(trim(arguments.wallpaper))>
            <cffile action="upload" fileField="form.wallpaper"  destination="#thisDir#" result="wallUpload" nameconflict="overwrite">
            <cfif wallUpload.filesize lt 1000000>            
                <cfset local.wallpaper=wallUpload.serverfile >
            <cfelse>
                <cfset local.status=hash('6','sha')>  
            </cfif>                  
        </cfif>
        <cfquery name="movie_exists" result="movie_res">
                SELECT movie_name FROM movie_ticket.movie WHERE movie_name=<cfqueryparam value="#arguments.movie_name#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfquery name="trailer_exists" result="trailer_res">
                SELECT trailer_url FROM movie_ticket.movie WHERE trailer_url=<cfqueryparam value="#arguments.trailer_url#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif movie_res.RecordCount NEQ 0>
            <cfset local.status=hash('2','sha')>
        </cfif>
        <cfif trailer_res.RecordCount NEQ 0>
                <cfset local.status=hash('3','sha')>
            </cfif>
        <cfif arguments.movie_name!="" && arguments.release_date!="" && arguments.movie_format!=""
            && arguments.genre!="" && arguments.language!="" && arguments.duration!="" && arguments.trailer_url!="" 
            && arguments.description!="">
            <cfif movie_res.RecordCount EQ 0 and trailer_res.RecordCount EQ 0 and fileupload.filesize LT 1000000 and wallUpload.filesize LT 1000000>
                <cfquery name="add_movie" result="movie_res">
                    INSERT INTO movie_ticket.movie(                        
                        movie_name,
                        release_date,
                        movie_format,
                        genre,
                        language,                        
                        duration,                      
                        trailer_url,
                        poster,
                        wallpaper,
                        description
                        ) 
                    VALUES(                            
                            <cfqueryparam value="#arguments.movie_name#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#arguments.release_date#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#arguments.movie_format#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#arguments.genre#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#arguments.language#" cfsqltype="CF_SQL_VARCHAR">,                            
                            <cfqueryparam value="#arguments.duration#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#arguments.trailer_url#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#local.poster#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#local.wallpaper#" cfsqltype="CF_SQL_VARCHAR">,                
                            <cfqueryparam value="#arguments.description#" cfsqltype="CF_SQL_VARCHAR">                                                          
                            )
                    </cfquery>
                <cfif movie_res.RecordCount EQ 1>
                    <cfset local.status=hash("1","sha")>
                </cfif>
            <cfelse>
                <cflocation  url="../admin/movie_list.cfm?status=#local.status#" AddToken="no">
            </cfif>                
        <cfelse>
            <cfset local.status=hash('4','sha')>
        </cfif>
        <cflocation  url="../admin/movie_list.cfm?status=#local.status#" AddToken="no">

    </cffunction>
    
     <!-----------------------Edit Movie --------------------------->

    <cffunction name="editMovie" access="remote" output="true">
        <cfargument  name="movie_name" type="string">
        <cfargument  name="release_date" type="string">
        <cfargument  name="movie_format" type="string">
        <cfargument  name="genre" type="string">
        <cfargument  name="language" type="string">        
        <cfargument  name="duration" type="string">        
        <cfargument  name="trailer_url" type="string">
        <cfargument  name="poster" type="string">
        <cfargument  name="wallpaper" type="string">
        <cfargument  name="description" type="string">
        <cfargument  name="id" type="integer">
        <cfset local.thisDir = expandPath("../uploads")>
       
        <cfquery name="fetchPoster"  result="poster_res">
            SELECT poster FROM movie_ticket.movie WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery> 
        
        <cfquery name="fetchWall"  result="wall_res">
            SELECT wallpaper FROM movie_ticket.movie WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfif  len(trim(arguments.poster) ) >      
            <cffile action="upload" fileField="form.poster"  destination="#thisDir#" result="fileUpload" nameconflict="overwrite">
            <cfif fileupload.filesize lt 1000000>            
                <cfset local.poster=fileupload.serverfile >
            <cfelse>
                <cfset local.status=hash('6','sha')>  
            </cfif>
        <cfelseif poster_res.RecordCount EQ 1>
            <cfoutput query="fetchPoster">
                <cfset local.poster=fetchPoster.poster >
            </cfoutput> 
        </cfif>
        <cfif len(trim(arguments.wallpaper))>
            <cffile action="upload" fileField="form.wallpaper"  destination="#thisDir#" result="wallUpload" nameconflict="overwrite">
            <cfif wallUpload.filesize lt 1000000>            
                <cfset local.wallpaper=wallUpload.serverfile >
            <cfelse>
                <cfset local.status=hash('6','sha')>  
            </cfif>
        <cfelseif wall_res.RecordCount EQ 1>
            <cfoutput query="fetchWall">
                <cfset local.wallpaper=fetchWall.wallpaper >
            </cfoutput>                               
        </cfif>
        <cfquery name="movie_exists" result="movie_res">
                SELECT movie_name FROM movie_ticket.movie 
                WHERE movie_name=<cfqueryparam value="#arguments.movie_name#" cfsqltype="CF_SQL_VARCHAR"> AND 
                id!=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfquery name="trailer_exists" result="trailer_res">
                SELECT trailer_url FROM movie_ticket.movie WHERE 
                trailer_url=<cfqueryparam value="#arguments.trailer_url#" cfsqltype="CF_SQL_VARCHAR"> AND 
                id!=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif movie_res.RecordCount NEQ 0>
            <cfset local.status=hash('2','sha')>
        </cfif>
        <cfif trailer_res.RecordCount NEQ 0>
            <cfset local.status=hash('3','sha')>
        </cfif>
        <cfif arguments.movie_name!="" && arguments.release_date!="" && arguments.movie_format!=""
            && arguments.genre!="" && arguments.language!="" && arguments.duration!="" && arguments.trailer_url!="" 
            && arguments.description!="">
            <cfif movie_res.RecordCount EQ 0 and trailer_res.RecordCount EQ 0 >
                <cfquery name="edit_movie" result="update_movie">
                    UPDATE movie_ticket.movie SET                   
                    movie_name=<cfqueryparam value="#arguments.movie_name#" cfsqltype="CF_SQL_VARCHAR">,
                    release_date=<cfqueryparam value="#arguments.release_date#" cfsqltype="CF_SQL_VARCHAR">,
                    movie_format=<cfqueryparam value="#arguments.movie_format#" cfsqltype="CF_SQL_VARCHAR">,                    
                    genre=<cfqueryparam value="#arguments.genre#" cfsqltype="CF_SQL_VARCHAR">, 
                    language=<cfqueryparam value="#arguments.language#" cfsqltype="CF_SQL_VARCHAR">,
                    duration=<cfqueryparam value="#arguments.duration#" cfsqltype="CF_SQL_VARCHAR">,                    
                    trailer_url=<cfqueryparam value="#arguments.trailer_url#" cfsqltype="CF_SQL_VARCHAR">,                    
                    description=<cfqueryparam value="#arguments.description#" cfsqltype="CF_SQL_VARCHAR">,
                    poster=<cfqueryparam value="#local.poster#" cfsqltype="CF_SQL_VARCHAR">,
                    wallpaper=<cfqueryparam value="#local.wallpaper#" cfsqltype="CF_SQL_VARCHAR">
                    WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER"> 
                </cfquery> 
                <cfif update_movie.RecordCount EQ 1>
                        <cfset local.status=hash('7','sha')>
                </cfif>
            <cfelse>
                 <cflocation  url="../admin/movie_list.cfm?status=#local.status#" AddToken="no">                        
            </cfif>      
            
        <cfelse>
            <cfset local.status=hash('4','sha')>

        </cfif>
        <cflocation  url="../admin/movie_list.cfm?status=#local.status#" AddToken="no">  
    </cffunction>

    <!--------------------------Get Details of a Movie---------------->
    <cffunction name="getMovie" access="remote" returnFormat = "json">
        <cfargument name="movId" type="integer" required="false" >
        <cfquery name="movie" result="movie_data" returntype="array" >
            SELECT * FROM movie_ticket.movie
            WHERE id=<cfqueryparam value="#arguments.movId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>  
        <cfreturn movie> 
    </cffunction>

    <!--------------------------Get Movie Name --------------------------->
    <cffunction name="getMovieName" access="remote" returnFormat = "json">
        <cfargument name="movie_name" type="string"  >
        <cfquery name="movie" result="movie_data" returntype="array">
            SELECT * FROM movie_ticket.movie
            WHERE movie_name=<cfqueryparam value="#arguments.movie_name#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>  
        <cfreturn movie_data> 
    </cffunction>

    <!-------------------Delete A Movie --------------------------->
    <cffunction name="deleteMovie" access="remote" output="true">
        <cfargument  name="id" type="string">        
        <cfset local.status=hash("5","sha")>        
        <cfquery name="delete_movie"  result="movie_del">
            DELETE FROM movie_ticket.movie
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>        
        <cflocation  url="../admin/movie_list.cfm?status=#local.status#" addtoken="no">  
    </cffunction>

    <!-------------------Get Trailer Url  --------------------------->
    <cffunction name="getTrailerUrl" access="remote" returnFormat = "json">
        <cfargument name="trailer_name" type="string"  >
        <cfquery name="trailer" result="trailer_data" returntype="array">
            SELECT * FROM movie_ticket.movie
            WHERE trailer_url=<cfqueryparam value="#arguments.trailer_name#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>  
        <cfreturn trailer_data> 
    </cffunction>

    <!------------Get details of all movies -------->
    <cffunction name="movieDetails" access="public" output="true">
        <cfquery name="movie_details"  result="res">
            SELECT * FROM movie_ticket.movie;
        </cfquery>
        <cfreturn movie_details>
    </cffunction>
    <!------------------------- Movie Functions -------------------------->

    <!--------------------------Cast Functions----------------------------->
    
    <!--------------------------Create Cast for movie------------------------>
     <cffunction name="createCast" access="remote" output="true">       
        <cfargument  name="character_name" type="string">
        <cfargument  name="actor_name" type="string">
        <cfargument  name="actor_photo" type="string">
        <cfargument  name="movie_id" type="integer">
        <cfset local.movie_id=toBase64(arguments.movie_id)>
        <cfset local.thisDir = expandPath("../uploads")>     
        <cfif len(trim(arguments.actor_photo) ) >      
            <cffile action="upload" fileField="form.actor_photo"  destination="#thisDir#" result="fileUpload" nameconflict="overwrite">
            <cfif fileupload.filesize lt 1000000>            
                <cfset local.filename=fileupload.serverfile >
            <cfelse>
                <cfset local.status=hash('6','sha')>  
            </cfif>
        </cfif>
        <cfquery name="charName" result="char_name_res">
            SELECT character_name FROM movie_ticket.cast 
            WHERE character_name=<cfqueryparam value="#arguments.character_name#" cfsqltype="CF_SQL_VARCHAR">
            AND movie_id=<cfqueryparam value="#arguments.movie_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>        
        <cfquery name="actorName" result="actor_name_res">
            SELECT actor_name FROM movie_ticket.cast 
            WHERE actor_name=<cfqueryparam value="#arguments.actor_name#" cfsqltype="CF_SQL_VARCHAR">
            AND movie_id=<cfqueryparam value="#arguments.movie_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfif char_name_res.RecordCount NEQ 0>
            <cfset local.status=hash('5','sha')>
        </cfif>
        <cfif actor_name_res.RecordCount NEQ 0>
            <cfset local.status=hash('7','sha')>
        </cfif>

        <cfif arguments.character_name !="" && arguments.actor_name!="" >
            <cfif charName.RecordCount EQ 0 AND actorName.RecordCount EQ 0 AND fileupload.filesize lt 1000000>
                <cfquery name="add_cast" result="cast_res">
                    INSERT INTO movie_ticket.cast(                        
                        character_name,
                        actor_name,
                        actor_photo,
                        movie_id
                        ) 
                    VALUES(                            
                            <cfqueryparam value="#arguments.character_name#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#arguments.actor_name#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#local.filename#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#arguments.movie_id#" cfsqltype="CF_SQL_INTEGER">                                                                                       
                            )
                </cfquery>                
                <cfif cast_res.RecordCount EQ 1>
                        <cfset local.status=hash('1','sha')>
                </cfif>
            <cfelse>
                <cflocation  url="../admin/cast_crew.cfm?movie_id=#local.movie_id#&status=#local.status#" AddToken="no">
            </cfif>
        <cfelse>
            <cfset local.status=hash('4','sha')>
        </cfif>
        <cflocation  url="../admin/cast_crew.cfm?movie_id=#local.movie_id#&status=#local.status#" AddToken="no">
    </cffunction>

    <!--------------------------Details of cast of a movie----------------------------->
    <cffunction  name="castDetails"  access="public">
        <cfargument  name="movId" type="integer">
        <cfquery name="cast" result="cast_res">
            SELECT * FROM movie_ticket.cast WHERE movie_id=<cfqueryparam value="#arguments.movId#" cfsqltype="CF_SQL_INTEGER" >
        </cfquery>
        <cfreturn cast>
    </cffunction>

    <!--------------------------Delete a Cast of a Movie----------------------------->
    <cffunction  name="deleteCast"  access="remote">
        <cfargument  name="id" type="integer">
        <cfargument  name="movie_id" type="integer">
        <cfset local.enc_movie=toBase64(arguments.movie_id)>              
        <cfset local.status=hash("3","sha")>        
        <cfquery name="delete_cast"  result="cast_del">
            DELETE FROM movie_ticket.cast
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>        
        <cflocation  url="../admin/cast_crew.cfm?movie_id=#local.enc_movie#&status=#local.status#" addtoken="no">  
    </cffunction>

    <!--------------------------Cast Functions----------------------------->
</cfcomponent>