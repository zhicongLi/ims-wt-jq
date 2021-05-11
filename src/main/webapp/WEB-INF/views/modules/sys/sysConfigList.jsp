<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统配置</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

	   <sys:toolbargridsingle objId="SysConfig" permissionEdit="sys:sysConfig:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysConfig/data" idField="id"
			 allowResize="true" pageSize="10"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required"   headerAlign="center" allowSort="true" width="64" >编号
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="propId" field="propId" vtype=""   headerAlign="center" allowSort="true" width="50" >属性编码
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="propId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="propValue" field="propValue" vtype=""   headerAlign="center" allowSort="true" width="120" >属性值
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="propValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="100" >属性名称
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="description" field="description" vtype=""   headerAlign="center" allowSort="true" width="100" >描述
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注信息
						<input property="editor" class="mini-textarea" style="width:100%;"  />
					</div>
        </div>
    </div>
   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">
	initBase(
			{   id:"datagridMain",
			    objId:"SysConfig",
				dataUrl:"${ctx}/sys/sysConfig/data",
				getUrl:"${ctx}/sys/sysConfig/get",
				saveUrl:"${ctx}/sys/sysConfig/save",
				removeUrl:"${ctx}/sys/sysConfig/remove",
				exportUrl:"${ctx}/sys/sysConfig/export"
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
						id: 'a.prop_id',
						label: '属性编码',
						type: 'string',
						default_value: '',
						size: 50
					}
					,{
						id: 'a.prop_value',
						label: '属性值',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.name',
						label: '属性名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.description',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 100
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
</script>
</body>
</html>