<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
        <title>Websockets Chat App</title>
        <link rel="stylesheet" href="/blankShop/css/backEnd/chat.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
        <script type="text/javascript" src="https://momentjs.com/downloads/moment.min.js"></script>
        <link rel="icon" type="image/png" sizes="32x32" href="/blankShop/img/backEnd/favicon-16x16.png">
        
        <!-- Theme style -->
        <link rel="stylesheet" href="/blankShop/css/backEnd/adminlte.min.css">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="/blankShop/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    </head>
    <body>
    
    <div class="container-fluid h-100">
    
        <!-- 對話框 -->
        <div id="chat-page" class="hide main">
                <div class="card card-info">
                    <!-- <div class="card"> -->
                        <div class="card-header">
                            <h3 class="card-title">聊天室</h3>        
                            <div class="card-tools">
                            </div>
                            <div class="d-flex bd-highlight">
                                <div class="chat-summary">
                                    <span></span>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="chat">
                                <!-- 內容顯示區 -->
                            </div>
                        </div>
                        <form id="message-controls" name="message-controls" class="card-footer">
                            <div class="input-group">
                              <input type="text" name="message" id="message" placeholder="輸入訊息..." class="form-control">
                              <span class="input-group-append">
                                <button type="submit" class="fas fa-paper-plane"></button>
                              </span>
                            </div>
                        </form>              
                </div>
            <!-- </div> -->
        </div>
        <button type="submit" id="example1">員工1</button>
        <button type="submit" id="example2">員工2</button>
        <button type="submit" id="example3">主管</button>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="/blankShop/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <script src="/blankShop/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/blankShop/js/backEnd/adminlte.js"></script>
    <script src="/blankShop/js/backEnd/chatroom/chat.js"></script>
    </body>
    </html>