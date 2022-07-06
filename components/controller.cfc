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

    <cffunction name="doAdminLogout" access="remote" output="false">
        <cfset structDelete(session, "sessionUser")>
        <cflocation url="../admin/index.cfm" addtoken="no">
    </cffunction>

    <cffunction name="createTheatre" access="remote" output="false">       
        <cfargument  name="theatre_name" type="string">
        <cfargument  name="email" type="string">
        <cfargument  name="phone" type="string">
        <cfargument  name="address" type="string">
        <cfargument  name="street_name" type="string">        
        <cfargument  name="pincode" type="integer">        
        <cfargument  name="theatre_img" type="string">                
        <cfset local.status="">
        <cfset local.thisDir = expandPath("../uploads")>        
        <cfquery name="theatre_email"  result="email_res">
            SELECT * FROM movie_ticket.theatre 
            WHERE email_id=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfquery name="theatre_phone" result="phone_res">
            SELECT * FROM movie_ticket.theatre  
            WHERE phone=<cfqueryparam value="#arguments.phone#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif len(trim(arguments.theatre_img)) >      
            <cffile action="upload" fileField="form.theatre_img"  destination="#thisDir#" result="fileUpload" nameconflict="overwrite">
            <cfif fileupload.filesize lt 1000000>            
                <cfset local.file_name=fileupload.serverfile >
            <cfelse>
                <cfset local.status=hash('6','sha')>  
            </cfif>                 
        </cfif>
        <cfif email_res.RecordCount NEQ 0>
            <cfset local.status=hash('2','sha')>
        </cfif> 
        <cfif phone_res.RecordCount NEQ 0>
            <cfset local.status=hash('3','sha')>
        </cfif>           
        <cfif arguments.theatre_name!="" && arguments.address!="" && arguments.pincode!="" && arguments.email!="" && arguments.phone!="" && arguments.street_name!="">
            <cfif email_res.RecordCount EQ 0 && phone_res.RecordCount EQ 0 && fileupload.filesize LT 1000000>
                <cfquery name="add_theatre" result="theatre_res">
                        INSERT INTO movie_ticket.theatre(                        
                            theatre_name,
                            email_id,
                            phone,
                            address,
                            street_name,                        
                            pincode,                      
                            photo
                            ) 
                        VALUES(                            
                                <cfqueryparam value="#arguments.theatre_name#" cfsqltype="CF_SQL_VARCHAR">,
                                <cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">,
                                <cfqueryparam value="#arguments.phone#" cfsqltype="CF_SQL_NUMERIC">,
                                <cfqueryparam value="#arguments.address#" cfsqltype="CF_SQL_VARCHAR">,
                                <cfqueryparam value="#arguments.street_name#" cfsqltype="CF_SQL_VARCHAR">,                            
                                <cfqueryparam value="#arguments.pincode#" cfsqltype="CF_SQL_INTEGER">,                
                                <cfqueryparam value="#local.file_name#" cfsqltype="CF_SQL_VARCHAR">                                                          
                                )
                </cfquery>
                <cfif theatre_res.RecordCount EQ 1>
                    <cfset local.status=hash("1","sha")>
                </cfif>
            <cfelse>
                <cflocation  url="../admin/theatre_list.cfm?status=#local.status#" AddToken="no">
            </cfif>             
        <cfelse>
            <cfset local.status=hash('4','sha')>
        </cfif>
        <cflocation  url="../admin/theatre_list.cfm?status=#local.status#" AddToken="no">
    </cffunction>


    

    <cffunction name="theatreDetails" access="public" output="true">
        <cfquery name="theatre_details"  result="res">
            SELECT * FROM movie_ticket.theatre;
        </cfquery>
        <cfreturn theatre_details>
    </cffunction>

    <cffunction name="movieDetails" access="public" output="true">
        <cfquery name="movie_details"  result="res">
            SELECT * FROM movie_ticket.movie;
        </cfquery>
        <cfreturn movie_details>
    </cffunction>

    <cffunction name="screenDetails" access="public" output="true">
        <cfargument  name="theatre_id" type="integer">
        <cfquery name="screen_details"  result="res">
            SELECT * FROM movie_ticket.screen 
            WHERE theatre_id=<cfqueryparam value="#arguments.theatre_id#" cfsqltype="CF_SQL_INTEGER">;
        </cfquery>
        <cfreturn screen_details>
    </cffunction>

    <cffunction name="timeDetails" access="public" output="true">
        <cfargument  name="theatre_id" type="integer">
        <cfquery name="time_details"  result="res">
            SELECT *
            FROM movie_ticket.screen_show_time st
            INNER JOIN movie_ticket.screen s ON s.id = st.screen_id
        WHERE 
        st.theatre_id= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.theatre_id#">
        </cfquery>
        <cfreturn time_details>
    </cffunction>

    <cffunction name="deleteTheatre" access="remote" output="true">
        <cfargument  name="id" type="string">        
        <cfset local.status=hash("5","sha")>        
        <cfquery name="delete_theatre"  result="theatre_del">
            DELETE FROM movie_ticket.theatre 
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>        
        <cflocation  url="../admin/theatre_list.cfm?status=#local.status#" addtoken="no">  
    </cffunction>

    

    <cffunction name="deleteScreen" access="remote" output="true">
        <cfargument  name="id" type="integer">
        <cfargument  name="theatre_id" type="integer"> 
        <cfset local.enc_theatre=toBase64(arguments.theatre_id)>              
        <cfset local.status=hash("3","sha")>        
        <cfquery name="delete_screen"  result="theatre_del">
            DELETE FROM movie_ticket.screen 
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>        
        <cflocation  url="../admin/screen_time.cfm?theatre_id=#local.enc_theatre#&status=#local.status#" addtoken="no">  
    </cffunction>

    <cffunction name="deleteScreenTime" access="remote" output="true">
        <cfargument  name="id" type="integer">
        <cfargument  name="theatre_id" type="integer"> 
        <cfset local.enc_theatre=toBase64(arguments.theatre_id)>              
        <cfset local.status=hash("3","sha")>        
        <cfquery name="delete_time"  result="time_del">
            DELETE FROM movie_ticket.screen_show_time 
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>        
        <cflocation  url="../admin/screen_time.cfm?theatre_id=#local.enc_theatre#&status=#local.status#" addtoken="no">  
    </cffunction>

    <cffunction name="getTheatre" access="remote" returnFormat = "json">
        <cfargument name="id" type="integer" required="false" >
        <cfquery name="theatres" result="theatre_data" returntype="array" >
            SELECT * FROM movie_ticket.theatre
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>  
        <cfreturn theatres> 
    </cffunction>    

    <cffunction name="editTheatre" access="remote" >        
        <cfargument  name="theatre_name" type="string">
        <cfargument  name="email_id" type="string">
        <cfargument  name="phone" type="string">        
        <cfargument  name="address" type="string">
        <cfargument  name="street_name" type="string">
        <cfargument  name="city" type="string">        
        <cfargument  name="pincode" type="integer">        
        <cfargument  name="theatre_img" type="string">
        <cfargument  name="id" type="integer">       
        <cfset local.thisDir = expandPath("../uploads")>        
        <cfquery name="fetchImg"  result="img_res">
            SELECT photo FROM movie_ticket.theatre WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfif len(trim(arguments.theatre_img)) >      
            <cffile action="upload" fileField="form.theatre_img"  destination="#thisDir#" result="fileUpload" nameconflict="overwrite">
            <cfif fileupload.filesize lt 1000000>            
                <cfset local.file_name=fileupload.serverfile >
            <cfelse>
                <cfset local.status=hash('6','sha')>  
            </cfif>            
        <cfelseif img_res.RecordCount EQ 1>
            <cfoutput query="fetchImg">
                <cfset local.file_name=photo >
            </cfoutput>                       
        </cfif>
        <cfquery name="theatre_email"   result="email_res">
            SELECT * FROM movie_ticket.theatre
            WHERE email_id=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR"> AND 
            id!=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfquery name="theatre_phone"   result="phone_res">
            SELECT * FROM movie_ticket.theatre
            WHERE phone=<cfqueryparam value="#arguments.phone#" cfsqltype="CF_SQL_VARCHAR"> AND 
            id!=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif email_res.RecordCount NEQ 0>
            <cfset local.status=hash('2','sha')>
        </cfif>
        <cfif phone_res.RecordCount NEQ 0>
            <cfset local.status=hash('3','sha')>
        </cfif>
        <cfif arguments.theatre_name!="" && arguments.address!="" && arguments.pincode!="" && arguments.email!="" && arguments.phone!="" && arguments.street_name!="">
            <cfif email_res.RecordCount EQ 0 AND phone_res.RecordCount EQ 0 AND fileupload.filesize LT 1000000>
                <cfquery name="edit_theatre" result="update_theatre">
                    UPDATE movie_ticket.theatre SET                   
                    theatre_name=<cfqueryparam value="#arguments.theatre_name#" cfsqltype="CF_SQL_VARCHAR">,
                    email_id=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">,
                    phone=<cfqueryparam value="#arguments.phone#" cfsqltype="CF_SQL_VARCHAR">,                    
                    address=<cfqueryparam value="#arguments.address#" cfsqltype="CF_SQL_VARCHAR">, 
                    street_name=<cfqueryparam value="#arguments.street_name#" cfsqltype="CF_SQL_VARCHAR">,                    
                    pincode=<cfqueryparam value="#arguments.pincode#" cfsqltype="CF_SQL_INTEGER">,                    
                    photo=<cfqueryparam value="#local.file_name#" cfsqltype="CF_SQL_VARCHAR">
                    WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER"> 
                </cfquery> 
                <cfif update_theatre.RecordCount EQ 1>
                        <cfset local.status=hash('7','sha')>
                </cfif>
            <cfelse>
                 <cflocation  url="../admin/theatre_list.cfm?status=#local.status#" AddToken="no">                        
            </cfif>      
        <cfelse>
            <cfset local.status=hash('4','sha')>
        </cfif>
        <cflocation  url="../admin/theatre_list.cfm?status=#local.status#" AddToken="no">
    </cffunction>

    

    <cffunction name="getTheatreEmail" access="remote" returnFormat = "json" >
        <cfargument name="email" type="string" required="false" >
        <cfquery name="theatre_email"   result="t_res">
            SELECT * FROM movie_ticket.theatre
            WHERE email_id=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>  
        <cfreturn t_res> 
    </cffunction>

    <cffunction name="getTheatrePhone" access="remote" returnFormat = "json" >
        <cfargument name="phone" type="string" required="false" >
        <cfquery name="theatre_phone"  result="phone_res">
            SELECT * FROM movie_ticket.theatre
            WHERE phone=<cfqueryparam value="#arguments.phone#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>  
        <cfreturn phone_res> 
    </cffunction>

    <cffunction name="getScreenName" access="remote" returnFormat = "json">
        <cfargument name="screen_name" type="string"  >
        <cfquery name="screen" result="screen_data" returntype="array">
            SELECT * FROM movie_ticket.screen
            WHERE screen_name=<cfqueryparam value="#arguments.screen_name#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>  
        <cfreturn screen_data> 
    </cffunction>

    

    

    <cffunction name="getScreen" access="remote" returnFormat = "json">
        <cfargument name="screen_id" type="integer"  >
        <cfquery name="screen_details" result="screen_res" returntype="array">
            SELECT * FROM movie_ticket.screen
            WHERE id=<cfqueryparam value="#arguments.screen_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>  
        <cfreturn screen_details> 
    </cffunction>

    <cffunction name="getScreenTime" access="remote" returnFormat = "json">
        <cfargument name="time_id" type="integer"  >
        <cfquery name="time_details" result="time_res" returntype="array">
            SELECT st.screen_id,st.start_time,st.show_name,st.id,st.theatre_id,s.screen_name FROM movie_ticket.screen_show_time st 
            INNER JOIN movie_ticket.screen s ON st.screen_id=s.id
            WHERE st.id=<cfqueryparam value="#arguments.time_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>  
        <cfreturn time_details> 
    </cffunction>

    <cffunction name="createScreen" access="remote" output="true">       
        <cfargument  name="screen_name" type="string">
        <cfargument  name="gold_rate" type="float">
        <cfargument  name="silver_rate" type="float">
        <cfargument  name="theatre_id" type="integer">
        <cfargument  name="id" type="integer">
        <!---<cfquery name="theatre_data" result="name_res">
            SELECT theatre_name FROM movie_ticket.theatre WHERE id=<cfqueryparam value="#arguments.theatre_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>--->
        <cfquery name="screen_data" result="data_res">
            SELECT screen_name FROM movie_ticket.screen WHERE screen_name=<cfqueryparam value="#arguments.screen_name#" cfsqltype="CF_SQL_VARCHAR">
            
        </cfquery>
        <cfif data_res.RecordCount NEQ 0>
            <cfset local.status=hash('5','sha')>
        </cfif>        
            <!---<cfset local.theatre_name=theatre_data.theatre_name>
            <cfset local.key= GenerateSecretKey("AES")  >
            <cfset local.enc_theatre=encrypt(local.theatre_name,local.key,'AES/GCM/NoPadding','Hex')>
            <cfset local.theatre_id=encrypt(arguments.theatre_id,key,'AES/GCM/NoPadding','Hex')>--->
        <cfset local.theatre_id=toBase64(arguments.theatre_id)>
        <cfif arguments.screen_name!="" && arguments.gold_rate!="" && arguments.silver_rate!="">
            <cfif data_res.RecordCount EQ 0>
                <cfquery name="add_screen" result="screen_res">
                    INSERT INTO movie_ticket.screen(                        
                        screen_name,
                        gold_rate,
                        silver_rate,
                        theatre_id
                        ) 
                    VALUES(                            
                            <cfqueryparam value="#arguments.screen_name#" cfsqltype="CF_SQL_VARCHAR">,
                            <cfqueryparam value="#arguments.gold_rate#" cfsqltype="CF_SQL_DOUBLE">,
                            <cfqueryparam value="#arguments.silver_rate#" cfsqltype="CF_SQL_DOUBLE">,
                            <cfqueryparam value="#arguments.theatre_id#" cfsqltype="CF_SQL_INTEGER">                                                                                       
                            )
                </cfquery>
                <cfif screen_res.RecordCount NEQ 0>
                    <cfset  local.status=hash('1','sha')>
                </cfif>        
            </cfif>            
        <cfelse>
            <cfset local.status=hash('4','sha')>            
        </cfif>
        <cflocation  url="../admin/screen_time.cfm?theatre_id=#local.theatre_id#&status=#local.status#" addtoken="no">  
    </cffunction>

    <cffunction name="createScreenTime" access="remote" output="true">       
        <cfargument  name="show_name" type="string">
        <cfargument  name="screen_name" type="integer">
        <cfargument  name="start_time" type="string">
        <cfargument  name="theatre_id" type="integer">                
        <cfset local.theatre_id=toBase64(arguments.theatre_id)>
        <cfquery name="time_data" result="data_res">
            SELECT start_time FROM movie_ticket.screen_show_time 
            WHERE show_name=<cfqueryparam value="#arguments.show_name#" cfsqltype="CF_SQL_VARCHAR">
            AND screen_id=<cfqueryparam value="#arguments.screen_name#" cfsqltype="CF_SQL_VARCHAR">
            AND theatre_id=<cfqueryparam value="#arguments.theatre_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfif data_res.RecordCount NEQ 0>
            <cfset local.status=hash('9','sha')>
        </cfif>        
        <cfif arguments.show_name!="" && arguments.screen_name!="" && arguments.start_time!="">
            <cfif data_res.RecordCount EQ 0>
                <cfquery name="add_time" result="time_res">
                    INSERT INTO movie_ticket.screen_show_time(                        
                        show_name,
                        screen_id,
                        theatre_id,
                        start_time
                        ) 
                    VALUES(                            
                            <cfqueryparam value="#arguments.show_name#" cfsqltype="CF_SQL_VARCHAR">,                            
                            <cfqueryparam value="#arguments.screen_name#" cfsqltype="CF_SQL_INTEGER">,
                            <cfqueryparam value="#arguments.theatre_id#" cfsqltype="CF_SQL_INTEGER">,
                            <cfqueryparam value="#arguments.start_time#" cfsqltype="CF_SQL_VARCHAR">                                                                                       
                            )
                </cfquery>
                <cfif time_res.RecordCount NEQ 0>
                    <cfset  local.status=hash('1','sha')>
                </cfif>        
            </cfif>            
        <cfelse>
            <cfset local.status=hash('4','sha')>            
        </cfif>
        <cflocation  url="../admin/screen_time.cfm?theatre_id=#local.theatre_id#&status=#local.status#" addtoken="no">  
    </cffunction>
    
    <cffunction name="editScreen" access="remote">
        <cfargument  name="screen_name" type="string">
        <cfargument  name="gold_rate" type="float">
        <cfargument  name="silver_rate" type="float">
        <cfargument  name="theatre_id" type="integer">
        <cfargument  name="id" type="integer">
        <cfquery name="screen_data" result="data_res">
            SELECT screen_name FROM movie_ticket.screen WHERE screen_name=<cfqueryparam value="#arguments.screen_name#" cfsqltype="CF_SQL_VARCHAR">
            AND 
            id!=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfif data_res.RecordCount NEQ 0>
            <cfset local.status=hash('5','sha')>            
        </cfif>
        <cfset local.theatre_id=toBase64(arguments.theatre_id)>
        <cfif arguments.screen_name!="" && arguments.gold_rate!="" && arguments.silver_rate!="">
            <cfif data_res.RecordCount EQ 0>
                <cfquery name="edit_screen" result="edit_res">
                    UPDATE movie_ticket.screen SET    
                     screen_name=<cfqueryparam value="#arguments.screen_name#" cfsqltype="CF_SQL_VARCHAR">,
                     gold_rate=<cfqueryparam value="#arguments.gold_rate#" cfsqltype="CF_SQL_DOUBLE">,
                     silver_rate=<cfqueryparam value="#arguments.silver_rate#" cfsqltype="CF_SQL_DOUBLE">
                     WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER"> 
                </cfquery>
                <cfif edit_res.RecordCount NEQ 0>
                    <cfset  local.status=hash('2','sha')>
                </cfif>        
            </cfif>            
        <cfelse>
            <cfset local.status=hash('4','sha')>            
        </cfif>
        <cflocation  url="../admin/screen_time.cfm?theatre_id=#local.theatre_id#&status=#local.status#" addtoken="no">

    </cffunction>

    <cffunction name="editScreenTime" access="remote">
        <cfargument  name="show_name" type="string">
        <cfargument  name="screen_name" type="integer">
        <cfargument  name="start_time" type="string">
        <cfargument  name="theatre_id" type="integer">        
        <cfargument  name="id" type="integer">
        <cfset local.theatre_id=toBase64(arguments.theatre_id)>
        <cfif arguments.screen_name!="" && arguments.start_time!="" && arguments.show_name!="">
            <!---<cfif data_res.RecordCount EQ 0>--->
                <cfquery name="edit_screen_time" result="edit_res">
                    UPDATE movie_ticket.screen_show_time SET 
                     show_name=<cfqueryparam value="#arguments.show_name#" cfsqltype="CF_SQL_VARCHAR">,   
                     screen_id=<cfqueryparam value="#arguments.screen_name#" cfsqltype="CF_SQL_INTEGER">,
                     start_time=<cfqueryparam value="#arguments.start_time#" cfsqltype="CF_SQL_VARCHAR">                   
                     WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER"> 
                </cfquery>
                <cfif edit_res.RecordCount NEQ 0>
                    <cfset  local.status=hash('2','sha')>
                </cfif>        
            <!---</cfif> --->           
        <cfelse>
            <cfset local.status=hash('4','sha')>            
        </cfif>
        <cflocation  url="../admin/screen_time.cfm?theatre_id=#local.theatre_id#&status=#local.status#" addtoken="no">

    </cffunction>

    <cffunction name="getTheatreName" access="public">
        <cfargument  name="theId" type="integer">       
        <cfquery name="theatre_data" result="theatre_res">
            SELECT theatre_name FROM movie_ticket.theatre WHERE id=<cfqueryparam value="#arguments.theId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfreturn theatre_data>
    </cffunction> 

    <!----- Movie Functions -----> 
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
        <cfif len(trim(arguments.poster) ) >      
            <cffile action="upload" fileField="form.poster"  destination="#thisDir#" result="fileUpload" nameconflict="overwrite">
            <cfif fileupload.filesize lt 1000000>            
                <cfset local.poster=fileupload.serverfile >
            <cfelse>
                <cfset local.status=hash('6','sha')>  
            </cfif>
        <cfelseif poster_res.RecordCount EQ 1>
            <cfoutput query="fetchPoster">
                <cfset local.poster=poster >
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
                <cfset local.wallpaper=wallpaper >
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
        <cfargument name="id" type="integer" required="false" >
        <cfquery name="movie" result="movie_data" returntype="array" >
            SELECT * FROM movie_ticket.movie
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>  
        <cfreturn movie> 
    </cffunction>

    <!--------------------------Get Movie Name ---------------->
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

    <!----- Movie Functions ----->


</cfcomponent>

