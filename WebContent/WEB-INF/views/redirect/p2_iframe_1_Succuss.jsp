<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>

		<link href="/jcf-showcase/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
		<link href="/jcf-showcase/assets/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
		<link href="/jcf-showcase/assets/bootstrap/css/docs.css" rel="stylesheet">
		<link href="/jcf-showcase/assets/bootstrap/css/prettify.css" rel="stylesheet">
		<link rel="stylesheet" href="/jcf-showcase/assets/css/jquery-ui-1.9.2.custom.css" />

		<!-- 공통 lib-->
		<script src="/jcf-showcase/lib/jquery-1.9.0.js"></script>
		<script src="/jcf-showcase/lib/jquery-ui-1.9.2.custom.js"></script>
		<script src="/jcf-showcase/assets/bootstrap/js/bootstrap.js"></script>
		<script src="/jcf-showcase/assets/bootstrap/js/prettify.js"></script>
		<script src="/jcf-showcase/assets/bootstrap/js/application.js"></script>
	</head>
	<body>
		<div class="bs-docs-example-result">
			<br/>
			<p> 내용 : ${content}<br/><br/>
			파일이 업로드 되었습니다.<br/>
			자세한 내용은 로그을 확인하세요.<br/>
			</p>
		</div>
		<br/>
		<a href="/jcf-showcase/openpage.do?viewname=p2_iframe_1" class="btn btn-link">이전 페이지로</a>
	</body>
</html>
