<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>对象生成代码</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="GenScheme"  permissionEdit="gen:genScheme:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/gen/genScheme/data" idField="id"
			 allowResize="true" pageSize="20"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="200" >名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="category" field="category" vtype=""   headerAlign="center" allowSort="true" width="120" >分类
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="category-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="packageName" field="packageName" vtype=""   headerAlign="center" allowSort="true" width="500" >生成包路径
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="packageName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="moduleName" field="moduleName" vtype=""   headerAlign="center" allowSort="true" width="30" >生成模块名
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="moduleName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="subModuleName" field="subModuleName" vtype=""   headerAlign="center" allowSort="true" width="30" >生成子模块名
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="subModuleName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="functionName" field="functionName" vtype=""   headerAlign="center" allowSort="true" width="500" >生成功能名
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="functionName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="functionNameSimple" field="functionNameSimple" vtype=""   headerAlign="center" allowSort="true" width="100" >生成功能名（简写）
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="functionNameSimple-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="functionAuthor" field="functionAuthor" vtype=""   headerAlign="center" allowSort="true" width="100" >生成功能作者
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="functionAuthor-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="genTableId" field="genTableId" vtype=""   headerAlign="center" allowSort="true" width="200" >生成表编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="genTableId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建者
						<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createDate"  field="createDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >创建时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >更新者
						<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateDate"  field="updateDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >更新时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注信息
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="parentMenuId" field="parentMenuId" vtype=""   headerAlign="center" allowSort="true" width="64" >父级菜单
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="parentMenuId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
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
			    objId:"GenScheme",
				dataUrl:"${ctx}/gen/genScheme/data",
				getUrl:"${ctx}/gen/genScheme/get",
				saveUrl:"${ctx}/gen/genScheme/save",
				removeUrl:"${ctx}/gen/genScheme/remove",
				exportUrl:"${ctx}/gen/genScheme/export"
			 }
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
						id: 'a.name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.category',
						label: '分类',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.package_name',
						label: '生成包路径',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.module_name',
						label: '生成模块名',
						type: 'string',
						default_value: '',
						size: 30
					}
					,{
						id: 'a.sub_module_name',
						label: '生成子模块名',
						type: 'string',
						default_value: '',
						size: 30
					}
					,{
						id: 'a.function_name',
						label: '生成功能名',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.function_name_simple',
						label: '生成功能名（简写）',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.function_author',
						label: '生成功能作者',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.gen_table_id',
						label: '生成表编号',
						type: 'string',
						default_value: '',
						size: 200
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
					,{
						id: 'a.parent_menu_id',
						label: '父级菜单',
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