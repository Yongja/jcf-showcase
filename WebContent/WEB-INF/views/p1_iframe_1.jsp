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

	<body>
		<form id="p11_6_Form" name="p11_6_Form"
			action="/jcf-showcase/sample/sua/getFormData.do" method="post" class="form-horizontal">
			<div class="control-group">
				<label class="control-label" for="p11_6_param1">아이디</label>
				<div class="controls">
					<input type="text" name="name" id="p11_5_param1" placeholder="아이디" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="p11_6_param2">나이</label>
				<div class="controls">
					<input type="text" name="age" id="p11_6_param2" onBlur=onlyNumber(this) placeholder="나이(숫자)" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="p11_6_param3">등록일자</label>
				<div class="controls">
					<input type="text" name="regiDate" id="p11_6_param3" />
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button class="btn" type="submit" id="p11_6_btn1">전송</button>
				</div>
			</div>
		</form>
	</body>
</html>