<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%-- <script type="text/javascript" src="${ctxStatic}/common/editControl.js"></script>
<script type="text/javascript" src="${ctxStatic}/common/actNodeEdit.js?v=<%=System.currentTimeMillis() %>"></script> --%>
<script type="text/javascript">
window.onload = function(){			
   addButton();//加载按钮
   isAddCan();//是否可新建工作票
   //设置表格边框样式
   $('.formtable').attr({"cellpadding":"0","cellspacing":"1","border":"0","bgColor":"#333"});
    
}

//工作票新建权限
function isAddCan(){
   var wtType = ${param.wtType};//工作票类型
   $.ajax({//获取新建权限
       url: "${ctx}/wo-wt/wo/woWt/permit",
       data:{wtType:wtType},
       type:"post",
       success: function (text) {  	             	
      	 var data = mini.decode(text);
      	 var addCan = data.addCan;
      	 if(addCan=="1"){
      		// setGridReadOnly("datagridMain","0",{			       
 		       // addCan:"1"
 			   // });	 
      		mini.get("_tbGrid_add").setEnabled(true);
      	 }else{           		
      		mini.get("_tbGrid_add").setEnabled(false);
      	 }
       }
     }); 
}

//延期、变更负责人只能一次
function updateDelayAndLeaderChange(){	
	var wtType = mini.get("wtType").getValue();
	var isLeaderChange = null; //变更负责人
	var isDelay = null; //延期
	isDelay = mini.get("woWtDelay.isDelay").getValue();
	var status = mini.get("status").getValue();
    if(wtType=="1"||wtType=="3"||wtType=="4"){
    	isLeaderChange = mini.get("woWtLC.isLeaderChange").getValue(); 
    	if(isLeaderChange=="1"){
    		mini.get("woWtLC.nowWorkLeader").setEnabled(false);
    		mini.get("woWtLC.changeTime").setEnabled(false);
    		mini.get("woWtLC.wtSignerName_").setEnabled(false);
    		mini.get("woWtLC.permitByName_").setEnabled(false);   		
    	}else{
    		mini.get("woWtLC.nowWorkLeader").setEnabled(true);
    		mini.get("woWtLC.changeTime").setEnabled(true);
    		mini.get("woWtLC.wtSignerName_").setEnabled(true);
    		mini.get("woWtLC.permitByName_").setEnabled(true);
    	}
    	
    	if(isDelay=="1"){
    		mini.get("woWtDelay.delayTime").setEnabled(false);
    		mini.get("woWtDelay.workLeaderName_").setEnabled(false);
    		mini.get("woWtDelay.workLeaderTime").setEnabled(false);
    		mini.get("woWtDelay.permitByName1_").setEnabled(false);   
    		mini.get("woWtDelay.permitByTime").setEnabled(false);     		
    	}else{
    		mini.get("woWtDelay.delayTime").setEnabled(true);
    		mini.get("woWtDelay.workLeaderName_").setEnabled(true);
    		mini.get("woWtDelay.workLeaderTime").setEnabled(true);
    		mini.get("woWtDelay.permitByName1_").setEnabled(true);   
    		mini.get("woWtDelay.permitByTime").setEnabled(true);     		
    	}
    	
    	
    }else if(wtType=="2"){
    	
    	if(isDelay=="1"){
    		mini.get("woWtDelay.delayTime").setEnabled(false);
    		mini.get("woWtDelay.workLeaderName_").setEnabled(false);
    		mini.get("woWtDelay.workLeaderTime").setEnabled(false);
    		mini.get("woWtDelay.permitByName_").setEnabled(false);   
    		mini.get("woWtDelay.permitByTime").setEnabled(false);     		
    	}else{
    		mini.get("woWtDelay.delayTime").setEnabled(true);
    		mini.get("woWtDelay.workLeaderName_").setEnabled(true);
    		mini.get("woWtDelay.workLeaderTime").setEnabled(true);
    		mini.get("woWtDelay.permitByName_").setEnabled(true);   
    		mini.get("woWtDelay.permitByTime").setEnabled(true);  
    	}
    }
    
    if(wtType=="3"||wtType=="4"){
    	if(isDelay=="1"){    		
    		mini.get("woWtDelay.dutyLeaderName_").setEnabled(false);   
    		mini.get("woWtDelay.dutyLeaderTime").setEnabled(false); 
    	}else{   		
    		mini.get("woWtDelay.dutyLeaderName_").setEnabled(true);   
    		mini.get("woWtDelay.dutyLeaderTime").setEnabled(true); 
    	}
    }
}


//判断当前登录者是否匹配建票人，控制票面编辑控制
function getWorkLeader(o){	
	 //当前登录者
	 var currUserId  = _currUser_.id
	 //工作负责人（建票人）
	 var workLeader = o.workLeader;
	 if(currUserId==workLeader){
		 return true;
	 }else{
		 return false;
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
	   
function beforeInsert(){		
   var form = new mini.Form("#editform");
   form.reset();
}
		  			 	  	
//更新作业安措排序
function onBeforeSaveForm() {
   //更新危险点与预防控制措施排序字段值
   updDangerTaskSeqNo();			
   return true;
}

function cancelRow() {
   var form = new mini.Form("#editform2");
   form.reset();
   var editWindow = mini.get("editWindow");
   editWindow.hide();
}
	
//打印预览页面
function wowtPrint(){		
	var wtType = mini.get("wtType").value;
    var id = mini.get("id").value;
    var iamCode = iamCodeValue();
    if(id!=null&&id!=""){	    		
      //打印预览页面
      window.open("${ctxRoot}/form2?view=wo/woWtFormSq"+wtType+"&id="+id+"&wtType="+wtType+"&iamCode="+iamCode); 
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
	
  
   
//选择用户（分页多选）
function popLovJson1(e) {           
   var param = {
       obj: null,
       title: "人员选择",
       multiSel: true,
       readOnly: true,
       url: "${ctxRoot}/form?view=/sys/misUserList",
       width: 800,
       height: 600,
       selFields: "id,name",
       refFields: "",
       refGridId: null,
       actionLovValid: null,
       actionLov: returnSelectData3,
       actionClose: null,
       gridId: "datagridSelected",
       allowDblclickSelect: true
   };
   popLov2(param);
}
   
   
function returnSelectData3(data) {
   if(!data||!data.length){
     return;
   }
   if (data.length == 0) {
     return;
   }
   var ids="";
   var names = "";
    
   for(var i=0;i<data.length;i++){
     if(i==0){
     ids=data[i].id;
       names=data[i].name;
     }else{
       ids+=","+data[i].id;
       names+=","+data[i].name;
     }
   }
    
   mini.get("workClassPersonIds").setValue(ids);   //人员id
   mini.get("workClassPersonIds").setText(names);   //人员
}
   
//页面编辑权限控制
function onBeforeSaveCheck(o){
   editControl.beforeSave(o);
   return true;
}
 
function addNewReword(o){
   editControl.afterLoad(o);//页面编辑权限控制   
}

function onAfterLoadRecord(o) {	   
   wfAfterLoad(o);
   editControl.afterLoad(o);//页面编辑权限控制	   
   //updateDelayAndLeaderChange(); //控制延期、变更负责人编辑控制权限
  
   //updateIsTutelage();//控制专职监护编辑控制
}
   

    
//打印预览
function print(){
   var id = mini.get("id").getValue();		 
   if (id == "" || id == null) {
     mini.alert("请先保存再点击打印按钮！");
     return;
   }
   wowtPrint();		     			  
}
	    
//变更负责人
/*function changeWorkLeader(){
   var id = mini.get("id").getValue();	
   var wtType = mini.get("wtType").getValue();
   var workLeader = mini.get("workLeader").getValue();
   var workLeaderName = mini.get("workLeaderName").getValue();
   var wtSigner = mini.get("wtSignerName_").getValue();
   var changeTime = mini.get("woWtLC.changeTime").getFormValue();
   var isLeaderChange = mini.get("woWtLC.isLeaderChange").getValue();
   var dutyOrgId = mini.get("dutyOrgId").getValue();

   if(isLeaderChange=="1"){
     showMessageBox("警告","只能变更负责人一次","warning");
	 return;
   } 
   if(changeTime!=null&&changeTime!=""){
     mini.confirm("确认重新进行变更负责人？", "重新变更负责人",
			function (action) {
				if (action == "ok") {
					mini.open({
						//targetWindow: window.top,   //页面对象。默认是顶级页面。			
						url : "${ctxRoot}/form?view=wo/wt/woWtChangeDutyLeaderForm&wtId=" + id
							+ "&wtType=" + wtType + "&workLeader="
								+ workLeader + "&workLeaderName="
								+ workLeaderName + "&wtSigner=" + wtSigner + "&dutyOrgId=" + dutyOrgId, //页面地址
						title : "变更负责人", //标题
						width : 720, //宽度
						height : 450, //高度
						allowResize : true, //允许尺寸调节
						allowDrag : true, //允许拖拽位置
						showCloseButton : true, //显示关闭按钮
						showMaxButton : true, //显示最大化按钮
						showModal : true, //显示遮罩
						loadOnRefresh : true, //true每次刷新都激发onload事件
						onload : function() { //弹出页面加载完成								
						},
						ondestroy : function(action) {
							if (action == "ok") {
								showTipM("info", "提示", "变更负责人成功！");
								refreshFormData();
							}
						}

					});
				}else if(action=="cancel"){
					
				}
			});
   }else{
	mini.open({
		//targetWindow: window.top,   //页面对象。默认是顶级页面。
		url : "${ctxRoot}/form?view=wo/wt/woWtChangeDutyLeaderForm&wtId=" + id
				+ "&wtType=" + wtType + "&workLeader="
				+ workLeader + "&workLeaderName="
				+ workLeaderName + "&wtSigner=" + wtSigner + "&dutyOrgId=" + dutyOrgId, //页面地址
		title : "变更负责人", //标题
		width : 720, //宽度
		height : 450, //高度
		allowResize : true, //允许尺寸调节
		allowDrag : true, //允许拖拽位置
		showCloseButton : true, //显示关闭按钮
		showMaxButton : true, //显示最大化按钮
		showModal : true, //显示遮罩
		loadOnRefresh : true, //true每次刷新都激发onload事件
		onload : function() { //弹出页面加载完成
			
		},
		ondestroy : function(action) {
			if (action == "ok") {
				showTipM("info", "提示", "变更负责人成功！");
				refreshFormData();
			}
		}

	});
 }
  	  
} */
	    
//押票恢复
function restoreTicket(){
	var iamCode = iamCodeValue();
   var wtType = mini.get("wtType").getValue();
   var workLeader = null;  
   if(wtType=="2"||wtType=="5"||wtType=="6"){
 	  workLeader = mini.get("workLeader").getValue(); 
   }else{
 	  if (mini.get("woWtLC.nowWorkLeader").getValue() != null&& mini.get("woWtLC.nowWorkLeader").getValue() != "") {
			 workLeader = mini.get("woWtLC.nowWorkLeader").getValue();				
		  } else {
			 workLeader = mini.get("workLeader").getValue();				
		  } 
   }
   var actionStatus = "restoreTicket";
   var id = mini.get("id").getValue();	
   var wtType = mini.get("wtType").getValue();	    			
   var dutyOrgId = mini.get("dutyOrgId").getValue();
   mini.open({
     //targetWindow: window.top,   //页面对象。默认是顶级页面。
	 url : "${ctxRoot}/form?view=wo/wt/woWtKeepAndRestoreForm&wtId=" + id
			+ "&wtType=" + wtType + "&actionStatus="
			+ actionStatus + "&workLeader=" + workLeader + "&dutyOrgId=" + dutyOrgId+"&iamCode="+iamCode, //页面地址
	 title : "押票和恢复", //标题
	 width : "70%", //宽度
	 height : 600, //高度
	 allowResize : true, //允许尺寸调节
	 allowDrag : true, //允许拖拽位置
	 showCloseButton : true, //显示关闭按钮
	 showMaxButton : true, //显示最大化按钮
	 showModal : true, //显示遮罩
	 loadOnRefresh : true, //true每次刷新都激发onload事件
	 onload : function() { //弹出页面加载完成

	 },
	 ondestroy : function(action) {
		if (action == "ok") {
			if (actionStatus == "keepTicket") {
				showTipM("info", "提示", "押票成功！");
			} else if (actionStatus == "restoreTicket") {
				showTipM("info", "提示", "恢复成功！");
			}
			refreshFormData();
		}
	 }
   });
}
	    
//押票
function keepTicket(){	
   var iamCode = iamCodeValue();
   var wtType = mini.get("wtType").getValue();
   var workLeader = null;  
   if(wtType=="2"||wtType=="5"||wtType=="6"){
 	  workLeader = mini.get("workLeader").getValue(); 
   }else{
 	  if (mini.get("woWtLC.nowWorkLeader").getValue() != null&& mini.get("woWtLC.nowWorkLeader").getValue() != "") {
			 workLeader = mini.get("woWtLC.nowWorkLeader").getValue();				
		  } else {
			 workLeader = mini.get("workLeader").getValue();				
		  } 
   }
   var actionStatus = "keepTicket";
   var id = mini.get("id").getValue();	
   var wtType = mini.get("wtType").getValue();	    				
   var dutyOrgId = mini.get("dutyOrgId").getValue();
   mini.open({
     //targetWindow: window.top,   //页面对象。默认是顶级页面。
	 url : "${ctxRoot}/form?view=wo/wt/woWtKeepAndRestoreForm&wtId=" + id
			+ "&wtType=" + wtType + "&actionStatus="
			+ actionStatus + "&workLeader=" + workLeader + "&dutyOrgId=" + dutyOrgId+"&iamCode="+iamCode, //页面地址
	 title : "押票和恢复", //标题
	 width : "70%", //宽度
	 height : 600, //高度
	 allowResize : true, //允许尺寸调节
	 allowDrag : true, //允许拖拽位置
	 showCloseButton : true, //显示关闭按钮
	 showMaxButton : true, //显示最大化按钮
	 showModal : true, //显示遮罩
	 loadOnRefresh : true, //true每次刷新都激发onload事件
	 onload : function() { //弹出页面加载完成

	 },
	 ondestroy : function(action) {
		if (action == "ok") {
			if (actionStatus == "keepTicket") {
				showTipM("info", "提示", "押票成功！");
			} else if (actionStatus == "restoreTicket") {
				showTipM("info", "提示", "恢复成功！");
			}
			refreshFormData();
		}
	 }
   });
}
	    
//申请延期
/*function postpone(){
   var workLeader = null;
   if (mini.get("woWtLC.nowWorkLeader").getValue() != null&& mini.get("woWtLC.nowWorkLeader").getValue() != "") {
     workLeader = mini.get("woWtLC.nowWorkLeader").getValue();
   } else {
	 workLeader = mini.get("workLeader").getValue();
   }
   var id = mini.get("id").getValue();	
   var wtType = mini.get("wtType").getValue();	    				
   var dutyOrgId = mini.get("dutyOrgId").getValue();
   var delayTime = mini.get("woWtDelay.delayTime").getFormValue();
   var isDelay = mini.get("woWtDelay.isDelay").getValue();
   if(isDelay=="1"){
     showMessageBox("警告","只能延期一次","warning");
	 return;
   }
   if(delayTime!=null&&delayTime!=""){
	 mini.confirm("确认重新进行延期？", "重新延期",
		function (action) {
			if (action == "ok") {
				mini.open({
					//targetWindow: window.top,   //页面对象。默认是顶级页面。
					url : "${ctxRoot}/form?view=wo/wt/woWtApplyDelayForm&wtId=" + id
							+ "&wtType=" + wtType + "&workLeader="
							+ workLeader + "&dutyOrgId=" + dutyOrgId, //页面地址
					title : "申请延期", //标题
					width : 720, //宽度
					height : 350, //高度
					allowResize : true, //允许尺寸调节
					allowDrag : true, //允许拖拽位置
					showCloseButton : true, //显示关闭按钮
					showMaxButton : true, //显示最大化按钮
					showModal : true, //显示遮罩
					loadOnRefresh : true, //true每次刷新都激发onload事件
					onload : function() { //弹出页面加载完成
						
					},
					ondestroy : function(action) {
						if (action == "ok") {
							showTipM("info", "提示", "申请延期成功！");
							refreshFormData();
						}
					}

				});
				
			}else if(action=="cancel"){
				
			}
		});
   }else{
	mini.open({
		//targetWindow: window.top,   //页面对象。默认是顶级页面。
		url : "${ctxRoot}/form?view=wo/wt/woWtApplyDelayForm&wtId=" + id
				+ "&wtType=" + wtType + "&workLeader="
				+ workLeader + "&dutyOrgId=" + dutyOrgId, //页面地址
		title : "申请延期", //标题
		width : 720, //宽度
		height : 350, //高度
		allowResize : true, //允许尺寸调节
		allowDrag : true, //允许拖拽位置
		showCloseButton : true, //显示关闭按钮
		showMaxButton : true, //显示最大化按钮
		showModal : true, //显示遮罩
		loadOnRefresh : true, //true每次刷新都激发onload事件
		onload : function() { //弹出页面加载完成
			
		},
		ondestroy : function(action) {
			if (action == "ok") {
				showTipM("info", "提示", "申请延期成功！");
				refreshFormData();
			}
		}

	});
   }
} */
	    
	    
	    
//检修围栏
function repairRail(){
   var id = mini.get("id").getValue();		 
   if (id == "" || id == null) {
     mini.alert("请先保存再点击检修围栏按钮！");
     return;
   }		
   var form = new mini.Form("#editform");   
   var woWtData = form.getData();
   var wtId = woWtData.id;		 
   var iamCode = iamCodeValue();
   var smElectronicFenceUrl = "${smElectronicFenceUrl}";
   //window.open("http://192.168.0.169:9090/form?view=sm/smElectronicFenceForm&action=new&showList=0&iamCode=" + iamCode +"&wtId="+wtId);
   //newTabPage('检修围栏',"http://192.168.0.169:9090/form?view=sm/smElectronicFenceForm&action=new&showList=0&iamCode=" + iamCode +"&wtId="+wtId,true);
   newTabPage('新建检修围栏',smElectronicFenceUrl+"/form?view=sm/smElectronicFenceForm&action=new&showList=0&iamCode=" + iamCode +"&wtId="+wtId,true); 		
	    
}
	    
//检修围栏查看明细
//行双击事件
function onrowdblclick(e){	       	           	
   var record = e.record;     
   var uid = record.id; 
   var smElectronicFenceUrl = "${smElectronicFenceUrl}";
   var iamCode = iamCodeValue();
   // newTabPage('检修围栏',"http://192.168.0.169:9090/form?view=sm/smElectronicFenceForm&action=view&showList=0&id="+uid+"&iamCode="+iamCode,true);    
   newTabPage('工作票关联检修围栏',smElectronicFenceUrl+"/form?view=sm/smElectronicFenceForm&action=view&showList=0&id="+uid+"&iamCode="+iamCode,true);                 
}
	    

//新建/查看一级动火票
function createWoWt5(){		
   var id = mini.get("id").getValue();
   var status = mini.get("status").getValue();
   //流水号
   var serialNumber = mini.get("serialNumber").getValue();
   var iamCode = iamCodeValue();
   var woWtNewTabPageUrl = "${woWtNewTabPageUrl}";
   if (id == "" || id == null) {
     mini.alert("请先保存再点击新建一级动火按钮！");
	 return;
   }
   
   if (status == "8" || status == "10") {
     mini.alert("当前状态无法新建动火票！");
	 return;
   }
       
   $.ajax({
     url : "${ctx}/wo-wt/wo/woWt/data2",
     data : {
	  mainTicketId : id,
	  wtType:"5"
     },
     type : "post",
     success : function(text) {	    	
	   var data = mini.decode(text);				
	   if (data.length>0) {		
		  mini.alert("您有未完结的动火票无法开具新票！");
		  return;
	   } else {	
		   $.ajax({//获取新建权限
		       url: "${ctx}/wo-wt/wo/woWt/permit",
		       data:{wtType:"5"},
		       type:"post",
		       success: function (text) {  	             	
		      	 var data = mini.decode(text);
		      	 var addCan = data.addCan;
		      	 if(addCan=="1"){
		      		newTabPage('新建一级动火工作票',woWtNewTabPageUrl+"/form?view=wo/wt/woWtForm5&action=new&showList=0&wtType=5&isStandard=1&mainTicketId="+id+"&correspondingNumber="+serialNumber+"&iamCode="+iamCode,true); 		
		      	 }else{           		
		      		mini.alert("您没有新建一级动火工作票权限！");
		      		return false;
		      	 }
		       }
		    });     
		 
       }
	 }
   }); 
}
	      
//新建二级动火票
function createWoWt6(){
   var id = mini.get("id").getValue();
   var status = mini.get("status").getValue();
   //流水号
   var serialNumber = mini.get("serialNumber").getValue();
   var iamCode = iamCodeValue();
   var woWtNewTabPageUrl = "${woWtNewTabPageUrl}";
   if (id == "" || id == null) {
     mini.alert("请先保存再点击新建二级动火按钮！");
	 return;
   }
   
   if (status == "8" || status == "10") {
     mini.alert("当前状态无法新建动火票！");
	 return;
   }
   
   
   $.ajax({
     url : "${ctx}/wo-wt/wo/woWt/data2",
     data : {
	  mainTicketId : id,
	  wtType:"6"
     },
     type : "post",
     success : function(text) {	    	
	   var data = mini.decode(text);				
	   if (data.length>0) {		
		  mini.alert("您有未完结的动火票无法开具新票！");
		  return;
	   } else {	
		   $.ajax({//获取新建权限
		       url: "${ctx}/wo-wt/wo/woWt/permit",
		       data:{wtType:"6"},
		       type:"post",
		       success: function (text) {  	             	
		      	 var data = mini.decode(text);
		      	 var addCan = data.addCan;
		      	 if(addCan=="1"){
		      		newTabPage('新建二级动火工作票',woWtNewTabPageUrl+"/form?view=wo/wt/woWtForm6&action=new&showList=0&wtType=6&isStandard=1&mainTicketId="+id+"&correspondingNumber="+serialNumber+"&iamCode="+iamCode,true); 
		      	 }else{           		
		      		mini.alert("您没有新建二级动火工作票权限！");
		      		return false;
		      	 }
		       }
		   }); 
		   
       }
	 }
   });
  
}

//刷新主票关联动火票列表
function refreshGridWoWt5(){
	var grid = mini.get("gridWoWt5");
	grid.reload();
}

//动火工作票
//行双击事件
function onrowdblclick2(e){	  
   var record = e.record;     
   var uid = record.id; 
   var wtType = record.wtType;
   var woWtNewTabPageUrl = "${woWtNewTabPageUrl}";
   var iamCode = iamCodeValue();
   if(wtType=="5"){
	   newTabPage("一级动火工作票查看",'${ctxRoot}/form?view=wo/wt/woWtForm5&border=1&action=view&wtType=5&id=' + uid + '&showList=0&showTree=0&showForm=1'+'&iamCode'+iamCode,true);  
   }else if(wtType=="6"){
	   newTabPage("二级动火工作票查看",'${ctxRoot}/form?view=wo/wt/woWtForm6&border=1&action=view&wtType=6&id=' + uid + '&showList=0&showTree=0&showForm=1'+'&iamCode'+iamCode,true);  
   }  
}

//流程按钮改造
function beforeAddButton(buttonId,buttonList){
   var isAdd=true;
   if(buttonId!="agree"){
	   return isAdd;
   }
   if (buttonList && buttonList.length > 0) {
		for (var i = 0; i < buttonList.length; i++) {
			var button = buttonList[i];
			if(button.alias=="agree1"||button.alias=="agree2"){
				isAdd=false;
				break;
			}
			
		}
	} 
   return isAdd;
}
//流程按钮响应事件
function onBpmButtonClick(buttonId) {  
    var wtType = mini.get("wtType").getValue();
    var isSave =  checkDataChanged();//获取页面是否保存明细数据，true:未保存   false：已保存
    if(isSave==true){
	  mini.alert("请先保存再提交流程！");
	  return;
    }else{
   	       	 
   	 if(buttonId=="agree"){//同意
   		var b = editControl.flowAction(); //提交前验证		
		if(!b){
	        return;
	    }
   	 }
      
      var workLeader = null;  
      if(wtType=="2"||wtType=="5"||wtType=="6"){
    	  workLeader = mini.get("workLeader").getValue(); 
      }else{
    	  if (mini.get("woWtLC.nowWorkLeader").getValue() != null&& mini.get("woWtLC.nowWorkLeader").getValue() != "") {
 			 workLeader = mini.get("woWtLC.nowWorkLeader").getValue();				
 		  } else {
 			 workLeader = mini.get("workLeader").getValue();				
 		  } 
      }
      if(buttonId=="agree1"){//延期
    	  if(mini.get("woWtDelay.delayTime").getValue() == null|| mini.get("woWtDelay.delayTime").getValue() == ""){
    		  mini.alert("请填写延期时间");
    		  return;
    	  }else{
    		  buttonId="agree"; 
    	  }
      }else if(buttonId=="agree2"){//变更负责人
    	  if (mini.get("woWtLC.nowWorkLeader").getValue() == null&& mini.get("woWtLC.nowWorkLeader").getValue() == "") {
    		  mini.alert("请填写变更后的负责人");
    		  return;		
  		  }else{
    		  buttonId="agree"; 
    	  }
      }
		  
      var data = {
        eventName: 'parentClickButton',
        alias: buttonId,
        flowVariables: {//定义流程变量                  
          "workLeader": workLeader || '',//工作负责人 
         },//隐患名称
        data: {}
      };
      sendBpmMsg(data);
      popBox(); 
    } 
 } 

//控制专职监护编辑
function updateIsTutelage(){	
	//根据专职监护人监护进行页面是否可编辑	
	var isAvtive=mini.get("isTutelage");
	var flag=isAvtive.getChecked();
	if(flag){				
		mini.get("tutelageId").setEnabled(true);
		mini.get("tutelageAddress").setEnabled(true);
		mini.get("tutelageContent").setEnabled(true);
	}else{
		mini.get("tutelageId").setEnabled(false);
		mini.get("tutelageAddress").setEnabled(false);
		mini.get("tutelageContent").setEnabled(false);
	} 
	
    
}

//检查工作负责人是否有未完成的工作票，有则无法新建工作票
function onBeforeInsertRecord(){
	   
   $.ajax({
        url: "${ctx}/wo-wt/wo/woWt/checkIsEnd",
        data: {},
        type: "post",
        async:false,
        success: function (text) { 	        	
        	var o = mini.decode(text);
        	console.log(0); 	       	 	
	       	if(o.type == "I"){
		   		showMessageBox("提示",o.message,"info");
		   	}if(o.type == "E"){
		   		showMessageBox("错误",o.message,"error");
		   		throw "aaaa";//用于抛出异常，终止加载新建表单事件
		   	}
	    },
		error: function (jqXHR, textStatus, errorThrown) {
			throw "aaaa";
        }
    });  	    	    
}

//填充指定值到指定字段(安措全部执行)
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
</script>
