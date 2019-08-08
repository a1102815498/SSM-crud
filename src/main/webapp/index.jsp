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


	<!-- 修改模态框 -->
	<div class="modal fade" id="empEditModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工修改</h4>
				</div>
				<div class="modal-body">
					<!-- 表单 -->
					<form class="form-horizontal">
					
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">EmpName</label>
							<div class="col-sm-10">
								 <p class="form-control-static" id="empName_edit"></p>
								
							</div>
						</div>

						<!--邮件  -->
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="text" name="emai" class="form-control"
									id="Email_edit" placeholder="Email"> <span
									id="helpBlock2" class="help-block"></span>
							</div>
						</div>

						<!-- 性别 -->
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_edit" value="男" checked> 男
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_edit" value="女"> 女
								</label>
							</div>
						</div>

						<!--部门下拉框  -->
						<div class="form-group">
							<label class="col-sm-2 control-label">DeptName</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId">

								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="edit_button">更新</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 模态框 -->
	<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工添加</h4>
				</div>
				<div class="modal-body">
					<!-- 表单 -->
					<form class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">EmpName</label>
							<div class="col-sm-10">
								<input type="text" name="empName" class="form-control"
									id="empName_input" placeholder="EmpName"> <span
									id="helpBlock2" class="help-block"></span>
							</div>
						</div>

						<!--邮件  -->
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="text" name="emai" class="form-control"
									id="Email_input" placeholder="Email"> <span
									id="helpBlock2" class="help-block"></span>
							</div>
						</div>

						<!-- 性别 -->
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_add" value="男" checked> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_add" value="女"> 女
								</label>
							</div>
						</div>

						<!--部门下拉框  -->
						<div class="form-group">
							<label class="col-sm-2 control-label">DeptName</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId">

								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="save_button">保存</button>
				</div>
			</div>
		</div>
	</div>

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
				<button class="btn btn-primary" id="empAddBtn">新增</button>
				<button class="btn btn-danger" id="del_all">删除</button>
			</div>
		</div>
		<!-- 显示表数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
						<th><input type="checkbox" id="check_all"></th>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>Email</th>
							<th>deptNmae</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>

			</div>
		</div>
		<!-- 页面信息 -->
		<div class="row">

			<div class="col-md-6" id="page_info_area"></div>

			<div class="col-md-6" id="page_info_nav"></div>
		</div>
	</div>
	<script type="text/javascript">
	var currentPage;
		$(function() {
			to_page(1);
		});
		function to_page(pn) {
			$.ajax({
				url : "${app_path}/emps",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					build_emp_table(result);
					build_page_info(result);
					build_page_nav(result);
				}
			});
		}
		/*显示表单*/
		function build_emp_table(result) {
			$("#emps_table tbody").empty();
			var emps = result.extend.pageinfo.list;
			$.each(emps, function(index, item) {
				var checkId = $("<td><input type='checkbox' class='check_item'></td>");
				
				var empIdTd = $("<td></td>").append(item.empId);
				var empnaNameTd = $("<td></td>").append(item.empName);
				var empGenderTd = $("<td></td>").append(item.gender);
				var empEmaiTd = $("<td></td>").append(item.emai);
				var empDNameTd = $("<td></td>").append(item.dept.deptName);
				var editId = $("<button></button>").addClass(
						"btn btn-primary btn-sm edit_btn").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-pencil")).append("编辑");

				var delId = $("<button></button>").addClass(
						"btn btn-danger btn-sm del_btn").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-trash ")).append("删除");
				var buttonTd = $("<td></td>").append(editId).append(" ")
						.append(delId);
				editId.attr("emp_id",item.empId);
				delId.attr("del_id",item.empId);
				$("<tr></tr>").append(checkId).append(empIdTd).append(empnaNameTd).append(
						empGenderTd).append(empEmaiTd).append(empDNameTd)
						.append(buttonTd).appendTo("#emps_table tbody");
			});
		}

		function build_page_info(result) {
			currentPage = result.extend.pageinfo.pageNum;
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"当前" + result.extend.pageinfo.pageNum + "页,总共"
							+ result.extend.pageinfo.pages + "页,总共"
							+ result.extend.pageinfo.total + "条");
		}
		/**显示分页*/
		function build_page_nav(result) {
			$("#page_info_nav").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPage = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var lastPage = $("<li></li>").append(
					$("<a></a>").append("末叶").attr("href", "#"));
			var prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
			var sufPage = $("<li></li>").append($("<a></a>").append("&raquo;"));
			if (result.extend.pageinfo.hasPreviousPage == false) {
				firstPage.addClass("disabled");
				prePage.addClass("disabled");
			} else {
				firstPage.click(function() {
					to_page(1);
				});

				prePage.click(function() {
					to_page(result.extend.pageinfo.pageNum - 1);
				});
			}

			if (result.extend.pageinfo.hasNextPage == false) {
				lastPage.addClass("disabled");
				sufPage.addClass("disabled");
			} else {
				lastPage.click(function() {
					to_page(result.extend.pageinfo.pages)
				});

				sufPage.click(function() {
					to_page(result.extend.pageinfo.pageNum + 1);
				});
			}

			ul.append(firstPage).append(prePage);
			$.each(result.extend.pageinfo.navigatepageNums, function(index,
					item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageinfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item);
				});
				ul.append(numLi);
			});
			ul.append(sufPage).append(lastPage);
			var navEl = $("<nav></nav>").append(ul);
			navEl.appendTo("#page_info_nav");
		}
		/**重置表单*/
		function reset_form(ele) {
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		/**新增按钮点击事件*/
		$("#empAddBtn").click(function() {
			reset_form("#empAddModel form");

			getDepts("#empAddModel select");
			$("#empAddModel").modal({
				backdrop : "static"
			});
		});

		/**获得部门*/
		function getDepts(ele) {
			$(ele).empty();
			$.ajax({
				type : "Get",
				url : "${app_path}/depts",
				success : function(result) {
					//console.log(result);
					$.each(result.extend.depts, function() {
						var optEl = $("<option></option>")
								.append(this.deptName).attr("value",
										this.deptId);
						optEl.appendTo(ele);
					});
				}
			});

		}
		/*保存按钮点击事件*/
		$("#save_button")
				.click(
						function() {
							/**前端校验*/
							if (!vailate_add()) {
								return false;
							}

							if ($(this).attr("ajax-va") == "error") {
								return false;
							}
							var data = $("#empAddModel form").serialize();
							$
									.ajax({
										url : "${app_path}/emp",
										type : "post",
										data : data,
										success : function(result) {
											if (result.code == 100) {
												$("#empAddModel").modal("hide");
												to_page(99999);
											} else {
												/**后台校验*/
												if (undefined != result.extend.errorsField.emai) {
													show_msg(
															"#Email_input",
															"error",
															result.extend.errorsField.emai);
												}
												if (undefined != result.extend.errorsField.empName) {
													show_msg(
															"#empName_input",
															"error",
															result.extend.errorsField.empName);
												}
											}

										}
									});

						});
		/**前端校验*/
		function vailate_add() {

			var name = $("#empName_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!regName.test(name)) {
				//alert("用户名必须是2-5位中文或6-16位英文加字母！");
				show_msg("#empName_input", "error", "用户名必须是2-5位中文或6-16位英文加字母！");

				return false;
			} else {
				show_msg("#empName_input", "success", "");

			}
			;
			var email = $("#Email_input").val();
			var regEmail =/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
			if (!regEmail.test(email)) {
				show_msg("#Email_input", "error", "用户邮箱格式不正确");
				//alert("用户邮箱格式不正确");
				return false;
			} else {
				show_msg("#Email_input", "success", "");

			}
			return true;
		}
		/**显示信息*/
		function show_msg(ele, status, msg) {
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		/**用户名重复校验*/
		$("#empName_input").change(
				function() {
					var empName = this.value;
					$.ajax({
						url : "${app_path}/checkuser",
						type : "post",
						data : "empName=" + empName,
						success : function(result) {
							if (result.code == 100) {
								show_msg("#empName_input", "success", "用户名可用");
								$("#save_button").attr("ajax-va", "success");
							} else {
								show_msg("#empName_input", "error",
										result.extend.va_msg);
								$("#save_button").attr("ajax-va", "error");
							}
						}
					});
				});
		$(document).on("click",".edit_btn",function(){
			getDepts("#empEditModel select");
			
			getEmp($(this).attr("emp_id"));
			$("#edit_button").attr("empid",$(this).attr("emp_id"));
			$("#empEditModel").modal({
				backdrop : "static"
			});
		});
		
		$(document).on("click",".del_btn",function(){
			var name = $(this).parents("tr").find("td:eq(2)").text();
			var id = $(this).attr("del_id");
			if(confirm("确认删除【"+name+"】")){
				$.ajax({
					url:"${app_path}/emp/"+id,
					type:"delete",
					success:function(result){
						alert(result.msg);
						to_page(currentPage);
					}
				})
			}
		});
		
		$("#edit_button").click(function(){
			var email = $("#Email_edit").val();
			var regEmail =/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
			if (!regEmail.test(email)) {
				show_msg("#Email_edit", "error", "用户邮箱格式不正确");
				//alert("用户邮箱格式不正确");
				return false;
			} else {
				show_msg("#Email_edit", "success", "");

			}
			
			$.ajax({
				url:"${app_path}/emp/"+$(this).attr("empid"),
				type:"put",
				data:$("#empEditModel form").serialize(),
				success:function(result){
					$("#empEditModel").modal("hide");
					to_page(currentPage);
				}
			});
			
			
		});
		
		function getEmp(id){
			$.ajax({
				url:"${app_path}/emp/"+id,
				type:"Get",
				success:function(result){
					var empData = result.extend.emp;
					$(".form-control-static").text(empData.empName);
					$("#Email_edit").val(empData.emai);
					$("#empEditModel input[name=gender]").val([empData.gender]);
					$("#empEditModel select").val([empData.dId]);
				}
			});
		}
		$("#check_all").click(function(){
			
			$(".check_item").prop("checked",$(this).prop("checked"));
			
		});
		$(document).on("click",".check_item",function(){
			var flag = $(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		
		$("#del_all").click(function(){
			var del_ids = "";
			var empNames="";
			$.each($(".check_item:checked"),function(){
				empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
				del_ids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			empNames = empNames.substring(0,empNames.length-1);
			del_ids = del_ids.substring(0,del_ids.length-1);
			if(confirm("确认删除"+empNames+"?")){
				$.ajax({
					url:"${app_path}/emp/"+del_ids,
					type:"delete",
					success:function(result){
						alert(result.msg);
						to_page(currentPage);
					}
				})
			}
		});
	</script>
</body>
</html>