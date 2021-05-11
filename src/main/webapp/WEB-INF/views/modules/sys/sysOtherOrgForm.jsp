<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>其他组织机构表</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="mini-fit">
	<div id="_splTreeMain" class="mini-splitter" style="width:100%;height:100%;">
	    <div size="240" showCollapseButton="true" style="overflow:auto;">
             <sys:treewithsearchbar dataUrl="${ctx}/sys/sysOtherOrg/allData" idField="id" valueField="id" textField="name" parentField="parentId" textFieldLabel="名称"></sys:treewithsearchbar>
	    </div>

		<div showCollapseButton="true">
					<div class="mini-fit">
					<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
						<div title="列表" id="tabList"  style="border: 0px;"  >
								 <sys:toolbargridmain objId="SysOtherOrg" permissionEdit="sys:sysOtherOrg:edit"></sys:toolbargridmain>
								 <sys:searchadv></sys:searchadv>
								 <div class="mini-fit">
									<div id="datagridMain" class="mini-treegrid" style="width:100%;height:100%;"
										 url="${ctx}/sys/sysOtherOrg/allData" idField="id"
										 parentField="parentId" resultAsTree="false" showTreeIcon="true" treeColumn="name"
										 expandOnLoad="0" treeColumn="name" allowDrag="true" allowDrop="true" allowLeafDropIn="true"
										 allowResize="true" pageSize="10" autoLoad="false"
										 allowCellSelect="true" multiSelect="false"
										 editNextOnEnterKey="true"  editNextRowCell="true"
										 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false" virtualScroll="true"
									>
										<div property="columns">
											<div name="action" width="160"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
												<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" >编号
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"  style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
                                               <!--  <div name="parentId"  field="parentId"  vtype=""  headerAlign="center" allowSort="true" width="64" >父级编号
                                                    <input property="editor" class="mini-treeselect"  url="" valueField="id" textField="name" parentField="parentId" style="width:100%;" />
													<input id="parentId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
                                                </div>
												<div name="parentIds"  field="parentIds" vtype=""  headerAlign="center" allowSort="true" width="100" >所有父级编号
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="parentIds-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"  style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div> -->
												<div name="name"  field="name" vtype="required"  headerAlign="center" allowSort="true" width="100" >名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"  style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="sort"  field="sort" vtype=""  headerAlign="center" allowSort="true" width="120" >排序
													<input property="editor" class="mini-textbox" style="width:100%;"  />
												</div>
												<div name="status" field="status" vtype=""   headerAlign="center" allowSort="true" width="100" >状态
													<input property="editor" class="mini-textbox" style="width:100%;"  />
												</div>
												<div name="typeId"  field="typeId" vtype=""  headerAlign="center" allowSort="true" width="64" >组织类型
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="typeId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"  style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<!-- <div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建者
													<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="createDate"  field="createDate" vtype="required" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >创建时间
													<input property="editor" class="mini-datepicker"  style="width:100%;"  />
													<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >更新者
													<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="updateDate"  field="updateDate" vtype="required" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >更新时间
													<input property="editor" class="mini-datepicker"  style="width:100%;"  />
													<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div> -->
												<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="255" >备注信息
													<input property="editor" class="mini-textarea" style="width:100%;"  />
													<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
									</div>
								</div>
							 </div>
						</div>
						<div title="明细" id="tabForm"  style="border: 0px;"  >
							<sys:toolbarformmain permissionEdit="sys:sysOtherOrg:edit"></sys:toolbarformmain>
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
													<td style="text-align:right;">父组织：</td>
													<td colspan="3">
														<input name="parentId" id="parentId" class="mini-treeselect" vtype = ""  required="false"  url="${ctx}/sys/sysOtherOrg/allData" valueField="id" textField="name" parentField="parentId" expandOnLoad="0" width="380" />
													</td>
													<!-- <td style="text-align:right;">所有父级编号：</td>
													<td>
													   <input name="parentIds" id="parentIds" class="mini-textbox"  vtype = ""  required="false" />
													</td> -->

												</tr>
												<tr>
													<td style="text-align:right;">名称：</td>
													<td>
													   <input name="name" id="name" class="mini-textbox"  vtype = ""  required="true" />
													</td>
													

												</tr>
												
												<tr>
														<td style="text-align:right;">排序：</td>
													<td>
													   <input name="sort" id="sort" class="mini-spinner" allowLimitValue="false" vtype = ""  required="false" />
													</td>
													<td style="text-align:right;">层级</td>
													<td>
													   <input name="levelId" id="levelId" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_other_org_level" value = "0"   />
													</td>

												</tr>
												<tr>
													<td style="text-align:right;">状态：</td>
													<td>
													   <input name="status" id="status" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=wp_together_status" vtype = ""   />
													</td>
													<td style="text-align:right;">组织类型：</td>
													<td>
													   <input name="typeId" id="typeId" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_other_org_type" vtype = ""   />
													</td>

												</tr>
												<tr>
													<td style="text-align:right;">备注信息：</td>
													<td>
													   <input name="remarks" id="remarks" class="mini-textarea" vtype = ""  required="false" style="width:100%;"  />
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
													<div title="职位" name="tabSysOrgDutiesList"  style="border: 0px;"  >
														<sys:toolbargridsub girdId="gridSysOrgDuties" permissionEdit="sys:sysOrgDuties:edit"></sys:toolbargridsub>
														<div class="mini-fit">
														<div id="gridSysOrgDuties" class="mini-datagrid" style="width:100%;height:100%;"
															 url="${ctx}/sys/sysOrgDuties/data" idField="id"
															 allowResize="true" pageSize="10"
															 allowCellSelect="true" allowCellEdit="true"
															 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
															 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
														>
															<div property="columns">
																<div type="checkcolumn"></div>
																<!-- <div name="id"  field="id" readOnly="true"  vtype="required" headerAlign="center" allowSort="true"  width="64" >编号
																	<input property="editor" class="mini-textbox"   style="width:100%;"  />
																	<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild('gridSysOrgDuties')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysOrgDuties')"
																	/>
																</div> -->
																<!--
													<div name="dutiesId" field="dutiesId" vtype="" displayField="dutiesName"
																	headerAlign="center" allowSort="true" width="100">
																	职位 <input property="editor" class="mini-buttonedit"
																		required="false" multiSelect="true"
																		onbuttonclick="popLov(this,'选择职位 ',true,true,
																					'${ctx}/sys/sysDuties/list?classId=0',850,500,'id,name',
																					'dutiesId,dutiesName','gridSysOrgDuties')"
																		style="width: 100%;" /> <input id="dutiesId-Filter"
																		name="mini-column-filter" property="filter"
																		class="mini-buttonedit" style="width: 100%;"
																		onvaluechanged="onFilterChangedChild('gridSysOrgDuties')"
																		showClose="true"
																		oncloseclick="onChildFilterClose(this,'gridSysOrgDuties')" />
																</div>
																-->
																
							<div type="comboboxcolumn" autoShowPopup="true" name="dutiesId"  field="dutiesId" vtype="" headerAlign="center" allowSort="true" width="120" >类型
							职位<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=wp_duties_type_id" />
							</div>	
																
													            <div name="sort"  field="sort"   vtype="" headerAlign="center" allowSort="true"  width="100" >排序
																	<input property="editor" class="mini-spinner"  allowLimitValue="false" style="width:100%;"  />
																	<input id="sort-Filter" name="mini-column-filter"  property="filter" class="mini-spinner" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild('gridSysOrgDuties')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysOrgDuties')"
																	/>
																</div>
															<!-- 	<div name="otherOrgId" hideable="true" visible="false"  field="otherOrgId" headerAlign="center" allowSort="true" width="150" >
																	<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
																</div>
																<div name="typeId"  field="typeId"   vtype="" headerAlign="center" allowSort="true"  width="64" >组织类型
																	<input property="editor" class="mini-textbox"   style="width:100%;"  />
																	<input id="typeId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild('gridSysOrgDuties')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysOrgDuties')"
																	/>
																</div> -->
																<!-- <div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建者
																	<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild('gridSysOrgDuties')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysOrgDuties')"
																	/>
																</div>
																<div name="createDate"  field="createDate" readOnly="true" vtype="required" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >创建时间
																	<input property="editor" class="mini-datepicker" style="width:100%;"  />
																	<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild('gridSysOrgDuties')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysOrgDuties')"
																	/>
																</div>
																<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >更新者
																	<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild('gridSysOrgDuties')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysOrgDuties')"
																	/>
																</div>
																<div name="updateDate"  field="updateDate" readOnly="true" vtype="required" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >更新时间
																	<input property="editor" class="mini-datepicker" style="width:100%;"  />
																	<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild('gridSysOrgDuties')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysOrgDuties')"
																	/>
																</div> -->
																<div name="remarks"  field="remarks"  vtype="" headerAlign="center" allowSort="true" width="255" >备注信息
																	<input property="editor" class="mini-textarea" style="width:100%;"  />
																	<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																		   onvaluechanged="onFilterChangedChild('gridSysOrgDuties')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysOrgDuties')"
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
	    </div>
	</div>

</div>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysOtherOrg",
			    treeFilter:"(a.id='[node.id]') or (a.parent_ids like '%,[node.id],%')",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
            	treeSrcFields:"id,typeId",
				treeDestFields:"parentId,typeId",
			    treeParentField:"parentId",
			    masterKeyField:"id",
				dataUrl:"${ctx}/sys/sysOtherOrg/allData",
				getUrl:"${ctx}/sys/sysOtherOrg/get",
				saveUrl:"${ctx}/sys/sysOtherOrg/save",
				removeUrl:"${ctx}/sys/sysOtherOrg/remove",
				exportUrl:"${ctx}/sys/sysOtherOrg/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                    {
		                 id:"gridSysOrgDuties",
		                 objId:"SysOrgDuties",
		                 FK:"otherOrgId",
		                 cascade:true,
		                 cascadeVisible:true,
		                 tabName:"tabSysOrgDutiesList",
						 dataUrl:"${ctx}/sys/sysOrgDuties/data",
						 getUrl:"${ctx}/sys/sysOrgDuties/get",
						 saveUrl:"${ctx}/sys/sysOrgDuties/save",
						 removeUrl:"${ctx}/sys/sysOrgDuties/remove",
						 exportUrl:"${ctx}/sys/sysOrgDuties/export"
	                    }
	                   ]
	);

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: '编号',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.parent_id',
						label: '父级编号',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.parent_ids',
						label: '所有父级编号',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.sort',
						label: '排序',
						type: 'integer',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.status',
						label: '状态',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.type_id',
						label: '组织类型',
						type: 'string',
						default_value: '',
						size: 64
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
						label: '备注信息',
						type: 'string',
						default_value: '',
						size: 255
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
   function onGridSubOpMiClick_SysOrgDuties(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }

   }
</script>
</body>
</html>