$(document).ready(function(){
    $("#sendadvert").click(function(){
        $.ajax({
            url='/blankShop/AdvertMailPage/sendMail',
            datatype: 'json',
            data: maildetail,
            cache: false,
            traditional: true,
            contentType: false,
            processData: false,


            
    });
    })
})