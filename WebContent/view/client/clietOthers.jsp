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
<script type="text/javascript" src="../js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="../js/select-ui.min.js"></script>
<script type="text/javascript" src="../editor/kindeditor.js"></script>
<script type="text/javascript">
function oWorkPerformDel()
{  
	  var chckBox=document.getElementsByName("checkBox");
	  var num=chckBox.length;
	  var cm_key='';
	  
	  for (var i=0;i<num;i++){
		  if(chckBox[i].checked){
			  cm_key+=chckBox[i].value+",";
		  }
	  }
  if(cm_key!=""){
  	if(confirm("删除用户信息，你确定要删除吗？")){
  		window.location.href="${pageContext.request.contextPath}/cert/Delete?cm_key="+cm_key;
  	}
  }else{
  	alert("请选择要删除的用户");
  }
  window.close();
} 
</script>
<script type="text/javascript"> 
  function myPage(){
	  var rows=${CertList.rowCount};
	  var size=${CertList.pageSize};
	  var mypage=(rows-(rows%size))/10+1;
	  return mypage;
  }
  //首页
  function firstPage(){
	  document.forms[0].action="${pageContext.request.contextPath}/cert/getCertListBypage?pageNo=1&pageSize=10";
	  document.forms[0].submit();
	  
  }
  //上一页
  function priviousPage(){
	  var a= ${CertList.pageNo};
	  var pageNow=eval(a);
	  if (pageNow==1){
		  alert("已经是第一页了！");
		  return false;
	  }
	  var pageT=pageNow -1 ;
	  document.forms[0].action="${pageContext.request.contextPath}/cert/getCertListBypage?pageNo=" + pageT + "&pageSize=10";
	  document.forms[0].submit();
  }
  //下一页
  function nextPage(){
	  var pageNow=eval(${CertList.pageNo});
	 if (pageNow>=(myPage())){
		 alert("已经是最后一页了!");
		 return false;
	 }
	 var pageT=pageNow+1;
	 document.forms[0].action="${pageContext.request.contextPath}/cert/getCertListBypage?pageNo=" + pageT + "&pageSize=10";
	  document.forms[0].submit();
	 
  }
  //最后一页
  function lastPage(){
	  var pageT=myPage();
	  document.forms[0].action="${pageContext.request.contextPath}/cert/getCertListBypage?pageNo=" + pageT + "&pageSize=10";
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
	  document.forms[0].action="${pageContext.request.contextPath}/cert/getCertListBypage?pageNo=" + page + "&pageSize=10";
	  document.forms[0].submit();
  }


</script>

<script type="text/javascript">
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
function repeatCmId(obj){
	  	var all = ${allCmId};
	  	//alert(all);
	  	var num = ${allCmId.size()};
	  	if(obj.value==""){
	  		$('#id_err').text("用户编号不准为空！");
	  		$('#id_err').attr("style", "display:inline;color:#FF0000");
	  		return false;
	  	}else if(isNaN(obj.value)){
	  		$('#id_err').text("用户编号应为整数！");
	  		$('#id_err').attr("style", "display:inline;color:#FF0000");
	  		return false;
	  	}else {
	  		var flag = 0;
	  		for(var i = 0; i < num; i++){
	  			
	  			if(obj.value==all[i]){
	  				flag=1;
	  				break;
	  			}
	  		}
	  		if(flag==0){
				$('#id_err').text("该用户不存在，请重新输入！");
  				$('#id_err').attr("style", "display:inline;color:#FF0000");
  				return false;
	  		}
	  	}
	  	$('#id_err').attr("style", "display:none;color:#FF0000");
		return true;

	  }

</script>


<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 260			  
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
    <li><a href="#">客户经理辅助信息维护</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1">年度工作业绩</a></li> 
    <li><a href="#tab2" class="selected">证照列表</a></li> 
    <li><a href="#tab3">奖惩记录</a></li> 
    <li><a href="#tab4">考核记录</a></li> 
    <li><a href="#tab5">学习培训记录</a></li> 
    <li><a href="#tab6">等级认定记录</a></li> 
    <li><a href="#tab7">工作经历</a></li> 
  	</ul>
    </div>
    
    <!--年度工作业绩  -->
  	<div id="tab1" class="tabson">
	    <ul class="seachform">
		    <li><label>客户经理编号</label><input name="" type="text" class="scinput" /></li>
		    <li><label>工作年度</label><input name="" type="text" class="scinput" /></li>
		    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询"/></li>
	    </ul>
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="javascript:openWindow(1)"><span><img src="../images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:openWindow(2)"><span><img src="../images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:oWorkPerformDel()" ><span><img src="../images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>

	    <table class="tablelist">
	    	<thead>
		    	<tr class="tablehead"><td colspan="10">年度工作业绩</td></tr>
		   	</thead>
	    	<thead>
	    	<tr>
	        <th><input name="" type="checkbox" value=""/></th>
	        <th>姓名</th>
	        <th>工作年度</th>
	        <th>工作业绩</th>
	        <th>维护日期</th>
	        <th>维护人</th>
	        </tr>
	        </thead>
	        <tbody>
	        <tr>
	        <td><input name="" type="checkbox" value="" /></td>
	        <td>Tom</td>
	        <td>2016</td>
	        <td>优</td>
	        <td>2016-04-09</td>
	        <td>admin</td>
	        </tr> 
	        
	        <tr>
	        <td><input name="" type="checkbox" value="" /></td>
	        <td>Tom</td>
	        <td>2015</td>
	        <td>良</td>
	        <td>2015-04-09</td>
	        <td>admin</td>
	        </tr> 
	        </tbody>
	    </table>
	</div>  
     
    <!--证件列表  -->
  	<div id="tab2" class="tabson">
  	<form action="${pageContext.request.contextPath}/cert/getCertListBypage?pageNo=1&pageSize=10" method="post">
	    <ul class="seachform">
		    <li><label>客户经理编号</label><input name="cm_id" type="text" class="scinput" value="${cm_id}"/></li>
		    <li><label>工作年度</label><input name="cm_year" type="text" class="scinput" value="${cm_year}"/></li>
		    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
	    </ul>
	  
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="javascript:openWindow(3)"><span><img src="../images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:openWindow(4)"><span><img src="../images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:oWorkPerformDel()" ><span><img src="../images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>
 	</form>
	    <table class="tablelist">

		    	<tr class="tablehead"><td colspan="12">证照列表</td></tr>
		   	
	    	
	    	<tr>
	        <th><input name="" id="ckb" type="checkbox" value="" onClick="seltAll()"/></th>
	        <th>姓名</th>
	        <th>证书名称</th>
	        <th>证书类型</th>
	        <th>证书编号</th>
	        <th>发证单位</th>
	        <th>发证时间</th>
	        <th>失效时间</th>
	        <th>有效性</th>
	        <th>作废标识</th>
	        <th>维护日期</th>
	        <th>维护人</th>
	        </tr>
	      <c:if test="${empty CertList}">
				<tr>
					<td colspan="11" align="center"><font color="red">您检索的信息不存在！</font></td>
		  </tr>
		  </c:if>
		  <c:if test="${not  empty CertList}">
			<c:forEach var="certificate" items="${CertList.list}">
				<tr>
					<td><input type="checkbox" id="ckb" name="checkBox" id="cm_key"  value="${certificate.cm_key} "></td>
					<td>
					<c:forEach items="${client}" var="client">
						<c:if test="${client.cm_id==certificate.cm_id}">
							${client.cm_name}
						</c:if>
					</c:forEach>
					</td>
					<td>${certificate.cm_certificate_name}</td>
					<td>
						<c:if test="${certificate.cm_certificate_type==0}">从业资格证书</c:if>
						<c:if test="${certificate.cm_certificate_type==1}">岗位证书</c:if>
						<c:if test="${certificate.cm_certificate_type==2}">等级资格证书</c:if>
					</td>
					
					<td>${certificate.cm_certificate_no}</td>
					<td>${certificate.cm_certificate_unit}</td>
					<td>${certificate.cm_start_date}</td>
					<td>${certificate.cm_end_date}</td>	
					<td><c:if test="${certificate.cm_period==1}">有效</c:if>
					<c:if test="${certificate.cm_period==2}">无效</c:if></td>
					<td>${certificate.cm_invalid}</td>	
					<td>${certificate.cm_modification_date}</td>
					<td>${certificate.cm_modification_person}</td>
					<td>
			</c:forEach>
	       </c:if>
	  
	    </table>
	     <div class="pagin">
	 		<table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td class="STYLE4"><div class="message">共<i class="blue">${CertList.rowCount}</i>条记录，当前显示第&nbsp;<i class="blue">${CertList.pageNo}&nbsp;</i>页</div>
	           </td>
	            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
	                <tr>
	                  <td width="45"><img src="../images/first.gif" width="33" height="20" style="cursor:hand" onclick="firstPage()"/></td>
	                  <td width="50"><img src="../images/back.gif" width="43" height="20" style="cursor:hand" onclick="priviousPage()"/></td>
	                  <td width="50"><img src="../images/next.gif" width="43" height="20" style="cursor:hand" onclick="nextPage()"/></td>
	                  <td width="40"><img src="../images/last.gif" width="33" height="20" style="cursor:hand" onclick="lastPage()"/></td>
	                  <td width="100"><div align="center"><span class="STYLE1">转到第
	                    <input id="inputpage"name="inputpage" type="text" size="4" style="height:16px; width:35px; border:1px solid #999999;" /> 
	                    页 </span></div></td>
	                  <td width="40"><img src="../images/go.gif" width="33" height="17" style="cursor:hand" onclick="goPage()"/></td>
	                </tr>
	            </table>
	            </td>
	            </tr>
	            </table>
			</div>
	</div> 
    <!--奖惩记录  -->
  	<div id="tab3" class="tabson">
	    <ul class="seachform">
		    <li><label>客户经理编号</label><input name="" type="text" class="scinput" /></li>
		    <li><label>奖惩分类</label><input name="" type="text" class="scinput" /></li>
		    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询"/></li>
	    </ul>

	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="javascript:openWindow(5)"><span><img src="../images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:openWindow(6)"><span><img src="../images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:oWorkPerformDel()" ><span><img src="../images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>

	    <table class="tablelist">
	    	<thead>
		    	<tr class="tablehead"><td colspan="12">奖惩记录</td></tr>
		   	</thead>
	    	<thead>
	    	<tr>
	        <th><input name="" type="checkbox" value=""/></th>
	        <th>姓名</th>
	        <th>奖惩分类</th>
	        <th>奖惩内容</th>
	        <th>生效日期</th>
	        <th>审批单位</th>
	        <th>审批人</th>
	        <th>撤销日期</th>
	        <th>撤销原因</th>
	        <th>附件依据</th>
	        <th>维护日期</th>
	        <th>维护人</th>
	        </tr>
	        </thead>
	        <tbody>
	        <tr>
	        <td><input name="" type="checkbox" value="" /></td>
	        <td>Tom</td>
	        <td>优秀员工</td>
	        <td>现金5000元</td>
	        <td>2016-01-01</td>
	        <td>贵州省分公司</td>
	        <td>admin</td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td>2016-04-09</td>
	        <td>admin</td>
	        </tr> 
	        
	        </tbody>
	    </table>
	</div> 

    <!--考核记录  -->
  	<div id="tab4" class="tabson">
	    <ul class="seachform">
		    <li><label>客户经理编号</label><input name="" type="text" class="scinput" /></li>
		    <li><label>考核时间</label><input name="" type="text" class="scinput" /></li>
		    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询"/></li>
	    </ul>
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="javascript:openWindow(7)"><span><img src="../images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:openWindow(8)"><span><img src="../images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:oWorkPerformDel()" ><span><img src="../images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>

	    <table class="tablelist">
	    	<thead>
		    	<tr class="tablehead"><td colspan="12">考核记录</td></tr>
		   	</thead>
	    	<thead>
	    	<tr>
	        <th><input name="" type="checkbox" value=""/></th>
	        <th>姓名</th>
	        <th>考核时间</th>
	        <th>考核内容</th>
	        <th>考核结果</th>
	        <th>考核评价</th>
	        <th>考核单位</th>
	        <th>维护日期</th>
	        <th>维护人</th>
	        </tr>
	        </thead>
	        <tbody>
	        <tr>
	        <td><input name="" type="checkbox" value="" /></td>
	        <td>Tom</td>
	        <td>2016-01-01</td>
	        <td>工作业绩</td>
	        <td>S</td>
	        <td>表现良好</td>
	        <td>贵州省分公司</td>
	        <td>2016-04-09</td>
	        <td>admin</td>
	        </tr> 
	        
	        </tbody>
	    </table>
	</div> 

    <!--学员培训记录  -->
  	<div id="tab5" class="tabson">
	    <ul class="seachform">
		    <li><label>客户经理编号</label><input name="" type="text" class="scinput" /></li>
		    <li><label>培训时间</label><input name="" type="text" class="scinput" /></li>
		    <li><label>科目</label><input name="" type="text" class="scinput" /></li>
		    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询"/></li>
	    </ul>
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="javascript:openWindow(9)"><span><img src="../images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:openWindow(10)"><span><img src="../images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:oWorkPerformDel()" ><span><img src="../images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>

	    <table class="tablelist">
	    	<thead>
		    	<tr class="tablehead"><td colspan="14">学员培训记录</td></tr>
		   	</thead>
	    	<thead>
	    	<tr>
	        <th><input name="" type="checkbox" value=""/></th>
	        <th>姓名</th>
	        <th>培训时间</th>
	        <th>科目</th>
	        <th>培训单位</th>
	        <th>开始日期</th>
	        <th>结束日期</th>
	        <th>学时</th>
	        <th>学分</th>
	        <th>成绩</th>
	        <th>附件依据</th>
	        <th>维护日期</th>
	        <th>维护人</th>
	        </tr>
	        </thead>
	        <tbody>
	        <tr>
	        <td><input name="" type="checkbox" value="" /></td>
	        <td>Tom</td>
	        <td>2016-01-01</td>
	        <td>业务流程</td>
	        <td>贵州省分公司</td>
	        <td>2016-01-01</td>
	        <td>2016-01-10</td>
	        <td>10</td>
	        <td>2</td>
	        <td>90</td>
	        <td></td>
	        <td>2016-04-09</td>
	        <td>admin</td>
	        </tr> 
	        
	        </tbody>
	    </table>
	</div> 
    <!--等级认定记录  -->
  	<div id="tab6" class="tabson">
	    <ul class="seachform">
		    <li><label>客户经理编号</label><input name="" type="text" class="scinput" /></li>
		    <li><label>认定时间</label><input name="" type="text" class="scinput" /></li>
		    <li><label>认定级别</label><input name="" type="text" class="scinput" /></li>
		    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询"/></li>
	    </ul>
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="javascript:openWindow(11)"><span><img src="../images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:openWindow(12)"><span><img src="../images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:oWorkPerformDel()" ><span><img src="../images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>

	    <table class="tablelist">
	    	<thead>
		    	<tr class="tablehead"><td colspan="14">等级认定记录</td></tr>
		   	</thead>
	    	<thead>
	    	<tr>
	        <th><input name="" type="checkbox" value=""/></th>
	        <th>姓名</th>
	        <th>认定时间</th>
	        <th>认定级别</th>
	        <th>认定类型</th>
	        <th>附件依据</th>
	        <th>维护日期</th>
	        <th>维护人</th>
	        </tr>
	        </thead>
	        <tbody>
	        <tr>
	        <td><input name="" type="checkbox" value="" /></td>
	        <td>Tom</td>
	        <td>2016-01-01</td>
	        <td>初级会计师</td>
	        <td>初级</td>
	        <td></td>
	        <td>2016-04-09</td>
	        <td>admin</td>
	        </tr> 
	        <tr>
	        <td><input name="" type="checkbox" value="" /></td>
	        <td>Lily</td>
	        <td>2016-01-01</td>
	        <td>高级会计师</td>
	        <td>高级</td>
	        <td></td>
	        <td>2016-04-09</td>
	        <td>admin</td>
	        </tr> 	        
	        </tbody>
	    </table>
	</div> 
    <!--工作经历  -->
  	<div id="tab7" class="tabson">
	    <ul class="seachform">
		    <li><label>客户经理编号</label><input name="" type="text" class="scinput" /></li>
		    <li><label>职务</label><input name="" type="text" class="scinput" /></li>
		    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询"/></li>
	    </ul>
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="javascript:openWindow(13)"><span><img src="../images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:openWindow(14)"><span><img src="../images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:oWorkPerformDel()" ><span><img src="../images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>

	    <table class="tablelist">
	    	<thead>
		    	<tr class="tablehead"><td colspan="14">工作经历</td></tr>
		   	</thead>
	    	<thead>
	    	<tr>
	        <th><input name="" type="checkbox" value=""/></th>
	        <th>姓名</th>
	        <th>任职日期</th>
	        <th>职务</th>
	        <th>单位</th>
	        <th>工作经历</th>
	        <th>附件依据</th>
	        <th>维护日期</th>
	        <th>维护人</th>
	        </tr>
	        </thead>
	        <tbody>
	        <tr>
	        <td><input name="" type="checkbox" value="" /></td>
	        <td>Tom</td>
	        <td>2016-01-01</td>
	        <td>中级客户经理</td>
	        <td>贵州省分公司</td>
	        <td>2010年6月--至今 贵州省分公司</td>
	        <td></td>
	        <td>2016-04-09</td>
	        <td>admin</td>
	        </tr> 
	        <tr>
	        <td><input name="" type="checkbox" value="" /></td>
	        <td>Lily</td>
	        <td>2016-01-01</td>
	        <td>初级客户经理</td>
	        <td>贵州省分公司</td>
	        <td>2013年6月--至今 贵州省分公司</td>
	        <td></td>
	        <td>2016-04-09</td>
	        <td>admin</td>
	        </tr>         
	        </tbody>
	    </table>
	</div> 	   	   
<script language="javascript">
	function openWindow(scanLog) {
		if (scanLog == 1) {
			document.getElementById('light1').style.display = 'block';
		}else if(scanLog == 2){
			document.getElementById('light2').style.display = 'block';
		}else if(scanLog == 3){
			document.getElementById('light3').style.display = 'block';
		}else if(scanLog == 4){
			//定义一个数组
			var cm_keys = [];
			$("input[name='checkBox']:checked").each(function() {
				//将选中的数据存储到数组
				cm_keys.push($(this).val());
			});
			//alert(cm_keys);
			if (cm_keys.length == 0) {
				alert("你还没有选择要修改的资料");
			}else if(cm_keys.length==1){
				$.ajax({
					url:"${pageContext.request.contextPath}/cert/Update",
					type:"POST",//请求方式
					dataType:"json",//预期服务器返回的类型
					scriptCharset:'utf-8',
					data:{//传递的请求参数自动转化为字符串
						cm_key:JSON.stringify(parseInt(cm_keys[0]))				
					},
					//请求发生错误
					error:function(){
						alert("修改失败");
					},
					//请求成功后执行success
					success:function(json){
						$("#cm_key").val(json.cm_key);
						$("#cm_id").val(json.cm_id);
						$("#cm_certificate_name").val(json.cm_certificate_name);
						$("#cm_certificate_type").val(json.cm_certificate_type);
						$("#cm_certificate_no").val(json.cm_certificate_no);
						$("#cm_certificate_unit").val(json.cm_certificate_unit);
						$("#cm_start_date").val(json.cm_start_date);
						$("#cm_end_date").val(json.cm_end_date);
						$("#cm_remark").val(json.cm_remark);
						document.getElementById('light4').style.display = 'block';
					}
				})
			}
		}else if(scanLog == 5){
			document.getElementById('light5').style.display = 'block';
		}else if(scanLog == 6){
			document.getElementById('light6').style.display = 'block';
		}else if(scanLog == 7){
			document.getElementById('light7').style.display = 'block';
		}else if(scanLog == 8){
			document.getElementById('light8').style.display = 'block';
		}else if(scanLog == 9){
			document.getElementById('light9').style.display = 'block';
		}else if(scanLog == 10){
			document.getElementById('light10').style.display = 'block';
		}else if(scanLog == 11){
			document.getElementById('light11').style.display = 'block';
		}else if(scanLog == 12){
			document.getElementById('light12').style.display = 'block';
		}else if(scanLog == 13){
			document.getElementById('light13').style.display = 'block';
		}else if(scanLog == 14){
			document.getElementById('light14').style.display = 'block';
		}
	}
	function closeWindow(id) {
		document.getElementById(id).style.display = 'none';
	}
</script>
<div id="light1" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>添加年度工作业绩</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>工作年度</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>工作业绩</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light1')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light2" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>修改年度工作业绩</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022"/> </li>
    <li><label>工作年度</label><input name="" type="text" class="dfinput" value="2015"/> </li>
    <li><label>工作业绩</label><input name="" type="text" class="dfinput" value="良"/> </li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light2')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light3" class="firstScan_main">
    <form action="${pageContext.request.contextPath}/cert/add" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>添加证件</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="cm_id" type="text" class="dfinput" value="" onblur="repeatCmId(this)"/>&nbsp;&nbsp;<span id="id_err"></span> </li>
    <li><label>证书名称</label><input name="cm_certificate_name" type="text" class="dfinput" value=""/> </li>
    <li><label>证书类型</label>
    		
    		<div class="vocation">
									<select id=cm_certificate_type name="cm_certificate_type" class="select1">
										<option value="">---请选择---</option>
										<c:forEach var="item" items="${findtype}">
											<option value="${item.type_id}">
												${item.type_name}
											</option>
										</c:forEach>
									</select>
								</div></li>
    		
    <li><label>证书编号</label><input name="cm_certificate_no" type="text" class="dfinput" value=""/> </li>
    <li><label>发证单位</label><input name="cm_certificate_unit" type="text" class="dfinput" value=""/> </li>
    <li><label>发证时间</label><input name="cm_start_date" type="date" class="dfinput" value=""/> </li>
    <li><label>失效时间</label><input name="cm_end_date" type="date" class="dfinput" value=""/> </li>
    <li><label>备注</label><input name="cm_remark" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="file" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light3')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light4" class="firstScan_main">
    <form action="${pageContext.request.contextPath}/cert/update" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>修改证件</span></div>
    
     <ul class="forminfo">
     <li><label>key</label><input id="cm_key" readonly="readonly" name="cm_key" type="text" class="dfinput" value="000022"/> </li>
    <li><label>客户经理编号</label><input id="cm_id" name="cm_id" type="text" class="dfinput" value="000022"/> </li>
    <li><label>证书名称</label><input id="cm_certificate_name" name="cm_certificate_name" type="text" class="dfinput" value="工程师"/> </li>
   <li><label>证书类型</label>
								<div class="vocation">
									<select id=cm_certificate_type name="cm_certificate_type" class="select1">
										<option value="">---请选择---</option>
										<c:forEach var="item" items="${findtype}">
											<option value="${item.type_id}"
												<c:if test="${item.type_id == certificateType}" >selected="selected"</c:if>>
												${item.type_name}</option>
										</c:forEach>
									</select>
								</div></li>
    <li><label>证书编号</label><input id="cm_certificate_no" name="cm_certificate_no" type="text" class="dfinput" value="092232008000912"/> </li>
    <li><label>发证单位</label><input id="cm_certificate_unit" name="cm_certificate_unit" type="text" class="dfinput" value="全国计算机中心"/> </li>
    <li><label>发证时间</label><input id="cm_start_date" name="cm_start_date" type="date" class="dfinput" value="2016-04-09"/> </li>
    <li><label>失效时间</label><input id="cm_end_date" name="cm_end_date" type="date" class="dfinput" value=""/> </li>
    <li><label>备注</label><input id="cm_remark" name="cm_remark" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input id="cm_certificate_url" name="file" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light4')"/></li>
    </ul>
    </div>
    </form>
</div>

<div id="light5" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>添加奖惩记录</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>奖惩分类</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>奖惩内容</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>生效日期</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>审批单位</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>审批人</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>撤销日期</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>撤销原因</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>备注</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light5')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light6" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>修改奖惩记录</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022"/> </li>
    <li><label>奖惩分类</label><input name="" type="text" class="dfinput" value="优秀员工"/> </li>
    <li><label>奖惩内容</label><input name="" type="text" class="dfinput" value="现金5000元"/> </li>
    <li><label>生效日期</label><input name="" type="text" class="dfinput" value="2016-01-01"/> </li>
    <li><label>审批单位</label><input name="" type="text" class="dfinput" value="贵州省分公司"/> </li>
    <li><label>审批人</label><input name="" type="text" class="dfinput" value="admin"/> </li>
    <li><label>撤销日期</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>撤销原因</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>备注</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light6')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light7" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>添加考核记录</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>考核时间</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>考核内容</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>考核结果</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>考核评价</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>考核单位</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light7')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light8" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>修改考核记录</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022"/> </li>
    <li><label>考核时间</label><input name="" type="text" class="dfinput" value="2016-01-01"/> </li>
    <li><label>考核内容</label><input name="" type="text" class="dfinput" value="工作业绩"/> </li>
    <li><label>考核结果</label><input name="" type="text" class="dfinput" value="S"/> </li>
    <li><label>考核评价</label><input name="" type="text" class="dfinput" value="表现良好"/> </li>
    <li><label>考核单位</label><input name="" type="text" class="dfinput" value="贵州省分公司"/> </li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light8')"/></li>
    </ul>
    </div>
    </form>
</div>	
<div id="light9" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>添加学习培训记录</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>培训时间</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>科目</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>培训单位</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>开始日期</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>结束日期</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>学时</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>学分</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>成绩</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light9')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light10" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>修改学习培训记录</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022"/> </li>
    <li><label>培训时间</label><input name="" type="text" class="dfinput" value="2016-01-01"/> </li>
    <li><label>科目</label><input name="" type="text" class="dfinput" value="业务流程"/> </li>
    <li><label>培训单位</label><input name="" type="text" class="dfinput" value="贵州省分公司"/> </li>
    <li><label>开始日期</label><input name="" type="text" class="dfinput" value="2016-01-01"/> </li>
    <li><label>结束日期</label><input name="" type="text" class="dfinput" value="2016-01-10"/> </li>
    <li><label>学时</label><input name="" type="text" class="dfinput" value="10"/> </li>
    <li><label>学分</label><input name="" type="text" class="dfinput" value="2"/> </li>
    <li><label>成绩</label><input name="" type="text" class="dfinput" value="90"/> </li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light10')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light11" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>添加等级认定记录</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>认定时间</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>认定级别</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>认定类型</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light11')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light12" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>修改等级认定记录</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022"/> </li>
    <li><label>认定时间</label><input name="" type="text" class="dfinput" value="2016-01-01"/> </li>
    <li><label>认定级别</label><input name="" type="text" class="dfinput" value="初级会计师"/> </li>
    <li><label>认定类型</label><input name="" type="text" class="dfinput" value="初级"/> </li>
    <li><label>附件上传</label><input name="" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light12')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light13" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>添加工作经历</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>任职日期</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>职务</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>单位</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>工作经历</label><input name="" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light13')"/></li>
    </ul>
    </div>
    </form>
</div> 
<div id="light14" class="firstScan_main">
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>修改工作经历</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="" type="text" class="dfinput" value="000022"/> </li>
    <li><label>任职日期</label><input name="" type="text" class="dfinput" value="2016-01-01"/> </li>
    <li><label>职务</label><input name="" type="text" class="dfinput" value="中级客户经理"/> </li>
    <li><label>单位</label><input name="" type="text" class="dfinput" value="贵州省分公司"/> </li>
    <li><label>工作经历</label><input name="" type="text" class="dfinput" value="2010年6月--至今 贵州省分公司"/> </li>
    <li><label>附件上传</label><input name="" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light14')"/></li>
    </ul>
    </div>
    </form>
</div>   
	</div> 
 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
        
    </div>

</body>

</html>
