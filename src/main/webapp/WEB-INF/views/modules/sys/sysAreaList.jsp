<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>区域城市</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

	   <sys:toolbargridsingle objId="SysArea" permissionEdit="sys:sysArea:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-treegrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysArea/allData" idField="id"
			 parentField="parentId" resultAsTree="false" showTreeIcon="true" treeColumn="name"
			 expandOnLoad="0" treeColumn="name" allowDrag="true" allowDrop="true" allowLeafDropIn="true"
			 allowResize="true" pageSize="100"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true" virtualScroll="true"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
				<div name="action" width="80" headerAlign="center" align="center"
						renderer="onTreeActionRenderer" cellStyle="padding:0;">操作</div>
					<div name="id" field="id" vtype="required"   headerAlign="center" allowSort="true" width="64" >编号
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="name" field="name" vtype="required"   headerAlign="center" allowSort="true" width="150" >名称
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="areaNo" field="areaNo" vtype=""   headerAlign="center" allowSort="true" width="64" >统一编号
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="sort" field="sort" vtype="required"   headerAlign="center" allowSort="true" width="120" >排序
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="code" field="code" vtype=""   headerAlign="center" allowSort="true" width="100" >区域编码
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div type="comboboxcolumn" autoShowPopup="true" name="type"  field="type" vtype=""  headerAlign="center" allowSort="true" width="120" >区域类型
						<input property="editor" class="mini-combobox" style="width:100%;" valueField="value"  textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_area_type" />
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
			    objId:"SysArea",
				dataUrl:"${ctx}/sys/sysArea/allData",
				getUrl:"${ctx}/sys/sysArea/get",
				saveUrl:"${ctx}/sys/sysArea/save",
				removeUrl:"${ctx}/sys/sysArea/remove",
				exportUrl:"${ctx}/sys/sysArea/export"
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
						id: 'a.code',
						label: '区域编码',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.type',
						label: '区域类型',
						type: 'string',
						default_value: '',
						size: 120
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
								$.getJSON('${ctx}/sys/dict/listDataStr?type=sys_area_type', function (data) {
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
</script>
</body>
</html>