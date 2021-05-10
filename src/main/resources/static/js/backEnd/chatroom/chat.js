let stompClient2
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
                    stompClient2 = Stomp.over(socket)
                    stompClient2.connect({}, onConnected2, onError)
                   
                }
            }
        })
    }
    
    //判斷是否連線成功
    const onConnected2 = () => {
        stompClient2.subscribe('/topic/public', onMessageReceived2)
        stompClient2.send("/app/chat.newUser",
            {},
            JSON.stringify({sender: username, type: 'CONNECT'})
        )  
    }
    
    //連線失敗，顯示錯誤訊息
    const onError = (error) => {
        const status = document.querySelector("#status")
        status.innerHTML = '連線失敗，請重新登入!'
        status.style.color = 'red'
    }


    // 取得訊息內容並發送至socket
    const sendMessage = (event) => {
        const messageInput = document.querySelector('#message')
        const messageContent = messageInput.value.trim()
        
        if (messageContent && stompClient2) {
            const chatMessage = {
                sender: username,
                content: messageInput.value,
                type: 'CHAT',
                time: moment().calendar()
            }
            
            stompClient2.send("/app/chat.send", {}, JSON.stringify(chatMessage))
            messageInput.value = ''
        }
        event.preventDefault();
    }
    // 取得socket回傳資料，並同時新增eleement以及顯示訊息
    const onMessageReceived2 = (payload) => {
        const message = JSON.parse(payload.body);

        if(message.content != null){
            $("#msginf").html("!")
            $("#usergroup").html("  群組聯繫&emsp;<i id='circleOnline' class='fa fa-circle online'></i>")
        }

        
        const chatCard = document.createElement('div')
        chatCard.className = 'card-body'

        const chatCard2 = document.createElement('div')
        chatCard2.className = 'card-body'

        const chatCard3 = document.createElement('div')
    
        //新增內容區塊(flexBox)
        const flexBox = document.createElement('div')
        flexBox.className = 'd-flex justify-content-end mb-4'
        flexBox.setAttribute('id','flexbox');
        // if(username != message.sender){
        //      flexBox.style.cssText='float:left'
        // }
        chatCard.appendChild(flexBox)

        //新增時間區塊(flexBox2)
        const flexBox2 = document.createElement('span')
        flexBox2.className = 'd-flex justify-content-end mb-time'
        // if(username != message.sender){
        //     flexBox2.style.cssText='float:left'
        // }
        chatCard.appendChild(flexBox2)


        const flexBox3 = document.createElement('span')
        flexBox3.className = 'd-flex justify-content-end mb-3'
        chatCard3.appendChild(flexBox3)

    
        const messageElement = document.createElement('div')
        messageElement.className = 'msg_container_send'
        messageElement.setAttribute('id','msg_container')
        messageElement.style.cssText='margin-top: 15px;'

        const messageElement2 = document.createElement('span')
        messageElement2.className = 'msg_container_send2'
        messageElement2.setAttribute('id','msg_container2')
        
    
        const messageElement3 = document.createElement('span')
        messageElement3.className = 'msg_container_send3'
        messageElement3.setAttribute('id','msg_container3')

        // flexBox3.appendChild(messageElement3)
        flexBox.appendChild(messageElement)
        flexBox2.appendChild(messageElement2)
        

        if (message.type === 'CONNECT') {
            messageElement.classList.add('event-message')
            message.content = message.sender + ' 上線'
        } else if (message.type === '未連線') {
            messageElement.classList.add('event-message')
            message.content = message.sender + ' left!'
        } else {
            messageElement.classList.add('chat-message')
            messageElement2.classList.add('chat-message2')
    
            const avatarContainer = document.createElement('div')
            avatarContainer.className = 'img_cont_msg'

            
            //顯示人頭(待調整左右輸出-判斷方式username比對message.sender，若不同顯示左邊)
            getempphotot()
            function getempphotot(){
                $.ajax({
                    url: "/blankShop/backEnd/employeePhoto/"+message.sender,
                        type: "GET",
                        contentType: 'application/json; charset=utf-8',
                        success: function(data) {
                            if(data!=""){
                                const imgElement = document.createElement('img')
                                const nameElement = document.createElement('span')
                                const nameText = document.createTextNode(message.sender)
                                imgElement.setAttribute("id","personImgs")
                                imgElement.setAttribute("src","data:image/jpeg;base64,"+ data)
                                imgElement.style.cssText = 'width:40px;hight:40px;border-radius:60%;'
                                nameElement.style.cssText ='font-size: 10px; text-align: center;'                              
                                nameElement.appendChild(nameText);
                                avatarContainer.appendChild(nameElement);
                                avatarContainer.appendChild(imgElement);
                            }else{
                                const avatarElement = document.createElement('span')
                                avatarElement.className = 'circle user_img_msg'
                                const avatarText = document.createTextNode(message.sender[0])
                                avatarElement.appendChild(avatarText);
                                avatarElement.style['background-color'] = getAvatarColor(message.sender)
                                avatarContainer.appendChild(avatarElement)
                            }                           
                        }
                })
            }            
            
            messageElement.style['background-color'] = getAvatarColor(message.sender)
            flexBox.appendChild(avatarContainer)
            const time = document.createElement('span')
            time.className = 'msg_time_send'
            time.innerHTML = message.time
            messageElement2.appendChild(time)

        }
        
        messageElement.innerHTML = message.content
        messageElement2.innerHTML = message.time
        messageElement3.innerHTML = message.sender.add = message.sender
        
        
        chat.appendChild(flexBox)
        chat.appendChild(flexBox2)
        chat.scrollTop = chat.scrollHeight      

    }

    $("#group").on('click',function() {
        $("#msginf").html("")
        $("#circleOnline").remove();
    });

    
    const hashCode = (str) => {
        let hash = 0
        for (let i = 0; i < str.length; i++) {
           hash = str.charCodeAt(i) + ((hash << 5) - hash)
        }
        return hash
    }
    
    //隨機配顏色
    const getAvatarColor = (messageSender) => {
        const colours = ['#2196F3', '#32c787', '#b5c61b', '#A1B4C4']
        const index = Math.abs(hashCode(messageSender) % colours.length)
        return colours[index]
    }
    
    const messageControls = document.querySelector('#message-controls')
    messageControls.addEventListener('submit', sendMessage, true)
})




