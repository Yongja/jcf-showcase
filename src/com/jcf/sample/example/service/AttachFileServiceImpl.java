package com.jcf.sample.example.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jcf.sample.example.model.AttachFiles;
import com.jcf.system.dao.CommonDao;

@Service
public class AttachFileServiceImpl implements AttachFileService {

	@Autowired
	private CommonDao commonDao;

	public AttachFiles selectAttachFile(String fileName, String callName) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("fileName", fileName);
		map.put("callName", callName);

		return commonDao.queryForObject("attachFile.selectFileAttach", map, AttachFiles.class);
	}

	public int insertAttachFile(AttachFiles file) {
		return commonDao.update("attachFile.insertFileAttach", file);
	}

	public int updateAttachFile(AttachFiles file) {
		return commonDao.update("attachFile.updateFileAttach", file);
	}
}
