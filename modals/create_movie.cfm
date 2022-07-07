<!--Create Modal -->                        
<div class="modal movieModal" >
    <div class="modal-dialog modal-lg">
        <form method='post' action="" name="movie_form" id="movieId" enctype='multipart/form-data' >
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h2 class="modal-title" id="movie_title"> </h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <!---<h3 class="text-left ">Add Theatre</h3>---->
                    <div class='row'> 
                        <div class="col-lg-9">                                                 
                            <div class="form-group row">                        
                                <div class="col-lg-4">
                                    <label class="form-label required control-label pt-3" >Movie Name:</label>
                                </div>
                                <div class="col-lg-4">
                                    <label class="form-label required control-label pt-3" >Release Date:</label>
                                </div>
                                <div class="col-lg-4">
                                    <label class="form-label required control-label pt-3" >Movie Format:</label>
                                </div>                             
                                <div class="col-lg-4 ">
                                    <input type="text" name="movie_name" class="form-control" id="movie_name" placeholder="Movie Name" value="" required onchange="checkMovie()">
                                    <span class="movie_alert text-danger pt-3 "></span>
                                </div>
                                <div class="col-lg-4 ">
                                    <input type="date" name="release_date" class="form-control" id="release_date"  value="" required >
                                </div>
                                <div class="col-lg-4 ">
                                    <select name="movie_format" id="movie_format" class="form-control" required>
                                        <option  value="" >Select Movie Format</option>
                                        <option value="3D">3D</option>
                                        <option value="2D">2D</option>
                                        <option value="4DX 3D">4DX 3D</option>
                                        <option value="MX4DX 3D">4DX 3D</option>
                                        <option value="3D SCREEN X">3D SCREEN X</option>
                                        <option value="IMAX 3D">IMAX 3D</option>
                                    </select>
                                </div>                         
                            </div>

                            <div class="form-group row">                        
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3" >Genre:</label>
                                </div>
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3" >Language:</label>
                                </div>
                                <div class="col-lg-6">
                                    <select name="genre" id="genre" class="form-control" required>
                                        <option  value="" >Select Genre</option>
                                        <option value="Action">Action</option>
                                        <option value="Comedy">Comedy</option>
                                        <option value="Drama">Drama</option>
                                        <option value="Adventure">Adventure</option>
                                        <option value="Romantic">Romantic</option>
                                        <option value="Thriller">Thriller</option>
                                        <option value="Animation">Animation</option>
                                        <option value="Family">Family</option>
                                        <option value="Fantasy">Fantasy</option>
                                    </select>
                                </div>
                                <div class="col-lg-6">
                                    <select name="language" id="language" class="form-control" required>
                                        <option  value="" >Select Language</option>
                                        <option value="English">English</option>
                                        <option value="Malayalam">Malayalam</option>
                                        <option value="Tamil">Tamil</option>
                                        <option value="Hindi">Hindi</option>
                                        <option value="Telugu">Telugu</option>
                                        <option value="Kannada">Kannada</option>                                        
                                    </select>
                                </div>                                    
                            </div>
                             <div class="form-group row">                        
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3" >Duartion in(h:m:s)</label>
                                </div>
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3" >Trailer URL: </label>
                                    
                                </div>
                                <div class="col-lg-6">
                                    <input type="time" name="duration" class="form-control" id="duration" step="2"  value="" required>
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" name="trailer_url" class="form-control" id="trailer_url" placeholder="Trailer Url" value="" required onchange="checkTrailerUrl()">
                                    <span class="trailer_alert text-danger pt-3 "></span>
                                </div>                                    
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3">Upload Poster</label>
                                </div>
                                <div class="col-lg-6">
                                    <label class="form-label required control-label pt-3">Upload Wallpaper</label>
                                </div>
                                <div class="col-lg-6">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="posterInput" required accept=".png,.jpg,.jpeg" name="poster" onchange="loadPoster(event)">
                                        <label class="custom-file-label" for="posterInput">Choose file...</label>
                                    </div>
                                   <!---- <input class="form-control" id="poster" type="file" accept=".png,.jpg,.jpeg" name="poster" required onchange="loadPoster(event)">
                                --->
                                </div>
                                <div class="col-lg-6">
                                   <!--- <input class="form-control" id="wallpaper" type="file" accept=".png,.jpg,.jpeg" name="wallpaper" required onchange="loadWallPaper(event)">
                                        --->
                                    <div class="custom-file">
                                            <input type="file" class="custom-file-input wall-input" id="wallInput" required accept=".png,.jpg,.jpeg" name="wallpaper"  onchange="loadWallPaper(event)">
                                            <label class="custom-file-label" for="wallInput" > </label>
                                    </div>
                                </div>                                                     
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-12">
                                    <label class="form-label required control-label pt-3" >Description:</label>
                                </div>
                                <div class="col-lg-12">
                                    <textarea name="description" class="form-control" id="description"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="img-show">
                                <img id="output" class="img-fluid"  />
                            </div>
                            <div class="wall-show">
                                <img id="output2" class="img-fluid"  />
                            </div>
                        </div>
                    </div>
                </div>                 
                <!-- Modal footer -->
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" name="submit" value="Save" id="mov_btn" >
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>            
            </div>
        </form>
    </div>
</div> 