<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<body>
		<form id="p21_3_Form" class="form-horizontal"  enctype="multipart/form-data"
			action="/jcf-showcase/sample/file/sampleDbUpload.do" method="post"  >
			<div class="control-group">
				<label class="control-label" for="p21_3_param1">내용 : </label>
				<div class="controls">
					<input type="text" name="content" id="p21_3_param1" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="p21_3_param2">파일 : </label>
				<div class="controls">
					<input type="file" name="file" id="p21_3_param2" /><br/><br/>
					<button class="btn" type="submit" id="p21_3_btn1">전송</button>
				</div>
			</div>
		</form>
	</body>
</html>