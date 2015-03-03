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
	<script type="text/javascript">
		function callParent(){
			var param1 = document.getElementById("callName").value;
			var param2 = document.getElementById("folder").value;
			var param3 = document.getElementById("name").value;

			parent.getiFrameData(param1, param2, param3);
		}
	</script>
	<body onload="callParent()">
		<input type="hidden" id="callName" value="${FILE_INFO.callName}"  />
	   	<input type="hidden" id="folder" value="${FILE_INFO.folder}" />
	    <input type="hidden" id="name" value="${FILE_INFO.name}" />
		<br/>
	</body>
</html>