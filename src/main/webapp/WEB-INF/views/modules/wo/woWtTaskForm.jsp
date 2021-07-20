<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<%
	String contextPath = request.getContextPath();    
	String realPath = request.getSession().
	                getServletContext().getRealPath("/");    
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+
	                request.getServerPort()+contextPath;
%>
<html>
<head>
	 <title>工作任务单</title>
	 <meta name="decorator" content="default"/>	  
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
	 <jsp:include page="/WEB-INF/views/modules/wo/wt/borderCss.jsp"></jsp:include>
	 <script type="text/javascript" src="${ctxStatic}/common/sysToolBar.js"></script>
     <script type="text/javascript" src="${ctxStatic}/common/editControl.js"></script>
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;" onactivechanged="mainTabActivechanged">
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
							<div name="wtCode"  field="wtCode" vtype=""  headerAlign="center" allowSort="true" width="120" >编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="wtCode-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"/>
							</div>
							<div name="status" field="status" vtype="" type="comboboxcolumn" headerAlign="center" allowSort="true" width="40"sortField="a.status">状态 
								<input property="editor" class="mini-combobox" style="width: 100%;" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_task_status" /> 
								<input id="status-Filter" name="mini-column-filter" property="filter" class="mini-combobox" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_task_status" multiSelect="true" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
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
							<div name="content"  field="content" vtype=""  headerAlign="center" allowSort="true" width="100" >工作内容
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
								    <td>工作票流水号：</td>
									<td>
									  <input name="serialNumber" id="serialNumber" class="mini-textbox" width="200px" readonly="readonly"/>
									</td>
									<td>编号：</td>
									<td>
									  <input name="wtCode" id="wtCode" class="mini-textbox" width="200px" readonly="readonly"/>
									</td>
									<td>状态:</td>
									<td>
									  <input name="status" id="status" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype=""  width="180px" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_task_status" />
									</td>									
								  </tr>	
								  <tr>
								    <td>工单：</td>
									<td>
									  <input name="woId" id="woId" class="mini-textbox" width="200px" readonly="readonly"/>
									</td>
									<td>缺陷单：</td>
									<td>
									  <input name="defectId" id="defectId" class="mini-textbox" width="200px" readonly="readonly"/>
									</td>
									<td>作业类型:</td>
									<td>
									  <input name="jobType" id="jobType" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype=""  width="180px" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_job_type" />
									</td>									
								  </tr>	
								  <tr>
								    <td>机组:</td>
									<td>
									  <input name="plantUnit" id="plantUnit" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype=""  
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_plant_unit" />
									</td>
									<td>功能位置：</td>
									<td><input name="equipLogicId" id="equipLogicId"
										textName="equipLogicName" allowInput="false" width="200px"
										class="mini-buttonedit" vtype="" required="false"
										onbuttonclick="popLov(this,'选择逻辑设备',false,true,'${ctx}/em/emEquipLogic/lov',800,500,'id,name','equipLogicId,equipLogicName',null,null,selectKKS)"
										onvaluechanged="updateEquip()" /></td>
									<td align="left">原KKS：</td>
									<td><input name="equipName" id="equipName"
										class="mini-textbox" readonly="readonly" /></td>
									<!-- <td align="left">所属设备编码：</td>
									<td><input name="equipId" id="equipId"
										class="mini-textbox" readonly="readonly" /></td>	 -->							
								  </tr>	
								  <tr>
									<td>工作负责人(监护人)：</td>
									<td>
									  <input  name="workLeader" id="workLeader" required="false" textName="workLeaderName" class="mini-buttonedit" allowInput="false" enabled="false"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctx}/sys/sysUser/sysMisList',850,500,'id,name','workLeader,workLeaderName')" onvaluechanged="update(this)" />
									</td>
									<td>电话：</td>									
									<td>
									  <input name="mobile" id="mobile" class="mini-textbox" width="200px" readonly="readonly"/>
									</td>
									<td>工作班成员数量：</td>
									<td>
									  <input name="personNum" id="personNum" class="mini-spinner" allowNull="true" />
									</td>
								  </tr>							  							
								  <tr>
									<td>部门：</td>
									<td>
									  <input name="orgId" id="orgId" textName="orgName" width="200px" class="mini-buttonedit" allowInput="false"  enabled="false"
										onbuttonclick="popLov(this,'选择部门',false,true,'${ctxRoot}/form?view=sys/sysOrgList',850,500,'id,name','orgId,orgName')" onvaluechanged="changeDutyOrg">
									</td>
									<td>专业：</td>									
									<td>
									  <input name="specId" id="specId" textName="specName" class="mini-buttonedit" vtype="" required="false" allowInput="true" 
										onbuttonclick="popLov(this,'选择专业',false,true,'${ctxRoot}/form?view=pg/pgSpecList',850,500,'id,name','specId,specName')" />
									</td>
									<td>班组：</td>									
									<td>
									  <input name="maintOrg" id="maintOrg" textName="maintOrgName" class="mini-buttonedit" vtype="" required="false" width="180px" allowInput="false" enabled="false"
										onbuttonclick="popLov(this,'请选择班组',false,true,'${ctxRoot}/form?view=pg/pgClassInfo/lov?orgType=2',850,500,'orgId,orgName','maintOrg,maintOrgName')" />
									</td>								
								  </tr>
								  <tr>
									<td>工作班人员：</td>
									<td colspan="5">									  
									   <input id="workClassPersonIds" class="mini-textboxlist" name="workClassPersonIds" textName="workClassPerson" allowInput="false" required="false" style="width:600px;"/>                                   
	                                      <a id="choosePerson" class="mini-button " plain="true" onclick="popLovJson1(this)">选择...</ a>							
									</td>																
								  </tr>							
								  <tr>
									<td>工作地点：</td>
									<td colspan="5">
									  <input name="location" id="location" textName="location" class="mini-buttonedit" vtype="" required="false" width="100%" allowInput="true"
										onbuttonclick="popLov(this,'选择工作地址',false,true, '${ctx}/em/emEquipLogic/lov2',800,500,'id,name','locationId,location')" />
									</td>																	
								 </tr>							 
								  <tr>
									<td>工作内容：</td>
									<td colspan="5">
									  <input name="content" id="content" class="mini-textarea" vtype="" required="false" width="100%" />
									</td>
								  </tr> 
								  <tr>
									<td>专职监护人监护：</td>
									<td colspan="5">
									  <input name="isTutelage" id="isTutelage" class="mini-CheckBox" vtype="" required="false" width="100%" />
									</td>
								  </tr>
								  <tr>
								    <td>专职监护人：</td>
									<td>
									  <input name="tutelageName" id="tutelageName" class="mini-textbox"  width="100%"/>
									 
									  <%-- <input  name="tutelageId" id="tutelageId" required="false" textName="tutelageName" class="mini-buttonedit" allowInput="false" enabled="false"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctx}/sys/sysUser/sysMisList',850,500,'id,name','tutelageId,tutelageName')" />									 --%>
									</td>
									<td>监护地点：</td>
									<td>
									  <input name="tutelageAddress" id="tutelageAddress" class="mini-textbox" />
									</td>
									<td>监护内容:</td>
									<td>
									  <input name="tutelageContent" id="tutelageContent" class="mini-textbox" />
									</td>									
								  </tr>								 							 
								  <tr>
									<td>计划工作开始时间：</td>
									<td>
									  <input name="planStartTime" id="planStartTime" allowInput="false" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;" />
									</td>
									<td>计划工作结束时间：</td>
									<td colspan="3">   
									  <input name="planEndTime" id="planEndTime" allowInput="false" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;" />
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
									<td>运行值班人员：</td>
									<td>
									  <input name="appDutyPrincipal" id="appDutyPrincipalName_" textName="appDutyPrincipalName"
										onbuttonclick="sign_('appDutyPrincipalName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />										
									</td>									
									<td>签字时间：</td>
									<td colspan="3">
									  <input name="appDutyPrincipalTime" allowInput="false" id="appDutyPrincipalTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;"/>
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
								<td>检修交代：</td>
								<td>
								  <td colspan="5">
								    <input name="recondition" id="recondition" allowInput="true" class="mini-textarea"  width="90%" vtype="" required="false" /></td>
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
								<td>工作终结时间：</td>
								<td>
								  <input name="endDutyPrincipalTime" allowInput="false" id="endDutyPrincipalTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;"/> 
								</td>
								<td>工作负责人：</td>
								<td colspan="3">
								  <input name="endWorkLeader" id="endWorkLeaderName_" textName="endWorkLeaderName" onbuttonclick="sign_('endWorkLeaderName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" /> 
								</td> 
							  </tr>
							  <tr>
							    <td>运行值班人员：</td>
								<td>
								  <input name="endDutyPrincipal" id="endDutyPrincipalName_" textName="endDutyPrincipalName" onbuttonclick="sign_('endDutyPrincipalName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" /> 
								</td>	
								<td>终结值别：</td>
								<td colspan="3">
								  <input name="dutyName" id="dutyName" class="mini-textbox" width="200px" readonly="readonly"/>
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
	
	
	<div title="附件" id="tabWoProcessList" name="tabSmElectronicFenceList"   style="border: 0px;"  >  			
		  <div style="width: 100%;">
			   <div class="mini-toolbar" style="border-bottom: 0; padding: 0px;">
					<table style="width: 100%;">
						<tr>
							<td style="width: 100%;">
								<a class="mini-button" id="newFile1"
								   iconCls="icon-plus-sign" style="color: green;"
								   onclick="newFileRow('dgTestSub1','','工作任务单','woWtTask')"
								   plain="true"
								   tooltip="新建行...">上传</a>
							<td style="white-space: nowrap;"></td>
							
						</tr>
					</table>
			   </div>									   
			</div>
		    <div id="dgTestSub1" class="mini-datagrid"
					 style="width: 100%;"
					 url="${ctx}/ims-ext/dm/dmDoc/allData" idField="id" showPager="false"
					 allowResize="true" pageSize="100" allowCellSelect="true"
					 allowCellEdit="true" editNextOnEnterKey="true"
					 editNextRowCell="true" allowAlternating="true" 
					 showColumnsMenu="true" multiSelect="true"><!-- ondrawcell="onDrawCellDoc" -->
					<div property="columns">
				
						<div name="action" width="60"  headerAlign="center" align="center"  renderer="onActionRendererForFile" cellStyle="padding:0;">操作</div><!-- renderer="onDocActionRenderer" -->
						<div name="id"  field="id" hideable="true" visible="false"  headerAlign="center" allowSort="true" width="64" >编号
						</div>
						<div name="docPath"  field="docPath" hideable="true" visible="false"  headerAlign="center" allowSort="true" width="64" >路径
						</div>
						<div name="docAccType"  field="docAccType" hideable="true" visible="false"  headerAlign="center" allowSort="true" width="64" >编号
						</div>
						<div name="docFileName"  field="docFileName" readOnly="true"  headerAlign="center" allowSort="true" width="200" allowCellWrap="true">文件名
							<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;" onvaluechanged="onFilterChanged"/>
						</div>																						
						<div name="descr" field="descr" vtype="" readOnly="true"   headerAlign="center" allowSort="true" width="255" allowCellWrap="true">描述
							<input property="editor" class="mini-textbox" style="width:100%;"  />
							<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;" onvaluechanged="onFilterChanged"/>
						</div>
						<div name="createBy" field="createBy" hideable="true" visible="false" vtype=""  headerAlign="center" allowSort="true" width="34" >创建人
							<input property="editor" class="mini-textbox" style="width:100%;"  />
							<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;" onvaluechanged="onFilterChanged"/>
						</div>
					</div>
				</div>	
	
	</div>
			
   	
</div>
 <div id="editWindow1" class="mini-window" title="文件上传" style="width:550px;display: none"
	 showModal="true" allowResize="true" allowDrag="true">
	<div id="editform1" class="form" >
		<input class="mini-hidden" name="id" />
		<input class="mini-hidden" name="objKey" />
		<input class="mini-hidden" name="objDescr" value="工作任务单" />
		<input class="mini-hidden" name="objType" value="woWtTask" />
		<input class="mini-hidden" name="folder" value="woWtTask" />
		<input class="mini-hidden" id = "fileGrid" name="fileGrid" value="" /><!-- 附件区分字段 -->
		<table style="width:100%;">
			<tr>
				<td style="width:80px;">文件：</td>
				<td style="width:250px;" id="file_td">
					<input width="250" class="mini-htmlfile" name="file" id="file" onfileselect = 'onfileselect' /></td>
			</tr>
			<tr>
				<td style="width:80px;">文件名：</td>
				<td style="width:250px;" ><input width="250" readOnly="true" name="docFileName" id="docFileName" class="mini-textbox" /></td>
			</tr>
			<tr>
				<td>描述：</td>
				<td><input width="250" name="descr" id = "descr" class="mini-textbox" /></td>
			</tr>
			<tr>
				<td style="text-align:right;padding-top:5px;padding-right:20px;" colspan="6">					
					<div class="mini-toolbar" id="lov_action_bar" style="text-align: center; vertical-align: middle; padding-top: 8px; padding-bottom: 8px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
						<a class="mini-button" style="width: 60px;" onclick="saveData()">确定</a>
						<span style="display: inline-block; width: 25px;"></span> <a class="mini-button" style="width: 60px;" onclick="cancelRow()">取消</a>
				</td>
			</tr>
		</table>
	</div>
</div> 	


<!-- 新流程方式引入 -->
<sys:workflow flowKey="woWtTask"></sys:workflow>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>
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
	            onBeforeSaveForm : onBeforeSaveForm,
	            onAfterLoadAllChild:onAfterLoadAllChild
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
      						dataUrl:"${ctx}/wo-wt/wo/woWtWorkSafe/data?wtType=1",
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
                            FKLinks:[
                                {FK:"objKey",masterKeyField:"id"}
                               
                            ],
                            dataUrl:"${ctx}/ims-ext/dm/dmDoc/data?objType=woWtTask",
                            getUrl:"${ctx}/ims-ext/dm/dmDoc/get",
                            saveUrl:"${ctx}/ims-ext/dm/dmDoc/save",
                            removeUrl:"${ctx}/ims-ext/dm/dmDoc/remove",
                            exportUrl:"${ctx}/ims-ext/dm/dmDoc/export"
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
       	
      
   }
   
   function onAfterLoadAllChild(){
	  /*  var editForm = new mini.Form("#editform");
       var editFormData = editForm.getData();
		var formWoWtWorkSafe = new mini.Form("#formWoWtWorkSafe");
		formWoWtWorkSafe.setData(editFormData); */
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
  // editControl.loadEditList('woWtTask'); 
   
   
  
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
 
//流程按钮响应事件
function onBpmButtonClick(buttonId) {  
 	debugger;     		  
       var data = {
         eventName: 'parentClickButton',
         alias: buttonId,
         flowVariables: {//定义流程变量                  
           "abc": '2' || '',//工作负责人 
          },//隐患名称
         data: {}
       };
       sendBpmMsg(data);
       popBox(); 
      
  }  
  
  
function newFileRow(gridId,objKeyField,objDescrField,objType) {		 
    var errMassage = "请先保存后上传附件！";	        
    var grid = mini.get("datagridMain");
    var rowId;     
    if(typeof(grid.getSelected())!="undefined"){
   	 rowId= grid.getSelected().id;
    }else{
   	 rowId=mini.get("id").value;
    }	    
     if(!rowId){
         showMessageBox("错误",errMassage,"error");
         return;
     }	
     /* var userInfoJson = getCurrUserInfo(false);
	  var userInfo = mini.decode(userInfoJson);
	  var userInfoId = userInfo.id;	  
	  var userInfoOrg = userInfo.orgId; */
     
	  /* if(userInfoId!="1"&&userInfoOrg!="1962"){
   	  showMessageBox("错误","只有政工部人员可以新建附件！","error");   
   	  return;
     }  */
     var edit_file = mini.get("file");
     if(edit_file == null && edit_file == undefined ){
         renderFileHtml();
     }
     
     var editFileWindow = mini.get("editWindow1");
     var form = new mini.Form("#editform1");     
     var newFileRow = {objKey:rowId,objDescr:objDescrField,objType:objType,folder:objType,fileGrid:gridId};
     editFileWindow.show();
     form.reset();
     form.setData(newFileRow);
}

 function onActionRendererForFile(e) {
    var gridTemp = e.sender;
    var record = e.record;
    var uid = record._uid;
    var rowIndex = e.rowIndex;
    
    //var del  = '<a class="Delete_Button"   href="javascript:delFileRow(\'' + uid + '\')" ><i class="icon-remove" data-tooltip="删除" data-placement="top"></i></a>';
    var del  = ' <a class="Delete_Button" href="javascript:delFileRow(\''+gridTemp.id+'\',\'' + uid + '\')"><i class="icon-remove" data-tooltip="删除" data-placement="top"></i></a>'; 
    var down = '| <a class="Edit_Button" href="http://192.168.0.166:9001'+record.docPath+ '"  download="'+record.docFileName+'"><i class="icon-download" data-tooltip="下载" data-placement="top"></i></a>';
    var view = '| <a class="Edit_Button" href="http://192.168.0.166:9001'+record.docPath+ '" target="_blank" preview="'+record.docFileName+'"><i class="icon-collapse" data-tooltip="查看" data-placement="top"></i></a>';
    return del+"&nbsp;&nbsp;&nbsp;"+down+"&nbsp;&nbsp;&nbsp;" + view;
}



 
 function delFileRow(gridId,row_uid) {
    var fileGrid = mini.get(gridId);
    var row = fileGrid.getSelected();	 
	//当前登录者
	var currUserId  = _currUser_.id  
	if(row.createBy!=currUserId){
	  mini.alert("无权删除他人上传附件！","警告");
	  return;
	}
    //var row = fileGrid.getRowByUID(row_uid);
    if (row) {
        if (confirm("确定删除此记录？")) {
            fileGrid.loading("删除中，请稍后......");
            //grid.removeRow (row, true);
            $.ajax({
                url: "${ctx}/ims-ext/dm/dmDoc/remove?id=" + row.id,
                success: function (text) {
                    fileGrid.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
        }
    }
}

function renderFileHtml(){
    var textbox=new mini.HtmlFile();
    textbox.set({id:"file",name:"file",width:"250"});
    textbox.on("fileselect",onfileselect);
    textbox.render("file_td");
} 

function saveData(row_uid) {
    var editFileWindow = mini.get("editWindow1");
    var fileGrid = mini.get("fileGrid").getValue();//对应子项附件
    var fileUploadGrid = mini.get(fileGrid);
    var form = new mini.Form("#editform1");

    var o = form.getData();
    showMessageBox(null,"加载中，请稍后......","loading");
    var json = mini.encode([o]);
    json = mini.decode(json);
    var docFileName=mini.get("docFileName").value;
    var suffix =docFileName.substring(docFileName.lastIndexOf(".")+1);
    var inputFile = $("#file > input:file")[0];
    $.ajaxFileUpload({
        type : "POST",
        url : '${ctx}/ims-ext/dm/dmDoc/save', //用于文件上传的服务器端请求地址
        fileElementId : inputFile, //文件上传域的ID
        data : json[0], //附加的额外参数
        dataType : 'text', //返回值类型 一般设置为json
        success : function(data, status) { //服务器成功响应处理函数

            data = eval('(' + data + ')');

            if (data.status == 'success') {
                form.reset();
                showTipM("success", "提示", data.message);
                //var viewFileType = mini.get("viewFileType").getValue();
                hideMessageBox();
               // viewFuJian(viewFileType);
                editFileWindow.hide();
                fileUploadGrid.reload();
            } else {
                hideMessageBox( );
                editFileWindow.hide();
                fileUploadGrid.reload();
                alert("上传错误！"+data.message);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            var callback=function (action) {
                viewErrorDetail(jqXHR.responseText);
            }
            var buttonsTemp=["ok","详细"];
            showMessageBox("错误",o.message,"error",null,callback,buttonsTemp);
        },
        complete: function () {
            var filez = mini.get("file");
            filez.destroy();
        }
    });
 }
  

function cancelRow(){
   var editFileWindow = mini.get("editWindow1");
   editFileWindow.hide();

} 

function onfileselect(e){
     var docFileName = mini.get("docFileName");
     var filePath = e.sender.getValue()
     var fileName = extractFileName(filePath);
     docFileName.setValue(fileName);
}

function mainTabActivechanged(e){	
	 var tabs = mini.get("tabsMain").getTabs();
     var id=mini.get("id").getValue();	//任务设备ID
     if(e.tab.title == "作业安全措施票"){
    	 var wtId =mini.get("wtId").getValue();
    	 /* if(wtId==null ||wtId==""){
    		 var editForm = new mini.Form("#editform");
    	     var editFormData = editForm.getData();
    	     var formWoWtWorkSafe = new mini.Form("#formWoWtWorkSafe");
    		 formWoWtWorkSafe.setData(editFormData);
    	 } */
    	/*  var editForm = new mini.Form("#editform");
	     var editFormData = editForm.getData();
	     var formWoWtWorkSafe = new mini.Form("#formWoWtWorkSafe");
		 formWoWtWorkSafe.setData(editFormData); */
     }
}	
</script>
</body>
</html>