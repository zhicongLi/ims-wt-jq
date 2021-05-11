<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统菜单</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysMenu" permissionEdit="sys:sysMenu:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysMenu/data" idField="id"
			 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="true"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
				<div name="action" width="80" headerAlign="center" align="center"
						renderer="onTreeActionRenderer" cellStyle="padding:0;">操作</div>
					<div name="id" field="id"  readOnly="false"  headerAlign="center" allowSort="true" width="64" >编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
                    <div name="parentId"  field="parentId"  vtype="required"   headerAlign="center" allowSort="true" width="100" >父级菜单
                        <input property="editor" class="mini-treeselect" url="${ctx}/sys/sysMenu/allData" valueField="id" textField="name" parentField="parentId" style="width:100%;" />
                    </div>
					<%--<div name="parentIds" field="parentIds" vtype="required"   headerAlign="center" allowSort="true" width="120" >所有父级编号--%>
						<%--<input property="editor" class="mini-textbox"  style="width:100%;"  />--%>
					<%--</div>--%>
					<div name="name" field="name" vtype="required"   headerAlign="center" allowSort="true" width="100" >名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="sort" field="sort" vtype="required"   headerAlign="center" allowSort="true" width="60" >排序
						<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
					</div>
					<div name="href" field="href" vtype=""   headerAlign="center" allowSort="true" width="100" >链接
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="target" field="target" vtype=""   headerAlign="center" allowSort="true" width="80" >目标
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="icon" field="icon" vtype=""   headerAlign="center" allowSort="true" width="80" >图标
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div type="checkboxcolumn"  name="isShow"  field="isShow"  vtype=""  headerAlign="center" allowSort="true" width="60" trueValue="1" falseValue="0">是否在菜<br/>单中显示

					</div>
					<div name="permission" field="permission" vtype=""   headerAlign="center" allowSort="true" width="100" >权限标识
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="permission-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div type="comboboxcolumn" autoShowPopup="true" name="type"  field="type" vtype=""  headerAlign="center" allowSort="true" width="30" >菜单类型
						<input property="editor" class="mini-combobox" style="width:100%;" valueField="value"  textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_menu_type" />
					</div>

					<div name="objId" field="objId" vtype=""   headerAlign="center" allowSort="true" width="64" >对象ID
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
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
			    objId:"SysMenu",
				dataUrl:"${ctx}/sys/sysMenu/data",
				getUrl:"${ctx}/sys/sysMenu/get",
				saveUrl:"${ctx}/sys/sysMenu/save",
				removeUrl:"${ctx}/sys/sysMenu/remove",
				exportUrl:"${ctx}/sys/sysMenu/export"
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
						id: 'a.parent_id',
						label: '父级编号',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.parent_ids',
						label: '所有父级编号',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.sort',
						label: '排序',
						type: 'integer',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.href',
						label: '链接',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.target',
						label: '目标',
						type: 'string',
						default_value: '',
						size: 20
					}
					,{
						id: 'a.icon',
						label: '图标',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.is_show',
						label: '是否在菜单中显示',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.permission',
						label: '权限标识',
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
						id: 'a.type',
						label: '菜单类型',
						type: 'string',
						default_value: '',
						size: 30
						,
						plugin: 'selectize',
						plugin_config: {
							valueField: 'value',
							labelField: 'label',
							searchField: 'label',
							sortField: 'value',
							create: true,
							maxItems: 1,
							onInitialize: function () {
								var that = this;
								$.getJSON('${ctx}/sys/dict/listDataStr?type=sys_menu_type', function (data) {
									data.forEach(function (item) {
										that.addOption(item);
									});
								});
							}
						},
						valueSetter: function(rule, value) {
							rule.$el.find('.rule-value-container select')[0].selectize.setValue(value);
						}
					}
					,{
						id: 'a.obj_id',
						label: '对象ID',
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