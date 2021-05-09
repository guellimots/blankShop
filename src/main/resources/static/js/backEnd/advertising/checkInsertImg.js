
$("#showSendImg").hide();


function readURL(input){
    if(input.files && input.files[0]){
        var reader = new FileReader();

        reader.onload = function(e){
            $("#showSendImg").attr("src",e.target.result);
        }
        $("#showSendImg").show();
    }
    reader.readAsDataURL(input.files[0]);
}

$("#imgfile").change(function(){
    readURL(this);
});
