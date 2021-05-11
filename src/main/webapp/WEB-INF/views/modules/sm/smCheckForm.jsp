<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>安全检查</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
	 <script type="text/javascript" src="${ctxStatic}/common/sysToolBar.js"></script>
</head>
<body>
<%--<div class="mini-fit">
	<div id="_splTreeMain" class="mini-splitter" style="width:100%;height:100%;">
	    <div size="240" showCollapseButton="true" style="overflow:auto;">
             <sys:treewithsearchbar dataUrl="${ctx}/ims-check${ims_check_suffix}/sm/smCheck/allData" idField="id" valueField="id" textField="name" parentField="parentId" textFieldLabel="名称"></sys:treewithsearchbar>
	    </div>--%>

		<%--<div showCollapseButton="true">--%>
					<div class="mini-fit">
					<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
						<div title="列表" id="tabList"  style="border: 0px;"  >
								 <sys:toolbargridmain objId="SmCheck" permissionEdit="sm:smCheck:edit"></sys:toolbargridmain>
								 <sys:searchadv></sys:searchadv>
								 <div class="mini-fit">
									<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-check${ims_check_suffix}/sm/smCheck/data" idField="id"
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
												<div name="title"  field="title" vtype=""  headerAlign="center" allowSort="true" width="255" >安全检查主题
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="title-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="content"  field="content" vtype=""  headerAlign="center" allowSort="true" width="100" >安全检查内容
													<input property="editor" class="mini-textarea" style="width:100%;"  />
													<input id="content-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div type="comboboxcolumn" autoShowPopup="true" name="types"  field="types" headerAlign="center" allowSort="true" width="120" >检查类型
													<input property="editor" class="mini-combobox"  textField="label" valueField="value"  style="width:100%;"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_check_type" />
													<input
															id="types-Filter" name="mini-column-filter"
															property="filter" class="mini-combobox" style="width: 100%;"
															url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_check_type"
															multiSelect="true" style="width: 100%;"
															onvaluechanged="onFilterChanged" valueField="value"
															textField="label" showClose="true"
															oncloseclick="onFilterClose(this)" />
												</div>
												<div name="hostDeptId"  field="hostDeptId" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">组织部门id
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="hostDeptId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="hostDeptName"  field="hostDeptName" vtype=""  headerAlign="center" allowSort="true" width="64" >组织部门名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="hostDeptName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="startDate"  field="startDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >检查开始时间
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="startDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="endDate"  field="endDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >检查结束时间
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="endDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="joinInDeptIds"  field="joinInDeptIds" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">参与部门ids
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="joinInDeptIds-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="joinInDeptNames"  field="joinInDeptNames" vtype=""  headerAlign="center" allowSort="true" width="100" >参与部门名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="joinInDeptNames-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="checkLibId"  field="checkLibId" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">安全检查库id
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="checkLibId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
									</div>
								</div>
							 </div>
						</div>
						<div title="明细" id="tabForm"  style="border: 0px;"  >
							<sys:toolbarformmain permissionEdit="sm:smCheck:edit"></sys:toolbarformmain>
									<div id="editform"  name="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
											<input class="mini-hidden" name="id" id="id"/>
									        <input class="mini-hidden" name="hostDeptName" id="hostDeptName"/><%--//组织部门--%>
									        <input class="mini-hidden" name="joinInDeptNames" id="joinInDeptNames"/><%--//参与部门--%>
									        <input class="mini-hidden" name="checkLibId" id="checkLibId"/><%--//安全检查库id--%>
											<table border="0" cellpadding="3" cellspacing="3" >
												<tr>
													<td style="text-align:right;">安全检查主题：</td>
													<td>
													   <input name="title" id="title" class="mini-textbox"  vtype = ""  required="false" />
													</td>
													<td style="text-align:right;">检查类型：</td>
													<td>
														<input name="types" id="types"  class="mini-combobox" vtype = "" required="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_check_type" />

													</td>
                                                    <td style="text-align:right;">组织部门名称：</td>
                                                    <td>
                                                        <input name="hostDeptId" id="hostDeptId" textName="hostDeptName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
                                                               onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smOrgList',850,500,'id,name','hostDeptId,hostDeptName')"   />
                                                    </td>
												</tr>
												<tr>
													<td style="text-align:right;">检查开始时间：</td>
													<td>
													   <input name="startDate" id="startDate" class="mini-datepicker" showtime="true" format="yyyy-MM-dd HH:mm:ss" timeformat="HH:mm:ss" vtype = ""  required="false" />
													</td>

													<td style="text-align:right;">检查结束时间：</td>
													<td>
													   <input name="endDate" id="endDate" class="mini-datepicker" showtime="true" format="yyyy-MM-dd HH:mm:ss" timeformat="HH:mm:ss" vtype = ""  required="false" />
													</td>
													<td style="text-align:right;">参与部门名称：</td>
													<td>
														<input name="joinInDeptIds" id="joinInDeptIds" textName="joinInDeptNames" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
															   onbuttonclick="popLov(this,'选择',true,true,'${ctxRoot}/form?view=sm/smOrgList',850,500,'id,name','joinInDeptIds,joinInDeptNames')"   />
													</td>
												</tr>
												<tr>
													<td style="text-align:right;">安全检查内容：</td>
													<td>
														<input name="content" id="content" class="mini-textarea"  vtype = ""  required="false"/>
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
													<div title="安全检查问题" name="tabSmCheckQuestionList"  style="border: 0px;"  >
														<sys:toolbargridsub girdId="gridSmCheckQuestion" permissionEdit="sm:smCheckQuestion:edit"></sys:toolbargridsub>
														<div class="mini-fit">
														<div id="gridSmCheckQuestion" class="mini-datagrid" style="width:100%;height:100%;"
															 url="${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/data" idField="id"
															 allowResize="true" pageSize="10"
															 allowCellSelect="true" allowCellEdit="false"
															 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
															 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
                                                             onrowdblclick="test"
														>
															<div property="columns">
																<div type="checkcolumn"></div>
																<div name="id"  field="id" readOnly="true"  vtype="required" headerAlign="center" allowSort="true"  width="64" visible="false">编码
																	<input property="editor" class="mini-textbox"  style="width:100%;"  />
																	<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild(this,'gridSmCheckQuestion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmCheckQuestion')"
																	/>
																</div>

																<div name="checkId" hideable="true" visible="false"  field="checkId" headerAlign="center" allowSort="true" width="150" visible="false">
																	<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
																</div>
																<div name="reportBy"  field="reportBy"   vtype="" headerAlign="center" allowSort="true"  width="64" visible="false">发现人
																	<input property="editor" class="mini-textbox"  style="width:100%;"  />
																	<input id="reportBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild(this,'gridSmCheckQuestion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmCheckQuestion')"
																	/>
																</div>
																<div name="reportByName"  field="reportByName"   vtype="" headerAlign="center" allowSort="true"  width="160" displayField="reportByName">发现人名称
																	<input property="editor"   textName="reportByName" class="mini-buttonedit"
																		   style="width:100%;"  vtype = ""  required="false" width="180px" allowInput="false"
																		   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smUserList',850,500,'id,name','reportBy,reportByName','gridSmCheckQuestion')"   />
																	<input id="reportByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild(this,'gridSmCheckQuestion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmCheckQuestion')"
																	/>
																</div>
																<div name="reportDept"  field="reportDept"   vtype="" headerAlign="center" allowSort="true"  width="64" visible="false">发现部门id
																	<input property="editor" class="mini-textbox"  style="width:100%;"  />
																	<input id="reportDept-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild(this,'gridSmCheckQuestion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmCheckQuestion')"
																	/>
																</div>
																<div name="reportDeptName"  field="reportDeptName"   vtype="" headerAlign="center" allowSort="true"  width="160" displayField="reportDeptName">发现部门名称
																	<input property="editor"   textName="reportDeptName" class="mini-buttonedit"
																		   style="width:100%;"  vtype = ""  required="false" width="180px" allowInput="false"
																		   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smOrgList',850,500,'id,name','reportDept,reportDeptName','gridSmCheckQuestion')"   />
																	<input id="reportDeptName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild(this,'gridSmCheckQuestion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmCheckQuestion')"
																	/>
																</div>
																<div name="reportDate"  field="reportDate"  dateFormat="yyyy-MM-dd HH:mm:ss" vtype="" headerAlign="center" allowSort="true"  width="100" >发现时间
																	<input property="editor" class="mini-datepicker" showtime="true" format="yyyy-MM-dd HH:mm:ss" timeformat="HH:mm:ss"  style="width:100%;"  />
																	<input id="reportDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild(this,'gridSmCheckQuestion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmCheckQuestion')"
																	/>
																</div>
																<div name="descrs"  field="descrs"   vtype="" headerAlign="center" allowSort="true"  width="500" >问题描述
																	<input property="editor" class="mini-textbox"  style="width:100%;"  />
																	<input id="descrs-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild(this,'gridSmCheckQuestion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmCheckQuestion')"
																	/>
																</div>
																<div name="dealBy"  field="dealBy"   vtype="" headerAlign="center" allowSort="true"  width="64" visible="false">处理人
																	<input property="editor" class="mini-textbox"  style="width:100%;"  />
																	<input id="dealBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild(this,'gridSmCheckQuestion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmCheckQuestion')"
																	/>
																</div>
																<div name="dealByName"  field="dealByName"   vtype="" headerAlign="center" allowSort="true"  width="160" displayField="dealByName">处理人名称
																	<input property="editor"   textName="dealByName" class="mini-buttonedit"
																		   style="width:100%;"  vtype = ""  required="false" width="180px" allowInput="false"
																		   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smUserList',850,500,'id,name','dealBy,dealByName','gridSmCheckQuestion')"   />
																	<input id="dealByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild(this,'gridSmCheckQuestion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmCheckQuestion')"
																	/>
																</div>
																<div name="dealDept"  field="dealDept"   vtype="" headerAlign="center" allowSort="true"  width="64" visible="false">处理部门
																	<input property="editor" class="mini-textbox"  style="width:100%;"  />
																	<input id="dealDept-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild(this,'gridSmCheckQuestion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmCheckQuestion')"
																	/>
																</div>
																<div name="dealDeptName"  field="dealDeptName"   vtype="" headerAlign="center" allowSort="true"  width="160" displayField="dealDeptName">处理部门名称
																	<input property="editor"   textName="dealDeptName" class="mini-buttonedit"
																		   style="width:100%;"  vtype = ""  required="false" width="180px" allowInput="false"
																		   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smOrgList',850,500,'id,name','dealDept,dealDeptName','gridSmCheckQuestion')"   />
																	<input id="dealDeptName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild(this,'gridSmCheckQuestion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmCheckQuestion')"
																	/>
																</div>
																<div name="dealDate"  field="dealDate"  dateFormat="yyyy-MM-dd HH:mm:ss" vtype="" headerAlign="center" allowSort="true"  width="100" >处理时间
																	<input property="editor" class="mini-datepicker" showtime="true" format="yyyy-MM-dd HH:mm:ss" timeformat="HH:mm:ss"  style="width:100%;"  />
																	<input id="dealDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild(this,'gridSmCheckQuestion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmCheckQuestion')"
																	/>
																</div>
																<div name="dealNote"  field="dealNote"   vtype="" headerAlign="center" allowSort="true"  width="500" >处理说明
																	<input property="editor" class="mini-textbox"  style="width:100%;"  />
																	<input id="dealNote-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild(this,'gridSmCheckQuestion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmCheckQuestion')"
																	/>
																</div>
																<div name="types"  field="types"   vtype="" headerAlign="center" allowSort="true"  width="64" >类型
																	<input property="editor" class="mini-textbox"  style="width:100%;"  />
																	<input id="types-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild(this,'gridSmCheckQuestion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmCheckQuestion')"
																	/>
																</div>


															</div>

														</div>
													 </div>
												  </div>
											 </div>
									</div><!--fit-->

							 </div><!--fit-->

						</div>

					</div>
					</div>
	  <%--  </div>
	</div>

</div>--%>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SmCheck",
			    treeFilter:"",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
			    treeParentField:"parentId",
			    masterKeyField:"id",
				dataUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheck/data",
				getUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheck/get",
				saveUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheck/save",
				removeUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheck/remove",
				exportUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheck/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                    {
		                 id:"gridSmCheckQuestion",
		                 objId:"SmCheckQuestion",
		                 FK:"checkId",
		                 cascade:true,
		                 cascadeVisible:true,
		                 tabName:"tabSmCheckQuestionList",
						 dataUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/data",
						 getUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/get",
						 saveUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/save",
						 removeUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/remove",
						 exportUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/export"
	                    }
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
						id: 'a.title',
						label: '安全检查主题',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.content',
						label: '安全检查内容',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.types',
						label: '检查类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.host_dept_id',
						label: '组织部门id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.host_dept_name',
						label: '组织部门名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.start_date',
						label: '检查开始时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.end_date',
						label: '检查结束时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.join_in_dept_ids',
						label: '参与部门ids',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.join_in_dept_names',
						label: '参与部门名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_lib_id',
						label: '安全检查库id',
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
   function onGridSubOpMiClick_SmCheckQuestion(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }

   }
   function addButton(){
		sysToolBar_.addButtonOption({
			"buttonId":'test',
			"functionStr":'test',
			"gridId":"gridSmCheckQuestion",
			"name":'测试'
		});
       sysToolBar_.bindClick("_tbgridSmCheckQuestion_add",addCheckQuestion,'');
	}
    function addCheckQuestion(){

          var form = new mini.Form("#editform");
          var data = form.getData();
         var checkId=data.id;//获取checkId
       // alert(checkId);
        mini.open({
            url: "${ctxRoot}/form?view=sm/smCheckQuestionForm&action=new&showList=0&checkId="+checkId,
            title: "新增", width: 800, height: 600,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "add",checkId:checkId};
                iframe.contentWindow.SetData(data);

            },
            ondestroy: function (action) {
                //var iframe = this.getIFrameEl();

                grid.reload();

            }
        });
        grid.reload();
    }
   function test(){
	   var grid = mini.get("gridSmCheckQuestion");
	   var row = grid.getSelected();
       if (row) {
           mini.open({
               url: "${ctxRoot}/form?view=sm/smCheckQuestionForm&action=view&showList=0&id="+row.id,
               title: "编辑", width: 800, height: 600,
               onload: function () {
                   var iframe = this.getIFrameEl();
                   var data = { action: "edit", id: row.id };
                   iframe.contentWindow.SetData(data);

               },
               ondestroy: function (action) {
                   //var iframe = this.getIFrameEl();

                   grid.reload();

               }
           });
           
       } else {
           alert("请选中一条记录");
       }
   }
   $(function(){
	   addButton();
   });
</script>
</body>
</html>