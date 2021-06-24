<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<html>
<head>
	 <title>工作票押票和恢复</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" /> 
</head>
<body>
	
	<div id="editform" class="form" style="width:100%;">
		<table class="formtable" style="border-collapse:separate; border-spacing:10px;">
			<tr>
					<td id="keTimeTd">押票时间：</td>
					<td id="keTime">
						<input name="keepTime" id="keepTime" class="mini-datepicker" showTime="true"  vtype = "" format="yyyy-MM-dd HH:mm:ss" required="true" allowInput="false"/>
					</td>
					<td id="reTimeTd">恢复时间：</td>
					<td id="reTime">
						<input name="restoreTime" id="restoreTime" class="mini-datepicker" showTime="true"  vtype = "" format="yyyy-MM-dd HH:mm:ss" required="true" allowInput="false"/>
					</td>
					<td>工作负责人签名:</td>
					<td >
						<input name="workLeader" id="keepAndRestoreWorkLeaderName_" textName="workLeaderName" onbuttonclick="sign_('keepAndRestoreWorkLeaderName_','1')" allowInput="false"  class="mini-buttonedit defSign_" vtype = "" required="true" />
						<!-- <input name="workLeader" id="keepAndRestoreWorkLeaderName_" textName="workLeaderName" onbuttonclick="openFingerVerify('1','keepAndRestoreWorkLeaderName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="true" /> -->
						<!-- <a class="mini-button"  id="keepAndRestoreWorkLeaderName_" name="keepAndRestoreWorkLeaderName_" value="1" onClick="sign(this.name,this.value)">签字</a> -->
					</td>
				</tr>
				
				<tr id="keep">
					<td>工作票许可人签名:</td>
					<td >
						<input name="keepPermitBy" id="keepPermitByName_" textName="keepPermitByName" onbuttonclick="sign_('keepPermitByName_','3')" allowInput="false"  class="mini-buttonedit defSign_" vtype = "" required="true" />
						<!-- <input name="keepPermitBy" id="keepPermitByName_" textName="keepPermitByName" onbuttonclick="openFingerVerify('3','keepPermitByName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="true" /> -->
						<!-- <a class="mini-button"  id="keepPermitByName_" name="keepPermitByName_" value="3" onClick="sign(this.name,this.value)">签字</a> -->
					</td>
					
				</tr>
				
				<tr id="restore">
					<td>工作票许可人签名:</td>
					<td >
						<input name="restorePermitBy" id="restorePermitByName_" textName="restorePermitByName" onbuttonclick="sign_('restorePermitByName_','3')" allowInput="false"  class="mini-buttonedit defSign_" vtype = "" required="true" /> 
						<!-- <input name="restorePermitBy" id="restorePermitByName_" textName="restorePermitByName" onbuttonclick="openFingerVerify('3','restorePermitByName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="true" /> -->
						<!-- <a class="mini-button"  id="restorePermitByName_" name="restorePermitByName_" value="3" onClick="sign(this.name,this.value)">签字</a> -->
					</td>
					
				</tr>
				
				
			</table>
			<br>
			<input class="mini-hidden" name="actionStatus" id="actionStatus" value="${param.actionStatus}"/>
			<!-- <input class="mini-hidden" name="restorePermitBy" id="restorePermitBy"/>
			<input class="mini-hidden" name="keepPermitBy" id="keepPermitBy"/> -->
			<input class="mini-hidden" name="id" id="id" value="${param.wtId}"/>
			<input class="mini-hidden" name="wtId" id="wtId" value="${param.wtId}"/>
			<input class="mini-hidden"  id="workLeader" value="${param.keepAndRestoreWorkLeader}"/>
			<!-- <input class="mini-hidden" name="workLeader" id="keepAndRestoreWorkLeader" /> -->
			<input class="mini-hidden" name="wtType" id="wtType" value="${param.wtType }"/>
			<!-- 新增 责任部门2020.01.03 -->
			<input class="mini-hidden" id="dutyOrgId" name="dutyOrgId" value="${param.dutyOrgId}"/>
			
			</div>
			<div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:92%;"
					 url="${ctx}/wo-wt/wo/woWtKeepRestore/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellEdit="false" allowCellSelect="false" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div type="indexcolumn"></div>
							<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="wtId" field="wtId" vtype=""   headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">wt_id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="wtId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="workLeader" field="workLeader" vtype=""   headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">工作负责人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="workLeader-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="workLeaderName" field="workLeaderName" vtype=""   headerAlign="center" allowSort="true" width="64" >工作负责人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="workLeaderName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="keppPermitBy" field="keppPermitBy" vtype=""   headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">kepp_permit_by
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="keppPermitBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="keepPermitByName" field="keepPermitByName" vtype=""   headerAlign="center" allowSort="true" width="64" >押票许可人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="keepPermitByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="restorePermitBy" field="restorePermitBy" vtype=""   headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">恢复许可人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="restorePermitBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="restorePermitByName" field="restorePermitByName" vtype=""   headerAlign="center" allowSort="true" width="64" >恢复许可人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="restorePermitByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="keepTime" field="keepTime" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >押票时间
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="keepTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="restoreTime" field="restoreTime" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >恢复时间
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="restoreTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
								/>
							</div>
							
		        </div>
		    </div>
		    <div id="buttonDiv" style="text-align:center;height: 8%;">
				<a class="mini-button" iconCls="icon-check" id="confimButton" style="width:70px;" onclick="onLovOk()">确定</a>
				<span style="display:inline-block;width:25px;"></span>
				<a class="mini-button" iconCls="icon-close" id="resetButton" style="width:70px;" onclick="onLovCancel()">取消</a>
			</div>
		   </div>
			<jsp:include page="/WEB-INF/views/include/sign.jsp"></jsp:include>
			<sys:toolbarfooter></sys:toolbarfooter>
<%-- <jsp:include page="permit.jsp"></jsp:include> --%>
		
<script type="text/javascript">

	initBase(
		{   id:"datagridMain",
		    objId:"WoWtKeepRestore",
			dataUrl:"${ctx}/wo-wt/wo/woWtKeepRestore/data"
		 }
       );
	loadWindow();
	var showMessage = null;
	function onLovOk()
	{	
		var actionStatus = mini.get("actionStatus").getValue();
		//恢复
		if(actionStatus=="restoreTicket"){
		var workLeader = mini.get("workLeader").getValue();
		var form = new mini.Form("#editform");
		var wtId = mini.get("wtId").getValue();
		form.validate();
	    if (form.isValid() == false) {
	        showMessageBox("警告","保存失败,请检查输入内容(必填项,格式错误等)!","warning");
	        return;
	    }
		$.ajax({
			url:"${ctx}/wo-wt/wo/woWtKeepRestore/CheckCanRestore",
			data:{wtId:wtId},
			type:"post",
            success: function (o) {
            	var data = mini.decode(o);
        		if(data.type=="E"){
        			showMessageBox("错误",data.message,"error");
        			
        		}else if(data.type=="I"){
        			var wtId = mini.get("wtId").getValue();
        			var keepAndRestoreWorkLeaderName  = mini.get("keepAndRestoreWorkLeaderName_").getText();
        			var keepPermitBy = mini.get("keepPermitByName_").getValue();
        			var restorePermitBy = mini.get("restorePermitByName_").getValue();
        			var keepAndRestoreWorkLeader = mini.get("keepAndRestoreWorkLeaderName_").getValue();
        			var keepPermitByName = mini.get("keepPermitByName_").getText();
        			var restorePermitByName = mini.get("restorePermitByName_").getText();
        			var restoreTime = mini.get("restoreTime").getFormValue();
        			var keepTime = mini.get("keepTime").getFormValue();
        			var actionStatus = mini.get("actionStatus").getValue();
        			var form = new mini.Form("#editform");
        			form.validate();
        		    if (form.isValid() == false) {
        		        showMessageBox("警告","保存失败,请检查输入内容(必填项,格式错误等)!","warning");
        		        return;
        		    }
        			$.ajax({
        				url:"${ctx}/wo-wt/wo/woWt/keepAndRestore",
        				data:{wtId:wtId,keepAndRestoreWorkLeaderName:keepAndRestoreWorkLeaderName,keepPermitBy:keepPermitBy,restorePermitBy:restorePermitBy,
        					keepAndRestoreWorkLeader:keepAndRestoreWorkLeader,keepPermitByName:keepPermitByName,restorePermitByName:restorePermitByName,
        					restoreTime:restoreTime,keepTime:keepTime,actionStatus:actionStatus},
        				type:"post",
        	            success: function (o) {
        	            	var data = mini.decode(o);
        	        		if(data.type=="E"){
        	        			showMessageBox("错误",data.message,"error");
        	        			
        	        		}else{
        	        			//showMessageBox("提示",data.message,"info");
        	        			showMessage = data.message;
        	        			var form = new mini.Form("#editform");
        	        			form.setEnabled(false);
        	        			mini.get("confimButton").setVisible(false);
        	        			mini.get("resetButton").setVisible(false);
        	        			closeWindow("ok");
        	        			
        	        		}
        	    		}
        			});
        			
        		}
    		}
		});
		}
		//押票
		else{
			var wtId = mini.get("wtId").getValue();
			var keepAndRestoreWorkLeaderName  = mini.get("keepAndRestoreWorkLeaderName_").getText();
			var keepPermitBy = mini.get("keepPermitByName_").getValue();
			var restorePermitBy = mini.get("restorePermitByName_").getValue();
			var keepAndRestoreWorkLeader = mini.get("keepAndRestoreWorkLeaderName_").getValue();
			var keepPermitByName = mini.get("keepPermitByName_").getText();
			var restorePermitByName = mini.get("restorePermitByName_").getText();
			var restoreTime = mini.get("restoreTime").getFormValue();
			var keepTime = mini.get("keepTime").getFormValue();
			var actionStatus = mini.get("actionStatus").getValue();
			var form = new mini.Form("#editform");
			form.validate();
		    if (form.isValid() == false) {
		        showMessageBox("警告","保存失败,请检查输入内容(必填项,格式错误等)!","warning");
		        return;
		    }
			$.ajax({
				url:"${ctx}/wo-wt/wo/woWt/keepAndRestore",
				data:{wtId:wtId,keepAndRestoreWorkLeaderName:keepAndRestoreWorkLeaderName,keepPermitBy:keepPermitBy,restorePermitBy:restorePermitBy,
					keepAndRestoreWorkLeader:keepAndRestoreWorkLeader,keepPermitByName:keepPermitByName,restorePermitByName:restorePermitByName,
					restoreTime:restoreTime,keepTime:keepTime,actionStatus:actionStatus},
				type:"post",
	            success: function (o) {
	            	var data = mini.decode(o);
	        		if(data.type=="E"){
	        			showMessageBox("错误",data.message,"error");
	        			
	        		}else{
	        			//showMessageBox("提示",data.message,"info");
	        			showMessage = data.message;
	        			var form = new mini.Form("#editform");
	        			form.setEnabled(false);
	        			mini.get("confimButton").setVisible(false);
	        			mini.get("resetButton").setVisible(false);
	        			closeWindow("ok");
	        			
	        		}
	    		}
			});
		}
		
	}
	//页面载入之前,查询是否有相应的数据,如果有则隐藏确认和取消按钮
	window.onload=function(){
		var wtId = mini.get("wtId").getValue();
		var actionStatus = mini.get("actionStatus").getValue();
	
		if(actionStatus=="keepTicket"){
			hideCells(["reTimeTd","reTime","restore"]);
			showCells(["keTimeTd","keTime","keep"]);
		}else if(actionStatus=="restoreTicket"){
			showCells(["reTimeTd","reTime","restore"]);
			hideCells(["keTimeTd","keTime","keep"]);
		}
		$.ajax({
			url:"${ctx}/wo-wt/wo/woWtKeepRestore/getData",
			data:{wtId:wtId},
			type:"post",
            success: function (o) {
            	var data = mini.decode(o);
        		if(data!=null&&data!=""){       			
        			if(actionStatus=="keepTicket"){
        			
               			if(data.keepTime!=null&&data.restoreTime==null){
               				var form = new mini.Form("#editform");
                   			form.setData(data);
               				form.setEnabled(false);
               				mini.get("confimButton").setVisible(false);
                   			mini.get("resetButton").setVisible(false);
                   			
                   			mini.get("keepAndRestoreWorkLeaderName_").setEnabled(false);
                   			mini.get("keepPermitByName_").setEnabled(false);
               			}else if(data.keepTime!=null&&data.restoreTime!=null){
               				
               			}else{
               				
               			}
        			}else if(actionStatus=="restoreTicket"){
        				if(data.restoreTime!=null){
        					var form = new mini.Form("#editform");
                   			form.setData(data);
        					form.setEnabled(false);
               				mini.get("confimButton").setVisible(false);
                   			mini.get("resetButton").setVisible(false);
                   			
                   			mini.get("keepAndRestoreWorkLeaderName_").setEnabled(false);
                   			mini.get("restorePermitByName_").setEnabled(false);
        					
        				}
        				
        			}
        		
           			
           		
        		}
       			
        			
        		
    		}
		}); 
		
	}
	
	function hideCells(cells)
	{
		for(var i = 0;i < cells.length;i++)
		{
			document.getElementById(cells[i]).style.display = "none";
		}
	}
	function showCells(cells)
	{
		for(var i = 0;i < cells.length;i++)
		{
			document.getElementById(cells[i]).style.display = "";
		}
	}
</script>
</body>

</html>