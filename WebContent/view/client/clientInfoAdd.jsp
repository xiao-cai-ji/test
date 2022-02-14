<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
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
function repeatCmId(obj){
	  	var all = ${allCmId};

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
	  		for(var i = 0; i < num; i++){
	  			
	  			if(obj.value==all[i]){
	  				$('#id_err').text("该用户已存在，请重新输入！");
	  				$('#id_err').attr("style", "display:inline;color:#FF0000");
	  				return false;
	  			}
	  		}
				
  				
	  	}
	  	$('#id_err').attr("style", "display:none;color:#FF0000");
		return true;

	  }

</script>

</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="clientMgr.html">客户经理信息综合管理维护</a></li>
    <li><a href="clientMgrAdd.html">添加</a></li>
    </ul>
    </div>

    <form action="${pageContext.request.contextPath }/client/ClientAddPost" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>客户经理基本信息</span></div>
    
    <ul class="forminfo">
  <li><label>客户经理编号</label><input id="cm_id" name="cm_id" type="text" class="dfinput"  onblur="repeatCmId(this)"/>&nbsp;&nbsp;<span id="id_err"></span> </li>
    <li><label>姓名</label><input id="cm_name" name="cm_name" type="text" class="dfinput" value=""  onblur="javascript:checkName()"/><em id="cName"></em>	 </li>
    <li><label>性别</label><cite><input id="cm_sex" name="cm_sex" type="radio" value="男" checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;
    							 <input id="cm_sex" name="cm_sex" type="radio" value="女" />女</cite></li>
    <li><label>身份证号</label><input  id="cm_ssn" name="cm_ssn" type="text" class="dfinput" value="" onblur="javascript:checkSsn()"/><em id="cSsn"></em></li>
    <li><label>出生年月</label><input readonly="readonly" id="cm_birthday" name="cm_birthday" type="text" class="dfinput"  value=""/></li>
    <li><label>年龄</label><input readonly="readonly" id="cm_age" name="cm_age" type="text" class="dfinput"  value=""/></li>
    <li><label>民族</label><cite>
    	<select class="select1" name="cm_nation">
		    <option value="">请选择</option>
		    <c:forEach items="${nations}" var="nation">
		    	<option value="${nation.nation_id}">${nation.nation_name}</option>
		    </c:forEach>
	    </select></cite>
	</li>
    <li><label>政治面貌</label><cite><select class="dfselect" name="cm_political_landscape"><option value="0">请选择</option>
    <option value="中共党员" >中共党员</option>
    <option value="中共预备党员">中共预备党员</option>
    <option value="共青团员">共青团员</option>
    <option value="群众">群众</option>
    <option value="其他">其他</option></select></cite></li>
    <li><label>籍贯</label><input name="cm_hometown" type="text" class="dfinput"  value=""/></li>
    <li><label>照片</label><input name="file" type="file" class="dfselect1"/></li>
    <li><label>学历</label><cite><select class="dfselect1" name="cm_education"><option value="0">请选择</option><option value="小学">小学</option>
    <option value="初中">初中</option>
    <option value="高中">高中</option>
    <option value="中专">中专</option>
    <option value="高职">高职</option>
    <option value="专科">专科</option>
    <option value="本科">本科</option>
    <option value="硕士研究生" >硕士研究生</option>
    <option value="博士研究生">博士研究生</option
    ></select></cite></li>
    <li><label>学位</label><cite><select class="dfselect" name="cm_degree"><option value="0">请选择</option>
    <option value="学士">学士</option>
    <option value="硕士">硕士</option>
    <option value="博士">博士</option>
    <option value="其他">其他</option>
    </select></cite></li>
    <li><label>毕业院校及专业</label><input name="cm_graduated" type="text" class="dfinput"  value=""/></li>
    <li><label>专业技术职称</label><div class="vocation" >
				  <select class="dfselect1" name="cm_professional_titles">
		            <option value="0">请选择</option>
		            <option value="工程专业技术人员 高级工程师">工程专业技术人员 高级工程师</option>
		            <option value="工程专业技术人员 工程师">工程专业技术人员 工程师</option>
		            <option value="工程专业技术人员 助理工程师">工程专业技术人员 助理工程师</option>
		            <option value="经济专业技术人员 高级经济师">经济专业技术人员 高级经济师</option>
		            <option value="经济专业技术人员 经济师">经济专业技术人员 经济师</option>
		            <option value="经济专业技术人员 助理经济师">经济专业技术人员 助理经济师</option>
		            <option value="会计专业技术人员 高级会计师">会计专业技术人员 高级会计师</option>
		            <option value="会计专业技术人员 会计师">会计专业技术人员 会计师</option>
		            <option value="会计专业技术人员 助理会计师">会计专业技术人员 助理会计师</option>
		            <option value="统计专业技术人员 高级统计师">统计专业技术人员 高级统计师</option>
		            <option value="统计专业技术人员 统计师">统计专业技术人员 统计师</option>
		            <option value="统计专业技术人员 助理统计师">统计专业技术人员 助理统计师</option>
		            <option value="审计专业技术人员 高级审计师">审计专业技术人员 高级审计师</option>
		            <option value="审计专业技术人员 审计师">审计专业技术人员 审计师</option>
		            <option value="审计专业技术人员 助理审计师">审计专业技术人员 助理审计师</option>
		            <option value="政工专业技术人员 助理政工师">政工专业技术人员 助理政工师</option>
		            <option value="政工专业技术人员 高级政工师">政工专业技术人员 高级政工师</option>
		            <option value="政工专业技术人员 政工师">政工专业技术人员 政工师</option>
		           </select></div></li>
    <li><label>客户经理等级</label><cite><select class="dfselect1" name="cm_level">
		            <option value="0">请选择</option>
		            <option value="高级专家级客户经理">高级专家级客户经理</option>
		            <option value="专家级客户经理">专家级客户经理</option>
		            <option value="资深客户经理">资深客户经理</option>
		            <option value="高级客户经理">高级客户经理</option>
		            <option value="客户经理">客户经理</option>
		            <option value="客户经理助理">客户经理助理</option>
		            <option value="无">无</option>
		          </select></cite></li>
		           
    <li><label>所在单位</label><input name="cm_unit" type="text" class="dfinput"  value=""/></li>
    <li><label>部门</label><input name="cm_dept" type="text" class="dfinput"  value=""/></li>
    <li><label>职务</label><input name="cm_position" type="text" class="dfinput"  value=""/></li>
    <li><label>参加工作时间</label><input name="cm_hiredate" type="date" class="dfinput"  value=""/></li>
    <li><label>入行时间</label><input name="cm_entry_time" type="date" class="dfinput"  value=""/></li>
    <li><label>从事金融工作年限</label><input  id="cm_financial_years" name="cm_financial_years" type="text" class="dfinput"  value="" onblur="checkWorkingYears()"/><em id="cFinancial_years"></em></li>
    <li><label>客户经理从业年限</label><input id="cm_working_years" name="cm_working_years" type="text" class="dfinput"  value="" onblur="checkWorkingYears()"/><em id="cWorking_years"></em></li>
    <li><label>退出时间</label><input name="cm_exit_time" type="date" class="dfinput"  value=""/></li>
    <li><label>办公电话</label><input id="cm_tel" name="cm_tel" type="text" class="dfinput"  value=""  onblur="checkTel()" /><em id="cTel"></em></li>
    <li><label>手机</label><input id="cm_mobile" name="cm_mobile" type="text" class="dfinput"  value=""  onblur="checkMobile()"/><em id="cMobile"></em></li>

    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="重置"/></li>
    </ul>
    
    </div>
    </form>
</body>

</html>
