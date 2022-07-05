<cfparam  name="status" default="v">
<cfinclude  template="dash_header.cfm">
<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Manage Movie</h1>
    <cfif status EQ hash('1','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Movie Added Successfully !!
        </div>
    <cfelseif status EQ hash('2','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Movie Name Already Exists !!
        </div>
    <cfelseif status EQ hash('3','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Trailer Url Already Exists !!
        </div>
    <cfelseif status EQ hash('4','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Please fill all required fields !!
        </div>
    <cfelseif status EQ hash('5','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                Movie Deleted Successfully!!
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
            <button type="button" class="btn btn-primary theatre_btn movie" data-bs-toggle="modal" data-id="0" data-bs-target=".movieModal"  >Add New Movie</button>
        </div>
        <div class="card-body">
            <div class="table-responsive" id="tableList">
                <table class="table table-bordered table-striped" id="movie_table" width="100%" cellspacing="0" >
                    <thead>
                        <tr>
                            <th >Poster</th>
                            <th >Wallpaper</th>
                            <th >Name</th>
                            <th >Release Date</th>
                            <th >Format</th>
                            <th >Genre</th>
                            <th >Language</th>
                            <th >Duration</th>
                            <th >Description</th>
                            <th >Trailor</th>
                            <th >Add Cast & Crew</th>
                            <th >Update</th>
                            <th >Delete</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th >Poster</th>
                            <th >Wallpaper</th>
                            <th >Name</th>
                            <th >Release Date</th>
                            <th >Format</th>
                            <th >Genre</th>
                            <th >Language</th>
                            <th >Duration</th>
                            <th >Description</th>
                            <th >Trailor</th>
                            <th >Add Cast & Crew</th>
                            <th >Update</th>
                            <th >Delete</th>
                        </tr>
                    </tfoot>
                    <cfset res=application.obj.movieDetails()>                    
                    <tbody>
                    <cfoutput query='res'>
                                             
                        <!---<cfset local.theatre_id=toBase64(id)> ---->
                        <tr>
                            <td><img src="../uploads/#poster#" class="img-fluid img-poster"></td>
                            <td><img src="../uploads/#wallpaper#" class="img-fluid img-wall"></td>
                            <td>#movie_name#</td>
                            <td>#release_date#</td>
                            <td>#movie_format#</td>
                            <td>#genre#</td>
                            <td>#language#</td>
                            <td>#duration#</td>
                            <td>#description#</td>
                            <td><a href="#trailer_url#">#trailer_url#</a></td>
                            <td><a href="##" class="btn btn-outline-primary">Manage Cast & Crew</a></td>
                            <td><button class="btn btn-outline-primary edit movie" id="edit" data-bs-toggle="modal" data-bs-target=".movieModal" data-id="#id#" >Edit</button></td>
                            <td><a href="../components/controller.cfc?method=deleteMovie&id=#id#" class="btn btn-outline-primary">Delete</a></td>
                        </tr>
                    </cfoutput>                    
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<cfinclude  template="../modals/create_movie.cfm">
<cfinclude  template="dash_footer.cfm">

		

