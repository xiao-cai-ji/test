<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>修改页面</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/checkInfo1.js"></script>

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
		width : 400	;
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
	<style type="text/css">
		.input{width:260px; height:20px; line-height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df; background:url(../images/inputbg.gif) repeat-x; text-indent:10px;}
		
	</style>

</head>


<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="clientMgr.html">客户经理信息综合管理维护</a></li>
    <li><a href="clientMgrUpdate.html">修改</a></li>
    </ul>
    </div>

    <form  action="${pageContext.request.contextPath}/client/clientUpdateIds" method="post" >
    <div class="formbody">
    <div class="formtitle"><span>客户经理基本信息</span></div>
    
    <ul class="forminfo">
    <li><label>员工号</label><input name="cm_id" type="text" class="dfinput" value="${client.cm_id} " readonly="readonly"/><i>员工号不允许修改</i></li>
    <li><label>姓名</label><input id="cm_name" name="cm_name" type="text" class="dfinput" value="${client.cm_name }" onblur="javascript:checkName()"/> <em id="cName"></em></li>
    <li><label>性别</label><cite>
	    <c:if test="${client.cm_sex =='男' }">
	    	<input name="cm_sex" type="radio" value="男"  checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;
	    	<input name="cm_sex" type="radio" value="女" />女 
	    </c:if>
	    <c:if test="${client.cm_sex =='女' }">
	    	<input name="cm_sex" type="radio" value="男" />男&nbsp;&nbsp;&nbsp;&nbsp;
	    	<input name="cm_sex" type="radio" value="女" checked="checked" />女 
	    </c:if>
    </cite></li>
    <li><label>身份证号</label><input id="cm_ssn" name="cm_ssn" type="text" class="dfinput" value="${client.cm_ssn }" onblur="javascript:checkSsn()"/> <em id="cSsn"></em></li>
    <li><label>出生年月</label><input name="cm_birthday" type="text" class="dfinput"  value="${client.cm_birthday }"/></li>
    <li><label>年龄</label><input name="cm_age" type="text" class="dfinput"  value="${client.cm_age }"/></li>
    <li><label>民族</label><cite>
    	<select class="dfselect" name="cm_nation">
	    	<option value="">请选择</option>
	    	<c:forEach items="${nations }" var="nation">
		    	<option value="${nation.nation_id }"
		    		<c:if test="${ client.cm_nation == nation.nation_id  }"> selected="selected"</c:if> > 
		    		${nation.nation_name }
		    	</option> 
		    </c:forEach>
    	</select></cite></li>
    <li><label>政治面貌</label><cite>
    	<select class="dfselect" name="cm_political_landscape">
    		<option value="">请选择</option>
    		<option value="中共党员" ${client.cm_political_landscape=="中共党员" ? 'selected="selected"':''}>中共党员</option>
    		<option value="中共预备党员" ${client.cm_political_landscape=="中共预备党员" ? 'selected="selected"':''}>中共预备党员</option>
    		<option value="共青团员" ${client.cm_political_landscape=="共青团员" ? 'selected="selected"':''}>共青团员</option>
    		<option value="群众" ${client.cm_political_landscape=="群众" ? 'selected="selected"':''}>群众</option>
    		<option value="其他" ${client.cm_political_landscape=="其他" ? 'selected="selected"':''}>其他</option>
    	</select></cite></li>
    <li><label>籍贯</label><input name="cm_hometown" type="text" class="dfinput"  value="${client.cm_hometown }"/></li>
    <li><label>照片</label><input name="cm_photo" type="file" class="dfselect1"/></li>
    <li><label>学历</label><cite>
	    <select class="dfselect1" name="cm_education">
		    <option value="">请选择</option>
		    <option value="小学" ${client.cm_education=="小学" ? 'selected="selected"':''}>小学</option>
			<option value="初中" ${client.cm_education=="初中" ? 'selected="selected"':''}>初中</option>
			<option value="高中" ${client.cm_education=="高中" ? 'selected="selected"':''}>高中</option>
			<option value="中专" ${client.cm_education=="中专" ? 'selected="selected"':''}>中专</option>
			<option value="高职" ${client.cm_education=="高职" ? 'selected="selected"':''}>高职</option>
			<option value="专科" ${client.cm_education=="专科" ? 'selected="selected"':''}>专科</option>
			<option value="本科" ${client.cm_education=="本科" ? 'selected="selected"':''}>本科</option>
			<option value="硕士研究生" ${client.cm_education=="硕士研究生" ? 'selected="selected"':''}>硕士研究生</option>
			<option value="博士研究生" ${client.cm_education=="博士研究生" ? 'selected="selected"':''}>博士研究生</option>
		</select></cite></li>
    <li><label>学位</label><cite>
	    <select class="dfselect" name="cm_degree">
		    <option value="">请选择</option>
		   <option value="学士" ${client.cm_degree=="学士" ? 'selected="selected"':''}>学士</option>
		    <option value="硕士" ${client.cm_degree=="硕士" ? 'selected="selected"':''}> 硕士</option>
		    <option value="博士" ${client.cm_degree=="博士" ? 'selected="selected"':''}>博士</option>
		    <option value="其他" ${client.cm_degree=="其他" ? 'selected="selected"':''}>其他</option>
	    </select></cite></li>
    <li><label>毕业院校及专业</label><input name="cm_graduated" type="text" class="dfinput"  value="${client.cm_graduated }"/></li>
    <li><label>专业技术职称</label><div class="vocation">
			<select class="dfselect1" name="cm_professional_titles">
		            <option value="">请选择</option>
		             <option value="工程专业技术人员 高级工程师"  ${client.cm_professional_titles=="工程专业技术人员 高级工程师" ? 'selected="selected"':''}>工程专业技术人员 高级工程师</option>
		            <option value="工程专业技术人员 工程师"  ${client.cm_professional_titles=="工程专业技术人员 工程师" ? 'selected="selected"':''}>工程专业技术人员 工程师</option>
		            <option value="工程专业技术人员 助理工程师"  ${client.cm_professional_titles=="工程专业技术人员 助理工程师" ? 'selected="selected"':''}>工程专业技术人员 助理工程师</option>
		            <option value="经济专业技术人员 高级经济师"  ${client.cm_professional_titles=="经济专业技术人员 高级经济师" ? 'selected="selected"':''}>经济专业技术人员 高级经济师</option>
		            <option value="经济专业技术人员 经济师"  ${client.cm_professional_titles=="经济专业技术人员 经济师" ? 'selected="selected"':''}>经济专业技术人员 经济师</option>
		            <option value="经济专业技术人员 助理经济师"  ${client.cm_professional_titles=="经济专业技术人员 助理经济师" ? 'selected="selected"':''}>经济专业技术人员 助理经济师</option>
		            <option value="会计专业技术人员 高级会计师"  ${client.cm_professional_titles=="会计专业技术人员 高级会计师" ? 'selected="selected"':''}>会计专业技术人员 高级会计师</option>
		            <option value="会计专业技术人员 会计师"  ${client.cm_professional_titles=="会计专业技术人员 会计师" ? 'selected="selected"':''}>会计专业技术人员 会计师</option>
		            <option value="会计专业技术人员 助理会计师"  ${client.cm_professional_titles=="会计专业技术人员 助理会计师" ? 'selected="selected"':''}>会计专业技术人员 助理会计师</option>
		            <option value="统计专业技术人员 高级统计师"  ${client.cm_professional_titles=="统计专业技术人员 高级统计师" ? 'selected="selected"':''}>统计专业技术人员 高级统计师</option>
		            <option value="统计专业技术人员 统计师"  ${client.cm_professional_titles=="统计专业技术人员 统计师" ? 'selected="selected"':''}>统计专业技术人员 统计师</option>
		            <option value="统计专业技术人员 助理统计师"  ${client.cm_professional_titles=="统计专业技术人员 助理统计师" ? 'selected="selected"':''}>统计专业技术人员 助理统计师</option>
		            <option value="审计专业技术人员 高级审计师"  ${client.cm_professional_titles=="审计专业技术人员 高级审计师" ? 'selected="selected"':''}>审计专业技术人员 高级审计师</option>
		            <option value="审计专业技术人员 审计师"  ${client.cm_professional_titles=="审计专业技术人员 审计师" ? 'selected="selected"':''}>审计专业技术人员 审计师</option>
		            <option value="审计专业技术人员 助理审计师"  ${client.cm_professional_titles=="审计专业技术人员 助理审计师" ? 'selected="selected"':''}>审计专业技术人员 助理审计师</option>
		            <option value="政工专业技术人员 助理政工师"  ${client.cm_professional_titles=="政工专业技术人员 助理政工师" ? 'selected="selected"':''}>政工专业技术人员 助理政工师</option>
		            <option value="政工专业技术人员 高级政工师"  ${client.cm_professional_titles=="政工专业技术人员 高级政工师" ? 'selected="selected"':''}>政工专业技术人员 高级政工师</option>
		            <option value="政工专业技术人员 政工师"  ${client.cm_professional_titles=="政工专业技术人员 政工师" ? 'selected="selected"':''}>政工专业技术人员 政工师</option>
		    </select></div></li>
    <li><label>客户经理等级</label><cite>
    		<select class="dfselect1" name="cm_level">
		            <option value="">请选择</option>
		               <option value="高级专家级客户经理" ${client.cm_level=="高级专家级客户经理" ? 'selected="selected"':''}>高级专家级客户经理</option>
		            <option value="专家级客户经理" ${client.cm_level=="专家级客户经理" ? 'selected="selected"':''}>专家级客户经理</option>
		            <option value="资深客户经理" ${client.cm_level=="资深客户经理" ? 'selected="selected"':''}>资深客户经理</option>
		            <option value="高级客户经理" ${client.cm_level=="高级客户经理" ? 'selected="selected"':''}>高级客户经理</option>
		            <option value="客户经理" ${client.cm_level=="客户经理" ? 'selected="selected"':''}>客户经理</option>
		            <option value="客户经理助理" ${client.cm_level=="客户经理助理" ? 'selected="selected"':''}>客户经理助理</option>
		            <option value="其他" ${client.cm_level=="其他" ? 'selected="selected"':''}>其他</option>
		    </select></cite></li>
    <li><label>所在单位</label><input name="cm_unit" type="text" class="dfinput"  value="${client.cm_unit }"/></li>
    <li><label>部门</label><input name="cm_dept" type="text" class="dfinput"  value="${client.cm_dept }"/></li>
    <li><label>职务</label><input name="cm_position" type="text" class="dfinput"  value="${client.cm_position }"/></li>
    <li><label>参加工作时间</label><input name="cm_hiredate" type="text" class="dfinput"  value="${client.cm_hiredate }"/></li>
    <li><label>入行时间</label><input name="cm_entry_time" type="text" class="dfinput"  value="${client.cm_entry_time }"/></li>
    <li><label>从事金融工作年限</label><input id="cm_financial_years" name="cm_financial_years" type="text" class="dfinput"  value="${client.cm_financial_years}" onblur="checkWorkingYears()"/><em id="cFinancial_years"></em></li>
    <li><label>客户经理从业年限</label><input  id="cm_working_years" name="cm_working_years" type="text" class="dfinput"  value="${client.cm_working_years }" onblur="checkWorkingYears()"/><em id="cWorking_years"></em></li>
    <li><label>退出时间</label><input name="cm_exit_time" type="text" class="dfinput"  value="${client.cm_exit_time }" /></li>
    <li><label>办公电话</label><input id="cm_tel" name="cm_tel" type="text" class="dfinput"  value="${client.cm_tel }" onblur="javascript:checkTel()"/><em id="cTel"></em></li>
    <li><label>手机</label><input id="cm_mobile"  name="cm_mobile" type="text" class="dfinput"  value="${client.cm_mobile }" onblur="javascript:checkMobile()"/><em id="cMobile"></em></li>

    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="重置"/></li>
    </ul>
    
    </div>
    </form>
</body>
