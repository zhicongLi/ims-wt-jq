<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>是否可编辑控制行</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysEditControlLine"  permissionEdit="sys:sysEditControlLine:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/ims-ext/sys/sysEditControlLine/data" idField="id"
			 allowResize="true" pageSize="10"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="sec.id"  field="sec.id" vtype="required"  headerAlign="center" allowSort="true" width="64" hideable="true"  visible="false" visible="false">编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="sec.objName"  field="sec.objName" vtype=""  headerAlign="center" allowSort="true" width="100" sortField="b.obj_name">对象名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="objName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="sec.name"  field="sec.name" vtype=""  headerAlign="center" allowSort="true" width="120" sortField="b.name">名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="sec.seqNo"  field="sec.seqNo" vtype=""  headerAlign="center" allowSort="true" width="60" sortField="b.seq_no">序号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="seqNo-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div type="checkboxcolumn" field="sec.isActive" trueValue="1" falseValue="0" width="60" headerAlign="center" sortField="b.is_acitve">是否启用</div>
					
					<div name="id"  field="id" readOnly="true"  vtype="required" headerAlign="center" allowSort="true"  width="64" hideable="true"  visible="false">编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="editControlId" hideable="true" visible="false"  field="editControlId" headerAlign="center" allowSort="true" width="150" >
						<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
					</div>
					<div name="fieldName"  field="fieldName"   vtype="" headerAlign="center" allowSort="true"  width="150" sortField="a.field_name">字段名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="fieldName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="fieldDesc"  field="fieldDesc"   vtype="" headerAlign="center" allowSort="true"  width="150" sortField="a.field_desc">字段描述
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="fieldDesc-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="type"  field="type" vtype=""  headerAlign="center" allowSort="true" width="64" type="comboboxcolumn" sortField="a.type">类型
						<input property="editor" class="mini-combobox"  style="width:100%;"  valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_edit_control_line_type"  />
					</div>
					<div type="checkboxcolumn" field="isEdit" trueValue="1" falseValue="0" width="80" headerAlign="center" sortField="a.is_edit">是否可编辑</div>
					<div type="checkboxcolumn" field="isRequired" trueValue="1" falseValue="0" width="60" headerAlign="center" sortField="a.is_required">是否必填</div>
					<div name="formId"  field="formId"   vtype="" headerAlign="center" allowSort="true"  width="100" sortField="a.form_id">表单id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="formId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="condGroup"  field="condGroup" vtype="required"  headerAlign="center" allowSort="true" width="64" type="comboboxcolumn" sortField="a.cond_group">条件分组
						<input property="editor" class="mini-combobox"  style="width:100%;"  valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_edit_control_condtion_cond_group"  />
					</div>
					<div name="message"  field="message"   vtype="" headerAlign="center" allowSort="true"  width="64" sortField="a.message">提示信息
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
			    objId:"SysEditControlLine",
				dataUrl:"${ctx}/ims-ext/sys/sysEditControlLine/data",
				getUrl:"${ctx}/ims-ext/sys/sysEditControlLine/get",
				saveUrl:"${ctx}/ims-ext/sys/sysEditControlLine/save",
				removeUrl:"${ctx}/ims-ext/sys/sysEditControlLine/remove",
				exportUrl:"${ctx}/ims-ext/sys/sysEditControlLine/export"
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
						id: 'a.type',
						label: '类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.is_active',
						label: '是否启用',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.obj_name',
						label: '对象名称',
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