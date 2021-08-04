<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<html>
<head>
<title>工作票</title>
<meta name="decorator" content="default" />
<link href="${ctxStatic}/static/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctxStatic}/static/common/sysToolBar.js"></script>
<script type="text/javascript" src="${ctxStatic}/static/common/editControl.js"></script>
<jsp:include page="borderCss.jsp"></jsp:include>
<style type="text/css">
/* .mini-panel-body .mini-grid-rows .mini-grid-rows-view
{
   height:auto;
   _height:auto;   
}  */  
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
					url="${ctx}/wo-wt/wo/woWt/data"
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
						<div name="content" field="content" vtype="" headerAlign="center" allowSort="true" width="300">工作内容 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="content-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="status" field="status" vtype="" type="comboboxcolumn" headerAlign="center" allowSort="true" width="100" sortField="a.status">状态
							<input property="editor" class="mini-combobox" style="width: 100%;" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_status" /> 
							<input id="status-Filter" name="mini-column-filter" property="filter" class="mini-combobox" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_status" multiSelect="true" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>						
						<div name="wtType" field="wtType" vtype="" headerAlign="center" type="comboboxcolumn" allowSort="true" width="145" visible="false" hideable="true">类型 
							<input property="editor" class="mini-combobox" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_user_wt_type" style="width: 100%;" /> 
							<input id="wtType-Filter" name="mini-column-filter" property="filter" class="mini-combobox" multiSelect="true" valueField="value" textField="label" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>												
						<div name="descr" field="descr" vtype="" headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">描述 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="descr-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="location" field="location" vtype="" headerAlign="center" allowSort="true" width="200" visible="false">工作地点 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="location-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="planStartTime" field="planStartTime" vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center" allowSort="true" width="160"  hideable="true">计划开始时间 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="planStartTime-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="planEndTime" field="planEndTime" vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center" allowSort="true" width="160"  hideable="true">计划结束时间 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="planEndTime-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>														
						<div name="workLeader" field="workLeader" vtype="" headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">工作负责人 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="workLeader-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="workLeaderName" field="workLeaderName" vtype="" headerAlign="center" allowSort="true" width="100" sortField="a.work_leader_name">工作负责人 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="workLeaderName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="wtSigner" field="wtSigner" vtype="" headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">工作票签发人 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="wtSigner-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="wtSignerName" field="wtSignerName" vtype="" headerAlign="center" allowSort="true" width="100" sortField="a.wt_signer_name">工作签发人 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="wtSignerName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="wtReceiveName" field="wtReceiveName" vtype="" headerAlign="center" allowSort="true" width="100" sortField="a.wt_receive_name">工作票接收人 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="wtReceiveName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="wtReceiveTime" field="wtReceiveTime" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="150">工作票接收时间 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="wtReceiveTime-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="wtSignDate" field="wtSignDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="160" visible="false">工作票签发时间 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="wtSignDate-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="smPermitBy" field="smPermitBy" vtype="" headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">工作票许可人 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="smPermitBy-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="smPermitByName" field="smPermitByName" vtype="" headerAlign="center" allowSort="true" width="100" sortField="a.sm_permit_by_name">工作许可人 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="smPermitByName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>						
						<div name="actEndTime" field="actEndTime" vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center" allowSort="true" width="160">工作终结时间 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="actEndTime-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						
						<div name="appDutyLeaderName" field="appDutyLeaderName" vtype="" headerAlign="center" allowSort="true" width="140" visible="false" hideable="true">值长 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 
							<input id="appDutyLeaderName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
						</div>														
						<div name="remarks" field="remarks" vtype="" headerAlign="center" allowSort="true" width="255" sortField="a.remarks" visible="false">备注信息 
							<input property="editor" class="mini-textarea" style="width: 100%;" /> 
							<input id="remarks-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
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
							<input class="mini-hidden" name="updateDate" id="updateDate" />
							<input class="mini-hidden" name="id" id="id" /> 
							<input class="mini-hidden" name="procInsId" id="procInsId" /> 
							<input class="mini-hidden" name="wtType" id="wtType" />						
							<input class="mini-hidden" name="workLeaderName" id="workLeaderName" />							
							<input class="mini-hidden" name="maintOrgName" id="maintOrgName" />
							<input class="mini-hidden" name="orgName" id="orgName" /> 
							<input class="mini-hidden" name="pcSigner" id="pcSigner" />							
							<input class="mini-hidden" name="woWtLC.id" id="woWtLC.id" />
							<input class="mini-hidden" name="woWtLC.wtId" id="woWtLC.wtId" /> 
							<input class="mini-hidden" name="woWtLC.oldWorkLeaderName" id="woWtLC.oldWorkLeaderName"/> 							
							<input class="mini-hidden" name="woWtLC.nowWorkLeaderName" id="woWtLC.nowWoLeaderName"/>							
							<input class="mini-hidden" name="woWtDelay.id" id="woWtDelay.id" />
							<input class="mini-hidden" name="woWtDelay.wtId" id="woWtDelay.wtId" />
							<input class="mini-hidden" name="workCondition.wtId" id="workCondition.wtId" />							
							<input class="mini-hidden" name="specShortCode" id="specShortCode" /> 
							<input class="mini-hidden" name="defectId" id="defectId" value="${param.defectId}" />
							<input class="mini-hidden" id="isStandard" name="isStandard" value="${param.isStandard}"/> 
							<input class="mini-hidden" name="procStatus" id="procStatus" />
						    <input class="mini-hidden" id="currUserName" name="currUserName" value="${param.currUserName}"/>
							<input class="mini-hidden" id="currUserId" name="currUserId" value="${param.currUserId}"/> 
							<input type="hidden" id="currUserLoginName" name="currUserLoginName" value="${param.currUserLoginName}"/>
							<!-- 责任部门id -->
							<input class="mini-hidden" id="dutyOrgId" name="dutyOrgId"/>
							<!-- 工作地点id -->
							<input class="mini-hidden" id="locationId" name="locationId"/>							
							<!-- 审核人id -->
							<input class="mini-hidden" name="auditId" id="auditId" />							
							<input type="hidden" name="videoServer" id="videoServer" value="${param.videoServer}"/>													
							<!-- 新增 mengqiang 2018-11-07 -->
							<!-- 工单id -->
							<input class="mini-hidden" name="woId" id="woId" />
							<input class="mini-hidden" name="woJobId" id="woJobId" />							
							<input type="hidden" name="canEdit" id="canEdit" value="${param.canEdit}"/>							
							<input class="mini-hidden" name="examineTime" id="examineTime" />
							<input class="mini-hidden" name="randomCode" id="randomCode" />											
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
							<!-- 动火票关联字段 -->
							<input class="mini-hidden" id="mainTicketId" name="mainTicketId">
							
							<div class="mini-panel" title="基本信息" width="auto" height="auto"
						      showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
							  <table class="formtable"> 
								<tr>
								    <td style="text-align:right;">工作票流水号：</td>
									<td>
									  <input name="serialNumber" id="serialNumber" class="mini-textbox" width="200px" readonly="readonly"/>
									</td>
									<td style="text-align:right;">编号：</td>
									<td>
									  <input name="wtCode" id="wtCode" class="mini-textbox" width="200px" readonly="readonly"/>
									</td>
									<td style="text-align:right;">状态：</td>
									<td>
									  <input name="status" id="status" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype=""  width="200px" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_status" readonly="readonly"/>
									</td>									
								  </tr>	
								  <tr>
								    <td style="text-align:right;">工单：</td>
									<td>
									  <input name="woCode" id="woCode" class="mini-textbox" width="200px" />
									</td>
									<td style="text-align:right;">缺陷单：</td>
									<td>
									  <input name="defectCode" id="defectCode" class="mini-textbox" width="200px" />
									</td>
									<td style="text-align:right;">作业类型：</td>
									<td>
									  <input name="jobType" id="jobType" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype=""  width="200px" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_job_type" />
									</td>									
								  </tr>	
								  <tr>
								    <td style="text-align:right;">机组：</td>
									<td>
									  <input name="plantUnit" id="plantUnit" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype=""  
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_plant_unit"  width="200px"/>
									</td>
									<td style="text-align:right;">功能位置：</td>
									<td>
									  <input name="equipLogicName" id="equipLogicName" textName="equipLogicName" allowInput="false" width="200px" class="mini-buttonedit" vtype="" required="false"
										onbuttonclick="popLov(this,'选择逻辑设备',false,true,'${ctxRoot}/form?view=/em/emEquipLogicLov',800,500,'id,name','equipLogicId,equipLogicName')"/>
									</td>
									<td style="text-align:right;">原KKS：</td>
									<td>
									  <input name="equipLogicId" id="equipLogicId" class="mini-textbox" readonly="readonly" width="200px"/>
									</td>
									<!-- <td><input name="equipName" id="equipName"
										class="mini-textbox" readonly="readonly" /></td> -->															
								  </tr>	
								  <tr>
									<td style="text-align:right;">工作负责人(监护人)：</td>
									<td>
									  <input  name="workLeader" id="workLeader" required="false" textName="workLeaderName" class="mini-buttonedit" allowInput="false"  readonly="readonly" width="200px"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','workLeader,workLeaderName')" onvaluechanged="update(this)" />
									</td>
									<td style="text-align:right;">电话：</td>									
									<td>
									  <input name="mobile" id="mobile" class="mini-textbox" width="200px" readonly="readonly"/>
									</td>
									<td style="text-align:right;">工作班成员数量：</td>
									<td>
									  <input name="personNum" id="personNum" class="mini-spinner" allowNull="true" width="200px"/>
									</td>
								  </tr>							  							
								  <tr>
									<td style="text-align:right;">部门：</td>
									<td>
									  <input name="orgId" id="orgId" textName="orgName" width="200px" class="mini-buttonedit" allowInput="false"  readonly="readonly"
										onbuttonclick="popLov(this,'选择部门',false,true,'${ctxRoot}/form?view=sys/sysOrgList',850,500,'id,name','orgId,orgName')" onvaluechanged="changeDutyOrg">
									</td>
									<td style="text-align:right;">专业：</td>									
									<td>
									  <input name="specId" id="specId" textName="specName" class="mini-buttonedit"  required="false" allowInput="false" width="200px"
										onbuttonclick="popLov(this,'选择专业',false,true,'${ctxRoot}/form?view=pg/pgSpecList',850,500,'id,name','specId,specName')" />
									</td>
									<td style="text-align:right;">班组：</td>									
									<td>
									  <input name="maintOrg" id="maintOrg" textName="maintOrgName" class="mini-buttonedit" vtype="" required="false" width="200px" allowInput="false" readonly="readonly"
										onbuttonclick="popLov(this,'请选择班组',false,true,'${ctxRoot}/form?view=pg/pgClassInfo/lov?orgType=2',850,500,'orgId,orgName','maintOrg,maintOrgName')" />
									</td>								
								  </tr>
								  <tr>
									<td style="text-align:right;">工作班人员：</td>
									<td colspan="5">									  
									   <input id="workClassPersonIds" class="mini-textboxlist" name="workClassPersonIds" textName="workClassPerson" allowInput="false" required="false" style="width:600px;"/>                                   
	                                      <a id="choosePerson" class="mini-button " plain="true" onclick="popLovJson1(this)">选择...</ a>							
									</td>																
								  </tr>							
								  <tr>
									<td style="text-align:right;">工作地点：</td>
									<td colspan="5">
									  <input name="location" id="location" textName="location" class="mini-buttonedit" vtype="" required="false" width="100%" allowInput="true"
										onbuttonclick="popLov(this,'选择工作地址',false,true, '${ctxRoot}/form?view=/em/emEquipLogicLov',800,500,'id,name','locationId,location')" />
									</td>																	
								 </tr>							 
								  <tr>
									<td style="text-align:right;">工作内容：</td>
									<td colspan="5">
									  <input name="content" id="content" class="mini-textarea" vtype="" required="false" width="100%" />
									</td>
								  </tr> 
								  <tr>
									<td style="text-align:right;">专职监护人监护：</td>
									<td colspan="5">
									  <input name="isTutelage" id="isTutelage" class="mini-CheckBox" onvaluechanged="updateIsTutelage" vtype="" required="false" width="100%" />
									</td>
								  </tr>
								  <tr>
								    <td style="text-align:right;">专职监护人：</td>
									<td>
									  <!-- <input name="tutelageName" id="tutelageName" class="mini-textbox"  width="100%"/> -->
									 
									  <%-- <input  name="tutelageId" id="tutelageId" required="false" textName="tutelageName" class="mini-buttonedit" allowInput="false" enabled="false"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctx}/sys/sysUser/sysMisList',850,500,'id,name','tutelageId,tutelageName')" />									 --%>
									  <input  name="tutelageId" id="tutelageId" required="false" textName="tutelageName" class="mini-buttonedit" allowInput="false" width="200px"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','tutelageId,tutelageName')" onvaluechanged="update(this)" />
									</td>
									<td style="text-align:right;">监护地点：</td>
									<td>
									  <input name="tutelageAddress" id="tutelageAddress" class="mini-textbox" width="200px"/>
									</td>
									<td style="text-align:right;">监护内容：</td>
									<td>
									  <input name="tutelageContent" id="tutelageContent" class="mini-textbox" width="200px"/>
									</td>									
								  </tr>								 							 
								  <tr>
									<td style="text-align:right;">计划工作开始时间：</td>
									<td>
									  <input name="planStartTime" id="planStartTime" allowInput="false" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;" />
									</td>
									<td style="text-align:right;">计划工作结束时间：</td>
									<td colspan="3">   
									  <input name="planEndTime" id="planEndTime" allowInput="false" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;" />
									</td>
								  </tr>																														
							  </table>
                            </div>
                            
							<div class="mini-panel" title="应拉断路器" width="auto"  id="tabWoWtsm1List" name="tabWoWtsm1List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm1" permissionEdit="wo:woWtSm:edit"></sys:toolbargridsub>																						
								<div id="gridWoWtsm1" class="mini-datagrid sGrid" style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.wtType}&typeId=1"
									idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true"
									showColumnsMenu="true" multiSelect="true" allowHeaderWrap="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="64"visible="false" hideable="true">序号 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="400">应拉断路器（开关）和隔离开关（刀闸），包括填写前已拉断路器（开关）和隔离开关（刀闸）（注明编号）<br />备注：本列由工作票负责人填写 
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="execRes" field="execRes" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="400">已拉断路器（开关）和隔离开关（刀闸）（注明编号）<br /> 备注：本列由工作许可人（值班员）填写 
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype="" headerAlign="center" visible="false" hideable="true" allowSort="false" width="32">安措类型
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>
							
							<div class="mini-panel" title="应装接地线" width="auto"  id="tabWoWtsm2List" name="tabWoWtsm2List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm2" permissionEdit="wo:woWtSm:edit"></sys:toolbargridsub>
								<div id="gridWoWtsm2" class="mini-datagrid sGrid" style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.wtType}&typeId=2"
									idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true"showColumnsMenu="true" multiSelect="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" visible="false" hideable="true">序号 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center" allowSort="false" width="400" allowCellWrap="true">应装接地线（注明地点）<br /> 备注：本列由工作票负责人填写 
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="groupNum" field="groupNum" vtype="" headerAlign="center" allowSort="true" width="100" visible="false" hideable="true">组数 
											<input property="editor" class="mini-spinner" allowLimitValue="false" style="width: 100%;" />
										</div>
										<div name="execRes" field="execRes" vtype="" headerAlign="center" allowSort="false" width="400" allowCellWrap="true">已装接地线（注明接地线编号和装设地点）<br /> 备注：本列由工作许可人（值班员）填写 
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="wireCode" field="wireCode" vtype="" headerAlign="center" allowSort="true" width="100" visible="false" hideable="true">地线号 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype="" headerAlign="center" visible="false" hideable="true" allowSort="false" width="30">安措类型 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
									</div>
								</div>
							</div> 
							
							<div class="mini-panel" title="应设遮栏、应挂标示牌" width="auto" id="tabWoWtsm3List" name="tabWoWtsm3List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm3" permissionEdit="wo:woWtSm:edit"></sys:toolbargridsub>
								<div id="gridWoWtsm3" class="mini-datagrid sGrid" style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.wtType}&typeId=3"
									idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">序号 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="400">应设遮栏、应挂标示牌<br /> 备注：本列由工作票负责人填写 
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="execRes" field="execRes" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="400">已设遮栏、已挂标示牌<br /> 备注：本列由工作许可人（值班员）填写 
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype="" headerAlign="center" visible="false" hideable="true" allowSort="true" width="32">安措类型
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
									</div>
								</div>
							</div> 
							
							<div class="mini-panel" title="工作地点保留带电部分和补充安全措施" width="auto"  id="tabWoWtsm4List" name="tabWoWtsm4List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm4" permissionEdit="wo:woWtSm:edit"></sys:toolbargridsub>
								<div id="gridWoWtsm4" class="mini-datagrid sGrid" style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.wtType}&typeId=4"
									idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="32" visible="false" hideable="true">序号 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype="" headerAlign="center" visible="false" hideable="true"allowSort="false" width="32">安措类型 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>										
										<div name="descr" field="descr" vtype="" headerAlign="center" allowSort="false" width="400" allowCellWrap="true"> 安全措施 
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="execRes" field="execRes" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="400">已执行（√）
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>
							
							<div class="mini-panel" title="工作票签发" width="auto" height="auto"
						      showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
						      <table class="formtable">
								<tr>
									<td style="text-align:right;">工作票签发人：</td>
									<td>
									  <input name="wtSigner" id="wtSignerName_" textName="wtSignerName"  onbuttonclick="sign_('wtSignerName_','2')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/>										
									</td>
									<td style="text-align:right;">工作票签发时间：</td>
									<td colspan="3">
									  <input name="wtSignDate" allowInput="false"id="wtSignDate" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" vtype="" required="false" style="width: 200px;" />
									</td>
								</tr>
								<tr>																																	
									<td style="text-align:right;">值长(运行值班负责人)：</td>
									<td>
									  <input name="wtReceiver" id="wtReceiveName_" textName="wtReceiveName"  onvaluechanged="inputReceiveWorkLeader" style="width: 200px;"
										onbuttonclick="sign_('wtReceiveName_','100')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" /> 
									</td>
									<td style="text-align:right;">工作票接收时间：</td>
									<td>
									  <input name="wtReceiveTime" id="wtReceiveTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" allowInput="false" required="false" style="width: 200px;"/>
									</td>	
									<td style="text-align:right;">工作负责人：</td>
									<td >
									  <input style="width: 200px;" name="receiveWorkLeader" id="receiveWorkLeaderName_" textName="receiveWorkLeaderName"
										onbuttonclick="sign_('receiveWorkLeaderName_','1')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" /> 										
									</td>
								 </tr>										
							  </table>
						    </div>
						    
							<div class="mini-panel" title="工作票批准" width="auto" height="auto"
						      showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
						      <table class="formtable">
								<tr>
									<td style="text-align:right;">批准工作开始时间：</td>																									    
									<td>
									  <input name="appStartTime" allowInput="false" id="appStartTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;" />
									</td>
									<td style="text-align:right;">批准工作结束时间：</td>
									<td>
									  <input name="appEndTime" allowInput="false" id="appEndTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;" onvaluechanged="checkEndTime(appStartTime,appEndTime)"/>
									</td>								
									<td style="text-align:right;">值长(或单元长)：</td>
									<td>
									  <input name="appDutyLeader" id="appDutyLeaderName_" textName="appDutyLeaderName" onbuttonclick="sign_('appDutyLeaderName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/>										
									</td>									
								</tr>
							  </table>
						    </div>
						    
						    <div class="mini-panel" title="工作票许可" width="auto" height="auto"
						      showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
						      <table class="formtable">
						        <tr>
									<td style="text-align:right;">许可开始时间：</td>
									<td>
									  <input name="permitStartTime" id="permitStartTime" class="mini-datepicker" allowInput="false" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;"/>
									</td>								
									<td style="text-align:right;">工作许可人：</td>
									<td>
									  <input name="permitBy" id="permitByName_" textName="permitByName" onvaluechanged="padWorkLeader" 
									    onbuttonclick="sign_('permitByName_','3')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/>										
									</td>
								</tr>
								<tr>								    
									
									<td style="text-align:right;">工作负责人：</td>
									<td >
									  <input name="workLeaderSign" id="workLeaderSignName_" textName="workLeaderSignName" onbuttonclick="sign_('workLeaderSignName_','1')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/> 										
									</td>
									<td style="text-align:right;">许可值别：</td>
								    <td colspan="3">
								     <input name="permitDutyName" id="permitDutyName" class="mini-textbox" width="200px" />
								    </td>									
								</tr>
						      </table>
						    </div>
						    
						    <div class="mini-panel" title="工作票负责人变更" width="auto" height="auto"
						      showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
						      <table class="formtable">
						        <tr>
									<td style="text-align:right;">变更后工作负责人：</td>
									<td>
									  <input style="width: 200px;" name="woWtLC.nowWorkLeader" id="woWtLC.nowWorkLeader" required="false" textName="woWtLC.nowWorkLeaderName" class="mini-buttonedit" allowInput="false"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=wo/woWtLeaderChangeNewWorKLeaderList&addCan=0&wtType=${param.wtType}&qualType=1',850,500,'id,name','woWtLC.nowWorkLeader,woWtLC.nowWorkLeaderName')" />
									</td>
									<td style="text-align:right;">变更时间：</td>
									<td colspan="3">
									  <input name="woWtLC.changeTime" id="woWtLC.changeTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;"/>
									</td>
								</tr>
								<tr>
									<td style="text-align:right;">工作票签发人：</td>
									<td>
									  <input name="woWtLC.wtSigner" id="woWtLC.wtSignerName_" textName="woWtLC.wtSignerName"
									    onbuttonclick="sign_('woWtLC.wtSignerName_','2')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/> 										
									</td>									
									<td style="text-align:right;">值长(运行值班负责人)：</td>
									<td colspan="3">
									  <input name="woWtLC.permitBy" id="woWtLC.permitByName_" textName="woWtLC.permitByName"
									    onbuttonclick="sign_('woWtLC.permitByName_','3')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/> 										
									
									</td>
								</tr>
						      </table>
						    </div>
						    
						    <div class="mini-panel" title="工作票延期" width="auto" height="auto"
						      showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
						      <table class="formtable">						       
								<tr>
									<td style="text-align:right;">有效期延期到：</td>
									<td colspan="5">
									  <input name="woWtDelay.delayTime" id="woWtDelay.delayTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;" />
									</td>
								</tr>
								<tr>									
									<td style="text-align:right;">工作负责人：</td>
									<td>										
									  <input name="woWtDelay.workLeader" id="woWtDelay.workLeaderName_" textName="woWtDelay.workLeaderName"
										onbuttonclick="sign_('woWtDelay.workLeaderName_','1')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/>
									</td>
									<td style="text-align:right;">签字时间：</td>
									<td colspan="3">
									  <input name="woWtDelay.workLeaderTime" allowInput="false" id="woWtDelay.workLeaderTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;" />
									</td>
								</tr>
								<tr>
									<td style="text-align:right;">值长(运行值班负责人)：</td>
									<td>										
									  <input name="woWtDelay.permitBy" id="woWtDelay.permitByName1_" textName="woWtDelay.permitByName"
										onbuttonclick="sign_('woWtDelay.permitByName1_','3')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/>
									</td>										
									<td style="text-align:right;">签字时间：</td>
									<td colspan="3">
									  <input name="woWtDelay.permitByTime" allowInput="false" id="woWtDelay.permitByTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;" />
									</td>
								</tr>																														
						      </table>
						    </div>
						    
						    <div class="mini-panel" title="检修交代" width="auto" height="auto"
							  showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
						      <table class="formtable" border="0" cellpadding="0" cellspacing="1" bgColor="#333">
							      <tr>
									<td style="text-align:right;">检修交代：</td>
									<td>
									  <td colspan="5">
									    <input name="recondition" id="recondition" allowInput="true" class="mini-textarea"  width="90%" vtype="" required="false" /></td>
									</td> 																																	
						          </tr>
						      </table>
						    </div>
						    
						    <div class="mini-panel" title="工作终结" width="auto" height="auto"
							  showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
							  <table class="formtable">																						
								<tr>
									<td style="text-align:right;">工作终结时间：</td>
									<td>
									  <input name="actEndTime" allowInput="false" id="actEndTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;" />
									</td>								
									<td style="text-align:right;">工作负责人：</td>
									<td colspan="3">
									  <input name="endWorkLeader" id="endWorkLeaderName_" textName="endWorkLeaderName"
										onbuttonclick="sign_('endWorkLeaderName_','1')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/> 										
									</td>
									<td></td>
									<td></td>
								</tr>	
								<tr>
									<td style="text-align:right;">工作许可人：</td>
									<td>
									  <input name="endPermitBy" id="endPermitByName_" textName="endPermitByName" onbuttonclick="sign_('endPermitByName_','3')"
									    allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/>										 
									</td>
									<td style="text-align:right;">终结值别：</td>
								    <td colspan="3">
								     <input name="endDutyName" id="endDutyName" class="mini-textbox" width="200px" />
								    </td>									
								</tr>								
							  </table>
							</div>
							
							<div class="mini-panel" title="工作票终结" width="auto" height="auto"
							  showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
							  <table class="formtable">
								<tr>
									<td style="text-align:right;">接地线数量(组)：</td>
									<td>
									  <input style="width: 200px;" name="endWireTotalNum" id="endWireTotalNum" class="mini-textbox"  vtype="" required="false" /> 
									</td>									
									<td style="text-align:right;">保留接地线数量(组)：</td>
									<td colspan="3">
									  <input style="width: 200px;" name="endWireKeepNum" id="endWireKeepNum" class="mini-textbox" vtype="" required="false" />
									</td>
									
								</tr>
								<tr>
								   <td style="text-align:right;">保留接地线编号及位置：</td>
								   <td>
									  <input style="width: 200px;" name="endWireKeepInfo" id="endWireKeepInfo" class="mini-textbox" vtype="" required="false"  />
								   </td>
								   <td style="text-align:right;">接地刀闸数量(副)：</td>
								   <td colspan="3">
									  <input style="width: 200px;" name="endGateTotalNum" id="endGateTotalNum" class="mini-textbox" vtype="" required="false" /> 
								   </td>
								</tr>
								<tr>								   
								   <td style="text-align:right;">保留接地刀闸数量(副)：</td>
								   <td>
									  <input style="width: 200px;" name="endGateKeepNum" id="endGateKeepNum" class="mini-textbox" vtype="" required="false"   />
								   </td>
								   <td style="text-align:right;">保留接地刀闸编号及位置：</td>
								   <td colspan="3">
									  <input style="width: 200px;" name="endGateKeepInfo" id="endGateKeepInfo" class="mini-textbox" vtype="" required="false" /> 
								   </td>
								</tr>
								<tr>
								   <td style="text-align:right;">值长(或运行值班负责人)：</td>
								   <td colspan="5"> 
									  <input style="width: 200px;" name="endDutyPrincipal" id="endDutyPrincipalName_" textName="endDutyPrincipalName"
										onbuttonclick="sign_('endDutyPrincipalName_','100')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" /> 	
	   							   </td>	
								</tr>																							
							  </table> 
							</div>
							
							<div class="mini-panel" title="备注" width="auto" height="auto"
							  showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
							   <table class="formtable">
								 <tr>
									<td style="text-align:right;">备注：</td>
									<td colspan="5">
								      <input name="remarks" id="remarks" class="mini-textarea" vtype="" required="false" width="100%" height="100px" />
								    </td>
								</tr>
							  </table>
							</div>
							
							<div class="mini-panel" title="工作票评估" width="auto" height="auto"
							  showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
							   <table class="formtable">
								 <tr>
									<td style="text-align:right;">班组评估：</td>
									<td>
									  <input name="maintAssessType" id="maintAssessType" textName="maintAssessValue" style="width: 200px;" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype="" 
									    url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_assess_type" />
									</td>	
									<td style="text-align:right;">专业评估：</td>
									<td>
									  <input name="specAssessType" id="specAssessType" textName="specAssessValue" style="width: 200px;" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype="" 
									    url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_assess_type" />
									</td>
									<td style="text-align:right;">安健环评估：</td>
									<td>
									  <input name="ajhAssessType" id="ajhAssessType" textName="ajhAssessValue" style="width: 200px;" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype="" 
									    url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_assess_type" />
									</td>
								</tr>
								<tr>
								    <td style="text-align:right;">评估人：</td>
									<td>
									  <!-- <input name="" id="" class="mini-textbox" style="width: 200px;"/> -->
									  <input  name="maintAssessId" id="maintAssessId" required="false" textName="maintAssessName" class="mini-buttonedit" allowInput="false"  width="200px"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','maintAssessId,maintAssessName')" onvaluechanged="update(this)" />
									</td>
									<td style="text-align:right;">评估人：</td>
									<td>
									  <!-- <input name="" id="" class="mini-textbox" style="width: 200px;"/> -->
									  <input  name="specAssessId" id="specAssessId" required="false" textName="specAssessName" class="mini-buttonedit" allowInput="false"  width="200px"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','specAssessId,specAssessName')" onvaluechanged="update(this)" />
									</td>
									<td style="text-align:right;">评估人：</td>
									<td>
									  <!-- <input name="" id="" class="mini-textbox" style="width: 200px;"/> -->
									  <input  name="ajhAssessId" id="ajhAssessId" required="false" textName="ajhAssessName" class="mini-buttonedit" allowInput="false"  width="200px"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','ajhAssessId,ajhAssessName')" onvaluechanged="update(this)" />
									</td>								
								</tr>
								<tr>
								    <td style="text-align:right;">评估时间：</td>
									<td>
									  <input name="maintAssessDate" id="maintAssessDate" allowInput="false" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;" />
									</td>
									<td style="text-align:right;">评估时间：</td>
									<td>
									  <input name="specAssessDate" id="specAssessDate" allowInput="false" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;" />
									</td>
									<td style="text-align:right;">评估时间：</td>
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
		<!-- 加载作业安全措施附票 -->
		<%@ include file="/WEB-INF/views/modules/wo/wt/woWtTaskSafeMeasureTab.jsp"%>		
	    <div title="检修围栏" id="tabWoProcessList" name="tabSmElectronicFenceList"   style="border: 0px;"  >  			
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
		</div>
		<div title="附件" id="tabWoProcessList"   style="border: 0px;"  >  
		     <sys:toolbargriddoc girdId="dgTestSub1" permissionEdit="wo:woWt:edit" objKeyField="id" objDescrField="name" objType="woWt1"></sys:toolbargriddoc>
	         <div class="mini-fit">
	             <sys:griddoc girdId="dgTestSub1"></sys:griddoc>
	         </div>				
		</div> <!-- 附件end -->	
		<div title="动火票" id="tabWoWt5" name="tabWoWt5" style="border: 0px;"  >  
		   <div style="width:100%;">
				<div class="mini-toolbar" id="_tbgridWoWt5"  style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
							<td style="width:100%;">							
								<a class="mini-button" id="_tbgridWoWt5_add" iconCls="icon-plus-sign"  onclick="createWoWt5" plain="true" tooltip="新建一级动火票">新建一级动火票</a>
							    <a class="mini-button" id="_tbgridWoWt6_add" iconCls="icon-plus-sign"  onclick="createWoWt6" plain="true" tooltip="新建二级动火票">新建二级动火票</a>
							    <a class="mini-button" id="_tbgridWoWt_refresh" iconCls="" onclick="refreshGridWoWt5()" plain="true" tooltip="刷新"><i class="fa fa-refresh"></i></a>
							</td>
							<td style="white-space:nowrap;">
							</td>
						</tr>
					</table>
					<ul id="_pmgridWoWt5" class="mini-menu" style="display:none;"  textField="name" idField="id" parentField="parentId"   onitemclick="onGridSubOpMiClick_gridWoTaskSafeMeasure">			
					</ul>
				</div>
			</div>  
		  		
		    <div id="gridWoWt5" class="mini-datagrid" style="width:100%;height:100%;"
				 url="${ctx}/wo-wt/wo/woWt/data?baseQuery=(a.wt_type='5' or a.wt_type='6')" idField="id" onrowdblclick="onrowdblclick2"
				 allowResize="true" pageSize="10" 
				 allowCellEdit="false" allowCellSelect="true" multiSelect="true"
				 editNextOnEnterKey="true"  editNextRowCell="true"
				 allowAlternating="true" showFilterRow="false"  showColumnsMenu="false">
				<div property="columns">							
						<div type="indexcolumn" headerAlign="center" width="35">序号</div>							
						<div name="id" field="id" vtype="required" headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">编号
						    <input property="editor" class="mini-textbox" style="width: 100%;" /> 
						    <input id="id5-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChangedChild(this,'gridWoWt5')" showClose="true" oncloseclick="onFilterChangedChild(this,'gridWoWt5')" />
						</div>																
						<div name="wtCode" field="wtCode" vtype="" headerAlign="center" allowSort="true" width="200">工作票号 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 								
						</div>
						<div name="wtType" field="wtType" vtype="" headerAlign="center" type="comboboxcolumn" allowSort="true" width="145"  hideable="true">票类型 
							<input property="editor" class="mini-combobox" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_user_wt_type" style="width: 100%;" /> 								
						</div>
						<div name="sourceType"  field="sourceType" vtype=""  headerAlign="center" type="comboboxcolumn"  allowSort="true" width="100" >票来源
							<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_sourceType"   style="width:100%;"  />								
						</div>
						<div name="content" field="content" vtype="" headerAlign="center" allowSort="true" width="300">工作内容 
							<input property="editor" class="mini-textbox" style="width: 100%;" /> 								
						</div>
						<div name="status" field="status" vtype="" type="comboboxcolumn" headerAlign="center" allowSort="true" width="100" sortField="a.status">状态
							<input property="editor" class="mini-combobox" style="width: 100%;" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_status" /> 								
						</div>						
						
						
					</div>
			</div>														
	    </div>
		
	</div>
	<!-- 新流程方式引入 flowKey对应流程Key -->
	<sys:workflow flowKey="woWt1"></sys:workflow>
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
			initInsertUrl : "${ctx}/wo-wt/wo/woWt/initInsert?wtType=${param.wtType}&isStandard=${param.isStandard}&sourceType=1",
			saveUrl : "${ctx}/wo-wt/wo/woWt/save",
			removeUrl : "${ctx}/wo-wt/wo/woWt/remove",
			exportUrl : "${ctx}/wo-wt/wo/woWt/export",
			onAfterNewRecord:addNewReword,
            onAfterLoadRecord: onAfterLoadRecord,          
            onBeforeSaveCheck: onBeforeSaveCheck,
            onBeforeSaveForm : onBeforeSaveForm,
            onBeforeInsertRecord:onBeforeInsertRecord
            //onBeforeNewRecord:onBeforeInsertRecord
           //onAfterLoadAllChild:onAfterLoadAllChild
			
		});
				
		function getWoWtSm() {
			var childs = new Array();
			var others = new Array("WoWtDpsm", "WoWtPerson");
			for (var i = 0; i < others.length; i++) {
				var objId = others[i];
				var grid = mini.get("grid" + objId);
				if (!grid) {
					continue;
				}

				var lowObjId = objId.substring(0, 1).toLowerCase() + objId.substring(1);
				childs.push({
					id : "grid" + objId,
					objId : objId,
					FK : "wtId",
					cascade : true,
					cascadeVisible : true,
					insertPos : "L",
					insertType : "A",
					panelId : "tab" + objId + "List",					
					dataUrl : "${ctx}/wo-wt/wo/" + lowObjId + "/data",
					getUrl : "${ctx}/wo-wt/wo/" + lowObjId + "/get",
					saveUrl : "${ctx}/wo-wt/wo/" + lowObjId + "/save",
					removeUrl : "${ctx}/wo-wt/wo/" + lowObjId + "/remove",
					exportUrl : "${ctx}/wo-wt/wo/" + lowObjId + "/export"
				});
			}
			return childs;
		}

		function getWoWtSm2() {
			var childs = getWoWtSm();
			for (var i = 1; i < 5; i++) {
				var grid = mini.get("gridWoWtsm" + i);
				if (!grid) {
					continue;
				}
				childs.push({
					id : "gridWoWtsm" + i,
					objId : "WoWtSm",
					FK : "wtId",
					cascade : true,
					cascadeVisible : true,
					insertPos : "L",
					insertType : "A",
					panelId : "tabWoWtsm" + i + "List",
					//tabName:"tab"+objId+"List",
					dataUrl : "${ctx}/wo-wt/wo/woWtSm" + "/data",
					getUrl : "${ctx}/wo-wt/wo/woWtSm" + "/get",
					saveUrl : "${ctx}/wo-wt/wo/woWtSm" + "/save",
					removeUrl : "${ctx}/wo-wt/wo/woWtSm" + "/remove",
					exportUrl : "${ctx}/wo-wt/wo/woWtSm" + "/export",
					initInsertUrl : "${ctx}/wo-wt/wo/woWtSm/initInsert?typeId=" + i
				});
			}
			
			childs.push({
				id : "#formWoWtWorkSafe",
				objId : "WoWtWorkSafe",
				FK : "wtId",
				visible : true,
				cascade : true,
				cascadeVisible : true,
				tabsId : "tabsMain",
				tabName : "tabWoTaskSafeMeasureList",
				dataUrl:"${ctx}/wo-wt/wo/woWtWorkSafe/data?wtType=1",
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
				insertPos : "L",
				insertType : "A",
				tabsId : "tabsMain",
				tabName : "tabWoTaskSafeMeasureList",				
				dataUrl:"${ctx}/wo-wt/wo/woTaskSafeMeasure/data",
				getUrl:"${ctx}/wo-wt/wo/woTaskSafeMeasure/get",
				saveUrl:"${ctx}/wo-wt/wo/woTaskSafeMeasure/save",
				removeUrl:"${ctx}/wo-wt/wo/woTaskSafeMeasure/remove",
				exportUrl:"${ctx}/wo-wt/wo/woTaskSafeMeasure/export"
			}); 
			
			childs.push({//新增显示关联检修围栏信息
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
			}); 
			
			childs.push({//文档附件
				id:"dgTestSub1",
                cascade:true,
                //fileTypes:"*.*",
                folder:"woWt1",                           
                FKLinks: [
                    {FK: "objKey", masterKeyField: "id"},
                    {FK: "objType", masterKeyField: "(\"woWt1\")"}
                ],
                cascadeNoClone: true,
                dataUrl:"${ctx}/ims-ext/dm/dmDoc/data",
                getUrl:"${ctx}/ims-ext/dm/dmDoc/get",
                saveUrl:"${ctx}/ims-ext/dm/dmDoc/save",
                removeUrl:"${ctx}/ims-ext/dm/dmDoc/remove",
                exportUrl:"${ctx}/ims-ext/dm/dmDoc/export",
                onDocActionRenderer:onDocActionRenderer
			}); 
			
			childs.push({//显示关联一级、二级动火票
				id : "gridWoWt5",
				objId : "woWt",
				FK : "mainTicketId",				
				cascade : true,								
				insertPos : "L",
				insertType : "A",
				tabsId : "tabsMain",
				tabName : "tabWoWt5",	
				dataUrl : "${ctx}/wo-wt/wo/woWt/data?baseQuery=(a.wt_type='5' or a.wt_type='6')"				
			}); 
			/***********加载附票子表结束**************/
			
			return childs;
		}

		var myChilds = getWoWtSm2();
		
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
		function onFormOpMiClick(e) {
			
		}						
		//////////子表格操作菜单项点击事件方法/////////
		function onGridSubOpMiClick_WoWtSm(e) {
		    var menuItem = null;
			if (e.item == undefined) {
				menuItem = e.sender.item;
			} else {
				menuItem = e.item;
			}
		}
		function onGridSubOpMiClick_WoWtwoWtLeaderChange(e) {
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
		
		function inputReceiveWorkLeader(){
			var workLeader = mini.get("workLeader").getValue();
			var workLeaderName = mini.get("workLeader").getText();
			mini.get("receiveWorkLeaderName_").setValue(workLeader);
			mini.get("receiveWorkLeaderName_").setText(workLeaderName);
	    }
	
	    function addButton(){
		  sysToolBar_.addButtonOption({
			"buttonId":'print',
			"functionStr":'print',/* 对应按钮的点击事件 */
			/* "gridId":"gridSmCheckQuestion", *//* 对应具体的列表，默认给明细 */
			"name":'打印预览'
		  });
		  
		 /*  sysToolBar_.addButtonOption({
			"buttonId":'changeWorkLeader',
			"functionStr":'changeWorkLeader',
			"name":'变更负责人'
		  });  */
		  sysToolBar_.addButtonOption({
			"buttonId":'restoreTicket',
			"functionStr":'restoreTicket',/* 对应按钮的点击事件 */			
			"name":'押票恢复'
		  }); 
		  sysToolBar_.addButtonOption({
			"buttonId":'keepTicket',
			"functionStr":'keepTicket',/* 对应按钮的点击事件 */			
			"name":'押票'
		  });  
		  
		 /*  sysToolBar_.addButtonOption({
			"buttonId":'postpone',
			"functionStr":'postpone',		
			"name":'延期'
		  });   */ 
		 /*  sysToolBar_.addButtonOption({
			"buttonId":'createWoWt5',
			"functionStr":'createWoWt5',		
			"name":'一级动火工作票'
		  });  
		  
		  sysToolBar_.addButtonOption({
			"buttonId":'createWoWt6',
			"functionStr":'createWoWt6',		
			"name":'二级动火工作票'
		  });   */
		  
		  sysToolBar_.addButtonOption({
			"buttonId":'repairRail',
			"functionStr":'repairRail',/* 对应按钮的点击事件 */			
			"name":'检修围栏'
		  });  
		  		 
	    }
	   
	  
	   /*  $(function(){
		   addButton();
	    }); */
		
	   /*  function onBeforeSaveCheck(o){
	        editControl.beforeSave(o);
	        return true;
	    }
	    
	    function addNewReword(o){
	    	editControl.afterLoad(o);//页面编辑权限控制
	    }
	    
	    function onAfterLoadRecord(o) {	   	    	
	        wfAfterLoad(o);//加载流程
	        editControl.afterLoad(o);//页面编辑权限控制	 
	        	
	    }
	    	    
	    editControl.loadEditList('woWt'); */
	    	    
	    
	    //运行值班负责人签名自动带入工作负责人签名
	    function inputReceiveWorkLeader(){
			var workLeader = mini.get("workLeader").getValue();
			var workLeaderName = mini.get("workLeader").getText();
			mini.get("receiveWorkLeaderName_").setValue(workLeader);
			mini.get("receiveWorkLeaderName_").setText(workLeaderName);
	    }
	    
	    function onCloseClick(e) {
            var obj = e.sender;
            obj.setText("");
            obj.setValue("");
        }
	    //选择用户（分页多选）
	    /* function popLovJson2(e) {         
            var param = {
                obj: e,
                title: "人员选择",
                multiSel: true,
                readOnly: true,
                url: "${ctxRoot}/form?view=/sys/misUserList",
                width: 800,
                height: 600,
                selFields: "id,name",
                refFields: "locationId,location",
                refGridId: null,
                actionLovValid: null,
                //actionLov: returnSelectData3,
                actionClose: null,
                gridId: "datagridSelected",
                allowDblclickSelect: true
            };
            popLov2(param);
        } */
	    	                                
      
      //检修围栏状态改变
      function changeRepairRail(){
          //var url = "http://192.168.0.171:18600/sm-region/sm/smElectronicFence/updateStaByWtid";   		
          var iamCode = iamCodeValue();
          var url = "${ctx}/sm-region/sm/smElectronicFence/updateStaByWtid";
		     var data = {"wtId":"7450879b462c4b980f98f801a90c5592759564","status":"1","iamCode":iamCode};//status 0:无效   1：有效          
          $.ajax({
	        url: url,
	        data: data,
	        type: "post",
	        success: function (text) { 		        	
	        	var o = mini.decode(text);
	        	console.log(0);
	        	if(o.type == "I"){
	        		showMessageBox("提示",o.message,"info");
	        	}if(o.type == "E"){
	        		showMessageBox("错误",o.message,"error");
	        	}
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	        	
	        }
	     });
		          
 		/*  var data = {"wtId":"updateStaByWtid","status":"1","iamCode":iamCode};//status 0:无效   1：有效          
         $.ajax({
		        url: "${ctx}/wo-wt/wo/woWt/updateStaByWtid",
		        data: data,
		        type: "post",
		        success: function (text) { 
		        	debugger;
		        	var o = mini.decode(text);
		        	console.log(0); 	       	 	
  	       	if(o.type == "I"){
        		showMessageBox("提示",o.message,"info");
        	}if(o.type == "E"){
        		showMessageBox("错误",o.message,"error");
        	}
		        },
		        error: function (jqXHR, textStatus, errorThrown) {
		        	
		        }
		    }); */
      }
   
   
      //加载页面编辑权限
   //editControl.loadEditList('woWt1')
    
   /* function onAfterLoadAllChild(){
      //控制同意按钮隐藏
      mini.get("_tbagree_").setVisible(false);
      
   } */
   

</script>
</body>
</html>