<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<html>
<head>
	 <title>缺陷票</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>	
	 <link href="${ctxStatic}/static/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
     <script type="text/javascript" src="${ctxStatic}/static/common/sysToolBar.js"></script>
     <script type="text/javascript" src="${ctxStatic}/static/common/editControl.js"></script>
      <jsp:include page="/WEB-INF/views/modules/wo/wt/borderCss.jsp"></jsp:include>
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="WoDefect" permissionEdit="wo:woDefect:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/wo-wt/wo/woDefect/data" idField="id"
					 allowResize="true" pageSize="20"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="100" visible="false">id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="code"  field="code" vtype=""  headerAlign="center" allowSort="true" width="150" >缺陷编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="code-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>							
							<div name="defectLevel" field="defectLevel" vtype="" type="comboboxcolumn" headerAlign="center" allowSort="true" width="150" sortField="a.status">缺陷类别
								<input property="editor" class="mini-combobox" style="width: 100%;" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_defect_level" /> 
								<input id="defectLevel-Filter" name="mini-column-filter" property="filter" class="mini-combobox" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_defect_level" multiSelect="true" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
							</div>							
							<div name="specId"  field="specId" vtype=""  headerAlign="center" align="center" allowSort="false" type="comboboxcolumn" width="100" 	>专业
								<input property="editor" class="mini-combobox"  style="width:100%;" valueField="id" textField="name" url="${ctx}/ims-iam-ext/pg/pgSpec/data?&baseFilter=a.group_id='1' and a.code in ('1001','1002','1004','1006','1007','1008')&pageSize=100"/>
								<input id="specId-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" multiSelect="true" valueField="id" textField="name"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" url="${ctx}/ims-iam-ext/pg/pgSpec/data?&baseFilter=a.group_id='1' and a.code in ('1001','1002','1004','1006','1007','1008')&pageSize=100"
								/>
							</div>
							<div name="status" field="status" vtype="" type="comboboxcolumn" headerAlign="center" allowSort="true" width="100" sortField="a.status">状态
								<input property="editor" class="mini-combobox" style="width: 100%;" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_defect_status" /> 
								<input id="status-Filter" name="mini-column-filter" property="filter" class="mini-combobox" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_defect_status" multiSelect="true" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
							</div>														
							<div name="plantUnit" field="plantUnit" vtype="" type="comboboxcolumn" headerAlign="center" allowSort="true" width="100" sortField="a.status">机组
								<input property="editor" class="mini-combobox" style="width: 100%;" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_plant_unit" /> 
								<input id="plantUnit-Filter" name="mini-column-filter" property="filter" class="mini-combobox" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_plant_unit" multiSelect="true" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
							</div>
							<div name="details"  field="details" vtype=""  headerAlign="center" allowSort="true" width="500" >缺陷内容
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="details-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="reportBy"  field="reportBy" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">发现人id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="reportBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="reportByName"  field="reportByName" vtype=""  headerAlign="center" allowSort="true" width="100" >发现人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="reportByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="reportDate"  field="reportDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="150" >发现时间
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="reportDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="reportOrg"  field="reportOrg" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">发现班组
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="reportOrg-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="reportOrgName"  field="reportOrgName" vtype=""  headerAlign="center" allowSort="true" width="200" >发现班组
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="reportOrgName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="reportDept"  field="reportDept" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">发现部门
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="reportDept-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="reportDeptName"  field="reportDeptName" vtype=""  headerAlign="center" allowSort="true" width="200" >发现部门
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="reportDeptName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>							
							<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="100" >备注
								<input property="editor" class="mini-textarea" style="width:100%;"  />
								<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="leader"  field="leader" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">消缺负责人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="leader-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="leaderName"  field="leaderName" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">消缺负责人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="leaderName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="finishDate"  field="finishDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" visible="false">消缺完成时间
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="finishDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="finishRes"  field="finishRes" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">消缺内容
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="finishRes-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="finishMeasures"  field="finishMeasures" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">采取措施
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="finishMeasures-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="checkBy2"  field="checkBy2" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">点检验收人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="checkBy2-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="checkByName2"  field="checkByName2" vtype=""  headerAlign="center" allowSort="true" width="100" >点检验收人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="checkByName2-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="checkDate2"  field="checkDate2" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="150" >点检验收时间
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="checkDate2-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="checkNote2"  field="checkNote2" vtype=""  headerAlign="center" allowSort="true" width="200" >点检验收意见
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="checkNote2-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="checkBy1"  field="checkBy1" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">运行验收人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="checkBy1-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="checkByName1"  field="checkByName1" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">运行验收人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="checkByName1-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="checkDate1"  field="checkDate1" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" visible="false">运行验收时间
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="checkDate1-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="checkNote1"  field="checkNote1" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">运行验收意见
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="checkNote1-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>							
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="wo:woDefect:edit"></sys:toolbarformmain>
                  <div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"
								>
									<input class="mini-hidden" name="id" id="id"/>
									<!-- 发现人所属公司 -->
									<input class="mini-hidden" name="reportByCompany" id="reportByCompany"/>
									<!-- 专业编码 -->
									<input class="mini-hidden" name="specCode" id="specCode"/>
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
											<td style="text-align:right;letter-spacing: 3px;">缺陷单号：</td>
											<td>
											   <input name="code" id="code"  style="width:200px"  class="mini-textbox"  vtype = ""  required="false" readonly="readonly"/>
											</td>
											<td style="text-align:right;">缺陷类别：</td>
											<td >
											   <input name="defectLevel" id="defectLevel" class="mini-combobox" style="width:200px" allowInput="" valueFromSelect="false" required="false" valueField="value" textField="label"   url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_defect_level" />
											</td>
											<td style="text-align:right;">所属专业：</td>																		
											<%-- <td colspan="3">
											  <input name="specId" id="specId" textName="specName" class="mini-buttonedit"  required="false" allowInput="false" width="200px"
												onbuttonclick="popLov(this,'选择专业',false,true,'${ctxRoot}/form?view=pg/pgSpecList&groupId=1',850,500,'id,name,code','specId,specName,specCode')" />
											</td>  --%>
											<td colspan="3">
											  <input name="specId" id="specId" textName="specName" class="mini-buttonedit"  required="false" allowInput="false" width="200px"
												onbuttonclick="selectSpec" />
											</td> 
											<!-- <td>
											   <input name="specId" id="specId" class="mini-combobox" vtype = ""  required="false" onvaluechanged="changeSpec" valueField="id"  textField="text" data='[{"id":"0","text":"个人"},{"id":"1","text":"班组"}]'/>
											</td> -->											
											
										</tr>
										<tr>											
											<td style="text-align:right;">机组：</td>
											<td>
											   <input name="plantUnit" id="plantUnit" style="width:200px" class="mini-combobox" allowInput="false" valueFromSelect="false" required="false" valueField="value" textField="label"   vtype = ""   url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_plant_unit"/>
											</td>
											<td style="text-align:right;">状态：</td>
											<td colspan="5">
											   <input name="status" id="status" style="width:200px" class="mini-combobox" allowInput="false"  required="false" valueField="value" textField="label"  vtype = ""  url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_defect_status" />
											</td>
										</tr>
								
										<tr>
											<td style="text-align:right;">缺陷内容：</td>
											<td colspan="7">
											   <input  name="details" id="details" class="mini-textarea" style="width: 100%"  vtype = "" required="false" />
											</td>																								
										</tr>																										
									</table>	
				                </div> <!--panel-->
				            
				                <div class="mini-panel" title="发现信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">									
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
											<td style="text-align:right;letter-spacing: 7px;">发现人：</td>
											<td>
											   <input name="reportBy" id="reportBy"class="mini-buttonedit"  vtype = "" required="false" style="width:200px" allowInput="false" textName="reportByName" readonly="readonly"
											    onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','reportBy,reportByName')" />
											</td>
											<td style="text-align:right;">发现时间：</td>
											<td>
											   <input name="reportDate" id="reportDate" style="width:200px" class="mini-datepicker" showTime="true"  vtype = "" format="yyyy-MM-dd HH:mm:ss" required="false" allowInput="false"  style="width:180px;"/>
											</td>
											<td style="text-align:right;">发现班组：</td>
											<td>
												<input name="reportOrg" id="reportOrg" textName="reportOrgName" class="mini-buttonedit"  vtype = ""  required="false" style="width:200px" allowInput="false" readonly="readonly"
												onbuttonclick="popLov(this,'选择发现班组',false,true,'${ctxRoot}/form?view=sys/sysOrgList&classId=0',850,500,'orgId,orgName','reportOrg,reportOrgName')"   />
											</td>											
											<td style="text-align:right;">发现部门：</td>
											<td>
												<input name="reportDept" id="reportDept" textName="reportDeptName" class="mini-buttonedit"  vtype = ""  style="width:200px" required="false"  allowInput="false" readonly="readonly"
												onbuttonclick="popLov(this,'选择发现部门',false,true,'${ctxRoot}/form?view=sys/sysOrgList',850,500,'orgId,orgName','reportDept,reportDeptName')"   />
											</td>											
										</tr>
									</table>									
								</div>
				            
				                <div class="mini-panel" title="接收人" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">									 
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
											<td style="text-align:right;letter-spacing: 7px;">接收人：</td>
											<td>
											   <input name="reception" id="reception"class="mini-buttonedit"  vtype = "" required="false" style="width:200px" allowInput="false" textName="receptionName" 
											    onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/sysMisUserList&likeParentId=1&orgId=2000',850,500,'id,name','reception,receptionName')" onvaluechanged="update(this)"/>
											</td>
											<td style="text-align:right;">接收时间：</td>
											<td>
											   <input name="receptionDate" id="receptionDate" style="width:200px" class="mini-datepicker" showTime="true"  vtype = "" format="yyyy-MM-dd HH:mm:ss" required="false" allowInput="false"  style="width:180px;"/>
											</td>
											<td style="text-align:right;">接收班组：</td>
											<td>
												<input name="receptionOrg" id="receptionOrg" textName="receptionOrgName" class="mini-buttonedit"  vtype = ""  required="false" style="width:200px" allowInput="false" readonly="readonly"
												onbuttonclick="popLov(this,'选择发现班组',false,true,'${ctxRoot}/form?view=sys/sysOrgList&classId=0',850,500,'orgId,orgName','receptionOrg,receptionOrgName')"   />
											</td>											
											<td style="text-align:right;">接收部门：</td>
											<td>
												<input name="receptionDept" id="receptionDept" textName="receptionDeptName" class="mini-buttonedit"  vtype = ""  style="width:200px" required="false"  allowInput="false" readonly="readonly"
												onbuttonclick="popLov(this,'选择发现部门',false,true,'${ctxRoot}/form?view=sys/sysOrgList',850,500,'orgId,orgName','receptionDept,receptionDeptName')"   />
											</td>											
										</tr>
									</table>									
								</div>
								
								<div class="mini-panel" title="检修消缺总结" width="auto" height="auto" id="clearDefect"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
											<td style="text-align:right;">工作负责人：</td>
											<td>
											   <input name="leader" id="leader"class="mini-buttonedit"  vtype = "" required="false" style="width:200px" allowInput="false" textName="leaderName" 
											   onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','leader,leaderName')" />
											</td>											
											<td style="text-align:right;">完成时间：</td>		
											<td colspan="5">
											   <input name="finishDate" id="finishDate" style="width:200px" class="mini-datepicker" showTime="true"  vtype = "" format="yyyy-MM-dd HH:mm:ss"  required="false" allowInput="false" />
											</td>																						
										</tr>
										<tr>
											<td style="text-align:right;">消缺内容：</td>
											<td  colspan="7">
											   <input name="finishRes" id="finishRes" class="mini-textarea"  vtype = "" style="width: 160%"  required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">采取措施：</td>
											<td colspan="7">
												<input name="finishMeasures" id="finishMeasures" class="mini-textarea"  required="false" width="160%"/>
											</td>
										</tr>
									</table>
								</div>
								
								<div class="mini-panel" title="点检验收" width="auto" height="auto" id="check2Panel"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
											<td style="text-align:right;letter-spacing: 7px;">验收人：</td>
											<td>
											   <input name="checkBy2" id="checkBy2" class="mini-buttonedit"  vtype = "" required="false" style="width:200px" allowInput="false" textName="checkByName2"
											   	onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','checkBy2,checkByName2')" />
											</td>
											<td style="text-align:right;">验收时间：</td>
											<td colspan="5">
											   <input name="checkDate2" id="checkDate2" style="width:200px" class="mini-datepicker" showTime="true"  vtype = "" format="yyyy-MM-dd HH:mm:ss"  required="false" allowInput="false" />
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">验收意见：</td>
											<td colspan="7">
											   <input name="checkNote2" id="checkNote2" class="mini-textarea" style="width: 160%"  required="false" />
											</td>
										</tr>

									</table>
								</div>
								
								<div class="mini-panel" title="运行验收" width="auto" height="auto" id="runCheckPanel"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
									<table border="0" cellpadding="3" cellspacing="3" >																			
										<tr>
											<td style="text-align:right;letter-spacing: 7px;">验收人：</td>		
											<td>
											   <input style="width:200px"  name="checkBy1" id="checkBy1" class="mini-buttonedit"  vtype = "" required="false" width="180px" allowInput="false" textName="checkByName1"
											   	onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/misUserList',850,500,'id,name','checkBy1,checkByName1')" />
											</td>
											<td style="text-align:right;">验收时间：</td>
											<td colspan="5">
											   <input style="width:200px"  name="checkDate1" id="checkDate1" class="mini-datepicker" showTime="true"  vtype = "" format="yyyy-MM-dd HH:mm:ss"  required="false" allowInput="false" />
											</td>																						
										</tr>		
										<tr>
											<td style="text-align:right;">验收意见：</td>
											<td  colspan="7">
											   <input name="checkNote1" id="checkNote1" class="mini-textarea"  required="false" style="width:160%"/>
											</td>
										</tr>
									</table>
								</div>
								
				            
				            </div> <!--mini-col-->
				        </div> <!--clearfix-->
				     </div> <!--container-->
				  </div> <!--editform-->
		        <div class="mini-fit">
						 <div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
						 </div>
		        </div><!--fit-->

	    </div>

    <div title="附件" id="tabWoProcessList"   style="border: 0px;"  >  
	     <sys:toolbargriddoc girdId="dgTestSub1" permissionEdit="wo:woDefect:edit" objKeyField="id" objDescrField="name" objType="woDefect"></sys:toolbargriddoc>
         <div class="mini-fit">
             <sys:griddoc girdId="dgTestSub1"></sys:griddoc>
         </div>				
	</div> 
</div>
<!-- 新流程方式引入 flowKey对应流程Key -->
<sys:workflow flowKey="woDefect"></sys:workflow>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>
<sys:docAttach girdId="dgTestSub1"></sys:docAttach>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"WoDefect",
			    masterKeyField : "id",
				dataUrl:"${ctx}/wo-wt/wo/woDefect/data",
				getUrl:"${ctx}/wo-wt/wo/woDefect/get",
				saveUrl:"${ctx}/wo-wt/wo/woDefect/save",
				removeUrl:"${ctx}/wo-wt/wo/woDefect/remove",
				exportUrl:"${ctx}/wo-wt/wo/woDefect/export",
				initInsertUrl : "${ctx}/wo-wt/wo/woDefect/initInsert",	
				onAfterNewRecord:addNewReword,
	            onAfterLoadRecord: onAfterLoadRecord,          
	            onBeforeSaveCheck: onBeforeSaveCheck
	           
	           
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
	                    [
	                  	  {//文档附件 
	                            id:"dgTestSub1",
	                            cascade:true,
	                            //fileTypes:"*.*",
	                            folder:"woDefect",                           
	                            FKLinks: [
	                                {FK: "objKey", masterKeyField: "id"},
	                                {FK: "objType", masterKeyField: "(\"woDefect\")"}
	                            ],
	                            cascadeNoClone: true,
	                            dataUrl:"${ctx}/ims-ext/dm/dmDoc/data",
	                            getUrl:"${ctx}/ims-ext/dm/dmDoc/get",
	                            saveUrl:"${ctx}/ims-ext/dm/dmDoc/save",
	                            removeUrl:"${ctx}/ims-ext/dm/dmDoc/remove",
	                            exportUrl:"${ctx}/ims-ext/dm/dmDoc/export",
	                            onDocActionRenderer:onDocActionRenderer
	                        } 
	                  ]
	);

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: 'id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.code',
						label: '缺陷编号',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.defect_level',
						label: '缺陷类别',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.spec_id',
						label: '专业id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.spec_name',
						label: '专业',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.status',
						label: '状态',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.plant_unit',
						label: '机组',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.details',
						label: '缺陷内容',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.report_by',
						label: '发现人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.report_by_name',
						label: '发现人名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.report_date',
						label: '发现时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.report_org',
						label: '发现班组',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.report_org_name',
						label: '发现班组名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.report_dept',
						label: '发现部门',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.report_dept_name',
						label: '发现部门名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.maint_org',
						label: '消缺班组',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.maint_org_name',
						label: '消缺班组名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.plan_start_date',
						label: '计划消缺开始时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.plan_end_date',
						label: '计划消缺结束时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.remarks',
						label: '备注',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.leader',
						label: '消缺负责人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.leader_name',
						label: '消缺负责人名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.finish_date',
						label: '消缺完成时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.finish_res',
						label: '消缺内容',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.finish_measures',
						label: '采取措施',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_by2',
						label: '点检验收人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_by_name2',
						label: '点检验收人名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_date2',
						label: '点检验收时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_note2',
						label: '点检验收意见',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_by1',
						label: '运行验收人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_by_name1',
						label: '运行验收人名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_date1',
						label: '运行验收时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_note1',
						label: '运行验收意见',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.create_by',
						label: '创建人',
						type: 'string',
						default_value: '',
						size: 100
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
						size: 100
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
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }
   }
   //////////子表格操作菜单项点击事件方法/////////
   
  
   
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
   
   //编辑权限控制
   editControl.loadEditList('woDefect'); 
   
   
  
 //判断当前登录者是否匹配建票人，控制票面编辑控制
 function getReportBy(o){	
	 //当前登录者
	 var currUserId  = _currUser_.id
	 //发现人
	 var reportBy = o.reportBy;
	 if(currUserId==reportBy){
		 return true;
	 }else{
		 return false;
	 }
	
 }
  
function onfileselect(e){
     var docFileName = mini.get("docFileName");
     var filePath = e.sender.getValue()
     var fileName = extractFileName(filePath);
     docFileName.setValue(fileName);
}

function update(Obj){
   var idValue = mini.get(Obj.id).value;
   var iamCode = iamCodeValue();
   $.ajax({
          url:"${ctx}/ims-iam-ext/sys/sysUser/get",        
          data:{
          			"id":idValue,
          		     "iamCode":iamCode    		
          		},
          async:true,
          success: function (data) {       	  
          	var o = mini.decode(data);
             if(Obj.id=="reportBy"){
            	 mini.get("reportOrg").setValue(o.teamId);	            
	             mini.get("reportOrg").setText(o.teamName);	             
	             mini.get("reportDept").setValue(o.deptId);	           
	             mini.get("reportDept").setText(o.deptName);
            }else if(Obj.id=="reception"){
            	 mini.get("receptionOrg").setValue(o.teamId);	            
	             mini.get("receptionOrg").setText(o.teamName);	             
	             mini.get("receptionDept").setValue(o.deptId);	           
	             mini.get("receptionDept").setText(o.deptName);
           } 
          },
          error: function (jqXHR, textStatus, errorThrown) {
          }
      });  
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
      //发现人所属公司
      var reportByCompany =  mini.get("reportByCompany").getValue();  
      //专业编号
      var specCode =  mini.get("specCode").getValue();    
      //接收人
      var reception = mini.get("reception").getValue(); 
      var receptionName = mini.get("reception").getText(); 
      
      var data = {
        eventName: 'parentClickButton',
        alias: buttonId,
        flowVariables: {//定义流程变量                  
          "reportByCompany": reportByCompany || '',//发现人所属公司
          "specCode": specCode || '',//专业编号
          "reception":reception || ''
         },
        data: {}
      };
      sendBpmMsg(data);
      popBox(); 
    } 
 } 
 
 
//选择专业(只展示对应岗位有专业的)
function selectSpec() {

	popLov(
		this,
		'选择专业',
		false,
		true,
		"${ctxRoot}/form?view=pg/pgSpecList&baseFilter=a.group_id='1' and a.code in ('1001','1002','1004','1006','1007','1008')",
		800, 500, 'id,name,code','specId,specName,specCode');
}		
</script>
</body>
</html>