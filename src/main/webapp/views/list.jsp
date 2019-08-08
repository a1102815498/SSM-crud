<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>员工列表</title>
<%
 pageContext.setAttribute("app_path",request.getContextPath());
%>
 <link href="${app_path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 <script src="${app_path}/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
 <script src="${app_path}/static/js/jquery-3.3.1.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
	<!--标题  -->
	<div class="row">
		<div class="col-md-12">
		<h1>SSM-CRUD</h1>
		</div>
	</div>
	<!-- 按钮 -->
	<div class="row"></div>
	<!-- 显示表数据 -->
	<div class="row"></div>
	<!-- 页面信息 -->
	<div class="row"></div>
</div>
</body>
</html>