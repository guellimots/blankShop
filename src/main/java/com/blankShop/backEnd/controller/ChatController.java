package com.blankShop.backEnd.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import com.blankShop.backEnd.dto.ChatMessage;

/**
 * 接收Client送來的WebSocket訊息及推送給前端的訊息
 */
@Controller

public class ChatController {
	
	
			
	@MessageMapping("/chat.send")	
	@SendTo("/topic/public")
	public ChatMessage sendMessage(@Payload final ChatMessage chatMessage) {		
		return chatMessage;
	}
	
	@MessageMapping("/chat.newUser")	
	@SendTo("/topic/public")
	public ChatMessage newUser(@Payload final ChatMessage chatMessage,SimpMessageHeaderAccessor headerAccessor) {
		headerAccessor.getSessionAttributes().put("username",chatMessage.getSender());
		return chatMessage;
	}
	
	
	
	
}