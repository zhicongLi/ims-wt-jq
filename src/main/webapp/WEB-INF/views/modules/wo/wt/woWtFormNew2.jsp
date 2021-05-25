<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>工作票</title>
<meta name="decorator" content="default" />
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctxStatic}/common/sysToolBar.js"></script>
<script type="text/javascript" src="${ctxStatic}/common/editControl.js"></script>
<jsp:include page="borderCss.jsp"></jsp:include>
</head>
<body>
	<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false"
		style="width: 100%; height: 100%;">
		<div title="列表" id="tabList" style="border: 0px;">
			<sys:toolbargridmain objId="WoWt" permissionEdit="wo:woWt:edit"></sys:toolbargridmain>			
			<sys:searchadv></sys:searchadv>
			<div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width: 100%; height: 100%;"
					url="${ctx}/wo-wt/wo/woWt/data?baseQuery=a.is_standard=${param.isStandard}"
					idField="id" allowResize="true" pageSize="10" allowCellSelect="true" multiSelect="false"
					editNextOnEnterKey="true" editNextRowCell="true" allowAlternating="true" showFilterRow="true" showColumnsMenu="false">
					<div property="columns">
						<div name="action" width="120" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
						<div name="id" field="id" vtype="required" headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">编号 
							<input property="editor" class="mini-textbox" style="width: 100%;" />
						</div>																		
						<div name="wtCode" field="wtCode" vtype="" headerAlign="center" allowSort="true" width="200">工作票号
							 <input property="editor" class="mini-textbox" style="width: 100%;" /> 
							 <input id="wtCode-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="content" field="content" vtype="" headerAlign="center" allowSort="true" width="300">工作内容 
							<input property="editor" class="mini-textbox"style="width: 100%;" /> 
							<input id="content-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="status" field="status" vtype="" type="comboboxcolumn" headerAlign="center" allowSort="false" width="80" sortField="a.status">状态 
							<input property="editor" class="mini-combobox" style="width: 100%;" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_status" /> 
							<input id="status-Filter" name="mini-column-filter" property="filter" class="mini-combobox" valueField="value" textField="label" multiSelect="true"
								url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_status" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>						
						<div name="orgName" field="orgName" vtype="" headerAlign="center" allowSort="true" width="300">部门 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="content-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="wtType" field="wtType" vtype="" headerAlign="center" type="comboboxcolumn" allowSort="false" width="145" visible="false" hideable="true">类型 
							<input property="editor" class="mini-combobox" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_user_wt_type" style="width: 100%;" /> 
							<input id="wtType-Filter" name="mini-column-filter" property="filter" class="mini-combobox" multiSelect="true" valueField="value" textField="label" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="specName" field="specName" vtype="" headerAlign="center" allowSort="true" width="300">专业
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="content-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>								
						<div name="descr" field="descr" vtype="" headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">描述 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="descr-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="location" field="location" vtype="" headerAlign="center" allowSort="true" width="200" visible="false" hideable="true">工作地点 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="location-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="source" field="source" vtype="" headerAlign="center" allowSort="true" width="200" hideable="true" visible="false">来源 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="source-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="equipId" field="equipId" vtype="" headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">设备id 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="equipId-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="equipName" field="equipName" vtype="" headerAlign="center" allowSort="true" width="200"hideable="true" visible="false">设备名称 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="equipName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="equipLogicId" field="equipLogicId" vtype="" headerAlign="center" allowSort="true" width="64"hideable="true" visible="false">逻辑设备编码 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="equipLogicId-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="equipLogicName" field="equipLogicName" vtype="" headerAlign="center" allowSort="true" width="200" hideable="true" visible="false">逻辑设备名称
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="equipLogicName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="planStartTime" field="planStartTime" vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center" allowSort="true" width="160"  hideable="true">计划开始时间 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="planStartTime-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="planEndTime" field="planEndTime" vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center" allowSort="true" width="160"  hideable="true">计划结束时间 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="planEndTime-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="workCondition.descr" field="workCondition.descr" vtype="" headerAlign="center" allowSort="true" width="200" sortField="wws9.descr" visible="false" hideable="true">工作条件
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="workCondition.descr-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="safeMeasure.descr" field="safeMeasure.descr" vtype="" headerAlign="center" allowSort="true" width="200" sortField="wws5.descr" visible="false" hideable="true">注意事项 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="safeMeasure.descr-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="workLeader" field="workLeader" vtype="" headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">工作负责人 
						    <input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="workLeader-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="workLeaderName" field="workLeaderName" vtype="" headerAlign="center" allowSort="true" width="100">工作负责人
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="workLeaderName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="wtSigner" field="wtSigner" vtype="" headerAlign="center" allowSort="true" width="64"hideable="true" visible="false">工作票签发人 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="wtSigner-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="wtSignerName" field="wtSignerName" vtype="" headerAlign="center" allowSort="true" width="100">工作票签发人 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="wtSignerName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="wtSignDate" field="wtSignDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" visible="false" hideable="true">工作票签发时间 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="wtSignDate-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>						
						<div name="wtReceiveName" field="wtReceiveName" vtype="" headerAlign="center" allowSort="true" width="140" hideable="true" visible="false">工作票接收人 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="wtReceiveName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>						
						<div name="remarks" field="remarks" vtype="" headerAlign="center" allowSort="true" width="255"sortField="a.remarks" visible="false" hideable="true">备注信息 
							<input property="editor" class="mini-textarea" style="width: 100%;" /> 
							<input id="remarks-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
							
					</div>
				</div>
			</div>
		</div>
		<div title="明细" id="tabForm" style="border: 1px;">
			<sys:toolbarformmain permissionEdit="wo:woWt:edit"></sys:toolbarformmain> 		
			<div id="editform" class="form" style="width: 100%;">
				<div class="container" style="width: 100%;">
					<div class="mini-clearfix ">
						<div class="mini-col-12">
							<input class="mini-hidden" name="id" id="id" /> 
							<input class="mini-hidden" name="procInsId" id="procInsId" /> 
							<input class="mini-hidden" name="wtType" id="wtType" /> 
							<input class="mini-hidden" name="updateDate" id="updateDate" />							
							<input class="mini-hidden" name="workLeaderName" id="workLeaderName" /> 
							<input class="mini-hidden" name="maintOrgName" id="maintOrgName" /> 
							<input class="mini-hidden" name="orgName" id="orgName" /> 
							<input class="mini-hidden" name="pcSigner" id="pcSigner" /> 
							<input class="mini-hidden" name="workCondition.id" id="workCondition.id" /> 
							<input class="mini-hidden" name="workCondition.wtId" id="workCondition.wtId" /> 
							<input class="mini-hidden" name="workCondition.typeId" id="workCondition.typeId" /> 
							<input class="mini-hidden" name="safeMeasure.id" id="safeMeasure.id" />
							<input class="mini-hidden" name="safeMeasure.wtId" id="safeMeasure.wtId" /> 
							<input class="mini-hidden" name="safeMeasure.typeId" id="safeMeasure.typeId" /> 
							<input class="mini-hidden" name="specShortCode" id="specShortCode" /> 
							<input class="mini-hidden" name="defectId" id="defectId" value="${defectId}" /> 
							<input class="mini-hidden" id="isStandard" name="isStandard" value="${param.isStandard }">
							<input class="mini-hidden" name="procStatus" id="procStatus" />
							<input class="mini-hidden" id="currUserName" name="currUserName" value="${param.currUserName}"> 
							<input class="mini-hidden" id="currUserId" name="currUserId" value="${param.currUserId}">
							<input type="hidden" id="currUserLoginName" name="currUserLoginName" value="${param.currUserLoginName}"> 
							<input class="mini-hidden" id="dutyOrgId" name="dutyOrgId">
							<!-- 工作地点id -->
							<input class="mini-hidden" id="locationId" name="locationId">							
							<!-- 审核人id -->
							<input class="mini-hidden" name="auditId" id="auditId" />
							<!-- 新增 mengqiang 2018-11-07 -->
							<!-- 工单id -->
							<input class="mini-hidden" name="woId" id="woId" />
							<input class="mini-hidden" name="woJobId" id="woJobId" />
							<input type="hidden" name="videoServer" id="videoServer" value="${param.videoServer}"/>							
							<input type="hidden" name="canEdit" id="canEdit" value="${param.canEdit}"/>							
							<input class="mini-hidden" name="examineTime" id="examineTime" />
							<input class="mini-hidden" name="randomCode" id="randomCode" />
							<input class="mini-hidden" name="serialNumber" id="serialNumber" />							
							<input class="mini-hidden" name="isTop" id="isTop" />
							<input class="mini-hidden" name="isClose" id="isClose" />
							<input class="mini-hidden" name="cancelDutyLeader" id="cancelDutyLeader" />
							<input class="mini-hidden" name="cancelDutyLeaderName" id="cancelDutyLeaderName" />														
							<!-- 许可人部门及终结许可人部门  -->
							<input class="mini-hidden" name="permitByOrgId" id="permitByOrgId" />
							<input class="mini-hidden" name="endPermitByOrgId" id="endPermitByOrgId" />							
							<!-- 是否进行过延期或者负责人变更 1：是 0：否  -->
							<input class="mini-hidden" name="woWtDelay.isDelay" id="woWtDelay.isDelay" />
							<input class="mini-hidden" name="woWtLC.isLeaderChange" id="woWtLC.isLeaderChange" />
							
							<table class="formtable">
								<tr>
									<td style="padding-left: 5px;">电气第二种工作票：No：</td>
									<td>
									  <input name="wtCode" id="wtCode" class="mini-textbox" width="200px" readonly="readonly" />
									</td>
									<td>状态:</td>
									<td>
									  <input name="status" id="status" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype="" 
									    url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_status" />
									</td>
									<td>专业:</td>
									<td>
									  <input name="specId" id="specId" textName="specName" class="mini-buttonedit" vtype="" required="true" allowInput="false"  onbuttonclick="selectSpec" />
									</td>
								</tr>

								<tr>
									<td>1.部门：</td>
									<td>
									  <input name="orgId" id="orgId" textName="orgName" class="mini-buttonedit" width="200px"
										onbuttonclick="popLov(this,'选择部门',false,true,'${ctx}/ims-ext/sys/sysOrg/list?classId=0',850,500,'id,name','orgId,orgName')" onvaluechanged="changeDutyOrg">
									</td>
									<td>班组：</td>
									<td>
									  <input name="maintOrg" id="maintOrg" textName="maintOrgName" class="mini-buttonedit" vtype="" required="true" width="150px" allowInput="false"
										onbuttonclick="popLov(this,'请选择班组',false,true,'${ctx}/ims-ext/pg/pgClassInfo/lov?orgType=2',850,500,'orgId,orgName','maintOrg,maintOrgName')" />
									</td>
									<td>工作负责人(监护人)：</td>
									<td>
									  <input style="width: 150px" name="workLeader" id="workLeader" required="true" textName="workLeaderName" class="mini-buttonedit"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctx}/ims-ext/sys/sysUser/sysMisList?orgQuery=61',850,500,'id,name','workLeader,workLeaderName')" onvaluechanged="update(this)" />
									</td>
								</tr>
								<tr>
									<td>所属设备KKS：</td>
									<td>
									  <input name="equipLogicId" id="equipLogicId" textName="equipLogicId" allowInput="true" width="200px" class="mini-buttonedit" vtype="" required="false"
										onbuttonclick="popLov(this,'选择逻辑设备',false,true,'${ctx}/ims-ext/em/emEquipLogic/lov',800,500,'id,name','equipLogicId,equipLogicName',null,null,selectKKS)" onvaluechanged="updateEquip()" />
									</td>
									<td align="left">所属设备名称：</td>
									<td>
									  <input name="equipName" id="equipName" class="mini-textbox" readonly="readonly" />
									</td>
									<td align="left">所属设备编码：</td>
									<td>
									  <input name="equipId" id="equipId" class="mini-textbox" readonly="readonly" />
									</td>
								</tr>
								<tr>
									<td>工作班人员：</td>
									<td colspan="4">
									  <input name="workClassPerson" id="workClassPerson" class="mini-textarea" vtype="" required="false" width="100%" />
									</td>
									<td><span>共 
									  <input name="personNum" id="personNum" class="mini-spinner" allowNull="true" />人</span>
									</td>
								</tr>
								<tr>
									<td>2.工作内容：</td>
									<td colspan="5">
									  <input name="content" id="content" class="mini-textarea" vtype="" required="false" width="100%" />
									</td>
									
								</tr>
								<tr>
									<td>3.工作地点：</td>
									<td colspan="3">
									  <input name="location" id="location" textName="location" class="mini-buttonedit" vtype="" required="false" width="100%" allowInput="true"
										onbuttonclick="popLov(this,'选择工作地址',false,true, '${ctx}/ims-ext/em/emEquipLogic/lov2',800,500,'id,name','locationId,location')" />
									</td>
									<td>机组:</td>
									<td>
									  <input name="plantUnit" id="plantUnit" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype=""  width="100%"
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_plant_unit" />
									</td>									
								</tr>
								<tr>
									<td>4.计划工作时间：</td>
									<td align="right">开始时间：</td>
									<td>
									  <input name="planStartTime" allowInput="false" id="planStartTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;" />
									</td>
									<td align="right">结束时间：</td>
									<td colspan="2">
									  <input name="planEndTime" allowInput="false" id="planEndTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;" onvaluechanged="checkEndTime(planStartTime,planEndTime)"/>
									</td>
								</tr>
								<tr>
									<td>5. 工作条件（停电或不停电，或<br />邻近及保留带电设备名称）：
									</td>
									<td colspan="5">
									  <input name="workCondition.descr" id="workCondition.descr" class="mini-textarea" vtype="" required="false" width="100%" />
									</td>
								</tr>
								<tr>
									<td>6.安全措施<br />（注意事项）：
									</td>
									<td colspan="5">
									  <input name="safeMeasure.descr" id="safeMeasure.descr" class="mini-textarea" vtype="" required="false" width="100%" height="150px" />
									</td>
								</tr>																	
								<tr id="sotID">										
									<td>许可部门：</td>
									<td colspan="2">
									  <input name="isFuelRun" id="isFuelRun" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype=""
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_is_fuel_run" />
									</td>
									<td align="right">是否风险区域：</td>
									<td colspan="2">
									  <input name="areaName" id="areaName" textName="areaName" class="mini-buttonedit" vtype="" required="false" allowInput="false" width="100%"
									   onbuttonclick="popLov(this,'请选择风险区域',false,true,'${ctx}/ims-ext/em/emRiskArea/list',850,500,'areaName','areaName')" />
									</td>	
								</tr>								
							</table>
							<p>
							<table class="formtable">
								<tr>
									<td >工作票签发人签名：</td>
									<td colspan="2">
									  <input name="wtSigner" id="wtSignerName_" textName="wtSignerName" onbuttonclick="sign_('wtSignerName_','2')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />										
									</td>
									<td>工作签发时间：</td>
									<td colspan="2">
									  <input name="wtSignDate" id="wtSignDate" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" allowInput="false" required="false" />
									</td>
								</tr>
								<tr>
									<td>工作票接收人签名：</td>
									<td colspan="2">
									  <input name="wtReceiver" id="wtReceiveName_" textName="wtReceiveName" onbuttonclick="sign_('wtReceiveName_','99')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" /> 
									</td>
									<td>收到工作票时间：</td>
									<td colspan="2">
									  <input name="wtReceiveTime" id="wtReceiveTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" allowInput="false" required="false" />
									</td>
								</tr>
							</table>
							</p>
							<div class="mini-panel" title="补充安全措施" width="auto" id="tabWoWtsm4List" name="tabWoWtsm4List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm4" permissionEdit="wo:woWtSm:edit"></sys:toolbargridsub>
								<div id="gridWoWtsm4" class="mini-datagrid sGrid" style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.wtType}&typeId=4"
									idField="id" allowResize="false" showPager="false"
									pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true"
									showFilterRow="false" allowAlternating="true"
									showColumnsMenu="true" multiSelect="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="32" visible="false" hideable="true">序号 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype="" headerAlign="center" visible="false" hideable="true"allowSort="false" width="32">安措类型 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center" allowSort="false" width="800" allowCellWrap="true">安全措施 
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>							
							<table class="formtable">
								<tr>
									<td _emptyName="许可开始工作时间">7.确认本工作票上述各项内容，许可开始工作时间：</td>
									<td>
									  <input name="permitStartTime" id="permitStartTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" allowInput="false" style="width: 180px;" />
									</td>
									<td style="text-align: left;">工作负责人签名:</td>
									<td>
									  <input name="workLeaderSign" id="workLeaderSignName_" textName="workLeaderSignName" onbuttonclick="sign_('workLeaderSignName_','1')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" /> 
									</td>	
									<td style="text-align: left;">工作许可人（值班员）签名：</td>
									<td colspan="1">
									  <input name="permitBy" id="permitByName_" textName="permitByName" onvaluechanged="padWorkLeader"
										onbuttonclick="sign_('permitByName_','3')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />										
									</td>
								</tr>
								<tr>
									<td colspan="6" style="height: 28px;">8.工作票延期：有效期延期到 
									  <input name="woWtDelay.delayTime" id="woWtDelay.delayTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" />
									</td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2">工作负责人：
									  <input name="woWtDelay.workLeader" id="woWtDelay.workLeaderName_" textName="woWtDelay.workLeaderName" onbuttonclick="sign_('woWtDelay.workLeaderName_','1')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" /> 
									</td>
									<td >签字时间：
									  <input name="woWtDelay.workLeaderTime" id="woWtDelay.workLeaderTime" class="mini-datepicker" showTime="true" vtype="" allowInput="false" format="yyyy-MM-dd HH:mm:ss" required="false" />
									</td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2">工作许可人： 
									  <input name="woWtDelay.permitBy" id="woWtDelay.permitByName_" textName="woWtDelay.permitByName" onbuttonclick="sign_('woWtDelay.permitByName_','3')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" /> 
									</td>
									<td >签字时间： 
									  <input name="woWtDelay.permitByTime" id="woWtDelay.permitByTime" class="mini-datepicker" showTime="true" vtype="" allowInput="false" format="yyyy-MM-dd HH:mm:ss" required="false" />
									</td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<td colspan="6" style="height: 28px;" _emptyName="全部工作结束时间">9.全部工作于：
									  <input name="actEndTime" id="actEndTime" class="mini-datepicker" allowInput="false" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;" />
									    结束，工作班人员已全部撤离，现场已清理完毕
									</td>									
								</tr>
								<tr>
									<td></td>
									<td style="text-align: left;">工作负责人签名:</td>
									<td colspan="2">
									  <input name="endWorkLeader" id="endWorkLeaderName_" textName="endWorkLeaderName" onbuttonclick="sign_('endWorkLeaderName_','1')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" /> 
									</td>
									<td style="text-align: left;">工作许可人签名：</td>
									<td colspan="2">
									  <input name="endPermitBy" id="endPermitByName_" textName="endPermitByName" onbuttonclick="sign_('endPermitByName_','3')" allowInput="false"  class="mini-buttonedit defSign_" vtype = "" required="false" />											
									</td>
								</tr>								
								<tr>
									<td>10.备注 ：</td>
									<td colspan="5">
									  <input name="remarks" id="remarks" class="mini-textarea" vtype="" required="false" width="100%" height="200px" />
									</td>
								</tr>
							</table>

						</div>
						<!--mini-col-->
					</div>
					<!--clearfix-->
				</div>
				<!--container-->
			</div>
			<!--editform-->
			<jsp:include page="/WEB-INF/views/include/sign.jsp"></jsp:include>
		</div>		
		<%@ include file="/WEB-INF/views/modules/wo/wt/woWtTaskSafeMeasureTab.jsp"%>				
    </div>
    <!-- 新流程方式引入 -->
	<sys:workflow flowKey="woWt2"></sys:workflow>
	<sys:toolbarfooter></sys:toolbarfooter>
	<sys:excelframe></sys:excelframe>
	<jsp:include page="permitNew.jsp" flush="true" />
	<jsp:include page="attachTabNew.jsp" flush="true" />
    <script type="text/javascript" src="${ctxStatic}/common/exportSelectFieldFile.js?v=<%=System.currentTimeMillis() %>"></script>
	<script type="text/javascript">
		initBase({
			id : "datagridMain",
			objId : "WoWt",
			masterKeyField : "id",
			dataUrl : "${ctx}/wo-wt/wo/woWt/data?baseQuery=a.is_standard='${param.isStandard}'",
			getUrl : "${ctx}/wo-wt/wo/woWt/get?wtType=${param.wtType}",
			initInsertUrl : "${ctx}/wo-wt/wo/woWt/initInsert?wtType=${param.wtType}&isStandard=${param.isStandard}",
			saveUrl : "${ctx}/wo-wt/wo/woWt/save",
			removeUrl : "${ctx}/wo-wt/wo/woWt/remove",
			exportUrl : "${ctx}/wo-wt/wo/woWt/export",
			importUrl:"${ctx}/wo-wt/wo/woWt/import",		
			onAfterLoadRecord: onAfterLoadRecord
		});

		function getWoWtSm() {
			var childs = new Array();			
			childs.push({
				id : "gridWoWtsm4",
				objId : "WoWtSm",
				FK : "wtId",
				cascade : true,
				cascadeVisible : true,
				insertPos : "L",
				insertType : "A",
				panelId : "tabWoWtsm4List",				
				dataUrl : "${ctx}/wo-wt/wo/woWtSm" + "/data",
				getUrl : "${ctx}/wo-wt/wo/woWtSm" + "/get",
				saveUrl : "${ctx}/wo-wt/wo/woWtSm" + "/save",
				removeUrl : "${ctx}/wo-wt/wo/woWtSm" + "/remove",
				exportUrl : "${ctx}/wo-wt/wo/woWtSm" + "/export",
				initInsertUrl : "${ctx}/wo-wt/wo/woWtSm/initInsert?typeId=4"
			});
			/***********加载附票子表**************/
			
				childs.push({
					id : "#formWoWtWorkSafe",
					objId : "WoWtWorkSafe",
					FK : "wtId",
					visible : true,
					cascade : true,
					cascadeVisible : true,
					tabsId : "tabsMain",
					tabName : "tabWoTaskSafeMeasureList",
					dataUrl:"${ctx}/wo-wt/wo/woWtWorkSafe/data",
					getUrl:"${ctx}/wo-wt/wo/woWtWorkSafe/get",
					saveUrl:"${ctx}/wo-wt/wo/woWtWorkSafe/save",
					removeUrl:"${ctx}/wo-wt/wo/woWtWorkSafe/remove",
					exportUrl:"${ctx}/wo-wt/wo/woWtWorkSafe/export"

				});		
				childs.push({
					id : "gridWoTaskSafeMeasure",
					objId : "WoTaskSafeMeasure",
					FK : "wtId",					
					cascade : true,					
					tabsId : "tabsMain",
					insertPos : "L",
					insertType : "A",
					tabName : "tabWoTaskSafeMeasureList",
					panelId : "tabWoTaskSafeMeasure1List",
					dataUrl:"${ctx}/wo-wt/wo/woTaskSafeMeasure/data",
					getUrl:"${ctx}/wo-wt/wo/woTaskSafeMeasure/get",
					saveUrl:"${ctx}/wo-wt/wo/woTaskSafeMeasure/save",
					removeUrl:"${ctx}/wo-wt/wo/woTaskSafeMeasure/remove",
					exportUrl:"${ctx}/wo-wt/wo/woTaskSafeMeasure/export"
				});		 
			
			/***********加载附票子表结束**************/
			console.log(childs);
			return childs;

		}

		var myChilds = getWoWtSm();
		
		initChilds("#editform", "tabsMain", myChilds);

		initQb("#builder", "pnlQuery", "tabsQuery", "txtSQL", "btnAdvSearch",
				[ {
					id : 'a.wt_code',
					label : '工作票号',
					type : 'string',
					default_value : '',
					size : 100
				} ]);
		loadWindow();
		//////////表格操作菜单项点击事件方法/////////
		function onGridOpMiClick(e) {
			var menuItem = null;
			if (e.item == undefined) {
				menuItem = e.sender.item;
			} else {
				menuItem = e.item;
			}

		}
		//////////form操作菜单项点击事件方法/////////
		//////////form操作菜单项点击事件方法/////////
		
						
		//////////子表格操作菜单项点击事件方法/////////
		function onGridSubOpMiClick_WoWtSm(e) {
			var menuItem = null;
			if (e.item == undefined) {
				menuItem = e.sender.item;
			} else {
				menuItem = e.item;
			}
		}
		function onGridSubOpMiClick_WoWtLeaderChange(e) {
			var menuItem = null;
			if (e.item == undefined) {
				menuItem = e.sender.item;
			} else {
				menuItem = e.item;
			}
		}
		function onGridSubOpMiClick_WoWtFire(e) {
			var menuItem = null;
			if (e.item == undefined) {
				menuItem = e.sender.item;
			} else {
				menuItem = e.item;
			}
		}
		function onGridSubOpMiClick_WoWtDelay(e) {
			var menuItem = null;
			if (e.item == undefined) {
				menuItem = e.sender.item;
			} else {
				menuItem = e.item;
			}
		}
		function onGridSubOpMiClick_WoWtPerson(e) {
			var menuItem = null;
			if (e.item == undefined) {
				menuItem = e.sender.item;
			} else {
				menuItem = e.item;
			}
		}
		function onGridSubOpMiClick_WoWtDpsm(e) {
			var menuItem = null;
			if (e.item == undefined) {
				menuItem = e.sender.item;
			} else {
				menuItem = e.item;
			}
		}
		function onBeforeSaveForm() {
			//更新危险点与预防控制措施排序字段值
			updDangerTaskSeqNo();
			return true;
		}
		
	    function addButton(){
		  sysToolBar_.addButtonOption({
			"buttonId":'test',
			"functionStr":'test',/* 对应按钮的点击事件 */
			/* "gridId":"gridSmCheckQuestion", *//* 对应具体的列表，默认给明细 */
			"name":'打印预览'
		  });
	       // sysToolBar_.bindClick("_tbgridSmCheckQuestion_add",addCheckQuestion,'');
	    }
	  
	    function test(){
		  var id = mini.get("id").getValue();
		  var wtType = mini.get("wtType").getValue();
		  var dutyOrgId = mini.get("dutyOrgId").getValue();	  
		  var menuItem = null; 
		  if (id == "" || id == null) {
			mini.alert("请先保存再点击打印按钮！");
			return;
		  }
		  wowtPrint();
	    }
	  
	    $(function(){
		   addButton();
	    });
	    
	    function onAfterLoadRecord(o) {	   
	        wfAfterLoad(o);
	    }
	    
	    editControl.loadEditList('woWt');	
</script>
</body>
</html>