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
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 400	
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
</head>


<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="clientMgr.html">客户经理信息综合管理维护</a></li>
    <li><a href="clientMgrInfoDetail.html">查看</a></li>
    </ul>
    </div>

    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>客户经理基本信息</span></div>
    
    <ul class="forminfo">
    <li><label>员工号</label><cite>${clientlist.cm_id}</cite></li>
    <li><label>姓名</label><cite>${clientlist.cm_name}</cite></li>
    <li><label>性别</label><cite>${clientlist.cm_sex}</cite></li>
    <li><label>身份证号</label><cite>${clientlist.cm_ssn}</cite></li>
    <li><label>出生年月</label><cite>${clientlist.cm_birthday}</cite></li>
    <li><label>年龄</label><cite>${clientlist.cm_age}</cite></li>
    <li>
    <label>民族</label>
     <c:forEach items="${nationList}" var="nation">
	    	<c:if test="${nation.nation_id ==list.cm_nation }">
	    		<cite>${nation.nation_name }</cite>
	    	</c:if>
	    </c:forEach>
    </li>
    <li><label>政治面貌</label><cite>${clientlist.cm_political_landscape}</cite></li>
    <li><label>籍贯</label><cite>${clientlist.cm_hometown}</cite></li>
    <li><label>照片</label></li>
    <li><label>学历</label><cite>${clientlist.cm_education}</cite></li>
    <li><label>学位</label><cite>${clientlist.cm_degree}</cite></li>
    <li><label>毕业院校及专业</label><cite>${clientlist.cm_graduated}</cite></li>
    <li><label>专业技术职称</label><cite>${clientlist.cm_professional_titles}</cite></li>
    <li><label>客户经理等级</label><cite>${clientlist.cm_level}</cite></li>
		           
    <li><label>所在单位</label><cite>${clientlist.cm_unit}</cite></li>
    <li><label>部门</label><cite>${clientlist.cm_dept}</cite></li>
    <li><label>职务</label><cite>${clientlist.cm_position}</cite></li>


    <li><label>参加工作时间</label><cite>${clientlist.cm_hiredate}</cite></li>
    <li><label>入行时间</label><cite>${clientlist.cm_entry_time}</cite></li>
    <li><label>从事金融工作年限</label><cite>${clientlist.cm_financial_years}</cite></li>
    <li><label>客户经理从业年限</label><cite>${clientlist.cm_working_years}</cite></li>
    <li><label>退出时间</label><cite>${clientlist.cm_exit_time}</cite></li>
    <li><label>办公电话</label><cite>${clientlist.cm_tel}</cite></li>
    <li><label>手机</label><cite>${clientlist.cm_mobile}</cite></li>

    <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
    </ul>
    
    </div>
    </form>
</body>

</html>