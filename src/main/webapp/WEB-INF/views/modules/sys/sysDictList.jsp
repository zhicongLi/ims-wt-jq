<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<style type="text/css">
    body{
        display: block;
    }
</style>
<html>
<head>
	<title>系统字典</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <%--<sys:toolbargridsingle objId="SysDict" permissionEdit="sys:dict:edit"></sys:toolbargridsingle>--%>
	   <div style="width:100%;">
		   <div class="mini-toolbar"  style="border-bottom:0;padding:0px;">
			   <table style="width:100%;">
				   <tr>
					   <td style="width:100%;">
						   <input class="mini-hidden" name="_permissionEdit_flag" id="_permissionEdit_flag"/>
						   <a class="mini-button" iconCls="icon-plus-sign" id="_tbGrid_add"   onclick="addRow(null,'after')" plain="true" tooltip="新建"></a>
						   <span class="separator"></span>
						   <a class="mini-button" iconCls="icon-copy" id="_tbGrid_clone" onclick="cloneRow()" plain="true" tooltip="复制"></a>
						   <a class="mini-button" iconCls="icon-remove" id="_tbGrid_remove" style="color:red;" onclick="removeRow()" plain="true" tooltip="删除"></a>
						   <a class="mini-button" iconCls="icon-save" id="_tbGrid_save"  style="color:green;" onclick="saveGrid()" plain="true" tooltip="保存"></a>
						   <a class="mini-button" iconCls="icon-upload-alt"  id="_tbGrid_import" onclick="ImportExcel()" plain="true" tooltip="导入"></a>

						   <a class="mini-button" iconCls="icon-download-alt"  id="_tbGrid_export" onclick="ExportExcel()" plain="true" tooltip="导出"></a>
						   <a class="mini-button" id="btnAdvSearch" iconCls="icon-search" onclick="showAdvQuery()"  plain="true" tooltip="高级查询"></a>
						   <%--<input id="btnQueryList" class="mini-combobox" style="width:150px;" textField="name" valueField="id"
								  url="${ctx}/sys/sysQuery/allData?objId=${objId}&isActive=1&isShow=1" showNullItem="true"  emptyText="[选择查询...]"
								  nullItemText="[选择查询]"  valueFromSelect="true"  />--%>
						   <span class="separator"></span>
						   <a class="mini-button" id="_tbGrid_refresh" iconCls="icon-refresh" onclick="refreshGridData()" plain="true" tooltip="刷新"></a>
						   <a class="mini-menubutton" id="_tbGrid_op" iconCls="icon-cogs"  plain="true" menu="#_pmGrid" tooltip="操作" ></a>
					   </td>
					   <td style="white-space:nowrap;">
						   <input id="_key" class="mini-textbox" emptyText="请输入" style="width:150px;" onenter="onKeyEnter"/>
						   <a class="mini-button" id="_keyGridSearch" onclick="searchGrid()" iconCls="icon-key"  plain="true" tooltip="快速定位"></a>
					   </td>
				   </tr>
			   </table>
			   <ul id="_pmGrid" class="mini-menu" style="display:none;"  textField="name" idField="id" parentField="parentId"    onitemclick="onGridOpMiClick">

			   </ul>
		   </div>
	   </div>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/ims-ext/sys/sysDict/data" idField="id"
			 allowResize="true" pageSize="20"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="value" field="value" vtype="required"   headerAlign="center" allowSort="true" width="100" >数据值
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="value-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
                             onvaluechanged="onFilterChanged"
                      />
					</div>
					<div name="label" field="label" vtype="required"   headerAlign="center" allowSort="true" width="100" >标签名
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						 <input id="label-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
                             onvaluechanged="onFilterChanged"
                      />
					</div>
					<div name="type" field="type" vtype="required"   headerAlign="center" allowSort="true" width="100" >类型
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						  <input id="type-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
                             onvaluechanged="onFilterChanged"
                      />
					</div>
					<div name="description" field="description" vtype="required"   headerAlign="center" allowSort="true" width="100" >描述
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						 <input id="description-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
                             onvaluechanged="onFilterChanged"
                      />
					</div>
					<div name="icon" field="icon" vtype=""   headerAlign="center" allowSort="true" width="100" >图标
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						 <input id="description-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
                             onvaluechanged="onFilterChanged"
                      />
					</div>
					<div name="sort" field="sort"  vtype="required"  headerAlign="center" allowSort="true" width="120" >排序（升序）
						<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
					</div>
					<div name="interNo" field="interNo" vtype=""   headerAlign="center" allowSort="true" width="120" >统一编码
						<input property="editor" class="mini-textbox" allowLimitValue="false" style="width:100%;"  />
					</div>
					<div name="remarks" field="remarks" vtype=""   headerAlign="center" allowSort="true" width="120" >备注
						<input property="editor" class="mini-textbox" allowLimitValue="false" style="width:100%;"  />
					</div>

        </div>
    </div>
   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">


	initBase(
			{   id:"datagridMain",
			    objId:"SysDict",
				<%--dataUrl:"${ctx}/sys/sysDict/data",--%>
				<%--getUrl:"${ctx}/sys/sysDict/get",--%>
				<%--saveUrl:"${ctx}/sys/sysDict/save",--%>
				<%--removeUrl:"${ctx}/sys/sysDict/remove",--%>
				<%--exportUrl:"${ctx}/sys/sysDict/export",--%>
				dataUrl:"${ctx}/ims-ext/sys/sysDict/data",
				getUrl:"${ctx}/ims-ext/sys/sysDict/get",
				saveUrl:"${ctx}/ims-ext/sys/sysDict/save",
				removeUrl:"${ctx}/ims-ext/sys/sysDict/remove",
				exportUrl:"${ctx}/ims-ext/sys/sysDict/export"
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
						id: 'a.value',
						label: '数据值',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.label',
						label: '标签名',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.type',
						label: '类型',
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
						id: 'a.icon',
						label: '图标',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.sort',
						label: '排序（升序）',
						type: 'integer',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.parent_id',
						label: '父级编号',
						type: 'string',
						default_value: '',
						size: 64
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
			]
	);
   loadWindow();
   //////////操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){

   }
</script>
</body>
</html>