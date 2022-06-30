var loadFile = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('output');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };

$("#imgInp").change(function(){
    readURL(this);
});
$('.title').on('click',function(){
    var theatre_id=$(this).data('id');      
    if(theatre_id>0)    {
        $("#modal_title").text("EDIT CONTACT");
        $.ajax({   
                    url: "../components/controller.cfc",
                    type: 'get',
                    dataType:"json",
                    data:{
                    method:"getTheatre",
                    id:theatre_id              
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
                        $("#output").attr("src", "../uploads/"+data[0].photo);
                        $('input type=[file]').val(data[0].photo);                        
                        $('#formId').attr('action', '../components/controller.cfc?method=editTheatre&id='+data[0].id);             
                    }         
                });  
    }
    else
    {        
        $("#modal_title").text("ADD THEATRE");
        $('#theatre_name').val("");
        $('#email').val("");        
        $('#address').val("");
        $('#street').val("");       
        $('#pincode').val("");
        $('.email_alert').text(" ");
        $('.phone_alert').text(" ");
        $('[name="phone"]').val("");
        $("#output").removeAttr("src");
        $('#formId').attr('action', '../components/controller.cfc?method=createTheatre'); 
    }
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
                'print', 'colvis'
            ]
            
           
    } );
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

