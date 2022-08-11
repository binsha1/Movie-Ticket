<cfparam  name="status" default="v">
<cfinclude  template="dash_header.cfm">
<cfset res=application.movie.movieDetails()> 
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
                Movie Updated Successfully !!
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
                    <tbody>
                        <cfoutput >              
                            <cfloop array="#res#" index="i">                               
                                <cfset local.movie_id=toBase64(i.id)> 
                                <tr>
                                    <td><img src="../uploads/#i.poster#" class="img-fluid img-poster"></td>
                                    <td><img src="../uploads/#i.wallpaper#" class="img-fluid img-wall"></td>
                                    <td>#i.movie_name#</td>
                                    <td>#i.release_date#</td>
                                    <td>#i.movie_format#</td>
                                    <td>#i.genre#</td>
                                    <td>#i.language#</td>
                                    <td>#i.duration#</td>
                                    <td>#i.description#</td>
                                    <td><a href="#i.trailer_url#">#i.trailer_url#</a></td>
                                    <td><a href="cast_crew.cfm?movie_id=#local.movie_id#" class="btn btn-outline-primary">Manage Cast & Crew</a></td>
                                    <td><button class="btn btn-outline-primary edit movie" id="edit" data-bs-toggle="modal" data-bs-target=".movieModal" data-id="#i.id#" >Edit</button></td>
                                    <td><a href="../components/movie.cfc?method=deleteMovie&id=#i.id#" class="btn btn-outline-primary">Delete</a></td>
                                </tr>
                            </cfloop>
                        </cfoutput>                    
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<cfinclude  template="../modals/create_movie.cfm">
<cfinclude  template="dash_footer.cfm">

		

