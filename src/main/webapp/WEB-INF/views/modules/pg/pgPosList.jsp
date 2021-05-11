<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>岗位表</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="PgPos" permissionEdit="pg:pgPos:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-treegrid" style="width:100%;height:100%;"
			 url="${ctx}/ims-iam-ext/pg/pgPos/allData" idField="id"
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
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="140" >岗位名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="seqNo" field="seqNo" vtype=""   headerAlign="center" allowSort="true" width="40" >排序
						<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
						<input id="seqNo-Filter" name="mini-column-filter"  property="filter" class="mini-spinner" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="code" field="code" vtype=""   headerAlign="center" allowSort="true" width="64" >岗位编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="code-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="orgName" field="orgName" vtype=""   headerAlign="center" allowSort="true" width="164" >所属组织机构名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="orgName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="specId" field="specId" vtype=""   headerAlign="center" allowSort="true" width="64" >专业ID
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="specId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="roleId" field="roleId" vtype=""   headerAlign="center" allowSort="true" width="64" >对应角色ID
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="roleId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
                    <div name="roleName"  field="roleName"  vtype=""   headerAlign="center" allowSort="true" width="64" >对应角色名称
                        <input property="editor" class="mini-treeselect" url="" valueField="id" textField="name" parentField="parentId" style="width:100%;" />
						<input id="roleName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"PgPos",
				dataUrl:"${ctx}/ims-iam-ext/pg/pgPos/allData",
				getUrl:"${ctx}/ims-iam-ext/pg/pgPos/get",
				saveUrl:"${ctx}/ims-iam-ext/pg/pgPos/save",
				removeUrl:"${ctx}/ims-iam-ext/pg/pgPos/remove",
				exportUrl:"${ctx}/ims-iam-ext/pg/pgPos/export"
			 }
	       );

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: 'id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.name',
						label: '岗位名称',
						type: 'string',
						default_value: '',
						size: 40
					}
					,{
						id: 'a.seq_no',
						label: '排序',
						type: 'integer',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.code',
						label: '岗位编码',
						type: 'string',
						default_value: '',
						size: 40
					}
					,{
						id: 'a.org_id',
						label: '所属组织机构',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.org_name',
						label: '所属组织机构名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.spec_id',
						label: '专业ID',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.spen_name',
						label: '专业名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.role_id',
						label: '对应角色ID',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.role_name',
						label: '对应角色名称',
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