<cfset data=application.obj.theatreDetails()>
<cfinclude  template="../header.cfm">
<body onload="printTable()">
    <cfdocument  format="pdf" filename="contact_data.pdf" overwrite="Yes" >        
        <h3 class="text-center">Contact List</h3> 
        <div id="print_div">       
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
        </div>
    </cfdocument>    
    <cfset path =expandPath('.') & '\' &'contact_data.pdf'>
    <cfprint type="pdf" source="#path#" printer="OneNote (Desktop)"> 
    <h3>Hello World</h3>   
    <div id="tableData">       
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
    </div>
<cfinclude template="../footer.cfm">


