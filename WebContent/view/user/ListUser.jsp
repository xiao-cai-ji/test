<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript"> 


  function confirmMsgDel()
  {  
	  var chckBox=document.getElementsByName("checkbox");
	  var num=chckBox.length;
	  var id='';
	  
	  for (var i=0;i<num;i++){
		  if(chckBox[i].checked){
			  id+=chckBox[i].value+",";
		  }
	  }
    if(id!=""){
    	if(confirm("删除用户信息，你确定要删除吗？")){
    		window.location.href="${pageContext.request.contextPath}/user/Delete?id="+id;
    	}
    }else{
    	alert("请选择要删除的用户");
    }
    window.close();
  } 
  
  
  function userOpen()
  {  
	  var chckBox=document.getElementsByName("checkbox");
	  var num=chckBox.length;
	  var id='';
	  
	  for (var i=0;i<num;i++){
		  if(chckBox[i].checked){
			  id+=chckBox[i].value+",";
		  }
	  }
    if(id!=""){
    	if(confirm("您确定要启用该用户吗？")){
    		window.location.href="${pageContext.request.contextPath}/user/openUser?id="+id;
    	}
    }else{
    	alert("请选择要启用的用户");
    }
    window.close();
  } 
  
 
  function userClose()
  {  
	  var chckBox=document.getElementsByName("checkbox");
	  var num=chckBox.length;
	  var id='';
	  
	  for (var i=0;i<num;i++){
		  if(chckBox[i].checked){
			  id+=chckBox[i].value+",";
		  }
	  }
    if(id!=""){
    	if(confirm("您确定要禁用该用户吗？")){
    		window.location.href="${pageContext.request.contextPath}/user/closeUser?id="+id;
    	}
    }else{
    	alert("请选择要禁用的用户");
    }
    window.close();
  } 
  
  
  
  function resetPass()
  {  
	  var chckBox=document.getElementsByName("checkbox");
	  var num=chckBox.length;
	  var id='';
	  
	  for (var i=0;i<num;i++){
		  if(chckBox[i].checked){
			  id+=chckBox[i].value+",";
		  }
	  }
    if(id!=""){
    	if(confirm("您确定要重置该用户密码吗？")){
    		window.location.href="${pageContext.request.contextPath}/user/repass?id="+id;
    	}
    }else{
    	alert("请选择要修改密码的用户");
    }
    window.close();
  } 
  
  function updateUser(){
	  var chckBox=document.getElementsByName("checkbox");
	  var num=chckBox.length;
	  var id='';
	  var flag=0;
	  for (var i=0;i<num;i++){
		  if(chckBox[i].checked){
			  id+=chckBox[i].value;
			  flag++;
		  }
	  }
	  if(flag==0){
		  alert("请选择一条信息进行修改");  
	  }else if(flag>1){
		alert("对不起，你只能选择一条信息");  
	  }else{
		  window.location.href="${pageContext.request.contextPath}/user/Updateuser?id="+id;
	  }
	  window.close();
 }
  function myPage(){
	  var rows=${userList.rowCount};
	  var size=${userList.pageSize};
	  var mypage=(rows-(rows%size))/10+1;
	  return mypage;
  }
  //首页
  function firstPage(){
	  document.forms[0].action="${pageContext.request.contextPath}/user/getUserListBypage?pageNo=1&pageSize=10";
	  document.forms[0].submit();
	  
  }
  //上一页
  function priviousPage(){
	  var a= ${userList.pageNo};
	  var pageNow=eval(a);
	  if (pageNow==1){
		  alert("已经是第一页了！");
		  return false;
	  }
	  var pageT=pageNow -1 ;
	  document.forms[0].action="${pageContext.request.contextPath}/user/getUserListBypage?pageNo=" + pageT + "&pageSize=10";
	  document.forms[0].submit();
  }
  //下一页
  function nextPage(){
	  var pageNow=eval(${userList.pageNo});
	 if (pageNow>=(myPage())){
		 alert("已经是最后一页了!");
		 return false;
	 }
	 var pageT=pageNow+1;
	 document.forms[0].action="${pageContext.request.contextPath}/user/getUserListBypage?pageNo=" + pageT + "&pageSize=10";
	  document.forms[0].submit();
	 
  }
  //最后一页
  function lastPage(){
	  var pageT=myPage();
	  alert(pageT)
	  document.forms[0].action="${pageContext.request.contextPath}/user/getUserListBypage?pageNo=" + pageT + "&pageSize=10";
	  document.forms[0].submit();
  }
  //转到第几页
  function goPage(){
	  var page= document.getElementById("inputpage").value;
	  if(page==''){
		  alert("请输入页码");
		  return false;
	  }
	  if(page>=myPage()+1){
		  alert("输入页码不能大于总页数");
		  return false;
	  }
	  if(page<1){
		  alert("输入页码不能小于1");
		  return false;
	  }
	  document.forms[0].action="${pageContext.request.contextPath}/user/getUserListBypage?pageNo=" + page + "&pageSize=10";
	  document.forms[0].submit();
  }
  
//全选
  function seltAll(){
  	  var checkBoxSign=document.getElementById("ckb");
  	  var checkBox=document.getElementsByName("checkbox");
  	  var num=checkBox.length;
  	  if(checkBoxSign.checked){
  		  for(var i=0;i<num;i++){
  			  checkBox[i].checked=true;
  		  }
  	  }else{
  			  for(var i=0;i<num;i++){
  				  checkBox[i].checked=false;
  			  }
  		  }
  		
  	  
  }
  
</script>
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
    <li><a href="#">用户管理</a></li>
    </ul>
    </div>
	<form action="${pageContext.request.contextPath}/user/getUserListBypage?pageNo=1&pageSize=10" method="post">
	<div class="formbody">
    <ul class="seachform">
    <li><label>用户编号</label><input name="men_id" type="text" class="scinput" /></li>
    <li><label>姓名</label><input name="cname" type="text" class="scinput" /></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
    </ul>
	</div>

    <div class="rightinfo">
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="${pageContext.request.contextPath}/user/addUser"><span><img src="../images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:updateUser()"><span><img src="../images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:confirmMsgDel()" ><span><img src="../images/t03.png"/></span>删除</a></li>
	        <li><a href="javascript:userOpen()" ><span><img src="../images/t08.png" height="24" width="24"/></span>启用</a></li>
	        <li><a href="javascript:userClose()" ><span><img src="../images/t09.png" height="24" width="24"/></span>禁用</a></li>
	        <li><a href="javascript:resetPass()" ><span><img src="../images/t07.png" height="20" width="20"/></span>重置密码</a></li>
	        </ul>
	    </div>
	    <table class="tablelist">
	    <tr>
				<th><input type="checkbox" id="ckb" onclick="seltAll()"></th>
				<th>ID</th>
				<th>姓名</th>
				<th>状态</th>
				<th>注册日期</th>
				<th>最后登录日期</th>
			</tr>
			<c:if test="${empty userList}">
				<tr>
					<td colspan="11" align="center"><font color="red">您检索的信息不存在！</font></td>
				
				</tr>
			</c:if>
			<c:if test="${not  empty userList}">
			<c:forEach var="user" items="${userList.list}">
				<tr>
					<th><input type="checkbox" name="checkbox" id="ckb" value="${user.men_id}"></th>
					<td>${user.men_id}</td>
					<td>${user.cname}</td>
					<td>${user.isenable}</td>
					<td>${user.register_time}</td>
					<td>${user.last_time}</td>	
				</tr>
			</c:forEach>
	       </c:if>
	    </table>
		   <div class="pagin">
	 		<table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td class="STYLE4"><div class="message">共<i class="blue">${userList.rowCount}</i>条记录，当前显示第&nbsp;<i class="blue">${userList.pageNo}&nbsp;</i>页</div>
	           </td>
	            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
	                <tr>
	                  <td width="45"><img src="../images/first.gif" width="33" height="20" style="cursor:hand" onclick="firstPage()"/></td>
	                  <td width="50"><img src="../images/back.gif" width="43" height="20" style="cursor:hand" onclick="priviousPage()"/></td>
	                  <td width="50"><img src="../images/next.gif" width="43" height="20" style="cursor:hand" onclick="nextPage()"/></td>
	                  <td width="40"><img src="../images/last.gif" width="33" height="20" style="cursor:hand" onclick="lastPage()"/></td>
	                  <td width="100"><div align="center"><span class="STYLE1">转到第
	                    <input id="inputpage" type="text" size="4" style="height:16px; width:35px; border:1px solid #999999;" /> 
	                    页 </span></div></td>
	                  <td width="40"><img src="../images/go.gif" width="33" height="17" style="cursor:hand" onclick="goPage()"/></td>
	                </tr>
	            </table>
	            </td>
	            </tr>
	            </table>
			</div>
    </div>
    </form>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>
</html>