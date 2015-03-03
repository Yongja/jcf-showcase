package com.jcf.sample.stream.controller;

import jcf.sua.mvc.MciRequest;
import jcf.sua.mvc.MciResponse;
import jcf.sua.support.excel.ExcelStreamWriterFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jcf.sample.stream.service.StreamService;

@Controller
@RequestMapping("sample/stream")
public class StreamController {

	@Autowired
	private StreamService service;

	@RequestMapping("/getLargeData")
	public void getLargeData(MciRequest request, MciResponse response) {
		service.getStreamData(response.getStreamWriter());
	}

	@RequestMapping("/getExcelDown")
	public void getExcelDown(MciRequest request, MciResponse response) {
		service.getStreamData(response.getStreamWriter(new ExcelStreamWriterFactory()));
	}
}
