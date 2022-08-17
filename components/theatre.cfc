<cfcomponent>
<!------------------------Theatre functions -------------------->
<!------------------------Create Theatre ----------------------->
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
                            <cfqueryparam value="#arguments.phone#" cfsqltype="CF_SQL_VARCHAR">,
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

    <!----------------------------Edit Theatre ------------------------------->
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
                <cfset local.file_name=fetchImg.photo >
            </cfoutput>                       
        </cfif>
        <cfquery name="theatre_email"   result="email_res">
            SELECT email_id FROM movie_ticket.theatre
            WHERE email_id=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR"> AND 
            id!=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfquery name="theatre_phone"   result="phone_res">
            SELECT phone FROM movie_ticket.theatre
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
            <cfif email_res.RecordCount EQ 0 AND phone_res.RecordCount EQ 0 >
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
    <!-----------------Delete Theatre -------------------------------->
    <cffunction name="deleteTheatre" access="remote" output="true">
        <cfargument  name="id" type="string">        
        <cfset local.status=hash("5","sha")>        
        <cfquery name="delete_theatre"  result="theatre_del">
            DELETE FROM movie_ticket.theatre 
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>        
        <cflocation  url="../admin/theatre_list.cfm?status=#local.status#" addtoken="no">  
    </cffunction>

    <!-----------------Get all theatre Details-------------------------------->
     <cffunction name="theatreDetails" access="public" output="true">
        <cfquery name="theatre_details"  result="res">
            SELECT * FROM movie_ticket.theatre;
        </cfquery>
        <cfreturn theatre_details>
    </cffunction>

    <!-----------------Get Theatre Email-------------------------------->
    <cffunction name="getTheatreEmail" access="remote" returnFormat = "json" >
        <cfargument name="email" type="string" required="false" >
        <cfquery name="theatre_email"   result="t_res">
            SELECT email_id FROM movie_ticket.theatre
            WHERE email_id=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>  
        <cfreturn t_res> 
    </cffunction>
    <!-----------------Get Theatre Phone -------------------------------->
    <cffunction name="getTheatrePhone" access="remote" returnFormat = "json" >
        <cfargument name="phone" type="string" required="false" >
        <cfquery name="theatre_phone"  result="phone_res">
            SELECT phone FROM movie_ticket.theatre
            WHERE phone=<cfqueryparam value="#arguments.phone#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>  
        <cfreturn phone_res> 
    </cffunction>

    <!-----------------Get a Theatre Details -------------------------------->
    <cffunction name="getTheatre" access="remote" returnFormat = "json">
        <cfargument name="id" type="integer" required="false" >
        <cfquery name="theatres" result="theatre_data" returntype="array" >
            SELECT * FROM movie_ticket.theatre
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>  
        <cfreturn theatres> 
    </cffunction>

    <!--------------------------Get Theatre Name ---------------------------->
    <cffunction name="getTheatreName" access="public">
        <cfargument  name="theId" type="integer">       
        <cfquery name="theatre_data" result="theatre_res">
            SELECT theatre_name FROM movie_ticket.theatre WHERE id=<cfqueryparam value="#arguments.theId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfreturn theatre_data>
    </cffunction> 
    <!---------------------------Create Screen ------------------------------>
    <cffunction name="createScreen" access="remote" output="true">       
        <cfargument  name="screen_name" type="string">
        <cfargument  name="gold_rate" type="float">
        <cfargument  name="silver_rate" type="float">
        <cfargument  name="theatre_id" type="integer">
        <cfargument  name="id" type="integer">        
        <cfquery name="screen_data" result="data_res">
            SELECT screen_name FROM movie_ticket.screen 
            WHERE screen_name=<cfqueryparam value="#arguments.screen_name#" cfsqltype="CF_SQL_VARCHAR"> AND 
            theatre_id=<cfqueryparam value="#arguments.theatre_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfif data_res.RecordCount NEQ 0>
            <cfset local.status=hash('5','sha')>
        </cfif>       
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
    <!---------------------------Edit Screen ------------------------------>

    <cffunction name="editScreen" access="remote">
        <cfargument  name="screen_name" type="string">
        <cfargument  name="gold_rate" type="float">
        <cfargument  name="silver_rate" type="float">
        <cfargument  name="theatre_id" type="integer">
        <cfargument  name="id" type="integer">
        <cfquery name="screen_data" result="data_res">
            SELECT screen_name FROM movie_ticket.screen WHERE screen_name=<cfqueryparam value="#arguments.screen_name#" cfsqltype="CF_SQL_VARCHAR">
            AND theatre_id= <cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER"> AND
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

    <!-------------------------Delete a Screen ------------------------->
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

    <!------------------------Get all screen details of a theatre --------------------------->
    <cffunction name="screenDetails" access="remote" output="true" returnFormat = "json">
        <cfargument  name="theatre_id" type="integer">
        <cfquery name="screen_details"  result="res" returntype="array" >
            SELECT * FROM movie_ticket.screen 
            WHERE theatre_id=<cfqueryparam value="#arguments.theatre_id#" cfsqltype="CF_SQL_INTEGER">;
        </cfquery>
        <cfreturn screen_details>
    </cffunction>
    <!--------------------------Get a Screen Detail---------------------->
    <cffunction name="getScreen" access="remote" returnFormat = "json">
        <cfargument name="screen_id" type="integer"  >
        <cfquery name="screen_details" result="screen_res" returntype="array">
            SELECT * FROM movie_ticket.screen
            WHERE id=<cfqueryparam value="#arguments.screen_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>  
        <cfreturn screen_details> 
    </cffunction>

    <!-------------------------Get Screen Name --------------------->
    <cffunction name="getScreenName" access="remote" returnFormat = "json">
        <cfargument name="screen_name" type="string"  >
        <cfargument name="theatre_id" type="integer"  >
        <cfquery name="screen" result="screen_data" returntype="array">
            SELECT screen_name FROM movie_ticket.screen
            WHERE screen_name=<cfqueryparam value="#arguments.screen_name#" cfsqltype="CF_SQL_VARCHAR"> AND
            theatre_id=<cfqueryparam value="#arguments.theatre_id#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>  
        <cfreturn screen_data> 
    </cffunction>

    <!----------------------------Create Screen Time -------------------------------->
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
                    <cfset  local.status=hash('7','sha')>
                </cfif>        
            </cfif>            
        <cfelse>
            <cfset local.status=hash('4','sha')>            
        </cfif>
        <cflocation  url="../admin/screen_time.cfm?theatre_id=#local.theatre_id#&status=#local.status#" addtoken="no">  
    </cffunction>

    <!-------------------------------Edit Screen Time ----------------------------->
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
                    <cfset  local.status=hash('8','sha')>
                </cfif>        
            <!---</cfif> --->           
        <cfelse>
            <cfset local.status=hash('4','sha')>            
        </cfif>
        <cflocation  url="../admin/screen_time.cfm?theatre_id=#local.theatre_id#&status=#local.status#" addtoken="no">
    </cffunction>
    
    <!-----------------------Delete Screen Time -------------------------->
    <cffunction name="deleteScreenTime" access="remote" output="true">
        <cfargument  name="id" type="integer">
        <cfargument  name="theatre_id" type="integer"> 
        <cfset local.enc_theatre=toBase64(arguments.theatre_id)>              
        <cfset local.status=hash("10","sha")>        
        <cfquery name="delete_time"  result="time_del">
            DELETE FROM movie_ticket.screen_show_time 
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>        
        <cflocation  url="../admin/screen_time.cfm?theatre_id=#local.enc_theatre#&status=#local.status#" addtoken="no">  
    </cffunction>

    <!----------------------------Get all screen time details of a theatre---------------->
    <cffunction name="timeDetails" access="remote" output="true" returnFormat = "json">
        <cfargument  name="theatre_id" type="integer">
        <cfquery name="time_details"  result="res" returntype="array">
            SELECT st.id, st.screen_id,s.screen_name, st.theatre_id,st.start_time,st.show_name
            FROM movie_ticket.screen_show_time st
            INNER JOIN movie_ticket.screen s ON s.id = st.screen_id
            WHERE st.theatre_id= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.theatre_id#">
        </cfquery>
        <cfreturn time_details>
    </cffunction>

    <!------------------------------Get a screen time detail of a screen and theatre-------------------->
    <cffunction name="screenTimeDetails" access="remote" output="true" returnFormat = "json">
        <cfargument  name="theatre_id" type="integer">
        <cfargument  name="screen_id" type="integer">
        <cfquery name="time_details"  result="res" returntype="array">
            SELECT st.id, st.screen_id,s.screen_name, st.theatre_id,st.start_time,st.show_name
            FROM movie_ticket.screen_show_time st
            INNER JOIN movie_ticket.screen s ON s.id = st.screen_id
            WHERE st.theatre_id= <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.theatre_id#"> 
            AND st.screen_id=<cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.screen_id#">
        </cfquery>
        <cfreturn time_details>
    </cffunction> 

    <!---------------------Get a screen time----------------->
    <cffunction name="getScreenTime" access="remote" returnFormat = "json">
        <cfargument name="time_id" type="integer"  >
        <cfquery name="time_details" result="time_res" returntype="array">
            SELECT st.screen_id,st.start_time,st.show_name,st.id,st.theatre_id,s.screen_name FROM movie_ticket.screen_show_time st 
            INNER JOIN movie_ticket.screen s ON st.screen_id=s.id
            WHERE st.id=<cfqueryparam value="#arguments.time_id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>  
        <cfreturn time_details> 
    </cffunction>

    <cffunction name="getTheatreScreenTime" access="public">        
        <cfquery name="tt_details" result="tt_res">
            SELECT DISTINCT theatre_name, t.id FROM movie_ticket.theatre t  
            INNER JOIN movie_ticket.screen s ON t.id=s.theatre_id
            INNER JOIN screen_show_time st ON st.theatre_id= t.id;
        </cfquery>  
        <cfreturn tt_details> 
    </cffunction>

</cfcomponent>

