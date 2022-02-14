<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>


</head>


<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="studyMgr.html">学习园地管理</a></li>
			<li><a href="studyMgrUpdate.html">修改</a></li>
		</ul>
	</div>

	<form action="${pageContext.request.contextPath }/learn/EditlearnPost" enctype="multipart/form-data" method="post">
		<div class="formbody">
			<div class="formtitle">
				<span>学习园地资料管理</span>
			</div>

			<ul class="forminfo">

				<li><label>编号</label><input type="text" class="dfinput"  name="key" value="${learn.l_key}" readonly="readonly"/></li>
				<li><label>资料名称</label><input name="l_name" type="text"
					class="dfinput" value="${learn.l_name} " /></li>

				<li><label>完全公开</label><cite><input name="ispublic"
						type="radio" value="" checked="checked" />是&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="ispublic" type="radio" value="" />否</cite></li>

				<li><label>资料类型</label><cite><select name="l_type"
						class="dfselect1">
							<option value="">请选择</option>
							<option value="1" ${learn.l_type=='1' ? 'selected="selected"':''}>规章制度</option>
							<option value="2" ${learn.l_type=='2' ? 'selected="selected"':''}>学习培训材料</option>
							<option value="3" ${learn.l_type=='3' ? 'selected="selected"':''}>资格岗位考试教程</option>
							<option value="4" ${learn.l_type=='4' ? 'selected="selected"':''}>客户营销技巧</option>
					</select></cite></li>

				<li><label>资料描述</label>
				<textarea name="l_des" cols=""  rows="" class="textinput">${learn.l_des}</textarea></li>

				<li><label>附件上传</label><input name="file" type="file"
					class="dfinputfile" value="${learn.l_url} " /></li>



				<li><label>&nbsp;</label> <input name="" type="submit" class="btn" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp; 
					<input name="" type="reset" class="btn" value="重置" /></li>

			</ul>

		</div>
	</form>


</body>

</html>
