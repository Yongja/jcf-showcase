package com.jcf.sample.exception.controller;

import jcf.sua.mvc.MciRequest;
import jcf.sua.mvc.MciResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jcf.sample.exception.service.ExceptionService;

@Controller
@RequestMapping("sample/exception")
public class ExceptionController {

	@Autowired
	private ExceptionService service;

	@RequestMapping("/makeBizException")
	public void makeBizException(MciRequest request, MciResponse response) {
		service.makeBizException("");
	}

	@RequestMapping("/makeBizExceptionWithParam")
	public void makeBizExceptionWithParam(MciRequest request, MciResponse response) {
		service.makeBizExceptionWithParam();
	}

	@RequestMapping("/makeSysException")
	public void makeSysException(MciRequest request, MciResponse response) {
		service.makeSysException();
	}


}
