<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<!-- <link href="../css/select.css" rel="stylesheet" type="text/css" /> -->

<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/select-ui.min.js"></script>

<script type="text/javascript"> 
function confirmMsgDel()
{  
	  var chckBox=document.getElementsByName("checkBox");
	  var num=chckBox.length;
	  var id='';
	  
	  for (var i=0;i<num;i++){
		  if(chckBox[i].checked){
			  id+=chckBox[i].value+",";
		  }
	  }
  if(id!=""){
  	if(confirm("删除用户信息，你确定要删除吗？")){
  		window.location.href="${pageContext.request.contextPath}/learn/Delete?id="+id;
  	}
  }else{
  	alert("请选择要删除的用户");
  }
  window.close();
} 

  function updateLearn(){
	  var chckBox=document.getElementsByName("checkBox");
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
		  window.location.href="${pageContext.request.contextPath}/learn/Updatelearn?id="+id;
	  }
	  window.close();
 }
  function myPage(){
	  var rows=${learnList.rowCount};
	  var size=${learnList.pageSize};
	  var mypage=(rows-(rows%size))/10+1;
	  return mypage;
  }
  //首页
  function firstPage(){
	  document.forms[0].action="${pageContext.request.contextPath}/learn/getLearnListBypage?pageNo=1&pageSize=10";
	  document.forms[0].submit();
	  
  }
  //上一页
  function priviousPage(){
	  var a= ${learnList.pageNo};
	  var pageNow=eval(a);
	  if (pageNow==1){
		  alert("已经是第一页了！");
		  return false;
	  }
	  var pageT=pageNow -1 ;
	  document.forms[0].action="${pageContext.request.contextPath}/learn/getLearnListBypage?pageNo=" + pageT + "&pageSize=10";
	  document.forms[0].submit();
  }
  //下一页
  function nextPage(){
	  var pageNow=eval(${learnList.pageNo});
	 if (pageNow>=(myPage())){
		 alert("已经是最后一页了!");
		 return false;
	 }
	 var pageT=pageNow+1;
	 document.forms[0].action="${pageContext.request.contextPath}/learn/getLearnListBypage?pageNo=" + pageT + "&pageSize=10";
	  document.forms[0].submit();
	 
  }
  //最后一页
  function lastPage(){
	  var pageT=myPage();
	  document.forms[0].action="${pageContext.request.contextPath}/learn/getLearnListBypage?pageNo=" + pageT + "&pageSize=10";
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
	  document.forms[0].action="${pageContext.request.contextPath}/learn/getLearnListBypage?pageNo=" + page + "&pageSize=10";
	  document.forms[0].submit();
  }
//全选
  function seltAll(){
  	  var checkBoxSign=document.getElementById("ckb");
  	  var checkBox=document.getElementsByName("checkBox");
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
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 150			  
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
    <li><a href="#">学习园地管理</a></li>
    </ul>
    </div>
	<form action="${pageContext.request.contextPath}/learn/getLearnListBypage?pageNo=1&pageSize=10" method="post">
	<div class="formbody">
    <ul class="seachform">
    <li><label>名称</label><input name="l_name" type="text" class="scinput" value="${users.l_name}" /></li>
    <li><label>类型</label>  
    <div class="vocation">
    <select name="l_type" style="height:35px;position:relative;left:30px;top:-32px;border:1px solid #d4d7d9;" >
    <option value="0">请选择</option>
    <option value="1">规章制度</option>
    <option value="2">学习培训材料</option>
    <option value="3">资格岗位考试教程</option>
    <option value="4">客户营销技巧</option>
    </select>
    </div>
    </li>
    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
    </ul>
	</div>

    <div class="rightinfo">
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="${pageContext.request.contextPath}/view/study/StudyAdd.jsp"><span><img src="../images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:updateLearn()"><span><img src="../images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:confirmMsgDel()" ><span><img src="../images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>
	    <table class="tablelist">
		    	<tr class="tablehead">
		    	<td colspan="11">客户信息列表</td>
		    	
		    	</tr>
		    	<tr>
		        <th><input name="" id="ckb" type="checkbox" value="" onClick="seltAll()"/></th>
		        <th>名称</th>
		        <th>类型</th>
		        <th>描述</th>
		        <th>上传时间</th>
		        <th>下载</th>
		        <th>上传人</th>
		        </tr>
		        
		   <c:if test="${empty learnList}">
				<tr>
					<td colspan="11" align="center"><font color="red">您检索的信息不存在！</font></td>
				</tr>
			</c:if>
			<c:if test="${not  empty learnList}">
			<c:forEach var="learn" items="${learnList.list}">
				<tr>
					<td><input type="checkbox" id="ckb" name="checkBox" value="${learn.l_key} "></td>
					<td>${learn.l_name}</td>
					
					<td><c:forEach var="item" items="${typeList }">
							<c:if test="${item.lt_id==learn.l_type }">
								${item.lt_name }
							</c:if>
						</c:forEach>
					</td>
					<td>${learn.l_des}</td>
					<td>${learn.l_date}</td>
					<td><a href="${pageContext.request.contextPath}/learn/down?fileName=${learn.l_url}" >${learn.l_url}</a></td>
					<td>${learn.l_uper}</td>	
				</tr>
			</c:forEach>
	       </c:if>
			
	    </table>
		   <div class="pagin">
	 		<table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td class="STYLE4"><div class="message">共<i class="blue">${learnList.rowCount}</i>条记录，当前显示第&nbsp;<i class="blue">${learnList.pageNo}&nbsp;</i>页</div>
	           </td>
	            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
	                <tr>
	                  <td width="45"><img src="../images/first.gif" width="33" height="20" style="cursor:hand" onclick="firstPage()"/></td>
	                  <td width="50"><img src="../images/back.gif" width="43" height="20" style="cursor:hand" onclick="priviousPage()"/></td>
	                  <td width="50"><img src="../images/next.gif" width="43" height="20" style="cursor:hand" onclick="nextPage()"/></td>
	                  <td width="40"><img src="../images/last.gif" width="33" height="20" style="cursor:hand" onclick="lastPage()"/></td>
	                  <td width="100"><div align="center"><span class="STYLE1">转到第
	                    <input name="inputpage" id="inputpage" type="text" size="4" style="height:16px; width:35px; border:1px solid #999999;" /> 
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
