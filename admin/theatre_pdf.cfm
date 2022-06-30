<cfset data=application.obj.theatreDetails()>
<cfdocument  format="pdf" filename="theatre_data.pdf" overwrite="Yes"> 
    <cfinclude  template="../header.cfm">
    <h3 class="text-center">Theatre List</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th >Photo</th>
                <th >Name</th>
                <th >Email</th>
                <th >Phone</th>
                <th >Address</th>
            </tr>
        </thead>
        <cfoutput query="data">
            <tbody>                
                <cfset addr=address & ", " & street_name & ", " & pincode &" .">
                <tr>
                    <td><img src="../uploads/#photo#" class="img-fluid" width="100" height="100"></td>
                    <td>#theatre_name#</td>
                    <td>#email_id#</td>
                    <td>#phone#</td>
                    <td>#addr#</td>                    
                </tr>
            </tbody>
        </cfoutput>
    </table>    
</cfdocument>
<cfheader name="Content-Disposition" value="attachment;filename=theatre_data.pdf">
<cfcontent type="application/octet-stream" file="#expandPath('.')#\theatre_data.pdf" deletefile="Yes">

