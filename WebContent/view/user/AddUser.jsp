<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
    <li><a href="${pageContext.request.contextPath}/user/listuser">用户管理</a></li>
    <li><a href="">添加</a></li>
    </ul>
    </div>
    
    <form action="${pageContext.request.contextPath}/user/addUser" method="post">
    <div class="formbody">
    <div class="formtitle"><span>用户基本信息</span></div>
    
    <ul class="forminfo">
    <li><label>姓名</label><input name="name"  type="text" class="dfinput" value=""/></li>
    <li><label>性别</label><cite><input name="sex"  type="radio" value="男" checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="sex"  type="radio" value="女" />女</cite></li>
    <li><label>出生日期</label><input name="born" type="date" class="dfinput" value=""/></li>
    <li><label>角色</label><cite><select name="roleid" class="dfselect"><option value="2">请选择</option><option value="0" >管理员</option><option value="1">客户经理</option></select></cite></li>
    <li><label>&nbsp;</label><input name=""  type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="重置"/></li>
    </ul>
    
    </div>
    </form>
</body>

</html>
