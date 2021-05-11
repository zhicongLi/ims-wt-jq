<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>隐患</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
<%--<div class="mini-fit">
	<div id="_splTreeMain" class="mini-splitter" style="width:100%;height:100%;">
	    <div size="240" showCollapseButton="true" style="overflow:auto;">
             <sys:treewithsearchbar dataUrl="${ctx}/ims-check${ims_check_suffix}/sm/smHideDanger/allData" idField="id" valueField="id" textField="name" parentField="parentId" textFieldLabel="名称"></sys:treewithsearchbar>
	    </div>

		<div showCollapseButton="true">--%>
					<div class="mini-fit">
					<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
						<div title="列表" id="tabList"  style="border: 0px;"  >
								 <sys:toolbargridmain objId="SmHideDanger" permissionEdit="sm:smHideDanger:edit"></sys:toolbargridmain>
								 <sys:searchadv></sys:searchadv>
								 <div class="mini-fit">
									<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-check${ims_check_suffix}/sm/smHideDanger/data" idField="id"
										 allowResize="true" pageSize="20"
										 allowCellSelect="true" multiSelect="false"
										 editNextOnEnterKey="true"  editNextRowCell="true"
										 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
									>
										<div property="columns">
											<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
												<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" visible="false">编码
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="checkId"  field="checkId" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">安全检查id
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="checkId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="checkQuestionId"  field="checkQuestionId" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">安全检查问题id
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="checkQuestionId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="title"  field="title" vtype=""  headerAlign="center" allowSort="true" width="255" >隐患名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="title-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="reportBy"  field="reportBy" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">发现人id
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="reportBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="reportByName"  field="reportByName" vtype=""  headerAlign="center" allowSort="true" width="100" >发现人名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="reportByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="reportDate"  field="reportDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >发现时间
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="reportDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
											<div type="comboboxcolumn" autoShowPopup="true" name="types"  field="types" headerAlign="center" allowSort="true" width="120" >隐患类型
												<input property="editor" class="mini-combobox"  textField="label" valueField="value"  style="width:100%;"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_danger_types" />
												<input
														id="types-Filter" name="mini-column-filter"
														property="filter" class="mini-combobox" style="width: 100%;"
														url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_danger_types"
														multiSelect="true" style="width: 100%;"
														onvaluechanged="onFilterChanged" valueField="value"
														textField="label" showClose="true"
														oncloseclick="onFilterClose(this)" />
											</div>
											<div type="comboboxcolumn" autoShowPopup="true" name="levels"  field="levels" headerAlign="center" allowSort="true" width="120" >隐患级别
												<input property="editor" class="mini-combobox"  textField="label" valueField="value"  style="width:100%;"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_danger_level" />
												<input
														id="levels-Filter" name="mini-column-filter"
														property="filter" class="mini-combobox" style="width: 100%;"
														url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_danger_level"
														multiSelect="true" style="width: 100%;"
														onvaluechanged="onFilterChanged" valueField="value"
														textField="label" showClose="true"
														oncloseclick="onFilterClose(this)" />
											</div>
												<div name="orgLevel"  field="orgLevel" vtype=""  headerAlign="center" allowSort="true" width="64" >级别
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="orgLevel-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="respDeptId"  field="respDeptId" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">责任部门
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="respDeptId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="respDeptName"  field="respDeptName" vtype=""  headerAlign="center" allowSort="true" width="100" >责任部门名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="respDeptName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="respId"  field="respId" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">责任人
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="respId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="respName"  field="respName" vtype=""  headerAlign="center" allowSort="true" width="100" >责任人名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="respName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="appBy"  field="appBy" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">审批人
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="appBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="appName"  field="appName" vtype=""  headerAlign="center" allowSort="true" width="100" >审批人名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="appName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="appDate"  field="appDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >审批时间
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="appDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="measure"  field="measure" vtype=""  headerAlign="center" allowSort="true" width="500" >治理措施
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="measure-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="result"  field="result" vtype=""  headerAlign="center" allowSort="true" width="100" >治理结果
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="result-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="handleBy"  field="handleBy" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">治理人
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="handleBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="handleByName"  field="handleByName" vtype=""  headerAlign="center" allowSort="true" width="100" >治理人名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="handleByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="handleDate"  field="handleDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >治理时间
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="handleDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="handleNote"  field="handleNote" vtype=""  headerAlign="center" allowSort="true" width="500" >治理说明
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="handleNote-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="checkOpinion"  field="checkOpinion" vtype=""  headerAlign="center" allowSort="true" width="100" >验收意见
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="checkOpinion-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="checkBy"  field="checkBy" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">验收人
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="checkBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="checkByName"  field="checkByName" vtype=""  headerAlign="center" allowSort="true" width="100" >验收人名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="checkByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="checkDate"  field="checkDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >验收时间
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="checkDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="checkNote"  field="checkNote" vtype=""  headerAlign="center" allowSort="true" width="500" >验收记录
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="checkNote-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="status"  field="status" vtype=""  headerAlign="center" allowSort="true" width="64" >状态
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="status-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
									</div>
								</div>
							 </div>
						</div>
						<div title="明细" id="tabForm"  style="border: 0px;"  >
							<sys:toolbarformmain permissionEdit="sm:smHideDanger:edit"></sys:toolbarformmain>
									<div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
											<input class="mini-hidden" name="id" id="id"/>
											<input class="mini-hidden" name="checkId" id="checkId"/><%--安全检查id--%>
											<input class="mini-hidden" name="checkQuestionId" id="checkQuestionId"/><%--安全检查问题id--%>
											<input class="mini-hidden" name="reportByName" id="reportByName"/><%--发现人名称--%>
									        <input class="mini-hidden" name="respName" id="respName"/><%--责任人名称--%>
									   		<input class="mini-hidden" name="appName" id="appName"/><%--审批人名称--%>
											<input class="mini-hidden" name="handleByName" id="handleByName"/><%--治理人名称--%>
											<input class="mini-hidden" name="checkByName" id="checkByName"/><%--验收人名称--%>
											<input class="mini-hidden" name="respDeptName" id="respDeptName"/><%--责任部门名称--%>
											<table border="0" cellpadding="3" cellspacing="3" >
												<tr>
													<td style="text-align:right;">隐患名称：</td>
													<td>
													   <input name="title" id="title" class="mini-textbox"  vtype = ""  required="false" />
													</td>

													<td style="text-align:right;">发现人名称：</td>
													<td>
														<input name="reportBy" id="reportBy" textName="reportByName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
															   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smUserList',850,500,'id,name','reportBy,reportByName')"   />
													</td>

												</tr>
												<tr>
													<td style="text-align:right;">发现时间：</td>
													<td>
														<input name="reportDate" id="reportDate" class="mini-datepicker" showtime="true" format="yyyy-MM-dd HH:mm:ss" timeformat="HH:mm:ss" vtype = ""  required="false" />
													</td>

													<td style="text-align:right;">隐患类型：</td>
													<td>
													   <input name="types" id="types" class="mini-combobox"  vtype = ""  required="false" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_danger_types" />
													</td>
												</tr>
												<tr>
													<td style="text-align:right;">隐患级别：</td>
													<td>
													   <input name="levels" id="levels" class="mini-combobox"  vtype = ""  required="false" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_danger_level" />
													</td>

													<td style="text-align:right;">级别：</td>
													<td>
													   <input name="orgLevel" id="orgLevel" class="mini-textbox"  vtype = ""  required="false" />
													</td>

												</tr>
												<tr>


												</tr>
										</table>
									</div>
									<div class="mini-panel" title="责任情况" width="auto" height="auto"
										 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

									>
										<table>
												<tr>
													<td style="text-align:right;">责任部门名称：</td>
													<td>
														<input name="respDeptId" id="respDeptId" textName="respDeptName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
															   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smOrgList',850,500,'id,name','respDeptId,respDeptName')"   />
													</td>
													<td style="text-align:right;">责任人名称：</td>
													<td>
														<input name="respId" id="respId" textName="respName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
															   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smUserList',850,500,'id,name','respId,respName')"   />
													</td>
												</tr>
												<tr>
													<td style="text-align:right;">审批人名称：</td>
													<td>
														<input name="appBy" id="appBy" textName="appName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
															   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smUserList',850,500,'id,name','appBy,appName')"   />
													</td>

													<td style="text-align:right;">审批时间：</td>
													<td>
														<input name="appDate" id="appDate" class="mini-datepicker" showtime="true" format="yyyy-MM-dd HH:mm:ss" timeformat="HH:mm:ss" vtype = ""  required="false" />
													</td>

												</tr>
									</table>
								</div>
								<div class="mini-panel" title="治理情况" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
									<table>
												<tr>
													<td style="text-align:right;">治理措施：</td>
													<td>
													   <input name="measure" id="measure" class="mini-textbox"  vtype = ""  required="false" />
													</td>
													<td style="text-align:right;">治理结果：</td>
													<td>
													   <input name="result" id="result" class="mini-textbox"  vtype = ""  required="false" />
													</td>

												</tr>
												<tr>
													<td style="text-align:right;">治理人名称：</td>
													<td>
														<input name="handleBy" id="handleBy" textName="handleByName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
															   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smUserList',850,500,'id,name','handleBy,handleByName')"   />
													</td>

													<td style="text-align:right;">治理时间：</td>
													<td>
														<input name="handleDate" id="handleDate" class="mini-datepicker" showtime="true" format="yyyy-MM-dd HH:mm:ss" timeformat="HH:mm:ss" vtype = ""  required="false" />
													</td>
												</tr>
												<tr>
													<td style="text-align:right;">治理说明：</td>
													<td>
													   <input name="handleNote" id="handleNote" class="mini-textbox"  vtype = ""  required="false" />
													</td>

												</tr>
									</table>
								</div>
								<div class="mini-panel" title="验收情况" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
									<table>
												<tr>
													<td style="text-align:right;">验收意见：</td>
													<td>
													   <input name="checkOpinion" id="checkOpinion" class="mini-textbox"  vtype = ""  required="false" />
													</td>


													<td style="text-align:right;">验收人名称：</td>
													<td>
														<input name="checkBy" id="checkBy" textName="checkByName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
															   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smUserList',850,500,'id,name','checkBy,checkByName')"   />
													</td>
												</tr>
												<tr>
													<td style="text-align:right;">验收时间：</td>
													<td>
													   <input name="checkDate" id="checkDate" class="mini-datepicker" showtime="true" format="yyyy-MM-dd HH:mm:ss" timeformat="HH:mm:ss" vtype = ""  required="false" />
													</td>


													<td style="text-align:right;">验收记录：</td>
													<td>
													   <input name="checkNote" id="checkNote" class="mini-textbox"  vtype = ""  required="false" />
													</td>
												</tr>
										        <tr>
													<td style="text-align:right;">状态：</td>
													<td>
													   <input name="status" id="status" class="mini-textbox"  vtype = ""  required="false" />
													</td>

												</tr>

												<tr>
												</tr>
											</table>
				                </div> <!--panel-->
				            </div> <!--mini-col-->
				        </div> <!--clearfix-->
				     </div> <!--container-->
				  </div> <!--editform-->
									<div class="mini-fit">
											 <div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
											 </div>
									</div><!--fit-->

							 </div><!--fit-->

						</div>

					</div>
					</div>
	<%--    </div>
	</div>

</div>--%>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SmHideDanger",
			    treeFilter:"",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
			    treeParentField:"parentId",
				dataUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smHideDanger/data",
				getUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smHideDanger/get",
				saveUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smHideDanger/save",
				removeUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smHideDanger/remove",
				exportUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smHideDanger/export"
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
						label: '编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_by_name',
						label: '创建人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.tenant_id',
						label: '租户id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_by',
						label: '创建人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_dept',
						label: '创建部门',
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
						id: 'a.update_by_name',
						label: '修改人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.update_by',
						label: '修改人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.update_date',
						label: '修改时间',
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
						id: 'a.site_id',
						label: '站点id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.remarks',
						label: '备注',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.check_id',
						label: '安全检查id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.check_question_id',
						label: '安全检查问题id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.title',
						label: '隐患名称',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.report_by',
						label: '发现人id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.report_by_name',
						label: '发现人名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.report_date',
						label: '发现时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.types',
						label: '隐患类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.levels',
						label: '隐患级别',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.org_level',
						label: '级别',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.resp_dept_id',
						label: '责任部门',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.resp_dept_name',
						label: '责任部门名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.resp_id',
						label: '责任人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.resp_name',
						label: '责任人名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.app_by',
						label: '审批人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.app_name',
						label: '审批人名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.app_date',
						label: '审批时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.measure',
						label: '治理措施',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.result',
						label: '治理结果',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.handle_by',
						label: '治理人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.handle_by_name',
						label: '治理人名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.handle_date',
						label: '治理时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.handle_note',
						label: '治理说明',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.check_opinion',
						label: '验收意见',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.check_by',
						label: '验收人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.check_by_name',
						label: '验收人名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.check_date',
						label: '验收时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_note',
						label: '验收记录',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.status',
						label: '状态',
						type: 'string',
						default_value: '',
						size: 64
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
</script>
</body>
</html>