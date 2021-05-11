<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统配置可选择项</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysConfigItem"  permissionEdit="sys:sysConfigItem:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysConfigItem/data" idField="id"
			 allowResize="true" pageSize="20"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" visible="false">编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="propId" field="propId" vtype=""   headerAlign="center" allowSort="true" width="150" >属性编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="propId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="propValue" field="propValue" vtype=""   headerAlign="center" allowSort="true" width="100" >属性值
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="propValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="100" >属性名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="description" field="description" vtype=""   headerAlign="center" allowSort="true" width="100" >描述
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="description-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注信息
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="type"   field="type"   headerAlign="center" allowSort="true" width="100" type="comboboxcolumn" vtype="required">属性类别
						<input property="editor"  class="mini-combobox"  required="true"   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_config_type"/>
						<input id="type-Filter" name="mini-column-filter"  property="filter" class="mini-combobox"   style="width:100%;" textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_config_type"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="defaultValue" field="defaultValue" vtype=""   headerAlign="center" allowSort="true" width="100" >默认值
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="defaultValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div type="checkboxcolumn" trueValue="1" falseValue="0"  name="isActive"  field="isActive" vtype=""  headerAlign="center" allowSort="true" width="64" >是否启用
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="isActive-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div type="checkboxcolumn" trueValue="1" falseValue="0"  name="isImmedActive"  field="isImmedActive" vtype=""  headerAlign="center" allowSort="true" width="64" >是否立即生效
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="isImmedActive-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
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
			    objId:"SysConfigItem",
				dataUrl:"${ctx}/sys/sysConfigItem/data",
				getUrl:"${ctx}/sys/sysConfigItem/get",
				saveUrl:"${ctx}/sys/sysConfigItem/save",
				removeUrl:"${ctx}/sys/sysConfigItem/remove",
				exportUrl:"${ctx}/sys/sysConfigItem/export"
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
						size: 100
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
						id: 'a.remarks',
						label: '备注信息',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.type',
						label: '属性类别',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.valid_from',
						label: '有效开始',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.valid_to',
						label: '有效结束',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.default_value',
						label: '默认值',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.is_active',
						label: '是否有效',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.is_immed_active',
						label: '是否立即生效',
						type: 'string',
						default_value: '',
						size: 100
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