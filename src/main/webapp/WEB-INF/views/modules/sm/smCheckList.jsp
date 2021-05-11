<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全检查</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SmCheck" permissionEdit="sm:smCheck:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-treegrid" style="width:100%;height:100%;"
			 url="${ctx}/ims-check${ims_check_suffix}/sm/smCheck/allData" idField="id"
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
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createByName" field="createByName" vtype=""   headerAlign="center" allowSort="true" width="64" >创建人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="tenantId" field="tenantId" vtype=""   headerAlign="center" allowSort="true" width="64" >租户id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="tenantId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createBy" field="createBy" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createDept" field="createDept" vtype=""   headerAlign="center" allowSort="true" width="64" >创建部门
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createDept-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createDate"  field="createDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >创建时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateByName" field="updateByName" vtype=""   headerAlign="center" allowSort="true" width="64" >修改人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="updateByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateBy" field="updateBy" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="64" >修改人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateDate"  field="updateDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >修改时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="siteId" field="siteId" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="64" >站点id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="siteId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="title" field="title" vtype=""   headerAlign="center" allowSort="true" width="255" >安全检查主题
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="title-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="content"  field="content" vtype=""   headerAlign="center" allowSort="true" width="100" >安全检查内容
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="content-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="types" field="types" vtype=""   headerAlign="center" allowSort="true" width="64" >检查类型
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="types-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="hostDeptId" field="hostDeptId" vtype=""   headerAlign="center" allowSort="true" width="64" >组织部门id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="hostDeptId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="hostDeptName" field="hostDeptName" vtype=""   headerAlign="center" allowSort="true" width="64" >组织部门名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="hostDeptName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="startDate" field="startDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >检查开始时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="startDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="endDate" field="endDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >检查结束时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="endDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="joinInDeptIds" field="joinInDeptIds" vtype=""   headerAlign="center" allowSort="true" width="100" >参与部门ids
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="joinInDeptIds-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="joinInDeptNames" field="joinInDeptNames" vtype=""   headerAlign="center" allowSort="true" width="100" >参与部门名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="joinInDeptNames-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkLibId" field="checkLibId" vtype=""   headerAlign="center" allowSort="true" width="64" >安全检查库id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkLibId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"SmCheck",
				dataUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheck/allData",
				getUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheck/get",
				saveUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheck/save",
				removeUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheck/remove",
				exportUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheck/export"
			 }
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
   //////////操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){

   }

</script>
</body>
</html>