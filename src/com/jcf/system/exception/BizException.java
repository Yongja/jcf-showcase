package com.jcf.system.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

import jcf.sua.exception.SuaBusinessException;

@ResponseStatus(value = HttpStatus.OK)
public class BizException extends SuaBusinessException {

	private static final long serialVersionUID = 1L;

	public BizException(String code) {
		super(code);
	}

	public BizException(String code, Object[] arguments) {
		super(code, arguments);
	}

	public BizException(String code, String defaultMessage) {
		super(code, defaultMessage, null);
	}

	public BizException(String code, String defaultMessage, Object[] arguments) {
		super(code, defaultMessage, arguments);
	}
}
