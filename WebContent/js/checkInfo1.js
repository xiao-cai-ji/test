
   //姓名的校验
	function checkName(){
		var cm_name=document.getElementById("cm_name").value;
		if(cm_name==""){
			 var findNodes = document.getElementById("cName").children;
	         if(findNodes.length==0){
	             var addspan = document.createElement("span");
	             addspan.innerHTML="*姓名不允许为空*";
	             addspan.style.color="red";
	             //把该节点加入到某个节点的子节点下
	             document.getElementById("cName").appendChild(addspan);
	             return false;
	         }   
		}
		if(!isNaN(cm_name)){
			 var findNodes = document.getElementById("cName").children;
	         var addspan = document.createElement("span");
	         addspan.innerHTML="*姓名不允许为数字*";
	         addspan.style.color="red";
	         //把该节点加入到某个节点的子节点下
	         document.getElementById("cName").appendChild(addspan);
	         return false;
		}else{
			document.getElementById("cName").style.display = "none";
		}
	}
	
	//身份证的校验,填写完成自动填写出生年月,年龄
	function checkSsn(){
		var cm_ssn=document.getElementById("cm_ssn").value;
		let reg = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
		if(cm_ssn==""){
			var findNodes = document.getElementById("cSsn").children;
		        if(findNodes.length==0){
			        var addspan = document.createElement("span");
			        addspan.innerHTML="*身份证号不允许为空*";
			        addspan.style.color="red";
			        //把该节点加入到某个节点的子节点下
			        document.getElementById("cSsn").appendChild(addspan);
			        return false;
		        }   
		}
		if(!reg.test(cm_ssn)){
			var findNodes = document.getElementById("cSsn").children;
	        var addspan = document.createElement("span");
	        addspan.innerHTML="*请输入正确的身份证号*";
	        addspan.style.color="red";
	        //把该节点加入到某个节点的子节点下
	        document.getElementById("cSsn").appendChild(addspan);
	        document.getElementById("cSsn").value='';
	        return false;  
		}else{
			document.getElementById("cSsn").style.display = "none";
		}
		if(cm_ssn!=""){
			var bir=cm_ssn.substring(6,10) + "-" + cm_ssn.substring(10,12) + "-" + cm_ssn.substring(12,14);
			document.getElementById("cm_birthday").value= bir;
			
			//获取当前年月日并计算年龄
			var yearBirth = cm_ssn.substring(6,10);
		    var monthBirth = cm_ssn.substring(10,12);
		   	var dayBirth = cm_ssn.substring(12,14);
		    var myDate = new Date();
		    var monthNow = myDate.getMonth() + 1;
		    var dayNow = myDate.getDay();
		    var age = myDate.getFullYear() - yearBirth;
		    if(monthNow < monthBirth || (monthNow == monthBirth && dayNow < dayBirth)){
		        age--;
		    }
		    document.getElementById("cm_age").value= age;
		   	// 获取性别
		    var sexStr = '';
		    if (parseInt(cm_ssn.slice(-2, -1)) % 2 == 1) {
		        sexStr = '男';
		    }
		    else {
		        sexStr = '女';
		    }
		    var sex = document.getElementsByName("cm_sex");
            for(var i = 0;i < sex.length;i++){
                if(sex[i].value == sexStr){
                	sex[i].checked =  'checked';
                }
            }
		}
	}

	//从业年限的校验
	function checkWorkingYears(){
		var cm_financial_years=document.getElementById("cm_financial_years").value;
		if(isNaN(cm_financial_years)){
			 var findNodes = document.getElementById("cFinancial_years").children;
	         var addspan = document.createElement("span");
	         addspan.innerHTML="*从业年限仅允许为数字*";
	         addspan.style.color="red";
	         //把该节点加入到某个节点的子节点下
	         document.getElementById("cFinancial_years").appendChild(addspan);
	         document.getElementById("cm_financial_years").value='';
	         return false;
		}else{
			document.getElementById("cFinancial_years").style.display = "none";
		}
		
		var cm_working_years=document.getElementById("cm_working_years").value;
		if(isNaN(cm_working_years)){
			var findNodes = document.getElementById("cWorking_years").children;
	         var addspan = document.createElement("span");
	         addspan.innerHTML="*从业年限仅允许为数字*";
	         addspan.style.color="red";
	         //把该节点加入到某个节点的子节点下
	         document.getElementById("cWorking_years").appendChild(addspan);
	         document.getElementById("cm_working_years").value='';
	         return false;
		}else{
			document.getElementById("cWorking_years").style.display = "none";
		}
	}
	
	//办公电话的校验
	 /*校验固定电话号 区号是以0开头的3位/4位的数字，电话号码是7位/8位的数字*/
	function checkTel(){
		var cm_tel=document.getElementById("cm_tel").value;
		
		var reg = /^0\d{2,3}-?\d{7,8}$/;//“0”表示以0开头的区号，后面跟2-3位，电话号码7-8位；“-”表示用户在符合条件处可以输入“-”；“\d”表示纯数字；“$”表示结束。 
		if(!reg.test(cm_tel)){
			var findNodes = document.getElementById("cTel").children;
	        var addspan = document.createElement("span");
	        addspan.innerHTML="*请输入正确的办公电话*";
	        addspan.style.color="red";
	        //把该节点加入到某个节点的子节点下
	        document.getElementById("cTel").appendChild(addspan);
	        document.getElementById("cm_tel").value='';
	        return false; 
	 }else{
			document.getElementById("cTel").style.display = "none";
		}
		
	}
	
	//移动电话的校验
	function checkMobile(){
		var cm_mobile=document.getElementById("cm_mobile").value;
		 if(!(/^1[34578]\d{9}$/.test(cm_mobile))){
			 var findNodes = document.getElementById("cMobile").children;
		     var addspan = document.createElement("span");
		     addspan.innerHTML="*请输入正确的移动电话*";
		     addspan.style.color="red";
		     //把该节点加入到某个节点的子节点下
		     document.getElementById("cMobile").appendChild(addspan);
		     document.getElementById('cm_mobile').value = '';
		     return false; 
		 }else{
				document.getElementById("cMobile").style.display = "none";
			}
		
		
	}
	
	
	//总体校验
	function checkAll(){
		checkId()
		checkName();
		checkSsn();
		checkWorkingYears();
		checkTel();
		checkMobile();
	}
	
	
	