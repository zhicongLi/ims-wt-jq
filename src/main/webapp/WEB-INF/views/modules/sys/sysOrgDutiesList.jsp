<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>组织职位对应</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysOrgDuties" permissionEdit="sys:sysOrgDuties:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysOrgDuties/data" idField="id"
			 allowResize="true" pageSize="10"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编号
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					
					<div name="dutiesName" field="dutiesName" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >职位名称
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					
					<div name="otherOrgId" field="otherOrgId" vtype=""   headerAlign="center" allowSort="true" width="230" displayField="otherOrgName">组织名称
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div type="comboboxcolumn" autoShowPopup="true" name="dutiesId"  field="dutiesId" vtype="" headerAlign="center" allowSort="true" width="120" >职位
							<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=wp_duties_type_id" />
					</div>	
        </div>
    </div>
   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysOrgDuties",
				dataUrl:"${ctx}/sys/sysOrgDuties/data",
				getUrl:"${ctx}/sys/sysOrgDuties/get",
				saveUrl:"${ctx}/sys/sysOrgDuties/save",
				removeUrl:"${ctx}/sys/sysOrgDuties/remove",
				exportUrl:"${ctx}/sys/sysOrgDuties/export"
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
						id: 'a.other_org_id',
						label: '组织名称',
						type: 'string',
						default_value: '',
						size: 64
					},{
						id: 'a.duties_id',
						label: '职位',
						type: 'string',
						default_value: '',
						size: 64
					}
					
			]
	);
   loadWindow();
</script>
</body>
</html>