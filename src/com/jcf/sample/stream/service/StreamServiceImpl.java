package com.jcf.sample.stream.service;

import java.util.HashMap;

import jcf.sua.dataset.DataSetStreamWriter;
import jcf.sua.dataset.DataSetStreamWriterStreamHandlerAdapter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jcf.system.dao.CommonDao;

@Service
public class StreamServiceImpl implements StreamService {

	@Autowired
	private CommonDao commonDao;

	public void getStreamData(DataSetStreamWriter writer) {
		commonDao.queryForStream("stream.getSampleByMap", null,
				new DataSetStreamWriterStreamHandlerAdapter<HashMap<String, String>>(writer, "sample", 1024));
	}

}
