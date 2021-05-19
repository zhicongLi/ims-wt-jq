<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>工作票</title>
<meta name="decorator" content="default" />
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css"
rel="stylesheet" />
<script type="text/javascript" src="${ctxStatic}/common/sysToolBar.js"></script>
<jsp:include page="borderCss.jsp"></jsp:include>
</head>
<body>

	<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false"
		style="width: 100%; height: 100%;">
		<div title="列表" id="tabList" style="border: 0px;">
			<sys:toolbargridmain objId="WoWt" permissionEdit="wo:woWt:edit"></sys:toolbargridmain>		
			<sys:searchadv></sys:searchadv>
			<div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid"
					style="width: 100%; height: 100%;" url="${ctx}/wo-wt/wo/woWt/data"
					idField="id" allowResize="true" pageSize="10"
					allowCellSelect="true" multiSelect="false"
					editNextOnEnterKey="true" editNextRowCell="true"
					allowAlternating="true" showFilterRow="true"
					showColumnsMenu="false">
					<div property="columns">
						<div name="action" width="120" headerAlign="center" align="center"
							renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
						<div name="id" field="id" vtype="required" headerAlign="center"
							allowSort="true" width="64" visible="false" hideable="true">
							编号 <input property="editor" class="mini-textbox"
								style="width: 100%;" /> <input id="id-Filter"
								name="mini-column-filter" property="filter" class="mini-textbox"
								style="width: 100%;" onvaluechanged="onFilterChanged"
								showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="woId" field="woId" vtype="" headerAlign="center"
							allowSort="true" width="64" visible="false" hideable="true">
							工单id <input property="editor" class="mini-textbox"
								style="width: 100%;" /> <input id="woId-Filter"
								name="mini-column-filter" property="filter" class="mini-textbox"
								style="width: 100%;" onvaluechanged="onFilterChanged"
								showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="swtId" field="swtId" vtype="" headerAlign="center"
							allowSort="true" width="64" visible="false" hideable="true">
							标准工作票id <input property="editor" class="mini-textbox"
								style="width: 100%;" /> <input id="swtId-Filter"
								name="mini-column-filter" property="filter" class="mini-textbox"
								style="width: 100%;" onvaluechanged="onFilterChanged"
								showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<c:choose>
							<c:when test="${param.isStandard =='1'}">
								<div name="wtCode" field="wtCode" vtype="" headerAlign="center"
									allowSort="true" width="200">
									工作票号 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="wtCode-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="content" field="content" vtype=""
									headerAlign="center" allowSort="true" width="300">
									工作内容 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="content-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="status" field="status" vtype="" type="comboboxcolumn"
									headerAlign="center" allowSort="true" width="100"
									sortField="a.status">
									状态 <input property="editor" class="mini-combobox"
										style="width: 100%;" valueField="value" textField="label"
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_status" /> <input
										id="status-Filter" name="mini-column-filter" property="filter"
										class="mini-combobox" valueField="value" textField="label"
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_status"
										multiSelect="true" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<%-- <div name="dutyOrgId"  field="dutyOrgId" vtype="" align="center" headerAlign="center" type="comboboxcolumn"  allowSort="true" width="150" >部门
									<input property="editor" class="mini-combobox"  valueField="id" textField="name" url="${ctx}/wo-wt/sys/sysOrg/allData?baseQuery=69"   style="width:100%;"  />
									<input id="dutyOrgId-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" multiSelect="true" valueField="id" textField="name"  url="${ctx}/wo-wt/sys/sysOrg/allData?baseQuery=69"  style="width:100%;"
										   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
									/>
								</div> --%>
								
								<div name="wtType" field="wtType" vtype="" headerAlign="center"
									type="comboboxcolumn" allowSort="true" width="145"
									visible="false" hideable="true">
									类型 <input property="editor" class="mini-combobox"
										valueField="value" textField="label"
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_user_wt_type"
										style="width: 100%;" /> <input id="wtType-Filter"
										name="mini-column-filter" property="filter"
										class="mini-combobox" multiSelect="true" valueField="value"
										textField="label" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<%-- <div name="specId"  field="specId" vtype="" align="center" headerAlign="center" type="comboboxcolumn"  allowSort="true" width="80" >专业
									<input property="editor" class="mini-combobox"  valueField="id" textField="name" url="${ctx}/wo-wt/pg/pgSpec/dictData?groupId=3"   style="width:100%;"  />
									<input id="specId-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" multiSelect="true" valueField="id" textField="name"  url="${ctx}/wo-wt/pg/pgSpec/dictData?groupId=3"  style="width:100%;"
										   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
									/>
								</div> --%>
								<div name="procStatus" field="procStatus" vtype=""
									type="comboboxcolumn" headerAlign="center" allowSort="false"
									width="120" sortField="a.proc_status" visible="false"
									hideable="true">
									状态 <input property="editor" class="mini-combobox"
										style="width: 100%;" valueField="value" textField="label"
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_show_status" /> <input
										id="procStatus-Filter" name="mini-column-filter"
										property="filter" class="mini-combobox" valueField="value"
										textField="label"
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_show_status"
										multiSelect="true" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>

								<div name="descr" field="descr" vtype="" headerAlign="center"
									allowSort="true" width="100" hideable="true" visible="false">
									描述 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="descr-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="location" field="location" vtype=""
									headerAlign="center" allowSort="true" width="200" visible="false">
									工作地点 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="location-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="planStartTime" field="planStartTime" vtype=""
									dateFormat="yyyy-MM-dd HH:mm" headerAlign="center"
									allowSort="true" width="160"  hideable="true">
									计划开始时间 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="planStartTime-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="planEndTime" field="planEndTime" vtype=""
									dateFormat="yyyy-MM-dd HH:mm" headerAlign="center"
									allowSort="true" width="160"  hideable="true">
									计划结束时间 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="planEndTime-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>								
								<div name="equipId" field="equipId" vtype=""
									headerAlign="center" allowSort="true" width="64"
									hideable="true" visible="false">
									设备id <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="equipId-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="equipName" field="equipName" vtype=""
									headerAlign="center" allowSort="true" width="140"
									hideable="true" visible="false">
									设备名称 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="equipName-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="equipLogicId" field="equipLogicId" vtype=""
									headerAlign="center" allowSort="true" width="64"
									hideable="true" visible="false">
									逻辑设备编码 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="equipLogicId-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="equipLogicName" field="equipLogicName" vtype=""
									headerAlign="center" allowSort="true" width="140"
									hideable="true" visible="false">
									逻辑设备名称 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="equipLogicName-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>

								<div name="workLeader" field="workLeader" vtype=""
									headerAlign="center" allowSort="true" width="64"
									hideable="true" visible="false">
									工作负责人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="workLeader-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="workLeaderName" field="workLeaderName" vtype=""
									headerAlign="center" allowSort="true" width="100"
									sortField="a.work_leader_name">
									工作负责人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="workLeaderName-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="wtSigner" field="wtSigner" vtype=""
									headerAlign="center" allowSort="true" width="100"
									hideable="true" visible="false">
									工作票签发人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="wtSigner-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="wtSignerName" field="wtSignerName" vtype=""
									headerAlign="center" allowSort="true" width="100"
									sortField="a.wt_signer_name">
									工作签发人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="wtSignerName-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="wtReceiveName" field="wtReceiveName" vtype=""
									headerAlign="center" allowSort="true" width="100"
									sortField="a.wt_receive_name">
									工作票接收人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="wtReceiveName-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="wtReceiveTime" field="wtReceiveTime" vtype=""
									dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center"
									allowSort="true" width="150">
									工作票接收时间 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="wtReceiveTime-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="wtSignDate" field="wtSignDate" vtype=""
									dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center"
									allowSort="true" width="160" visible="false">
									工作票签发时间 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="wtSignDate-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="smPermitBy" field="smPermitBy" vtype=""
									headerAlign="center" allowSort="true" width="64"
									hideable="true" visible="false">
									工作票许可人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="smPermitBy-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="smPermitByName" field="smPermitByName" vtype=""
									headerAlign="center" allowSort="true" width="100"
									sortField="a.sm_permit_by_name">
									工作许可人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="smPermitByName-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="permitStartTime" field="permitStartTime" vtype=""
									dateFormat="yyyy-MM-dd HH:mm" headerAlign="center"
									allowSort="true" width="160">
									许可开工时间 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="permitStartTime-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="woWtDelay.delayTime" field="woWtDelay.delayTime"
									vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center"
									allowSort="true" width="160" sortField="wwd.delay_time"
									 hideable="true">
									延期至时间 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input
										id="woWtDelay.delayTime-Filter" name="mini-column-filter"
										property="filter" class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="actEndTime" field="actEndTime" vtype=""
									dateFormat="yyyy-MM-dd HH:mm" headerAlign="center"
									allowSort="true" width="160">
									工作终结时间 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="actEndTime-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="pcSigner" field="pcSigner" vtype=""
									headerAlign="center" allowSort="true" width="64"
									hideable="true" visible="false">
									点检签发人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="pcSigner-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="wtReceiver" field="wtReceiver" vtype=""
									headerAlign="center" allowSort="true" width="64"
									hideable="true" visible="false">
									工作票接收人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="wtReceiver-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>								
								
								<div name="smDutyPrincipalName" field="smDutyPrincipalName"
									vtype="" headerAlign="center" allowSort="true" width="140"
									visible="false" hideable="true">
									值班负责人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input
										id="smDutyPrincipalName-Filter" name="mini-column-filter"
										property="filter" class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="appDutyLeaderName" field="appDutyLeaderName" vtype=""
									headerAlign="center" allowSort="true" width="140"
									visible="false" hideable="true">
									值长 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="appDutyLeaderName-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>								
								<div name="permitByName" field="permitByName" vtype=""
									headerAlign="center" allowSort="true" width="100"
									sortField="a.permit_by_name" visible="false" hideable="true" visible="false">
									开始许可人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="permitByName-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="workLeaderSignName" field="workLeaderSignName"
									vtype="" headerAlign="center" allowSort="true" width="100"
									sortField="a.work_leader_sign_name" visible="false"
									hideable="true">
									开始负责人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="workLeaderSignName-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="woWtLC.changeTime" field="woWtLC.changeTime" vtype=""
									dateFormat="yyyy-MM-dd HH:mm" headerAlign="center"
									allowSort="true" width="160" sortField="wlc.change_time"
									visible="false" hideable="true">
									变动时间 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="woWtLC.changeTime-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="woWtLC.oldWorkLeaderName"
									field="woWtLC.oldWorkLeaderName" vtype="" headerAlign="center"
									allowSort="true" width="100"
									sortField="wlc.old_work_leader_name" visible="false"
									hideable="true">
									原负责人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input
										id="woWtLC.oldWorkLeaderName-Filter" name="mini-column-filter"
										property="filter" class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="woWtLC.nowWorkLeaderName"
									field="woWtLC.nowWorkLeaderName" vtype="" headerAlign="center"
									allowSort="true" width="100"
									sortField="wlc.now_work_leader_name" visible="false"
									hideable="true">
									新负责人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input
										id="woWtLC.nowWorkLeaderName-Filter" name="mini-column-filter"
										property="filter" class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="woWtLC.wtSignerName" field="woWtLC.wtSignerName"
									vtype="" headerAlign="center" allowSort="true" width="100"
									sortField="wlc.wt_signer_name" visible="false" hideable="true">
									变更签发人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input
										id="woWtLC.wtSignerName-Filter" name="mini-column-filter"
										property="filter" class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="woWtLC.permitByName" field="woWtLC.permitByName"
									vtype="" headerAlign="center" allowSort="true" width="100"
									sortField="wlc.permit_by_name" visible="false" hideable="true">
									变更许可人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input
										id="woWtLC.permitByName-Filter" name="mini-column-filter"
										property="filter" class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								
								<div name="woWtDelay.workLeaderName"
									field="woWtDelay.workLeaderName" vtype="" headerAlign="center"
									allowSort="true" width="100" sortField="wwd.work_leader_name"
									visible="false" hideable="true">
									延期工作负责人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input
										id="woWtDelay.workLeaderName-Filter" name="mini-column-filter"
										property="filter" class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="woWtDelay.permitByName"
									field="woWtDelay.permitByName" vtype="" headerAlign="center"
									allowSort="true" width="100" sortField="wwd.permit_by_name"
									visible="false" hideable="true">
									延期值长 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input
										id="woWtDelay.permitByName-Filter" name="mini-column-filter"
										property="filter" class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>								
								<div name="endWireTotalNum" field="endWireTotalNum" vtype=""
									headerAlign="center" allowSort="true" width="100"
									visible="false" hideable="true">
									接地线组数 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="endWireTotalNum-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="endWireRemoveNum" field="endWireRemoveNum" vtype=""
									headerAlign="center" allowSort="true" width="100"
									visible="false" hideable="true">
									已拆除组数 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="endWireRemoveNum-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="endWireKeepNum" field="endWireKeepNum" vtype=""
									headerAlign="center" allowSort="true" width="100"
									visible="false" hideable="true">
									保留组数 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="endWireKeepNum-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="endWorkLeader" field="endWorkLeader" vtype=""
									headerAlign="center" allowSort="true" width="64"
									hideable="true" visible="false">
									工作负责人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="endWorkLeader-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="endWorkLeaderName" field="endWorkLeaderName" vtype=""
									headerAlign="center" allowSort="true" width="100" visible="false">
									工作负责人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="endWorkLeaderName-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="endPermitBy" field="endPermitBy" vtype=""
									headerAlign="center" allowSort="true" width="64"
									hideable="true" visible="false" visible="false" hideable="true">
									工作负责人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="endPermitBy-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="endPermitByName" field="endPermitByName" vtype=""
									headerAlign="center" allowSort="true" width="100" visible="false">
									工作许可人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="endPermitByName-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="endDutyPrincipal" field="endDutyPrincipal" vtype=""
									headerAlign="center" allowSort="true" width="64"
									hideable="true" visible="false">
									值班负责人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="endDutyPrincipal-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="endDutyPrincipalName" field="endDutyPrincipalName"
									vtype="" headerAlign="center" allowSort="true" width="100"
									visible="false" hideable="true">
									值班负责人 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input
										id="endDutyPrincipalName-Filter" name="mini-column-filter"
										property="filter" class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="remarks" field="remarks" vtype=""
									headerAlign="center" allowSort="true" width="255"
									sortField="a.remarks" visible="false">
									备注信息 <input property="editor" class="mini-textarea"
										style="width: 100%;" /> <input id="remarks-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
							</c:when>
							<c:otherwise>
								<!-- visible="false" -->
								<div name="wtType" field="wtType" vtype="" headerAlign="center"
									type="comboboxcolumn" allowSort="false" width="110"
									hideable="true">
									类型 <input property="editor" class="mini-combobox"
										valueField="value" textField="label"
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_user_wt_type"
										style="width: 100%;" /> <input id="wtType-Filter"
										name="mini-column-filter" property="filter"
										class="mini-combobox" multiSelect="true" valueField="value"
										textField="label" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)"
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_user_wt_type" />
								</div>
								<div name="specName" field="specName" vtype=""
									headerAlign="center" allowSort="true" width="60"
									sortField="a.specName">
									专业 <input property="editor" class="mini-textarea"
										style="width: 100%;" /> <input id="specName-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="content" field="content" vtype=""
									headerAlign="center" allowSort="true" width="300">
									工作内容 <input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="content-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="auditStatus" field="auditStatus" vtype=""
									type="comboboxcolumn" headerAlign="center" allowSort="false"
									width="60" sortField="a.status">
									状态 <input property="editor" class="mini-combobox"
										style="width: 100%;" valueField="value" textField="label"
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_sot_status" /> <input
										id="auditStatus-Filter" name="mini-column-filter"
										property="filter" class="mini-combobox" valueField="value"
										textField="label" multiSelect="true"
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_sot_status"
										style="width: 100%;" onvaluechanged="onFilterChanged"
										showClose="true" oncloseclick="onFilterClose(this)" />
								</div>
								<div name="auditId" field="auditId" vtype="" visible="false"
									headerAlign="center" allowSort="true" width="255"
									sortField="a.auditId">
									审核人id<input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="auditId-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="auditName" field="auditName" vtype=""
									headerAlign="center" allowSort="true" width="80"
									sortField="a.auditName">
									审核人<input property="editor" class="mini-textbox"
										style="width: 100%;" /> <input id="remarks-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
								<div name="remarks" field="remarks" vtype=""
									headerAlign="center" allowSort="true" width="255"
									sortField="a.remarks">
									备注信息 <input property="editor" class="mini-textarea"
										style="width: 100%;" /> <input id="remarks2-Filter"
										name="mini-column-filter" property="filter"
										class="mini-textbox" style="width: 100%;"
										onvaluechanged="onFilterChanged" showClose="true"
										oncloseclick="onFilterClose(this)" />
								</div>
							</c:otherwise>
						</c:choose>
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
							<input type="hidden" name="uapSpecifySvgView" id="uapSpecifySvgView" value="${param.uapSpecifySvgView}"/>
							<input type="hidden" name="uapSpecifySvgEdit" id="uapSpecifySvgEdit" value="${param.uapSpecifySvgEdit}"/>
							<input type="hidden" name="uapSvgOverhaulPerson" id="uapSvgOverhaulPerson" value="${param.uapSvgOverhaulPerson}"/>
							<!-- 新增 输煤路径 -->
							<input type="hidden" name="uapSpecifySvgView2" id="uapSpecifySvgView2" value="${param.uapSpecifySvgView2}"/>
							<input type="hidden" name="uapSpecifySvgEdit2" id="uapSpecifySvgEdit2" value="${param.uapSpecifySvgEdit2}"/>
							
							<!-- 新增 mengqiang 2018-11-07 -->
							<!-- 工单id -->
							<input class="mini-hidden" name="woId" id="woId" />
							<input class="mini-hidden" name="woJobId" id="woJobId" />
							
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
									<td style="padding-left: 5px;">电气第一种工作票：No：</td>
									<td><input name="wtCode" id="wtCode" width="200px" class="mini-textbox"
										readonly="readonly" /></td>
									<td>状态：</td>
									<td><input name="status" id="status" class="mini-combobox"
										allowInput="false" enabled="true" required="false"
										valueField="value" textField="label" vtype=""
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_status" /></td>
									<td>专业：</td>
									<!-- <td><input name="specId" id="specId" textName="specName"
										class="mini-buttonedit" vtype="" required="true" allowInput="true" 
										onbuttonclick="selectSpec" /></td> -->
									<td><input name="specId" id="specId" textName="specName"
										class="mini-buttonedit" vtype="" required="true" allowInput="true" 
										onbuttonclick="popLov(this,'选择专业',false,true,'${ctxRoot}/form?view=pg/pgSpecList',850,500,'id,name','specId,specName')" /></td>
								</tr>
								<tr>
									<td>所属设备KKS：</td>
									<td><input name="equipLogicId" id="equipLogicId"
										textName="equipLogicId" allowInput="false" width="200px"
										class="mini-buttonedit" vtype="" required="false"
										onbuttonclick="popLov(this,'选择逻辑设备',false,true,'${ctx}/wo-wt/em/emEquipLogic/lov',800,500,'id,name','equipLogicId,equipLogicName',null,null,selectKKS)"
										onvaluechanged="updateEquip()" /></td>
									<td align="left">所属设备名称：</td>
									<td><input name="equipName" id="equipName"
										class="mini-textbox" readonly="readonly" /></td>
									<td align="left">所属设备编码：</td>
									<td><input name="equipId" id="equipId"
										class="mini-textbox" readonly="readonly" /></td>
								</tr>
								<tr>
									<td>1.部门：</td>
									<td><input name="orgId" id="orgId" textName="orgName"
										class="mini-buttonedit" width="200px"
										onbuttonclick="popLov(this,'选择部门',false,true,'${ctx}/wo-wt/sys/sysOrg/list',850,500,'id,name','orgId,orgName')"
										onvaluechanged="changeDutyOrg"></td>
									<td>班组：</td>
									<td><input name="maintOrg" id="maintOrg"
										textName="maintOrgName" class="mini-buttonedit" vtype=""
										required="false" width="150px" allowInput="false"
										onbuttonclick="popLov(this,'请选择班组',false,true,'${ctx}/wo-wt/pg/pgClassInfo/lov?orgType=2',850,500,'orgId,orgName','maintOrg,maintOrgName')" />
									</td>
									<td>工作负责人(监护人)：</td>
									<td><input style="width: 150px" name="workLeader"
										id="workLeader" required="false" textName="workLeaderName"
										class="mini-buttonedit"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctx}/wo-wt/sys/sysUser/sysMisList?orgQuery=61',850,500,'id,name','workLeader,workLeaderName')"
										onvaluechanged="update(this)" /></td>
								</tr>
								<tr>
									<td>2.工作班人员：</td>
									<td colspan="4"><input name="workClassPerson"
										id="workClassPerson" class="mini-textarea" vtype=""
										required="false" width="100%" /></td>
									<td><span>共： <input name=personNum id="personNum"
											class="mini-spinner" allowNull="true" />人
									</span></td>
								</tr>
								<tr>
									<td>3.工作内容：</td>
									<td colspan="6"><input name="content" id="content"
										class="mini-textarea" vtype="" required="false" width="100%" /></td>
								</tr>
								<tr>
									<td>4.工作地点：</td>
									<td colspan="2"><input name="location" id="location"
										textName="location" class="mini-buttonedit" vtype=""
										required="false" width="100%" allowInput="true"
										onbuttonclick="popLov(this,'选择工作地址',false,true, '${ctx}/wo-wt/em/emEquipLogic/lov2'
													    ,800,500,'id,name','locationId,location')" />
									</td>
									<td></td>									
									<td>机组:</td>
									<td><input name="plantUnit" id="plantUnit" class="mini-combobox"
										allowInput="false" enabled="true" required="false"
										valueField="value" textField="label" vtype=""  width="100%"
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_plant_unit" /></td>
								</tr>
								<tr>
									<td>5.计划工作时间：</td>
									<td align="right">开始时间：</td>
									<td><input name="planStartTime" id="planStartTime"
										allowInput="false" class="mini-datepicker" showTime="true"
										vtype="" format="yyyy-MM-dd HH:mm:ss" required="false"
										style="width: 180px;" /></td>
									<td align="right">结束时间：</td>
									<td colspan="2"><input name="planEndTime" id="planEndTime"
										allowInput="false" class="mini-datepicker" showTime="true"
										vtype="" format="yyyy-MM-dd HH:mm:ss" required="false"
										style="width: 180px;" onvaluechanged="checkEndTime(planStartTime,planEndTime)"/></td>
								</tr>
								<c:if test="${param.isStandard =='1'}">
									<!-- 工作票时才显示典型票 -->
									<tr id="sotID">										
										<td>许可部门：</td>
										<td colspan="2"><input name="isFuelRun" id="isFuelRun" class="mini-combobox"
											allowInput="false" enabled="true" required="false"
											valueField="value" textField="label" vtype=""
											url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_is_fuel_run" /></td>
										<td align="right">是否风险区域：</td>
										<td colspan="2"><input name="areaName" id="areaName"
										textName="areaName" class="mini-buttonedit" vtype=""
										required="false" allowInput="false" width="100%"
										onbuttonclick="popLov(this,'请选择风险区域',false,true,'${ctx}/wo-wt/em/emRiskArea/list',850,500,'areaName','areaName')" /></td>
									</tr>
								</c:if>
								<c:if test="${param.isStandard =='2'}">
									<tr>
										<td>审核状态：</td>
										<td><input name="auditStatus" id="auditStatus"
											class="mini-combobox" allowInput="false" enabled="false"
											required="false" valueField="value" textField="label"
											vtype="" url="${ctx}/wo-wt/sys/dict/listDataStr?type=wo_sot_status" /></td>
										<td>审核人：</td>
										<td colspan="4"><input name="auditName" id="auditName"
											class="mini-textbox" vtype="" allowInput="false"
											required="false" /></td>
									</tr>
								</c:if>
							</table>

							<div class="mini-panel" title="应拉断路器" width="auto"
								id="tabWoWtsm1List" name="tabWoWtsm1List"
								showCollapseButton="true" onbuttonclick="onPanelButtonClick"
								showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm1" permissionEdit="wo:woWt:edit"></sys:toolbargridsub>														
								<%-- <div style="width:100%;">
									<div class="mini-toolbar" id="_tbgridPgPosUser"  style="border-bottom:0;padding:0px;">
										<table style="width:100%;">
											<tr>
												<td style="width:100%;">
													<a class="mini-button" id="_tbgridWoWtsm1_add" iconCls="icon-plus-sign"  onclick="addUser('gridWoWtsm1')" plain="true" tooltip="新建行"></a>
													<a class="mini-button" id="_tbgridWoWtsm1_remove" iconCls="icon-remove" style="color:red;" onclick="removeRow('gridWoWtsm1')"  plain="true" tooltip="删除行"></a>
													<span class="separator"></span>
												    <a class="mini-button" id="_tbgridPgPosUser_import" iconCls="icon-upload-alt"  onclick="ImportExcel('gridPgPosUser' )" plain="true">导入行</a>
													<a class="mini-button" id="_tbgridWoWtsm1_export" iconCls="icon-download-alt"  onclick="ExportExcel('gridWoWtsm1' )" plain="true" tooltip="导出行"></a>
													<span class="separator"></span>
													<a class="mini-button" id="_tbgridWoWtsm1_refresh" iconCls="icon-refresh" onclick="refreshChildGridData('gridWoWtsm1')" plain="true"  tooltip="刷新"></a>
<!-- 																			<a class="mini-menubutton" id="_tbgridPgPosUser_op" iconCls="icon-cogs"  plain="true" menu="#_pmgridPgPosUser" tooltip="操作"></a> -->
												</td>
												<td style="white-space:nowrap;">
												</td>
											</tr>
										</table>
										<ul id="_pmgridWoWtsm1" class="mini-menu" style="display:none;"  textField="name" idField="id" parentField="parentId"   onitemclick="onGridSubOpMiClick_gridWoWtsm1">
								
										</ul>
									</div>
								</div> --%>
								<div id="gridWoWtsm1" class="mini-datagrid sGrid"
									style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.woWt.wtType}&typeId=1"
									idField="id" allowResize="false" showPager="false"
									pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true"
									showFilterRow="false" allowAlternating="true"
									showColumnsMenu="true" multiSelect="true"
									allowHeaderWrap="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int"
											headerAlign="center" allowSort="true" width="64"
											visible="false" hideable="true">
											序号 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center"
											allowCellWrap="true" allowSort="false" width="400">
											应拉断路器（开关）和隔离开关（刀闸），包括填写前已拉断路器（开关）和隔离开关（刀闸）（注明编号）<br />
											备注：本列由工作票负责人填写 <input property="editor" class="mini-textarea"
												style="width: 100%;" />
										</div>
										<div name="execRes" field="execRes" vtype=""
											headerAlign="center" allowCellWrap="true" allowSort="false"
											width="400">
											已拉断路器（开关）和隔离开关（刀闸）（注明编号）<br /> 备注：本列由工作许可人（值班员）填写 <input
												property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype=""
											headerAlign="center" visible="false" hideable="true"
											allowSort="false" width="32">
											安措类型<input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>
							<div class="mini-panel" title="应装接地线" width="auto"
								id="tabWoWtsm2List" name="tabWoWtsm2List"
								showCollapseButton="true" onbuttonclick="onPanelButtonClick"
								showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm2"
									permissionEdit="wo:woWtSm:edit"></sys:toolbargridsub>
								<div id="gridWoWtsm2" class="mini-datagrid sGrid"
									style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.woWt.wtType}&typeId=2"
									idField="id" allowResize="false" showPager="false"
									pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true"
									showFilterRow="false" allowAlternating="true"
									showColumnsMenu="true" multiSelect="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int"
											headerAlign="center" allowSort="true" visible="false"
											hideable="true">
											序号 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center"
											allowSort="false" width="400" allowCellWrap="true">
											应装接地线（注明地点）<br /> 备注：本列由工作票负责人填写 <input property="editor"
												class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="groupNum" field="groupNum" vtype=""
											headerAlign="center" allowSort="true" width="100"
											visible="false" hideable="true">
											组数 <input property="editor" class="mini-spinner"
												allowLimitValue="false" style="width: 100%;" />
										</div>
										<div name="execRes" field="execRes" vtype=""
											headerAlign="center" allowSort="false" width="400"
											allowCellWrap="true">
											已装接地线（注明接地线编号和装设地点）<br /> 备注：本列由工作许可人（值班员）填写 <input
												property="editor" class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="wireCode" field="wireCode" vtype=""
											headerAlign="center" allowSort="true" width="100"
											visible="false" hideable="true">
											地线号 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype=""
											headerAlign="center" visible="false" hideable="true"
											allowSort="false" width="30">
											安措类型 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>
							<div class="mini-panel" title="应设遮栏、应挂标示牌" width="auto"
								id="tabWoWtsm3List" name="tabWoWtsm3List"
								showCollapseButton="true" onbuttonclick="onPanelButtonClick"
								showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm3"
									permissionEdit="wo:woWt:edit"></sys:toolbargridsub>
								<div id="gridWoWtsm3" class="mini-datagrid sGrid"
									style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.woWt.wtType}&typeId=3"
									idField="id" allowResize="false" showPager="false"
									pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true"
									showFilterRow="false" allowAlternating="true"
									showColumnsMenu="true" multiSelect="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int"
											headerAlign="center" allowSort="true" width="64"
											visible="false" hideable="true">
											序号 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center"
											allowCellWrap="true" allowSort="false" width="400">
											应设遮栏、应挂标示牌<br /> 备注：本列由工作票负责人填写 <input property="editor"
												class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="execRes" field="execRes" vtype=""
											headerAlign="center" allowCellWrap="true" allowSort="false"
											width="400">
											已设遮栏、已挂标示牌<br /> 备注：本列由工作许可人（值班员）填写 <input property="editor"
												class="mini-textarea" style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype=""
											headerAlign="center" visible="false" hideable="true"
											allowSort="true" width="32">
											安措类型<input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>
							<div class="mini-panel" title="工作地点保留带电部分和补充安全措施" width="auto"
								id="tabWoWtsm4List" name="tabWoWtsm4List"
								showCollapseButton="true" onbuttonclick="onPanelButtonClick"
								showFooter="true">
								<sys:toolbargridsub girdId="gridWoWtsm4"
									permissionEdit="wo:woWt:edit"></sys:toolbargridsub>
								<div id="gridWoWtsm4" class="mini-datagrid sGrid"
									style="width: 99.999%;"
									url="${ctx}/wo-wt/wo/woWtSm/allData?woWtType=${param.woWt.wtType}&typeId=4"
									idField="id" allowResize="false" showPager="false"
									pageSize="1000" allowCellSelect="true" allowCellEdit="true"
									editNextOnEnterKey="true" editNextRowCell="true"
									showFilterRow="false" allowAlternating="true"
									showColumnsMenu="true" multiSelect="true">
									<div property="columns">
										<div type="checkcolumn"></div>
										<div type="indexcolumn" width="30">序号</div>
										<div name="seqNo" field="seqNo" vtype="int"
											headerAlign="center" allowSort="true" width="32"
											visible="false" hideable="true">
											序号 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="typeId" field="typeId" vtype=""
											headerAlign="center" visible="false" hideable="true"
											allowSort="false" width="32">
											安措类型 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="descr" field="descr" vtype="" headerAlign="center"
											allowSort="false" width="800" allowCellWrap="true">
											安全措施 <input property="editor" class="mini-textarea"
												style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>

							<table class="formtable">
								<tr>
									<td>工作签发时间：</td>
									<td colspan="2"><input name="wtSignDate"
										id="wtSignDate" class="mini-datepicker" showTime="true"
										vtype="" format="yyyy-MM-dd HH:mm:ss" allowInput="false"
										required="false" /></td>
									<td>工作票签发人：</td>
									<td colspan="2"><input name="wtSigner" id="wtSignerName_"
										textName="wtSignerName"
										onbuttonclick="sign_('wtSignerName_','2')" allowInput="false"
										class="mini-buttonedit defSign_" vtype="" required="false" /> 										
									</td>										
								</tr>
								<tr>
									<td>收到工作票时间：</td>
									<td colspan="2"><input name="wtReceiveTime"
										id="wtReceiveTime" class="mini-datepicker" showTime="true"
										vtype="" format="yyyy-MM-dd HH:mm:ss" allowInput="false"
										required="false" /></td>									
								</tr>
								<tr>
									<td>运行值班负责人签名：</td>
									<td colspan=2>
										<input name="wtReceiver" id="wtReceiveName_"
										textName="wtReceiveName"  onvaluechanged="inputReceiveWorkLeader"
										onbuttonclick="sign_('wtReceiveName_','100')"
										allowInput="false" class="mini-buttonedit defSign_" vtype=""
										required="false" /> 
									</td>
									<td>工作负责人签名：</td>
									<td colspan=2><input name="receiveWorkLeader" id="receiveWorkLeaderName_"
										textName="receiveWorkLeaderName"
										onbuttonclick="sign_('receiveWorkLeaderName_','1')"
										allowInput="false" class="mini-buttonedit defSign_" vtype=""
										required="false" /> 										
									</td>
								</tr>								
							</table>
						
							<p></p>

							<table class="formtable">
								<tr>
									<td colspan="6" style="height: 28px;" _emptyName="许可时间，许可人，工作负责人">6.确认本工作票上述各项内容，许可开始工作时间： <input
										name="permitStartTime" id="permitStartTime"
										class="mini-datepicker" showTime="true" allowInput="false"
										vtype="" format="yyyy-MM-dd HH:mm:ss" required="false"
										style="width: 180px;" /> 工作许可人（值班员）签名：<input name="permitBy"
										id="permitByName_" textName="permitByName" onvaluechanged="padWorkLeader"
										onbuttonclick="sign_('permitByName_','3')" allowInput="false"
										class="mini-buttonedit defSign_" vtype="" required="false" /> 										 
										工作负责人签名：<input name="workLeaderSign" id="workLeaderSignName_"
										textName="workLeaderSignName"
										onbuttonclick="sign_('workLeaderSignName_','1')"
										allowInput="false" class="mini-buttonedit defSign_" vtype=""
										required="false" /> 										
									</td>
								</tr>
								<tr>
									<td colspan="6" style="height: 28px;">7.工作负责人变动： 原工作负责人<input
										style="width: 180px" name="woWtLC.oldWorkLeader"
										id="woWtLC.oldWorkLeader" required="false"
										textName="woWtLC.oldWorkLeaderName" class="mini-buttonedit"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctx}/wo-wt/sys/sysUser/sysMisList?orgQuery=61',850,500,'id,name','woWtLC.oldWorkLeader,woWtLC.oldWorkLeaderName')" />
										离去，变更为<input style="width: 180px" name="woWtLC.nowWorkLeader"
										id="woWtLC.nowWorkLeader" required="false"
										textName="woWtLC.nowWorkLeaderName" class="mini-buttonedit"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctx}/wo-wt/sys/sysUser/sysMisList?orgQuery=61',850,500,'id,name','woWtLC.nowWorkLeader,woWtLC.nowWorkLeaderName')" />担任工作负责人。

									</td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2">工作票签发人签名：  <input name="woWtLC.wtSigner"
										id="woWtLC.wtSignerName_" textName="woWtLC.wtSignerName"
										onbuttonclick="sign_('woWtLC.wtSignerName_','2')"
										allowInput="false" class="mini-buttonedit defSign_" vtype=""
										required="false" /> <!-- <a class="mini-button"  id="woWtLC.wtSignerName_" name="woWtLC.wtSignerName_" value="2" onClick="sign(this.name,this.value)">签字</a> -->
									</td>
									<td align="center">运行值班负责人签名 ： <input name="woWtLC.permitBy"
										id="woWtLC.permitByName_" textName="woWtLC.permitByName"
										onbuttonclick="sign_('woWtLC.permitByName_','99  ')"
										allowInput="false" class="mini-buttonedit defSign_" vtype=""
										required="false" /> <!-- <a class="mini-button"  id="woWtLC.permitByName_" name="woWtLC.permitByName_" value="3" onClick="sign(this.name,this.value)">签字</a> -->
									</td>
									<td colspan="2">变动时间： <input name="woWtLC.changeTime"
										id="woWtLC.changeTime" class="mini-datepicker" showTime="true"
										vtype="" allowInput="false" format="yyyy-MM-dd HH:mm:ss"
										required="false" />
									</td>
								</tr>
								<tr>
									<td colspan="6" style="height: 28px;">8.工作票延期：有效期延长到 <input
										name="woWtDelay.delayTime" id="woWtDelay.delayTime"
										class="mini-datepicker" showTime="true" vtype=""
										format="yyyy-MM-dd HH:mm:ss" required="false" />
									</td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2">工作负责人： <input name="woWtDelay.workLeader"
										id="woWtDelay.workLeaderName_"
										textName="woWtDelay.workLeaderName"
										onbuttonclick="sign_('woWtDelay.workLeaderName_','1')"
										allowInput="false" class="mini-buttonedit defSign_" vtype=""
										required="false" /> <!-- <a class="mini-button"  id="woWtDelay.workLeaderName_" name="woWtDelay.workLeaderName_" value="1" onClick="sign(this.name,this.value)">签字</a> -->
									</td>
									<td >签字时间： <input name="woWtDelay.workLeaderTime"
										id="woWtDelay.workLeaderTime" class="mini-datepicker" showTime="true"
										vtype="" allowInput="false" format="yyyy-MM-dd HH:mm:ss"
										required="false" />
									</td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2">值长或值班负责人签名： <input
										name="woWtDelay.dutyLeader" id="woWtDelay.dutyLeaderName_"
										textName="woWtDelay.dutyLeaderName"
										onbuttonclick="sign_('woWtDelay.dutyLeaderName_','100')"
										allowInput="false" class="mini-buttonedit defSign_" vtype=""
										required="false" /> <!-- <a class="mini-button"  id="woWtDelay.dutyLeaderName_" name="woWtDelay.dutyLeaderName_" value="99" onClick="sign(this.name,this.value)">签字</a> -->
									</td>
									<td >签字时间： <input name="woWtDelay.dutyLeaderTime"
										id="woWtDelay.dutyLeaderTime" class="mini-datepicker" showTime="true"
										vtype="" allowInput="false" format="yyyy-MM-dd HH:mm:ss"
										required="false" />
									</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="6"  _emptyName="全部工作结束时间">9.全部工作于： <input name="actEndTime"
										id="actEndTime" class="mini-datepicker" showTime="true"
										vtype="" format="yyyy-MM-dd HH:mm:ss" required="false"
										allowInput="false" />结束，工作班人员已全部撤离，现场已清理完毕
									</td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2">工作负责人签名: <input name="endWorkLeader"
										id="endWorkLeaderName_" textName="endWorkLeaderName"
										onbuttonclick="sign_('endWorkLeaderName_','1')"
										allowInput="false" class="mini-buttonedit defSign_" vtype=""
										required="false" /> 										
									</td>
									<td align="center">工作许可人签名：<input name="endPermitBy"
										id="endPermitByName_" textName="endPermitByName"
										onbuttonclick="sign_('endPermitByName_','3')"
										allowInput="false" class="mini-buttonedit defSign_" vtype=""
										required="false" /> 										
									</td> 									
									<td align="center">值班负责人签名: <input name="endDutyPrincipal"
										id="endDutyPrincipalName_" textName="endDutyPrincipalName"
										onbuttonclick="sign_('endDutyPrincipalName_','100')"
										allowInput="false" class="mini-buttonedit defSign_" vtype=""
										required="false" /> 										
									</td>
								</tr>
								<tr>
									<td _emptyName="接地线组数" style="text-align:left;letter-spacing:3px;">接地线组数<input style="width: 50px;" name="endWireTotalNum" id="endWireTotalNum" class="mini-textbox"  vtype="" required="false" /> </td>
									<td _emptyName="已拆除数">已拆除数：<input style="width: 50px;"name="endWireRemoveNum" id="endWireRemoveNum"class="mini-textbox" vtype="" required="false" /></td> 
									<td _emptyName="保留数">保留数：<input style="width: 50px;" name="endWireKeepNum" id="endWireKeepNum" class="mini-textbox" vtype="" required="false" /></td>
									<td colspan="4">保留接地线编号及位置：<input name="endWireKeepInfo" id="endWireKeepInfo"
										class="mini-textbox" vtype="" required="false"  width="65%" /></td>
								</tr>
								<tr>
									<td _emptyName="接地刀闸组数" style="text-align:left;">接地刀闸组数<input style="width: 50px;" name="endGateTotalNum" id="endGateTotalNum" class="mini-textbox" vtype="" required="false" /> </td>
									<td _emptyName="已拆除数">已拆除数：<input style="width: 50px;" name="endGateRemoveNum" id="endGateRemoveNum" class="mini-textbox" vtype=""required="false" /></td>
									<td _emptyName="保留数">保留数：<input style="width: 50px;" name="endGateKeepNum" id="endGateKeepNum" class="mini-textbox" vtype="" required="false" /></td>
									<td colspan="4">保留接地刀闸编号及位置：<input name="endGateKeepInfo" id="endGateKeepInfo"
										class="mini-textbox" vtype="" required="false"  width="65%" /></td>
								</tr>								
								<tr>
									<td>10.备注 ：</td>
									<td colspan="5"><input name="remarks" id="remarks"
										class="mini-textarea" vtype="" required="false" width="100%"
										height="100px" /></td>
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
		<!-- 引入文明生产交底附票 -->
		<%-- <%@ include file="/WEB-INF/views/modules/wo/wt/woWtProduceTab.jsp"%> --%>
		<!-- 加载危险点附票 -->
		<%-- <%@ include file="/WEB-INF/views/modules/wo/wt/woWtDangerTab.jsp"%> --%>
		<!-- 加载作业安全措施附票 -->
		<%@ include file="/WEB-INF/views/modules/wo/wt/woWtTaskSafeMeasureTab.jsp"%>
		<!-- 加载电子围栏 -->		
		<%-- <c:if test="${isStandard =='1'}">				
			<%@ include file="/WEB-INF/views/modules/wo/wt/woWtOverhaulFence.jsp"%>
		</c:if>	 --%>
		<%-- <c:if test="${isStandard =='1'}">
			<div title="监控" id="tabCameraAndGuard" name="tabCameraAndGuard"
				style="border: 0px;">
				<div class="form" id="tabCameraList"
					style="width: 100%; height: 100%;"></div>
				
			</div>
		</c:if> --%>
		
	</div>
	<sys:toolbarfooter></sys:toolbarfooter>
	<sys:excelframe></sys:excelframe>
	<jsp:include page="permitNew.jsp"></jsp:include>
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
			importUrl:"${ctx}/wo-wt/wo/woWt/import"
			//onAfterLoadRecord : afterLoad1,
			
			/* ,
			onBeforeSaveForm : onBeforeSaveForm,
			onAfterLoadRecord : afterLoad,
			onAfterInsertRecord : afterLoad,
			onBeforeInsertRecord : beforeInsert */
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

				var lowObjId = objId.substring(0, 1).toLowerCase()
						+ objId.substring(1);
				childs.push({
					id : "grid" + objId,
					objId : objId,
					FK : "wtId",
					cascade : true,
					cascadeVisible : true,
					insertPos : "L",
					insertType : "A",
					panelId : "tab" + objId + "List",
					//tabName:"tab"+objId+"List",
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
				//visible:true,
				cascade : true,
				// cascadeVisible:true,
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
			var id = mini.get("id").getValue();
			var wtType = mini.get("wtType").getValue();
			var dutyOrgId = mini.get("dutyOrgId").getValue();
			var myChilds = getWoWtSm2();
			var menuItem = null;
			if (e.item == undefined) {
				menuItem = e.sender.item;
				/*  var data = mini.encode(menuItem);
				 alert(data); */
				//申请延期
				if (menuItem.menuNo == "workDelay") {
					var workLeader = null;
					if (mini.get("woWtLC.nowWorkLeader").getValue() != null
							&& mini.get("woWtLC.nowWorkLeader").getValue() != "") {
						workLeader = mini.get("woWtLC.nowWorkLeader")
								.getValue();
					} else {
						workLeader = mini.get("workLeader").getValue();
					}
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
	       									url : "${ctx}/wo-wt/wo/woWt/applyDelayForm?wtId=" + id
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
								url : "${ctx}/wo-wt/wo/woWt/applyDelayForm?wtId=" + id
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
					
				}
				//变更负责人
				else if (menuItem.menuNo == "changeDutyLeader") {
					var workLeader = mini.get("workLeader").getValue();
					var workLeaderName = mini.get("workLeaderName").getValue();
					var wtSigner = mini.get("wtSignerName_").getValue();
					var changeTime = mini.get("woWtLC.changeTime").getFormValue();
					var isLeaderChange = mini.get("woWtLC.isLeaderChange").getValue();
					
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
	       									url : "${ctx}/wo-wt/wo/woWt/changeDutyLeaderForm?wtId=" + id
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
	       										/*  var iframe = this.getIFrameEl(); 
	       										  var data = {};       
	       										  //调用弹出页面方法进行初始化
	       										  iframe.contentWindow.SetData(data); 
	       										 */
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
							url : "${ctx}/wo-wt/wo/woWt/changeDutyLeaderForm?wtId=" + id
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
								/*  var iframe = this.getIFrameEl(); 
								  var data = {};       
								  //调用弹出页面方法进行初始化
								  iframe.contentWindow.SetData(data); 
								 */
							},
							ondestroy : function(action) {
								if (action == "ok") {
									showTipM("info", "提示", "变更负责人成功！");
									refreshFormData();
								}
							}

						});
					}
				}
				//押票和恢复
				else if (menuItem.menuNo == "keepTicket"
						|| menuItem.menuNo == "restoreTicket") {
					var actionStatus = null;					
					if (menuItem.menuNo == "keepTicket") {
						actionStatus = "keepTicket";
					} else if (menuItem.menuNo == "restoreTicket") {
						actionStatus = "restoreTicket";
					}
					var workLeader = null;
					if (mini.get("woWtLC.nowWorkLeader").getValue() != null
							&& mini.get("woWtLC.nowWorkLeader").getValue() != "") {
						workLeader = mini.get("woWtLC.nowWorkLeader")
								.getValue();
					} else {
						workLeader = mini.get("workLeader").getValue();
					}
					mini.open({
						//targetWindow: window.top,   //页面对象。默认是顶级页面。
						url : "${ctx}/wo-wt/wo/woWt/keepAndRestoreForm?wtId=" + id
								+ "&wtType=" + wtType + "&actionStatus="
								+ actionStatus + "&workLeader=" + workLeader + "&dutyOrgId=" + dutyOrgId, //页面地址
						title : "押票和恢复", //标题
						width : "70%", //宽度
						height : 500, //高度
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
				//打印
				else if (menuItem.menuNo == "WoWtForm2") {
					if (id == "" || id == null) {
						mini.alert("请先保存再点击打印按钮！");
						return;
					}
					wowtPrint();
				}else if (menuItem.menuNo == "WoWtFixationForm") {
					if (id == "" || id == null) {
						mini.alert("请先保存再点击打印按钮！");
						return;
					}else{
						 mini.open({
					    		url: "${ctx}/wo-wt/wo/woWt/selectFixationType",        //页面地址
				    		    title: "选择打印格式",      //标题
				    		    width: 500,      //宽度
				    		    height: 180,     //高度
				    		    allowResize: true,       //允许尺寸调节
				    		    allowDrag: true,         //允许拖拽位置
				    		    showCloseButton: true,   //显示关闭按钮
				    		    showMaxButton: true,     //显示最大化按钮
				    		    showModal: true,         //显示遮罩
				    		    loadOnRefresh: false,       //true每次刷新都激发onload事件
				    		    ondestroy: function (action) {  //弹出页面关闭前
				    		        if (action == "ok") {       //如果点击“确定”
				    		            var iframe = this.getIFrameEl();
				    		            //获取选中、编辑的结果
				    		            var data = iframe.contentWindow.GetData();
				    		            data = mini.clone(data);    //必须。克隆数据。
				    		            if(data)
				    		            {
				    		            	wowtFixationPrint(data);
				    		            }
				    		        }                        
				    		    }
					    	});
					}
				}
				else if (menuItem.menuNo == "WoWtBrowseForm") {
					if (id == "" || id == null) {
						mini.alert("请先保存再点击打印按钮！");
						return;
					}
					WoWtPrintBrowse();
				}
				else if (menuItem.menuNo == "wtExamine") {
					var id = mini.get("id").getValue();
					var typeId = mini.get("wtType").getValue();
					var isStandard = mini.get("isStandard").getValue();
					/*   newTabPage('操作票审核',"${ctx}/wo-wt/wo/woOt/listExamine?id="+id+"&typeId="+typeId,true);   */
					mini.open({
						//targetWindow: window,   //页面对象。默认是顶级页面。
						url : "${ctx}/wo-wt/wo/woWt/examineForm?id=" + id
								+ "&typeId=" + typeId + "&ticketCategory="
								+ isStandard+ "&dutyOrgId=" + dutyOrgId, //页面地址
						title : "工作票审核", //标题
						width : 600, //宽度
						height : 200, //高度
						allowResize : true, //允许尺寸调节
						allowDrag : true, //允许拖拽位置
						showCloseButton : true, //显示关闭按钮
						showModal : false, //显示遮罩
						loadOnRefresh : false, //true每次刷新都激发onload事件
						ondestroy : function(action) {
							//弹出页面关闭前

						}
					});
				}else if(menuItem.menuNo == "cancellation"){//新增 mengqiang 2019-01-10 工作票作废
					//var workLeader = mini.get("workLeader").getValue();
					//var workLeaderName = mini.get("workLeaderName").getValue();					
					var workLeader = null;
					var workLeaderName = null;
					if (mini.get("woWtLC.nowWorkLeader").getValue() != null&& mini.get("woWtLC.nowWorkLeader").getValue() != "") {
						workLeader = mini.get("woWtLC.nowWorkLeader").getValue();
						workLeaderName = mini.get("woWtLC.nowWorkLeader").getText();
					} else {
						workLeader = mini.get("workLeader").getValue();
						workLeaderName = mini.get("workLeaderName").getValue();
					}
					mini.open({
						//targetWindow: window.top,   //页面对象。默认是顶级页面。
						 url : "${ctx}/wo-wt/wo/woWt/cancellationForm?wtId=" + id
								+ "&wtType=" + wtType+ "&workLeader="
								+ workLeader + "&workLeaderName="
								+ workLeaderName + "&dutyOrgId=" + dutyOrgId, //页面地址 								
						title : "作废工作票", //标题
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
								showTipM("info", "提示", "工作票已作废！");
								refreshFormData();
							}
						}

					});
				}
				else if(menuItem.menuNo == "relateDefect")
				{
					relateDefect();
				}
				else if(menuItem.menuNo == "linkDefect")
				{
					linkDefect();
				}
				else if(menuItem.menuNo == "transact")
				{
					transactWoWt("true");
				}
				//展示主票关联的附票
				else if (menuItem.menuNo == "linkMainTicket")
				{
					var id = mini.get("id").getValue();
					var url = "${ctx}/wo-wt/wo/woWt/list?addCan=0&baseFilter=a.main_ticket_id='"+id+"'";
					mini.open({
						//targetWindow: window.top,   //页面对象。默认是顶级页面。
						url : url, //页面地址
						title : "附票", //标题
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
							
						}

					});
				}
				 
			} else {
				menuItem = e.item;
			}

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
		  //var myChilds = getWoWtSm2();
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
		/* var specIds = null;
		//选择专业
		function selectSpec() {
        console.log(specIds);
			if (specIds == "1") {
				popLov(
						this,
						'选择专业',
						false,
						true,
						'${ctxRoot}/form?view=pg/pgSpecList',
						800, 500, 'id,name',
						'specId,specName');
			} else if (specIds == "2") {
				popLov(
						this,
						'选择专业',
						false,
						true,
						'${ctx}/pg/pgSpec/lov?baseFilter=a.id not in(21,26,27,28,24)',
						800, 500, 'id,name,descr',
						'specId,specName,specShortCode')
			}
		} */
	
   
  
</script>
</body>
</html>