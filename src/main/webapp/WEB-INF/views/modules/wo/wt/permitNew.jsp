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
	//var myAddCan='1';
//	var formIds = '${param.formIds}';
//	var gridIds = '${param.gridIds}';
	var flowSecList = {};
	
	function afterLoad(o){		
		var dutyOrgId = null;
		if(o && o.dutyOrgId)
		{
			dutyOrgId = o.dutyOrgId;
		}
        /////////////设置围栏参数值
        /*var tabsMain=mini.get("tabsMain");
        var tab= tabsMain.getTab("tabWoWtRegion");
        var objKey= mini.get("id").getValue();
        //alert(11);
        tabsMain.updateTab(tab,{url:ctx+"/sis/sisDg/regionDesigner?dgCode=001&mode=none&regionMode=view&sampleRegion=0&objId=WoWt&objKey="+objKey});
        tabsMain.reloadTab(tab); */
        getCameraAndGuard();
        var wtType = o.wtType;
		if(wtType=="1"||wtType=="2"){
			specIds = "1";
		}else{
			specIds = "2";
		}
		if(wtType!="8"){
			 getOverhaulFenceName();
		}
		var status = "";//mini.get("status").getValue();
		if(o && o.status)
		{
			status = o.status;
		}
		var isStandard = getUrlParam("isStandard");//mini.get("isStandard");
		if(objIsNotNull(isStandard)){
			if(isStandard=="2"){//典型票时隐藏	
				//审核状态				
				var auditStatus = mini.get("auditStatus").getValue();
				//元件编辑权限 
				//_act_allowEdit：可编辑       _act_readOnly：只读          _act_allowBlank：可空            _act_invisible：不可见
				 _loadEditLimit_setEdit_cell = function(obj)
				{
					var cellId = obj.fieldName;
					if(!cellId)return;
					var limit = obj.editLimit;
					var cell = mini.get(cellId);
					if(objIsNotNull(cell))
					{
						if(cell.show)
						{
							cell.show();
						}
						switch(limit)
						{
						case '_act_allowEdit':
							if(objIsNotNull(cell.setEnabled))
							{
								if(auditStatus=="1"){
									cell.setEnabled(false);
								}else{
									cell.setEnabled(true);
								}
								
							}
							if(objIsNotNull(cell.setRequired))
							{   
								if(auditStatus=="1"){
									cell.setRequired(false);
								}else{
									//工作内容必填
									mini.get("content").setRequired(true);
									cell.setRequired(false);
								}
								//工作内容必填
								//mini.get("content").setRequired(true);
								//cell.setRequired(false);
							}
							break;
						case '_act_flowEdit':
							//按照可空设置属性
							if(objIsNotNull(cell.setEnabled))
							{
                                if(auditStatus=="1"){
                                	cell.setEnabled(false);
								}else{
									cell.setEnabled(true);
								}
								//cell.setEnabled(true);
							}
							if(objIsNotNull(cell.setRequired))
							{
                                if(auditStatus=="1"){
                                	cell.setRequired(false);
								}else{
									cell.setRequired(false);
								}
								//cell.setRequired(false);
							}							
							break;
						case '_act_readOnly':
							if(objIsNotNull(cell.setEnabled))
							{
                                if(auditStatus=="1"){
                                	cell.setEnabled(false);
								}else{
									cell.setEnabled(false);
								}
								//cell.setEnabled(false);
							}
							break;
						case '_act_allowBlank':
							if(objIsNotNull(cell.setEnabled))
							{
                                if(auditStatus=="1"){
                                	cell.setEnabled(false);
								}else{
									cell.setEnabled(true);
								}
								//cell.setEnabled(true);
							}
							if(objIsNotNull(cell.setRequired))
							{
                                if(auditStatus=="1"){
                                	cell.setRequired(false);
								}else{
									cell.setRequired(false);
								}
								//cell.setRequired(false);
							}
							break;
						case '_act_invisible':
							if(objIsNotNull(cell.hide))
							{
								cell.hide();
							}
							break;
						default:
							break;
						}
					}
					//setSafetyGuardian();
				}
				
				
				   
				//列编辑权限
				//_act_allowEdit：可编辑       _act_readOnly：只读          _act_allowBlank：可空            _act_invisible：不可见
				_loadEditLimit_setEdit_column=function(obj)
				{
					var gridId = obj.formId;
					var fieldName = obj.fieldName;
					var limit = obj.editLimit;
					if(!gridId || !fieldName)return;
					var grid = mini.get(gridId);
					if(!objIsNotNull(grid))
					{
						return;
					}
					var column = grid.getColumn(fieldName);
					if(objIsNotNull(column))
					{
						if(objIsNotNull(grid.showColumn))
						{
							grid.showColumn(column);
						}
						switch(limit)
						{
						case '_act_allowEdit':							
							column.readOnly=false;
							var vtype = column.vtype;
							if(vtype && vtype.indexOf("required") != -1)
							{
								vtype = vtype.replace("required;","").replace("required","");
								column.vtype = "";
							}
							break;
						case '_act_flowEdit':
							//按照可空设置属性							
							column.readOnly=false;
							var vtype = column.vtype;
							if(vtype && vtype.indexOf("required") != -1)
							{
								vtype = vtype.replace("required;","").replace("required","");
								column.vtype = "";
							}
							break;
						case '_act_readOnly':
							column.readOnly=true;
							break;
						case '_act_allowBlank':
							column.readOnly=false;
							var vtype = column.vtype;
							if(vtype && vtype.indexOf("required") != -1)
							{
								vtype = vtype.replace("required;","").replace("required","");
								column.vtype = "";
							}
							break;
						case '_act_invisible':
							grid.hideColumn(column);
							break;
						}
					}
				}
				 //押票
				//mini.get("keepTicket").setVisible(false);
				//变更负责人
				//mini.get("changeDutyLeader").setVisible(false);
				//打印预览				
				//mini.get("WoWtForm2").setVisible(false);
				//工作票审核
				//mini.get("wtExamine").setVisible(false);
				//恢复
				//mini.get("restoreTicket").setVisible(false);
				//延期
				//mini.get("workDelay").setVisible(false);
				//动火票关联主票
				//mini.get("linkMainTicket").setVisible(false);
				//作废
				//mini.get("cancellation").setVisible(false);
				
				/* var tabs = mini.get("tabsMain");//整个tab页
				var tab = tabs.getTab("tabWorkFlow");//要隐藏的tab
				tabs.updateTab(tab, { visible: false });//隐藏流程	 */							
				if(auditStatus=="1"){
					mini.get("_tbForm_remove").setEnabled(false);
					if(wtType=="3"){
						//mini.get("_tbgridWoWtsm4_export").setEnabled(false);
						//mini.get("_tbgridWoWtsm4_op").setEnabled(false);
					}										
				}else{
					mini.get("_tbForm_remove").setEnabled(true);
				}
				var flag = editControl.afterLoad(o);
				
				//setSafetyGuardian(dutyOrgId);
				
				return flag;
			}else{
				//打开历史数据时典型票只读
				var  editStr="sotId";
				controlEdit (editStr,false);
				//mini.get("sotId").setEnabled(false);				
				if(status=="26"){
					if(o!=undefined){
						editWoWt(o);
					}
				}else if(status=="10"){
					canExamine(o);
				}else{
					var flag = editControl.afterLoad(o);
					
					//setSafetyGuardian(dutyOrgId);
					
					return flag;
// 					return editControl.afterLoad(o);
				}
			
				
			}
		}else{
			if(status=="26"){
				editWoWt(o);
			}else{
				var flag = editControl.afterLoad(o);
				//setSafetyGuardian(dutyOrgId);
				return flag;
// 				return editControl.afterLoad(o);
			}
			
		}
		
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
	   
	
	function flowAction(){
		/* var dutyOrgId = mini.get("dutyOrgId").getValue();
		if(dutyOrgId!=undefined&&(dutyOrgId==null||dutyOrgId=="")){
			var orgId = mini.get("orgId").getValue();
			$.ajax({
				url : "${ctx}/wo/woWt/changeDutyOrg",
				data : {
					orgId : orgId
				},
				type : "post",
				success : function(text) {
					var o = mini.decode(text);
					if (o != null && o != "") {
						mini.get("dutyOrgId").setValue(o.plantDeptId);
					} else {
						mini.get("dutyOrgId").setValue(orgId);
					}
					//setSafetyGuardian();
				}
			});
		} */
		return editControl.flowAction();		
	}
	function beforeInsert(){		
		var form = new mini.Form("#editform");
		form.reset();
	}
		  			 	  
	function sign(name,value){
		  if(document.getElementById("currUserLoginName")!=undefined){
			  var currUserLoginName = document.getElementById("currUserLoginName").value;
			  mini.get("userName").setValue(currUserLoginName);
		  }
		   mini.get("nameVariable").setValue(name);
		   if(typeof(value)!="undefined"){
			   mini.get("typeVariable").setValue(value);
		   }else{
			   mini.get("typeVariable").setValue("");
		   }
		 /*   var form = new mini.Form("#editform2");
			form.reset();//清空内容 */
		   var editWindow = mini.get("editWindow");
		   editWindow.show();
	}

	function toSubmit(){
		
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
		        url: "${ctx}/wo/woWt/saveQueryResult",
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
	}

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
	
	function wowtPrint(){		
		var wtType = mini.get("wtType").value;
	    var id = mini.get("id").value;
	    var iamCode = iamCodeValue();
	    if(id!=null&&id!=""){
	    		 /* 一种工作票 */
	    		// newTabPage('操作票预览',"${ctx}/wo/woWt/listWtType"+wtType+"Print?action=new&id="+id,true);
	    	//window.open("http://www.w3school.com.cn");
	    	//window.open("${ctx}/wo-wt/wo/woWtNew/listWtType"+wtType+"Print?action=new&id="+id+"&iamCode="+iamCode);    
	    	/*  $.ajax({
   	 	        url: "${ctx}/wo-wt/wo/woWtNew/listWtType"+wtType+"Print?id="+id,
   	 	        data: {},
   	 	        type: "post",
   	 	      	async: false,
   	 	        success: function (text) { 	   	 	        	
   	 	         // var o = mini.decode(text);  	 	        
   	 	        //  window.open("${ctxRoot}/form?view=wo/woWtFormSqNew1&woWtList="+encodeURIComponent(text)); 
   	 	         
   	 	        }
   	 	     }); */
	    	//打印预览页面
	    	 window.open("${ctxRoot}/form2?view=wo/woWtFormSqNew"+wtType+"&id="+id+"&wtType="+wtType+"&iamCode="+iamCode); 
	     }
	}
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
	//押票状态编辑权限维护
	function editWoWt(o){
		var wtType = mini.get("wtType").getValue();
		var procInsId = null;
		if(o.procInsId!=undefined){
			procInsId= o.procInsId;
		}
		if(procInsId!=null){
			if(wtType=="1"){
				_loadEditLimit(procInsId,"elecWorkTicket1","node1");
				editKeepTicketStatus();
				var userObj = getCurrUserInfo(false);
				var user=mini.decode(userObj);
				if(o.woWtLC.nowWorkLeader!=null&&o.woWtLC.nowWorkLeader!=""){
					if(user.id==o.woWtLC.nowWorkLeader){
						checkUndefied("restoreTicket",true);
						checkUndefied("keepTicket",false);
					}
				}else{
					if(user.id==o.workLeader){
						checkUndefied("restoreTicket",true);
						checkUndefied("keepTicket",false);
					}
				}
				
			}
			else if(wtType=="2"){
				_loadEditLimit(procInsId,"elecWorkTicket2","node1");
				editKeepTicketStatus();
				var userObj = getCurrUserInfo(false);
				var user=mini.decode(userObj);
				
				if(user.id==o.workLeader){
					checkUndefied("restoreTicket",true);
					checkUndefied("keepTicket",false);
				}
				
			}
			else if(wtType=="3"){
				_loadEditLimit(procInsId,"reKongTicket","node1");
				editKeepTicketStatus();
				var userObj = getCurrUserInfo(false);
				var user=mini.decode(userObj);
				if(o.woWtLC.nowWorkLeader!=null&&o.woWtLC.nowWorkLeader!=""){
					if(user.id==o.woWtLC.nowWorkLeader){
						checkUndefied("restoreTicket",true);
						checkUndefied("keepTicket",false);
					}
				}else{
					if(user.id==o.workLeader){
						checkUndefied("restoreTicket",true);
						checkUndefied("keepTicket",false);
					}
				}
			}
			else if(wtType=="4"){
				_loadEditLimit(procInsId,"rlWorkTicket","node1");
				editKeepTicketStatus();
				var userObj = getCurrUserInfo(false);
				var user=mini.decode(userObj);
				if(o.woWtLC.nowWorkLeader!=null&&o.woWtLC.nowWorkLeader!=""){
					if(user.id==o.woWtLC.nowWorkLeader){
						checkUndefied("restoreTicket",true);
						checkUndefied("keepTicket",false);
					}
				}else{
					if(user.id==o.workLeader){
						checkUndefied("restoreTicket",true);
						checkUndefied("keepTicket",false);
					}
				}
			}
			else if(wtType=="5"){
				_loadEditLimit(procInsId,"dhWorkTicket1","node1");
				editKeepTicketStatus();
			}
			else if(wtType=="6"){
				_loadEditLimit(procInsId,"dhWorkTicket2","node1");
				editKeepTicketStatus();
	
			}
			var dutyOrgId = null;
			if(o && o.dutyOrgId)
			{
				dutyOrgId = o.dutyOrgId;
			}
			//setSafetyGuardian(dutyOrgId);
		}
	}
	
	
	function editKeepTicketStatus(){
		checkUndefied("workDelay",false);
		checkUndefied("changeDutyLeader",false);
		//new mini.Form("#formWoWtProduceMain").setEnabled(false);
		//mini.get("gridWoWtProduceCont1").setReadOnly(true);
		//mini.get("gridWoWtProduceCont2").setReadOnly(true);
		var isEdit = "_tbgridWoWtProduceCont1_add,_tbForm_save1,_tbgridWoWtProduceCont1_clone,"
			+"_tbgridWoWtProduceCont1_remove,_tbgridWoWtProduceCont2_add,_tbgridWoWtProduceCont2_clone,_tbgridWoWtProduceCont2_remove";
		controlEdit(isEdit);

	}
	
	function checkSysUser(){
		var userObj = getCurrUserInfo(false);
		var user=mini.decode(userObj);
		var workLeader = mini.get("workLeader").getValue();
		if(workLeader==user.id){
			return true;
		}
		return false;
	}
	
	function canExamine(o){
		var wtType = mini.get("wtType").getValue();
		var procInsId =null;
		if(o!=undefined){
			if(o.procInsId!=undefined){
				procInsId= o.procInsId;
			}
			if(procInsId!=null){
				if(wtType=="1"){
					_loadEditLimit(procInsId,"elecWorkTicket1","node1");
					if(mini.get("wtExamine")!=undefined){
						mini.get("wtExamine").setEnabled(true);
					}
				}
				else if(wtType=="2"){
					_loadEditLimit(procInsId,"elecWorkTicket2","node1");
					if(mini.get("wtExamine")!=undefined){
						mini.get("wtExamine").setEnabled(true);
					}
				}
				else if(wtType=="3"){
					_loadEditLimit(procInsId,"reKongTicket","node1");
					if(mini.get("wtExamine")!=undefined){
						mini.get("wtExamine").setEnabled(true);
					}
				}
				else if(wtType=="4"){
					_loadEditLimit(procInsId,"rlWorkTicket","node1");
					if(mini.get("wtExamine")!=undefined){
						mini.get("wtExamine").setEnabled(true);
					}
				}
				else if(wtType=="5"){
					_loadEditLimit(procInsId,"dhWorkTicket1","node1");
					if(mini.get("wtExamine")!=undefined){
						mini.get("wtExamine").setEnabled(true);
					}
				}
				else if(wtType=="6"){
					_loadEditLimit(procInsId,"dhWorkTicket2","node1");
					if(mini.get("wtExamine")!=undefined){
						mini.get("wtExamine").setEnabled(true);
					}

				}else if(wtType=="8"){
					_loadEditLimit(procInsId,"dhWorkTicket8","node1");
					if(mini.get("wtExamine")!=undefined){
						mini.get("wtExamine").setEnabled(true);
					}

				}
			}else{
				
			}
		}
		
		
	}
	
	
	function checkUndefied(cellIds, param) {
		var data = mini.get(cellIds);
		if (data == undefined) {
			return;
		} else {
			data.setEnabled(param);
		}

	}
	
	//为列表中工作负责人信息
	function insertUserInfo(gridId,userIdField,userNameField)
	{
		var useCell = mini.get("workLeader");
		if(objIsNotNull(useCell))
		{
			var userId = useCell.getValue();
			var userName = useCell.getText();
			var gridTemp = mini.get(gridId);
			var rows = gridTemp.getData();
			var obj = {};
			obj[userIdField] = userId;
		
			obj[userNameField] = userName;
			
			for(var i = 0;i < rows.length;i++)
			{
				gridTemp.updateRow(rows[i],obj);
			}
		}
		/* var curUser = getCurrUserInfo(false);
		curUser = mini.decode(curUser); */
		
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
	
	//关联缺陷
	function relateDefect()
	{
			var wtId = mini.get("id").getValue();
			if(!objIsNotNull(wtId))
			{
				mini.alert("缺陷还未保存！无法关联工作票！");
				return;
			}
			//关联工作票
			mini.open({
				url: "${ctx}/wo/woDefect/lov1?baseFilter=a.ID NOT IN(SELECT defect_id FROM wo_defect_wt where wt_id='"+wtId+"')&readOnly=1",        //页面地址
	    		//url: "${ctx}/wo/woWt/relateList?baseFilter=A.DEFECT_ID IS NULL&readOnly=1",        //页面地址
    		    title: "选择要关联的缺陷",      //标题
    		    width: "80%",      //宽度
    		    height: "80%",     //高度
    		    allowResize: true,       //允许尺寸调节
    		    allowDrag: true,         //允许拖拽位置
    		    showCloseButton: true,   //显示关闭按钮
    		    showMaxButton: true,     //显示最大化按钮
    		    showModal: true,         //显示遮罩
    		    loadOnRefresh: false,       //true每次刷新都激发onload事件
    		    onload: function () {       //弹出页面加载完成
    		        var iframe = this.getIFrameEl(); 
    		        var gridTemp = iframe.contentWindow.mini.get("datagridMain");
    		        gridTemp.set({
     		            multiSelect: true,
    		            allowCellEdit: false/* ,
    		            onrowdblclick : function( ){
    		                onLovOk();
    		            } */
    		        });
    		        //调用弹出页面方法进行初始化
    		        //iframe.contentWindow.SetData(data); 
    		        //iframe.contentWindow.mini.get("lov_action_bar").show();
    		    },
    		    ondestroy: function (action) {  //弹出页面关闭前
    		        if (action == "ok") {//如果点击“确定”
    		            var iframe = this.getIFrameEl();
    		            //获取选中、编辑的结果
    		            var data = iframe.contentWindow.mini.get("datagridMain").getSelecteds();
    		            if(objIsNotNull(data))
    		            {
    		            	var defectId = "";//工作票ID
    		            	for(var i = 0;i < data.length;i++)
    		            	{
    		            		if(i == 0)
    		            		{
    		            			defectId = data[i].id;
    		            		}
    		            		else
    		            		{
    		            			defectId = defectId + "," + data[i].id;
    		            		}
    		            	}
    		            	
    		            	$.ajax({
    		            		url:"${ctx}/wo/woWt/defectRelateWt",
   		            			data:{"id":wtId,"defectId":defectId,type:"0"},
    		            		success:function(text){debugger;
    		            			var o = mini.decode(text);
    		            			if(o.type=="E"){
    		                            showMessageBox("错误",o.message,"error");
    		                            return;
    		                        }else if(o.type=="W"){
    		                            showMessageBox("警告",o.message,"warning");
    		                        }else if(o.type=="I"){
    		                            showTipM("info","提示",o.message);
    		                            //showMessageBox("提示",o.message,"info");
    		                        }
    		            		},
   		            			error: function (jqXHR, textStatus, errorThrown) {
   		            	            var callback=function (action) {
   		            	                if(action=='详细')  viewErrorDetail(jqXHR.responseText);
   		            	            }
   		            	            var buttonsTemp=["ok","详细"];
   		            	            showMessageBox("错误","菜单加载失败","error",null,callback,buttonsTemp);

   		            	        }
    		            	})
    		            }
    		        }                        
    		    }
	    	});
	}
	function linkDefect()
	{
		var wtId = mini.get("id").getValue();
		if(!objIsNotNull(wtId))
		{
			mini.alert("工作票还未保存！请先保存工作票！");
			return;
		}
		//关联工作票
		mini.open({
			url: "${ctx}/wo/woDefect/lov1?baseFilter=a.ID IN(SELECT defect_id FROM wo_defect_wt where wt_id='"+wtId+"')&readOnly=1",        //页面地址
    		//url: "${ctx}/wo/woWt/relateList?baseFilter=A.DEFECT_ID IS NULL&readOnly=1",        //页面地址
		    title: "选择要取消关联的缺陷",      //标题
		    width: "80%",      //宽度
		    height: "80%",     //高度
		    allowResize: true,       //允许尺寸调节
		    allowDrag: true,         //允许拖拽位置
		    showCloseButton: true,   //显示关闭按钮
		    showMaxButton: true,     //显示最大化按钮
		    showModal: true,         //显示遮罩
		    loadOnRefresh: false,       //true每次刷新都激发onload事件
		    onload: function () {       //弹出页面加载完成
		        var iframe = this.getIFrameEl(); 
		        var gridTemp = iframe.contentWindow.mini.get("datagridMain");
		        gridTemp.set({
 		            multiSelect: true,
		            allowCellEdit: false/* ,
		            onrowdblclick : function( ){
		                onLovOk();
		            } */
		        });
		    },
		    ondestroy: function (action) {  //弹出页面关闭前
		        if (action == "ok") {//如果点击“确定”
		            var iframe = this.getIFrameEl();
		            //获取选中、编辑的结果
		            var data = iframe.contentWindow.mini.get("datagridMain").getSelecteds();
		            if(objIsNotNull(data))
		            {
		            	var defectId = "";//工作票ID
		            	for(var i = 0;i < data.length;i++)
		            	{
		            		if(i == 0)
		            		{
		            			defectId = data[i].id;
		            		}
		            		else
		            		{
		            			defectId = defectId + "," + data[i].id;
		            		}
		            	}
		            	
		            	$.ajax({
		            		url:"${ctx}/wo/woWt/disRelate",
		            			data:{"id":wtId,"defectId":defectId},
		            		success:function(text){debugger;
		            			var o = mini.decode(text);
		            			if(o.type=="E"){
		                            showMessageBox("错误",o.message,"error");
		                            return;
		                        }else if(o.type=="W"){
		                            showMessageBox("警告",o.message,"warning");
		                        }else if(o.type=="I"){
		                            showTipM("info","提示",o.message);
		                            //showMessageBox("提示",o.message,"info");
		                        }
		            		},
	            			error: function (jqXHR, textStatus, errorThrown) {
	            	            var callback=function (action) {
	            	                if(action=='详细')  viewErrorDetail(jqXHR.responseText);
	            	            }
	            	            var buttonsTemp=["ok","详细"];
	            	            showMessageBox("错误","菜单加载失败","error",null,callback,buttonsTemp);

	            	        }
		            	})
		            }
		        }                        
		    }
    	});
	}
	
	//智能叫号系统办理工作票，载入明细前判断是否为待终结或者待许可，如果是的话根据传入的参数判断是否应该设置整个压面不可编辑
	function transactWoWt(canEdit){
		var wtType = mini.get("wtType").getValue();
		var procInsId = mini.get("procInsId").getValue();
		var procWFDefKey = null;
		var workLeader = null;
		var id = mini.get("id").getValue();
		if(wtType!="8"){
			workLeader = mini.get("workLeader").getValue();
		}else{
			workLeader = mini.get("appUnitLeader").getValue();
		}
		
		if(procInsId!=null){
			if(wtType=="1"){
				procWFDefKey = "elecWorkTicket1";
			}
			else if(wtType=="2"){
				procWFDefKey = "elecWorkTicket2";
			}
			else if(wtType=="3"){
				procWFDefKey = "reKongTicket";
			}
			else if(wtType=="4"){
				procWFDefKey = "rlWorkTicket";
			}
			else if(wtType=="5"){
				procWFDefKey = "dhWorkTicket1";
			}
			else if(wtType=="6"){
				procWFDefKey = "dhWorkTicket2";

			}else if(wtType=="8"){
				procWFDefKey = "dhWorkTicket8";
			}
		}
		//不可编辑
		if(canEdit=="false"){
			$.ajax({
				url : baseUrl+"/sys/sysActNodeEdit/getNodeInfoByNodeId",
				data : {procWFDefKey:procWFDefKey,nodeId:"000"},
				type : "post",
				async : false,
				success : function(text) {
					var list = mini.decode(text);
					if(objIsNotNull(list))
					{
						_loadEditLimit_setEdit(list);
					}
				}
			});
			checkUndefied("procWFTaskBranchVarValue",false);
			checkUndefied("procWFComment",false);
			checkUndefied("_tbWF_submit",false);
			var procInsId = mini.get("procInsId").getValue();
			if(procInsId!=null&&procInsId!=""){
				 $.ajax({
		   	 	        url: "${ctx}/wo/woWt/getCurrActUser",
		   	 	        data: { procInsId:procInsId },
		   	 	        type: "post",
		   	 	      	async: false,
		   	 	        success: function (text) {
		   	 	        	if(text=="true"){
		   	 	        		checkUndefied("transact",true);
		   	 	        	}else{
		   	 	        		checkUndefied("transact",false);
		   	 	        	}
		   	 	        }
		   	 	     });
			}else{
				checkUndefied("transact",false);
			}
			
		}
		//正常载入明细的逻辑  即当前人是可执行人则可以编辑，否则还是无法编辑这张工作票
		else{
			_loadEditLimit(procInsId,procWFDefKey,"node1",workLeader);
			checkUndefied("procWFTaskBranchVarValue",true);
			checkUndefied("procWFComment",true);
			checkUndefied("_tbWF_submit",true);
			//刷新父级的列表
			parent.refreshGridData();
			/* mini.get("isTop").setValue("1");
			saveForm(); */
			$.ajax({
				url : "${ctx}/wo/woWt/updateExamineWoWt",
				data : {id:id},
				type : "post",
				async : false,
				success : function(text) {
					var url = "http://192.168.1.199:8000/my/tts?请"+text+"到办票窗口办理工作票业务";
				    var req = new XMLHttpRequest();
				    req.open("GET", url, false);
				    req.send(null);
				}
			});
			//refreshFormData();
			//parent.refreshScreenList();
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
</script>


<!--

//-->
</script>