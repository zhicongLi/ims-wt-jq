<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全组织用户</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SmUser" permissionEdit="sm:smUser:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-treegrid" style="width:100%;height:100%;"
			 url="${ctx}/ims-org${ims_org_suffix}/sm/smUser/allData" idField="id"
			 parentField="parentId" resultAsTree="false" showTreeIcon="true" treeColumn="name"
			 expandOnLoad="0" treeColumn="name" allowDrag="true" allowDrop="true" allowLeafDropIn="true"
			 allowResize="true" pageSize="100" autoLoad="false"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false" virtualScroll="true"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
				<div name="action" width="120" headerAlign="center" align="center"
						renderer="onTreeActionRenderer" cellStyle="padding:0;">操作</div>


					<div name="smOrgId" field="smOrgId" vtype=""   headerAlign="center" allowSort="true" width="64" visible="false">安全组织机构id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="smOrgId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="200" >姓名
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="phone" field="phone" vtype=""   headerAlign="center" allowSort="true" width="64" >电话
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="phone-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div type="comboboxcolumn" autoShowPopup="true" name="posCode"  field="posCode" headerAlign="center" allowSort="true" width="120" >岗位
						<input property="editor" class="mini-combobox"  textField="label" valueField="value"  style="width:100%;"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_user_position" />
						<input
								id="posCode-Filter" name="mini-column-filter"
								property="filter" class="mini-combobox" style="width: 100%;"
								url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_user_position"
								multiSelect="true" style="width: 100%;"
								onvaluechanged="onFilterChanged" valueField="value"
								textField="label" showClose="true"
								oncloseclick="onFilterClose(this)" />
					</div>
					<div type="comboboxcolumn" autoShowPopup="true" name="sex"  field="sex" headerAlign="center" allowSort="true" width="120" >性别
						<input property="editor" class="mini-combobox"  textField="label" valueField="value"  style="width:100%;"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sex" />
						<input
								id="sex-Filter" name="mini-column-filter"
								property="filter" class="mini-combobox" style="width: 100%;"
								url="${ctx}/ims-ext/sys/dict/listDataStr?type=sex"
								multiSelect="true" style="width: 100%;"
								onvaluechanged="onFilterChanged" valueField="value"
								textField="label" showClose="true"
								oncloseclick="onFilterClose(this)" />
					</div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" visible="false">编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>

        </div>
    </div>
   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SmUser",
				dataUrl:"${ctx}/ims-org${ims_org_suffix}/sm/smUser/allData",
				getUrl:"${ctx}/ims-org${ims_org_suffix}/sm/smUser/get",
				saveUrl:"${ctx}/ims-org${ims_org_suffix}/sm/smUser/save",
				removeUrl:"${ctx}/ims-org${ims_org_suffix}/sm/smUser/remove",
				exportUrl:"${ctx}/ims-org${ims_org_suffix}/sm/smUser/export"
			 }
	       );

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.create_comp',
						label: '创建人公司',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.seq_no',
						label: '排序',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.sm_org_id',
						label: '安全组织机构id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.name',
						label: '姓名',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.user_id',
						label: '用户id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.phone',
						label: '电话',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.pos_code',
						label: '岗位',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.sex',
						label: '性别',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
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
						size: 200
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