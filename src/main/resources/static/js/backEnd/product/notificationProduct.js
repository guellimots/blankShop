
// $(function () {

            var stompClient = null;
           
            connect();

            function connect() {
            
                    var socket = new SockJS('/blankShop/backEnd');
                    stompClient = Stomp.over(socket);
            
                    stompClient.connect({}, onConnected, onError);
                   
                    // event.preventDefault();
                     
            }
            
            function  onConnected() {
                
                // 訂閱/topic/public
                stompClient.subscribe('/topic/public', onMessageReceived); // 當後端送訊息至/topic/public時，會執行onMessageReceived()。
                sendMessage()
            }
            
            function onError(error) {
                connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
                connectingElement.style.color = 'red';
            }


            function sendMessage() {
  
   
                stompClient.send("/app/inform");
    

            }

            function onMessageReceived(data) {
                
               var JsonData = JSON.parse(data.body);
               var list = "";
                for(let i = 0 ; i<JsonData.length;i++){
                 list +=  "<div class='dropdown-divider'></div>"+
                            "<a  class='dropdown-item'>"+
                            "<i class='fa fa-exclamation-circle'></i>&emsp;"+
                            JsonData[i]["productName"]+"-"+ 
                            JsonData[i]["size"]+"-"+"<span style='background-color:"+
                            JsonData[i]["colorCode"]+";border: 1px solid black;'>&emsp;</span>"+"-"+
                            JsonData[i]["stockNumber"]+        
                            "</a>";
                        }
                        
                $("#warncnt").html(JsonData.length)
                
                $("#warnMsg").html("<i class='fa fa-exclamation-triangle' aria-hidden='true'></i>&emsp;"
                +JsonData.length+"項商品即將沒有存貨!!<br>"+list+"see more information...");

            }

           
            








// })




