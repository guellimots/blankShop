let stompClient3
let username;

$(document).ready(function(){

    getuser()
    function getuser(){
        $.ajax({
            url:"/blankShop/backEnd/getEmpname",
            type:"GET",
            dataType:"text",
            success: function(data){
                username=data;
                if (username) {                   
                    const socket = new SockJS('/blankShop/chat')
                    stompClient3 = Stomp.over(socket)
                    stompClient3.connect({}, onConnected3)
                }
            }
        })
    }


    //判斷是否連線成功
    const onConnected3 = () => {
        stompClient3.subscribe('/topic/public', onMessageReceived3)  
    }

    const onMessageReceived3 = (payload) => {
        const message = JSON.parse(payload.body);
 
        if(username+" 上線" == message.sender+" 上線"){
            $("#msginf").html("")
            $("#circleOnline").remove();
        }else if(message.content != null){
            $("#msginf").html("!")
            $("#usergroup").html("  群組聯繫&emsp;<i id='circleOnline' class='fa fa-circle online'></i>")
        }else if(username+" 上線" != message.sender+" 上線"){
            $("#msginf").html("!")
            $("#usergroup").html("  群組聯繫&emsp;<i id='circlewarning' class='fa fa-user'></i>")
        }else{
            $("#msginf").html("")
            $("#circleOnline").remove();
        }
        
    }

})