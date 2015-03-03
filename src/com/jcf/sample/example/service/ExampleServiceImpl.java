package com.jcf.sample.example.service;

import java.util.HashMap;
import java.util.List;

import jcf.upload.FileInfo;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jcf.sample.example.model.AttachFiles;
import com.jcf.sample.example.model.Example;
import com.jcf.system.dao.CommonDao;

@Service
public class ExampleServiceImpl implements ExampleService {

	@Autowired
	private CommonDao commonDao;

	@Autowired
	private AttachFileService fileService;

	public List<Example> getExampleList() {
		return commonDao.queryForList("example.selectExampleList", null, Example.class);
	}

	public Example getExample(String applyId) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("applyId", applyId);

		return commonDao.queryForObject("example.selectExample", map, Example.class);
	}

	public int saveExample(Example example, AttachFiles file) {
		if (StringUtils.isEmpty(example.getFileSysId())) {
			if (StringUtils.isNotEmpty(file.getFileName())) {
				fileService.insertAttachFile(file);
				example.setFileSysId(file.getFileName());
			}
		}

		int resValue = (StringUtils.isEmpty(example.getApplyId())) ? insertExample(example) : updateExample(example);

		return resValue;
	}

	public int insertExample(Example example) {
		example.setApplyId(this.getMaxApplyId());

		return commonDao.update("example.insertApplySample", example);
	}

	public int updateExample(Example example) {
		return commonDao.update("example.updateApplySample", example);
	}

	public String getMaxApplyId() {
		String id = commonDao.queryForString("example.getCurrMaxApplyId", null);

		return StringUtils.leftPad(String.valueOf(Integer.parseInt(id) + 1), 4, '0');
	}

	public FileInfo getFileInfo(String fileName) {
		AttachFiles file = fileService.selectAttachFile(fileName, "");

		return new FileInfo(file.getFold(), file.getCallName());
	}

}
