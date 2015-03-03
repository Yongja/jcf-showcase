package com.batch.service;
/*
 * 
 * 5) 쿼츠 라이브러리를 다운로드 받고 라이브러리를 추가해 줍니다.
 * 쿼츠 라이브러리 다운로드 하신다음 압축을 풀어 줍니다.
 * 해당 라이브러리를 프로젝트의 lib 디렉토리에 복사하여 넣어줍니다.
 * - quartz-all-1.8.3.jar
 * - 압축푼 lib 디렉터리의 log4j-1.2.14.jar
 * - 압축푼 lib 디렉터리의 slf4j-api-1.5.10.jar
 * - 압축푼 lib 디렉터리의 slf4j-log4j12-1.5.10.jar
 * 를 추가 해 줍니다.
 * 마지막으로 apache의 commons-logging-1.1.1.jar 를 다운로드 하셔서 위와 같이 프로젝트의 lib에 추가해주시면 라이브러리 추가는 끝이 납니다.
 * 
*/

import org.quartz.*;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class SystemOutTestService extends QuartzJobBean {
     int i = 0;
	
	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException{
		
		try{
			System.out.println("음, 배치가 실행되었구먼!");
		}catch(Exception e){
		  
			e.printStackTrace();
				
		}
		}
	
}
