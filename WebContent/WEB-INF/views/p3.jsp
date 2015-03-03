<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		<script src="js/p3.js"></script>
	</head>
	<body data-spy="scroll" data-target=".bs-docs-sidebar">
		<!-- Navbar -->
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <spanclass="icon-bar"></span>
					</button>
					<a class="brand" href="/jcf-showcase/index.html">JCF-Showcase</a>
					<div class="nav-collapse collapse">
						<ul class="nav">
							<li class=""><a href="/jcf-showcase/index.html">Home</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p1">JCF SUA</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p2">파일업로드/다운로드</a>
							<li class="active"><a href="/jcf-showcase/openpage.do?viewname=p3">대용량조회</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p4">예외 및 메시지처리</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p5">JCF Query </a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p6">활용 CASE</a></li>
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
						<li><a href="#p31"> <i class="icon-chevron-right"></i>대용량 데이터 조회</a>
							<ul>
								<li><a href="#p31_1">Streamming 방식의 대용량 데이터 조회</a></li>
								<li><a href="#p31_2">Excel 파일 형태의 데이터 저장</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="span9">
					<!-- Request Mapping -->
					<section id="p31">
						<div class="page-header">
							<h3>대용량 데이터 조회</h3>
						</div>
						<p>JCF 의 대용량 조회는 대량의 데이터를 한번에 보내는 것이 아니라 스트리밍 방식을 사용하여 DB 조회 시 한건씩 패치/가공한 후 클라이언트로 전송하여 WAS와 DB 서버의 부담을 완화한다.<br/>
						조회된 데이터는 원하는 형태 (JSON, XML 등)로 가공하여 클라이언트로 전송한다.<br/>
						관련 코드는 com.jcf.sample.stream 패키지에 자세히 나와있다.
						</p>
						<section id="p31_1">
							<h4>Streamming 방식의 대용량 조회</h4>
							<p>Streamming 방식으로 대용량 데이터를 조회한다.</p>
							<div class="bs-docs-example"><br/>
								<button class="btn" id="p31_1_btn1">조회</button>
								<button class="btn" id="p31_1_btn2">리셋</button>
								<br/> <br/>
								<div id="p31_1_result"></div>
							</div>
							<pre class="prettyprint linenums">

public void getStreamData(DataSetStreamWriter writer) {
	commonDao.queryForStream("stream.getSampleByMap", null,
			new DataSetStreamWriterStreamHandlerAdapter&lt;HashMap&lt;String, String&gt;&gt;(writer, "sample", 1024));
}
							</pre>
						</section>
						<section id="p31_2">
							<h4>데이터 조회 및 EXCEL 파일 형태의 저장</h4>
							<p>EXCEL 파일 형태로 대용량 데이터를 저장한다.</p>
							<div class="bs-docs-example" ><br/>
								<button class="btn" id="p31_2_btn2">조회</button>
								<a href="sample/stream/getExcelDown.do" class="btn">엑셀 다운로드</a>
								<div id="p31_2_result">
            						<table class="table table-striped">
										<thead>
											<tr>
												<th>Title</th>
												<th>Content</th>
												<th>UserId</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</section>
						<pre class="prettyprint linenums">

@RequestMapping("/getExcelDown")
public void getExcelDown(MciRequest request, MciResponse response) {
	service.getStreamData(response.getStreamWriter(new ExcelStreamWriterFactory()));
}
					</section>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<footer class="footer">
			<div class="container">
		 		<p>Homepage : <a href="http://jcf.daewoobrenic.co.kr/blog/">JCF Blog</a></p>
        		<p>E-Mail : <a href="mailto:jcf@disc.co.kr">jcf@disc.co.kr</a></p>
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