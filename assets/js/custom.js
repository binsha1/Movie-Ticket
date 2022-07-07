var loadFile = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('th_out');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };

  var loadPoster = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('output');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };
  var loadWallPaper = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('output2');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };

  var loadActor = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('actor_output');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };
$('.title').on('click',function(){    
    var th_id=$(this).data('id');  
    if(th_id>0)    {
        $("#theatre_title").text("EDIT THEATRE");
        $.ajax({   
                    url: "../components/controller.cfc",
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
                        $('#formId').attr('action', '../components/controller.cfc?method=editTheatre&id='+data[0].id);             
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
        $("label[for = th_img]").text('Choose File...');
        $('#th_img').prop('required',true);
        $("#th_out").removeAttr("src");
        $('#formId').attr('action', '../components/controller.cfc?method=createTheatre'); 
    }
});

$('.screen').on('click',function(){    
    var s_id=$(this).data('id');
    
    var thea_id=$(this).data('tid');        
    if(s_id>0)    {
        $("#screen_title").text("EDIT SCREEN");
        $.ajax({   
                    url: "../components/controller.cfc",
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
                        $('#screenForm').attr('action', '../components/controller.cfc?method=editScreen&id='+data[0].id+'&theatre_id='+thea_id);             
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
        $('#screenForm').attr('action', '../components/controller.cfc?method=createScreen'); 
    }
});

function checkScreen()
{
    
    var screen=$('#screen_name').val();
    var sc_t=$('#theatre_id').val();
               
    $.ajax({   
     url: "../components/controller.cfc",
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
    if(t_id>0)    {
        $("#time_title").text("EDIT SCREEN SHOW TIME");        
        $.ajax({   
                    url: "../components/controller.cfc",
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
                        $('#timeForm').attr('action', '../components/controller.cfc?method=editScreenTime&id='+data[0].id);             
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
        $('#timeForm').attr('action', '../components/controller.cfc?method=createScreenTime'); 
    }
});


$('.movie').on('click',function(){
    var movie_id=$(this).data('id');      
    if(movie_id>0)    {
        $("#movie_title").text("EDIT MOVIE");
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
                        $('#movie_name').val(data[0].movie_name);
                        $('#release_date').val(data[0].release_date);
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
        $("label[for = posterInput]").text("Choose File ..."); 
        $("label[for = wallInput]").text("Choose File ..."); 
        $('#posterInput').prop('required',true);
        $('#wallInput').prop('required',true);   
        $("#output").removeAttr("src");
        $('#movieId').attr('action', '../components/movie.cfc?method=createMovie'); 
    }
});
document.querySelector('.custom-file-input').addEventListener('change', function (e) {
    var name = document.getElementById("posterInput").files[0].name;
    var nextSibling = e.target.nextElementSibling
    nextSibling.innerText = name
  });
  document.querySelector('.wall-input').addEventListener('change', function (e) {
    var name = document.getElementById("wallInput").files[0].name;
    var nextSibling = e.target.nextElementSibling
    nextSibling.innerText = name
  });

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
function checkTheatreEmail()
   {
       var email_id=$('#email').val(); 
        $.ajax({   
        url: "../components/controller.cfc",
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
        url: "../components/controller.cfc",
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
   function printTable() {
    
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

    $(document).ready(function() {
        /*$('#example').DataTable( {
            dom: 'Bfrtip',
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print','colvis'
            ]
        } );*/
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
    $('#show_table').DataTable( { 
    });
});
    
      

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
document.querySelector('.thea_img').addEventListener('change', function (e) {
    var name = document.getElementById("th_img").files[0].name;
    var nextSibling = e.target.nextElementSibling
    nextSibling.innerText = name
  });

  
