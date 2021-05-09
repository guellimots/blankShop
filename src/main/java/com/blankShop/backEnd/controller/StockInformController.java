package com.blankShop.backEnd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;

import com.blankShop.backEnd.dto.ChatMessage;
import com.blankShop.backEnd.service.ProductService;
import com.blankShop.model.Product;



/**
 * 接收Client送來的WebSocket訊息及推送給前端的訊息
 */
@Controller
public class StockInformController {
    
	@Autowired
	ProductService service;
    
    /**
     * 處理前端送來的聊天訊息，並把訊息推送給前端
     */
    @MessageMapping("/inform")
    @SendTo("/topic/public")
    public List<Product> getStockNotification() {
		return service.stocknotification();
	}

}