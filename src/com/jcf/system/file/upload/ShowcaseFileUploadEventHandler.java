package com.jcf.system.file.upload;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jcf.upload.FileInfo;
import jcf.upload.MultiPartInfo;
import jcf.upload.handler.UploadEventHandler;
import jcf.upload.persistence.PersistenceManager;

public class ShowcaseFileUploadEventHandler implements UploadEventHandler {

	private static final Logger logger = LoggerFactory.getLogger(ShowcaseFileUploadEventHandler.class);

	/**
	 * 멀티파트 업로드 요청에 대하여 개별 파일에 대한 Persistence 이름을 결정.
	 * 예} ABC로 온 파일을 BCD로 파일시스템에 저장할 경우 BCD가 이에 해당한다.
	 */
	@Override
	public String createFileNameIfAccepted(String folder, FileInfo fileInfo) {
		return UUID.randomUUID().toString();
	}


	/**
	 * 어느 폴더로 업로드할 것인지 지정 (servlet 설정에서 지정한 베이스 디렉토리 다음 폴더가 업로드 폴더가 됨)
	 * 참고: 이 값은 PersistenceManager에서 folder 이름으로 사용된다.
	 */
	@Override
	public String getFolder(HttpServletRequest request) {
		String path = request.getRequestURI();
		return path.substring(0, path.lastIndexOf("/"));
	}

	/**
	 * 최대 업로드 사이즈 지정. (주 : 파일 단위가 아닌 멀티파트 요청 단위임)
	 * 참고: 기본값은 receiver에서 설정 가능하지만, 여기서 0이 아닌 값으로 설정하면 이 값으로 오버라이드 됨.
	 */
	@Override
	public long getMaxUploadSize() {
		return 0;
	}

	/**
	 * 실질적으로 업로드를 처리한 후 처리
	 * 예) 파일정보를 DB에 저장하거나 Persistence에 대한 특정 행위
	 */
	@Override
	public void postprocess(String folder, MultiPartInfo info, PersistenceManager persistenceManager) {
		List<FileInfo> list = info.getFileInfos();

		for (FileInfo fileInfo : list) {
			logger.info("File Name : " + fileInfo.getName());
			logger.info("Modified Name : " + fileInfo.getCallName());
			logger.info("Upload Path : " + fileInfo.getFolder());
		}
	}

	/**
	 * 멀티파트 파일 요청이므로 여러 개의 파일을 한 요청에서 업로드할 수 있으므로 해당 folder에 여러 개의 파일을 중복해서 올리는 등의 예외 사항을 처리해야 함.
	 * 예) 디렉토리 생성 또는 기존 잔존 파일 삭제 등.
	 * 멀티파트 파일 요청이므로 여러 개의 파일을 한 요청에서 업로드할 수 있으므로 해당 folder에 여러 개의 파일을 * 중복해서 올리는 등의 예외 사항을 처리해야 함.
	 */
	@Override
	public void prepareStorage(PersistenceManager persistenceManager, String folder) {
		logger.debug("prepareStorage");
	}
}
