<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<html>
<head>
<title>工作票</title>
<meta name="decorator" content="default" />
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
							<input class="mini-hidden" name="id" id="id" /> 
							<input class="mini-hidden" name="procInsId" id="procInsId" /> 
							<input class="mini-hidden" name="wtType" id="wtType" /> 
							<input class="mini-hidden" name="updateDate" id="updateDate" />							
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
							<input class="mini-hidden" name="specShortCode" id="specShortCode" /> 
							<input class="mini-hidden" name="defectId" id="defectId" value="${param.defectId}" /> 
							<input class="mini-hidden" id="isStandard" name="isStandard" value="${param.isStandard }"> 
							<input class="mini-hidden" name="procStatus" id="procStatus" /> 
							<input class="mini-hidden" id="currUserName" name="currUserName" value="${param.currUserName}">
							<input class="mini-hidden" id="currUserId" name="currUserId" value="${param.currUserId}"/> 
							<input type="hidden" id="currUserLoginName" name="currUserLoginName" value="${param.currUserLoginName}"/>
							<!-- 责任部门id -->
							<input class="mini-hidden" id="dutyOrgId" name="dutyOrgId"/>
							<!-- 工作地点id -->
							<input class="mini-hidden" id="locationId" name="locationId"/>							
							<!-- 审核人id -->
							<input class="mini-hidden" name="auditId" id="auditId" />							
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
							 <!-- 票来源 -->
							<input class="mini-hidden" name="sourceType" id="sourceType" /> 
							
							<table class="formtable">
								<tr>
									<td style="padding-left: 5px;">热力机械工作票：No：</td>
									<td>
									  <input name="wtCode" id="wtCode" class="mini-textbox" readonly="readonly" width="200px"/>
									</td>
									<td>状态:</td>
									<td>
									  <input name="status" id="status" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype="" 
									    url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_status" />
									</td>
									<td>专业:</td>
									<td>
									  <input name="specId" id="specId" textName="specName" class="mini-buttonedit" vtype="" required="true" allowInput="true" 
										onbuttonclick="popLov(this,'选择专业',false,true,'${ctxRoot}/form?view=pg/pgSpecList',850,500,'id,name','specId,specName')" />
									</td>
								</tr>
								<tr>
									<td>所属设备KKS：</td>
									<td>
									  <input name="equipLogicId" id="equipLogicId" textName="equipLogicId" allowInput="false" class="mini-buttonedit" vtype="" required="false" width="200px" readonly="readonly"
										onbuttonclick="popLov(this,'选择逻辑设备',false,true,'${ctx}/em/emEquipLogic/lov',800,500,'id,name','equipLogicId,equipLogicName',null,null,selectKKS)" onvaluechanged="updateEquip()" />
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
									<td>部门：</td>
									<td>
									  <input name="orgId" id="orgId" textName="orgName" class="mini-buttonedit" width="200px" readonly="readonly"
									    onbuttonclick="popLov(this,'选择部门',false,true,'${ctx}/sys/sysOrg/list?classId=0',850,500,'id,name','orgId,orgName')" onvaluechanged="changeDutyOrg">
									</td>
									<td>班组：</td>
									<td colspan="3">
									  <input name="maintOrg" id="maintOrg" textName="maintOrgName" class="mini-buttonedit" vtype="" required="false" width="150px" allowInput="false" readonly="readonly"
										onbuttonclick="popLov(this,'请选择班组',false,true,'${ctx}/pg/pgClassInfo/lov?orgType=2',850,500,'orgId,orgName','maintOrg,maintOrgName')" />
									</td>
								</tr>
								<tr>
									<td style="padding-left: 5px;">1.工作负责人：</td>
									<td colspan="">
									  <input style="" name="workLeader" id="workLeader" required="false" textName="workLeaderName" class="mini-buttonedit" width="200px" readonly="readonly"
									    onbuttonclick="popLov(this,'选择人员',false,true,'${ctx}/sys/sysUser/sysMisList?orgQuery=61',850,500,'id,name','workLeader,workLeaderName')" onvaluechanged="update(this)" />
									</td>									
									<td>机组:</td>
									<td>
									  <input name="plantUnit" id="plantUnit" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype="" width="150"
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_plant_unit" />
									</td>
									<td colspan="2"></td>
								</tr>
								<tr>
									<td>2．工作组成员安全交底签名：</td>
									<td colspan="2" align="left">
									  <!-- <input name="workClassPerson" id="workClassPerson" class="mini-textarea" vtype="" required="false" width="100%" /> -->
									   <input id="workClassPersonIds" class="mini-textboxlist" name="workClassPersonIds" textName="workClassPerson" allowInput="false" required="false" style="width:500px;"/>                                   
                                      <a id="choosePerson" class="mini-button " plain="true" onclick="popLovJson1(this)">选择...</ a>							
									</td>
									<td colspan="3">共：<input style="width: 100px;" name="personNum"id="personNum" class="mini-spinner" vtype="" allowNull="true" />人</td>									
								</tr>
								<tr>
									<td>3．工作内容：</td>
									<td colspan="2">
									  <input name="content" id="content"class="mini-textarea" vtype="" required="false" width="100%" />
									</td>
									<td>工作地点：</td>
									<td colspan=2>
									  <input name="location" id="location" textName="location" class="mini-buttonedit" vtype="" required="false" width="100%" allowInput="true"
										onbuttonclick="popLov(this,'选择工作地址',false,true, '${ctx}/em/emEquipLogic/lov2',800,500,'id,name','locationId,location')" />
									</td>
								</tr>
								<tr>
									<td>4．计划工作时间：</td>
									<td align="right">开始时间：</td>
									<td>
									  <input name="planStartTime" allowInput="false" id="planStartTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;" />
									</td>
									<td align="right">结束时间：</td>
									<td colspan="2">
									  <input name="planEndTime" allowInput="false" id="planEndTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;" onvaluechanged="checkEndTime(planStartTime,planEndTime)"/>
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
									  <input name="areaName" id="areaName" textName="areaName" class="mini-buttonedit" vtype="" required="false" allowInput="false" width="100%" readonly="readonly"
									    onbuttonclick="popLov(this,'请选择风险区域',false,true,'${ctx}/em/emRiskArea/list',850,500,'areaName','areaName')" />
									</td>
								</tr>								
							</table>
							<div class="mini-panel" title="应断开" width="auto" id="tabWoWtsm9List" name="tabWoWtsm9List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm9" permissionEdit="wo:woWtSm:edit"></sys:toolbargridsub> 								
								<div id="gridWoWtsm9" class="mini-datagrid sGrid" style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.wtType}&typeId=9"
									idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true" allowHeaderWrap="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">序号 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="600">应断开下列断路器、隔离开关和熔断器等，并在操作把手（按钮）上设置“禁止合闸，有人工作”警告牌:
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="execRes" field="execRes" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="200">执行情况
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype="" headerAlign="center" visible="false" hideable="true" allowSort="false" width="32">安措类型
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>
							<div class="mini-panel" title="应关闭" width="auto" id="tabWoWtsm10List" name="tabWoWtsm10List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm10" permissionEdit="wo:woWtSm:edit"></sys:toolbargridsub>								
								<div id="gridWoWtsm10" class="mini-datagrid sGrid" style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.wtType}&typeId=10"
									idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true" allowHeaderWrap="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">序号
										    <input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="600">应关闭下列截门、挡板（闸板），并挂“禁止操作，有人工作”警告牌：
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="execRes" field="execRes" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="200">执行情况
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype="" headerAlign="center" visible="false" hideable="true" allowSort="false" width="32">安措类型
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>
							<div class="mini-panel" title="应开启" width="auto" id="tabWoWtsm11List" name="tabWoWtsm11List"	showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm11" permissionEdit="wo:woWtSm:edit"></sys:toolbargridsub>								
								<div id="gridWoWtsm11" class="mini-datagrid sGrid" style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.wtType}&typeId=11"
									idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true" editNextOnEnterKey="true" editNextRowCell="true"
									showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true" allowHeaderWrap="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">序号 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="600">应开启下列阀门、挡板（闸板），使燃烧室、管道、容器内余汽、水、油、灰、烟排放尽，并将温度降至规程规定值：
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="execRes" field="execRes" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="200">执行情况
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype="" headerAlign="center" visible="false" hideable="true" allowSort="false" width="32">安措类型
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>
							<div class="mini-panel" title="应将下列截门停电、加锁，并挂“禁止操作，有人工作”警告牌：" width="auto" id="tabWoWtsm12List" name="tabWoWtsm12List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm12" permissionEdit="wo:woWtSm:edit"></sys:toolbargridsub> 								
								<div id="gridWoWtsm12" class="mini-datagrid sGrid" style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.wtType}&typeId=12"
									idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true" allowHeaderWrap="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">序号 
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="600">应将下列截门停电、加锁，并挂“禁止操作，有人工作”警告牌：
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="execRes" field="execRes" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="200">执行情况
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype="" headerAlign="center" visible="false" hideable="true" allowSort="false" width="32">安措类型
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>																												
							<div class="mini-panel" title="其他安全措施：" width="auto" id="tabWoWtsm14List" name="tabWoWtsm14List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm14" permissionEdit="wo:woWtDpsm:edit"></sys:toolbargridsub> 									
								<div id="gridWoWtsm14" class="mini-datagrid sGrid" style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.wtType}&typeId=14"
									idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">序号 
											<input property="editor" class="mini-textbox" style="width: 100%;" /> 
											<input id="seqNo-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
											  onvaluechanged="onFilterChangedChild('gridWoWtSm14')" showClose="true" oncloseclick="onChildFilterClose(this,'gridWoWtSm14')" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="600">其他安全措施：
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="execRes" field="execRes" vtype="" allowCellWrap="true" headerAlign="center" allowSort="false" width="200">措施执行情况： 
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype="" headerAlign="center" visible="false" hideable="true" allowSort="true" width="32">安措类型
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>

							<table class="formtable">
								<tr>
									<td>工作票签发人：</td>
									<td colspan="2">										
									  <input name="wtSigner" id="wtSignerName_" textName="wtSignerName" onbuttonclick="sign_('wtSignerName_','2')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />
									</td>
									<td>签发时间：</td>
									<td colspan=2>
									  <input name="wtSignDate" allowInput="false" id="wtSignDate" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" vtype="" required="false" style="width: 180px;"/>
									</td>
								</tr>
								<tr>
									<td>工作票接收人：</td>
									<td colspan="2">										
									  <input name="wtReceiver" id="wtReceiveName_" textName="wtReceiveName" onbuttonclick="sign_('wtReceiveName_','99')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />
									</td>
									<td>接票时间：</td>
									<td colspan=2>
									  <input name="wtReceiveTime" allowInput="false" id="wtReceiveTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;"/>
									</td>
								</tr>
							</table>

							<div class="mini-panel" title="运行人员补充的安全措施：" width="auto" id="tabWoWtsm4List" name="tabWoWtsm4List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm4" permissionEdit="wo:woWtsm:edit"></sys:toolbargridsub> 								
								<div id="gridWoWtsm4" class="mini-datagrid sGrid" style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.wtType}&typeId=4"
									idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">序号
											<input property="editor" class="mini-textbox" style="width: 100%;" /> 
											<input id="seqNo-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
											  onvaluechanged="onFilterChangedChild('gridWoWtSm4')" showClose="true" oncloseclick="onChildFilterClose(this,'gridWoWtSm4')" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center" allowSort="false" width="600" allowCellWrap="true">7．运行值班人员补充安全措施： 
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="execRes" field="execRes" vtype="" allowCellWrap="true" headerAlign="center" allowSort="false" width="200">8．补充措施执行情况： 
											<input property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype="" headerAlign="center" visible="false" hideable="true" allowSort="false" width="32">安措类型
											<input property="editor" class="mini-textbox" style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>							
							<table class="formtable">
								<tr>
									<td>10．批准工作时间：</td>									
									<td align="right">开始时间：</td>
									<td>
									  <input name="appStartTime" allowInput="false" id="appStartTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;"/>
									</td>
									<td align="right">结束时间：</td>
									<td colspan="2">
									  <input name="appEndTime" allowInput="false" id="appEndTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;" onvaluechanged="checkEndTime(appStartTime,appEndTime)"/>
									</td>	
								</tr>
								<tr>
									<td align="right">值长(或单元长)：</td>
									<td colspan="2">										
									  <input name="appDutyLeader" id="appDutyLeaderName_" textName="appDutyLeaderName" onbuttonclick="sign_('appDutyLeaderName_','100')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />
									</td>
									<td align="right">时间：</td>
									<td colspan="2">
									  <input  allowInput="false" name="appDutyLeaderTime" id="appDutyLeaderTime" class="mini-datepicker" showTime="true" vtype="" format="MM-dd" required="false" style="width: 180px;"/><br />
									</td> 
								</tr>
								<tr>
									<td colspan="8" style="height: 28px;" _emptyName="开始工作时间">11.上述安全措施已全部执行，从
									  <input name="permitStartTime" id="permitStartTime" allowInput="false" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;"/> 开始工作。
									</td>
								</tr>								
								<tr>								   
									<td align="right">工作许可人：</td>
									<td colspan="3">										
									  <input name="permitBy" id="permitByName_" textName="permitByName" onvaluechanged="padWorkLeader" 
									    onbuttonclick="sign_('permitByName_','3')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />
									</td>
								    <td align="right">工作负责人：</td>
									<td colspan="3">										
									  <input name="workLeaderSign" id="workLeaderSignName_" textName="workLeaderSignName" onbuttonclick="sign_('workLeaderSignName_','1')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />
									</td>									
								</tr>							
								<tr>
									<td colspan="6">12.工作负责人变更：自 
									  <input name="woWtLC.changeTime" id="woWtLC.changeTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;"/> 原工作负责人离去，变更为
									  <input style="width: 180px" name="woWtLC.nowWorkLeader" id="woWtLC.nowWorkLeader" required="false" textName="woWtLC.nowWorkLeaderName" class="mini-buttonedit"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctx}/sys/sysUser/sysMisList?orgQuery=61',850,500,'id,name','woWtLC.nowWorkLeader,woWtLC.nowWorkLeaderName')" />担任工作负责人。
									</td>
								</tr>
								<tr>
									<td align="right">工作票签发人签名:</td>
									<td colspan="2">										
									  <input name="woWtLC.wtSigner" id="woWtLC.wtSignerName_" textName="woWtLC.wtSignerName" onbuttonclick="sign_('woWtLC.wtSignerName_','2')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />
									</td>
									<td align="right">工作票许可人签名:</td>
									<td colspan="2">										
									  <input name="woWtLC.permitBy" id="woWtLC.permitByName_" textName="woWtLC.permitByName" onbuttonclick="sign_('woWtLC.permitByName_','3')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />
									</td>
								</tr>
								<tr>
									<td colspan="6" style="height: 28px;">13.工作票延期：有效期延长到 
									  <input name="woWtDelay.delayTime" id="woWtDelay.delayTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;"/> 结束。
									</td>
								</tr>								
								<tr>
									<td align="right">值长(或单元长):</td>
									<td colspan="2">										
									  <input name="woWtDelay.dutyLeader" id="woWtDelay.dutyLeaderName_" textName="woWtDelay.dutyLeaderName"
										onbuttonclick="sign_('woWtDelay.dutyLeaderName_','100')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />
									</td>									
									<td align="right">值长(或单元长)签字时间：</td>
									<td colspan="2">
									  <input name="woWtDelay.dutyLeaderTime" allowInput="false" id="woWtDelay.dutyLeaderTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;"/>
									</td>
								</tr>
								<tr>
									<td align="right">运行值班负责人:</td>
									<td colspan="2">										
									  <input name="woWtDelay.permitBy" id="woWtDelay.permitByName1_" textName="woWtDelay.permitByName" onbuttonclick="sign_('woWtDelay.permitByName1_','3')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />
									</td>									
									<td align="right">运行值班负责人签字时间：</td>
									<td colspan="2">
									  <input name="woWtDelay.permitByTime" allowInput="false" id="woWtDelay.permitByTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;"/>
									</td>
								</tr>
								<tr>									
									<td align="right">工作负责人:</td>
									<td colspan="2">										
									  <input name="woWtDelay.workLeader" id="woWtDelay.workLeaderName_" textName="woWtDelay.workLeaderName"
										onbuttonclick="sign_('woWtDelay.workLeaderName_','1')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />
									</td>
									<td align="right">工作负责人签字时间：</td>
									<td colspan="2">
									  <input name="woWtDelay.workLeaderTime" allowInput="false" id="woWtDelay.workLeaderTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;"/>
									</td>
								</tr>
								<tr>
									<td colspan="6" style="height: 28px;" _emptyName="全部工作结束时间">14.工作终结：工作人员已全部撤离，现场已清理完毕，全部工作于
									  <input name="actEndTime" allowInput="false" id="actEndTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" /> 结束。
									</td>
								</tr>
								<tr>
									<td align="right">工作许可人签名：</td>
									<td colspan="2">										
									  <input name="endPermitBy" id="endPermitByName_" textName="endPermitByName" onbuttonclick="sign_('endPermitByName_','3')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />
									</td> 
									<td align="right">工作负责人签名：</td>
									<td colspan="2">										
									  <input name="endWorkLeader" id="endWorkLeaderName_" textName="endWorkLeaderName" onbuttonclick="sign_('endWorkLeaderName_','1')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />
									</td>									
								</tr>								
							</table>
							
							<div class="mini-panel" title="15.检修设备需试运（工作票交回，所列安全措施已拆除，可以试运）：" width="auto" id="tabWoWtBeforeWorkList" name="tabWoWtBeforeWorkList" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtBeforeWork" permissionEdit="wo:woWtBeforeWork:edit"></sys:toolbargridsub>
								<div id="gridWoWtBeforeWork" class="mini-datagrid sGrid" style="width: 99.999%;" 
									url="${ctx}/wo-wt/wo/woWtBeforeWork/allData"
									idField="id" allowResize="false" showPager="false" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true">
									<div property="columns">
										<div type="indexcolumn"></div>
										<div type="checkcolumn"></div>
										<div name="id" field="id" vtype="required" readOnly="true" headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">编号 
											<input property="editor" class="mini-textbox" style="width: 100%;" /> 
											<input id="id-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
											  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
										</div>
										<div name="tryWorkTime" field="tryWorkTime" vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center" mallowSort="true" width="160">允许试运时间 
											<input property="editor" showTime="true" class="mini-datepicker" style="width: 100%;" allowInput="false"/> 
											<input id="tryWorkTime-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
								              onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
										</div>
										<div name="permitByName" field="permitByName" vtype="" headerAlign="center" allowSort="false" width="255" hideable="true" visible="false">工作许可人名称 
											<input property="editor" class="mini-textbox" style="width: 100%;" /> 
											<input id="permitByName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
											  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
										</div>
										<div name="permitBy" field="permitBy" vtype="" headerAlign="center" allowSort="false" width="100" displayField="permitByName">工作许可人 
											<input property="editor" class="mini-buttonedit" style="width: 100%;" allowInput="false" onbuttonclick="popLov(this,'选择许可人',false,true,'${ctx}/sys/sysUser/sysMisList',850,500,'id,name','permitBy,permitByName','gridWoWtBeforeWork')" />
										</div>
										<div name="workLeader" field="workLeader" vtype="" headerAlign="center" allowSort="false" width="100" displayField="workLeaderName">工作负责人 
											<input property="editor" class="mini-buttonedit" style="width: 100%;" allowInput="false" onbuttonclick="popLov(this,'选择负责人',false,true,'${ctx}/sys/sysUser/sysMisList',850,500,'id,name','workLeader,workLeaderName','gridWoWtBeforeWork')" />
										</div>
										<div name="workLeaderName" field="workLeaderName" vtype="" headerAlign="center" allowSort="false" width="200" hideable="true" visible="false">工作负责人名称 
											<input property="editor" class="mini-textbox" style="width: 100%;" /> 
											<input id="workLeaderName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
											  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
										</div>										
									</div>
								</div>
							</div>						
							<div class="mini-panel" title="16.检修设备试运后仍需要进行检修工作，工作票所列安全措施已全部执行，可以工作：" width="auto" id="tabWoWtAfterWorkList" name="tabWoWtAfterWorkList" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtAfterWork" permissionEdit="wo:woWtAfterWork:edit"></sys:toolbargridsub>
								<div id="gridWoWtAfterWork" class="mini-datagrid sGrid" style="width: 99.999%;" 
									url="${ctx}/wo-wt/wo/woWtAfterWork/allData"
									idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true">
									<div property="columns">
										<div type="indexcolumn"></div>
										<div type="checkcolumn"></div>
										<div name="id" field="id" vtype="required" readOnly="true" headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">编号
											 <input property="editor" class="mini-textbox" style="width: 100%;" /> 
											 <input id="id-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
										</div>
										<div name="recoverWorkTime" field="recoverWorkTime" vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center" allowSort="true" width="160">恢复工作时间 
											<input property="editor" showTime="true" class="mini-datepicker" style="width: 100%;" allowInput="false"/> 
											<input id="recoverWorkTime-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;"
											  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
										</div>									
										<div name="permitByName" field="permitByName" vtype="" headerAlign="center" allowSort="false" width="255" hideable="true" visible="false">工作许可人
											 <input property="editor" class="mini-textbox" style="width: 100%;" /> 
											 <input id="permitByName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
										</div>
										<div name="permitBy" field="permitBy" vtype="" headerAlign="center" allowSort="false" width="100" displayField="permitByName">值班负责人
											<input property="editor" class="mini-buttonedit" style="width: 100%;" allowInput="false" onbuttonclick="popLov(this,'选择许可人',false,true,'${ctx}/sys/sysUser/sysMisList',850,500,'id,name','permitBy,permitByName','gridWoWtAfterWork')" />
										</div>
										<div name="workLeader" field="workLeader" vtype="" headerAlign="center" allowSort="false" width="100" displayField="workLeaderName">工作负责人 
											<input property="editor" class="mini-buttonedit" style="width: 100%;" allowInput="false" onbuttonclick="popLov(this,'选择负责人',false,true,'${ctx}/sys/sysUser/sysMisList',850,500,'id,name','workLeader,workLeaderName','gridWoWtAfterWork')" />
										</div>
										<div name="workLeaderName" field="workLeaderName" vtype="" headerAlign="center" allowSort="false" width="200" hideable="true" visible="false">工作负责人名称 
											<input property="editor" class="mini-textbox" style="width: 100%;" /> 
											<input id="workLeaderName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
										</div>										
									</div>
								</div>
							</div>
							<table class="formtable">
								<tr>
									<td>17．备注</td>
									<td colspan="5">
									    <input name="remarks" id="remarks" class="mini-textarea" vtype="" required="false" width="100%" height="100px" />
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
		<!-- 加载作业安全措施票 -->
		<%@ include file="/WEB-INF/views/modules/wo/wt/woWtTaskSafeMeasureTab.jsp"%>		
	</div>
	<!-- 新流程方式引入 -->
	<sys:workflow flowKey="woWt4"></sys:workflow>
	<sys:toolbarfooter></sys:toolbarfooter>
	<sys:excelframe></sys:excelframe>
	<jsp:include page="permit.jsp"></jsp:include>
	<jsp:include page="attachTab.jsp" flush="true" />
	<%-- <script type="text/javascript" src="${ctxStatic}/common/exportSelectFieldFile.js?v=<%=System.currentTimeMillis() %>"></script> --%>
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
			onAfterNewRecord:addNewReword,
            onAfterLoadRecord: onAfterLoadRecord,          
            onBeforeSaveCheck: onBeforeSaveCheck
		});

		initChilds(
				"#editform",
				"tabsMain",
				[
					{//检修设备试运后
						id : "gridWoWtAfterWork",
						objId : "WoWtAfterWork",
						FK : "wtId",
						cascade : true,
						cascadeVisible : true,
						insertPos : "L",
						insertType : "A",
						panelId : "tabWoWtAfterWorkList",
						dataUrl : "${ctx}/wo-wt/wo/woWtAfterWork/data",
						getUrl : "${ctx}/wo-wt/wo/woWtAfterWork/get",
						saveUrl : "${ctx}/wo-wt/wo/woWtAfterWork/save",
						removeUrl : "${ctx}/wo-wt/wo/woWtAfterWork/remove",
						exportUrl : "${ctx}/wo-wt/wo/woWtAfterWork/export",
					},
					{ //新增 检修设备需运行
						id : "gridWoWtBeforeWork",
						objId : "WoWtBeforeWork",
						FK : "wtId",
						cascade : true,
						cascadeVisible : true,
						insertPos : "L",
						insertType : "A",
						panelId : "tabWoWtBeforeWorkList",
						dataUrl : "${ctx}/wo-wt/wo/woWtBeforeWork/data",
						getUrl : "${ctx}/wo-wt/wo/woWtBeforeWork/get",
						saveUrl : "${ctx}/wo-wt/wo/woWtBeforeWork/save",
						removeUrl : "${ctx}/wo-wt/wo/woWtBeforeWork/remove",
						exportUrl : "${ctx}/wo-wt/wo/woWtBeforeWork/export",
					},						
					{//其他安全措施
						id : "gridWoWtsm14",
						objId : "WoWtSm",
						FK : "wtId",
						cascade : true,
						cascadeVisible : true,
						insertPos : "L",
						insertType : "A",
						panelId : "tabWoWtsm14List",
						dataUrl : "${ctx}/wo-wt/wo/woWtSm/data?typeId=14",
						getUrl : "${ctx}/wo-wt/wo/woWtSm/get?typeId=14",
						saveUrl : "${ctx}/wo-wt/wo/woWtSm/save?typeId=14",
						removeUrl : "${ctx}/wo-wt/wo/woWtSm/remove?typeId=14",
						exportUrl : "${ctx}/wo-wt/wo/woWtSm/export?typeId=14",
						initInsertUrl : "${ctx}/wo-wt/wo/woWtSm/initInsert?typeId=14"
					},
					{//补充安措
						id : "gridWoWtsm4",
						objId : "WoWtSm",
						FK : "wtId",
						cascade : true,
						cascadeVisible : true,
						insertPos : "L",
						insertType : "A",
						panelId : "tabWoWtsm4List",
						dataUrl : "${ctx}/wo-wt/wo/woWtSm/data?typeId=4",
						getUrl : "${ctx}/wo-wt/wo/woWtSm/get?typeId=4",
						saveUrl : "${ctx}/wo-wt/wo/woWtSm/save?typeId=4",
						removeUrl : "${ctx}/wo-wt/wo/woWtSm/remove?typeId=4",
						exportUrl : "${ctx}/wo-wt/wo/woWtSm/export?typeId=4",
						initInsertUrl : "${ctx}/wo-wt/wo/woWtSm/initInsert?typeId=4"
					},
					//新增 2019-3-04
					{//应断开下列断路器
						id : "gridWoWtsm9",
						objId : "WoWtSm",
						FK : "wtId",
						cascade : true,
						cascadeVisible : true,
						insertPos : "L",
						insertType : "A",
						panelId : "tabWoWtsm9List",
						dataUrl : "${ctx}/wo-wt/wo/woWtSm/data?typeId=9",
						getUrl : "${ctx}/wo-wt/wo/woWtSm/get?typeId=9",
						saveUrl : "${ctx}/wo-wt/wo/woWtSm/save?typeId=9",
						removeUrl : "${ctx}/wo-wt/wo/woWtSm/remove?typeId=9",
						exportUrl : "${ctx}/wo-wt/wo/woWtSm/export?typeId=9",
						initInsertUrl : "${ctx}/wo-wt/wo/woWtSm/initInsert?typeId=9"
					},
					{//应关闭挡板
						id : "gridWoWtsm10",
						objId : "WoWtSm",
						FK : "wtId",
						cascade : true,
						cascadeVisible : true,
						insertPos : "L",
						insertType : "A",
						panelId : "tabWoWtsm10List",
						dataUrl : "${ctx}/wo-wt/wo/woWtSm/data?typeId=10",
						getUrl : "${ctx}/wo-wt/wo/woWtSm/get?typeId=10",
						saveUrl : "${ctx}/wo-wt/wo/woWtSm/save?typeId=10",
						removeUrl : "${ctx}/wo-wt/wo/woWtSm/remove?typeId=10",
						exportUrl : "${ctx}/wo-wt/wo/woWtSm/export?typeId=10",
						initInsertUrl : "${ctx}/wo-wt/wo/woWtSm/initInsert?typeId=10"
					},
					{//应开启闸门
						id : "gridWoWtsm11",
						objId : "WoWtSm",
						FK : "wtId",
						cascade : true,
						cascadeVisible : true,
						insertPos : "L",
						insertType : "A",
						panelId : "tabWoWtsm11List",
						dataUrl : "${ctx}/wo-wt/wo/woWtSm/data?typeId=11",
						getUrl : "${ctx}/wo-wt/wo/woWtSm/get?typeId=11",
						saveUrl : "${ctx}/wo-wt/wo/woWtSm/save?typeId=11",
						removeUrl : "${ctx}/wo-wt/wo/woWtSm/remove?typeId=11",
						exportUrl : "${ctx}/wo-wt/wo/woWtSm/export?typeId=11",
						initInsertUrl : "${ctx}/wo-wt/wo/woWtSm/initInsert?typeId=11"
					},
					{//应停电加锁
						id : "gridWoWtsm12",
						objId : "WoWtSm",
						FK : "wtId",
						cascade : true,
						cascadeVisible : true,
						insertPos : "L",
						insertType : "A",
						panelId : "tabWoWtsm12List",
						dataUrl : "${ctx}/wo-wt/wo/woWtSm/data?typeId=12",
						getUrl : "${ctx}/wo-wt/wo/woWtSm/get?typeId=12",
						saveUrl : "${ctx}/wo-wt/wo/woWtSm/save?typeId=12",
						removeUrl : "${ctx}/wo-wt/wo/woWtSm/remove?typeId=12",
						exportUrl : "${ctx}/wo-wt/wo/woWtSm/export?typeId=12",
						initInsertUrl : "${ctx}/wo-wt/wo/woWtSm/initInsert?typeId=12"
					},												
					{
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
					},
					{//作业安全措施票
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
	   	  
</script>
</body>
</html>