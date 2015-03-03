<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>JCF Showcase</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="jcf showcase">
		<meta name="author" content="jcf">

		<!-- Le styles -->
		<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
		<link href="assets/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
		<link href="assets/bootstrap/css/docs.css" rel="stylesheet">
		<link href="assets/bootstrap/css/prettify.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/jquery-ui-1.9.2.custom.css" />

		<!-- 공통 lib-->
		<script src="lib/jquery-1.9.0.js"></script>
		<script src="lib/jquery-ui-1.9.2.custom.js"></script>
		<script src="assets/bootstrap/js/bootstrap.js"></script>
		<script src="assets/bootstrap/js/prettify.js"></script>
		<script src="assets/bootstrap/js/application.js"></script>
		<script src="js/p1.js"></script>
	</head>

	<body data-spy="scroll" data-target=".bs-docs-sidebar">
		<!-- Navbar -->
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="brand" href="/jcf-showcase/index.html">JCF-Showcase</a>
					<div class="nav-collapse collapse">
						<ul class="nav">
							<li class=""><a href="/jcf-showcase/index.html">Home</a></li>
							<li class="active"><a href="/jcf-showcase/openpage.do?viewname=p1">JCF SUA</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p2">파일업로드/다운로드</a>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p3">대용량조회</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p4">예외 및 메시지처리</a></li>
							<li class=""><a href="openpage.do?viewname=p5">JCF Query </a></li>
							<li class=""><a href="openpage.do?viewname=p6">활용 CASE</a></li>
							<li class=""><a href="#">JCF-IAM(개발예정)</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- Subhead -->
		<header id="overview"> </header>

		<div class="container">
			<!-- Docs nav -->
			<div class="row">
				<div class="span3 bs-docs-sidebar">
					<ul class="nav nav-list bs-docs-sidenav">
						<li><a href="#p10"> <i class="icon-chevron-right"></i>Overview</a>
						<li><a href="#p11"> <i class="icon-chevron-right"></i>MCI Request</a>
							<ul>
								<li><a href="#p11_3">단건 데이터 Bean Type 으로 받기</a></li>
								<li><a href="#p11_4">단건 데이터 Bean Type 으로 받기<br/>(Form 전송인 경우)</a></li>
								<li><a href="#p11_5">단건 데이터 Map 으로 받기</a></li>
								<li><a href="#p11_6">단건 데이터 Map 으로 받기<br/>(Form 전송일 경우)</a></li>
								<li><a href="#p11_7">다건 데이터 Bean Type 으로 받기</a></li>
								<li><a href="#p11_8">다건 데이터 Map 으로 받기</a></li>
								<li><a href="#p11_9">Request URL 정보 얻어오기</a></li>
							</ul>
						</li>
						<li><a href="#p12"><i class="icon-chevron-right"></i>MCI Response </a>
							<ul>
								<li><a href="#p12_1">단건 데이터 String Type 으로 보내기</a></li>
								<li><a href="#p12_2">단건 데이터 Bean Type 으로 보내기</a></li>
								<li><a href="#p12_3">단건 데이터 Map Type 으로 보내기</a></li>
								<li><a href="#p12_4">다건 데이터 Bean Type 으로 보내기</a></li>
								<li><a href="#p12_5">다건 데이터 Map Type 으로 보내기</a></li>
								<li><a href="#p12_6">Redirect 페이지 호출하기</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="span9">
	          	<br/>
				<!-- Request Mapping -->
	        	<section id="p10">
	        		<div  class="page-header">
						<h3>개요</h3>
					</div>
					<p>
						JCF-SUA(Smart UI Adaptor)는 단일 서비스로 웹표준, X-인터넷, 모바일 등 다양한 UI 클라이언트와
						연동할 수 있는 다중 채널을 제공하며 이를 통해 개발자는 UI 기술과는 독립적으로 동일한 인터페이스를 통해 서버 측 애플리케이션을 개발 할 수 있다.
						<br/>
						현재 제공하는 UI는 웹표준, JSON, Miplatform, XPlatform, WebPlus, WebSquare, Mybuilder Flex, EXT-JS, Gauce 등이 있으며
						본 예제에서는 JSON과 표준웹 방식을 예제로 설명한다.
						<br/>
						관련 코드는 com.jcf.sample.sua 패키지에 자세히 나와있다.
					</p>
					<pre class="prettyprint linenums">

&lt;!-- jcf-sua 를 사용한 xml 설정  --&gt;
&lt;jcfsua:sua-config auto-config="false" webflow-prefix="/WEB-INF/views/" webflow-suffix=".jsp"&gt;
	&lt;jcfsua:channel channel-type="EXTJS"/&gt;
	&lt;jcfsua:channel channel-type="JSON"/&gt;
	&lt;jcfsua:channel channel-type="WEBFLOW"/&gt;
	&lt;jcfsua:custom-interceptor ref="localeChangeInterceptor"/&gt;
&lt;/jcfsua:sua-config&gt;
					</pre>
				</section>
				<section id="p11">
					<div  class="page-header">
						<h3>MCI Request</h3>
						<p>JCF-SUA 서비스를 통해 웹 요청을 받는 방식에 대해서 설명한다.</p>
					</div>
	 	          	<section id="p11_3">
						<h4 id="headings">단건 데이터 Bean Type 으로 받기</h4>
						<p>Form 형태의 단건 데이터를 JSON 형태로 변환하여 JavaBean 형태로 받는다.<br/>
						   jcf.sua.mvc.MciRequest.get(String datasetId, Class class)</p>
						<div class="bs-docs-example" id="p11_3">
							<br />
							<form id="p11_3_Form" class="form-horizontal">
								<div class="control-group">
									<label class="control-label" for="p11_3_param1">아이디</label>
									<div class="controls">
										<input type="text" name="param1" id="p11_3_param1" placeholder="아이디" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="p11_3_param2">나이</label>
									<div class="controls">
										<input type="text" name="param2" id="p11_3_param2"
											onBlur=onlyNumber(this) placeholder="나이(숫자)" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="p11_3_param3">등록일자</label>
									<div class="controls">
										<input name="param3" type="text" id="p11_3_param3" /> <br />
										<br />
										<button class="btn" type="submit" id="p11_3_btn1">전송</button>
									</div>
								</div>
							</form>
							<div id="p11_3_result" class="bs-docs-example-result"></div>
						</div>
						<pre class="prettyprint linenums">

@RequestMapping("/getJavaBean")
public void getJavaBean(MciRequest request, MciResponse response) {
	SuaBean javaBean = request.get("DS_IN", SuaBean.class);

	response.addSuccessMessage("요청받은 데이터는 " + javaBean.toString() + " 입니다.");
}
						</pre>
	          		</section>

	                <section id="p11_4">
						<h4 id="headings">단건 데이터 Bean Type 으로 받기 (Form 전송인 경우)</h4>
						<p>
							Form 형태의 단건 데이터를 JavaBean 형태로 받은 후 다른 페이지로 전환한다. <br />
							jcf.sua.mvc.MciRequest.getParam(Class class)
						</p>
						<div class="bs-docs-example">
							<br />
							<div  id="p11_4_iframe" class="form-horizontal">
	                        	<iframe src="openpage.do?viewname=p1_iframe_1" width="500" height="250" name="main" style="border:0;"></iframe>
							</div>
						</div>
						<pre class="prettyprint linenums">

@RequestMapping("/getFormData")
public void getFormData(MciRequest request, MciResponse response) {
	SuaBean javaBean = request.getParam(SuaBean.class);

	response.addParam("DS_OUT", "요청받은 데이터는 " + javaBean.toString() + " 입니다.");
	response.setViewName("/redirect/p1_iframe_1_Succuss");
}
						</pre>
					</section>

					<section id="p11_5">
						<h4 id="headings">단건 데이터 Map 으로 받기</h4>
						<p>
							Form 형태의 단건 데이터를 JSON 형태로 변환하여 Map 형태로 받는다. <br />
							jcf.sua.mvc.MciRequest.getMap(String datasetId)
						</p>
						<div class="bs-docs-example" >
							<br />
							<form id="p11_5_Form" class="form-horizontal">
								<div class="control-group">
									<label class="control-label" for="p11_5_param1">아이디</label>
									<div class="controls">
										<input type="text" name="param1" id="p11_5_param1" placeholder="아이디" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="p11_5_param2">나이</label>
									<div class="controls">
										<input type="text" name="param2" id="p11_5_param2"
											onBlur=onlyNumber(this) placeholder="나이(숫자)" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="p11_5_param3">등록일자</label>
									<div class="controls">
										<input type="text" name="param3" id="p11_5_param3" /> <br />
										<br />
										<button class="btn" type="submit" id="p11_5_btn1">전송</button>
									</div>
								</div>
								<div id="p11_5_result" class="bs-docs-example-result"></div>
							</form>
						</div>
						<pre class="prettyprint linenums">

@RequestMapping("/getMap")
public void getMap(MciRequest request, MciResponse response) {
	Map map = request.getMap("DS_IN");

	String name = String.valueOf(map.get("name"));
	String age = String.valueOf(map.get("age"));
	String regiDate = String.valueOf(map.get("regiDate"));

	response.addSuccessMessage("요청받은 Map 유형의 데이터는 아이디 : " + name + " 나이 : " + age + " 등록일자 : " + regiDate + " 입니다.");
}
						</pre>
					</section>

	          		<section id="p11_6">
						<h4 id="headings">단건 데이터 Map 으로 받기 (Form 전송일 경우)</h4>
						<p>
							Form 형태의 단건 데이터를 Map 형태로 받은 후 다른 페이지로 전환한다. <br />
							jcf.sua.mvc.MciRequest.getMap(String datasetId)
						</p>
						<div class="bs-docs-example">
							<br />
							<div  id="p11_6_iframe">
	                        	<iframe src="/jcf-showcase/openpage.do?viewname=p1_iframe_2"  width="500" height="220" name="main" style="border:0;"></iframe>
							</div>
							<br />
						</div>
						<pre class="prettyprint linenums">

@RequestMapping("/getMapForm")
public void getMapForm(MciRequest request, MciResponse response) {
	Map map = request.getParam();

	String name = String.valueOf(map.get("name"));
	String age = String.valueOf(map.get("age"));

	response.addParam("DS_OUT", "요청받은 Map 유형의 데이터는 아이디 : " + name + " 나이 : " + age + " 입니다.");
	response.setViewName("/redirect/p1_iframe_2_Succuss");
}
						</pre>
					</section>

					<section id="p11_7">
						<h4 id="headings">다건 데이터 Bean Type 으로 받기</h4>
						<p>
							테이블 형태의 다건 데이터를 JSON 형태로 변환하여 GirdData 형태로 받는다.<br />
							jcf.sua.mvc.MciRequest.getGridData(String datasetId, Class class)
						</p>
						<div class="bs-docs-example">
							<br />
							<div id="p11_7_form">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>아이디</th>
											<th>나이</th>
											<th>생일</th>
											<th>RowStatus</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input id="p11_7_param1_1" value="sample1" /></td>
											<td><input id="p11_7_param1_2" value="23" /></td>
											<td><input id="p11_7_param1_3" value="2013/01/14" /></td>
											<td>
												<select id="p11_7_param1_4">
													<option value="INSERT" selected="selected">입력</option>
													<option value="UPDATE">수정</option>
													<option value="DELETE">삭제</option>
												</select>
											</td>
										</tr>
										<tr>
											<td><input id="p11_7_param2_1" value="sample2" /></td>
											<td><input id="p11_7_param2_2" value="30" /></td>
											<td><input id="p11_7_param2_3" value="2011/03/09" /></td>
											<td>
												<select id="p11_7_param2_4">
													<option value="INSERT">입력</option>
													<option value="UPDATE" selected="selected">수정</option>
													<option value="DELETE">삭제</option>
												</select>
											</td>
										</tr>
										<tr>
											<td><input id="p11_7_param3_1" value="sample3" /></td>
											<td><input id="p11_7_param3_2" value="47" /></td>
											<td><input id="p11_7_param3_3" value="2012/04/23" /></td>
											<td>
												<select id="p11_7_param3_4">
													<option value="INSERT">입력</option>
													<option value="UPDATE" >수정</option>
													<option value="DELETE" selected="selected">삭제</option>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<button class="btn" type="submit" id="p11_7_btn1">전송</button>
							<br/><br/>
							<div id="p11_7_result" class="bs-docs-example-result"></div>
						</div>
						<pre class="prettyprint linenums">

@RequestMapping("/getJavaBeans")
public void getJavaBeans(MciRequest request, MciResponse response) {
	GridData&lt;SuaBean&gt; javaBeans = request.getGridData("DS_IN", SuaBean.class);

	int insertRow = 0;
	int updateRow = 0;
	int deleteRow = 0;

	for (int i = 0; i &lt; javaBeans.size(); i++) {
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
						</pre>
					</section>

					<section id="p11_8">
						<h4 id="headings">다건 데이터 Map 으로 받기</h4>
						<p>
							테이블 형태의 다건 데이터를 JSON 형태로 변환하여 GirdData&lt;Map&gt; 형태로 받는다.<br />
							jcf.sua.mvc.MciRequest.getGridData(String datasetId, HashMap class)
						</p>
						<div class="bs-docs-example" id="p11_8">
							<br/>
							<div id="p11_8_form">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>아이디</th>
											<th>나이</th>
											<th>생일</th>
											<th>RowStatus</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input id="p11_8_param1_1" value="sample1" /></td>
											<td><input id="p11_8_param1_2" value="15" /></td>
											<td><input id="p11_8_param1_3" value="2013/01/14" /></td>
											<td>
												<select id="p11_8_param1_4">
													<option value="INSERT" selected="selected">입력</option>
													<option value="UPDATE">수정</option>
													<option value="DELETE">삭제</option>
												</select>
											</td>
										</tr>
										<tr>
											<td><input id="p11_8_param2_1" value="sample2" /></td>
											<td><input id="p11_8_param2_2" value="30" /></td>
											<td><input id="p11_8_param2_3" value="1980/04/23" /></td>
											<td>
												<select id="p11_8_param2_4">
													<option value="INSERT">입력</option>
													<option value="UPDATE" selected="selected">수정</option>
													<option value="DELETE">삭제</option>
												</select>
											</td>
										</tr>
										<tr>
											<td><input id="p11_8_param3_1" value="sample3" /></td>
											<td><input id="p11_8_param3_2" value="48" /></td>
											<td><input id="p11_8_param3_3" value="2011/06/05" /></td>
											<td>
												<select id="p11_8_param3_4">
													<option value="INSERT">입력</option>
													<option value="UPDATE" >수정</option>
													<option value="DELETE" selected="selected">삭제</option>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<button class="btn" type="submit" id="p11_8_btn1">전송</button>
							<br/><br/>
							<div id="p11_8_result" class="bs-docs-example-result"></div>
						</div>
						<pre class="prettyprint linenums">

@RequestMapping("/getMapList")
public void getMapList(MciRequest request, MciResponse response) {
	GridData&lt;HashMap&gt; javaBeans = request.getGridData("DS_IN", HashMap.class);

	int insertRow = 0;
	int updateRow = 0;
	int deleteRow = 0;

	for (int i = 0; i &lt; javaBeans.size(); i++) {
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
						</pre>
					</section>

					<section id="p11_9">
						<h4 id="headings">Request URL 정보 얻어오기</h4>
						<p>
							요청받은	HttpResquest 에 대한  URL 정보를 얻어온다. <br />
							jcf.sua.mvc.MciRequest.getRequestURI()
						</p>
						<div class="bs-docs-example" >
							<br/>
							<button class="btn" id="p11_9_btn1">요청보내기</button>
							<br/><br/>
							<div id="p11_9_result" class="bs-docs-example-result"></div>
						</div>
						<pre class="prettyprint linenums">

@RequestMapping("/getRequestURL")
public void getRequestURL(MciRequest request, MciResponse response){
	String requestUrl=request.getRequestURI();
	response.addSuccessMessage("요청 받은 URL 주소는 " + requestUrl + "입니다.");
}
						</pre>
					</section>
				</section>
		       	<section id="p12">
					<div class="page-header">
						<h3>MciResponse</h3>
						<p>JCF-SUA 서비스를 통해 웹에 데이터를 보내는 방식에 대해서 설명한다.</p>
					</div>

					<section id="p12_1">
						<h4 id="headings">단건 데이터 String Type 으로 보내기</h4>
						<p>브라우저로 String 유형의 데이터를 보낸다.<br/>
							jcf.sua.mvc.MciResponse.addParam(String paramId, paramValue)
						</p>
						<div class="bs-docs-example">
							<br/>
							<button class="btn" id="p12_1_btn1">조회</button>&nbsp;&nbsp;
							param : <input type="text"	name="param" id="p12_1_param1" />
						</div>
						<pre class="prettyprint linenums">

@RequestMapping("/sendStringData")
public void sendStringData(MciRequest request, MciResponse response){
	response.addParam("param1", "테스트 데이터");
}
						</pre>
					</section>
					<section id="p12_2">
						<h4 id="headings">단건 데이터 Bean Type 으로 보내기</h4>
						<p>브라우저로 JavaBean 유형의 데이터를 보낸다.<br/>
							jcf.sua.mvc.MciResponse.set(String datasetId, JavaBean javabean)
						</p>
						<div class="bs-docs-example">
							<br />
							<button class="btn" type="submit" id="p12_2_btn1">조회</button>
							<br />
							<form id="p12_2_Form" class="form-horizontal">
								<div class="control-group">
									<label class="control-label" for="p12_2_param1">아이디</label>
									<div class="controls">
										<input type="text" name="param1" id="p12_2_param1" placeholder="아이디" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="p12_2_param2">나이</label>
									<div class="controls">
										<input type="text" name="param2" id="p12_2_param2"
											onBlur=onlyNumber(this) placeholder="나이(숫자)" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="p12_2_param3">등록일자</label>
									<div class="controls">
										<input name="param3" type="text" id="p12_2_param3" /> <br />
									</div>
								</div>
							</form>
						</div>
						<pre class="prettyprint linenums">

@RequestMapping("/sendJavaBean")
public void sendJavaBean(MciRequest request, MciResponse response) {
	SuaBean javaBean = new SuaBean("sample", 24, "2012/02/01");

	response.set("DS_OUT", javaBean);
}
						</pre>
					</section>

	              	<section id="p12_3">
						<h4 id="headings">단건 데이터 Map Type 으로 보내기</h4>
						<p>브라우저로 Map 유형의 데이터를 보낸다.<br/>
							jcf.sua.mvc.MciResponse.setMap(String datasetId, Map data)
						</p>
						<div class="bs-docs-example">
							<br/>
							<button class="btn" type="submit" id="p12_3_btn1">조회</button>
							<form id="p12_2_Form" class="form-horizontal">
								<div class="control-group">
									<label class="control-label" for="p12_3_param1">아이디</label>
									<div class="controls">
										<input type="text" name="param1" id="p12_3_param1" placeholder="아이디" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="p12_3_param2">나이</label>
									<div class="controls">
										<input type="text" name="param2" id="p12_3_param2"
											onBlur=onlyNumber(this) placeholder="나이(숫자)" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="p12_3_param3">등록일자</label>
									<div class="controls">
										<input name="param3" type="text" id="p12_3_param3" /> <br />
										<br />
									</div>
								</div>
							</form>
						</div>
						<pre class="prettyprint linenums">

@RequestMapping("/sendMap")
public void sendMap(MciRequest request, MciResponse response) {
	Map&lt;String, Object&gt; data = new HashMap&lt;String, Object&gt;();

	data.put("name", "sample");
	data.put("age", 32);
	data.put("regiDate", "2012/02/25");

	response.setMap("DS_OUT", data);
}
						</pre>
	           		</section>

	           		<section id="p12_4">
						<h4 >다건 데이터 Bean Type 으로 보내기</h4>
						<p>브라우저로 Bean 객체가 있는 리스트 형태의 다건의 데이터를 보낸다.<br/>
							jcf.sua.mvc.MciResponse.setList(String datasetId, List data)
						</p>
						<div class="bs-docs-example" >
							<br/>
							<button class="btn" type="submit" id="p12_4_btn1">조회</button>
							<div id="p11_8_form">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>아이디</th>
											<th>나이</th>
											<th>등록일자</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
						<pre class="prettyprint linenums">

@RequestMapping("/sendJavaBeanList")
public void sendJavaBeanList(MciRequest request, MciResponse response) {
	SuaBean javaBean1 = new SuaBean("test1", 16, "2010/02/01");
	SuaBean javaBean2 = new SuaBean("test2", 23, "2012/03/03");
	SuaBean javaBean3 = new SuaBean("test3", 49, "2013/01/31");

	List&lt;SuaBean&gt; list = new ArrayList&lt;SuaBean&gt;();

	list.add(javaBean1);
	list.add(javaBean2);
	list.add(javaBean3);

	response.setList("DS_OUT", list);
}
						</pre>
					</section>
	      			<section id="p12_5">
						<h4 id="headings">다건 데이터 Map Type 으로 보내기</h4>
						<p>브라우저로 Map 객체가 있는 리스트 형태의 다건의 데이터를 보낸다.<br/>
						jcf.sua.mvc.MciResponse.setMapList(String datasetId, List&lt;HashMap&gt; data)
						</p>
						<div class="bs-docs-example" >
							<br/>
							<button class="btn" type="submit" id="p12_5_btn1">조회</button>
							<table class="table table-striped">
								<thead>
									<tr>
										<th>아이디</th>
										<th>나이</th>
										<th>등록일자</th>
									</tr>
								</thead>
									<tbody>
									</tbody>
							</table>
						</div>
						<pre class="prettyprint linenums">

@RequestMapping("/sendMapList")
public void sendMapList(MciRequest request, MciResponse response) {
	Map&lt;String, String&gt; data1 = new HashMap&lt;String, String&gt;();

	data1.put("name", "sample1");
	data1.put("age", "23");
	data1.put("regiDate", "2012/02/25");

	Map&lt;String, String&gt; data2 = new HashMap&lt;String, String&gt;();

	data2.put("name", "sample2");
	data2.put("age", "45");
	data2.put("regiDate", "2013/05/25");

	Map&lt;String, String&gt; data3 = new HashMap&lt;String, String&gt;();

	data3.put("name", "sample3");
	data3.put("age", "54");
	data3.put("regiDate", "2010/01/25");

	List&lt;Map&lt;String, String&gt;&gt; list = new ArrayList&lt;Map&lt;String, String&gt;&gt;();

	list.add(data1);
	list.add(data2);
	list.add(data3);

	response.setMapList("DS_OUT", list);
}
						</pre>
					</section>
	      			<section id="p12_6">
						<h4 id="headings">Redirect 페이지 호출하기</h4>
						<p>AJAX 통신이 아니라 일반 웹페이지 통신일 경우 다른 페이지로 이동시킨다. 페이지 경로는
							jcf-context.xml 파일에서 설정한 webflow-prefix 경로를 base 폴더로 한다.<br/>
							jcf.sua.mvc.MciResponse.setViewName(String viewName)
						</p>
						<div class="bs-docs-example" id="p12_6">
					   		<iframe src="openpage.do?viewname=p1_iframe_3" width="500" height="180" name="main" name="main" style="border:0;"></iframe>
						</div>
						<pre class="prettyprint linenums">

@RequestMapping("/redirectPage")
public void redirectPage(MciRequest request, MciResponse response){
	response.setViewName("/redirect/p1_iframe_3_Succuss");
}
						</pre>
						<pre class="prettyprint linenums">

	&lt;jcfsua:sua-config auto-config="true" webflow-prefix="/WEB-INF/views/" webflow-suffix=".jsp" &gt;
						</pre>
	          		</section>
	 			</section>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<footer class="footer">
			<div class="container">
				<p> Homepage : <a href="http://jcf.daewoobrenic.co.kr/blog/">JCF Blog</a></p>
	        	<p> E-Mail : <a href="mailto:jcf@disc.co.kr">jcf@disc.co.kr</a></p>
	        	<p>Copyright © 2013 Daewoo Information Systems Co., Ltd..</p>
			</div>
		</footer>

		<!-- Analytics -->
		<script>
			var _gauges = _gauges || [];
			(function() {
				var t = document.createElement('script');
				t.type = 'text/javascript';
				t.async = true;
				t.id = 'gauges-tracker';
				t.setAttribute('data-site-id', '4f0dc9fef5a1f55508000013');
				t.src = '//secure.gaug.es/track.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(t, s);
			})();
		</script>

	</body>
</html>