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
        const message2 = JSON.parse(payload.body);
        if(username+" 上線" != message2.sender+" 上線"){
            if(message2.productID == ""){
                changecolor()
            }else if(message2.content != ""){
                changecolor()
            }        
        }
        if(message2.content != ""){
            $("#group").css('background-color','')
        }
        
    }
    
    $("#comments").on('click',function() {
        $("#comments").css('color','')
        // $("#group").html('<span class="fa fa-users" id="usergroup">  員工群組</span>')
        // $("#group").css('color','')
    });

    function changecolor(){
        // $("#group").html('<span class="far fa-comment-dots" id="usergroup">  員工群組</span>')
        // $("#group").css('color','#3CB371')
        $("#comments").css('color','#FFD700')
    }


})