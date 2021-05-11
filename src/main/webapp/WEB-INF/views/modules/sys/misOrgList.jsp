<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>组织结构</title>
	<meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

	   <sys:toolbargridsingle objId="SysOrg" permissionEdit="sys:sysOrg:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-treegrid" style="width:100%;height:100%;"
			 url="${ctx}/ims-ext/sys/sysOrg/allDataNoControl" idField="id" expandOnNodeClick="true"
			 parentField="parentId" resultAsTree="false" showTreeIcon="true" treeColumn="name"
			 expandOnLoad="0" treeColumn="name" allowDrag="true" allowDrop="true" allowLeafDropIn="true"
			 allowResize="true" pageSize="100" autoLoad="false"
			 allowCellEdit="false" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true" virtualScroll="true"
		>
			<div property="columns">

				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编号
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="name" field="name" vtype="required"   headerAlign="center" allowSort="true" width="200" >名称
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="shortName"  field="shortName" vtype=""  headerAlign="center" allowSort="true" width="100" >简称
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="shortName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
                    <div name="orgCode" field="orgCode" vtype=""   headerAlign="center" allowSort="true" width="100" >机构编码
                        <input property="editor" class="mini-textbox" style="width:100%;"  />
                    </div>
                    <div name="parentId" field="parentId" vtype="required"   headerAlign="center" allowSort="true" width="200" visible="false" >父id
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="parentId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
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
			    objId:"SysOrg",
				dataUrl:"${ctx}/ims-ext/sys/sysOrg/allDataNoControl",
				getUrl:"${ctx}/ims-ext/sys/sysOrg/get",
				saveUrl:"${ctx}/ims-ext/sys/sysOrg/save",
				removeUrl:"${ctx}/ims-ext/sys/sysOrg/remove",
				exportUrl:"${ctx}/ims-ext/sys/sysOrg/export"
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
					},{
						id: 'a.short_name',
						label: '简称',
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
						id: 'a.area_id',
						label: '归属区域',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.code',
						label: '区域编码',
						type: 'string',
						default_value: '',
						size: 100
					},{
                        id: 'a.orgCode',
                        label: '机构编码',
                        type: 'string',
                        default_value: '',
                        size: 100
                    },{
                        id: 'a.status',
                        label: '状态',
                        type: 'string',
                        default_value: '',
                        size: 64
                    }
					,{
						id: 'a.type',
						label: '机构类型',
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
								$.getJSON('${ctx}/sys/dict/listDataStr?type=sys_org_type', function (data) {
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
						id: 'a.grade',
						label: '机构等级',
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
								$.getJSON('${ctx}/sys/dict/listDataStr?type=sys_org_grade', function (data) {
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
						id: 'a.address',
						label: '联系地址',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.zip_code',
						label: '邮政编码',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.master',
						label: '联系人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.phone',
						label: '电话',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.fax',
						label: '传真',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.email',
						label: '邮箱',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.useable',
						label: '是否启用',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.primary_person',
						label: '负责人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.addr',
						label: '详细地址',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.lng',
						label: '经度',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.lat',
						label: '纬度',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.site_id',
						label: '站点ID',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.deputy_person',
						label: '副负责人',
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
   
   orgSelectAll();
   
   function orgSelectAll(){
	   var select = "${select}";
	   var tree = mini.get("datagridMain");
	   console.log("select:",select);
	   if(select==1){
       	tree.selectAll();
	   }
   }
</script>
</body>
</html>