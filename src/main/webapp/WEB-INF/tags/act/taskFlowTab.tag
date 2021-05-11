<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%--<%@ attribute name="procInsId" type="java.lang.String" required="true" description="流程实例ID"%>--%>
<%@ attribute name="showDelegate" type="java.lang.String" required="false" description="是否显示委派转办" %>
<%@ attribute name="showNextExecDeptBy" type="java.lang.String" required="false" description="是否显示下一执行部门" %>
<%@ attribute name="nextExecDeptByUrl" type="java.lang.String" required="false" description="下一执行部门弹出url" %>
<%@ attribute name="showNextExecBy" type="java.lang.String" required="false" description="是否显示下一执行人" %>
<%@ attribute name="nextExecByUrl" type="java.lang.String" required="false" description="下一执行人弹出url" %>
<%@ attribute name="showNotifyUsers" type="java.lang.String" required="false" description="是否显示知会人列表" %>
<%@ attribute name="showDefectBack" type="java.lang.String" required="false" description="是否显示缺陷撤回" %>
<%@ attribute name="showIsMulIns" type="java.lang.String" required="false" description="是否显示会签" %>
<sys:toolbarwf showDelegate="${showDelegate }"  showDefectBack="${showDefectBack }" ></sys:toolbarwf>

<c:if test="${nextExecByUrl ==''|| nextExecByUrl==null }">
	<c:set var="nextExecByUrl" value="${ctx}/sys/sysUser/sysMisList"></c:set>
</c:if>
<c:if test="${nextExecDeptByUrl =='' || nextExecByUrl==null}">
	<c:set var="nextExecDeptByUrl" value="${ctx}/sys/sysOrg/mislist"></c:set>
</c:if>
<style>
	.autoScroll

	{

		width:3000px;

		height:1000px;

		overflow:auto;

	}
</style>
<div id="editformWFMyTask" class="form" style="width:100%;">
	<input class="mini-hidden" name="procWFTaskId" id="procWFTaskId"/>
	<input class="mini-hidden" name="procInsId" id="procInsId"/>
	<input class="mini-hidden" name="procWFTaskBranchVarKey" id="procWFTaskBranchVarKey"/>
	<input class="mini-hidden" name="procWFTaskBranchVarOtherKey" id="procWFTaskBranchVarOtherKey"/>
	<input class="mini-hidden" name="procWFTaskCanExec" id="procWFTaskCanExec"/>
	<input class="mini-hidden" name="showNextExecBy" id="showNextExecBy"/>
	<input class="mini-hidden" name="nextExecByUrl" id="nextExecByUrl"/>
	<input class="mini-hidden" name="nextExecByLabel" id="nextExecByLabel"/>
	<div class="container"  style="width: 100%;"  >
		<div class="mini-clearfix ">
			<div class="mini-col-12">

				<div class="mini-panel" title="我的任务" width="auto" height="auto"
					 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

				>
					<table border="0" cellpadding="3" cellspacing="3" >
						<tr>
							<td style="text-align:right;">任务标题：</td>
							<td colspan="3">
								<input name="procWFTaskName" id="procWFTaskName" class="mini-textbox"  vtype = ""   width="400px" enabled="false"/>
							</td>
						</tr>
						<tr>
							<td style="text-align:right;">执行人：</td>
							<td>
								<input name="procWFTaskAssignee" id="procWFTaskAssignee"  class="mini-textbox"  vtype = "" required="false" width="180px" enabled="false"/>
							</td>
							<c:choose>
						
								<c:when test="${showDelegate=='true' }">
									<td style="text-align:right;">新执行人(转办/委派)：</td>
									<td>
										<input name="procWFTaskAssignee2" id="procWFTaskAssignee2"  class="mini-buttonedit"  vtype = "" required="false"  textName="procWFTaskAssignee2" allowInput="false"
											   onbuttonclick="popLov(this,'分配用户',false,true,'${ctx}/sys/sysUser/form',850,600,'loginName','procWFTaskAssignee2');"/>
									</td>
								</c:when>
								<c:otherwise>
									<input name="procWFTaskAssignee2" id="procWFTaskAssignee2"  class="mini-hidden"/>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td style="text-align:right;">流转意见：</td>
							<td colspan="3">
								<input name="procWFComment" id="procWFComment"  class="mini-textarea"  vtype = "" required="false" width="400px" />
							</td>

						</tr>
						
						<tr id="procWFTaskBranchTr">

							<td style="text-align:right;">选择流向：</td>
							<td colspan="3">
								<input id="procWFTaskBranchVarValue" name="procWFTaskBranchVarValue"  class="mini-combobox" textField="text" valueField="id" width="180px" valueFromSelect="true" allowInput="true"/>
							</td>

						</tr>
						
						<c:choose>
						
							<c:when test="${showNextExecDeptBy=='true' }">
								<tr id="nextExecDeptByTr">
									<td style="text-align:right;">下一执行部门：</td>
									<td colspan="3">
										<input name="nextExecDeptBy" id="nextExecDeptBy" textName="nextExecDeptBy" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="true" 
											onbuttonclick="popLov(this,'选择部门',false,true,'${nextExecDeptByUrl }',850,500,'id','nextExecDeptBy','#editformWFMyTask')"   />
									</td>
		
								</tr>
							</c:when>
							<c:otherwise>
								<input name="nextExecDeptBy" id="nextExecDeptBy" class="mini-hidden"/>
							</c:otherwise>
						</c:choose>
						<c:choose>
						
							<c:when test="${showIsMulIns=='true' }">
								<tr id="isMulInsTr">
									<td style="text-align:right;">是否会签：</td>
									<td colspan="3">
									<input name="isMulIns" id="isMulIns" class="mini-combobox" showNullItem="true" allowInput="false" required="false" valueField="value" textField="label"  vtype = ""  url="${ctx}/sys/dict/listDataStr?type=yes_no" />
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<input name="isMulIns" id="isMulIns"class="mini-hidden"/>
							</c:otherwise>
						</c:choose>
						<c:choose>
						
							<c:when test="${showNextExecBy=='true' }">
								<tr id="nextExecByTr">
									<td style="text-align:right;" id="nextExectByLabelTd">下一执行人：</td>
									<td colspan="3">
									<input name="nextExecBy" id="nextExecBy"class="mini-buttonedit"  vtype = ""  showClose="true" oncloseclick="onCloseClick(this)" required="false" width="180px" allowInput="false" textName="nextExecBy"
													   	onbuttonclick="popLov(this,'选择人员',true,true,'${nextExecByUrl }',850,500,'loginName','nextExecBy','#editformWFMyTask')"/>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<input name="nextExecBy" id="nextExecBy" class="mini-hidden"/>
							</c:otherwise>
						</c:choose>
						<c:choose>
						
							<c:when test="${showNotifyUsers=='true' }">
								<tr>
									<td style="text-align:right;">被知会人：</td>
									<td colspan="3">
									<input name="notifyUsers" id="notifyUsers"class="mini-buttonedit" oncloseclick="onCloseClick(this)"  showClose="true" vtype = "" required="false" width="400px" allowInput="false" textName="notifyUsers"
														onbuttonclick="popLov(this,'选择用户',true,true,'${ctx}/sys/sysUser/misList',1000,600,'id,loginName','notifyUsers,notifyUsers',null,null,null,null,'datagridSelected')"  required="false" />
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<input name="notifyUsers" id="notifyUsers"class="mini-hidden"/>
							</c:otherwise>
						</c:choose>
						
						<%--<tr>--%>
							<%--<td style="text-align:right;"><input type="button" value="提交" onclick="flowSubmit(1)"/></td>--%>
							<%--<td style="text-align:right;"><input type="button" value="转办" onclick="flowSubmit(2)"/></td>--%>
							<%--<td style="text-align:right;"><input type="button" value="委托" onclick="flowSubmit(3)"/></td>--%>

						<%--</tr>--%>
					</table>
				</div>

			</div>
		</div>
	</div>
</div>
<div class="mini-fit">
	<div id="tabsSubWF" class="mini-tabs" activeIndex="0"  style="width:100%;height:100%;">
		<div title="流程图" id="tabWFImg"  style="border: 0px;"  >
			 <div class="autoScroll">
				<img align="center"  src=""   id="processImgWF"/>
			 </div>
		</div>
		<div title="流转历史" id="tabWFHistFlow"  style="border: 0px;"  >
			<div class="mini-fit">
				<div id="gridWFHistFlow" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/act/task/histoicFlow" idField="id"
					 allowResize="true" showPager = "false"
					 allowCellSelect="true" allowCellEdit="true"
					 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
					 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
				>
					<div property="columns">
						<div name="activityName"  field="activityName"  headerAlign="center"  width="60" >任务名称
						</div>
						<div name="assigneeName"  field="assigneeName"  headerAlign="center"  width="60" >执行人
						</div>
						<div name="comment"  field="comment"  headerAlign="center"  width="60" >意见
						</div>
						<div name="beginDate"  field="beginDate"  headerAlign="center"  width="80"  dateFormat="yyyy-MM-dd HH:mm:ss" >执行开始
						</div>
						<div name="endDate"  field="endDate"  headerAlign="center"  width="80"  dateFormat="yyyy-MM-dd HH:mm:ss" >执行结束
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="currentUsersWindow_" class="mini-window" title="可执行人" style="width:500px;height:500px;" showModal="true" allowResize="false" allowDrag="true">
    <input class="mini-hidden" name="currTaskId_" id="currTaskId_"/>
    <div id="currentUsersGrid_" class="mini-datagrid" style="width:100%;height:100%"
					  idField="id" showPager="false" showFilterRow="true"
				>
			<div property="columns">
						
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="false" width="64" hideable="true" visible="false">编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
							<div name="loginName"  field="loginName" vtype=""  headerAlign="center" allowSort="false" width="64" >登录名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="_loginName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged_" showClose="true" oncloseclick="onChildFilterClose(this,'currentUsersGrid_')"
								/>
							</div>
							<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="false" width="100" >名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="_name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged_" showClose="true" oncloseclick="onChildFilterClose(this,'currentUsersGrid_')"
								/>
							</div>
							<div name="phone"  field="phone" vtype=""  headerAlign="center" allowSort="false" width="100" >电话
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
			</div>
	</div>
</div>
<div id="chageCurrentUsersWindow_" class="mini-window" title="可执行人" style="width:500px;height:300px;" showModal="true" allowResize="false" allowDrag="true">
	<div id="changeCurrentUsersEditform" class="form" style="width:100%;">
		<table border="0" cellpadding="3" cellspacing="3" >
			<tr>
				<td style="text-align:right;">新执行人：</td>
				<td>
					<input name="changeProcWFTaskAssignee2" id="changeProcWFTaskAssignee2"  class="mini-buttonedit"  vtype = "" required="false"  textName="changeProcWFTaskAssignee2" width="250" allowInput="false"
						   onbuttonclick="popLov(this,'分配用户',true,true,'${ctx}/sys/sysUser/form',850,600,'loginName','changeProcWFTaskAssignee2','#changeCurrentUsersEditform');"/>
				</td>
			</tr>
			<tr>
			<td style="text-align:right;">可直接将登录名<br/>逗号分隔粘贴：</td>
				<td>
					<input name="changeProcWFTaskAssignee3" id="changeProcWFTaskAssignee3"  class="mini-textarea"  width="300" height="100"/>
				</td>
			</tr>
		</table>
		<div class="mini-toolbar" id="lov_action_bar"  style="text-align:center;vertical-align:middle;padding-top:8px;padding-bottom:8px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
	<a class="mini-button" iconCls="icon-check"  style="width:70px;" onclick="toSubmit_Assignee()">确定</a>
	<span style="display:inline-block;width:25px;"></span>
	<a class="mini-button" iconCls="icon-close"  style="width:70px;" onclick="cancelRow_Assignee()">取消</a>
</div>
	</div>
</div>

<div id="gotoNodeWindow_" class="mini-window" title="可执行人" style="width:500px;height:300px;" showModal="true" allowResize="false" allowDrag="true">
	<div id="gotoNodeWindowEditform" class="form" style="width:100%;">
		<table border="0" cellpadding="3" cellspacing="3" >
			<tr>
				<td style="text-align:right;">退回到节点：</td>
				<td>
					<input name="gotoNode_hisNode_" id="gotoNode_hisNode_" class="mini-combobox" allowInput="false"  required="false" valueField="activityId" textField="activityName"  vtype = ""  />
				</td>
			</tr>
			<tr style="display:none;">
			<!-- 此参数暂时不起作用 -->
				<td style="text-align:right;">是否删除流转历史</td>
				<td>
					<input name="gotoNode_delHisTask_" id="gotoNode_delHisTask_" class="mini-combobox"  required="false" showNullItem="true"  valueField="value" textField="label"  vtype = ""  url="${ctx}/sys/dict/listDataStr?type=yes_no" />
				</td>
			</tr>
			<tr>
				<td style="text-align:right;">退回意见</td>
				<td>
					<input name="gotoNode_comment_" id="gotoNode_comment_" class="mini-textarea"/>
				</td>
			</tr>
		</table>
		<div class="mini-toolbar" id="lov_action_bar"  style="text-align:center;vertical-align:middle;padding-top:8px;padding-bottom:8px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
	<a class="mini-button" iconCls="icon-check"  style="width:70px;" onclick="toSubmit_gotoNode()">确定</a>
	<span style="display:inline-block;width:25px;"></span>
	<a class="mini-button" iconCls="icon-close"  style="width:70px;" onclick="cancel_gotoNode()">取消</a>
</div>
	</div>
</div>
<script type="text/javascript">
/**
 * 转办
 */
function changeCurrentUsersWindow_() {
	var currTaskId = mini.get("procWFTaskId").getValue();
	if(currTaskId==""){
		showMessageBox("警告","请先选中一条记录","warning");
		return;
	}
	var editWindow = mini.get("chageCurrentUsersWindow_");
    editWindow.show();
}
function showCurrentUsersWindow_() {
	var editWindow = mini.get("currentUsersWindow_");
    editWindow.show();
    var userGrid = mini.get("currentUsersGrid_");
    var currTaskId = mini.get("procWFTaskId").getValue();
    if(currTaskId==""){
    	userGrid.clearRows();
    	return;
    }
    var oldTaskId = mini.get("currTaskId_").getValue();
    if(oldTaskId==currTaskId){
   // 	return;
    }
   	var procInsId = mini.get("procInsId").getValue();
   	userGrid.clearRows();
    mini.get("currTaskId_").setValue(currTaskId);
    showMessageBox(null,"加载中，请稍后......","loading");
    $.ajax({
        url: "${ctx}/act/task/getTaskUsers",
     	//data : {taskId:currTaskId},
     	data : {procInsId:procInsId},
        type: "post",
        success: function (data) {
        	data = mini.decode(data);
			if(data.type=="I"){//成功
				var users = data.data;
				console.log(users);
				userGrid.set({data:users});
		        hideMessageBox();
			}else{
				showMessageBox("错误",data.message,"error");
			}
        },
        error: function (jqXHR, textStatus, errorThrown) {
            var callback=function (action) {
                if(action=='详细')  viewErrorDetail(jqXHR.responseText);
            }
            var buttonsTemp=["ok","详细"];
            showMessageBox("错误","获取数据出错","error",null,callback,buttonsTemp);
            form.unmask();
        }
    });
}
function cancelRow_Assignee() {
	var form = new mini.Form("#changeCurrentUsersEditform");
	form.reset();
	var editWindow = mini.get("chageCurrentUsersWindow_");
    editWindow.hide();
}
function toSubmit_Assignee(){
	var currTaskId = mini.get("procWFTaskId").getValue();
	if(currTaskId==""){
		showMessageBox("警告","请先选中一条记录","warning");
	}
	showMessageBox(null,"加载中，请稍后......","loading");
	var form = new mini.Form("#changeCurrentUsersEditform");
    form.validate();
    if (form.isValid() == false) {
        showMessageBox("错误","保存失败,请检查输入内容(必填项,格式错误等)!","error");
        return;
    }
    var assingee2 = mini.getbyName("changeProcWFTaskAssignee2",form).getValue();
    var assingee3 = mini.getbyName("changeProcWFTaskAssignee3",form).getValue();
   	var assingee = assingee2;
   	if(assingee==''){
   		assingee = assingee3;
   	}else if(assingee3!=''){
   		assingee+=','+assingee3;
   	}
   	if(assingee==''){
   		showMessageBox("错误","请指定新的执行人","error");
        return;
   	}
    var procInsId = mini.get("procInsId").getValue();
    var data={taskId:currTaskId,assignee2:assingee,procInsId:procInsId};
    var arr = new Array();
    arr.push(data);
    var dataStr = mini.encode(arr);
    $.ajax({
        url: "${ctx}/act/task/completeTask",
     	data : {data:dataStr,type:2},
        type: "post",
        success: function (data) {
        	data = mini.decode(data);
			if(data.type=="I"){//成功
				showMessageBox("信息","指定成功","info");
				cancelRow_Assignee();
			}else{
				showMessageBox("错误",data.message,"error");
			}
        },
        error: function (jqXHR, textStatus, errorThrown) {
            var callback=function (action) {
                if(action=='详细')  viewErrorDetail(jqXHR.responseText);
            }
            var buttonsTemp=["ok","详细"];
            showMessageBox("错误","获取数据出错","error",null,callback,buttonsTemp);
            form.unmask();
        }
    });
    
}
function onCloseClick(Obj){
	var id=Obj.id;
	mini.get(id).setValue("");
	mini.get(id).setText("")
}
function showGotoNode_(){
	var currTaskId = mini.get("procWFTaskId").getValue();
	if(currTaskId==""){
		showMessageBox("警告","参数错误","warning");
		return;
	}
	mini.get("gotoNode_hisNode_").setValue("");
	mini.get("gotoNode_delHisTask_").getValue("");
	mini.get("gotoNode_comment_").setValue("");
	getHisTask();
	var editWindow = mini.get("gotoNodeWindow_");
    editWindow.show();
}
function getHisTask(){
	 var procInsId = mini.get("procInsId").getValue();
	$.ajax({
        url: "${ctx}/act/task/getHisNode",
     	data : {procInsId:procInsId},
        type: "post",
        success: function (data) {
        	data = mini.decode(data);
			if(data.type=="I"){//成功
				mini.get("gotoNode_hisNode_").setData(data.data);
		        hideMessageBox();
			}else{
				showMessageBox("错误",data.message,"error");
			}
        },
        error: function (jqXHR, textStatus, errorThrown) {
            var callback=function (action) {
                if(action=='详细')  viewErrorDetail(jqXHR.responseText);
            }
            var buttonsTemp=["ok","详细"];
            showMessageBox("错误","获取数据出错","error",null,callback,buttonsTemp);
            form.unmask();
        }
    });
}

function toSubmit_gotoNode(){
	var procInsId = mini.get("procInsId").getValue();
	var taskId = mini.get("procWFTaskId").getValue();
	var hisNode = mini.get("gotoNode_hisNode_").getValue();
	var delHisTask = mini.get("gotoNode_delHisTask_").getValue();
	var comment = mini.get("gotoNode_comment_").getValue();
	$.ajax({
        url: "${ctx}/act/task/gotoNode",
     	data : {procInsId:procInsId,taskId:taskId,gotoNodeId:hisNode,delHisTask:delHisTask,comment:comment},
        type: "post",
        success: function (data) {
        	data = mini.decode(data);
			if(data.type=="I"){//成功
				
		        hideMessageBox();
		        cancel_gotoNode();
		        showMessageBox("信息","退回成功","info");
			}else{
				showMessageBox("错误",data.message,"error");
			}
        },
        error: function (jqXHR, textStatus, errorThrown) {
            var callback=function (action) {
                if(action=='详细')  viewErrorDetail(jqXHR.responseText);
            }
            var buttonsTemp=["ok","详细"];
            showMessageBox("错误","获取数据出错","error",null,callback,buttonsTemp);
            form.unmask();
        }
    });
	
}
function cancel_gotoNode(){
	mini.get("gotoNode_hisNode_").setValue("");
	mini.get("gotoNode_delHisTask_").getValue("");
	mini.get("gotoNode_comment_").setValue("");
	var editWindow = mini.get("gotoNodeWindow_");
    editWindow.hide();
}

function onFilterChanged_(e){
	 var loginNamebox = mini.get("_loginName-Filter");
     var namebox = mini.get("_name-Filter");
     
     var loginName = loginNamebox.getValue().toLowerCase();
     var name = namebox.getValue().toLowerCase();

     var grid = mini.get("currentUsersGrid_");
     //多条件组合过滤
     grid.filter(function (row) {
         //name
         var r1 = true;
         if (name) {
             r1 = String(row.name).toLowerCase().indexOf(name) != -1;
         }
         if(r1!=true){
        	 return false;
         }

         //age
         var r2 = true;
         if (loginName) {
             r1 = String(row.loginName).toLowerCase().indexOf(loginName) != -1;
         }
         return r1 && r2;
     });
}
</script>