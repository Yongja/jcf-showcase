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
		<script src="js/p9.js"></script>
	</head>
	<body data-spy="scroll" data-target=".bs-docs-sidebar">

		<!-- Navbar -->
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<button type="button" class="btn btn-navbar" data-toggle="collapse"
						data-target=".nav-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="brand" href="/jcf-showcase/index.html">JCF-Showcase</a>
					<div class="nav-collapse collapse">
						<ul class="nav">
							<li class=""><a href="/jcf-showcase/index.html">Home</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p1">JCF SUA</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p2">파일업로드/다운로드</a>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p3">대용량조회</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p4">예외 및 메시지처리</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p5">JCF Query</a></li>
							<li class="active"><a href="openpage.do?viewname=p6">활용 CASE</a></li>
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
						<li><a href="#p61"> <i class="icon-chevron-right"></i>Sample 예제</a></li>
					</ul>
				</div>
				<div class="span9">
					<!-- Request Mapping -->
					<section id="p61">
	         			<div class="page-header">
							<h3>Sample 예제</h3>
							<p>
								JCF 를 활용한 화면 Sample 예제로써 조회 및 입력, 수정 작업을 할 수 있다.<br/>
								관련코드는 com.jcf.sample.example 패키지에 나와있다.<br/>
								참고로 업/다운로드 테스트는 소스를 받은뒤 각자 로컬에서 확인할 수 있다.
							</p>
						</div>
						<section id="p61_1">
							<h4>List 조회</h4>
								<table class="table table-striped">
									<thead>
										<tr>
											<th>아이디</th>
											<th>이름</th>
											<th>핸드폰번호</th>
											<th>지원부서</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
						</section>
						<section id="p62">
							<h4 id="headings">Sample 입력, 수정</h4>
							<br/><br/>
							<form id="p62_1_Form"  action="/jcf-showcase/sample/example/saveExample.do" class="form-horizontal"  method="post"  enctype="multipart/form-data">
								<div class="bs-docs-example" id="p62_1"><br/>
									<input type="hidden" name="applyId" id="p62_1_applyId"  />
									<div class="control-group">
										<label class="control-label" for="p62_1_applyName">이름</label>
										<div class="controls">
											<input type="text" name="applyName" id="p62_1_applyName" placeholder="이름" />
										</div>
										<br/>
										<!--
	                      				<div class="control-group">
	                      	           		<div id="p62_1_pic" >
	                      	           			<label class="control-label" for="p21_2_param3">사진 업로드 (DB저장)</label>
	                      	           			<div class="controls"><input type="file" name="dbFileId">
												</div>
											</div>
										</div>
										 -->
										<div class="control-group">
											<label class="control-label" for="p62_1_phoneNum">휴대폰 번호</label>
											<div class="controls">
												<input type="text" name="phoneNum" id="p62_1_phoneNum" placeholder="휴대폰 번호" />
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="p62_1_applyDept">지원부서</label>
											<div id="applyDept_combo" class="controls">
												<select name="applyDept" id="p62_1_applyDept">
													<option value="01"  selected="selected">물류팀</option>
													<option value="02">인사팀</option>
													<option value="03">홍보팀</option>
												</select>
											</div>
	                                    </div>
										<div class="control-group">
											<label class="control-label">포트폴리오 첨부<br/>파일시스템에 저장</label>
											<div class="controls">
												<div id="p62_4_iframe" class="form-horizontal">
	                           						<iframe src="openpage.do?viewname=p6_iframe_1" width="500" height="120" name="main" style="border:0;"></iframe>
												</div>
											</div>
											<div class="controls">
												<button class="btn" type="submit" id="p62_1_btn2">저장</button>
												<button class="btn" type="reset" id="p62_1_btn1">신규</button>
											</div>
										</div>
										<br />
										<input type="hidden" name="fileName" id="p62_1_attchName" />
										<input type="hidden" name="callName" id="p62_1_attchId" />
								    	<input type="hidden" name="fold" id="p62_1_attchFold" />
								    	<input type="hidden" name="dbFileId" id="p62_1_dbFileId" />
									</div>
								</div>
							</form>
						</section>
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