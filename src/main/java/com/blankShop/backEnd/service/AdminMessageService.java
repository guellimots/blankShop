package com.blankShop.backEnd.service;

import com.blankShop.backEnd.model.Message;

public interface AdminMessageService {
	public boolean insertMessage(Message msg);
	public Message findMessage();
}
