var loadFile = function(event) {
    var file_name= document.getElementById('th_img');
    const fileSize = file_name.files[0].size / 1024/1024; // in MiB    
    if (fileSize < 1) {
    var reader = new FileReader();
    reader.onload = function(){
    var output = document.getElementById('th_out');
    output.src = reader.result;
    $('.th_file_alert').text('');
    $('#sub_btn').prop('disabled',false);    
    };
    reader.readAsDataURL(event.target.files[0]);
  }
  else{   
    
    $('.th_file_alert').text('Please Upload a file of size less than 1MB');
    $("label[for = th_img]").text('Choose File...');
    $("#th_out").removeAttr("src");    
    $('#sub_btn').prop('disabled',true);
  }
};

  var loadPoster = function(event) {
    var poster_file= document.getElementById('posterInput');
    const poster_size = poster_file.files[0].size / 1024/1024; // in MiB 
    if(poster_size <1){
        var reader = new FileReader();
        reader.onload = function(){
        var output = document.getElementById('output');
        output.src = reader.result;
        $('.poster_alert').text('');
        $('#mov_btn').prop('disabled',false); 
        };
        reader.readAsDataURL(event.target.files[0]);
    }
    else{
        $('.poster_alert').text('File size should be less than 1 MB');
        $("label[for = posterInput]").text('Choose File...');
        $("#output").removeAttr("src");    
        $('#mov_btn').prop('disabled',true);
    }
  };
  var loadWallPaper = function(event) {
    var wall_file= document.getElementById('wallInput');
    const wall_size = wall_file.files[0].size / 1024/1024; 
    if(wall_size < 1)
    {
        var reader = new FileReader();
        reader.onload = function(){
        var output = document.getElementById('output2');
        output.src = reader.result;
        $('.wall_alert').text('');
        $('#mov_btn').prop('disabled',false);    
        };
        reader.readAsDataURL(event.target.files[0]);
    }
    else{
        $('.wall_alert').text('File size should be less than 1 MB');
        $("label[for = wallInput]").text('Choose File...');
        $("#output2").removeAttr("src");    
        $('#mov_btn').prop('disabled',true);
    }
  };

  var loadActor = function(event) {
    var actor_file= document.getElementById('actor_photo');
    const actor_size = actor_file.files[0].size / 1024/1024;
    if(actor_size <1 )
    {
        var reader = new FileReader();
        reader.onload = function(){
        var output = document.getElementById('actor_output');
        output.src = reader.result;
        $('.actor_alert').text('');
        $('#cast_btn').prop('disabled',false);  
        };        
        reader.readAsDataURL(event.target.files[0]);
        
    }
    else{
        $('.actor_alert').text('File size should be less than 1 MB');
        $("label[for = actor_photo]").text('Choose File...');
        $("#actor_output").removeAttr("src");    
        $('#cast_btn').prop('disabled',true);
    }
    };

  var loadCrew = function(event) {
    var crew_file= document.getElementById('crew_photo');
    const crew_size = crew_file.files[0].size / 1024/1024;
    if(crew_size<1)
    {
        var reader = new FileReader();
        reader.onload = function(){
        var output = document.getElementById('crew_output');
        output.src = reader.result;
        $('.crew_alert').text('');
        $('#crew_btn').prop('disabled',false);  
        };
        reader.readAsDataURL(event.target.files[0]);
    }
    else{
        $('.crew_alert').text('File size should be less than 1 MB');
        $("label[for = crew_photo]").text('Choose File...');
        $("#crew_output").removeAttr("src");    
        $('#crew_btn').prop('disabled',true);
    }   

  };
  
$('.title').on('click',function(){    
    var th_id=$(this).data('id');  
    if(th_id>0)    {
        $("#theatre_title").text("EDIT THEATRE");
        $('.email_alert').text(" ");
        $('.phone_alert').text(" ");
        $('.th_file_alert').text('');
        $.ajax({   
                    url: "../components/theatre.cfc",
                    type: 'get',
                    dataType:"json",
                    data:{
                    method:"getTheatre",
                    id:th_id              
                    },
                    success: function(data)
                    {
                        console.log(data);                       
                        $('#theatre_name').val(data[0].theatre_name);
                        $('#email').val(data[0].email_id);
                        $('[name="phone"]').val(data[0].phone);                         
                        $('#address').val(data[0].address);
                        $('#street').val(data[0].street_name);                        
                        $('[name="pincode"]').val(data[0].pincode);
                        $("label[for = th_img]").text(data[0].photo);                                                           
                        $("#th_out").attr("src", "../uploads/"+data[0].photo);
                        $('#th_img').prop('required',false);
                        $('#formId').attr('action', '../components/theatre.cfc?method=editTheatre&id='+data[0].id);             
                    }         
                });  
    }
    else
    {        
        $("#theatre_title").text("ADD THEATRE");
        $('#theatre_name').val("");
        $('#email').val("");        
        $('#address').val("");
        $('#street').val("");       
        $('#pincode').val("");
        $('.email_alert').text(" ");
        $('.phone_alert').text(" ");
        $('[name="phone"]').val("");
        $('.th_file_alert').text('');
        $("label[for = th_img]").text('Choose File...');
        $('#th_img').prop('required',true);
        $("#th_out").removeAttr("src");
        $('#formId').attr('action', '../components/theatre.cfc?method=createTheatre'); 
    }
});
function checkScreen()
{    
    var screen=$('#screen_name').val();
    var sc_t=$('#theatre_id').val();               
    $.ajax({   
            url: "../components/theatre.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"getScreenName",
            screen_name:screen ,
            theatre_id:sc_t 
            },
            success: function(data)
            {
                console.log(data);            
                if(data.RECORDCOUNT==1)
                {                
                    $('.screen_alert').text("Screen Name Already Exists!!");
                    $('#screen_btn').prop('disabled', true);                
                }
                else{

                    $('.screen_alert').text(" ");
                    $('#screen_btn').prop('disabled', false);
                }                         
            }         
        });
}

$('.s_time').on('click',function(){    
    var t_id=$(this).data('id');
    var theatre_id=$(this).data('tid');        
    if(t_id>0)    
    {
        $("#time_title").text("EDIT SCREEN SHOW TIME");        
        $.ajax({   
                url: "../components/theatre.cfc",
                type: 'get',
                dataType:"json",
                data:{
                method:"getScreenTime",
                time_id:t_id              
                },
                success: function(data)
                {
                    console.log(data);                       
                    $('#show_name').val(data[0].show_name);
                    $('#t_id').val(data[0].theatre_id);
                    $("#screen_name option[value='"+data[0].screen_id+"']").attr("selected", "selected");                                      
                    $('#start_time').val(data[0].start_time);                                         
                    $('#timeForm').attr('action', '../components/theatre.cfc?method=editScreenTime&id='+data[0].id);             
                }         
            });  
        }
    else
    {        
        $("#time_title").text("ADD SCREEN SHOW TIME");
        $('#t_id').val(theatre_id);
        $('#show_name').val("");
        $("#screen_name option[value='']").attr("selected", "selected");        
        $('#start_time').val("");        
        $('#timeForm').attr('action', '../components/theatre.cfc?method=createScreenTime'); 
    }
});
function pad2(n) {
    return (n < 10 ? '0' : '') + n;
  }
$('.movie').on('click',function(){
    var movie_id=$(this).data('id');      
    if(movie_id>0)    {
        $("#movie_title").text("EDIT MOVIE");
        $('.movie_alert').text(" ");
        $('.trailer_alert').text(" "); 
        $('.poster_alert').text('');
        $('.wall_alert').text('');
        $.ajax({   
                    url: "../components/movie.cfc",
                    type: 'get',
                    dataType:"json",
                    data:{
                    method:"getMovie",
                    movId:movie_id           
                    },
                    success: function(data)
                    {
                        console.log(data);  
                        
                        var date = new Date(data[0].release_date),
                        mnth = ("0" + (date.getMonth() + 1)).slice(-2),
                        day = ("0" + date.getDate()).slice(-2);
                        var st_date=[date.getFullYear(), mnth, day].join("-");                       
                        
                        $('#movie_name').val(data[0].movie_name);
                        $('#release_date').val(st_date);
                        $("label[for = posterInput]").text(data[0].poster);                       
                        $("label[for = wallInput]").text(data[0].wallpaper);                        
                        $('#movie_format').val(data[0].movie_format);                         
                        $('#genre').val(data[0].genre);
                        $('#language').val(data[0].language); 
                        $('#duration').val(data[0].duration);  
                        $('#trailer_url').val(data[0].trailer_url); 
                        $('#description').val(data[0].description);                     
                                                           
                        $("#output").attr("src", "../uploads/"+data[0].poster);
                        $("#output2").attr("src", "../uploads/"+data[0].wallpaper);                        
                        $('#posterInput').prop('required',false);
                        $('#wallInput').prop('required',false);
                        //$('input type=[file]').val(data[0].photo);                        
                        $('#movieId').attr('action', '../components/movie.cfc?method=editMovie&id='+data[0].id);             
                    }         
                });  
    }
    else
    {        
        $("#movie_title").text("ADD MOVIE");
        $('#movie_name').val("");
        $('#release_date').val("");        
        $('#movie_format').val("");
        $('#genre').val("");       
        $('#language').val("");
        $('#duration').val("");
        $('#trailer_url').val("");
        $('#description').val("");
        $('.movie_alert').text(" ");
        $('.trailer_alert').text(" "); 
        $('.poster_alert').text('');
        $('.wall_alert').text('');
        $("label[for = posterInput]").text("Choose File ..."); 
        $("label[for = wallInput]").text("Choose File ..."); 
        $('#posterInput').prop('required',true);
        $('#wallInput').prop('required',true);   
        $("#output").removeAttr("src");
        $('#movieId').attr('action', '../components/movie.cfc?method=createMovie'); 
    }
});


$('.screen').on('click',function(){ 
      
    var s_id=$(this).data('id');
    
    var thea_id=$(this).data('tid');        
    if(s_id>0)    {
        
        $("#screen_title").text("EDIT SCREEN");
        $('.silver_alert').text("");     
        $('.gold_alert').text("");   
        $('.screen_alert').text(""); 
        $.ajax({   
                    url: "../components/theatre.cfc",
                    type: 'get',
                    dataType:"json",
                    data:{
                    method:"getScreen",
                    screen_id:s_id              
                    },
                    success: function(data)
                    {
                        console.log(data);                       
                        $('#screen_name').val(data[0].screen_name);
                        $('#theatre_id').val(thea_id);
                        $('#gold_rate').val(data[0].gold_rate);                                                
                        $('#silver_rate').val(data[0].silver_rate);                                         
                        $('#screenForm').attr('action', '../components/theatre.cfc?method=editScreen&id='+data[0].id+'&theatre_id='+thea_id);             
                    }         
                });  
    }
    else
    {        
        $("#screen_title").text("ADD SCREEN");
        $('#theatre_id').val(thea_id);
        $('#screen_name').val("");
        $('#gold_rate').val("");        
        $('#silver_rate').val("");   
        $('.silver_alert').text("");     
        $('.gold_alert').text("");   
        $('.screen_alert').text("");  
        $('#screenForm').attr('action', '../components/theatre.cfc?method=createScreen'); 
    }
});

$('.cast').on('click',function(){
    
    var cast_id=$(this).data('id');
    var movie_id=$(this).data('mid');  
    $('#movie_id').val(movie_id);      
    
});

$('.crew').on('click',function(){
    
    var crew_id=$(this).data('id');
    var movie_id=$(this).data('mid');  
    $('#mov_id').val(movie_id);      
    
});

$('.show').on('click',function(){
    
    var show_id=$(this).data('id');
    if(show_id>0){
        $("#show_title").text("EDIT MOVIE SHOW TIME");
        $.ajax({   
            url: "../components/show.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"getShowDetails",
            showId:show_id              
            },
            success: function(data)
            {
                console.log(data); 
                var date = new Date(data[0].end_date),
                mnth = ("0" + (date.getMonth() + 1)).slice(-2),
                day = ("0" + date.getDate()).slice(-2);
                var end_date=[date.getFullYear(), mnth, day].join("-");

                $("#movie option[value='"+data[0].m_id+"']").attr("selected", "selected");
                $("#theatre option[value='"+data[0].t_id+"']").attr("selected", "selected");                
                editScreenList(data[0].s_id);                
                editTimeList(data[0].st_id,data[0].s_id);                                                              
                $('#end_date').val(end_date);   
                $('#total_seats').val(data[0].total_seats);    
                $('#priority').val(data[0].priority);  
                $('#show_status').val(data[0].show_status);                                  
                $('#showId').attr('action', '../components/show.cfc?method=editShow&id='+data[0].id);
            }         
        }); 

        
    }
    else{
        $("#show_title").text("ADD MOVIE SHOW TIME");
        $('#movie').val("");
        $('#theatre').val("");
        $('#screen').val("");
        $('#screen_time').val("");
        $('#end_date').val("");
        $('#total_seats').val("");
        $('#priority').val("");
        $('#show_status').val("");
        $('#showId').attr('action', '../components/show.cfc?method=createShow');
    }   
    
});

$('.seat_slot').on('click',function(){
    var modal=$("#login_value").val();
    var show_id=$(this).data('id');
    
    if(modal==2)
    {
        $.ajax({   
            url: "components/show.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"getShowDetails",
              showId:show_id           
            },
            success:function(data) {  
                console.log(data);
                var available=data[0].total_seats-data[0].booked_seat;
                $(".seat_label").text("(" +available+ " Left)");
                $("#total_seats").val(data[0].total_seats);
                $("#show_id").val(data[0].id);

            }  
        });       
    }
});

$('.confirm').on('click',function(){
       
    var seat_arr=[];
    var seats="";
    var total_price=$(".checked-result").text();
   
   $('.choosen-place').each( function () {
    Sits =  $(this).text();
    seat_arr.push(Sits);
    seats=seat_arr.toString();
});
var tseats=$("#tseat").val();
   if(seat_arr.length==tseats)
    {
        $("#confirm_alert").text("Thank You for choosing seats "+seat_arr);
        $("#seat_labels").val(seats);
        $("#t_price").text("Total Price : "+total_price);
        $("#tprice").val(total_price);
        $(".time_data").css("display", "block");
        $("#proceed_btn").prop("disabled",false);
    }
    else if(seat_arr.length>tseats)
    {
        $("#confirm_alert").text("Selected Seats should be less than required seats");
        $("#t_price").text("");
        $("#tprice").val("");
        $('.time_data').css("display", "none");
        $("#proceed_btn").prop("disabled",true);
    }
    else if(seat_arr.length<tseats)
    {
        $("#confirm_alert").text("Selected Seats should be less than required seats");
        $("#t_price").text("");
        $("#tprice").val("");
        $('.time_data').css("display", "none");
        $("#proceed_btn").prop("disabled",true);
    }
    
    else if(seat_arr.length==0)
    {
        $("#confirm_alert").text("Please Choose Seats to proceed");
        $("#t_price").text("");
        $("#tprice").val("");
        $('.time_data').css("display", "none");
        $("#proceed_btn").prop("disabled",true);
      // $("#proceed_btn").attr("disabled","disabled");
    }
   // });      
     //alert(chooseSits.split(" "));       
                //var place= $('.choosen-place').text();
                    
    
});
function seatCheck(){
    var t_seats=$("#total_seats").val();
    var seats=$("#seats").val();
    if(parseInt(t_seats)<parseInt(seats))
    {
        $(".seat_alert").text("Should be less than total seats available!!");
        //$("#seat_btn").prop("disabled","true");
        $("#seat_btn").prop("disabled",true);
        
    }
    else{
        $(".seat_alert").text("");
        $("#seat_btn").prop("disabled",false);
    }

}

function editScreenList(screen_id)
{
    var theat_id=$('#theatre').val();
    
    if(theat_id!="")
    {
        
        $.ajax({   
            url: "../components/theatre.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"screenDetails",
              theatre_id:theat_id           
            },
            success:function(data) {  
                $('select[name="screen"]').empty();
                
                //$('select#screen').append($('<option>').text("--Select Screen--"));
                $.each(data, function(key, value) {  
                   
                    $('#screen').append($('<option>').text(value.screen_name).attr('value', value.id));
                });
                $("#screen option[value='"+screen_id+"']").attr("selected", "selected");
            }  
        });       
    }
    else{
        $('#screen').html('<option value="">Select Screen</option>'); 
    }
}

function screenList(){
    var theat_id=$('#theatre').val();
    if(theat_id!="")
    {
        
        $.ajax({   
            url: "../components/theatre.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"screenDetails",
              theatre_id:theat_id           
            },
            success:function(data) {  
                $('select[name="screen"]').empty();
                //$("#screen option[value='"+data[0].s_id+"']").attr("selected", "selected");
                $('select#screen').append($('<option>').text("--Select Screen--"));
                $.each(data, function(key, value) {  
                    $('#screen').append($('<option>').text(value.screen_name).attr('value', value.id));
                });
            }  
        });       
    }
    else{
        $('#screen').html('<option value="">Select Screen</option>'); 
    }
}
function editTimeList(screen_time_id,sc_id){
    //var sc_id=$('#screen').val();
    var th_sc_id=$('#theatre').val(); 
    
    if(sc_id!="")
    {
        
        $.ajax({   
            url: "../components/theatre.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"screenTimeDetails",
              theatre_id:th_sc_id,
              screen_id:sc_id           
            },
            success:function(data) {  
                $('select[name="screen_time"]').empty();
                //$("#screen_time option[value='"+data[0].st_id+"']").attr("selected", "selected");
                //$('select#screen_time').append($('<option>').text("--Select Show Time--"));
                $.each(data, function(key, value) {  
                    $('#screen_time').append($('<option>').text(value.show_name+"("+value.start_time+")").attr('value', value.id));
                });
                $("#screen_time option[value='"+screen_time_id+"']").attr("selected", "selected");
            }  
        });       
    }
    $('#screen_time').html('<option value="">Select Show</option>'); 
}
function timeList(){
    var sc_id=$('#screen').val();
    var th_sc_id=$('#theatre').val();    
    if(sc_id!="")
    {
        
        $.ajax({   
            url: "../components/theatre.cfc",
            type: 'get',
            dataType:"json",
            data:{
            method:"screenTimeDetails",
              theatre_id:th_sc_id,
              screen_id:sc_id           
            },
            success:function(data) {  
                $('select[name="screen_time"]').empty();
                $('select#screen_time').append($('<option>').text("--Select Show Time--"));
                $.each(data, function(key, value) {  
                    $('#screen_time').append($('<option>').text(value.show_name+"("+value.start_time+")").attr('value', value.id));
                });
            }  
        });       
    }
    $('#screen_time').html('<option value="">Select Show</option>'); 
}
function validateCreate(){
    
    var pincode=document.querySelector('input[name=pincode]');
    var phone=document.querySelector('input[name=phone]');
    var pin_pattern=/^[1-9][0-9]{5}$/;
    var ph_pattern=/^\d{10}$/; 
     
    if(!pin_pattern.test(pincode.value))    {
        
        pincode.setCustomValidity("Pincode should be 6 digit number and shouldn't start with 0");
        pincode.value="";
        pincode.focus();        
    }
    else{
        pincode.setCustomValidity('');
    }
    if(!ph_pattern.test(phone.value))
    {
        phone.setCustomValidity('Phone number should be 10 digit number');
        phone.value="";
        phone.focus();
    }
    else{
        phone.setCustomValidity('');
    }   

}
function validateShow(){
    var total_seats=document.getElementById('total_seats');
    if(isNaN(total_seats.value))
    
     {
        $('.error_alert').text('Only Numbers Allowed');
        event.preventDefault();
    }
    else{
        $('.error_alert').text('');
        
    }

}
function checkTheatreEmail()
   {
       var email_id=$('#email').val(); 
        $.ajax({   
        url: "../components/theatre.cfc",
        type: 'get',
        dataType:"json",
        data:{
        method:"getTheatreEmail",
          email:email_id              
        },
        success: function(data)
        {
            console.log(data);            
            if(data.RECORDCOUNT==1)
            {
                $('.email_alert').text('Email Already Exists!!');
                $('#sub_btn').prop('disabled', true);
            }
            else{
                $('.email_alert').text(" ");
                $('#sub_btn').prop('disabled', false);
            }                         
        }         
    });       
   }
   function checkTheatrePhone()
   {
       var ph_num=$('[name="phone').val();      
       $.ajax({   
        url: "../components/theatre.cfc",
        type: 'get',
        dataType:"json",
        data:{
        method:"getTheatrePhone",
          phone:ph_num              
        },
        success: function(data)
        {
            console.log(data);            
            if(data.RECORDCOUNT==1)
            {                
                $('.phone_alert').text('Phone Number Already Exists!!');
                $('#sub_btn').prop('disabled', true);                
            }
            else{

                $('.phone_alert').text(" ");
                $('#sub_btn').prop('disabled', false);
            }                         
        }         
    });
       
   }

   function checkMovie()
   {
       var movie=$('#movie_name').val();            
       $.ajax({   
        url: "../components/movie.cfc",
        type: 'get',
        dataType:"json",
        data:{
        method:"getMovieName",
          movie_name:movie             
        },
        success: function(data)
        {
            console.log(data);            
            if(data.RECORDCOUNT==1)
            {                
                $('.movie_alert').text("Movie Name Already Exists!!");
                $('#mov_btn').prop('disabled', true);                
            }
            else{

                $('.movie_alert').text(" ");
                $('#mov_btn').prop('disabled', false);
            }                         
        }         
    });
       
   }

   function checkTrailerUrl()
   {
       var trailer=$('#trailer_url').val();            
       $.ajax({   
        url: "../components/movie.cfc",
        type: 'get',
        dataType:"json",
        data:{
        method:"getTrailerUrl",
          trailer_name:trailer         
        },
        success: function(data)
        {
            console.log(data);            
            if(data.RECORDCOUNT==1)
            {                
                $('.trailer_alert').text("Trailer Url Already Exists!!");
                $('#mov_btn').prop('disabled', true);                
            }
            else{

                $('.trailer_alert').text(" ");
                $('#mov_btn').prop('disabled', false);
            }                         
        }         
    });
       
   }
   function checkGoldRate()
   {
    var elemId=document.getElementById('gold_rate');
    if(isNaN(elemId.value))
    //const pattern = /^[0-9]$/;
     {
        $('.gold_alert').text('Only Numbers Allowed');
       // $('#screen_btn').prop('disabled', true);
              
    }
    else{
        $('.gold_alert').text('');
        //$('#screen_btn').prop('disabled', false);
    }

   }
   function checkSilverRate()
   {
    var elemId=document.getElementById('silver_rate');
    if(isNaN(elemId.value))
    //const pattern = /^[0-9]$/;
     {
        $('.silver_alert').text('Only Numbers Allowed');
        //$('#screen_btn').prop('disabled', true);
              
    }
    else{
        $('.silver_alert').text('');
        //$('#screen_btn').prop('disabled', false);
    }

   }
   /*function printTable() {
    
    var printContents = document.getElementById('tableData').innerHTML;    
    var originalContents = document.body.innerHTML;   
    document.body.innerHTML = printContents;   
    window.print(); 
    //document.body.innerHTML = originalContents;
}
function selectElementContents(el) {
    var body = document.body, range, sel;
    if (document.createRange && window.getSelection) {
        range = document.createRange();
        sel = window.getSelection();
        sel.removeAllRanges();
        try {
            range.selectNodeContents(el);
            sel.addRange(range);
        } catch (e) {
            range.selectNode(el);
            sel.addRange(range);
        }
        document.execCommand("copy");

    } else if (body.createTextRange) {
        range = body.createTextRange();
        range.moveToElementText(el);
        range.select();
        range.execCommand("Copy");
    }
}
*/
    $(document).ready(function() {
        bsCustomFileInput.init()
        
        $('#example').DataTable( {            
            
            dom: 'Bfrtip',
            buttons: [
                
                'copy',  
                {
                    extend: 'excelHtml5',
                    exportOptions: {
                        columns: [ 1, 2, 3, 4 ]
                    }
                },
                {
                    extend: 'csvHtml5',
                    exportOptions: {
                        columns: [ 1, 2, 3, 4 ]
                    }
                },
                {
                    extend: 'pdfHtml5',
                    exportOptions: {
                        columns: [ 1, 2, 3, 4 ]
                    }
                },
                'print',
                
                 'colvis'
            ]
            
           
    } );
    $('#screen_table').DataTable( {         
    });
    $('#show_time_table').DataTable( { 
    });
    $('#cast_table').DataTable( { 
    });
    $('#crew_table').DataTable( { 
    });
    $('#show_table').DataTable( { 
    });
    $('#user_table').DataTable( { 
    });
    $('#contact_table').DataTable( { 
    });
    $('#book_table').DataTable( { 
    });
    
    
   
    $('#movie_table').DataTable( { 
        dom: 'Bfrtip',
        buttons: [
            
            'copy',  
            {
                extend: 'excelHtml5',
                exportOptions: {
                    columns: [ 2, 3, 4,5,6,7,8,9 ]
                }
            },
            {
                extend: 'csvHtml5',
                exportOptions: {
                    columns: [ 2, 3, 4,5,6,7,8,9 ]
                }
            },
            {
                extend: 'pdfHtml5',
                exportOptions: {
                    columns: [ 2, 3, 4,5,6,7,8,9 ]
                }
            },
            'print',
            
             'colvis'
        ]
    });
});


/*document.querySelector('.thea_img').addEventListener('change', function (e) {
    var name = document.getElementById("th_img").files[0].name;
    var nextSibling = e.target.nextElementSibling
    nextSibling.innerText = name
  });
document.querySelector('.custom-file-input').addEventListener('change', function (e) {
    var post_name = document.getElementById("posterInput").files[0].name;
    var nextSibling = e.target.nextElementSibling
    nextSibling.innerText = post_name
  });
  document.querySelector('.wall-input').addEventListener('change', function (e) {
    var wall_name = document.getElementById("wallInput").files[0].name;
    var nextSibling = e.target.nextElementSibling
    nextSibling.innerText = wall_name
  });*/



 
/*document.querySelector('.custom-file-input').addEventListener('change', function (e) {
    var name = document.getElementById("posterInput").files[0].name;
    var nextSibling = e.target.nextElementSibling
    nextSibling.innerText = name
   });
   document.querySelector('.wall-input').addEventListener('change', function (e) {
    var name = document.getElementById("wallInput").files[0].name;
    var nextSibling = e.target.nextElementSibling
    nextSibling.innerText = name
   });    
*/
    /*$('#dataTable').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'copyHtml5',
                exportOptions: {
                    columns: [ 0, ':visible' ]
                }
            },
            {
                extend: 'excelHtml5',
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'pdfHtml5',
                exportOptions: {
                    columns: [ 0, 1, 2, 5 ]
                }
            },
            {
                extend: 'csvHtml5',
                exportOptions: {
                    columns: ':visible'
                }
            },
            'colvis'
        ]
    } );
} );*/



function payNow()
{
    
  var email=document.getElementById('email_p').value;
   var name=document.getElementById('name_p').value;
  var amount=document.getElementById('amount').value;
  var phone=document.getElementById('phone_num').value;
  var reserve_id=document.getElementById('reserve_id').value;
  var t_price=amount*100;
 var pay_id="";
  
var options = {
    "key": "rzp_test_s9cSqIJIxI5xGT", // Enter the Key ID generated from the Dashboard
    "amount": t_price, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    "currency": "INR",
    "name": "BookMyTicket",
    "description": "Test Transaction",
    "image": "https://example.com/your_logo",
    //"order_id": "order_9A33XWu170gUtm", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
    "handler": function (response){
        alert(response.razorpay_payment_id);
        alert(response.razorpay_order_id);
        alert(response.razorpay_signature);
        pay_id=response.razorpay_payment_id;
        location.href="http://127.0.0.1:8500/movie_ticket/components/controller.cfc?method=confirmPayment&reserve_id="+reserve_id+"&pay_id="+response.razorpay_payment_id;
        //alert("http://127.0.0.1:8500/movie_ticket/components/controller.cfc?method=confirmPayment&reserve_id="+reserve_id+"&pay_id="+response.razorpay_payment_id);
    },
    
    "prefill": {
        "name": name,
        "email": email,
        "contact":phone
    },
    "notes": {
        "address": "Razorpay Corporate Office"
    },
    "theme": {
        "color": "#3399cc"
    },
    "modal": {
        "ondismiss": function () {
          if (confirm("Are you sure, you want to close the form?")) {
            txt = "You pressed OK!";
            console.log("Checkout form closed by the user");
          } else {
            txt = "You pressed Cancel!";
            console.log("Complete the Payment")
          }
        }
      },
      
   //"redirect":true,
    //"callback_url":"http://127.0.0.1:8500/movie_ticket/components/controller.cfc?method=confirmPayment&reserve_id="+reserve_id

};
var rzp1 = new Razorpay(options);
rzp1.on('payment.failed', function (response){
        alert(response.error.code);
        alert(response.error.description);
        alert(response.error.source);
        alert(response.error.step);
        alert(response.error.reason);
        alert(response.error.metadata.order_id);
        alert(response.error.metadata.payment_id);
});
//document.getElementById('rzp-button1').onclick = function(e){
    rzp1.open();
   // e.preventDefault();
//}
}



  