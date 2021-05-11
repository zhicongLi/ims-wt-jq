<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
	 <title>角色</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <script type="text/javascript" src="${ctxStatic}/common/sysToolBar.js"></script>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysRole" permissionEdit="sys:sysRole:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/ims-iam-ext/sysRole/allData" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true"
				>
					<div property="columns">
						<div name="action" width="80"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="name"  field="name" vtype="required"  headerAlign="center" allowSort="true" width="100" sortField="a.name">角色名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged"
								/>
							</div>
							<div name="enname"  field="enname" vtype=""  headerAlign="center" allowSort="true" width="255" >英文名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="enname-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged"
								/>
							</div>
							<div type="comboboxcolumn" autoShowPopup="true" name="dataScope"  field="dataScope" vtype="" headerAlign="center" allowSort="true" width="120" >数据范围
								<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_data_scope" />
							</div>
							<div type="comboboxcolumn" autoShowPopup="true" name="emptyIsVisible"  field="emptyIsVisible" vtype="" headerAlign="center" allowSort="true" width="120" >空是否可见
								<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=yes_no" />
							</div>							
							<div name="createDate"  field="createDate" vtype="required" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" sortField="a.create_date">创建时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
							</div>
							<div name="updateDate"  field="updateDate" vtype="required" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" sortField="a.update_date">更新时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysRole:edit"></sys:toolbarformmain>
		<div class="mini-fit">
				<div id="editform" class="form" style="width:100%;height:auto;">
						<input class="mini-hidden" name="id" id="id"/>
						<table border="0" cellpadding="3" cellspacing="3" >
							<tr>
								<td style="text-align:right;">归属机构：</td>
								<td>
								    <input name="orgId" id="orgId" class="mini-treeselect" vtype = ""  required="false"  url="${ctx}/ims-iam-ext/sys/sysOrg/allData" valueField="id" textField="name" parentField="parentId"/>
								</td>
								<td style="text-align:right;">角色名称：</td>
								<td>
								   <input name="name" id="name"  class="mini-textbox"  vtype = "" required="true" />
								</td>
								<td style="text-align:right;">英文名称：</td>
								<td>
								   <input name="enname" id="enname" class="mini-textbox"  vtype = ""  required="false" />
								</td>
								<td style="text-align:right;">角色类型：</td>
								<td>
								   <input name="roleType" id="roleType"  class="mini-combobox" vtype = "" required="false" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_role_type" />
								</td>
							</tr>
							
							<tr>
								<td style="text-align:right;">数据范围：</td>
								<td>
								   <input name="dataScope" id="dataScope" class="mini-combobox" vtype = ""  required="false" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_data_scope" />
								</td>
								<td style="text-align:right;">是否系统数据：</td>
								<td>
								   <input name="isSys" id="isSys"  class="mini-combobox" vtype = "" required="false" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=yes_no" />
								</td>
								<td style="text-align:right;">是否可用：</td>
								<td>
								   <input name="useable" id="useable"  class="mini-combobox" vtype = "" required="false" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=yes_no"  />
								</td>
								<td style="text-align:right;">空是否可见：</td>
								<td>
								   <input name="emptyIsVisible" id="emptyIsVisibleCombo"  value="1" class="mini-combobox" vtype = "" required="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=yes_no"  />
                                </td>
								<td style="text-align:right;">备注信息：</td>
								<td>
								   <input name="remarks" id="remarks"  height="25" class="mini-textarea"  vtype = "" required="false"/>
								</td>
							</tr>
						</table>
				</div>
		        <div class="mini-fit">
						 <div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
						     <div title="角色授权" id="tabSysMenuList" style="border: 0px;">

								 <ul id="menuTree" class="mini-tree" url="${ctx}/ims-ext/sys/sysMenu/allData" style="width:100%;height:100%;padding:5px;"
								        showTreeIcon="true" textField="name" idField="id" parentField="parentId" resultAsTree="false"  
								        allowSelect="true" enableHotTrack="false" expandOnLoad="1"
								        showCheckBox="true" checkRecursive="false" autoCheckParent="false" onnodecheck="nodecheck">
							      </ul>
						     </div>
						      <div title="分配用户" id="tabSysUserRoleList"  style="border: 0px;"  >
									<div style="width:100%;">
										<div class="mini-toolbar" id="_tbgridSysUserRole"  style="border-bottom:0;padding:0px;">
											<table style="width:100%;">
												<tr>
													<td style="width:100%;">
														<%--<a class="mini-button" id="_tbgridSysUserRole_add" iconCls="icon-plus-sign"  onclick="SysUserRoleAdd" plain="true" tooltip="分配用户...">分配用户</a>--%>
														<%--<a class="mini-button" id="_tbgridSysUserRole_remove" iconCls="icon-remove" style="color:red;" onclick="removeRow('gridSysUserRole')" plain="true">删除行</a>--%>
														<%--<span class="separator"></span>--%>
														<a class="mini-button" id="_tbgridSysUserRole_refresh" iconCls="icon-refresh" onclick="refreshGridData('gridSysUserRole')" plain="true">刷新</a>
														<a class="mini-menubutton" id="_tbgridSysUserRole_op" iconCls="icon-cogs"  plain="true" menu="#_pmgridSysUserRole">操作</a>
													</td>
													<td style="white-space:nowrap;">
													</td>
												</tr>
											</table>
											<ul id="_pmgridSysUserRole" class="mini-menu" style="display:none;"  textField="name" idField="id" parentField="parentId"   onitemclick="onGridSubOpMiClick_gridSysUserRole">							
											</ul>
										</div>
									</div>
									<div class="mini-fit">
									<div id="gridSysUserRole" class="mini-datagrid" style="width:100%;height:100%;"
										  url="${ctx}/ims-iam-ext/sys/sysRole/assign" idField="id"
										  allowResize="true" pageSize="10"
										  allowCellSelect="true" allowCellEdit="true"
										  editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="true"
										  allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>
  							                <%--<div name="companyName"  field="companyName"   vtype="" headerAlign="center" allowSort="true"  width="200"  sortField="c.name">归属公司--%>
												<%----%>
											<%--</div>											--%>
											<div name="orgName"  field="orgName"   vtype="" headerAlign="center" allowSort="true"  width="200" sortField="o.name">归属部门
												
											</div>
											<div name="loginName"  field="loginName"   vtype="" headerAlign="center" allowSort="true"  width="200" sortField="a.login_name">登录名
												
											</div>
											<div name="name"  field="name"  vtype="" headerAlign="center" allowSort="true" width="150" sortField="a.name">姓名
												
											</div>
											<div name="phone"  field="phone"   vtype="" headerAlign="center" allowSort="true"  width="150" sortField="a.phone">电话
												
											</div>
											<div name="mobile"  field="mobile"   vtype="" headerAlign="center" allowSort="true"  width="150" sortField="a.mobile">手机
												
											</div>
										</div>
									</div>
								 </div>
							  </div>
							  <div title="分配机构" id="tabSysOrgRoleList"  style="border: 0px;"  >
									<div style="width:100%;">
										<div class="mini-toolbar" id="_tbgridSysOrgRole"  style="border-bottom:0;padding:0px;">
											<table style="width:100%;">
												<tr>
													<td style="width:100%;">
														<a class="mini-button" id="_tbgridSysOrgRole_add" iconCls="icon-plus-sign"  onclick="sysOrgRoleAdd" plain="true" tooltip="分配机构...">分配机构</a>
														<a class="mini-button" id="_tbgridSysOrgRole_remove" iconCls="icon-remove" style="color:red;" onclick="removeRow('gridSysOrgRole')" plain="true">删除行</a>
														<span class="separator"></span>
														<a class="mini-button" id="_tbgridSysOrgRole_refresh" iconCls="icon-refresh" onclick="refreshGridData('gridSysOrgRole')" plain="true">刷新</a>
														<a class="mini-menubutton" id="_tbgridSysOrgRole_op" iconCls="icon-cogs"  plain="true" menu="#_pmgridSysOrgRole">操作</a>
													</td>
													<td style="white-space:nowrap;">
													</td>
												</tr>
											</table>
											<ul id="_pmgridSysOrgRole" class="mini-menu" style="display:none;"  textField="name" idField="id" parentField="parentId"   onitemclick="onGridSubOpMiClick_gridSysUserRole">							
											</ul>
										</div>
									</div>
									<div class="mini-fit">
									<div id="gridSysOrgRole" class="mini-datagrid" style="width:100%;height:100%;"
										  url="${ctx}/ims-iam-ext/sys/sysRole/org" idField="id"
										  allowResize="true" pageSize="10"
										  allowCellSelect="true" allowCellEdit="true"
										  editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										  allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>
											 <div name="id"  field="id"   vtype="" headerAlign="center" allowSort="true"  width="100" sortField="a.id">编号
												
											</div>	
  							                <div name="name"  field="name"   vtype="" headerAlign="center" allowSort="true"  width="200" sortField="a.name">名称
												
											</div>											
											<div name="shortName"  field="shortName"   vtype="" headerAlign="center" allowSort="true"  width="200" sortField="a.short_name">简称
												
											</div>
											<div name="code"  field="code"  vtype="" headerAlign="center" allowSort="true" width="150" sortField="a.code">区域编码
												
											</div>
											<div name="orgCode"  field="orgCode"   vtype="" headerAlign="center" allowSort="true"  width="150" sortField="a.org_code">机构编码
												
											</div>
											<div type="comboboxcolumn" name="type"  field="type"   vtype="readOn" headerAlign="center" allowSort="true"  width="150" sortField="a.type">机构类型 
												<input property="editor" readonly="readonly" class="mini-combobox"  textField="label" valueField="value"  style="width:100%;"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_type" />
											</div>
											<div type="comboboxcolumn" name="grade"  field="grade"   vtype="" headerAlign="center" allowSort="true"  width="150" sortField="a.grade">机构等级
												<input property="editor" readonly="readonly" class="mini-combobox"  textField="label" valueField="value"  style="width:100%;"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_grade" />
											</div>
										</div>
									</div>
								 </div>
							  </div>
							  <div title="模糊添加" id="tabSysRoleMenuList"  style="border: 0px;"  >
					             <sys:toolbargridsub girdId="gridSysRoleMenu" showClone="false" permissionEdit="sys:sysRoleMenu:edit"></sys:toolbargridsub>
					             <sys:searchadv></sys:searchadv>
								 <div class="mini-fit">
									<div id="gridSysRoleMenu" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx }/sys/sysRoleMenu/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" multiSelect="true"
										 allowCellEdit="false"
										 editNextOnEnterKey="true"  editNextRowCell="true" 
										 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
									>
										<div property="columns">
										       <div type="checkcolumn"></div>
										       <div name="sysMenu.name"  field="sysMenu.name" vtype="required"  headerAlign="center" allowSort="true" width="100" sortField="m.name">名称
													<input property="editor" class="mini-textbox" style="width:100%;"  />
													<input id="sysMenu.name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged"
													/>
												</div>
												<div name="sysMenu.href"  field="sysMenu.href" vtype=""  headerAlign="center" allowSort="true" width="120" sortField="m.href">链接
													<input property="editor" class="mini-textbox" style="width:100%;"  />
												</div>
												<div type="checkboxcolumn"  name="sysMenu.isShow"  field="sysMenu.isShow" trueValue="1" falseValue="0" vtype="required" headerAlign="center" allowSort="true" width="80"  sortField="m.isShow">是否在菜单中显示
								
												</div>
												<div name="sysMenu.permission"  field="sysMenu.permission" vtype=""  headerAlign="center" allowSort="true" width="150" sortField="m.permission">权限标识
													<input property="editor" class="mini-textbox" style="width:100%;"  />
													<input id="sysMenu.permission-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysRoleMenu')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysRoleMenu')"
												/>
												</div>
								
							                    <div type="comboboxcolumn" autoShowPopup="true" name="sysMenu.type"  field="sysMenu.type" vtype="" headerAlign="center" allowSort="true" width="80" sortField="m.type">菜单类型
							                        <input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_menu_type" />
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
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">
	var _data_clone=null;	
	initBase(
			{   id:"datagridMain",
			    objId:"SysRole",
			    masterKeyField:"id",
				dataUrl:"${ctx}/ims-iam-ext/sys/sysRole/data",
				getUrl:"${ctx}/ims-iam-ext/sys/sysRole/get",
				saveUrl:"${ctx}/ims-iam-ext/sys/sysRole/save",
				removeUrl:"${ctx}/ims-iam-ext/sys/sysRole/remove",
				exportUrl:"${ctx}/ims-iam-ext/sys/sysRole/export",
				onAfterLoadRecord:initRoleMenuList,
				onAfterSaveForm: saveRoleMenuList,
				onAfterInsertRecord:insertRecord,
				onBeforeCloneRecord:onBeforeCloneRecord,
				onAfterCloneRecord:onAfterCloneRecord,
				addCan:'0',
				removeCan:'0',
				cloneCan:'0'

			 }
	       );

	initChilds( "#editform", "tabsMain" ,
         [
			  {
			    id:"gridSysUserRole",
			    objId:"SysUser",
			    FK:"roleIdStr",
			    cascade:true,
				dataUrl:"${ctx}/ims-iam-ext/sys/sysRole/assign",
			    getUrl:"",
				saveUrl:"${ctx}/ims-iam-ext/sys/sysUser/outrole",
				removeUrl:"${ctx}/ims-iam-ext/sys/sysUser/outrole",
				exportUrl:"",
                  addCan:'0',
                  removeCan:'0',
                  cloneCan:'0'
			   },
			   {
				    id:"gridSysOrgRole",
				    objId:"SysOrg",
				    FK:"roleIdStr",
				    cascade:true,
					dataUrl:"${ctx}/ims-iam-ext/sys/sysRole/org",
				    getUrl:"",
					saveUrl:"${ctx}/ims-iam-ext/sys/sysRole/outOrg",
					removeUrl:"${ctx}/ims-iam-ext/sys/sysRole/outOrg",
					exportUrl:"",
                   addCan:'0',
                   removeCan:'0',
                   cloneCan:'0'
				   }
				   // ,
			   <%--{--%>
	                 <%--id:"gridSysRoleMenu",--%>
	                 <%--objId:"SysRoleMenu",--%>
	                 <%--FK:"roleId",--%>
	                 <%--cascade:true,--%>
					 <%--dataUrl:"${ctx}/ims-iam-ext/sys/sysRoleMenu/data",--%>
					 <%--getUrl:"${ctx}/ims-iam-ext/sys/sysRoleMenu/get",--%>
					 <%--saveUrl:"${ctx}/ims-iam-ext/sys/sysRoleMenu/save",--%>
					 <%--removeUrl:"${ctx}/ims-iam-ext/sys/sysRoleMenu/remove",--%>
					 <%--exportUrl:"${ctx}/ims-iam-ext/sys/sysRoleMenu/export",--%>
                   <%--addCan:'0',--%>
                   <%--removeCan:'0',--%>
                   <%--cloneCan:'0'--%>
                 <%--}--%>

	     ]

	);

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.org_id',
						label: '归属机构',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.name',
						label: '角色名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.enname',
						label: '英文名称',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.role_type',
						label: '角色类型',
						type: 'string',
						default_value: '',
						size: 255
						,
						plugin: 'selectize',
						plugin_config: {
							valueField: 'value',
							labelField: 'label',
							searchField: 'label',
							sortField: 'value',
							create: true,
							maxItems: 1,
							onInitialize: function () {
								var that = this;
								$.getJSON('${ctx}/ims-ext/sys/dict/listDataStr?type=sys_role_type', function (data) {
									data.forEach(function (item) {
										that.addOption(item);
									});
								});
							}
						},
						valueSetter: function(rule, value) {
							rule.$el.find('.rule-value-container select')[0].selectize.setValue(value);
						}
					}
					,{
						id: 'a.data_scope',
						label: '数据范围',
						type: 'string',
						default_value: '',
						size: 120
						,
						plugin: 'selectize',
						plugin_config: {
							valueField: 'value',
							labelField: 'label',
							searchField: 'label',
							sortField: 'value',
							create: true,
							maxItems: 1,
							onInitialize: function () {
								var that = this;
								$.getJSON('${ctx}/ims-ext/sys/dict/listDataStr?type=sys_data_scope', function (data) {
									data.forEach(function (item) {
										that.addOption(item);
									});
								});
							}
						},
						valueSetter: function(rule, value) {
							rule.$el.find('.rule-value-container select')[0].selectize.setValue(value);
						}
					}
					,{
						id: 'a.is_sys',
						label: '是否系统数据',
						type: 'string',
						default_value: '',
						size: 64
						,
						plugin: 'selectize',
						plugin_config: {
							valueField: 'value',
							labelField: 'label',
							searchField: 'label',
							sortField: 'value',
							create: true,
							maxItems: 1,
							onInitialize: function () {
								var that = this;
								$.getJSON('${ctx}/ims-ext/sys/dict/listDataStr?type=yes_no', function (data) {
									data.forEach(function (item) {
										that.addOption(item);
									});
								});
							}
						},
						valueSetter: function(rule, value) {
							rule.$el.find('.rule-value-container select')[0].selectize.setValue(value);
						}
					}
					,{
						id: 'a.useable',
						label: '是否可用',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_date',
						label: '创建时间',
						type: 'datetime',
						default_value: '',
						size: 120
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
						id: 'a.update_date',
						label: '更新时间',
						type: 'datetime',
						default_value: '',
						size: 120
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
   
   function nodecheck(e) {
	   var tree = mini.get("menuTree");
       var parr=tree.getAncestors(e.node);
       tree.checkNodes ( parr );                 
   }
   
   //点新建的时候清除菜单树的选择
   function insertRecord(){
	   var tree = mini.get("menuTree");
	   tree.uncheckAllNodes();
   }
   
   function initRoleMenuList(e){
	   var tree = mini.get("menuTree");
       var data=[{"id":e.id}];        
       var json = mini.encode(data);
       $.ajax({
           url:"${ctx}/ims-ext/sys/sysRole/initRoleMenu",
           async: false,  
           data: { data: json },
	       type: "post",
	       dataType:'json',
           success: function (text) {
               tree.uncheckAllNodes()
	            if(objIsNotNull(text)){
	            	tree.setValue(text, false);
	            }
              grid.reload();
           },
           error: function (jqXHR, textStatus, errorThrown) {
               var callback=function (action) {
                   viewErrorDetail(jqXHR.responseText);
               }
               var buttonsTemp=["ok","详细"];
               showMessageBox("错误","读取角色授权错误","error",null,callback,buttonsTemp);
               form.unmask();
           }
       }); 
      
   }
   function saveRoleMenuList(e){

       var roleIdStr = mini.get("id").getValue();

	   var tree = mini.get("menuTree");
       var value = tree.getValue();
       // var data=[{"id":e.data.id,"menuLists":value}];
       var data=[{"id": roleIdStr,"menuLists":value}];
       var json = mini.encode(data);
       $.ajax({
           url:"${ctx}/ims-ext/sys/sysRole/saveRoleMenu",
           async: false,  
           data: { data: json },
	       type: "post",
	       dataType:'json',
           success: function (text) {
			   var o = mini.decode(text);
			   if(objIsNotNull(o)){
				   showTipM("info","提示",o.message);
			   }

			   grid.reload();
               hideMessageBox();
		   },
           error: function (jqXHR, textStatus, errorThrown) {
               var callback=function (action) {
                   viewErrorDetail(jqXHR.responseText);
               }
               var buttonsTemp=["ok","详细"];
               showMessageBox("错误","保存角色授权错误","error",null,callback,buttonsTemp);
               form.unmask();
           }
       }); 
   }
   
   function SysUserRoleAdd(){	  
	   var gridSysUserRole = mini.get("gridSysUserRole");
       var data = gridSysUserRole.getData();
       var user_id="";       
       for(var i=0;i<data.length;i++){  
    	    if(i>0){
    	    	user_id+=",";
    	    }
    	    user_id+=data[i].id;    	    
       } 
       popLov(user_id,'分配用户',true,true,'/form?view=/sys/sysMisUserList?orgId=2000',850,600,'id',null,null, null,assignRole);
      
   }
   
   function assignRole(e){
	   var gridSysUserRole = mini.get("gridSysUserRole");
	   var roleIdStr = mini.get("id");
	   for(var i=0;i<e.length;i++){  
   	       e[i].roleIdStr=roleIdStr.getValue();
       } 	   
	   var json = mini.encode(e);	
       $.ajax({
           url:"${ctx}/ims-iam-ext/sys/sysRole/assignrole",
           async: false,  
           data: { data: json },
	       type: "post",
	       dataType:'json',
           success: function (text) {
               var o = mini.decode(text);
	            if(objIsNotNull(o)){
	                showTipM("failure","提示",o.message);
	            }
	            gridSysUserRole.reload();   
           },
           error: function (jqXHR, textStatus, errorThrown) {
               var callback=function (action) {
                   viewErrorDetail(jqXHR.responseText);
               }
               var buttonsTemp=["ok","详细"];
               showMessageBox("错误","保存分配用户错误","error",null,callback,buttonsTemp);
               form.unmask();
           }
       }); 
   }
	function onBeforeCloneRecord(e){
		var treeTemp=mini.get('menuTree');
		_data_clone = treeTemp.getData();
		_data_clone = mini.clone(_data_clone);

	}
	function onAfterCloneRecord(e){
		var treeTemp=mini.get('menuTree');
		if(objIsNotNull(_data_clone)) {
			treeTemp.clearRows( );
			treeTemp.setData(_data_clone);
		}

	}
	
	   
	function sysOrgRoleAdd(){
		   var id = mini.get("id").value;
			if(id != null & id != ""){
				var gridSysOrgRole = mini.get("gridSysOrgRole");
			       var data = gridSysOrgRole.getData();
			       var org_id="";       
			       for(var i=0;i<data.length;i++){  
			    	    if(i>0){
			    	    	org_id+=",";
			    	    }
			    	    org_id+=data[i].id;    	    
			       } 
			       popLov(org_id,'分配机构',true,true,'${ctx}/ims-iam-ext/sys/sysOrg/list',850,600,'id',null,null, null,assignOrg);
			}else{
				showMessageBox("警告",'请先保存角色',"warning");
				return false;
			}
		   
	   }
	   
	   
	   function assignOrg(e){
		   var gridSysOrgRole = mini.get("gridSysOrgRole");
		   var roleIdStr = mini.get("id");
		   for(var i=0;i<e.length;i++){  
	   	       e[i].roleIdStr=roleIdStr.getValue();
	       } 	   
		   var json = mini.encode(e);
		   
	       $.ajax({
	           url:"${ctx}/ims-iam-ext/sys/sysRole/assignRoleToOrg",
	           async: false,  
	           data: { data: json },
		       type: "post",
		       dataType:'json',
	           success: function (text) {
	               var o = mini.decode(text);
		            if(objIsNotNull(o)){
		            	if(o.type=="E"){
                            showMessageBox("错误",o.message,"error");
                            return;
                        }else if(o.type=="W"){
                            showMessageBox("警告",o.message,"warning");
                        }else if(o.type=="I"){
                            showTipM("info","提示",o.message);
                        }
		            }
		            gridSysOrgRole.reload();   
	           },
	           error: function (jqXHR, textStatus, errorThrown) {
	               var callback=function (action) {
	                   viewErrorDetail(jqXHR.responseText);
	               }
	               var buttonsTemp=["ok","详细"];
	               showMessageBox("错误","保存分配机构错误","error",null,callback,buttonsTemp);
	               form.unmask();
	           }
	       }); 
	   }
	
	
	
   //////////表格操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){

   }
   //////////form操作菜单项点击事件方法/////////
   function onFormOpMiClick(e){
   }
   //////////子表格操作菜单项点击事件方法/////////

	mini.get("_tbgridSysRoleMenu_add").un("click");
	$("#_tbgridSysRoleMenu_add").click(function(){
		SysRoleMenuAdd();
	});
	
	function SysRoleMenuAdd(){	  
		   var gridSysUserRole = mini.get("gridSysRoleMenu");
	       var data = gridSysUserRole.getData();
	       var menu_id="";       
	       for(var i=0;i<data.length;i++){  
	    	    if(i>0){
	    	    	menu_id+=",";
	    	    }
	    	    menu_id+=data[i].menuId;    	    
	       } 
	       popLov(null,'角色授权',true,true,'${ctxRoot}/sys/sysMenuForm?formView=sysMenuLov',850,600,'id',null,null, null,roleMenuAdd);
	      
	   }
	   
	   function roleMenuAdd(e){
		   var gridSysRoleMenu = mini.get("gridSysRoleMenu");
		   var roleId = mini.get("id").getValue();
		   var arr = new Array();
		   for(var i=0;i<e.length;i++){  
			   arr.push(
					{
						roleId:roleId,
						menuId:e[i].id
					}
			   );
	       } 	   
		   debugger;
		   var json = mini.encode(arr);	
	       $.ajax({
	           url:"${ctx}/ims-iam-ext/sys/sysRoleMenu/addMenus",
	           async: false,  
	           data: { roleId:roleId,data: json },
		       type: "post",
		       dataType:'json',
	           success: function (text) {
	               var o = mini.decode(text);
		            if(objIsNotNull(o)){
		                showTipM("failure","提示",o.message);
		            }
		            gridSysRoleMenu.reload();   
	           },
	           error: function (jqXHR, textStatus, errorThrown) {
	               var callback=function (action) {
	                   viewErrorDetail(jqXHR.responseText);
	               }
	               var buttonsTemp=["ok","详细"];
	               showMessageBox("错误","保存分配用户错误","error",null,callback,buttonsTemp);
	               form.unmask();
	           }
	       }); 
	   }

		function addButton(){
			sysToolBar_.bindClick("_tbForm_save",saveRoleMenuList,'');
		}

	   $(function(){
           addButton();
	   })
	
	
</script>
</body>
</html>