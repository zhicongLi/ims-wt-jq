<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>组织结构</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

	   <sys:toolbargridsingle objId="SysOrg" permissionEdit="sys:sysOrg:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-treegrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysOrg/cmConData" idField="id"
			 parentField="parentId" resultAsTree="false" showTreeIcon="true" treeColumn="name"
			 expandOnLoad="0" treeColumn="name" allowDrag="true" allowDrop="true" allowLeafDropIn="true"
			 allowResize="true" pageSize="100" autoLoad="false"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true" virtualScroll="true"
		>
			<div property="columns">

				<div type="checkcolumn"></div>
				<div name="action" width="80" headerAlign="center" align="center"
						renderer="onTreeActionRenderer" cellStyle="padding:0;">操作</div>
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
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="sort" field="sort" vtype=""   headerAlign="center" allowSort="true" width="120" >排序
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="code" field="code" vtype=""   headerAlign="center" allowSort="true" width="100" >区域编码
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
                    <div name="orgCode" field="orgCode" vtype=""   headerAlign="center" allowSort="true" width="100" >机构编码
                        <input property="editor" class="mini-textbox" style="width:100%;"  />
                    </div>
                    <div name="status" field="status" vtype=""   headerAlign="center" allowSort="true" width="100" >状态
                        <input property="editor" class="mini-textbox" style="width:100%;"  />
                    </div>
					<div type="comboboxcolumn" autoShowPopup="true" name="type"  field="type" vtype="required"  headerAlign="center" allowSort="true" width="120" >机构类型
						<input property="editor" class="mini-combobox" style="width:100%;" valueField="value"  textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_org_type" />
					</div>

					<div type="comboboxcolumn" autoShowPopup="true" name="grade"  field="grade" vtype="required"  headerAlign="center" allowSort="true" width="120" >机构等级
						<input property="editor" class="mini-combobox" style="width:100%;" valueField="value"  textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_org_grade" />
					</div>

					<div name="address" field="address" vtype=""   headerAlign="center" allowSort="true" width="255" >联系地址
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="zipCode" field="zipCode" vtype=""   headerAlign="center" allowSort="true" width="100" >邮政编码
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="master" field="master" vtype=""   headerAlign="center" allowSort="true" width="100" >联系人
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="phone" field="phone" vtype=""   headerAlign="center" allowSort="true" width="200" >电话
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="fax" field="fax" vtype=""   headerAlign="center" allowSort="true" width="200" >传真
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="email" field="email" vtype=""   headerAlign="center" allowSort="true" width="200" >邮箱
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div type="checkboxcolumn"  name="useable"  field="useable"  vtype=""  headerAlign="center" allowSort="true" width="64" >是否启用

					</div>
					<div name="primaryPerson" field="primaryPerson" vtype=""   headerAlign="center" allowSort="true" width="64" >负责人
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="addr" field="addr" vtype=""   headerAlign="center" allowSort="true" width="200" >详细地址
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="lng" field="lng" vtype=""   headerAlign="center" allowSort="true" width="120" >经度
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="lat" field="lat" vtype=""   headerAlign="center" allowSort="true" width="120" >纬度
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="siteId" field="siteId" vtype=""   headerAlign="center" allowSort="true" width="64" >站点ID
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="deputyPerson" field="deputyPerson" vtype=""   headerAlign="center" allowSort="true" width="64" >副负责人
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
			    objId:"SysOrg",
				dataUrl:"${ctx}/sys/sysOrg/cmConData",
				getUrl:"${ctx}/sys/sysOrg/get",
				saveUrl:"${ctx}/sys/sysOrg/save",
				removeUrl:"${ctx}/sys/sysOrg/remove",
				exportUrl:"${ctx}/sys/sysOrg/export"
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