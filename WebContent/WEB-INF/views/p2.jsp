<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="jcf showcase">
		<meta name="author" content="jcf">
		<title>JCF Showcase</title>

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
		<script src="js/p2.js"></script>
	</head>

	<body data-spy="scroll" data-target=".bs-docs-sidebar">
		<!-- Navbar -->
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<button type="button" class="btn btn-navbar" data-toggle="collapse"
						data-target=".nav-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="brand" href="/jcf-showcase/index.html">JCF-Showcase</a>
					<div class="nav-collapse collapse">
						<ul class="nav">
							<li class=""><a href="/jcf-showcase/index.html">Home</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p1">JCF SUA</a></li>
							<li class="active"><a href="/jcf-showcase/openpage.do?viewname=p2">파일업로드/다운로드</a>
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
						<li>
							<a href="#p21"> <i class="icon-chevron-right"></i>파일 업/다운로드</a>
						</li>
						<ul>
							<li><a href="#p21_1">파일시스템 기반에 파일과 데이터를 같이 보내는 경우</a></li>
							<li><a href="#p21_2">파일시스템 기반에 파일과 데이터를 별도로 보내는 경우 (선파일, 후데이터)</a></li>
						</ul>
					</ul>
				</div>

				<div class="span9">
				<!-- Request Mapping -->
					<section id="p21">
						<div  class="page-header">
							<h3>파일 업/다운로드</h3>
						</div>
						<p>JCF-UPLOAD 는 파일 업/다운로드 기능과 업무를 분리하여, 간단한 설정과 구현을 통하여 파일 업로드와 다운로드 기능을 제공한다.<br/>
						관련 코드는com.jcf.sample.file 패키지 및 applicationContext-file.xml 에 자세히 나와있다.<br/>
						참고로 업/다운로드 테스트는 소스를 받은뒤 각자 로컬에서 확인할 수 있다.
						</p>
	           			<section id="p21_1">
	       					<h4 id="headings">파일시스템 기반에 파일과 데이터를 같이 보내는 경우</h4>
							<p> 데이터와 함께 파일은 서버의 파일시스템에 파일을 업로드한다.<br/>
								업로드 기본 경로는 app.propertis 파일에 fileBasePath로 설정된 경로이다.</p>
							<div class="bs-docs-example" >
					  			<iframe src="openpage.do?viewname=p2_iframe_1"  width="500" height="220"  name="main" style="border:0;"></iframe>
							</div><br/>
							<pre class="prettyprint linenums">

&lt;bean id="webFlowFileOperator" class="jcf.sua.ux.webflow.mvc.file.WebFlowFileOperator"&gt;
		&lt;property name="receiver" ref="uploadToFile" /&gt;
		&lt;property name="uploadEventHandlers"&gt;
			&lt;map&gt;
				&lt;entry key="/**/*FileUpload*" value-ref="fileUploadEventHandler"/&gt;
			&lt;/map&gt;
		&lt;/property&gt;
&lt;/bean&gt;

&lt;bean id="fileUploadEventHandler" class="com.jcf.system.file.upload.ShowcaseFileUploadEventHandler" /&gt;

public class ShowcaseFileUploadEventHandler implements UploadEventHandler {
	...
	@Override
	public void postprocess(String folder, MultiPartInfo info, PersistenceManager persistenceManager) {
		List list = info.getFileInfos();

		for (FileInfo fileInfo : list) {
			logger.info("File Name : " + fileInfo.getName());
			logger.info("Modified Name : " + fileInfo.getCallName());
			logger.info("Upload Path : " + fileInfo.getFolder());
		}
	}
	...
}

@RequestMapping("/sampleFileUploadWithInfo")
public void sampleFileUploadWithInfo(MciRequest request, MciResponse response) {
	response.addParam("content", request.getParam("content"));

	response.setViewName("/redirect/p2_iframe_1_Succuss");
}
							</pre>
						</section>
						<section id="p21_2">
							<h4 id="headings">파일시스템 기반에 파일과 데이터를 따로 보내는 경우</h4>
							<p>파일을 먼저 업로드 한 후 데이터를 보낸다.</p>
							<div class="bs-docs-example" >
								<form id="p21_1_Form" class="form-horizontal" method="post">
									<div class="control-group">
										<label class="control-label" for="p21_2_param1">내용 : </label>
										<div class="controls">
											<input type="text" name="param1" id="p21_2_param1" />
										</div>
									</div>
									<div class="control-group">
										<label  class="control-label" for="p21_2_param3">파일 : </label>
										<div class="controls">
											<div  id="p21_iframe" >
		                              			<iframe src="openpage.do?viewname=p2_iframe_2" name="main" style="border:0;"></iframe>
											</div>
											<button class="btn" type="submit" id="p21_2_btn1">전송</button>
										</div>
									</div>
								</form>
								<div id="p21_2_result"  class="bs-docs-example-result">  </div>
							</div>
							<pre class="prettyprint linenums">

@RequestMapping("/sampleFileUpload")
public void sampleUpload(MciRequest request, MciResponse response) {
	response.setViewName("/redirect/p2_iframe_2_Succuss");
}

@RequestMapping("/afterUploadAction")
public void sampleAfterUplaod(MciRequest request, MciResponse response) {
	Map paramMap = request.getMap("DS_IN");

	response.addSuccessMessage(paramMap.toString() + "데이터와 파일이 저장 되었습니다.");
}
							</pre>
						</section>
						<!--
						<section id="p21_3">
		   					<h4>파일을 byte[]로 받는 경우</h4>
							<p>파일과 데이터와 보내 Byte[] 타입으로 받는다.</p>
							<div class="bs-docs-example">
		  						<iframe src="openpage.do?viewname=p2_iframe_3"  width="500" height="200"  name="main" style="border:0;"></iframe>
								<div  id="p21_3_result"></div>
							</div>
							<pre class="prettyprint linenums">


							</pre>
						</section>
						 -->
					</section>
				</div>
			</div>
		</div>
		<!-- Footer
	    ================================================== -->
		<footer class="footer">
			<div class="container">
			 <p>Homepage : <a href="http://jcf.daewoobrenic.co.kr/blog/">JCF Blog</a></p>
	         <p>E-Mail : <a href="mailto:jcf@disc.co.kr">jcf@disc.co.kr</a></p>
	         <p>Copyright © 2013 Daewoo Information Systems Co., Ltd..</p>
			</div>
		</footer>

		<!-- Analytics
	    ================================================== -->
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
