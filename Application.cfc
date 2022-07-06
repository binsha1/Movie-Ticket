<cfcomponent output="false">
    <cfset this.name="movie_ticket">
    <cfset this.sessionManagement = "true" >
    <cfset this.sessionTimeout = createTimespan(0,0,30,0)>
    <cfset This.applicationtimeout=createTimespan(2,0,0,0)> 
    <cfset this.clientManagement="true">
    <cfset this.setClientCookies=true>
    <cfset this.scriptProtect="all">    
    <cfset this.ormenabled="true">
    <cfset this.loginStorage = "session"> 
    <cfset this.datasource="movie_ticket">    

    <!---OnApplicationStart Method--->
    <cffunction name="OnApplicationStart" returntype="boolean" access="public">
        <cfset application.obj=createObject('component','components.controller')>
        <cfset application.movie=createObject('component','components.movie')>
        <cfreturn true>
    </cffunction>

    <cffunction name="onSessionStart" returnType="void" output="false" access="public">
        <cfset session.started = now()>       
    </cffunction>
    <!---OnRequestStart Method--->

    <cffunction name="OnRequestStart"  access="public">
        <!---<cfargument  name="requestname" type="string">--->
        <cfif NOT structKeyExists(session, 'sessionUser') >   
            <cfif findNoCase("/admin/dashboard.cfm",cgi.SCRIPT_NAME) GT 0>
                <cfoutput>                                        
                    <center><h1>Login Required</h1>
                    <p>Please Login to your account</p><br>
                    <a href="../admin/index.cfm">Click Here</a></center>
                    <cfabort>
                </cfoutput>
            </cfif>
        </cfif> 
    </cffunction>      

    <!---<cffunction name="onSessionEnd" returntype="void" access="public">
        <cfoutput>
            <center>
                <h3>Your Session expired. Please login again</h3>
                <a href="index.cfm">Click Here</a>
            </center>
        </cfoutput>
        <cfargument name="sessionScope" type="any" required="true" hint="Session Scope"/>
        <cfdump var="#sessionScope#">
        <cfdump var="#arguments.sessionScope.dateInitialized# : #now()#"/> 
    </cffunction>


    <cffunction  name="onError" access="public" returntype="void" output="true">
        <cfargument name="Exception" type="any" required="true"/>
        <cfargument name="EventName" type="string" required="false" default=""/>
        <cfoutput>
            #Exception.Message#
        </cfoutput>        
    </cffunction>---->
    
    <cffunction name="onMissingTemplate" access="public" returntype="void">
        <cfargument  name="targetPage" type="string">
        <cfoutput>
            <center><h3>This Page is Not Available</h3></center>
        </cfoutput>
    </cffunction>  

</cfcomponent>