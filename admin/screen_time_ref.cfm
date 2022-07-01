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
    <div class="row">
        <div class="col-lg-6">                    
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
            
        </div>
        
        <div class="row">
            <div class="col-lg-6">
                <div class="card-body">
                    <button type="button" class="btn btn-primary theatre_btn title mb-3 " data-bs-toggle="modal" data-id="0" data-bs-target=".myModal"  >Add New Screen</button>
                    <div class="table-responsive" id="tableList">
                        <table class="table table-bordered table-striped" id="screen_table" width="100%" cellspacing="0" >
                            <thead>
                                <tr>
                                    <th >Screen Name</th>
                                    <th >Gold Ticket</th>
                                    <th >Silver Ticket</th>                                
                                    <th >Update</th>
                                    <th >Delete</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th >Screen Name</th>
                                    <th >Gold Ticket</th>
                                    <th >Silver Ticket</th>                                
                                    <th >Update</th>
                                    <th >Delete</th>
                                </tr>
                            </tfoot>
                            <cfset res=application.obj.theatreDetails()>                    
                            <tbody>
                            <cfoutput query='res'>
                                <!---<cfset addr=address & ", " & street_name & ", " & pincode &" .">
                                <tr>
                                    <td><img src="../uploads/#photo#" class="img-fluid"></td>
                                    <td>#theatre_name#</td>
                                    <td>#email_id#</td>
                                    <td>#phone#</td>
                                    <td>#addr#</td>
                                    <td><a href="screen_time.cfm" class="btn btn-outline-primary">Manage Screen & Time</a></td>
                                    <td><button class="btn btn-outline-primary edit title" id="edit" data-bs-toggle="modal" data-bs-target=".myModal" data-id="#id#" >Edit</button></td>
                                    <td><a href="../components/controller.cfc?method=deleteTheatre&id=#id#" class="btn btn-outline-primary">Delete</a></td>
                                </tr>--->
                            </cfoutput>                    
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card-body">
                    <button type="button" class="btn btn-primary theatre_btn title mb-3 " data-bs-toggle="modal" data-id="0" data-bs-target=".myModal"  >Add New ShowTime</button>
                    <div class="table-responsive" id="tableList">
                        <table class="table table-bordered table-striped" id="show_table" width="100%" cellspacing="0" >
                            <thead>
                                <tr>
                                    <th >Show  Name</th>
                                    <th >Screen Name</th>
                                    <th >Start Time</th>                                
                                    <th >Update</th>
                                    <th >Delete</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th >Show  Name</th>
                                    <th >Screen Name</th>
                                    <th >Start Time</th>                                
                                    <th >Update</th>
                                    <th >Delete</th>
                                </tr>
                            </tfoot>
                            <cfset res=application.obj.theatreDetails()>                    
                            <tbody>
                            <cfoutput query='res'>
                            <!---
                                <cfset addr=address & ", " & street_name & ", " & pincode &" .">
                                <tr>
                                    <td><img src="../uploads/#photo#" class="img-fluid"></td>
                                    <td>#theatre_name#</td>
                                    <td>#email_id#</td>
                                    <td>#phone#</td>
                                    <td>#addr#</td>
                                    <td><a href="screen_time.cfm" class="btn btn-outline-primary">Manage Screen & Time</a></td>
                                    <td><button class="btn btn-outline-primary edit title" id="edit" data-bs-toggle="modal" data-bs-target=".myModal" data-id="#id#" >Edit</button></td>
                                    <td><a href="../components/controller.cfc?method=deleteTheatre&id=#id#" class="btn btn-outline-primary">Delete</a></td>
                                </tr>---->
                            </cfoutput>                    
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>
<cfinclude  template="../modals/create_theatre.cfm">
<cfinclude  template="dash_footer.cfm">

		

