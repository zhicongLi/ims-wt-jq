<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript">

/***********主页面start**************/
	//新增操作项   在最下端新增
	function addRowDef(gridId,index)
	{
		var gridTemp = mini.get(gridId);
		var newRow = {};
		copyObjAttr(initInsert(gridId),newRow,1);
		if(index)
		{
			gridTemp.addRow(newRow,index);
		}
		else
		{
			gridTemp.addRow(newRow);
		}
		
		gridTemp.validateRow(newRow);
		gridTemp.scrollIntoView(newRow);
	}
	//选择所属逻辑设备
	function selectEquip(){
		mini.open({ 
			url: "${ctx}/wo/woOt/equipTreeList",       //页面地址
 		    title: "选择逻辑设备",      //标题
 		    width: 400,      //宽度
 		    height: 500,     //高度
 		    allowResize: Boolean,       //允许尺寸调节
 		    allowDrag: Boolean,         //允许拖拽位置
 		    showCloseButton: Boolean,   //显示关闭按钮
 		    showModal: false,         //显示遮罩
 		    loadOnRefresh: false,       //true每次刷新都激发onload事件
 		    ondestroy: function (action) {  
 		    	//弹出页面关闭前
 		    	if (action == "ok")
				{ //如果点击“确定”
 		    		var iframe = this.getIFrameEl();
					//获取选中、编辑的结果
					var tree = iframe.contentWindow.mini.get("treeMain");
					var data = tree.getSelectedNode();
					var json = mini.encode(data);
					if(tree.isLeaf(data)){
						var equipLogicId = mini.get("equipLogicId");
						if(data.id)
						{
							equipLogicId.setValue(data.id);
							equipLogicId.setText(data.id);
							if(data.name){
								mini.get("equipLogicName").setValue(data.name);
							}
							if(data.interNo){
								mini.get("equipLogicInterNo").setValue(data.interNo);
							}
						}
					}else{
						mini.alert("请选择逻辑设备的叶子的节点");
					}
					
				}
 		    }
 		});
	}
	//选择kks后更新相应的物理设备的信息
	 function updateEquip(){
		 var equipLogicId = mini.get("equipLogicId").getValue();
		 $.ajax({
			url:"${ctx}/em/emEquip/getEquipByEquipLogicId",
			data:{equipLogicId:equipLogicId},
			type:"post",
			dataType:"json",
			success:function(text){
				var data = mini.decode(text);
				if(data.type=="I"){
					mini.get("equipId").setValue(data.data.id);
					mini.get("equipName").setValue(data.data.name);
				}else if(data.type=="W"){
					
					mini.get("equipId").setValue(null);
					mini.get("equipName").setValue(null);
					/* showMessageBox("警告",data.message,"warning"); */
				}
					
			}
			
		 });
		 
		
	 }

/***********主页面end**************/


/***********危险点与预防控制措施start**************/
top["otDangerTask"] = window;
//选择附票的危险点
function searchAttachDangerPoint()
	{
	var gridTemp = mini.get("gridWoDangerTask");
		mini.open({
			//targetWindow: window,   //页面对象。默认是顶级页面。
		    url: "${ctx}/wo/woDangerTask/treeList",        //页面地址
		    title: "危险点与预控措施",      //标题
		    width: 500,      //宽度
		    height: 600,     //高度
		    allowResize: Boolean,       //允许尺寸调节
		    allowDrag: Boolean,         //允许拖拽位置
		    showCloseButton: Boolean,   //显示关闭按钮
		    showModal: false,         //显示遮罩
		    loadOnRefresh: false,       //true每次刷新都激发onload事件
		 
			ondestroy : function(action)
			{ //弹出页面关闭前
			if (action == "ok")
			{ //如果点击“确定”
				var iframe = this.getIFrameEl();
				//获取选中、编辑的结果
				
				var tree = iframe.contentWindow.mini.get("tree2");
				var data = tree.getCheckedNodes(false);
				var dangerName = "";
				var measureName = "";
				var siteId = "";
				var newRow = {};
				/* var json = mini.encode(data); */
				for(var i = 0;i < data.length;i++){
						if(data[i].type=="3"){
						measureName = data[i].name;
						siteId = data[i].siteId;
						dangerName = tree.getParentNode(data[i]).name;
						
						newRow = { dangerName: dangerName,descr:measureName,siteId:siteId };
						
						copyObjAttr(initInsert("gridWoDangerTask"),newRow,1);
						gridTemp.addRow(newRow);
						
						gridTemp.scrollIntoView(newRow);
					}	
				}
			}
		}
		});
	}

//执行
function executeMeasure(e){
	
    var gridTemp = e.sender;
    var record = e.record;
    var uid = record._uid;
    var id = record.id;
    var categoryId = record.categoryId;
    var rowIndex = e.rowIndex;
    var readOnly = e.column.readOnly;
    
    var status = record.status;
    var s = '';
    if(status == "1")
		{
 	   s = '<a href="javascript:void()"><i i onclick = "editFormRowById1(this,\'' + gridTemp.id + '\',\'' + id + '\',\'' + uid + '\','+readOnly+')" class="icon-ok-sign" data-tooltip="已执行" data-placement="top" style="color:green;font-size:14px;"></i></a>';
		}
    else
		{
 	   s = '<a href="javascript:void()"><i i onclick = "editFormRowById1(this,\'' + gridTemp.id + '\',\'' + id + '\',\'' + uid + '\','+readOnly+')" class="icon-remove-circle" data-tooltip="执行" data-placement="top" style="color:red;font-size:14px;"></i></a>';
		}
    return s;
	}
	
/* function editFormRowById1(gid,id,uid,readOnly){
	   if(readOnly == true)
		{
		   return;
		}
	  
	   
	   $.ajax({
            url:"${ctx}/wo/woDangerTask/update",
            data:{
            		"id":id,
	    			"status":"1"        	
            		},
            async:true,
            success: function (data) {
            	var o = mini.decode(data);
            	 showTipM("info","提示",o.message);
            	 mini.get("gridWoDangerTask").reload();  
            },
            error: function (jqXHR, textStatus, errorThrown) {
            }
        });  
} */
//执行
function editFormRowById1(cell,gid,id,uid,readOnly){
	   if(readOnly == true)
		{
		   return;
		}
	   var classNam = cell.className;
	   var currUserName = document.getElementById("currUserName").value;
	   if(gid=="gridWoOtLine"){
		  if(classNam == "icon-ok-sign"){
			  var row = mini.get(gid).getSelecteds();
			  if(row.length>1){
			   	mini.alert("请选中仅一条数据后再执行!");
		  	   }else if(row.length==1){
		  		   cell.classList.remove("icon-ok-sign");
				   cell.classList.add("icon-remove-circle");
				   cell.style.color = "red";
				   mini.get(gid).updateRow(row[0],{status:"0"});
				   mini.get(gid).updateRow(row[0],{opTime:null});  
				   mini.get(gid).updateRow(row[0],{execBy:null});  
		  	   }
			   

		  }else{ 
			  var row = mini.get(gid).getSelecteds();
			  if(row.length>1){
			   	mini.alert("请选中仅一条数据后再执行!");
		  	   }
			  else if(row.length==1){
			   cell.classList.add("icon-ok-sign");
			   cell.classList.remove("icon-remove-circle");
			   cell.style.color = "green";
			   mini.get(gid).updateRow(row[0],{status:"1"});
			   mini.get(gid).updateRow(row[0],{execBy:currUserName});
		  	   }
		  }
		   
	   } 
	   else if(gid=="gridWoOtDangerTask"){
		   if(classNam == "icon-ok-sign"){
			   cell.classList.remove("icon-ok-sign");
			   cell.classList.add("icon-remove-circle");
			   cell.style.color = "red";
			   var row = mini.get(gid).getSelected();
			   mini.get(gid).updateRow(row,{status:"0"});
			   mini.get(gid).updateRow(row,{opTime:null});
			   mini.get(gid).updateRow(row[0],{execBy:null}); 

		  }else{
			   cell.classList.add("icon-ok-sign");
			   cell.classList.remove("icon-remove-circle");
			   cell.style.color = "green";
			   var row = mini.get(gid).getSelected();
			   mini.get(gid).updateRow(row,{status:"1"});
			   mini.get(gid).updateRow(row[0],{execBy:currUserName});

		  }
	   }
	   else if(gid=="gridWoDangerTask"){
		   if(classNam == "icon-ok-sign"){
			   cell.classList.remove("icon-ok-sign");
			   cell.classList.add("icon-remove-circle");
			   cell.style.color = "red";
			   var row = mini.get(gid).getSelected();
			   mini.get(gid).updateRow(row,{status:"0"});
			   mini.get(gid).updateRow(row,{opTime:null});
			   mini.get(gid).updateRow(row[0],{execBy:null}); 

		  }else{
			   cell.classList.add("icon-ok-sign");
			   cell.classList.remove("icon-remove-circle");
			   cell.style.color = "green";
			   var row = mini.get(gid).getSelected();
			   mini.get(gid).updateRow(row,{status:"1"});
			   mini.get(gid).updateRow(row[0],{execBy:currUserName});

		  }
	   }
}
	
	
	//上移
	function moveUp(gridId,uid,rowIndex) {
		var lineGrid = mini.get(gridId);
		var row = lineGrid.getRowByUid(uid);
		if (row) {
			var index = lineGrid.indexOf(row);
			lineGrid.moveRow(row, index - 1);
		}
	}
	//下移
	function moveDown(gridId,uid) {
		var lineGrid = mini.get(gridId);
		var row = lineGrid.getRowByUid(uid);
		if (row) {
			var index = lineGrid.indexOf(row);
			lineGrid.moveRow(row, index + 2);
		}
	}
	//插入行
	function insertRow(gridId,uid,rowIndex)
	{	
		var lineGrid = mini.get(gridId);
		var row = lineGrid.getSelected();
	if (row) {
		var index = lineGrid.indexOf(row);
		addRowDef(gridId, index + 1);	
		/* if(gridTempId=="gridWoOtLine")
		{
			addRowDef("gridWoOtLine", index + 1);	
		}
		else if(gridTempId=="gridWoOtDangerTask")
		{
			addRowDef("gridWoOtDangerTask", index + 1);	
		} */
		
	}
	}
	
	//更新危险点与预防控制措施排序字段  
	function updDangerTaskSeqNo()
	{	
	  	var taskGrid = mini.get("gridWoTaskSafeMeasure");
	  	if(objIsNotNull(taskGrid))
	  	{
	  		var rows = taskGrid.getData();
			for(var i = rows.length;i--;){
				taskGrid.updateRow(rows[i],{seqNo:taskGrid.indexOf(rows[i])}); 
			}
	  	}
		
	}
	var searchIndex = -1;//查找到第几行，-1则从头查找
 	var shourceText = "";
 	var curRow = null;
	//查找替换
	function openReplaceWin(grid)
 	{
 		var url = "${ctx}/wo/woOt/lineReplace?grid="+grid;
 		mini.open({
 			//targetWindow: window,   //页面对象。默认是顶级页面。
 		    url: url,        //页面地址
 		    title: "查找替换",      //标题
 		    width: 600,      //宽度
 		    height: 195,     //高度
 		    allowResize: Boolean,       //允许尺寸调节
 		    allowDrag: Boolean,         //允许拖拽位置
 		    showCloseButton: Boolean,   //显示关闭按钮
 		    showModal: false,         //显示遮罩
 		    loadOnRefresh: false,       //true每次刷新都激发onload事件
 		    ondestroy: function (action) {  //弹出页面关闭前
 		    }
 		});
 	}
	
	//查找下一个
 	function searchNext(sourceContent,grid)
 	{	
 		//debugger;
 		shourceText = sourceContent;
 		var rows = null;
 		var gridId = mini.get(grid);
 		rows = gridId.getData();
		var startIndex = searchIndex + 1;
 		for(var i = startIndex;i < rows.length;i++)
 		{
 			var content = rows[i].descr;
 			if(content && content.indexOf(sourceContent) != -1)
 			{
 				//删除上一次查找到行的样式
 				if(curRow != null)
 				{
 					try{
 						gridId.removeRowCls (curRow,"searched");
 					}
 					catch(e){}
 				}
 				//设置当前查找信息
 				searchIndex = i;
 				gridId.addRowCls(rows[i],"searched");
 				curRow = rows[i];//记录当前修改样式的行
 				return null;
 			}
 		}
 		if(searchIndex == -1 && curRow != null)
 		{
 			try{
 				gridId.removeRowCls (curRow,"searched");
			}
			catch(e){}
 		}
 		reset();//重置查询，实现循环查询
 		return "查找完毕！";
 	}
 	//替换 
 	function replace(newText,grid)
 	{
		if(shourceText == "")
		{
			return "您还未查询要替换的内容！";
		}
		if(!curRow)
		{
			return "您还未查询到要替换的内容！";
		}
 		var text = curRow.descr;
 		var reg = "/"+shourceText+"/g";
 		text = text.replace(eval(reg),newText);
 		var gridId = mini.get(grid);
 		gridId.updateRow(curRow,{descr:text});
 		return null;
 	}
 	//替换全部
 	function replaceAll(sourceText,newText,grid)
 	{	
 	
 		var gridId = mini.get(grid);
 		var rows = gridId.getData();
 		var reg = "/"+sourceText+"/g";
 		reg = eval(reg);
 		var count = 0;
 		for(var i = 0;i < rows.length;i++)
 		{
 			var text = rows[i].descr;
 			if(text && text.indexOf(sourceText) != -1)
 			{
 		 		text = text.replace(reg,newText);
 		 		gridId.updateRow(rows[i],{descr:text});
 		 		count++;
 			}
 		}
 		return "替换成功，共替换"+count+"条操作项！";
 	}
 	//查找替换重置
 	function reset()
 	{
 		searchIndex = -1;
 		shourceText = "";
 	}
 	var  childGridArr =   [
 		{
   		     id:"gridWoDangerTask",
             objId:"WoDangerTask",
         	 FK:"taskId",
         	 //visible:true,
         	 cascade:true,
         	 insertPos:"L",
       		 insertType:"A",
      	     // cascadeVisible:true,
         	 tabsId:"tabsMain",
             tabName:"tabWoDangerTaskList",
			 dataUrl:"${ctx}/wo/woDangerTask/data",
			 getUrl:"${ctx}/wo/woDangerTask/get",
			 saveUrl:"${ctx}/wo/woDangerTask/save",
			 removeUrl:"${ctx}/wo/woDangerTask/remove",
			 exportUrl:"${ctx}/wo/woDangerTask/export",
			 initInsertUrl:"${ctx}/wo/woDangerTask/initInsert?ticketCategory=3",
      		}
 	         ];
 	//全部执行
 	function allAct(gid){
 		 
 		 var currUserName = mini.get("currUserName").getValue();
 			 if(gid=="gridWoDangerTask"){
 			   var rows = mini.get(gid).getData();
				/* $('#gridWoOtLine').find('i.icon-remove-circle').map(function (i, ele) {
			           ele[i].classList.add("icon-ok-sign");
			           ele[i].classList.remove("icon-remove-circle");
			           ele[i].style.color = "green";
			       }); */
			       
			  var gridWoDangerTask = mini.get(gid);
			  for(var i=0;i<rows.length;i++){
				 
				  gridWoDangerTask.updateRow(rows[i],{status:"1"});
				  gridWoDangerTask.updateRow(rows[i],{execBy:currUserName});
				  
				}
			  newSaveChild(childGridArr[0]);
		   }
 		}
 	//保存子表
	function newSaveChild(childGridAttr) {

	    var childGridId=childGridAttr.id;


	    if(objIsNotNull(childGridId )){

	        var data= getChildChangeData(childGridAttr);
	        data = cloneJSON(data);
	        var json = mini.encode(fixJSONObj(data));

	        //childGrid.loading("保存中，请稍后......");
	        $.ajax({
	            url: childGridAttr.saveUrl,
	            data: { data: json },
	            type: "post",
	            success: function (text) {

	                if(objIsNotNull(childGridAttr.childGrid) ){
	                    var childGrid = mini.get(childGridId);
	                    var parentRow =  childGrid.getSelected();
	                    if (parentRow) {
	                        parentRow = mini.clone(parentRow);
	                    }
	                    saveChildChildGrid(childGridAttr.childGrid,parentRow);
	                }
	                clearChildGridChanged(childGridAttr);
	                loadChildData(childGridAttr);
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
	        });
	    }

	} 
/***********危险点与预防控制措施end**************/
	
	
/***********文明生产交底start**************/
	//初始化文明生产交底的信息
	function initProduceCont(){
	    
	    //新增时典型票可编辑
	    var  editStr="sotId";
	    controlEdit (editStr,true); 
	   
	    var grid1 = mini.get("gridWoWtProduceCont1");
		var grid2 = mini.get("gridWoWtProduceCont2");
		var row  =  { seqNo: "1",produceContent: "现场使用的器具、机械必须检测合格符合安全要求，并正确使用",produceType:"1" };
		var row1 = { seqNo: "2",produceContent: "作业人员技能及配备、特种作业人员资格必须符合施工项目要求",produceType:"1"  };
		var row2 = { seqNo: "3",produceContent: "检修现场照明照度应符合要求" ,produceType:"1"  };
		var row3 = { seqNo: "4",produceContent: "临时安全防护、隔离、警示标志牌设置齐全和规范" ,produceType:"1" };
		var row4 = { seqNo: "5",produceContent: "作业中杜绝违章作业",produceType:"1"};
		var row5 = { seqNo: "6",produceContent: "检修中工器具、备品备件、拆除物件、材料做到定置摆放",produceType:"1"};
		var row6 = { seqNo: "7",produceContent: "检修中拆除的废旧物件、材料、垃圾、废油等及时清理出现场，保持工作场所文明整洁",produceType:"1"};
		var row7 = { seqNo: "8",produceContent: "检修中水、油、煤、粉、灰尘及其他化学物品不得污染环境",produceType:"1"};
		
/* 		copyObjAttr(initInsert(grid1),row,1);
		copyObjAttr(initInsert(grid1),row1,1);
		copyObjAttr(initInsert(grid1),row2,1);
		copyObjAttr(initInsert(grid1),row3,1);
		copyObjAttr(initInsert(grid1),row4,1);
		copyObjAttr(initInsert(grid1),row5,1);
		copyObjAttr(initInsert(grid1),row6,1);
		copyObjAttr(initInsert(grid1),row7,1);
		 */
		grid1.addRow(row);
		grid1.addRow(row1);
		grid1.addRow(row2);
		grid1.addRow(row3);
		grid1.addRow(row4);
		grid1.addRow(row5);
		grid1.addRow(row6);
		grid1.addRow(row7);
		
		var row8  = { seqNo: "1",produceContent: "全部检修工作已结束，作业人员已撤离",produceType:"2" };
		var row9  = { seqNo: "2",produceContent: "安全设施齐全，符合安全文明生产标准要求",produceType:"2"  };
		var row10 = { seqNo: "3",produceContent: "现场照明、保温齐全、瓷砖无破损，无其他不符合安全文明生产要求的状况" ,produceType:"2" };
		var row11 = { seqNo: "4",produceContent: "设备、设施无渗漏，设备、设施、地面无污染" ,produceType:"2" };
		var row12 = { seqNo: "5",produceContent: "现场临时检修用设备、器具、设施全部拆除，运出检修现场",produceType:"2"};
		var row13 = { seqNo: "6",produceContent: "设备标牌、阀门标牌、手轮齐全、转向标识清晰",produceType:"2"};
		var row14 = { seqNo: "7",produceContent: "现场安全设施、标志标识齐全，符合安全文明生产要求",produceType:"2"};
		var row15 = { seqNo: "8",produceContent: "现场环境卫生合格，无积灰、积煤（粉）、积油、积水及遗留污渍",produceType:"2"};
		
		/* copyObjAttr(initInsert(grid2),row8,1);
		copyObjAttr(initInsert(grid2),row9,1);
		copyObjAttr(initInsert(grid2),row10,1);
		copyObjAttr(initInsert(grid2),row11,1);
		copyObjAttr(initInsert(grid2),row12,1);
		copyObjAttr(initInsert(grid2),row13,1);
		copyObjAttr(initInsert(grid2),row14,1);
		copyObjAttr(initInsert(grid2),row15,1); */
		
		grid2.addRow(row8);
		grid2.addRow(row9);
		grid2.addRow(row10);
		grid2.addRow(row11);
		grid2.addRow(row12);
		grid2.addRow(row13);
		grid2.addRow(row14);
		grid2.addRow(row15);
		
		var wtType = mini.get("wtType").getValue();
		if(wtType=="1"||wtType=="2"){
			specIds = "1";
		}else{
			specIds = "2";
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
	
	//重写文明生产交底的新增方法
	function addRowDefNew(id,produceType){
		var grid=mini.get(id);
		var wowtId=mini.get("id").getValue();
		var row={ produceContent: "",produceType:produceType};
		var gridData = grid.getData();
		$.ajax({
		        url:"${ctx}/wo/woWtProduceCont/findDataCount?produceType="+produceType,
		        data: {wtId:wowtId },
		        type: "post",
		        success: function (data) {
		        	if(data==gridData.length){
		        		row.seqNo=data+1;
			        	grid.addRow(row);
		        	}else{
		        		row.seqNo=gridData.length+1;
		        		grid.addRow(row);
		        	}
		        	
		        }
		       
		    }); 
	}

/***********文明生产交底end**************/


//监控页面是否显示，只有当票被许可之后，监控的tab页面才会显示
function getCameraAndGuard(){
 		var locationId = mini.get("locationId");
 		
 		$("#tabCameraList").empty();
 		if(locationId!=undefined){
 			locationId = locationId.getValue();
 			var iframeCamera = "";
 			var iframeGuard = "";
 			if(locationId!=null&&locationId!=""){
 				 $.ajax({
 	 	 	        url: "${ctx}/em/emEquipCamera/data",
 	 	 	        data: { equipId: locationId },
 	 	 	        type: "post",
 	 	 	        success: function (text) {
 	 	 	        	var data = mini.decode(text);
 	 	 	     		var tabs = mini.get("tabsMain");
 	 	 	     		var videoServer = document.getElementById("videoServer").value;
 	 	 	        	var tab = tabs.getTab("tabCameraAndGuard");//小div的id 即要隐藏的那个
 	 	 	        	if(data.data.length!=0){
 	 	 	        		for(var i = 0;i<data.data.length;i++){
 	 	 	 	        		iframeCamera += '<iframe src='+videoServer+'?ip='+data.data[i].ip+' id="" name="" frameborder="0"  scrolling="no" width="100%"  height="350px" ></iframe>';
 	 	 	 	        	}
 	 	 	        	}
 	 	 	        	//iframeCamera = iframeCamera.replace("/\r\n/g","");
 	 	 	        	
 	 	        		$("#tabCameraList").empty();
 	 	 	        	$('#tabCameraList').append(iframeCamera);
 	 	 	        	
 	 	 	        	
 	 	 /* 	        	for(var y = 0;y<tabs.length;y++){
 	 	 	        		if(tabs[y].name=="tabCameraAndGuard"){
 	 	 	        			if(mini.get("permitByName_").getValue()!=null&&mini.get("permitByName_").getValue()!=""){
 	 	 	 	 	        		mini.get("tabsMain").updateTab(mini.get("tabCameraAndGuard").getTab(), { visible: true });
 	 	 	 	 	        	}else{
 	 	 	 	 	        		mini.get("tabsMain").updateTab(mini.get("tabCameraAndGuard"), { visible: false });
 	 	 	 	 	        		alert(111)
 	 	 	 	 	        	}
 	 	 	        		}
 	 	 	        	} */
 	 	 	        	
 	 	 	        	if(mini.get("permitByName_").getValue()!=null&&mini.get("permitByName_").getValue()!=""&&mini.get("status").getValue()!="10"){
 	 	 	        		
 	 	 	        		/* if(iframeCamera==""||iframeCamera==null){
 	 	 	 	        		tabs.updateTab(tab, { visible: false });
 	 	 	 	        	}else{ */
 	 	 	 	        		tabs.updateTab(tab, { visible: true });
 	 	 	 	        	/* } */
 	 	 	        	}else{
 	 	 	        		tabs.updateTab(tab, { visible: false });
 	 	 	        	}
 	 	 	        }
 	 	 	     });
 			}
 	 	/* 	 $.ajax({
 	  	        url: "${ctx}/em/emLogicGuard/data",
 	  	        data: { equipId: locationId },
 	  	        async:false,
 	  	        type: "post",
 	  	        success: function (text) {
 	  	        	var data = mini.decode(text);
 	  	        	for(var y = 0;y<data.data.length;y++){
 	  	        		//iframeGuard += '<iframe src="http://10.203.1.75:8080/video.html?ip=\''+data.data[y].ip+'\'" frameborder="0" scrolling="no" style="border:0px;"></iframe>';
 	 	        		iframeGuard += '<iframe src="http://10.203.1.75:8080/video.html?ip=10.203.32.26" frameborder="0" scrolling="no" style="border:0px;"></iframe>';

 	  	        	}
 	  	        	iframeGuard = iframeGuard.replace("/\r\n/g","");
 	  	        	$("#tabGuardList").empty();
 					$("#tabGuardList").append(iframeGuard);
 	  	        }
 	  	 		
 	  	     });
 	 		  */
 		}
 		
 	}
/* function defaulIframePageHeight()

{
	var ifm = document.getElementById("defaulIframePage");
	var subWeb = document.frames ? document.frames["defaulIframePage"].document : ifm.contentDocument;
	if (ifm != null && subWeb != null)
	{
		ifm.height = subWeb.body.scrollHeight;
	}
} */

//填充工作负责人
  function padWorkLeader(){
	var wtType = mini.get("wtType").getValue();
	if(wtType=="1"||wtType=="2"||wtType=="3"||wtType=="4"){
		var workLeader = mini.get("workLeader").getValue();
		var workLeaderName = mini.get("workLeader").getText();
		mini.get("workLeaderSignName_").setValue(workLeader);
		mini.get("workLeaderSignName_").setText(workLeaderName);
	}else if(wtType=="5"||wtType=="6"){
		var workLeader = mini.get("workLeader").getValue();
		var workLeaderName = mini.get("workLeaderName").getValue();
		mini.get("smDutyPrincipalName_").setValue(workLeader);
		mini.get("smDutyPrincipalName_").setText(workLeaderName);
	}
	
 }
 
//选择工序对应的危险源
 function searchDangerSource(){
	var grid = mini.get("gridWoTaskSafeMeasure");
	var gridRow = grid.getSelected();
	if(gridRow==null){
		mini.alert("请选择某条工序后再选择其对应的危险源！");
		return ;
	}
	if(gridRow.seqNo==undefined){
		mini.alert("请保存该条工序后再选择其对应的危险源！");
		return ;
	}
	popLov(this,'选择危险源',true,true,'${ctx}/wo/woDangerSourceInfo/form?showForm=0',850,500,'','',null,function(data){
		for (var i = 0, l = data.length; i < l; i++) {
			var row = data[i];
			if(i==0){
				if(gridRow.dangerSourceName==null){
					grid.updateRow(gridRow, {'dangerSourceName':row.sourceName,'factorName':row.factorName,'measureName':row.measureName,
						'riskGradeCode':row.riskGradeCode,'riskGradeName':row.riskGradeName,'consequenceName':row.consequenceName,'consequenceCode':row.consequenceCode,
						'dangerSourceId':row.dangerSourceId,'seqNo':grid.indexOf(gridRow)} );
				}else{
					var newRow = {'dangerSourceName':row.sourceName,'factorName':row.factorName,'measureName':row.measureName,
							'riskGradeCode':row.riskGradeCode,'riskGradeName':row.riskGradeName,'consequenceName':row.consequenceName,'consequenceCode':row.consequenceCode,
							'dangerSourceId':row.dangerSourceId,'processName':gridRow.processName,'seqNo':gridRow.seqNo};
						grid.addRow(newRow);
				}
				
			}else{
				var newRow = {'dangerSourceName':row.sourceName,'factorName':row.factorName,'measureName':row.measureName,
					'riskGradeCode':row.riskGradeCode,'riskGradeName':row.riskGradeName,'consequenceName':row.consequenceName,'consequenceCode':row.consequenceCode,
					'dangerSourceId':row.dangerSourceId,'processName':gridRow.processName,'seqNo':gridRow.seqNo};
				grid.addRow(newRow);
			}
        }
		saveForm();
	});
} 

//选择工序对应的危险源（新版，直接有工序）
function searchDangerSourceWork(){
	var grid = mini.get("gridWoTaskSafeMeasure");
	/* var gridRow = grid.getSelected();
	if(gridRow==null){
		mini.alert("请选择某条工序后再选择其对应的危险源！");
		return ;
	}
	if(gridRow.seqNo==undefined){
		mini.alert("请保存该条工序后再选择其对应的危险源！");
		return ;
	} */
	//debugger;
	popLov(this,'选择危险源',true,true,'${ctxRoot}/form?view=wo/woDangerSourceInfoFormNew&showForm=0',1000,500,'','',null,function(data){
		console.log(mini.encode(data));
		for (var i = 0, l = data.length; i < l; i++) {
				var row = data[i];
				var newRow = {'dangerSourceName':row.sourceName,'factorName':row.factorName,'measureName':row.measureName,
						'riskGradeCode':row.riskGradeCode,'riskGradeName':row.riskGradeName,'consequenceName':row.consequenceName,'consequenceCode':row.consequenceCode,
						'dangerSourceId':row.dangerSourceId,'processName':row.processName,'seqNo':row.seqNo1};
					grid.addRow(newRow);
				
        }

		saveForm();
	});
}

	//获取逻辑设备对应的检修围栏名称
	function getOverhaulFenceName(){
		var equipLogicId = mini.get("equipLogicId").getValue();
		var id = mini.get("id").getValue();
		var iframeSvg = "";
		var status = mini.get("status").getValue();
		var data2=[];
		if(id!=undefined&&id!=null&&id!=""){
			if(equipLogicId!=undefined&&equipLogicId!=null){
				 $.ajax({
			 	        url: "${ctx}/wo/woWt/getOverhaulFenceName",
			 	        data: { equipLogicId:equipLogicId },
			 	        type: "post",
			 	        success: function (text) {				 	        	
			 	        	var data = mini.decode(text);			 	        	
			 	        	//mini.get("treeMainTypeNew").setData(data2);
			 	        	if(data!=undefined&&data!=null){
			 	        		var uapSpecifySvgEdit = document.getElementById("uapSpecifySvgEdit").value;
			 	        		var uapSpecifySvgView = document.getElementById("uapSpecifySvgView").value;
			 	        		var uapSvgOverhaulPerson = document.getElementById("uapSvgOverhaulPerson").value; 
			 	        		
			 	        		var uapSvgOverhaulPerson = document.getElementById("uapSvgOverhaulPerson").value;
				 	        	if(data.length>0){
				 	        		for (var i = 0; i < data.length; i++) {//检修围栏区域过滤
										if(data[i].svgName=="主厂房0米"||data[i].svgName=="主厂房6.9米"||data[i].svgName=="主厂房14.5米"){
											data2.add(data[i]);
										}				 	        			
									}
				 	        		mini.get("treeMainTypeNew").setData(data2);
				 	        		//uapSpecifySvgEdit= uapSpecifySvgEdit+"?"+data[0].localSvgName+"#"+id;
				 	        		//uapSpecifySvgView = uapSpecifySvgView+"?"+data[0].localSvgName+"#"+id;
				 	        		uapSpecifySvgEdit= uapSpecifySvgEdit+"?"+data2[0].localSvgName+"#"+id;
				 	        		uapSpecifySvgView = uapSpecifySvgView+"?"+data2[0].localSvgName+"#"+id; 				 	        		
				 	        		uapSvgOverhaulPerson = uapSvgOverhaulPerson+"?#"+id;
				 	        		var wtType = mini.get("wtType").getValue();
					 	       		var workLeader ="";
					 	       		if(wtType!="8"){
					 	       			workLeader = mini.get("workLeader").getValue();	
					 	       		}else{
					 	       			workLeader = mini.get("appUnitLeader").getValue();
					 	       		}
					 	       		var procInsId = mini.get("procInsId").getValue();
				 	        		if(status=="1"){
					 	       			 var userInfoJson = getCurrUserInfo(false);
					 	       			 var userInfo = mini.decode(userInfoJson);
					 	       			 var userInfoId = userInfo.id;
					 	       			 if(workLeader==userInfoId){
					 	       				iframeSvg = '<iframe src='+uapSpecifySvgEdit+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>'; 
					 	       			 }else{
					 	       				iframeSvg = '<iframe src='+uapSpecifySvgView+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
					 	       			 }					 	       			
				 	       			}
				 	       			else if(status=="2"||status=="3"||status=="4"){
				 	       			 $.ajax({
				 	       	 	        url: "${ctx}/wo/woWt/getCurrActUser",
				 	       	 	        data: { procInsId:procInsId },
				 	       	 	        type: "post",
				 	       	 	      	async: false,
				 	       	 	        success: function (text) {
				 	       	 	        	if(text=="true"){
				 	       	 	        		iframeSvg = '<iframe src='+uapSpecifySvgEdit+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
				 	       	 	        	}else{
				 	       	 	        		iframeSvg = '<iframe src='+uapSpecifySvgView+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
				 	       	 	        	}
				 	       	 	        }
				 	       	 	     });
				 	       			} else{
					 	       			iframeSvg = '<iframe src='+uapSpecifySvgView+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="68%" ></iframe>';
					 	       			iframeSvg = iframeSvg+'<iframe src='+uapSvgOverhaulPerson+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="31%" ></iframe>';
					 	       		}
				 	       		//因为需求变更，由原来的工作负责人和工作签发人画检修围栏改为工作票许可人画检修围栏
					 	       	/* if(status=="3"){
				 	       			 $.ajax({
				 	       	 	        url: "${ctx}/wo/woWt/getCurrActUser",
				 	       	 	        data: { procInsId:procInsId },
				 	       	 	        type: "post",
				 	       	 	      	async: false,
				 	       	 	        success: function (text) {
				 	       	 	        	if(text=="true"){
				 	       	 	        		iframeSvg = '<iframe src='+uapSpecifySvgEdit+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
				 	       	 	        	}else{
				 	       	 	        		iframeSvg = '<iframe src='+uapSpecifySvgView+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
				 	       	 	        	}
				 	       	 	        }
				 	       	 	     });
				 	       		}else{
				 	       			iframeSvg = '<iframe src='+uapSpecifySvgView+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="68%" ></iframe>';
				 	       			iframeSvg = iframeSvg+'<iframe src='+uapSvgOverhaulPerson+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="31%" ></iframe>';
				 	       		} */
				 	        		
				 	 	        //alert(iframeSvg);	
			 	        		$("#tabOverhaulFenceList").empty();
			 	 	        	$('#tabOverhaulFenceList').append(iframeSvg);
				 	        	} 
			 	        	}
			 	        }
			 	     });
				 //输煤SVG图
				 $.ajax({
			 	        url: "${ctx}/wo/woWt/getOverhaulFenceName2",
			 	        data: { equipLogicId:equipLogicId },
			 	        type: "post",
			 	        success: function (text) {				 	        	
			 	        	var data = mini.decode(text);			 	        	
			 	        	//mini.get("treeMainTypeNew").setData(data2);
			 	        	if(data!=undefined&&data!=null){			 	        		
			 	        		var uapSpecifySvgEdit2 = document.getElementById("uapSpecifySvgEdit2").value;
			 	        		var uapSpecifySvgView2 = document.getElementById("uapSpecifySvgView2").value;
			 	        		var uapSvgOverhaulPerson2 = document.getElementById("uapSvgOverhaulPerson").value;
				 	        	if(data.length>0){
				 	        		for (var i = 0; i < data.length; i++) {//检修围栏区域过滤										
				 	        			/* if(data[i].svgName=="C28B.jpg"||data[i].svgName=="总图.jpg"){
											data2.add(data[i]);
										} */
				 	        			if(data[i].localSvgName=="输煤地图"){
											data2.add(data[i]);
										}
									}
				 	        		mini.get("treeMainTypeNew").setData(data2);				 	        		
				 	        		uapSpecifySvgEdit2= uapSpecifySvgEdit2+"?"+data2[0].svgName+"#"+id;
				 	        		uapSpecifySvgView2 = uapSpecifySvgView2+"?"+data2[0].svgName+"#"+id;
				 	        		uapSvgOverhaulPerson2 = uapSvgOverhaulPerson2+"?#"+id;
				 	        		var wtType = mini.get("wtType").getValue();
					 	       		var workLeader ="";
					 	       		if(wtType!="8"){
					 	       			workLeader = mini.get("workLeader").getValue();	
					 	       		}else{
					 	       			workLeader = mini.get("appUnitLeader").getValue();
					 	       		}
					 	       		var procInsId = mini.get("procInsId").getValue();
				 	        		if(status=="1"){
					 	       			 var userInfoJson = getCurrUserInfo(false);
					 	       			 var userInfo = mini.decode(userInfoJson);
					 	       			 var userInfoId = userInfo.id;
					 	       			 if(workLeader==userInfoId){
					 	       				iframeSvg = '<iframe src='+uapSpecifySvgEdit2+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>'; 
					 	       			 }else{
					 	       				iframeSvg = '<iframe src='+uapSpecifySvgView2+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
					 	       			 } 
					 	       			
				 	       			}
				 	       			else if(status=="2"||status=="3"||status=="4"){
				 	       			 $.ajax({
				 	       	 	        url: "${ctx}/wo/woWt/getCurrActUser",
				 	       	 	        data: { procInsId:procInsId },
				 	       	 	        type: "post",
				 	       	 	      	async: false,
				 	       	 	        success: function (text) {
				 	       	 	        	if(text=="true"){
				 	       	 	        		iframeSvg = '<iframe src='+uapSpecifySvgEdit2+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
				 	       	 	        	}else{
				 	       	 	        		iframeSvg = '<iframe src='+uapSpecifySvgView2+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
				 	       	 	        	}
				 	       	 	        }
				 	       	 	     });
				 	       			} else{
					 	       			iframeSvg = '<iframe src='+uapSpecifySvgView2+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="68%" ></iframe>';
					 	       			iframeSvg = iframeSvg+'<iframe src='+uapSvgOverhaulPerson2+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="31%" ></iframe>';
					 	       		}
				 	       		
			 	        		//$("#tabOverhaulFenceList").empty();
			 	 	        	//$('#tabOverhaulFenceList').append(iframeSvg);
				 	        	} 
			 	        	}
			 	        }
			 	     });
				 //getOverhaulPerson(id);
			}
		}else{
			$("#tabOverhaulFenceList").empty();
			mini.get("treeMainTypeNew").setData("");
		}
	}
	function getOverhaulPerson(id){
		 $.ajax({
	 	        url: "${ctx}/wo/woWt/getOverhaulPerson",
	 	        data: { wtId:id },
	 	        type: "post",
	 	        success: function (text) {
	 	        	
	 	        }
	 	     });
	}
	//获取并编辑不同svg图片
	function loadNodeData(e){	
		debugger;
		var data = e.node;
		var id = mini.get("id").getValue();
		var wtType = mini.get("wtType").getValue();
		var workLeader ="";
		if(wtType!="8"){
			workLeader = mini.get("workLeader").getValue();	
		}else{
			workLeader = mini.get("appUnitLeader").getValue();
		}
		var procInsId = mini.get("procInsId").getValue();
		/* var uapSpecifySvgEdit = document.getElementById("uapSpecifySvgEdit").value;
		var uapSpecifySvgView = document.getElementById("uapSpecifySvgView").value;
		var uapSvgOverhaulPerson = document.getElementById("uapSvgOverhaulPerson").value;
		uapSpecifySvgEdit= uapSpecifySvgEdit+"?"+data.localSvgName+"#"+id;
 		uapSpecifySvgView = uapSpecifySvgView+"?"+data.localSvgName+"#"+id;
 		uapSvgOverhaulPerson = uapSvgOverhaulPerson+"?#"+id;
 		var status = mini.get("status").getValue();
 		if(status=="1"){
 			 var userInfoJson = getCurrUserInfo(false);
 			 var userInfo = mini.decode(userInfoJson);
 			 var userInfoId = userInfo.id;
 			 if(workLeader==userInfoId){
 				iframeSvg = '<iframe src='+uapSpecifySvgEdit+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>'; 
 			 }else{
 				iframeSvg = '<iframe src='+uapSpecifySvgView+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
 			 }
 		}
 		else if(status=="2"||status=="3"||status=="4"){
 			 $.ajax({
 	 	        url: "${ctx}/wo/woWt/getCurrActUser",
 	 	        data: { procInsId:procInsId },
 	 	        type: "post",
 	 	      	async: false,
 	 	        success: function (text) {
 	 	        	if(text=="true"){
 	 	        		iframeSvg = '<iframe src='+uapSpecifySvgEdit+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
 	 	        	}else{
 	 	        		iframeSvg = '<iframe src='+uapSpecifySvgView+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
 	 	        	}
 	 	        }
 	 	     });
 		}else{
 			iframeSvg = '<iframe src='+uapSpecifySvgView+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="68%" ></iframe>';
 			iframeSvg = iframeSvg+'<iframe src='+uapSvgOverhaulPerson+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="31%" ></iframe>';
 		} */
 		var uapSpecifySvgEdit;
 		var uapSpecifySvgView;
 		if(data.localSvgName=="输煤地图"){
 			uapSpecifySvgEdit = document.getElementById("uapSpecifySvgEdit2").value;
 			uapSpecifySvgView = document.getElementById("uapSpecifySvgView2").value;
 			uapSpecifySvgEdit= uapSpecifySvgEdit+"?"+data.svgName+"#"+id;
 	 		uapSpecifySvgView = uapSpecifySvgView+"?"+data.svgName+"#"+id;
 		}else{
 			uapSpecifySvgEdit = document.getElementById("uapSpecifySvgEdit").value;
 			uapSpecifySvgView = document.getElementById("uapSpecifySvgView").value;
 			uapSpecifySvgEdit= uapSpecifySvgEdit+"?"+data.localSvgName+"#"+id;
 	 		uapSpecifySvgView = uapSpecifySvgView+"?"+data.localSvgName+"#"+id;
 		}
		
		var uapSvgOverhaulPerson = document.getElementById("uapSvgOverhaulPerson").value;
		/* uapSpecifySvgEdit= uapSpecifySvgEdit+"?"+data.svgName+"#"+id;
 		uapSpecifySvgView = uapSpecifySvgView+"?"+data.svgName+"#"+id; */
 		uapSvgOverhaulPerson = uapSvgOverhaulPerson+"?#"+id;
 		var status = mini.get("status").getValue();
 		if(status=="1"){
 			 var userInfoJson = getCurrUserInfo(false);
 			 var userInfo = mini.decode(userInfoJson);
 			 var userInfoId = userInfo.id;
 			 if(workLeader==userInfoId){
 				iframeSvg = '<iframe src='+uapSpecifySvgEdit+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>'; 
 			 }else{
 				iframeSvg = '<iframe src='+uapSpecifySvgView+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
 			 }
 		}
 		else if(status=="2"||status=="3"||status=="4"){
 			 $.ajax({
 	 	        url: "${ctx}/wo/woWt/getCurrActUser",
 	 	        data: { procInsId:procInsId },
 	 	        type: "post",
 	 	      	async: false,
 	 	        success: function (text) {
 	 	        	if(text=="true"){
 	 	        		iframeSvg = '<iframe src='+uapSpecifySvgEdit+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
 	 	        	}else{
 	 	        		iframeSvg = '<iframe src='+uapSpecifySvgView+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
 	 	        	}
 	 	        }
 	 	     });
 		}else{
 			iframeSvg = '<iframe src='+uapSpecifySvgView+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="68%" ></iframe>';
 			iframeSvg = iframeSvg+'<iframe src='+uapSvgOverhaulPerson+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="31%" ></iframe>';
 		}
 		//因为需求变更，由原来的工作负责人和工作签发人画检修围栏改为工作票许可人画检修围栏
 	/* 	if(status=="3"){
   			 $.ajax({
   	 	        url: "${ctx}/wo/woWt/getCurrActUser",
   	 	        data: { procInsId:procInsId },
   	 	        type: "post",
   	 	      	async: false,
   	 	        success: function (text) {
   	 	        	if(text=="true"){
   	 	        		iframeSvg = '<iframe src='+uapSpecifySvgEdit+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
   	 	        	}else{
   	 	        		iframeSvg = '<iframe src='+uapSpecifySvgView+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="100%" ></iframe>';
   	 	        	}
   	 	        }
   	 	     });
   		} else{
 			iframeSvg = '<iframe src='+uapSpecifySvgView+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="68%" ></iframe>';
 			iframeSvg = iframeSvg+'<iframe src='+uapSvgOverhaulPerson+' id="" name="" frameborder="0"  scrolling="yes" width="100%"  height="31%" ></iframe>';
 		}*/
		$("#tabOverhaulFenceList").empty();
      	$('#tabOverhaulFenceList').append(iframeSvg);
	}
</script>