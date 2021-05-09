package com.blankShop.frontEnd.service.impl;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.blankShop.frontEnd.service.MailService;
@Service
public class MailServiceImpl implements MailService {

	@Autowired
	JavaMailSender javaMailSender;

	/**
	 * 傳送郵件
	 * 
	 * @param from    郵件傳送者
	 * @param to      收件人
	 * @param cc      抄送人
	 * @param subject 郵件主題
	 * @param content 郵件內容
	 */

	@Override
	public void sendSimpleMail(String from, String to, String cc, String subject, String content) {
		SimpleMailMessage simpMsg = new SimpleMailMessage();
		simpMsg.setFrom(from);
		simpMsg.setTo(to);
		simpMsg.setCc(cc);
		simpMsg.setSubject(subject);
		simpMsg.setText(content);
		javaMailSender.send(simpMsg);
	}

	/**
	 * 傳送待附件的郵件
	 * 
	 * @param from    郵件傳送者
	 * @param to      收件人
	 * @param subject 郵件主題
	 * @param content 郵件內容
	 * @param file    附件
	 */
	@Override
	public void sendAttachFileMail(String from, String to, String subject, String content, File file) {
		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			// 這裡使用 MimeMessageHelper 簡化了郵件配置
			// 第二個引數true表示構造一個 multipart message 型別郵件
			// multipart message型別郵件包含多個正文、附件以及內嵌資源，郵件表現形式更加豐富
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setFrom(from);
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(content);
			helper.addAttachment(file.getName(), file);
			javaMailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void sendMailWithImg(String from, String to, String subject, String content, String[] srcPath,
			String[] resIds) {
//		 if (srcPath.length != resIds.length) {
//	            System.out.println("fail--------------");
//	            return;
//	        }

	        try {
	            MimeMessage message = javaMailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message,true);
	            helper.setFrom(from);
	            helper.setTo(to);
	            helper.setSubject(subject);
	            //第二個引數true表示郵件正文是HTML格式（預設為false）
	            helper.setText(content,true);
	            for (int i = 0; i < srcPath.length; i++) {
	                //通過FileSystemResource構造靜態資源，讓後呼叫addInline方法將資源加入到郵件物件中
	                FileSystemResource res = new FileSystemResource(new File(srcPath[i]));
	                helper.addInline(resIds[i], res);
	            }
	            javaMailSender.send(message);
	        } catch (MessagingException e) {
	            e.printStackTrace();
	            
	        }
	    }
		
	}


