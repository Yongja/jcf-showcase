package com.jcf.sample.sua.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jcf.data.GridData;
import jcf.data.RowStatus;
import jcf.sua.mvc.MciRequest;
import jcf.sua.mvc.MciRequestContextHolder;
import jcf.sua.mvc.MciResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jcf.sample.sua.model.SuaBean;

@Controller
@RequestMapping("sample/sua")
public class SuaController {

	@RequestMapping("/getParamByMap")
	public void getParamByMap(MciRequest request, MciResponse response) {
		Map<String, Object> params = request.getParam();
		String value = String.valueOf(params.get("key"));

		response.addSuccessMessage("요청받은 데이터는 " + value + " 입니다.");
	}

	@RequestMapping("/getParamByString")
	public void getParamByString(MciRequest request, MciResponse response) {
		String value = request.getParam("param");

		response.addSuccessMessage("요청받은 param 데이터는 " + value + " 입니다.");
	}

	@RequestMapping("/getJavaBean")
	public void getJavaBean(MciRequest request, MciResponse response) {
		SuaBean javaBean = request.get("DS_IN", SuaBean.class);

		response.addSuccessMessage("요청받은 데이터는 " + javaBean.toString() + " 입니다.");
	}

	@RequestMapping("/getFormData")
	public void getFormData(MciRequest request, MciResponse response) {
		SuaBean javaBean = request.getParam(SuaBean.class);

		response.addParam("DS_OUT", "요청받은 데이터는 " + javaBean.toString() + " 입니다.");
		response.setViewName("/redirect/p1_iframe_1_Succuss");
	}

	@RequestMapping("/getMap")
	public void getMap(MciRequest request, MciResponse response) {
		Map<String, ?> map = request.getMap("DS_IN");

		String name = String.valueOf(map.get("name"));
		String age = String.valueOf(map.get("age"));
		String regiDate = String.valueOf(map.get("regiDate"));

		response.addSuccessMessage("요청받은 Map 유형의 데이터는 아이디 : " + name + " 나이 : " + age + " 등록일자 : " + regiDate + " 입니다.");
	}

	@RequestMapping("/getMapForm")
	public void getMapForm(MciRequest request, MciResponse response) {
		Map<String, Object> map = request.getParam();

		String name = String.valueOf(map.get("name"));
		String age = String.valueOf(map.get("age"));

		response.addParam("DS_OUT", "요청받은 Map 유형의 데이터는 아이디 : " + name + " 나이 : " + age + " 입니다.");
		response.setViewName("/redirect/p1_iframe_2_Succuss");
	}

	@RequestMapping("/getJavaBeans")
	public void getJavaBeans(MciRequest request, MciResponse response) {
		GridData<SuaBean> javaBeans = request.getGridData("DS_IN", SuaBean.class);

		int insertRow = 0;
		int updateRow = 0;
		int deleteRow = 0;

		for (int i = 0; i < javaBeans.size(); i++) {
			if (RowStatus.INSERT.equals(javaBeans.getStatusOf(i))) {
				insertRow++;
			} else if (RowStatus.UPDATE.equals(javaBeans.getStatusOf(i))) {
				updateRow++;
			} else if (RowStatus.DELETE.equals(javaBeans.getStatusOf(i))) {
				deleteRow++;
			}
		}

		response.addSuccessMessage("총 건수 : " + javaBeans.size() + " 건, INSERT 건수 : " + insertRow + "건, UPDATE 건수 : "+ updateRow+"건, delete 건수 : " + deleteRow);
	}

	@RequestMapping("/getMapList")
	public void getMapList(MciRequest request, MciResponse response) {
		GridData<HashMap> javaBeans = request.getGridData("DS_IN", HashMap.class);

		int insertRow = 0;
		int updateRow = 0;
		int deleteRow = 0;

		for (int i = 0; i < javaBeans.size(); i++) {
			if (RowStatus.INSERT.equals(javaBeans.getStatusOf(i))) {
				insertRow++;
			} else if (RowStatus.UPDATE.equals(javaBeans.getStatusOf(i))) {
				updateRow++;
			} else if (RowStatus.DELETE.equals(javaBeans.getStatusOf(i))) {
				deleteRow++;
			}
		}

		response.addSuccessMessage("총 건수 : " + javaBeans.size() + "건, INSERT 건수 : " + insertRow + "건, UPDATE 건수 : "+ updateRow + "건, delete 건수 : " + deleteRow);
	}

	@RequestMapping("/getRequestURL")
	public void getRequestURL(MciRequest request, MciResponse response) {
		String requestUrl = request.getRequestURI();

		response.addSuccessMessage("요청받은 URL 주소는 " + requestUrl + " 입니다.");
	}

	@RequestMapping("/getUiChannelInfo")
	public void getUiChannelInfo(MciRequest request, MciResponse response) {
		String channelInfo = MciRequestContextHolder.get().getMciChannelType().toString();

		response.addSuccessMessage("요청받은 UI 채널은 " + channelInfo + " 입니다.");
	}

	@RequestMapping("/sendStringData")
	public void sendStringData(MciRequest request, MciResponse response) {
		response.addParam("param", "테스트 데이터");
	}

	@RequestMapping("/sendJavaBean")
	public void sendJavaBean(MciRequest request, MciResponse response) {
		SuaBean javaBean = new SuaBean("sample", 24, "2012/02/01");

		response.set("DS_OUT", javaBean);
	}

	@RequestMapping("/sendMap")
	public void sendMap(MciRequest request, MciResponse response) {
		Map<String, Object> data = new HashMap<String, Object>();

		data.put("name", "sample");
		data.put("age", 32);
		data.put("regiDate", "2012/02/25");

		response.setMap("DS_OUT", data);
	}

	@RequestMapping("/sendJavaBeanList")
	public void sendJavaBeanList(MciRequest request, MciResponse response) {
		SuaBean javaBean1 = new SuaBean("test1", 16, "2010/02/01");
		SuaBean javaBean2 = new SuaBean("test2", 23, "2012/03/03");
		SuaBean javaBean3 = new SuaBean("test3", 49, "2013/01/31");

		List<SuaBean> list = new ArrayList<SuaBean>();

		list.add(javaBean1);
		list.add(javaBean2);
		list.add(javaBean3);

		response.setList("DS_OUT", list);
	}

	@RequestMapping("/sendMapList")
	public void sendMapList(MciRequest request, MciResponse response) {
		Map<String, String> data1 = new HashMap<String, String>();

		data1.put("name", "sample1");
		data1.put("age", "23");
		data1.put("regiDate", "2012/02/25");

		Map<String, String> data2 = new HashMap<String, String>();

		data2.put("name", "sample2");
		data2.put("age", "45");
		data2.put("regiDate", "2013/05/25");

		Map<String, String> data3 = new HashMap<String, String>();

		data3.put("name", "sample3");
		data3.put("age", "54");
		data3.put("regiDate", "2010/01/25");

		List<Map<String, String>> list = new ArrayList<Map<String, String>>();

		list.add(data1);
		list.add(data2);
		list.add(data3);

		response.setMapList("DS_OUT", list);
	}

	@RequestMapping("/redirectPage")
	public void redirectPage(MciRequest request, MciResponse response) {
		response.setViewName("/redirect/p1_iframe_3_Succuss");
	}
}