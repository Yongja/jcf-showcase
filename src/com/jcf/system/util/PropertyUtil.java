package com.jcf.system.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ResourceBundle;

import org.apache.commons.io.IOUtils;

import com.jcf.system.exception.BizException;

public class PropertyUtil {

	public static String getValue(String key) {
		ResourceBundle myResource = ResourceBundle.getBundle("META-INF.property.app");
		return (String) myResource.getObject(key);
	}

	public static String getFileExt(String orginalFileNm) {
		String fileExt;

		try {
			fileExt = orginalFileNm.substring(orginalFileNm.lastIndexOf("."));
		} catch (Exception e) {
			throw new BizException("파일 명의 확장자 형식이 잘못되었습니다.");
		}

		return fileExt;
	}

	public static byte[] convertInputSteamtoByte(InputStream inputStream) {
		ByteArrayOutputStream out = new ByteArrayOutputStream();

		try {
			IOUtils.copyLarge(inputStream, out);
		} catch (IOException ioe) {
			throw new BizException("IOUtils.copyLarge Error");
		}

		IOUtils.closeQuietly(inputStream);
		IOUtils.closeQuietly(out);

		return out.toByteArray();
	}
}