package com.jcf.sample.exception.service;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jcf.system.dao.CommonDao;
import com.jcf.system.exception.BizException;

@Service
public class ExceptionServiceImpl implements ExceptionService {

	@Autowired
	private CommonDao commonDao;

	public void makeBizException(String id) {
		if (StringUtils.isEmpty(id)) {
			throw new BizException("ERR_0001");
		}
	}

	public void makeBizExceptionWithParam() {
		throw new BizException("ERR_0002", new String[]{"PASSWORD"});
	}

	public void makeSysException() {
		commonDao.queryForMap("no_namespace.no_sql", null);
	}
}
