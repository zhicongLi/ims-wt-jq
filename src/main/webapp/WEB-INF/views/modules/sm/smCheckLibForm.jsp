<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>安全检查标准库</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="mini-fit">
	<div id="_splTreeMain" class="mini-splitter" style="width:100%;height:100%;">
	    <div size="240" showCollapseButton="true" style="overflow:auto;">
             <sys:treewithsearchbar dataUrl="${ctx}/ims-check${ims_check_suffix}/sm/smCheckLib/allData" idField="id" valueField="id" textField="name" parentField="parentId" textFieldLabel="名称"></sys:treewithsearchbar>
	    </div>

		<div showCollapseButton="true">
					<div class="mini-fit">
					<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
						<div title="列表" id="tabList"  style="border: 0px;"  >
								 <sys:toolbargridmain objId="SmCheckLib" permissionEdit="sm:smCheckLib:edit"></sys:toolbargridmain>
								 <sys:searchadv></sys:searchadv>
								 <div class="mini-fit">
									<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-check${ims_check_suffix}/sm/smCheckLib/data" idField="id"
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


												<div name="checkName"  field="checkName" vtype=""  headerAlign="center" allowSort="true" width="200" >安全检查标准名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="checkName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="content"  field="content" vtype=""  headerAlign="center" allowSort="true" width="300" >安全检查标准内容
													<input property="editor" class="mini-textarea" style="width:100%;"  />
													<input id="content-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div type="comboboxcolumn" autoShowPopup="true" name="types"  field="types" headerAlign="center" allowSort="true" width="120" >安全检查标准类型
													<input property="editor" class="mini-combobox"  textField="label" valueField="value"  style="width:100%;"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_checkstandard_types" />
													<input
															id="types-Filter" name="mini-column-filter"
															property="filter" class="mini-combobox" style="width: 100%;"
															url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_checkstandard_types"
															multiSelect="true" style="width: 100%;"
															onvaluechanged="onFilterChanged" valueField="value"
															textField="label" showClose="true"
															oncloseclick="onFilterClose(this)" />
												</div>
												<div type="comboboxcolumn" autoShowPopup="true" name="source"  field="source" headerAlign="center" allowSort="true" width="120" >安全检查标准来源
													<input property="editor" class="mini-combobox"  textField="label" valueField="value"  style="width:100%;"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_check_source" />
													<input
															id="source-Filter" name="mini-column-filter"
															property="filter" class="mini-combobox" style="width: 100%;"
															url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_check_source"
															multiSelect="true" style="width: 100%;"
															onvaluechanged="onFilterChanged" valueField="value"
															textField="label" showClose="true"
															oncloseclick="onFilterClose(this)" />
												</div>
												<div name="createByName"  field="createByName" vtype=""  headerAlign="center" allowSort="true" width="64" >编制人
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="createByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>

												<div name="createDate"  field="createDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >编制时间
													<input property="editor" class="mini-datepicker" style="width:100%;"  />
													<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<%--<div name="editBy"  field="editBy" vtype=""  headerAlign="center" allowSort="true" width="64" >编制人id
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="editBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="editByName"  field="editByName" vtype=""  headerAlign="center" allowSort="true" width="64" >编制人名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="editByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>--%>
									</div>
								</div>
							 </div>
						</div>
						<div title="明细" id="tabForm"  style="border: 0px;"  >
							<sys:toolbarformmain permissionEdit="sm:smCheckLib:edit"></sys:toolbarformmain>
									<div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
											<input class="mini-hidden" name="id" id="id"/>
											<table border="0" cellpadding="3" cellspacing="3" >
												<tr>
													<td style="text-align:right;">编制人：</td>
													<td>
													   <input name="createByName" id="createByName" class="mini-textbox"  vtype = "" readOnly="true" required="false" />
													</td>
													<td style="text-align:right;">编制时间：</td>
													<td>
														<input name="createDate" id="createDate" class="mini-datepicker"  dateFormat="yyyy-MM-dd HH:mm:ss" vtype = "" readOnly="true" required="false" />
													</td>



													<td style="text-align:right;">安全检查标准名称：</td>
													<td>
													   <input name="checkName" id="checkName" class="mini-textbox"  vtype = ""  required="false" />
													</td>

												</tr>
												<tr>
													<td style="text-align:right;">安全检查标准内容：</td>
													<td>
													   <input name="content" id="content" class="mini-textarea" vtype = ""  required="false"  />
													</td>
													<td style="text-align:right;">安全检查标准类型：</td>
													<td>
														<input name="types" id="types"  class="mini-combobox" vtype = "" required="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_checkstandard_types" />

													</td>
													<td style="text-align:right;">安全检查标准来源：</td>
													<td>
														<input name="source" id="source"  class="mini-combobox" vtype = "" required="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_check_source" />

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
											<div title="附件" id="tabOaWorkTaskDocList" style="border: 0px;">
						<sys:toolbargriddoc girdId="dgTestSub4"
							permissionEdit="sm:smCheckLib:edit" objKeyField="id"
							objDescrField="name" objType="SmCheckLib"></sys:toolbargriddoc>

						<div class="mini-fit">
							<sys:griddoc girdId="dgTestSub4"></sys:griddoc>
						</div>
					</div>
											 </div>
									</div><!--fit-->

							 </div><!--fit-->

						</div>

					</div>
					</div>
	    </div>
	</div>

</div>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>
<sys:docAttach girdId="dgTestSub4"></sys:docAttach>
<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SmCheckLib",
			    masterKeyField:"id",
			    treeFilter:"",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
			    treeParentField:"parentId",
				dataUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckLib/data",
				getUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckLib/get",
				saveUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckLib/save",
				removeUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckLib/remove",
				exportUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckLib/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
                    	  {
   	                        id:"dgTestSub4",
   	                        cascade:true,
                               fileTypes:"*.*",
                               folder:"sm",
   	                        FKLinks:[
   	                            {FK:"objKey",masterKeyField:"id"},
   	                            {FK:"objType",masterKeyField:"(\"SmCheckLib\")"}
   	                        ],
   	                        dataUrl:"${ctx}/ims-ext-lwq/dm/dmDoc/data",
   	                        getUrl:"${ctx}/ims-ext-lwq/dm/dmDoc/get",
   	                        saveUrl:"${ctx}/ims-ext-lwq/dm/dmDoc/save",
   	                        removeUrl:"${ctx}/ims-ext-lwq/dm/dmDoc/remove",
   	                        exportUrl:"${ctx}/ims-ext-lwq/dm/dmDoc/export"
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
						id: 'a.check_name',
						label: '安全检查标准名称',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.content',
						label: '安全检查标准内容',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.types',
						label: '安全检查标准类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.source',
						label: '安全检查标准来源',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.edit_by',
						label: '编制人id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.edit_by_name',
						label: '编制人名称',
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