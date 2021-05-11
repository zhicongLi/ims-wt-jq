<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>角色菜单关联</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysRoleMenu"  permissionEdit="sys:sysRoleMenu:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysRoleMenu/data" idField="id"
			 allowResize="true" pageSize="20"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="roleId" field="roleId" vtype="required"   headerAlign="center" allowSort="true" width="64" >role_id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="roleId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="menuId" field="menuId" vtype="required"   headerAlign="center" allowSort="true" width="64" >menu_id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="menuId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="sysRole.name"  field="sysRole.name" vtype="required"  headerAlign="center" allowSort="true" width="100" sortField="a.name">角色名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="sysRole.name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="sysRole.enname"  field="sysRole.enname" vtype=""  headerAlign="center" allowSort="true" width="255" sortField="r.enname">角色英文名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="sysRole.enname-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="sysMenu.name"  field="sysMenu.name" vtype="required"  headerAlign="center" allowSort="true" width="200" sortField="m.name">名称
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="sysMenu.name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="sysMenu.href"  field="sysMenu.href" vtype=""  headerAlign="center" allowSort="true" width="120" sortField="m.href">链接
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div type="checkboxcolumn"  name="sysMenu.isShow"  field="sysMenu.isShow" trueValue="1" falseValue="0" vtype="required" headerAlign="center" allowSort="true" width="120" sortField="m.isShow">是否在菜单中显示
	
					</div>
					<div name="sysMenu.permission"  field="sysMenu.permission" vtype=""  headerAlign="center" allowSort="true" width="200" sortField="m.permission">权限标识
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="sysMenu.permission-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
	
                    <div type="comboboxcolumn" autoShowPopup="true" name="sysMenu.type"  field="sysMenu.type" vtype="" headerAlign="center" allowSort="true" width="30" sortField="m.type">菜单类型
                        <input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=sys_menu_type" />
                    </div>
					
        </div>
    </div>
   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysRoleMenu",
				dataUrl:"${ctx}/sys/sysRoleMenu/data",
				getUrl:"${ctx}/sys/sysRoleMenu/get",
				saveUrl:"${ctx}/sys/sysRoleMenu/save",
				removeUrl:"${ctx}/sys/sysRoleMenu/remove",
				exportUrl:"${ctx}/sys/sysRoleMenu/export"
			 }
	       );

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.role_id',
						label: 'role_id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.menu_id',
						label: 'menu_id',
						type: 'string',
						default_value: '',
						size: 64
					}
			]
	);
   loadWindow();
   //////////操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){

   }
</script>
</body>
</html>