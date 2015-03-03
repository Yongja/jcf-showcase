package com.jcf.sample.example.service;

import com.jcf.sample.example.model.AttachFiles;

public interface AttachFileService {

	AttachFiles selectAttachFile(String fileName, String callName);

	int insertAttachFile(AttachFiles file);

	int updateAttachFile(AttachFiles file);

}
