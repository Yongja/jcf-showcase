package com.jcf.sample.query;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertEquals;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jcf.sample.query.model.Sample;
import com.jcf.sample.query.service.SampleService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/resources/QueryServiceTest-Context.xml"})
public class QueryServiceTest {

	@Autowired
	private SampleService service;

	@Before
	public void setup() {
		assertNotNull(service);
	}

	@Test
	public void JavaBean_모델을_사용한_단건조회_예제() {
		Sample param = new Sample();

		param.setNotiNo("0001");
		param.setTitle("Sample");

		Sample retValue = service.getSampleByBean(param);

		assertEquals("Sample", retValue.getTitle());
	}

	@Test
	public void Map을_사용한_단건조회_예제() {
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("notiNo", "0008");
		param.put("title", "기타 1");

		Map<String, Object> retValue = service.getSampleByMap(param);

		assertEquals("0791235", retValue.get("userId"));
	}

	@Test
	public void Int를_사용한_조회_예제() {
		Sample param = new Sample();

		param.setUserId("0791235");

		int retValue = service.getSampleByCount(param);

		assertEquals(3, retValue);
	}

	@Test
	public void JavaBean_모델을_사용한_다건조회_예제() {
		Sample param = new Sample();

		param.setUseFlag("Y");

		List<Sample> retValue = service.getSampleListByBean(param);

		assertEquals(7, retValue.size());
	}

	@Test
	public void Map을_사용한_다건조회_예제() {
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("userId", "0791235");
		param.put("useFlag", "Y");

		List<Map<String, Object>> retValue = service.getSampleListByMap(param);

		for (int i = 0; i < retValue.size(); i++) {
			Map<String, Object> map = retValue.get(i);

			System.out.println(map.get("notiNo") + " - " + map.get("content"));
		}

		assertEquals(2, retValue.size());
	}

	@Test
	public void Page를_사용한_다건조회_예제() {
		Sample param = new Sample();

		param.setUseFlag("Y");

		List<Sample> retValue = service.getSampleListByPaging(param, 1, 3);

		assertEquals(3, retValue.size());
	}

	@Test
	public void Insert_Update_Delete_단건실행_예제() {
		List<Sample> originValue = service.getSampleListByBean(null);
		assertEquals(8, originValue.size());

		// 1. insert
		Sample param = new Sample();

		param.setNotiNo("0010");
		param.setTitle("신규 1");
		param.setContent("이글은 신규글");
		param.setUserId("0791235");
		param.setRegDay("20130228");
		param.setRegTime("110801");
		param.setUseFlag("Y");

		int result = service.insertSample(param);
		assertEquals(1, result);

		List<Sample> afterInsertList = service.getSampleListByBean(null);
		assertEquals(9, afterInsertList.size());

		// 2. update
		param.setContent("이글은 신규글 변경");
		param.setUseFlag("N");

		service.updateSample(param);

		Sample afterUpdateSample = service.getSampleByBean(param);

		assertEquals("N", afterUpdateSample.getUseFlag());
		assertEquals("이글은 신규글 변경", afterUpdateSample.getContent());

		// 3. delete
		service.deleteSample(param);

		List<Sample> deleteAfterList = service.getSampleListByBean(null);
		assertEquals(8, deleteAfterList.size());
	}

	@Test
	public void Insert_Update_Delete_다건실행_예제() {
		Sample one = new Sample();

		one.setNotiNo("0001");
		one.setContent("변경글 1");
		one.setUseFlag("N");

		Sample two = new Sample();

		two.setNotiNo("0002");
		two.setContent("변경글 2");
		two.setUseFlag("N");

		Sample[] param = new Sample[2];

		param[0] = one;
		param[1] = two;

		int[] retCount = service.updateSampleBatch(param);
		assertEquals(2, retCount.length);

		// update 이후 변경된 2건 + 기존 1건 확인
		Sample searchModel = new Sample();
		searchModel.setUseFlag("N");

		List<Sample> retValue = service.getSampleListByBean(searchModel);
		assertEquals(3, retValue.size());
	}

	@Test
	@Ignore
	public void SP_Function_호출예제() {
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("param1", "0000");
		param.put("param2", "20130107");

		Map<String, Object> retValue = service.executeFunction(param);
	}

	@Test
	@Ignore
	public void SP_Procedurce_호출예제() {
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("param1", "0000");
		param.put("param2", "20130107");

		Map<String, Object> retValue = service.executeProcedure(param);
	}

	@Test
	@Ignore
	public void SP_CallStatement_호출예제() {
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("param1", "0000");
		param.put("param2", "20130107");

		Map<String, Object> retValue = service.executeCallStatement(param);
	}
}
