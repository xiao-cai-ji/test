<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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

<%
    String msg = (String) request.getAttribute("insertErr");
    if(msg==null){
        msg="";
    }
    request.removeAttribute("insertErr");
%>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="${pageContext.request.contextPath}/user/listuser">用户管理</a></li>
    <li><a href="userInfoUpdate.jsp">修改</a></li>
    </ul>
    </div>
    
    <form action="${pageContext.request.contextPath }/user/EdituserPost" method="post">
    <div class="formbody">
    <div class="formtitle"><span>用户基本信息</span></div>
    
    <ul class="forminfo">
     <c:forEach items="${user}" var="list">
    <li>
	    <label>用户编号</label>
	    <input name="men_id" type="text" readonly="readonly" class="dfinput"  value="${list.men_id}" /><i>编号不允许修改</i>
	</li>
  
    <li>
	    <label>姓名</label>
	    <input name="cname" type="text" class="dfinput" value="${list.cname }"/>
    </li>
    <li>
	    <label>性别</label>
	    <cite>
	    <input name="men_sex" type="radio" value="男" ${list.men_sex=='男' ? 'checked="checked"':''} />男&nbsp;&nbsp;&nbsp;&nbsp;
	    <input name="men_sex" type="radio" value="女" ${list.men_sex=='女' ? 'checked="checked"':''}/>女
	    </cite>
    </li>
    <li>
	    <label>出生日期</label>
	    <input name="men_born" type="date" class="dfinput" value="${list.men_born}"/>
    </li>
    <li>
    <label>角色</label>
    <cite>
	    <select  name="roleid" class="dfselect">
		    <option value="2">请选择</option>
		    <option value="0" ${list.roleid=='0' ? 'selected="selected"':''}>管理员</option>
		    <option value="1" ${list.roleid=='1' ? 'selected="selected"':''}>客户经理</option>
	    </select>
    </cite>
    </li>
     </c:forEach>
    <b ><font color="red"><%=msg%></font></b>
    <li>
    <label>&nbsp;</label>
	    <input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;
	    <input name="" type="reset" class="btn" value="重置"/>
    </li>
    </ul>
    
    </div>
    </form>
</body>

</html>
