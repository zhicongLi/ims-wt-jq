<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>计量单位</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

      <sys:toolbargridsingle objId="SysIsoUnit" permissionEdit="sys:sysIsoUnit:edit"></sys:toolbargridsingle>

       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysIsoUnit/data" idField="id"
			 allowResize="true" pageSize="10"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required"   headerAlign="center" allowSort="true" width="64" >单位编码
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="descr" field="descr" vtype="required"   headerAlign="center" allowSort="true" width="100" >单位名称
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<%--<div name="measUnitType" field="measUnitType" vtype=""   headerAlign="center" allowSort="true" width="64" >单位类型--%>
						<%--<input property="editor" class="mini-textbox" style="width:100%;"  />--%>
					<%--</div>--%>
					<div name="note" field="note" vtype=""   headerAlign="center" allowSort="true" width="255" >备注信息
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="relId" field="relId" vtype=""   headerAlign="center" allowSort="true" width="64" >关联单位编码
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="relFactor" field="relFactor" vtype=""   headerAlign="center" allowSort="true" width="120" >关联转换因子
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
        </div>
    </div>
   </div>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">
	initBase(
			{   id:"datagridMain",
			    objId:"SysIsoUnit",
				dataUrl:"${ctx}/sys/sysIsoUnit/data",
				getUrl:"${ctx}/sys/sysIsoUnit/get",
				saveUrl:"${ctx}/sys/sysIsoUnit/save",
				removeUrl:"${ctx}/sys/sysIsoUnit/remove",
				exportUrl:"${ctx}/sys/sysIsoUnit/export"
			 }
	       );

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: '单位编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.descr',
						label: '单位名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.meas_unit_type',
						label: '单位类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.note',
						label: '备注信息',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.rel_id',
						label: '关联单位编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.rel_factor',
						label: '关联转换因子',
						type: 'string',
						default_value: '',
						size: 120
					}
			]
	);
   loadWindow();
</script>
</body>
</html>