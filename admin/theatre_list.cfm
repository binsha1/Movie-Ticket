<cfparam  name="status" default="v">
<cfinclude  template="dash_header.cfm">
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Manage Theatre</h1>
    <cfif status EQ hash('1','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Theatre Added Successfully !!
        </div>
    <cfelseif status EQ hash('2','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Email Already Exists !!
        </div>
    <cfelseif status EQ hash('3','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Phone Number Already Exists !!
        </div>
    <cfelseif status EQ hash('4','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Please fill all required fields !!
        </div>
    <cfelseif status EQ hash('5','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Theatre Deleted Successfully!!
        </div>
    <cfelseif status EQ hash('6','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Please upload a file of size less than 1 MB!!
        </div>
    <cfelseif status EQ hash('7','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Theatre Updated Successfully !!
        </div>      
    </cfif>                    
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <!---<nav class="navbar navbar-expand-lg navbar-dark bg-dark table_links">  
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">
                    <li class="nav-item" >
                        <a class="nav-link table_nav" onclick="selectElementContents( document.getElementById('dataTable') );">Copy <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link table_nav" href="theatre_csv.cfm">CSV</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link table_nav" href="theatre_excel.cfm">Excel</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link table_nav" href="theatre_pdf.cfm">PDF</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link table_nav" href="theatre_print.cfm">Print</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Column Visibilty</a>
                    </li>
                    </ul>                    
                </div>
            </nav>--->
            <button type="button" class="btn btn-primary theatre_btn title" data-bs-toggle="modal" data-id="0" data-bs-target=".myModal"  >Add New Theatre</button>
        </div>
        <div class="card-body">
            <div class="table-responsive" id="tableList">
                <table class="table table-bordered table-striped" id="example" width="100%" cellspacing="0" >
                    <thead>
                        <tr>
                            <th >Photo</th>
                            <th >Name</th>
                            <th >Email</th>
                            <th >Phone</th>
                            <th >Address</th>
                            <th >View</th>
                            <th >Update</th>
                            <th >Delete</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Photo</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>View</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </tfoot>
                    <cfset res=application.obj.theatreDetails()>                    
                    <tbody>
                    <cfoutput query='res'>
                        <cfset addr=address & ", " & street_name & ", " & pincode &" .">
                        <cfset key= GenerateSecretKey("AES")  >
                        <cfset enc_theatre=encrypt(theatre_name,key,'AES/GCM/NoPadding','Hex')>
                        <cfset theatre_id=encrypt(id,key,'AES/GCM/NoPadding','Hex')>
                        <tr>
                            <td><img src="../uploads/#photo#" class="img-fluid"></td>
                            <td>#theatre_name#</td>
                            <td>#email_id#</td>
                            <td>#phone#</td>
                            <td>#addr#</td>
                            <td><a href="screen_time.cfm?theatre=#enc_theatre#&theatre_id=#theatre_id#&key=#key#" class="btn btn-outline-primary">Manage Screen & Time</a></td>
                            <td><button class="btn btn-outline-primary edit title" id="edit" data-bs-toggle="modal" data-bs-target=".myModal" data-id="#id#" >Edit</button></td>
                            <td><a href="../components/controller.cfc?method=deleteTheatre&id=#id#" class="btn btn-outline-primary">Delete</a></td>
                        </tr>
                    </cfoutput>                    
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<cfinclude  template="../modals/create_theatre.cfm">
<cfinclude  template="dash_footer.cfm">

		

