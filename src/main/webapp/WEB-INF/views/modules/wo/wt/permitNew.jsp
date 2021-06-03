<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%-- <script type="text/javascript" src="${ctxStatic}/common/editControl.js"></script>
<script type="text/javascript" src="${ctxStatic}/common/actNodeEdit.js?v=<%=System.currentTimeMillis() %>"></script> --%>
<script type="text/javascript">
	window.onload = function()
	{			
		//工作负责人变更时，判断负责人不能和签发人为同一人
		var newWorkLeaderCell = mini.get("woWtLC.nowWorkLeader");
		if(newWorkLeaderCell)
		{
            //mini.get("woWtLC.nowWorkLeader").un("valuechanged")
			mini.get("woWtLC.nowWorkLeader").on("valuechanged",function(e){
				var newWorkLeader = mini.get("woWtLC.nowWorkLeader").getValue();
				if(newWorkLeader)
				{
					var signerCell = mini.get("wtSigner");
					if(signerCell)
					{
						var signerValue = signerCell.getValue();
						if(newWorkLeader == signerValue)
						{
							showMessageBox("提醒","负责人不能和签发人是同一人！","warring");
							mini.get("woWtLC.nowWorkLeader").setValue("");
							mini.get("woWtLC.nowWorkLeader").setText("");
						}
					}
				}
			});
		}
	}
	var myAddCan='${woWt.addCan}';
	var flowSecList = {};
	
	function afterLoad(o){		
		var dutyOrgId = null;
		if(o && o.dutyOrgId)
		{
			dutyOrgId = o.dutyOrgId;
		}        
        var wtType = o.wtType;
		if(wtType=="1"||wtType=="2"){
			specIds = "1";
		}else{
			specIds = "2";
		}
		if(wtType!="8"){
			// getOverhaulFenceName();
		}
		var status = "";//mini.get("status").getValue();
		if(o && o.status)
		{
			status = o.status;
		}
		var isStandard = getUrlParam("isStandard");//mini.get("isStandard");
		
    }
	
   function controlEdit (isEdit,isEnabled){
	 	if(isEdit==''){
	 		return;
	 	}
		var isEditArr = isEdit.split(",");
		for(var i=0;i<isEditArr.length;i++){ 
			 var field=mini.get(isEditArr[i]);
			 if(field){
				 field.setEnabled(isEnabled);
			 }
		}
		 
	 }
	   
	//流程提交验证
	/* function flowAction(){		
		return editControl.flowAction();		
	} */
	function beforeInsert(){		
		var form = new mini.Form("#editform");
		form.reset();
	}
		  			 	  	
	/* function toSubmit(){
		var wtType = "";
			var typeCell = mini.get("wtType");
			if(objIsNotNull(typeCell))
			{
				wtType = typeCell.value;
			}
			else
			{
				//操作票使用typeid
				wtType = mini.get("typeId").getValue();
			}
			if(!objIsNotNull(wtType))
			{
				mini.alert("请选择票类型！");
				return;
			}
		   var userName =mini.get("userName").value;
		   var nameVariable =mini.get("nameVariable").value;
		   var typeVariable =mini.get("typeVariable").value;
		   var nameVariable1 = nameVariable.substring(0,nameVariable.length-5);
		   var nameVariable2 = nameVariable.substring(0,nameVariable.length-1);
		   if(nameVariable=='wtReceiveName_'){
			   nameVariable1='wtReceiver';
			   nameVariable2='wtReceiveName';
		   }
		   var passWord =mini.get("passWord").value;
		   if(!typeVariable){
				var json = {"userName":userName,"passWord":passWord,"wtType":wtType};
		   }else{
		   	   	var json = {"userName":userName,"passWord":passWord,"typeVariable":typeVariable,"wtType":wtType};
		   }
		$.ajax({
		        type: "POST",
		        url: "${ctx}/wo-wt/wo/woWt/saveQueryResult",
		        data : json,
		        success: function (text) {
		        	var o = mini.decode(text);
		        	if(o.type == "I"){
		        		//判断签发人，如果签发人和工作负责人为同一个人，则不允许签字
		        		if(typeVariable == "2")
		        		{	if(mini.get("workLeader").getValue()!=null&&mini.get("workLeader").getValue()!=""){
		        			if(o.data.id == mini.get("workLeader").getValue())
			        			{
			        				showMessageBox("提醒","签发人不能和工作负责人相同","warring");
			        				//mini.get(""+nameVariable2+"").setValue("");
									//mini.get(""+nameVariable1+"").setValue("");
									return;
			        			}
		        			}
		        			if(mini.get("wtSigner_").getValue()!=null&&mini.get("wtSigner_").getValue()!=""){
			        			if(o.data.id != mini.get("wtSigner").getValue())
			        			{
			        				showMessageBox("提醒","工作签发人必须一致","warring");
			        				//mini.get(""+nameVariable2+"").setValue("");
									//mini.get(""+nameVariable1+"").setValue("");
									return;
			        			}
		        			}
		        			
		        			
		        		}else if(typeVariable=="1"){
		        			if(mini.get("woWtLC.nowWorkLeader")!=undefined){
		        				if(mini.get("woWtLC.nowWorkLeader").getValue()!=null&&mini.get("woWtLC.nowWorkLeader").getValue()!=""){
		        					if(o.data.id != mini.get("woWtLC.nowWorkLeader").getValue())
				        			{	
				        				showMessageBox("提醒","工作负责人必须一致！","warring");
				        				//mini.get(""+nameVariable2+"").setValue("");
										//mini.get(""+nameVariable1+"").setValue("");
										return;
				        			}
			        			}else{
			        				if(mini.get("workLeader").getValue()!=null&&mini.get("workLeader").getValue()!=""){
				        				if(o.data.id != mini.get("workLeader").getValue())
					        			{	
					        				showMessageBox("提醒","工作负责人必须一致！","warring");
					        				//mini.get(""+nameVariable2+"").setValue("");
											//mini.get(""+nameVariable1+"").setValue("");
											return;
					        			}
				        			}
			        			}
		        			}else{
		        				if(mini.get("workLeader").getValue()!=null&&mini.get("workLeader").getValue()!=""){
			        				if(o.data.id != mini.get("workLeader").getValue())
				        			{	
				        				showMessageBox("提醒","工作负责人必须一致！","warring");
				        				//mini.get(""+nameVariable2+"").setValue("");
										//mini.get(""+nameVariable1+"").setValue("");
										return;
				        			}
			        			}
		        			}
		        		}else if(typeVariable == "99"){
		        			if(mini.get("workLeader").getValue()!=null&&mini.get("workLeader").getValue()!=""){
		        				if(o.data.id == mini.get("workLeader").getValue())
			        			{	
			        				showMessageBox("提醒","动火执行人和动火负责人不能为同一人！","warring");
			        				//mini.get(""+nameVariable2+"").setValue("");
									//mini.get(""+nameVariable1+"").setValue("");
									return;
			        			}
		        			}
		        		}
		        		
		        		mini.get(""+nameVariable2+"").setValue(o.data.name);
						//mini.get(""+nameVariable1+"").setText(o.data.name);
						mini.get(""+nameVariable1+"").setValue(o.data.id);
						showTipM("info","提示",o.message);
		        	}if(o.type == "W"){
		        		showMessageBox("提醒",o.message,"warring");
		        	}if(o.type == "E"){
		        		showMessageBox("错误",o.message,"error");
		        	}
	             var form = new mini.Form("#editform2");
	     		form.reset();
	             var editWindow = mini.get("editWindow");
	                    editWindow.hide();
		           }
		    })
	} */

	function cancelRow() {
			var form = new mini.Form("#editform2");
			form.reset();
			var editWindow = mini.get("editWindow");
	    editWindow.hide();
	}
	
	function update(Obj){
		   var idValue = mini.get(Obj.id).value;
		   $.ajax({
		          url:"${ctx}/sys/sysUser/getOrg",
		          data:{
		          			"id":idValue
		          		         		
		          		},
		          async:true,
		          success: function (data) {
		          	var o = mini.decode(data);
		            	 mini.get("maintOrg").setValue(o.data.classOrg.id);
			             mini.get("maintOrgName").setValue(o.data.classOrg.name);
			             mini.get("maintOrg").setText(o.data.classOrg.name);
			             
			             mini.get("orgId").setValue(o.data.deptOrg.id);
			             mini.get("orgName").setValue(o.data.deptOrg.name);
			             mini.get("orgId").setText(o.data.deptOrg.name);
		          },
		          error: function (jqXHR, textStatus, errorThrown) {
		          }
		      }); 
	   }
	//打印预览页面
	function wowtPrint(){		
		var wtType = mini.get("wtType").value;
	    var id = mini.get("id").value;
	    var iamCode = iamCodeValue();
	    if(id!=null&&id!=""){	    		
	    	//打印预览页面
	    	 window.open("${ctxRoot}/form2?view=wo/woWtFormSqNew"+wtType+"&id="+id+"&wtType="+wtType+"&iamCode="+iamCode); 
	     }
	}
	//打印格式
	function wowtFixationPrint(type){
	     var id = mini.get("id").value;
	    
	     if(id!=null&&id!=""){
	    	 //竖版
	    	if(type=="1"){
	    		window.open("${ctx}/wo/woWt/listFixationPrint1?action=new&id="+id);
	    	}
	    	//横版
	    	else{
	    		window.open("${ctx}/wo/woWt/listFixationPrint2?action=new&id="+id);	
	    	}
	    	
	     }
	}
	//工作票浏览
	function WoWtPrintBrowse(){
	     var id = mini.get("id").value;
	     var wtType = mini.get("wtType").value;
	     if(id!=null&&id!=""){
	    	
	    	window.open("${ctx}/wo/woWt/listWtType"+wtType+"PrintBrowse?action=new&id="+id);
	     }
	}
	function controlEdit(isEdit) {

		if (isEdit == '') {
			return;
		}
		// isEdit = isEdit+","+getContacts();
		var isEditArr = isEdit.split(",");
		for (var i = 0; i < isEditArr.length; i++) {
			var field = mini.get(isEditArr[i]);
			if (field) {
				field.setEnabled(false);
			}
			//	 field.setReadOnly(false);
		}

	}
			
	//填充指定值到指定字段
	function updFieldValue(gridId,fieldName,fieldValue)
	{
		var gridTemp = mini.get(gridId);
		var rows = gridTemp.getData();
		var obj = {};
		if(objIsNotNull(fieldName))
		{
			obj[fieldName] = fieldValue;
			for(var i = 0;i < rows.length;i++)
			{
				gridTemp.updateRow(rows[i],obj);
			}
		}
	}
	//责任部门为设备部的安全负责人必填
	function setSafetyGuardian(orgId)
	{return;//2019-02-25安监部要求去掉安全监护人的填写和打印
		var dutyOrgCell = mini.get("dutyOrgId");
		if(!objIsNotNull(dutyOrgCell))
		{
			return;
		}
		if(!orgId)
		{
			orgId = dutyOrgCell.getValue();
		}
		var cell = document.getElementById("safetyGuardian_lab");
		var miniCell = mini.get("safetyGuardian");
		if(orgId == "1940")
		{
			if(cell) cell.style.display = "inline";
			if(miniCell)
			{
				miniCell.show();
				//miniCell.setRequired(true);
			}
		}
		else
		{
			if(cell) cell.style.display = "none";
			if(miniCell)
			{
				miniCell.hide ();
				miniCell.setRequired(false);
			}
		}
		
	}
	function selectKKS(data)
	{
		if(data && data.length > 0)
		{
			var obj = data[0];
			if(obj.installPostion)
			{
				mini.get("locationId").setValue(obj.installPostion);
			}
			if(obj.installPostionName)
			{
				mini.get("location").setText(obj.installPostionName);
				mini.get("location").setValue(obj.installPostionName);
			}
		}
	}
	
	
	
	
	//新增2020-03-16
	//结束时间验证（结束时间和开始时间差值小于3小时提示）
   function checkEndTime(startTime,endTime){		
	 //开始时间
	 var start = mini.get(startTime).getValue();
	 //结束时间
	 var end = mini.get(endTime).getValue();
	 if(start==null||start==""){
		 mini.get(endTime).setValue("");
		 mini.alert("请先填写开始时间！");
		 return;
	 }
	 //两个时间相差的毫秒数
	 var num = end - start ;
	 //计算剩余的小时数
	 var hours=Math.floor(num/(60*60*1000));	
	 if(hours<3){
		mini.alert("注意：工作时间小于3小时！"); 
	 }
   }
	
   var wtType = ${param.wtType};//工作票类型
   $.ajax({//获取新建权限
        url: "${ctx}/wo-wt/wo/woWt/permit",
        data:{wtType:wtType},
        type:"post",
        success: function (text) {        	
       	 var data = mini.decode(text);
       	 var addCan = data.addCan;
       	 if(addCan=="1"){
       		/* setGridReadOnly("datagridMain","0",{			       
  		        addCan:"1"
  			    });	 */
       		mini.get("_tbGrid_add").setEnabled(true);
       	 }else{           		
       		mini.get("_tbGrid_add").setEnabled(false);
       	 }
        }
    }); 
</script>
