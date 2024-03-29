<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta charset="UTF-8">
    <title>admin messanger</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>
    <!--    libs for stomp and sockjs-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <!--    end libs for stomp and sockjs-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"
          type="text/css">
    <link href="/blankShop/css/backEnd/adminstyle.css" rel="stylesheet">
</head>
<body>
<div class="container clearfix">
    <div class="people-list" id="people-list">
        <div class="search">
            <input id="userName" value="admin" placeholder="search" type="hidden"/>
            
            
        </div>
        <ul class="list" id="usersList">


        </ul>
    </div>

    <div class="chat">
        <div style="color: black;" class="chat-header clearfix">
            <img alt="avatar" height="70px"
                 src="/blankShop/img/product/icon.jpg"
                 width="100px"/>

            <div class="chat-about">
                <div class="chat-with" id="selectedUserId"></div>
                <div class="chat-num-messages"></div>
            </div>
            
        </div> <!-- end chat-header -->

        <div class="chat-history">
            <ul>

            </ul>

        </div> <!-- end chat-history -->

        <div class="chat-message clearfix">
            <textarea id="message-to-send" name="message-to-send" placeholder="輸入訊息" rows="3"></textarea>

            

            <button id="sendBtn">Send</button>
            <button id="examplechat2">範例對話1</button>
            <button id="examplechat3">範例對話2</button>
        </div> <!-- end chat-message -->

    </div> <!-- end chat -->
  
</div> <!-- end container -->

<script id="message-template" type="text/x-handlebars-template">
    <li class="clearfix">
        <div class="message-data align-right">
            <span class="message-data-time">{{time}}, Today</span> &nbsp; &nbsp;
            <span class="message-data-name">You</span> <i class="fa fa-circle me"></i>
        </div>
        <div class="message other-message float-right">
            {{messageOutput}}
        </div>
    </li>
</script>

<script id="message-response-template" type="text/x-handlebars-template">
    <li>
        <div class="message-data">
            <span class="message-data-name"><i class="fa fa-circle online"></i> {{userName}}</span>
            <span class="message-data-time">{{time}}, Today</span>
        </div>
        <div class="message my-message">
            {{response}}
        </div>
    </li>
</script>


<script src="/blankShop/js/backEnd/memberChat/admincustom.js"></script>
<script src="/blankShop/js/backEnd/memberChat/adminchat.js"></script>
<script>
$(function(){
    
    messagesStorage =parent.getMessagesStorage();
    newMessages = parent.getNewMessages();
    var iterator = messagesStorage.keys();
  
   for(let i = 0;i<messagesStorage.size;i++){
    var userName = iterator.next().value
     enterChatRoom(userName.substring(0,userName.indexOf("_")));
   }
 
    registration()

    $("#examplechat2").click(chatEx1)
	$("#examplechat3").click(chatEx2)
    
});
function chatEx1(){
				$("#message-to-send").val("好的已幫您取消")
			}

				
			function chatEx2(){
				$("#message-to-send").val("不好意思，該訂單已出貨")
			}


</script>
</body>
</html>