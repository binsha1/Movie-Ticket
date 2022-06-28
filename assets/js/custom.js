function readURL(input) {
    if (input.files && input.files[0]) {
        
        var reader = new FileReader();
        
        reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
    else{
        alert('sdgsd');
        $('.img-show').hide();
    }
}

$("#imgInp").change(function(){
    readURL(this);
});