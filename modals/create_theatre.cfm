<!--Create Modal -->                        
<div class="modal myModal" >
    <div class="modal-dialog modal-lg">
        <form method='post' action="" name="img_form" id="formId" enctype='multipart/form-data' >
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h2 class="modal-title" id="theatre_title"> </h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">                                      
                    <div class='row'> 
                        <div class="col-lg-9">                                                 
                            <div class="form-group row">                        
                                <div class="col-lg-4">
                                    <label class="form-label required control-label pt-3" >Theatre Name:</label>
                                </div>
                                <div class="col-lg-4">
                                    <label class="form-label required control-label pt-3" >Email:</label>
                                </div>
                                <div class="col-lg-4">
                                    <label class="form-label required control-label pt-3" >Phone:</label>
                                </div>                             
                                <div class="col-lg-4 ">
                                    <input type="text" name="theatre_name" class="form-control" id="theatre_name" placeholder="Theatre Name" value="" required>
                                </div>
                                <div class="col-lg-4 ">
                                    <input type="email" name="email" class="form-control" id="email" placeholder=" Email" value="" required onchange="checkTheatreEmail();">
                                    <span class="email_alert text-danger pt-3"></span>
                                </div>
                                <div class="col-lg-4 ">
                                    <input type="text" name="phone" class="form-control" placeholder="Phone" id="phone" required onchange="checkTheatrePhone();">
                                    <span class="phone_alert text-danger pt-3"></span>
                                </div>                         
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-12">
                                    <label class="form-label required control-label pt-3">Upload Photo:</label>
                                </div>
                                <div class="col-lg-12">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input thea_img" id="th_img" required accept=".png,.jpg,.jpeg" name="theatre_img" onchange="loadFile(event)">
                                        <label class="custom-file-label" for="th_img">Choose file...</label>
                                        <span class="text-danger th_file_alert"></span>
                                    </div>                                                                                       
                                </div>                                                    
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-4">
                                    <label class="form-label required control-label pt-3" >Address:</label>
                                </div>
                                <div class="col-lg-4">
                                    <label class="form-label required control-label pt-3" >Street Name:</label>
                                </div>
                                
                                <div class="col-lg-4">
                                    <label class="form-label required control-label pt-3" >Pincode:</label>
                                </div>
                                <div class="col-lg-4 ">                                                                                                                    
                                    <input type="text" name="address" class="form-control" placeholder="Address" id="address" required >                                                                                                             
                                </div>
                                <div class="col-lg-4 ">                                                                                                                    
                                    <input type="text" name="street_name" class="form-control" placeholder="Street Name" id="street" required >                                                                                                             
                                </div> 
                                <div class="col-lg-4">                                                                                                                    
                                    <input type="text" name="pincode"  class="form-control"  placeholder=" Pincode" id="pincode"  required>                                                                                                             
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="img-show">
                                <img id="th_out" class="img-fluid"  />
                            </div>
                        </div>
                    </div>
                </div>                 
                <!-- Modal footer -->
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary" name="submit" value="Save" id="sub_btn" onclick="validateCreate();">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>            
            </div>
        </form>
    </div>
</div> 