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
 
//选择工序对应的危险源（新版，直接有工序）
function searchDangerSourceWork(){
	var grid = mini.get("gridWoTaskSafeMeasure");	
	//debugger;
	popLov(this,'选择危险源',true,true,'${ctxRoot}/form?view=wo/woDangerSourceInfoForm&showForm=0',1000,500,'','',null,function(data){
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

	
</script>