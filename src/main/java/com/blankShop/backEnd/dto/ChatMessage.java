package com.blankShop.backEnd.dto;

import lombok.Builder;
import lombok.Getter;


@Builder
public class ChatMessage {
	
	@Getter
	private MessageType type;
	@Getter
	private String content;
	@Getter
	private String sender;
	@Getter
	private String time;
	
	public MessageType getType() {
		return type;
	}
	public void setType(MessageType type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}	
	
//    /** 訊息種類 */
//    private ChatType type;
//    /** 訊息發送者的名稱 */
//    private String sender;
//    /** 訊息內容 */
//    private String content;
//
//    /**
//     * 訊息種類Enum
//     */
//    public enum ChatType {
//        CHAT,
//        JOIN,
//        LEAVE
//    }
//
//	public ChatType getType() {
//		return type;
//	}
//
//	public void setType(ChatType type) {
//		this.type = type;
//	}
//
//	public String getSender() {
//		return sender;
//	}
//
//	public void setSender(String sender) {
//		this.sender = sender;
//	}
//
//	public String getContent() {
//		return content;
//	}
//
//	public void setContent(String content) {
//		this.content = content;
//	}
//    
    // 省略getter setter 
}