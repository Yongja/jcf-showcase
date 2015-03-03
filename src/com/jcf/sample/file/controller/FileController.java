package com.jcf.sample.file.controller;

import java.util.Map;

import jcf.sua.mvc.MciRequest;
import jcf.sua.mvc.MciResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("sample/file")
public class FileController {

	@RequestMapping("/sampleFileUploadWithInfo")
	public void sampleFileUploadWithInfo(MciRequest request, MciResponse response) {
		response.addParam("content", request.getParam("content"));
		response.setViewName("/redirect/p2_iframe_1_Succuss");
	}

	@RequestMapping("/sampleFileUpload")
	public void sampleUploadExample(MciRequest request, MciResponse response) {
		response.setViewName("/redirect/p2_iframe_2_Succuss");
	}

	@RequestMapping("/afterUploadAction")
	public void sampleAfterUplaodExample(MciRequest request, MciResponse response) {
		Map paramMap = request.getMap("DS_IN");

		response.addSuccessMessage(paramMap.toString() + "<br/>데이터와 파일이 저장 되었습니다.");
	}
}