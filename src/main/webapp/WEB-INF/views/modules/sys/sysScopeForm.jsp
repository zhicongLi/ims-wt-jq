<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>数据范围</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysScope" permissionEdit="sys:sysScope:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/ims-ext${ims_ext_suffix}/sys/sysScope/data" idField="id"
					 allowResize="true" pageSize="20"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="100" visible="false" >编码
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							
							<div name="seqNo"  field="seqNo" vtype=""  headerAlign="center" allowSort="true" width="100" >排序
								<input property="editor" class="mini-textbox" allowLimitValue="false" style="width:100%;"  />
								<input id="seqNo-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"  allowLimitValue="false" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="filterUrl"  field="filterUrl" vtype=""  headerAlign="center" allowSort="true" width="100" >过滤URL
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="filterUrl-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="isActivite"  field="isActivite" vtype=""  headerAlign="center" allowSort="true" width="100" >是否启用
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="isActivite-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="scope"  field="scope" vtype=""  headerAlign="center" allowSort="true" width="100" >数据范围
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="scope-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="filterField"  field="filterField" vtype=""  headerAlign="center" allowSort="true" width="100" >过滤字段
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="filterField-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="filterType"  field="filterType" vtype=""  headerAlign="center" allowSort="true" width="100" >过滤类型
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="filterType-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="cusSql"  field="cusSql" vtype=""  headerAlign="center" allowSort="true" width="100" >自定义sql
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="cusSql-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="priority"  field="priority" vtype=""  headerAlign="center" allowSort="true" width="100" >优先级
								<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
								<input id="priority-Filter" name="mini-column-filter"  property="filter" class="mini-spinner"  allowLimitValue="false" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="isDefault"  field="isDefault" vtype=""  headerAlign="center" type="comboboxcolumn"  allowSort="true" width="100" sortField="a.is_default">是否默认
								<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=yes_no"  style="width:100%;"  />
								<input id="isDefault-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" multiSelect="true" valueField="value" textField="label"  style="width:100%;" url="${ctx}/ims-ext/sys/dict/listDataStr?type=yes_no"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="100" >备注
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
		<sys:toolbarformmain permissionEdit="sys:sysScope:edit"></sys:toolbarformmain>
                  <div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
									<input class="mini-hidden" name="id" id="id"/>
									<input class="mini-hidden" name="createComp" id="createComp"/>
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
											<td style="text-align:right;">名称：</td>
											<td>
											   <input name="name" id="name" class="mini-textbox" allowLimitValue="false" vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">排序：</td>
											<td>
											   <input name="seqNo" id="seqNo" class="mini-textbox" allowLimitValue="false" vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">过滤URL：</td>
											<td colspan="3">
											   <input name="filterUrl" id="filterUrl" class="mini-textbox"   vtype = "" required="false" width="100%"/>
											</td>
											

										</tr>
										<tr>
											<td style="text-align:right;">是否默认：</td>
											<td>
											  <input name="isDefault" id="isDefault" class="mini-CheckBox"   trueValue="1" falseValue="0" vtype = "" required="false" />
											</td>
											<td style="text-align:right;">是否启用：</td>
											<td>
												<input name="isActivite" id="isActivite" class="mini-CheckBox"   trueValue="1" falseValue="0" vtype = "" required="false" />
											</td>
											<td style="text-align:right;">数据范围：</td>
											<td>
												<input name="scope" id="scope" showNullItem="true" class="mini-combobox"    vtype = ""  required="false"  textField="label" valueField="value"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_scope_scope"/>
											</td>
											<td style="text-align:right;">优先级：</td>
											<td>
											   <input name="priority" id="priority" class="mini-textbox"  allowLimitValue="false" vtype = "" required="false" />
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">过滤字段：</td>
											<td>
											   <input name="filterField" id="filterField" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											
											<td style="text-align:right;">过滤字段类型：</td>
											<td>
												<input name="filterFieldType" id="filterFieldType" showNullItem="true" class="mini-combobox"    vtype = ""  required="false"  textField="label" valueField="value"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_scope_filter_field_type"/>
											</td>
											<td style="text-align:right;">过滤类型：</td>
											<td>
												<input name="filterType" id="filterType" showNullItem="true" class="mini-combobox"    vtype = ""  required="false"  textField="label" valueField="value"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_scope_filter_type"/>
											</td>
										</tr>
										<tr>
										<td style="text-align:right;">自定义sql：</td>
											<td colspan="3">
											   <input name="cusSql" id="cusSql" class="mini-textarea"  vtype = ""  required="false" width="100%"/>
											</td>
											<td style="text-align:right;">备注：</td>
											<td colspan="3">
											   <input name="remarks" id="remarks" class="mini-textarea" vtype = ""  required="false"  width="100%"/>
											</td>
										</tr>

									
										
									</table>
				                </div> <!--panel-->
				            </div> <!--mini-col-->
				        </div> <!--clearfix-->
				     </div> <!--container-->
				  </div> <!--editform-->
		        <div class="mini-fit">
						 <div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
								<div title="数据范围用户" name="tabSysScopeUserList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSysScopeUser" permissionEdit="sys:sysScopeUser:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSysScopeUser" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-ext${ims_ext_suffix}/sys/sysScopeUser/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>

											<div name="id"  field="id" readOnly="true"  vtype="required" headerAlign="center" allowSort="true"  width="100" visible="false">编码
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysScopeUser')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysScopeUser')"
												/>
											</div>
											<div name="scopeId" hideable="true" visible="false"  field="scopeId" headerAlign="center" allowSort="true" width="150"  visible="false">
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											
											
											
											<div name="userId"  field="userId"   vtype="" headerAlign="center" allowSort="true"  width="100" displayField="userName">用户名称
												<input property="editor" class="mini-buttonedit"  style="width:100%;" allowInput="false" 
												onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=/sys/sysMisUserList&orgQuery=${param.orgQuery}',850,500,'id,name','userId,userName','gridSysScopeUser')"
												/>
											</div>
											<div name="userName"  field="userName"   vtype="" headerAlign="center" allowSort="true"  width="100" visible="false">用户名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="userName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysScopeUser')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysScopeUser')"
												/>
											</div>
											<div name="remarks"  field="remarks"  vtype="" headerAlign="center" allowSort="true" width="100" >备注
												<input property="editor" class="mini-textarea" style="width:100%;"  />
												<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysScopeUser')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysScopeUser')"
												/>
											</div>


										</div>
									</div>
								 </div>
							  </div>
								<div title="数据范围角色" name="tabSysScopeRoleList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSysScopeRole" permissionEdit="sys:sysScopeRole:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSysScopeRole" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-ext${ims_ext_suffix}/sys/sysScopeRole/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>

											<div name="id"  field="id" readOnly="true"  vtype="required" headerAlign="center" allowSort="true"  width="100" visible="false">编码
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysScopeRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysScopeRole')"
												/>
											</div>
											<div name="scopeId" hideable="true" visible="false"  field="scopeId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div name="roleId"  field="roleId"   vtype="" headerAlign="center" allowSort="true"  width="100" displayField="roleId">角色id
												<input property="editor" class="mini-buttonedit"  style="width:100%;" allowInput="false" 
												onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=sys/sysRoleList',850,500,'id,name','roleId,roleName','gridSysScopeRole')"
												/>
											</div>
											<div name="roleName"  field="roleName"   vtype="" headerAlign="center" allowSort="true"  width="100" visible="true" readOnly="true">角色名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="roleName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysScopeRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysScopeRole')"
												/>
											</div>
											<div name="orgId"  field="orgId"   vtype="" headerAlign="center" allowSort="true"  width="100" >组织机构编码
												<input property="editor" class="mini-buttonedit"  style="width:100%;" allowInput="false" 
												onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=sys/sysOrgList',850,500,'id,name','orgId,orgName','gridSysScopeRole')"
												/>
											</div>
											<div name="orgName"  field="orgName"   vtype="" headerAlign="center" allowSort="true"  width="100" readOnly="true">组织机构名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="orgName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysScopeRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysScopeRole')"
												/>
											</div>
											<div name="remarks"  field="remarks"  vtype="" headerAlign="center" allowSort="true" width="100" >备注
												<input property="editor" class="mini-textarea" style="width:100%;"  />
												<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysScopeRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysScopeRole')"
												/>
											</div>


										</div>
									</div>
								 </div>
							  </div>
						 </div>
		        </div><!--fit-->

	    </div>

   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysScope",
			    masterKeyField:"id",
				dataUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysScope/data",
				getUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysScope/get",
				saveUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysScope/save",
				removeUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysScope/remove",
				exportUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysScope/export",
				initData:{'filterFieldType':'1'}
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                    {
		                 id:"gridSysScopeUser",
		                 objId:"SysScopeUser",
		                 FK:"scopeId",
		                 cascade:true,
		                 cascadeVisible:true,
		                 tabName:"tabSysScopeUserList",
						 dataUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysScopeUser/data",
						 getUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysScopeUser/get",
						 saveUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysScopeUser/save",
						 removeUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysScopeUser/remove",
						 exportUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysScopeUser/export"
	                    }
	                    ,{
		                 id:"gridSysScopeRole",
		                 objId:"SysScopeRole",
		                 FK:"scopeId",
		                 cascade:true,
		                 cascadeVisible:true,
		                 tabName:"tabSysScopeRoleList",
						 dataUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysScopeRole/data",
						 getUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysScopeRole/get",
						 saveUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysScopeRole/save",
						 removeUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysScopeRole/remove",
						 exportUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysScopeRole/export"
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
						size: 100
					}
					,{
						id: 'a.create_by_name',
						label: '创建人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.tenant_id',
						label: '租户id',
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
						id: 'a.update_by_name',
						label: '修改人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.update_by',
						label: '修改人',
						type: 'string',
						default_value: '',
						size: 100
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
						id: 'a.create_comp',
						label: '创建人公司',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.seq_no',
						label: '排序',
						type: 'integer',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.filter_url',
						label: '过滤URL',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.is_activite',
						label: '是否启用',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.scope',
						label: '数据范围',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.filter_field',
						label: '过滤字段',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.filter_type',
						label: '过滤类型',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.cus_sql',
						label: '自定义sql',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.priority',
						label: '优先级',
						type: 'integer',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.is_default',
						label: '是否默认',
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
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }
   }
   //////////子表格操作菜单项点击事件方法/////////
   function onGridSubOpMiClick_SysScopeUser(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }
   }
   function onGridSubOpMiClick_SysScopeRole(e){
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