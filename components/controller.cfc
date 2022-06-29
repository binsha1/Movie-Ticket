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

    <cffunction name="deleteTheatre" access="remote" output="true">
        <cfargument  name="id" type="string">        
        <cfset local.status=hash("5","sha")>        
        <cfquery name="delete_theatre"  result="theatre_del">
            DELETE FROM movie_ticket.theatre 
            WHERE id=<cfqueryparam value="#arguments.id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>        
        <cflocation  url="../admin/theatre_list.cfm?status=#local.status#" addtoken="no">  
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
        <cfquery name="thaetre_phone"   result="phone_res">
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
</cfcomponent>