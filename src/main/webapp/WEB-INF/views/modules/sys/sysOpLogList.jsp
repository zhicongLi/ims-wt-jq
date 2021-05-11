<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>日志管理</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysOpLog"  permissionEdit="sys:sysOpLog:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysOpLog/data" idField="id"
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
					<div name="opKey" field="opKey" vtype=""   headerAlign="center" allowSort="true" width="150" >业务主键
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="valueNew" field="valueNew" vtype=""   headerAlign="center" allowSort="true" width="120" >修改后
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="valueOld" field="valueOld" vtype=""   headerAlign="center" allowSort="true" width="120" >修改前
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="opText" field="opText" vtype=""   headerAlign="center" allowSort="true" width="120" >内容
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="opField" field="opField" vtype=""   headerAlign="center" allowSort="true" width="150" >字段
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建者
					</div>
					<div name="createDate"  field="createDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >创建时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
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
			    objId:"SysOpLog",
				dataUrl:"${ctx}/sys/sysOpLog/data",
				getUrl:"${ctx}/sys/sysOpLog/get",
				saveUrl:"${ctx}/sys/sysOpLog/save",
				removeUrl:"${ctx}/sys/sysOpLog/remove",
				exportUrl:"${ctx}/sys/sysOpLog/export"
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
						id: 'a.op_key',
						label: '业务主键',
						type: 'string',
						default_value: '',
						size: 150
					}
					,{
						id: 'a.value_new',
						label: '修改后',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.value_old',
						label: '修改前',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.op_text',
						label: '内容',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.op_field',
						label: '字段',
						type: 'string',
						default_value: '',
						size: 150
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