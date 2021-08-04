<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<html>
<head>
<title>工作票</title>
<meta name="decorator" content="default" />
<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
<jsp:include page="borderCss.jsp"></jsp:include>
<script type="text/javascript" src="${ctxStatic}/common/sysToolBar.js"></script>
<script type="text/javascript" src="${ctxStatic}/common/editControl.js"></script>
<style>
   /* 动火方式多选框样式 */
   .mini-checkboxlist table td{
     border:0px solid red !important;
  }
</style>
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
							<input id="id-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>											
						<div name="wtCode" field="wtCode" vtype="" headerAlign="center" allowSort="true" width="200">工作票号 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="wtCode-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="sourceType"  field="sourceType" vtype=""  headerAlign="center" type="comboboxcolumn"  allowSort="true" width="100" >票来源
							<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_sourceType"   style="width:100%;"  />
							<input id="sourceType-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" multiSelect="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_sourceType"   style="width:100%;"
								   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
							/>
						</div>
						<div name="content" field="content" vtype="" headerAlign="center" allowSort="true" width="300">动火工作内容 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="content-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="status" field="status" vtype="" type="comboboxcolumn" headerAlign="center" allowSort="false" width="100" sortField="a.status">状态 
							<input property="editor" class="mini-combobox" style="width: 100%;" valueField="value" textField="label" url="${ctx}/wo-wt/sys/dict/listDataStr?type=wo_wt_status" /> 
							<input id="status-Filter" name="mini-column-filter" property="filter" class="mini-combobox" valueField="value" textField="label" multiSelect="true"
							  url="${ctx}/wo-wt/sys/dict/listDataStr?type=wo_wt_status" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="orgName" field="orgName" vtype="" headerAlign="center" allowSort="true" width="300">部门 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="orgName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="wtType" field="wtType" vtype="" headerAlign="center" type="comboboxcolumn" allowSort="false" width="145" visible="false" hideable="true">类型 
							<input property="editor" class="mini-combobox" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_user_wt_type" style="width: 100%;" /> 
							<input id="wtType-Filter" name="mini-column-filter" property="filter" class="mini-combobox" multiSelect="true" valueField="value" textField="label" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="specName" field="specName" vtype="" headerAlign="center" allowSort="true" width="300">专业
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="specName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>							
						<div name="woWtFire.fireMode" field="woWtFire.fireMode" vtype="" headerAlign="center" allowSort="true" width="184" sortField="wwf.fire_mode" hideable="true" visible="false">工作方式 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="woWtFire.fireMode-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="descr" field="descr" vtype="" headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">描述 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="descr-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="location" field="location" vtype="" headerAlign="center" allowSort="true" width="200" hideable="true" visible="false">工作地点 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="location-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="planStartTime" field="planStartTime" vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center" allowSort="true" width="160"  hideable="true">申请动火时间开始时间 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="planStartTime-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="planEndTime" field="planEndTime" vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center" allowSort="true" width="160"  hideable="true">申请动火时间结束时间 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="planEndTime-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>						
						<div name="workLeaderName" field="workLeaderName" vtype="" headerAlign="center" allowSort="true" width="100">工作负责人 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="workLeaderName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="wtSigner" field="wtSigner" vtype="" headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">工作票签发人
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="wtSigner-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="wtSignerName" field="wtSignerName" vtype="" headerAlign="center" allowSort="true" width="100">工作票签发人 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="wtSignerName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="wtSignDate" field="wtSignDate" vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center" allowSort="true" width="160" hideable="true" visible="false">工作票签发时间 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="wtSignDate-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>						
						<div name="woWtFire.endExecByName" field="woWtFire.endExecByName" vtype="" headerAlign="center" allowSort="true" width="100" sortField="wwf.end_exec_by_name" visible="false" hideable="true">动火执行人 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="woWtFire.endExecByName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="woWtFire.endFiremanByName" field="woWtFire.endFiremanByName" vtype="" headerAlign="center" allowSort="true" width="100" sortField="wwf.end_fireman_by_name" visible="false" hideable="true">消防监护人 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="woWtFire.endFiremanByName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>						
						<div name="woWtFire.workTickets" field="woWtFire.workTickets" vtype="" headerAlign="center" allowSort="true" width="64" sortField="wwf.work_tickets" visible="false" hideable="true">备注 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="woWtFire.workTickets-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="remarks" field="remarks" vtype="" headerAlign="center" allowSort="true" width="255" sortField="a.remarks" visible="false" hideable="true"> 其他事项 
							<input property="editor" class="mini-textarea" style="width: 100%;" /> 
							<input id="remarks-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true"	oncloseclick="onFilterClose(this)" />
						</div>			
							
					</div>
				</div>
			</div>
		</div>
		<div title="明细" id="tabForm" style="border: 0px;">
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
							<input class="mini-hidden" name="endFiremanBy" id="endFiremanBy" />							
							<input class="mini-hidden" name="woWtFire.id" id="woWtFire.id" />							
							<input class="mini-hidden" name="woWtFire.safeDeptSafeBy" id="woWtFire.safeDeptSafeBy" /> 
							<input class="mini-hidden" name="woWtFire.safeWorkLeader" id="woWtFire.safeWorkLeader" />							
							<input class="mini-hidden" name="woWtFire.safeExecBy" id="woWtFire.safeExecBy" /> 
							<input class="mini-hidden" name="specShortCode" id="specShortCode" /> 
							<input class="mini-hidden" name="defectId" id="defectId" value="${param.defectId}" /> 
							<input class="mini-hidden" id="isStandard" name="isStandard" value="${param.isStandard }">
							<input class="mini-hidden" name="procStatus" id="procStatus" />
							<input class="mini-hidden" id="currUserName" name="currUserName" value="${param.currUserName}"> 
							<input class="mini-hidden" id="currUserId" name="currUserId" value="${param.currUserId}">
							<input type="hidden" id="currUserLoginName" name="currUserLoginName" value="${param.currUserLoginName}"> 
							<input class="mini-hidden" id="mainTicketId" name="mainTicketId">
							<!-- 责任部门id -->
							<input class="mini-hidden" id="dutyOrgId" name="dutyOrgId">
							<!-- 工作地点id -->
							<input class="mini-hidden" id="locationId" name="locationId">							
							<!-- 审核人id -->
							<input class="mini-hidden" name="auditId" id="auditId" />
							<!-- 测量物质消防管理部门负责人 -->
							<input class="mini-hidden" name="woWtFire.endsfDeptLeader" id="woWtFire.endsfDeptLeader" />														
							<!-- 工单id -->
							<input class="mini-hidden" name="woId" id="woId" />
							<input class="mini-hidden" name="woJobId" id="woJobId" />
							<input type="hidden" name="videoServer" id="videoServer" value="${param.videoServer}"/>
							<!-- 动火方式 -->
							<input class="mini-hidden" name="woWtFire.fireMode" id="woWtFire.fireMode" />							
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
							 <!-- 票来源 -->
							<input class="mini-hidden" name="sourceType" id="sourceType" />							 
							
							<div class="mini-panel" title="基本信息" width="auto" height="auto"
						      showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
						      <table class="formtable">
						        <tr>
						            <td style="text-align:right;">流水号：</td>
									<td>
									  <input name="serialNumber" id="serialNumber" class="mini-textbox" width="200px" readonly="readonly"/>
									</td>
									<td style="text-align:right;">编号：</td>
									<td>
									  <input name="wtCode" id="wtCode" class="mini-textbox" readonly="readonly" width="200px"/>
									</td>
									 <td style="text-align:right;">对应的工作票流水号：</td>
									<td>
									  <input name="correspondingNumber" id="correspondingNumber" class="mini-textbox" width="200px" readonly="readonly"/>
									</td>
						        </tr>															
								<tr>
									<td style="text-align:right;">部门：</td>
									<td >
									  <input width="200px" name="orgId" id="orgId" textName="orgName" required="false" class="mini-buttonedit" width="200px" readonly="readonly"
										onbuttonclick="popLov(this,'选择部门',false,true,'${ctx}/sys/sysOrg/list?classId=0',850,500,'id,name','orgId,orgName')" onvaluechanged="changeDutyOrg">
									</td>
									<td style="text-align:right;">班组：</td>
									<td >
									  <input width="200px" name="maintOrg" id="maintOrg" textName="maintOrgName" class="mini-buttonedit" vtype="" required="false" width="150px" allowInput="false"  readonly="readonly"
										onbuttonclick="popLov(this,'请选择班组',false,true,'${ctx}/pg/pgClassInfo/lov?orgType=2',850,500,'orgId,orgName','maintOrg,maintOrgName')" />
									</td>
									<td style="text-align:right;">专业：</td>
									<td>
									  <input width="200px" name="specId" id="specId" textName="specName" class="mini-buttonedit" vtype="" required="false" allowInput="false"
										onbuttonclick="popLov(this,'选择专业',false,true,'${ctxRoot}/form?view=pg/pgSpecList',850,500,'id,name','specId,specName')" />
									</td>									
									<%-- <td>机组:</td>
									<td>
									  <input name="plantUnit" width="150px" id="plantUnit" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype=""  width="100%"
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_plant_unit" />
									</td> 	 --%>
								</tr>
								<tr>
									<td style="text-align:right;">动火工作负责人：</td>
									<td>
									  <input name="workLeaderName" id="workLeaderName" class="mini-textbox" allowInput="false" width="200px" readonly="readonly"/>
									</td>
									<td style="text-align:right;">电话：</td>									
									<td >
									  <input name="mobile" id="mobile" class="mini-textbox" width="200px" />
									</td>
									<td style="text-align:right;">状态：</td>
									<td>
									  <input width="200px" name="status" id="status" class="mini-combobox" allowInput="false" enabled="false" required="false" valueField="value" textField="label" vtype="" 
									    url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_status" />
									</td>
								</tr>
								<tr>
									<td style="text-align:right;">动火执行人：</td>
									<td>										
									  <input name="woWtFire.execByName" id="woWtFire.execByName" class="mini-textbox" allowInput="true" width="200px"/>
									</td>
									<td style="text-align:right;">操作证编号：</td>
									<td colspan="3">
									  <input width="200px" name="woWtFire.execByIdNumber" id="woWtFire.execByIdNumber" class="mini-textbox" />
									</td>
								</tr>
								<tr>
									<td style="text-align:right;">动火执行人：</td>
									<td>										
									  <input name="woWtFire.execByName2" id="woWtFire.execByName2" class="mini-textbox" allowInput="true" width="200px"/>
									</td>
									<td style="text-align:right;">操作证编号：</td>
									<td colspan="3">
									  <input width="200px" name="woWtFire.execByIdNumber2" id="woWtFire.execByIdNumber2" class="mini-textbox" />
									</td>
								</tr>
								<tr>
								    <td style="text-align:right;">功能位置：</td>
									<td>
									  <input name="equipLogicId" id="equipLogicId" textName="equipLogicId" allowInput="false" width="200px" class="mini-buttonedit" vtype="" required="false"
										onbuttonclick="popLov(this,'选择逻辑设备',false,true,'${ctxRoot}/form?view=/em/emEquipLogicLov',800,500,'id,name','equipLogicId,equipLogicName')"/>
									</td>
									<td style="text-align:right;"></td>
									<td colspan="3">
									  <input name="equipLogicName" id="equipLogicName" class="mini-textbox" readonly="readonly" width="200px"/>
									</td>								
    							</tr>
								<tr>
									<td style="text-align:right;">动火地点及设备名称：</td>
									<%-- <td colspan="5">
									  <input name="location" id="location" textName="location" class="mini-buttonedit" vtype="" required="false" width="100%" allowInput="true"
										onbuttonclick="popLov(this,'选择工作地址',false,true, '${ctx}/em/emEquipLogic/lov2',800,500,'id,name','locationId,location')" />
									</td> --%>
									<td colspan="5">
									  <input name="location" id="location" class="mini-textarea" vtype="" required="false" width="100%" />
									</td>
								</tr>
								<tr>
									<td style="text-align:right;">动火工作内容（必要时可附页绘图说明）：</td>
									<td colspan="5">
									  <input name="content" id="content" class="mini-textarea" vtype="" required="false" width="100%" />
									</td>
								</tr>
								<tr>
									<td style="text-align:right;">动火方式：</td>																		
									<td colspan="3" >									     
										<div id="woWtFire.fireModeId" name="woWtFire.fireModeId"  class="mini-checkboxlist" repeatItems="6" repeatLayout="table"  textField="label" valueField=value 
											 url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_firemode" >
										</div>
									</td>
									<td colspan="2">
										（动火方式可填写熔化焊接、切割、压力焊、钎焊、喷枪、喷灯、钻孔、打磨、锤击、破碎、切削等。）</td> 
								</tr>																																					
							  </table>
						    </div>
							
							
							<div class="mini-panel" title="运行部门应采取的安全措施：" width="auto" id="tabWoWtsmList" name="tabWoWtsmList" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm" permissionEdit="wo:woWt:edit"></sys:toolbargridsub>
								<div id="gridWoWtsm" class="mini-datagrid sGrid" style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.wtType}&typeId=7"
									idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="32" visible="false" hideable="true">序号 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype="" headerAlign="center" visible="false" hideable="true" allowSort="true" width="32">安措类型 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center" allowSort="false" width="800" sortField="a.descr" allowCellWrap="true">运行部门应采取的安全措施 
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="execRes" field="execRes" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="400">已执行（√）
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>
							
							<div class="mini-panel" title="动火部门应采取的安全措施" width="auto" id="tabWoWtsm6List" name="tabWoWtsm6List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm6" permissionEdit="wo:woWt:edit"></sys:toolbargridsub>
								<div id="gridWoWtsm6" class="mini-datagrid sGrid" style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.wtType}&typeId=6"
									idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="32" visible="false" hideable="true">序号 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype="" headerAlign="center" visible="false" hideable="true" allowSort="true" width="32">安措类型 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center" allowSort="false" width="800" sortField="a.descr" allowCellWrap="true">动火部门应采取的安全措施
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="execRes" field="execRes" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="400">已执行（√）
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>
							
							<table class="formtable">	
							    <tr>							       
									<td style="text-align:right;">申请动火时间：</td>
									<td colspan="5" >
									  自：<input name="planStartTime" id="planStartTime" class="mini-datepicker" showTime="true" vtype="" allowInput="false" format="yyyy-MM-dd HH:mm:ss" required="false" width="200px" /> 
									  至： <input name="planEndTime" id="planEndTime" class="mini-datepicker" showTime="true" vtype="" allowInput="false" format="yyyy-MM-dd HH:mm:ss" required="false" width="200px" onvaluechanged="checkEndTime(planStartTime,planEndTime)"/>
									</td>								
							    </tr>																						
								<tr>
									<td style="text-align:right;">动火工作票签发人：</td>
									<td>										
									  <input name="wtSigner" id="wtSignerName_" textName="wtSignerName" onbuttonclick="sign_('wtSignerName_','2')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" width="200px"/>
									</td>
									<td style="text-align:right;">签发日期：</td>
									<td colspan="3">
									  <input name="wtSignDate" id="wtSignDate" class="mini-datepicker" showTime="true" vtype="" allowInput="false" format="yyyy-MM-dd HH:mm:ss" required="false" width="200px"/>
									</td>
								</tr>
								<tr>
									<td colspan="6">审批：</td>
								</tr>
								<tr>									
									<td style="text-align:right;">动火部门安监人员：</td>
									<td>										
									  <input name="woWtFire.appCompSafeHealth" id="woWtFire.appCompSafeHealthName_" textName="woWtFire.appCompSafeHealthName"
										onbuttonclick="sign_('woWtFire.appCompSafeHealthName_','99')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" width="200px"/>
									</td>
									<td >
									  <input name="woWtFire.appCompSafeHealthTime" id="woWtFire.appCompSafeHealthTime" class="mini-datepicker" showTime="true" vtype="" allowInput="false" format="yyyy-MM-dd HH:mm:ss" required="false" width="200px"/>
									</td>
									
									<td style="text-align:right;">动火部门负责人或技术负责人签名：</td>
									<td >										
									  <input name="woWtFire.appDeptLeader" id="woWtFire.appDeptLeaderName_" textName="woWtFire.appDeptLeaderName"
									    onbuttonclick="sign_('woWtFire.appDeptLeaderName_','5')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" width="200px"/>
									</td>
									<td >
									  <input name="woWtFire.appDeptLeaderTime" id="woWtFire.appDeptLeaderTime" class="mini-datepicker" showTime="true" vtype="" allowInput="false" format="yyyy-MM-dd HH:mm:ss" required="false" width="200px"/>
									</td>
									
								</tr>								
								<tr>									
									<td style="text-align:right;">批准动火时间：</td>
									<td colspan="5">
									   自 <input name="appStartTime" id="appStartTime" class="mini-datepicker" allowInput="false" showTime="true" vtype="" allowInput="false" format="yyyy-MM-dd HH:mm:ss" required="false" width="200px"/> 
									   至 <input name="appEndTime" id="appEndTime" class="mini-datepicker" allowInput="false" showTime="true" vtype="" allowInput="false" format="yyyy-MM-dd HH:mm:ss" required="false" width="200px" onvaluechanged="checkEndTime(appStartTime,appEndTime)"/>
									</td>
								</tr>
								<tr>
									<td colspan="6">运行部门应采取的安全措施已全部执行完毕</td>
								</tr>
								<tr>
									<td style="text-align:right;">运行许可动火时间：</td>
									<td >
									  <input name="permitStartTime" id="permitStartTime" class="mini-datepicker" allowInput="false" showTime="true" vtype="" allowInput="false" format="yyyy-MM-dd HH:mm:ss" required="false" width="200px"/>
									</td>
									<td style="text-align:right;">运行许可人：</td>
									<td colspan="3">										
									  <input name="permitBy" id="permitByName_" textName="permitByName" onvaluechanged="padWorkLeader" onbuttonclick="sign_('permitByName_','3')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" width="200px"/>									    									     
									</td>
								</tr>								
								<tr style="display: none;">
									<td>检修负责人签名：</td>
									<td style="text-align: left;">
									  <input name="smDutyPrincipal" id="smDutyPrincipalName_" textName="smDutyPrincipalName"
										onbuttonclick="sign_('smDutyPrincipalName_','99')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />
									</td>
								</tr> 
								<tr>
									<td colspan="6">应配备的消防设施和采取的消防措施、安全措施已符合要求。可燃性、易爆气体含量或粉尘浓度合格。</td>
								</tr>
							</table>
							 <div class="mini-panel" title="可燃性、易爆气体含量或粉尘浓度测定：" width="auto" id="tabWoWtMeasureList" name="tabWoWtMeasureList" showCollapseButton="false" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtMeasure" permissionEdit="wo:woWt:edit"></sys:toolbargridsub>
								<div id="gridWoWtMeasure" class="mini-datagrid sGrid" style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtMeasure/allData?woWtType=${param.wtType}"
									idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true" allowCellWrap="true" editNextOnEnterKey="true"
									editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="id" field="id" vtype="int" headerAlign="center" allowSort="false" width="32" visible="false" hideable="true">序号 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>										
										<div name="measureTime"  field="measureTime" vtype="required" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120"   >测量时间
											<input property="editor" class="mini-datepicker" format="yyyy-MM-dd HH:mm:ss"  showTime="true" vtype="" style="width:100%;"  allowInput="false"/>																					   
										</div>
										<div name="material" field="material" vtype="" headerAlign="center"allowSort="false">测量介质 
										    <input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="standardValue" field="standardValue" vtype="" headerAlign="center"allowSort="false" >标准值
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="measureValue" field="measureValue" vtype="" headerAlign="center"allowSort="false" >测量值
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="measureBy" field="measureBy" vtype="" headerAlign="center" displayField="measureByName" allowSort="false" width="100">测定人
											 <input property="editor" class="mini-buttonedit" vtype="" required="false" allowInput="false" onbuttonclick="popLov(this,'选择测定人',false,true,'${ctxRoot}/form?view=sys/misUserList',850,500,'id,name','measureBy,measureByName','gridWoWtMeasure')" style="width: 100%;" />
										</div>
										<div name="measureByName" field="measureByName" vtype="" headerAlign="center" visible="false" hideable="true" allowSort="false" width="32">测定人名称
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>
							
							<table class="formtable">
							    <tr>
									<td colspan="6" style="height: 28px;">签字确认</td>
								</tr>
								<tr>
									<td style="text-align:right;">动火执行人：</td>																		
									<td>										
									  <input style="width: 200px" name="woWtFire.safeExecByName" id="woWtFire.safeExecByName" textName="woWtFire.safeExecByName" allowInput="false" required="false" class="mini-buttonedit"
									    onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','woWtFire.safeExecBy,woWtFire.safeExecByName')" onvaluechanged="update(this)" />
									</td>
                                    <td style="text-align:right;">消防监护人：</td>
									<td >										
									  <input style="width: 200px" name="woWtFire.safeFiremanBy" id="woWtFire.safeFiremanBy" textName="woWtFire.safeFiremanByName" allowInput="false" required="false" class="mini-buttonedit" 
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','woWtFire.safeFiremanBy,woWtFire.safeFiremanByName')" />
									</td>
									<td style="text-align:right;">动火工作负责人：</td>
									<td>										
									  <input style="width: 200px" name="woWtFire.safeWorkLeaderName" id="woWtFire.safeWorkLeaderName" textName="woWtFire.safeWorkLeaderName" allowInput="false" required="false" class="mini-buttonedit"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','woWtFire.safeWorkLeader,woWtFire.safeWorkLeaderName')" onvaluechanged="update(this)" />
									</td>									
								</tr>								
								<tr>																		
									<td style="text-align:right;">动火部门安监人员：</td>
									<td>										
									  <input style="width: 200px" name="woWtFire.safeDeptSafeByName" id="woWtFire.safeDeptSafeByName" textName="woWtFire.safeDeptSafeByName" allowInput="false" required="false" class="mini-buttonedit"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','woWtFire.safeDeptSafeBy,woWtFire.safeDeptSafeByName')" onvaluechanged="update(this)" />
									</td>
									<td style="text-align:right;">动火部门负责人或技术人员：</td>
									<td colspan="3">										
									  <input style="width: 200px" name="woWtFire.endsfDeptLeaderName"id="woWtFire.endsfDeptLeaderName" textName="woWtFire.endsfDeptLeaderName" allowInput="false" required="false" class="mini-buttonedit" 
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','woWtFire.endsfDeptLeader,woWtFire.endsfDeptLeaderName')" />									
									</td>
								</tr>
								<tr>								    									
									<td style="text-align:right;">允许动火时间：</td>
									<td colspan="5">
									  <input style="width: 200px" name="woWtFire.safeFireTime" id="woWtFire.safeFireTime" class="mini-datepicker" allowInput="false" showTime="true" vtype="" allowInput="false" format="yyyy-MM-dd HH:mm:ss" required="false" width="200px"/></td>
								</tr>
								<tr>
									<td colspan="6" >动火工作终结：动火工作于 
									  <input name="actEndTime" id="actEndTime" class="mini-datepicker" allowInput="false" showTime="true" vtype="" allowInput="false" format="yyyy-MM-dd HH:mm:ss" required="false" width="200px"/> 结束，材料、工具已清理完毕，现场确无残留火种，参与现场动火工作的有关人员已全部撤离，动火工作已结束。
									</td>
								</tr>
								<tr>
									<td style="text-align:right;">动火执行人：</td>
									<td>										
									  <input name="woWtFire.endExecByName" id="woWtFire.endExecByName"  class="mini-textbox" vtype = "" allowInput="true"  width="200px"/>
									</td>
									<td style="text-align:right;">消防监护人：</td>
									<td colspan="3">										
									  <input name="woWtFire.endFiremanBy" id="woWtFire.endFiremanByName_" textName="woWtFire.endFiremanByName"
										onbuttonclick="sign_('woWtFire.endFiremanByName_','99')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" width="200px"/>
									</td>
								</tr>
								<tr>
									<td style="text-align:right;">动火工作负责人：</td>
									<td>										
									  <input name="endWorkLeader" id="endWorkLeaderName_" textName="endWorkLeaderName"
									    onbuttonclick="sign_('endWorkLeaderName_','1')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" width="200px"/>
									</td>
									<td style="text-align:right;">工作许可人：</td>
								    <td colspan="3">									    
									  <input name="endPermitBy" id="endPermitByName_" textName="endPermitByName"
										onbuttonclick="sign_('endPermitByName_','3')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" width="200px"/>
									</td> 									
								</tr>								
								<tr>
									<td style="text-align:right;">备注：</td>
									<td colspan="5">
									  <input name="remarks" id="remarks" class="mini-textarea" vtype="" required="false" width="100%"  />
									</td>
								</tr>	
							</table>
							
							 <div class="mini-panel" title="检查评价" width="auto" height="auto"
							  showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
							   <table class="formtable">
								 <tr>
									<td style="text-align:right;">班组(专业)检查：</td>
									<td>
									  <input name="maintAssessType" id="maintAssessType" textName="maintAssessValue" style="width: 200px;" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype="" 
									    url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_assess_type" />
									</td>	
									<td style="text-align:right;">部门检查：</td>
									<td>
									  <input name="specAssessType" id="specAssessType" textName="specAssessValue" style="width: 200px;" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype="" 
									    url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_assess_type" />
									</td>
									<td style="text-align:right;">厂部检查：</td>
									<td>
									  <input name="ajhAssessType" id="ajhAssessType" textName="ajhAssessValue" style="width: 200px;" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype="" 
									    url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_assess_type" />
									</td>
								</tr>
								<tr>
								    <td style="text-align:right;">检查人：</td>
									<td>
									  <!-- <input name="" id="" class="mini-textbox" style="width: 200px;"/> -->
									  <input  name="maintAssessId" id="maintAssessId" required="false" textName="maintAssessName" class="mini-buttonedit" allowInput="false"  width="200px"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','maintAssessId,maintAssessName')" onvaluechanged="update(this)" />
									</td>
									<td style="text-align:right;">检查人：</td>
									<td>
									  <!-- <input name="" id="" class="mini-textbox" style="width: 200px;"/> -->
									  <input  name="specAssessId" id="specAssessId" required="false" textName="specAssessName" class="mini-buttonedit" allowInput="false"  width="200px"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','specAssessId,specAssessName')" onvaluechanged="update(this)" />
									</td>
									<td style="text-align:right;">检查人：</td>
									<td>
									  <!-- <input name="" id="" class="mini-textbox" style="width: 200px;"/> -->
									  <input  name="ajhAssessId" id="ajhAssessId" required="false" textName="ajhAssessName" class="mini-buttonedit" allowInput="false"  width="200px"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','ajhAssessId,ajhAssessName')" onvaluechanged="update(this)" />
									</td>								
								</tr>
								<tr>
								    <td style="text-align:right;">检查时间：</td>
									<td>
									  <input name="maintAssessDate" id="maintAssessDate" allowInput="false" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;" />
									</td>
									<td style="text-align:right;">检查时间：</td>
									<td>
									  <input name="specAssessDate" id="specAssessDate" allowInput="false" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;" />
									</td>
									<td style="text-align:right;">检查时间：</td>
									<td>
									  <input name="ajhAssessDate" id="ajhAssessDate" allowInput="false" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;" />
									</td>								
								</tr>	
								<tr>
								    <td style="text-align:right;">意见：</td>
									<td>
									  <input name="maintAssessContent" id="maintAssessContent" class="mini-textbox" style="width: 200px;"/>
									</td>
									<td style="text-align:right;">意见：</td>
									<td>
									  <input name="specAssessContent" id="specAssessContent" class="mini-textbox" style="width: 200px;"/>
									</td>
									<td style="text-align:right;">意见：</td>
									<td>
									  <input name="ajhAssessContent" id="ajhAssessContent" class="mini-textbox" style="width: 200px;"/>
									</td>								
								</tr>		
							  </table>
							</div>
							
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
		<!-- 加载作业安全措施票 -->
		<%-- <%@ include file="/WEB-INF/views/modules/wo/wt/woWtTaskSafeMeasureTab.jsp"%> --%>
		
		<%-- <div title="检修围栏" id="tabWoProcessList" name="tabSmElectronicFenceList"   style="border: 0px;"  >  			
			<div class="mini-fit">
				<div id="tabsSub1" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%">
				<div title="检修围栏"   style="border: 0px;"  >				
				<div id="gridSmElectronicFence" class="mini-datagrid" style="width:100%;height:100%;"
						 url="${ctx}/sm-region/sm/smElectronicFence/data" idField="id" onrowdblclick="onrowdblclick"
						 allowResize="true" pageSize="10" 
						 allowCellEdit="false" allowCellSelect="true" multiSelect="true"
						 editNextOnEnterKey="true"  editNextRowCell="true"
						 allowAlternating="true" showFilterRow="false"  showColumnsMenu="false"
					>
						<div property="columns">
								<!-- <div type="checkcolumn"></div> -->
								<div type="indexcolumn" headerAlign="center" width="35">序号</div>
								<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">id
									<input property="editor" class="mini-textbox"  style="width:100%;"  />
									<input id="id2-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
										   onvaluechanged="onFilterChangedChild(this,'gridSmElectronicFence')" showClose="true" oncloseclick="onFilterChangedChild(this,'gridOmLogTeam')"
									/>
								</div>
								<div name="fenceBegTime" field="fenceBegTime" vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center" allowSort="true" width="160"  hideable="true">围栏开始时间 
									<input property="editor" class="mini-textbox" style="width: 100%;" /> 
									<input id="fenceBegTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
										   onvaluechanged="onFilterChangedChild(this,'gridSmElectronicFence')" showClose="true" oncloseclick="onFilterChangedChild(this,'gridOmLogTeam')"
									/>
								</div>
								<div name="fenceEndTime" field="fenceEndTime" vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center" allowSort="true" width="160"  hideable="true">围栏结束时间 
									<input property="editor" class="mini-textbox" style="width: 100%;" /> 
									<input id="fenceEndTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
										   onvaluechanged="onFilterChangedChild(this,'gridSmElectronicFence')" showClose="true" oncloseclick="onFilterChangedChild(this,'gridOmLogTeam')"
									/>
								</div>
								<div name="fenceName"  field="fenceName" vtype=""  headerAlign="center" allowSort="true" width="150" >围栏名称
									<input property="editor" class="mini-textbox"  style="width:100%;"  />
									<input id="fenceName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
										   onvaluechanged="onFilterChangedChild(this,'gridSmElectronicFence')" showClose="true" oncloseclick="onFilterChangedChild(this,'gridOmLogTeam')"
									/>
								</div>
								<div name="fenceDesc"  field="fenceDesc" vtype=""  headerAlign="center" allowSort="true" width="150" >围栏描述
									<input property="editor" class="mini-textbox"  style="width:100%;"  />
									<input id="fenceDesc-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
										   onvaluechanged="onFilterChangedChild(this,'gridSmElectronicFence')" showClose="true" oncloseclick="onFilterChangedChild(this,'gridOmLogTeam')"
									/>
								</div>																	
								<div name="wtId"  field="wtId" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">关联工作票id
									<input property="editor" class="mini-textbox"  style="width:100%;"  />
									<input id="wtId2-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
										   onvaluechanged="onFilterChangedChild(this,'gridSmElectronicFence')" showClose="true" oncloseclick="onFilterChangedChild(this,'gridOmLogTeam')"
									/>
								</div>
							</div>
					</div>
				 </div>
				</div>
			</div>
		</div> --%>
		
		<div title="附件" id="tabWoProcessList"   style="border: 0px;"  >  
		     <sys:toolbargriddoc girdId="dgTestSub1" permissionEdit="wo:woWt:edit" objKeyField="id" objDescrField="name" objType="woWt6"></sys:toolbargriddoc>
	         <div class="mini-fit">
	             <sys:griddoc girdId="dgTestSub1"></sys:griddoc>
	         </div>				
		</div> <!-- 附件end -->	
				
	</div>
    <!-- 新流程方式引入 -->
	<sys:workflow flowKey="woWt6"></sys:workflow>
	<sys:toolbarfooter></sys:toolbarfooter>
	<sys:excelframe></sys:excelframe>
	<sys:docAttach girdId="dgTestSub1"></sys:docAttach>
	<jsp:include page="permit.jsp"></jsp:include>
	<jsp:include page="attachTab.jsp" flush="true" />	
	<script type="text/javascript">
		initBase({
			id : "datagridMain",
			objId : "WoWt",
			masterKeyField : "id",
			dataUrl : "${ctx}/wo-wt/wo/woWt/data?baseQuery=a.is_standard='${param.isStandard}'",
			getUrl : "${ctx}/wo-wt/wo/woWt/get?wtType=${param.wtType}",
			initInsertUrl : "${ctx}/wo-wt/wo/woWt/initInsert?wtType=${param.wtType}&isStandard=${param.isStandard}&mainTicketId=${param.mainTicketId}&correspondingNumber=${param.correspondingNumber}&sourceType=1",
			saveUrl : "${ctx}/wo-wt/wo/woWt/save",
			removeUrl : "${ctx}/wo-wt/wo/woWt/remove",
			exportUrl : "${ctx}/wo-wt/wo/woWt/export",
			addCan :'0',
			cloneCan :'0',
			onBeforeSaveForm : onBeforeSaveForm,
			onAfterNewRecord:addNewReword,
            onAfterLoadRecord: onAfterLoadRecord,          
            onBeforeSaveCheck: onBeforeSaveCheck,
            onBeforeSaveForm : onBeforeSaveForm
		});

		initChilds(
				"#editform",
				"tabsMain",
				[
					{//运行部门应采取的安全措施
						id : "gridWoWtsm",
						objId : "WoWtSm",
						FK : "wtId",
						cascade : true,
						cascadeVisible : true,
						insertPos : "L",
						insertType : "A",
						panelId : "tabWoWtsmList",
						dataUrl : "${ctx}/wo-wt/wo/woWtSm/data?typeId=7",
						getUrl : "${ctx}/wo-wt/wo/woWtSm/get",
						saveUrl : "${ctx}/wo-wt/wo/woWtSm/save",
						removeUrl : "${ctx}/wo-wt/wo/woWtSm/remove",
						exportUrl : "${ctx}/wo-wt/wo/woWtSm/export",
						initInsertUrl : "${ctx}/wo-wt/wo/woWtSm/initInsert?typeId=7"
					},
					{//动火部门应采取的安全措施
						id : "gridWoWtsm6",
						objId : "WoWtSm",
						FK : "wtId",
						cascade : true,
						cascadeVisible : true,
						insertPos : "L",
						insertType : "A",
						panelId : "tabWoWtsm6List",
						dataUrl : "${ctx}/wo-wt/wo/woWtSm/data?typeId=6",
						getUrl : "${ctx}/wo-wt/wo/woWt/get?wtType=${param.wtType}",
						saveUrl : "${ctx}/wo-wt/wo/woWtSm/save",
						removeUrl : "${ctx}/wo-wt/wo/woWtSm/remove",
						exportUrl : "${ctx}/wo-wt/wo/woWtSm/export",						
						initInsertUrl : "${ctx}/wo-wt/wo/woWtSm/initInsert?typeId=6",
						initData : {
							wtType : '${woWt.wtType}'
						}
					},
					{//测量介质
						id : "gridWoWtMeasure",
						objId : "WoWtMeasure",
						FK : "wtId",
						cascade : true,
						cascadeVisible : true,
						insertPos : "L",
						insertType : "A",
						panelId : "tabWoWtMeasureList",
						dataUrl : "${ctx}/wo-wt/wo/woWtMeasure/data",
						getUrl : "${ctx}/wo-wt/wo/woWtMeasure/get?wtType=${param.wtType}",
						saveUrl : "${ctx}/wo-wt/wo/woWtMeasure/save",
						removeUrl : "${ctx}/wo-wt/wo/woWtMeasure/remove",
						exportUrl : "${ctx}/wo-wt/wo/woWtMeasure/export",						
						initInsertUrl : "${ctx}/wo-wt/wo/woWtMeasure/initInsert",
						initData : {
							wtType : '${woWt.wtType}'
						}
					},						
					/* {
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
					}, */
					/* {//作业安全措施票
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
					}, */
				    /* {//新增显示关联检修围栏信息
						id : "gridSmElectronicFence",
						objId : "SmElectronicFence",
						FK : "wtId",				
						cascade : true,								
						insertPos : "L",
						insertType : "A",
						tabsId : "tabsMain",
						tabName : "tabSmElectronicFenceList",				
						//dataUrl:"http://192.168.0.171:18600/sm-region/sm/smElectronicFence/data"
						dataUrl:"${ctx}/sm-region/sm/smElectronicFence/data"
					}, */
					{//文档附件 
                        id:"dgTestSub1",
                        cascade:true,
                        //fileTypes:"*.*",
                        folder:"woWt6",                           
                        FKLinks: [
                            {FK: "objKey", masterKeyField: "id"},
                            {FK: "objType", masterKeyField: "(\"woWt6\")"}
                        ],
                        cascadeNoClone: true,
                        dataUrl:"${ctx}/ims-ext/dm/dmDoc/data",
                        getUrl:"${ctx}/ims-ext/dm/dmDoc/get",
                        saveUrl:"${ctx}/ims-ext/dm/dmDoc/save",
                        removeUrl:"${ctx}/ims-ext/dm/dmDoc/remove",
                        exportUrl:"${ctx}/ims-ext/dm/dmDoc/export",
                        onDocActionRenderer:onDocActionRenderer
                    } 
					
					
				]);

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
		function onGridSubOpMiClick_WoWtFire(e) {
			var menuItem = null;
			if (e.item == undefined) {
				menuItem = e.sender.item;
			} else {
				menuItem = e.item;
			}
		}
		
		function addButton(){
		  sysToolBar_.addButtonOption({
			"buttonId":'print',
			"functionStr":'print',/* 对应按钮的点击事件 */
			/* "gridId":"gridSmCheckQuestion", *//* 对应具体的列表，默认给明细 */
			"name":'打印预览'
		  });
		  sysToolBar_.addButtonOption({
			"buttonId":'linkMainTicket',
			"functionStr":'linkMainTicket',/* 对应按钮的点击事件 */			
			"name":'关联主票'
	      });
		  /* sysToolBar_.addButtonOption({
			"buttonId":'repairRail',
			"functionStr":'repairRail',		
			"name":'检修围栏'
		  });   */
	    }
	  
		
	   //关联主票
	   function linkMainTicket(){    	
	      var id = mini.get("id").getValue();		 
	   	  if (id == "" || id == null) {
	   		mini.alert("请先保存再关联主票！");
	   		return;
	   	  }	
	   	  var mainTicketId = mini.get("mainTicketId").getValue();
	      //如果主票id为空，则说明该东湖票没有关联主票
		  if (mainTicketId == null || mainTicketId == "") {
			/* var url = "${ctxRoot}/form?view=wo/woWtLov&addCan=0&baseFilter=a.status<>'10' and  a.status<>'8' and a.wt_type <> '5' and a.wt_type<>'6' and a.wt_type<>'8'";		
			mini.open({
				//targetWindow: window.top,   //页面对象。默认是顶级页面。
				url : url, //页面地址
				title : "主票列表", //标题
				width : "80%", //宽度
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
						var iframe = this.getIFrameEl();
						var grid = iframe.contentWindow.mini
								.get("datagridMain");
						var row = grid.getSelected();
						mini.get("mainTicketId").setValue(row.id);
						showTipM("info", "提示", "关联成功！");
						saveForm();
					}
				}

			}); */
			mini.alert("未关联主票！");
		    return ;
		}
		//主票id不为空则说明已经关联主票，查询票的类型，直接跳转详细页面
		else {
			$.ajax({
				url : "${ctx}/wo-wt/wo/woWt/get",
				data : {
					id : mainTicketId
				},
				type : "post",
				success : function(text) {
					var o = mini.decode(text);				
					if (o != null) {
						newTabPage(
								"相关工作票查看",
								'${ctxRoot}/form?view=wo/wt/woWtForm'
										+ o.wtType
										+ '&border=1&action=view&id='
										+ o.id
										+ '&showList=0&showTree=0&showForm=1',true);
					} else {
					}
				}
			});
		}
	    }
	    
	  
	       
	    
	    function onBeforeSaveForm() {	    	   	
    	  var fire = mini.get("woWtFire.fireModeId").getText();
    	  mini.get("woWtFire.fireMode").setValue(fire);		
		  return true;
	  }
	    
	  //加载页面编辑权限
	    //editControl.loadEditList('woWt6')
</script>
</body>
</html>