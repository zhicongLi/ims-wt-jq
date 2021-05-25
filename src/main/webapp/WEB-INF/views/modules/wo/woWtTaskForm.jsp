<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<html>
<head>
	 <title>工作任务单</title>
	 <meta name="decorator" content="default"/>
	  <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
	 <jsp:include page="/WEB-INF/views/modules/wo/wt/borderCss.jsp"></jsp:include>
	 <script type="text/javascript" src="${ctxStatic}/common/sysToolBar.js"></script>
     <script type="text/javascript" src="${ctxStatic}/common/editControl.js"></script>
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
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
								<table class="formtable">										
								  <tr>
									<td style="padding-left: 5px;">编号：</td>
									<td>
									  <input name="wtCode" id="wtCode" class="mini-textbox" width="200px"/>
									</td>
									<td>状态:</td>
									<td colspan="3">
									  <input name="status" id="status" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype=""  width="180px" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_task_status" />
									</td>									
								  </tr>								
								  <tr>
									<td>1.部门：</td>
									<td>
									  <input name="orgId" id="orgId" textName="orgName" width="200px" class="mini-buttonedit" allowInput="false"  enabled="false"
										onbuttonclick="popLov(this,'选择部门',false,true,'${ctxRoot}/form?view=sys/sysOrgList',850,500,'id,name','orgId,orgName')" onvaluechanged="changeDutyOrg">
									</td>
									<td>班组：</td>									
									<td>
									  <input name="maintOrg" id="maintOrg" textName="maintOrgName" class="mini-buttonedit" vtype="" required="false" width="180px" allowInput="false" enabled="false"
										onbuttonclick="popLov(this,'请选择班组',false,true,'${ctxRoot}/form?view=pg/pgClassInfo/lov?orgType=2',850,500,'orgId,orgName','maintOrg,maintOrgName')" />
									</td>
									<td>工作监护人(负责人)：</td>
									<td>
									  <input style="width: 180px" name="workLeader" id="workLeader" required="false" textName="workLeaderName" class="mini-buttonedit" allowInput="false" enabled="false"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctx}/sys/sysUser/sysMisList',850,500,'id,name','workLeader,workLeaderName')" onvaluechanged="update(this)" />
									</td>
								  </tr>
								  <tr>
									<td>2.工作班人员：</td>
									<td colspan="4">
									  <input name="workClassPerson" id="workClassPerson" class="mini-textarea" vtype="" required="false" width="100%" />
									</td>
									<td>
									  <span>共 <input name=personNum id="personNum" class="mini-spinner" allowNull="true" />人</span>
									</td>
								</tr>
								  <tr>
									<td>3.工作内容：</td>
									<td colspan="5">
									  <input name="content" id="content" class="mini-textarea" vtype="" required="false" width="100%" />
									</td>
								  </tr>
								  <tr>
									<td>4.工作地点：</td>
									<td colspan="3">
									  <input name="location" id="location" textName="location" class="mini-buttonedit" vtype="" required="false" width="100%" allowInput="true"
										onbuttonclick="popLov(this,'选择工作地址',false,true, '${ctx}/em/emEquipLogic/lov2',800,500,'id,name','locationId,location')" />
									</td>
									<td>机组:</td>
									<td>
									  <input name="plantUnit" id="plantUnit" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype=""  width="180px"
										url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_plant_unit" />
									</td>									
								</tr>
								  <tr>
									<td>5.计划工作时间：</td>
									<td align="right">开始时间：</td>
									<td>
									  <input name="planStartTime" id="planStartTime" allowInput="false" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;" />
									</td>
									<td align="right">结束时间：</td>
									<td colspan="2">
									  <input name="planEndTime" id="planEndTime" allowInput="false" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 180px;" />
									</td>
								</tr>
								  <tr>
								    <td>6.应注意的事项及采取的作业安全措施：</td>
								    <td colspan="5">
								      <input name="descr" id="descr" class="mini-textarea" vtype="" required="false" width="100%" />
								    </td>
								  </tr>
								  <tr>
								    <td>7.交底人</td>
								    <td colspan="3">
								      <input style="width: 180px" name="proReplyBy" id="proReplyBy" required="false" textName="proReplyByName" class="mini-buttonedit" allowInput="false"
										onbuttonclick="popLov(this,'选择人员',false,true,'${ctx}/sys/sysUser/sysMisList',850,500,'id,name','proReplyBy,proReplyByName')" onvaluechanged="update(this)" />
									</td>
									<td>许可部门：</td>
									<td>
									    <input name="isFuelRun" id="isFuelRun" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype="" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_is_fuel_run" />
									</td>	
								  </tr>
								  <tr>
									<td>8.工作班成员签名：</td>
									<td colspan="5">
									  <input name="workPerson" id="workPerson" class="mini-textarea" vtype="" required="false" enabled="true" width="100%" />
									</td>
								  </tr>
								  <tr>
									<td>9．告知运行：</td>
									<td align="right">运行值班人员：</td>
									<td>
									  <input name="appDutyPrincipal" id="appDutyPrincipalName_" textName="appDutyPrincipalName"
										onbuttonclick="sign_('appDutyPrincipalName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" />										
									</td>									
									<td align="right">批准时间：</td>
									<td colspan="2">
									  <input name="appDutyPrincipalTime" allowInput="false" id="appDutyPrincipalTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" />
									</td>
								  </tr>
								  <tr>
									<td colspan="6" style="height: 28px;">10.工作结束：全部工作于
										<input name="endDutyPrincipalTime" allowInput="false" id="endDutyPrincipalTime" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" /> 结束，工作人员已全部撤离，现场已清理完毕。
									</td>
								  </tr>
								  <tr>
									<td align="right">工作负责人签名：</td>
									<td colspan="2">
									  <input name="endWorkLeader" id="endWorkLeaderName_" textName="endWorkLeaderName" onbuttonclick="sign_('endWorkLeaderName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" /> 
									</td> 									
									<td align="right">运行值班签名：</td>
									<td colspan="2">
									  <input name="endDutyPrincipal" id="endDutyPrincipalName_" textName="endDutyPrincipalName" onbuttonclick="sign_('endDutyPrincipalName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" /> 
									</td>																	
								</tr>
								</table>
				               <!--  </div> --> <!--panel-->
				            </div> <!--mini-col-->
				        </div> <!--clearfix-->
				     </div> <!--container-->
				  </div> <!--editform-->
				 <jsp:include page="/WEB-INF/views/include/sign.jsp"></jsp:include>		       
	    </div>       
 </div>
<!-- 新流程方式引入 -->
<sys:workflow flowKey="woWtTask"></sys:workflow>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>
	<script type="text/javascript" src="${ctxStatic}/common/exportSelectFieldFile.js?v=<%=System.currentTimeMillis() %>"></script>
<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"WoWtTask",
				dataUrl:"${ctx}/wo-wt/wo/woWtTask/data",
				getUrl:"${ctx}/wo-wt/wo/woWtTask/get",
				saveUrl:"${ctx}/wo-wt/wo/woWtTask/save",
				removeUrl:"${ctx}/wo-wt/wo/woWtTask/remove",
				exportUrl:"${ctx}/wo-wt/wo/woWtTask/export",
				initInsertUrl : "${ctx}/wo-wt/wo/woWtTask/initInsert",
				onAfterLoadRecord: onAfterLoadRecord
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
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
	 var id = mini.get("id").getValue();
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
        if (menuItem.menuNo == "WoWtForm2") { //打印预览
        	if (id == "" || id == null) {
				mini.alert("请先保存再点击打印按钮！");
				return;
			}
            window.open("${ctx}/wo-wt/wo/woWtTask/viewWoWtTask?action=new&id="+id);
        }else if(menuItem.menuNo == "relateDefect"){
			relateDefect();
	   	 }else if(menuItem.menuNo == "linkDefect"){
	   			linkDefect();
	   	 }
     }else{
        menuItem=e.item;
     }
     
   }
   
   function afterLoad(){
	  var procInsId = mini.get("procInsId").getValue();
	  var workLeader = mini.get("workLeader").getValue();
	// _loadEditLimit(procInsId,"woWtTask","node1",workLeader);

   }
   function flowAction(){
	  return _submitValidate();
   }
   //////////子表格操作菜单项点击事件方法/////////

   function addButton(){
	 sysToolBar_.addButtonOption({
		"buttonId":'test',
		"functionStr":'test',/* 对应按钮的点击事件 */
		/* "gridId":"gridSmCheckQuestion", *//* 对应具体的列表，默认给明细 */
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
   
   function onAfterLoadRecord(o) {	   
       wfAfterLoad(o);
   }
   
   editControl.loadEditList('woWtTask');
</script>
</body>
</html>