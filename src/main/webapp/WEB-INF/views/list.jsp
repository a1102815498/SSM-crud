<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("app_path", request.getContextPath());
%>
<script src="${app_path}/static/js/jquery-3.3.1.js"
	type="text/javascript"></script>
<link href="${app_path}/static/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${app_path}/static/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>

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
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 显示表数据 -->
		<div class="row">
			<div calss="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>Email</th>
						<th>deptNmae</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageinfo.list }" var="emp">
					<tr>
						<th>${emp.empId }</th>
						<th>${emp.empName }</th>
						<th>${emp.gender }</th>
						<th>${emp.emai }</th>
						<th>${emp.dept.deptName}</th>
						<th>
							<button class="btn btn-primary btn-sm">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								编辑
							</button>
							<button class="btn btn-danger btn-sm">
								<span class=" glyphicon glyphicon-trash " aria-hidden="true"></span>
								删除
							</button>
						</th>
					</tr>
					</c:forEach>
				</table>

			</div>
		</div>
		<!-- 页面信息 -->
		<div class="row">

			<div class="col-md-6">
			当前${pageinfo.pageNum }页,总共${pageinfo.pages}页,总共${pageinfo.total}条
			</div>

			<div class="col-md-6">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="${app_path }/emps?pn=1">首页</a></li>
						<c:if test="${pageinfo.hasPreviousPage }">
							<li><a href="${app_path }/emps?pn=${pageinfo.pageNum-1}" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
						</c:if>
						
						<c:forEach items="${pageinfo.navigatepageNums }" var="page_num">
							<c:if test="${page_num==pageinfo.pageNum }">
								<li class="active"><a href="#">${page_num }</a></li>
							</c:if>
							<c:if test="${page_num!=pageinfo.pageNum }">
								<li><a href="${app_path }/emps?pn=${page_num}">${page_num }</a></li>
							</c:if>
							
						</c:forEach>
						<c:if test="${pageinfo.hasNextPage }">
							<li><a href="${app_path }/emps?pn=${pageinfo.pageNum+1}" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
						</c:if>
						
						<li><a href="${app_path }/emps?pn=${pageinfo.pages}">末页</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>