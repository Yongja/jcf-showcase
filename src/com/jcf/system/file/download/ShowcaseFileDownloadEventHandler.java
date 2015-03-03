package com.jcf.system.file.download;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.jcf.sample.example.service.AttachFileService;

import jcf.upload.FileInfo;
import jcf.upload.handler.DownloadEventHandler;

public class ShowcaseFileDownloadEventHandler implements DownloadEventHandler {

	private static final Logger logger = LoggerFactory.getLogger(ShowcaseFileDownloadEventHandler.class);

	@Autowired
	private AttachFileService service;

	/**
	 * 클라이언트에 디폴트로 제공될 파일이름 생성.
	 */
	@Override
	public String createFileName(FileInfo fileInfo) {
		return service.selectAttachFile("", fileInfo.getName()).getFileName();
	}

	/**
	 * 파일 다운로드 전처리.
	 */
	@Override
	public void preprocess(FileInfo fileInfo) {
		logger.debug("preprocess");
	}

}
