package com.jcf.sample.message.controller;

import jcf.sua.mvc.MciRequest;
import jcf.sua.mvc.MciResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("sample/messages")
public class MessageController {

	@Autowired(required = false)
	private MessageSourceAccessor messageSourceAccessor;

	@RequestMapping("/getLocalMsg")
	public void getLocalMessage(MciRequest request, MciResponse response) {
		String msg = messageSourceAccessor.getMessage("MSG_0001");

		response.addSuccessMessage("Message : " + msg);
	}

	@RequestMapping("/getMultiLang")
	public void getMultiLang(MciRequest request, MciResponse response) {
		String msg = messageSourceAccessor.getMessage("MSG_0002");

		response.addSuccessMessage("Message : " + msg);
	}
}
