const url = 'http://localhost:8080/blankShop';
let stompClient;
let selectedUser;
let newMessages = new Map();
let messagesStorage = new Map();
let currentUser;

function connectToChat(userName) {
    console.log("connecting to chat...")
    let socket = new SockJS(url + '/chat');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log("connected to: " + frame);
        stompClient.subscribe("/topic/messages/" + userName, function (response) {
            let data = JSON.parse(response.body);
            if (selectedUser === data.fromLogin) {

                messagesStorage.set(data.fromLogin+"_"+(messagesStorage.size+1),data.message);
                
                
                newMessages.set(data.fromLogin, messagesStorage);

                render(data.message, data.fromLogin);
            } else {
              
            let usersTemplateHTML = "";
           
            usersTemplateHTML = usersTemplateHTML + 
                '<a href="#" onclick="selectUser(\'' + data.fromLogin + '\')"><li class="clearfix">\n' +
                '<img  src="/blankShop/img/product/icon.jpg"" width="100px" height="70px" alt="avatar" />\n' +
                '<div class="about">\n' +
                '<div id="userNameAppender_' + data.fromLogin + '" class="name">' + data.fromLogin + '</div>\n' +
                '<div class="status">\n' +
                '<i class="fa fa-circle offline"></i>\n' +
                '</div>\n' +
                '</div>\n' +
                '</li></a>';         
                
                if(!newMessages.has(data.fromLogin))
                $('#usersList').append(usersTemplateHTML);

                
                var cnt= $("#newMessage_"+data.fromLogin).html()
                messagesStorage.set(data.fromLogin+"_"+(messagesStorage.size+1),data.message);
               
                
                newMessages.set(data.fromLogin, messagesStorage);
                if(cnt==undefined){
                $('#userNameAppender_' + data.fromLogin).append('&ensp;&ensp;<span id="newMessage_' + data.fromLogin + 
                '" style=" background: green; border-radius: 99em; width:100px;  height:100px;">&ensp;1&ensp;</span>');
               
            }
                else{
                 var tempcnt = parseInt(cnt.substring(0))
               
                
                 
                 $("#newMessage_"+data.fromLogin).html("&ensp;"+(tempcnt+1)+"&ensp;")
                
                }
                

            }
        });
    });
}







function sendMsg(from, text) {

    messagesStorage.set($('#selectedUserId').html()+"_"+(messagesStorage.size+1),"admin:"+text);


    stompClient.send("/app/chat/" + selectedUser, {}, JSON.stringify({
        fromLogin: from,
        message: text
    }));
    
}

function registration() {
    let userName = document.getElementById("userName").value;
    $.get(url + "/registration/" + userName, function () {
        connectToChat(userName)
    })
   

   
}

function printMessage(userName){


    for(let i =  1;i<=newMessages.get(userName).size;i++){
           
        if(newMessages.get(userName).get(userName+"_"+i)==undefined)
        continue
        if(newMessages.get(userName).get(userName+"_"+i).substring(0,6)=="admin:"){
           console.log("admin")
            var template = Handlebars.compile($("#message-template").html());
            var context = {
                messageOutput: newMessages.get(userName).get(userName+"_"+i).substring(6),
                time: getCurrentTime(),
                toUserName: selectedUser
            };
    
            $chatHistoryList.append(template(context));
            scrollToBottom();
            $textarea.val('');
        
        }
        else
         render(newMessages.get(userName).get(userName+"_"+i), userName);
        
        
        
}

}




function selectUser(userName) {
    console.log("selecting users: " + userName);
    selectedUser = userName;
    let isNew = document.getElementById("newMessage_" + userName) !== null;
     
        let element = document.getElementById("newMessage_" + userName);  
        if (isNew) {
        element.parentNode.removeChild(element);
    }

    if(userName!=$('#selectedUserId').html()){
        $chatHistoryList.html("")
        printMessage(userName)
    } 


    $('#selectedUserId').html('');
    $('#selectedUserId').append(userName);
}

function fetchAll() {
    $.get(url + "/fetchAllUsers", function (response) {
        let users = response;
        response.splice($.inArray($('#userName').val(),response),1)
        
     
        let usersTemplateHTML = "";
        for (let i = 0; i < users.length; i++) {
            usersTemplateHTML = usersTemplateHTML + '<a href="#" onclick="selectUser(\'' + users[i] + '\')"><li class="clearfix">\n' +
                '                <img src="https://rtfm.co.ua/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png" width="55px" height="55px" alt="avatar" />\n' +
                '                <div class="about">\n' +
                '                    <div id="userNameAppender_' + users[i] + '" class="name">' + users[i] + '</div>\n' +
                '                    <div class="status">\n' +
                '                        <i class="fa fa-circle offline"></i>\n' +
                '                    </div>\n' +
                '                </div>\n' +
                '            </li></a>';
        }
        $('#usersList').html(usersTemplateHTML);
    });
}
