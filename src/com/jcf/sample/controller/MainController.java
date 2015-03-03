package com.jcf.sample.controller;

import jcf.sua.mvc.MciRequest;
import jcf.sua.mvc.MciResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/openpage")
	public void openpage(MciRequest request, MciResponse response){
		response.setViewName(request.getParam("viewname"));
	}
}