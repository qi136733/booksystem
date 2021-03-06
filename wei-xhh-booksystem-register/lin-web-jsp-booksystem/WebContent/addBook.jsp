﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>新增图书信息</title>

<link rel="stylesheet"  type="text/css"  href="css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css"  href="css/style.css"/>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<!-- 表单校验插件 -->
<script type="text/javascript" src="js/jquery.validate.js"></script>
<!-- 中文提示插件 -->
<script type="text/javascript" src="js/messages_zh.js"></script>
<script type="text/javascript">

$(function(){
	$("#addBookForm").validate({
		//校验规则
		rules:{
			id:{
				required:true,//必填
				remote:{
					type : "POST", //请求方式
					url : "checkBookIdServlet", //请求地址
					data : {"id":function(){return $("#bid").val()}} //请求数据
				}
			},
			name:{
				required:true,
				remote:{
					function (){
						var name = $("#bname").val()
						if("/^\d$/".test(name)) {
							return false;
						}
					}
				}
			},
			price:{
				required:true,
			},
			bnum:{
				required:true,
			},
			category:{
				required:true,
			}
			
		},
		//错误提示信息（messages也可以不写，使用默认的提示信息）
		messages:{
			id:{
				required:"id为必须字段",
				maxlength:"最大长度为5",
				remote:"id重复了，请重新输入"
			},
			name:{
				required:"必须字段",
				remote:"必须为数字"
			},
			price:{
				required:"必须字段",
			},
			bnum:{
				required:"必须字段",
			},
			category:{
				required:"必须字段",
			}
		}
	
	})
})
</script>

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}
</style>
</head>
<body>
	<div><img src="images/logo.png" width="195" height="50" style="margin-left:175px" /></div>
	<div class="container"
		style="width: 100%; background: url('image/regist_bg.jpg');">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8"
				style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
				<font>新增图书</font>&nbsp;&nbsp;&nbsp;INSERT BOOK
				
				<!-- 新增图书表单 -->
				<form action="addBookServlet" method="POST" id="addBookForm" class="form-horizontal" style="margin-top: 5px;">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">图书编号</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="bid"
								 name="id" placeholder="请输入编号">
						</div>
					</div>
					
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">图书名称</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="bname"
								 name="name" placeholder="请输入书名">
						</div>
					</div>
					
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">图书价格</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="bprice"
								name="price"  placeholder="请输入价格">
						</div>
					</div>
					
					<div class="form-group">
						<label for="confirmpwd" class="col-sm-2 control-label">图书数量</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="bnum"
								name="bnum"  placeholder="请输入数量">
						</div>
					</div>
					
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">图书类别</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="category"
								name="category"  placeholder="请输入类别">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" width="100" value="保存" name="submit"/>
						</div>
					</div>
				</form>
			</div>

			<div class="col-md-2"></div>

		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>




