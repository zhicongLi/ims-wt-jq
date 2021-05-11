<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>日志管理配置</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysOpLogConfig"  permissionEdit="sys:sysOpLogConfig:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysOpLogConfig/data" idField="id"
			 allowResize="true" pageSize="10"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="objId" field="objId" vtype=""   headerAlign="center" allowSort="true" width="64" >业务对象
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="keyField" field="keyField" vtype=""   headerAlign="center" allowSort="true" width="150" >业务主键字段
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="isActive" field="isActive" vtype=""   headerAlign="center" allowSort="true" width="120" >是否启用
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="logDelete" field="logDelete" vtype=""   headerAlign="center" allowSort="true" width="120" >记录删除
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="logUpdate" field="logUpdate" vtype=""   headerAlign="center" allowSort="true" width="120" >记录更新
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="logInsert" field="logInsert" vtype=""   headerAlign="center" allowSort="true" width="120" >记录新建
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="note" field="note" vtype=""   headerAlign="center" allowSort="true" width="200" >备注
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
        </div>
    </div>
   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysOpLogConfig",
				dataUrl:"${ctx}/sys/sysOpLogConfig/data",
				getUrl:"${ctx}/sys/sysOpLogConfig/get",
				saveUrl:"${ctx}/sys/sysOpLogConfig/save",
				removeUrl:"${ctx}/sys/sysOpLogConfig/remove",
				exportUrl:"${ctx}/sys/sysOpLogConfig/export"
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
						id: 'a.obj_id',
						label: '业务对象',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.key_field',
						label: '业务主键字段',
						type: 'string',
						default_value: '',
						size: 150
					}
					,{
						id: 'a.is_active',
						label: '是否启用',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.log_delete',
						label: '记录删除',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.log_update',
						label: '记录更新',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.log_insert',
						label: '记录新建',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.note',
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