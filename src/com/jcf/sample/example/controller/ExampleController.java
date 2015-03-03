package com.jcf.sample.example.controller;

import java.util.List;

import jcf.sua.mvc.MciRequest;
import jcf.sua.mvc.MciResponse;
import jcf.upload.FileInfo;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jcf.sample.example.model.AttachFiles;
import com.jcf.sample.example.model.Example;
import com.jcf.sample.example.service.ExampleService;

@Controller
@RequestMapping("sample/example")
public class ExampleController {

	@Autowired
	private ExampleService service;

	@RequestMapping("/getExampleList")
	public void getExampleList(MciRequest request, MciResponse response) {
		List<Example> list = service.getExampleList();

		response.setList("DS_OUT", list);
	}

	@RequestMapping("/getExample")
	public void getExample(MciRequest request, MciResponse response) {
		String applyId = request.getParam("applyId");

		Example result = service.getExample(applyId);

		response.set("DS_OUT", result);
	}

	@RequestMapping("/saveExample")
	public void saveExample(MciRequest request, MciResponse response) {
		Example example = request.getParam(Example.class);
		AttachFiles file = request.getParam(AttachFiles.class);

		service.saveExample(example, file);

		response.setViewName("redirect:/openpage.do?viewname=p6");
	}

	@RequestMapping("/exampleFileUpload")
	public void exampleFileUpload(MciRequest request, MciResponse response) {
		List<FileInfo> list = request.getAttachments();

		for (FileInfo fileInfo : list) {
			response.set("FILE_INFO", fileInfo);
		}

		response.setViewName("/redirect/p6_iframe_1_Succuss");
	}

	@RequestMapping("/getAttachFileDownload")
	public void downAttachFile(MciRequest request, MciResponse response) {
		String fileName = request.getParam("fileId");

		FileInfo fileInfo = service.getFileInfo(fileName);

		response.setDownloadFile(fileInfo);
	}
}
