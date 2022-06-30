<cfset data=application.obj.theatreDetails()>
<cfset res=queryNew("Theatre_Name,Email,Phone,Address,Street_Name,Pincode")>
<cfoutput query="data">    
    <cfset address_name= address & ", " & street_name & ", " & pincode & ".">
    <cfset queryAddRow(res)>
	<cfset querySetCell(res, "Theatre_Name",theatre_name)>
	<cfset querySetCell(res, "Email", email_id)>
	<cfset querySetCell(res, "Phone", phone)>
	<cfset querySetCell(res, "Address", address_name)>    
</cfoutput>
<cfset filename = expandPath("./theatre_list.csv")>
<cfset s = spreadsheetNew()>
<cfset spreadsheetAddRow(s, "Theatre Name,Email,Phone,Address ")>
<cfset spreadsheetFormatRow(s,
			{
				bold=true,
				fontsize=10
			}, 
			1)>
<cfset SpreadSheetSetColumnWidth(s,1,15)>
<cfset SpreadSheetSetColumnWidth(s,2,25)>
<cfset SpreadSheetSetColumnWidth(s,3,15)>
<cfset SpreadSheetSetColumnWidth(s,4,40)>
<cfset spreadsheetAddRows(s, res)>
<cfheader name="content-disposition" value="attachment; filename=theatre_list.csv">
<cfcontent type="text/plain" variable="#spreadsheetReadBinary(s)#" reset="true">
