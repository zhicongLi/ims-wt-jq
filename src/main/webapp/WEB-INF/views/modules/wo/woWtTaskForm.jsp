<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>

<html>
<head>
	 <title>工作任务单</title>
	 <meta name="decorator" content="default"/>	  
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
	 <jsp:include page="/WEB-INF/views/modules/wo/wt/borderCss.jsp"></jsp:include>
	 <script type="text/javascript" src="${ctxStatic}/common/sysToolBar.js"></script>
     <script type="text/javascript" src="${ctxStatic}/common/editControl.js"></script>
      <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;" ><!-- onactivechanged="mainTabActivechanged" -->
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="WoWtTask" permissionEdit="wo:woWtTask:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/wo-wt/wo/woWtTask/data" idField="id"
					 allowResize="true" pageSize="20" allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true" allowAlternating="true" showFilterRow="true"  showColumnsMenu="false">
					<div property="columns">
						<div name="action" width="60"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64"  visible="false">id
								<input property="editor" class="mini-textbox"  style="width:100%;" />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="wtCode"  field="wtCode" vtype=""  headerAlign="center" allowSort="true" width="100" >编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="wtCode-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="status" field="status" vtype="" type="comboboxcolumn" headerAlign="center" allowSort="true" width="40"sortField="a.status">状态 
								<input property="editor" class="mini-combobox" style="width: 100%;" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_task_status" /> 
								<input id="status-Filter" name="mini-column-filter" property="filter" class="mini-combobox" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_task_status" multiSelect="true" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
							</div>
							<div name="specId"  field="specId" vtype=""  headerAlign="center" align="center" allowSort="false" type="comboboxcolumn" width="100" >专业
								<input property="editor" class="mini-combobox"  style="width:100%;" valueField="id" textField="name" url="${ctx}/ims-iam-ext/pg/pgSpec/data?&groupId=2&pageSize=100"/>
								<input id="specId-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" multiSelect="true" valueField="id" textField="name"   style="width:100%;"
								onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" url="${ctx}/ims-iam-ext/pg/pgSpec/data?&groupId=2&pageSize=100"/>
							</div>
							<div name="orgName"  field="orgName" vtype=""  headerAlign="center" allowSort="true" width="64" >部门
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="orgName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="maintOrg"  field="maintOrg" vtype=""  headerAlign="center" allowSort="true" width="64"  visible="false" hideable="true">班组id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="maintOrg-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
							</div>
							<div name="maintOrgName"  field="maintOrgName" vtype=""  headerAlign="center" allowSort="true" width="64" >班组
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="maintOrgName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="workLeader"  field="workLeader" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">工作负责人id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="workLeader-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="workLeaderName"  field="workLeaderName" vtype=""  headerAlign="center" allowSort="true" width="64" >工作负责人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="workLeaderName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="workClassPerson"  field="workClassPerson" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">工作班成员
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="workClassPerson-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="personNum"  field="personNum" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false" >人员总数
								<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;" />
								<input id="personNum-Filter" name="mini-column-filter"  property="filter" class="mini-spinner"  allowLimitValue="false" style="width:100%;"  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="locationId"  field="locationId" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">工作地点id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="locationId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="location"  field="location" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">工作地点
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="location-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="content"  field="content" vtype=""  headerAlign="center" allowSort="true" width="200" >工作内容
								<input property="editor" class="mini-textarea" style="width:100%;"  />
								<input id="content-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="planStartTime"  field="planStartTime" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" visible="false">计划开始时间
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="planStartTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="planEndTime"  field="planEndTime" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" visible="false">计划结束时间
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="planEndTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="descr"  field="descr" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">安全措施
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="proReplyBy"  field="proReplyBy" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">交底人id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="proReplyBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="proReplyByName"  field="proReplyByName" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">交底人名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="proReplyByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="workPerson"  field="workPerson" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">工作班成员
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="workPerson-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="appDutyPrincipal"  field="appDutyPrincipal" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">批准运行值班id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="appDutyPrincipal-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="appDutyPrincipalName"  field="appDutyPrincipalName" vtype=""  headerAlign="center" allowSort="true" width="64"  visible="false">批准运行值班
								<input property="editor" class="mini-textbox"  style="width:100%;" />
								<input id="appDutyPrincipalName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="appDutyPrincipalTime"  field="appDutyPrincipalTime" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" visible="false">批准时间
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="appDutyPrincipalTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="endWorkLeader"  field="endWorkLeader" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">工作终结工作负责人id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="endWorkLeader-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="endWorkLeaderName"  field="endWorkLeaderName" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">工作终结工作负责人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="endWorkLeaderName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="endDutyPrincipal"  field="endDutyPrincipal" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">結束运行人员id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="endDutyPrincipal-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="endDutyPrincipalName"  field="endDutyPrincipalName" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">结束运行人员
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="endDutyPrincipalName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="endDutyPrincipalTime"  field="endDutyPrincipalTime" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" visible="false">运行结束时间
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="endDutyPrincipalTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>							
							<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false" hideable="true">备注
								<input property="editor" class="mini-textarea" style="width:100%;"  />
								<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
        <sys:toolbarformmain permissionEdit="wo:woWtTask:edit"></sys:toolbarformmain> 			
		<div id="editform" class="form" style="width:100%;">
				<div class="container"  style="width: 100%;"  >
					<div class="mini-clearfix ">
						<div class="mini-col-12">								
							<input class="mini-hidden" name="id" id="id"/>
							<input class="mini-hidden" name="procInsId" id="procInsId"/>
							<div class="mini-panel" title="基本信息" width="auto" height="auto"
						      showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
						      <table class="formtable" border="0" cellpadding="0" cellspacing="1" bgColor="#333">										
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
									  <input name="status" id="status" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype=""  width="200px" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_task_status" readonly="readonly"/>
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
									  <input  name="workLeader" id="workLeader" required="false" textName="workLeaderName" class="mini-buttonedit" allowInput="false"  width="200px" readonly="readonly"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','workLeader,workLeaderName')" onvaluechanged="update(this)" />
									</td>
									<td style="text-align:right;">电话：</td>									
									<td>
									  <input name="mobile" id="mobile" class="mini-textbox" width="200px" />
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
										onbuttonclick="popLov(this,'选择专业',false,true,'${ctxRoot}/form?view=pg/pgSpecList&groupId=2',850,500,'id,name','specId,specName')" />
									</td>
									<td style="text-align:right;">班组：</td>									
									<td>
									  <input name="maintOrg" id="maintOrg" textName="maintOrgName" class="mini-buttonedit" vtype="" required="false" width="200px" allowInput="false" readonly="readonly"
										onbuttonclick="popLov(this,'请选择班组',false,true,'${ctxRoot}/form?view=sys/sysOrgList&classId=0',850,500,'orgId,orgName','maintOrg,maintOrgName')" />
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
										onbuttonclick="popLov(this,'选择工作地址',false,true, '${ctx}/em/emEquipLogic/lov2',800,500,'id,name','locationId,location')" />
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
									  <input name="isTutelage" id="isTutelage" class="mini-CheckBox"  vtype="" required="false" width="100%" /><!-- onvaluechanged="updateIsTutelage"  -->
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
									<td style="text-align:right;">监护内容:</td>
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
		                </div> <!--mini-col-->
		                <div class="mini-col-12">
		                  <div class="mini-panel" title="安全措施" width="auto"  id="tabWoWtsm15List" name="tabWoWtsm15List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">
							<sys:toolbargridsub girdId="gridWoWtsm15" permissionEdit="wo:woWtSm:edit"></sys:toolbargridsub>
							<div id="gridWoWtsm15" class="mini-datagrid sGrid" style="width: 99.999%;"
								url="${ctx}/wo-wt/wo/woWtSm/allData?typeId=15"
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
									<div name="descr" field="descr" vtype="" headerAlign="center" allowSort="false" width="800" allowCellWrap="true">应注意的事项及采取的作业安全措施
										<input property="editor" class="mini-textarea" style="width: 100%;" />
									</div>
								</div>
							</div>
						  </div>
		                </div>
		                						
						<div class="mini-col-12">
		                  <div class="mini-panel" title="运行告知" width="auto" height="auto"
						    showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
							  <table class="formtable" border="0" cellpadding="0" cellspacing="1" bgColor="#333">								
								<tr>								
									<td style="text-align:right;">运行值班人员：</td>
									<td>
									  <input name="appDutyPrincipal" id="appDutyPrincipalName_" textName="appDutyPrincipalName" width="200px"
										onbuttonclick="sign_('appDutyPrincipalName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />										
									</td>									
									<td style="text-align:right;">签字时间：</td>
									<td colspan="3">
									  <input name="appDutyPrincipalTime" allowInput="false" id="appDutyPrincipalTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;"/>
									</td>
								</tr>							
							  </table>
						  </div>
		                </div>
		                
						<div class="mini-col-12">
		                  <div class="mini-panel" title="检修交代" width="auto" height="auto"
						    showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
						    <table class="formtable" border="0" cellpadding="0" cellspacing="1" bgColor="#333">
						      <tr>
								<td style="text-align:right;width: 15%;">检修交代：</td>								
								<td style="width: 84%;"colspan="5">
								    <input name="recondition" id="recondition" allowInput="true" class="mini-textarea"  width="100%" vtype="" required="false" /></td>
								</td> 																																	
					          </tr>
						    </table>
						  </div>
		                </div>
		                						
						<div class="mini-col-12">
		                  <div class="mini-panel" title="工作终结" width="auto" height="auto"
							showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
						    <table class="formtable" border="0" cellpadding="0" cellspacing="1" bgColor="#333">
						      <tr>
								<td style="text-align:right;">工作终结时间：</td>
								<td>
								  <input name="endDutyPrincipalTime" allowInput="false" id="endDutyPrincipalTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;"/> 
								</td>
								<td style="text-align:right;">工作负责人：</td>
								<td colspan="3">
								  <input name="endWorkLeader" id="endWorkLeaderName_" textName="endWorkLeaderName" onbuttonclick="sign_('endWorkLeaderName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" width="200px"/> 
								</td> 
							  </tr>
							  <tr>
							    <td style="text-align:right;">运行值班人员：</td>
								<td>
								  <input name="endDutyPrincipal" id="endDutyPrincipalName_" textName="endDutyPrincipalName" onbuttonclick="sign_('endDutyPrincipalName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" width="200px"h/> 
								</td>	
								<td style="text-align:right;">终结值别：</td>
								<td colspan="3">
								  <input name="dutyName" id="dutyName" class="mini-textbox" width="200px" />
								</td>																
					          </tr>
						    </table>
						  </div>
		                </div>						   
		            </div> <!--clearfix-->
		        </div> <!--container-->
		  </div> <!--editform-->
		  
		 
		  
		  
		  
		  
		  
		  
		  <jsp:include page="/WEB-INF/views/include/sign.jsp"></jsp:include>		       
	</div>       
    <!-- 加载作业安全措施附票 -->
    <%@ include file="/WEB-INF/views/modules/wo/wt/woWtTaskSafeMeasureTab.jsp"%>		
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
	     <sys:toolbargriddoc girdId="dgTestSub1" permissionEdit="wo:woWtTask:edit" objKeyField="id" objDescrField="name" objType="woWtTask"></sys:toolbargriddoc>
         <div class="mini-fit">
             <sys:griddoc girdId="dgTestSub1"></sys:griddoc>
         </div>				
	</div> 
	 
</div>



<!-- 新流程方式引入 -->
<sys:workflow flowKey="woWtTask"></sys:workflow>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>
<sys:docAttach girdId="dgTestSub1"></sys:docAttach>
<jsp:include page="wt/attachTab.jsp" flush="true" />
<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"WoWtTask",
			    masterKeyField : "id",
				dataUrl:"${ctx}/wo-wt/wo/woWtTask/data",
				getUrl:"${ctx}/wo-wt/wo/woWtTask/get",
				saveUrl:"${ctx}/wo-wt/wo/woWtTask/save",
				removeUrl:"${ctx}/wo-wt/wo/woWtTask/remove",
				exportUrl:"${ctx}/wo-wt/wo/woWtTask/export?status=1",
				initInsertUrl : "${ctx}/wo-wt/wo/woWtTask/initInsert",				
				onAfterNewRecord:addNewReword,
	            onAfterLoadRecord: onAfterLoadRecord,          
	            onBeforeSaveCheck: onBeforeSaveCheck,
	            onBeforeSaveForm : onBeforeSaveForm
	            
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
                    	{//安全措施
                    		id : "gridWoWtsm15",
             				objId : "WoWtSm",
             				FK : "wtId",
             				cascade : true,
             				cascadeVisible : true,
             				insertPos : "L",
             				insertType : "A",
             				panelId : "tabWoWtsm15List",				
             				dataUrl : "${ctx}/wo-wt/wo/woWtSm/data?typeId=15",
    						getUrl : "${ctx}/wo-wt/wo/woWtSm/get",
    						saveUrl : "${ctx}/wo-wt/wo/woWtSm/save",
    						removeUrl : "${ctx}/wo-wt/wo/woWtSm/remove",
    						exportUrl : "${ctx}/wo-wt/wo/woWtSm/export",
    						initInsertUrl : "${ctx}/wo-wt/wo/woWtSm/initInsert?typeId=15"
       					}, 
                    	{//作业安措表单
      						id : "#formWoWtWorkSafe",
      						objId : "WoWtWorkSafe",
      						FK : "wtId",
      						visible : true,
      						cascade : true,
      						cascadeVisible : true,
      						tabsId : "tabsMain",
      						tabName : "tabWoTaskSafeMeasureList",
      						dataUrl:"${ctx}/wo-wt/wo/woWtWorkSafe/data?wtType=0",
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
      					}, 
      					{//文档附件 
                            id:"dgTestSub1",
                            cascade:true,
                            //fileTypes:"*.*",
                            folder:"woWtTask",                           
                            FKLinks: [
                                {FK: "objKey", masterKeyField: "id"},
                                {FK: "objType", masterKeyField: "(\"woWtTask\")"}
                            ],
                            cascadeNoClone: true,
                            dataUrl:"${ctx}/ims-ext/dm/dmDoc/data",
                            getUrl:"${ctx}/ims-ext/dm/dmDoc/get",
                            saveUrl:"${ctx}/ims-ext/dm/dmDoc/save",
                            removeUrl:"${ctx}/ims-ext/dm/dmDoc/remove",
                            exportUrl:"${ctx}/ims-ext/dm/dmDoc/export",
                            onDocActionRenderer:onDocActionRenderer
                        } 
      					/* ,
      				    {//新增显示关联检修围栏信息
      						id : "gridSmElectronicFence",
      						objId : "SmElectronicFence",
      						FK : "wtId",				
      						cascade : true,								
      						insertPos : "L",
      						insertType : "A",
      						tabsId : "tabsMain",
      						tabName : "tabSmElectronicFenceList",				      						
      						dataUrl:"${ctx}/sm-region/sm/smElectronicFence/data"
      					} */
	                   ]
	);

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: 'id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.wt_code',
						label: '编号',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.org_id',
						label: '部门id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.org_name',
						label: '部门',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.main_org',
						label: '班组id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.main_org_name',
						label: '班组',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.work_leader',
						label: '工作负责人id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.work_leader_name',
						label: '工作负责人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.work_class_person',
						label: '工作班成员',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.person_num',
						label: '人员总数',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.location_id',
						label: '工作地点id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.location',
						label: '工作地点',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.content',
						label: '工作内容',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.plan_start_time',
						label: '计划开始时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.plan_end_time',
						label: '计划结束时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.descr',
						label: '安全措施',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.pro_reply_by',
						label: '交底人id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.pro_reply_by_name',
						label: '交底人名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.work_person',
						label: '工作班成员',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.app_duty_principal',
						label: '批准运行值班id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.app_duty_principal_name',
						label: '批准运行值班',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.app_duty_principal_time',
						label: '批准时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.end_work_leader',
						label: '工作终结工作负责人id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.end_work_leader_name',
						label: '工作终结工作负责人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.end_duty_principal',
						label: '結束运行人员id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.end_duty_principal_name',
						label: '结束运行人员',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.end_duty_principal_time',
						label: '运行结束时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.create_by',
						label: '创建者',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_date',
						label: '创建时间',
						type: 'datetime',
						default_value: '',
						size: 100
							,
							plugin: 'datepicker',
					    	plugin_config: {
							format: 'yyyy-mm-dd',
							todayBtn: 'linked',
							todayHighlight: true,
							autoclose: true,
							language:"zh-CN"
						   }
					}
					,{
						id: 'a.update_by',
						label: '更新者',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.update_date',
						label: '更新时间',
						type: 'datetime',
						default_value: '',
						size: 100
							,
							plugin: 'datepicker',
					    	plugin_config: {
							format: 'yyyy-mm-dd',
							todayBtn: 'linked',
							todayHighlight: true,
							autoclose: true,
							language:"zh-CN"
						   }
					}
					,{
						id: 'a.remarks',
						label: '备注',
						type: 'string',
						default_value: '',
						size: 100
					}
			]
	);
   loadWindow();
   //////////表格操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }

   }
   //////////form操作菜单项点击事件方法/////////
   function onFormOpMiClick(e){
	
     
   }

   //////////子表格操作菜单项点击事件方法/////////
 
   function addButton(){
	 sysToolBar_.addButtonOption({
		"buttonId":'test',
		"functionStr":'test',/* 对应按钮的点击事件  */		
		"name":'打印预览'
	 });	      
   }	 
   function test(){
	 var id = mini.get("id").getValue();	
	 var iamCode = iamCodeValue();
	 if (id == "" || id == null) {
	  mini.alert("请先保存再点击打印按钮！");
	  return;
	 }
	 window.open("${ctxRoot}/form3?view=/wo/woWtTaskSq&id="+id+"&iamCode="+iamCode);	  
   }
	 
   $(function(){
	 addButton();
	 $.ajax({//获取新建权限
       url: "${ctx}/wo-wt/wo/woWt/permit",
       data:{wtType:"7"},
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
   }); 
   
   
   function onBeforeSaveCheck(o){
       editControl.beforeSave(o);
       return true;
   }
   
   function addNewReword(o){
   	editControl.afterLoad(o);//页面编辑权限控制
   }
   
   function onAfterLoadRecord(o) {	   	    	
       wfAfterLoad(o);//加载流程
       editControl.afterLoad(o);//页面编辑权限控制	 
       //updateIsTutelage();
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
   
   //更新作业安措排序
   function onBeforeSaveForm() {
	  //更新危险点与预防控制措施排序字段值
	  updDangerTaskSeqNo();			
	  return true;
   }
   //编辑权限控制
   editControl.loadEditList('woWtTask'); 
   
   
  
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

//流程按钮响应事件
function onBpmButtonClick(buttonId) {  
 
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
      var data = {
        eventName: 'parentClickButton',
        alias: buttonId,
        /* flowVariables: {//定义流程变量                  
          "reportByCompany": reportByCompany || '',//发现人所属公司
          "specCode": specCode || ''//专业编号
         }, */
        data: {}
      };
      sendBpmMsg(data);
      popBox(); 
    } 
 } 
</script>
</body>
</html>