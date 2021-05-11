<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

	   <sys:toolbargridsingle objId="SysUser" permissionEdit="sys:sysUser:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-treegrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysUser/allData" idField="id"
			 parentField="parentId" resultAsTree="false" showTreeIcon="true" treeColumn="name"
			 expandOnLoad="true" treeColumn="name" allowDrag="true" allowDrop="true" allowLeafDropIn="true"
			 allowResize="true" pageSize="100" autoLoad="false"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
				<div name="action" width="80" headerAlign="center" align="center"
						renderer="onTreeActionRenderer" cellStyle="padding:0;">操作</div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编号
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="companyId" field="companyId" vtype="required"   headerAlign="center" allowSort="true" width="64"  hideable="true" visible="false">公司
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="orgId" field="orgId" vtype="required"   headerAlign="center" allowSort="true" width="64" >归属机构
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="orgName" field="orgName" vtype="required"   headerAlign="center" allowSort="true" width="200">归属机构名称
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="loginName" field="loginName" vtype="required"   headerAlign="center" allowSort="true" width="100" >登录名
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="no" field="no" vtype=""   headerAlign="center" allowSort="true" width="100" >工号
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="name" field="name" vtype="required"   headerAlign="center" allowSort="true" width="100" >姓名
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
						onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
					</div>
					<div name="email" field="email" vtype=""   headerAlign="center" allowSort="true" width="200" >邮箱
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="phone" field="phone" vtype=""   headerAlign="center" allowSort="true" width="200" >电话
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="mobile" field="mobile" vtype=""   headerAlign="center" allowSort="true" width="200" >手机
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div type="comboboxcolumn" autoShowPopup="true" name="userType"  field="userType" vtype=""  headerAlign="center" allowSort="true" width="120" >用户类型
						<input property="editor" class="mini-combobox" style="width:100%;" valueField="value"  textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_user_type" />
					</div>

        </div>
    </div>
   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysUser",
				dataUrl:"${ctx}/sys/sysUser/allData",
				getUrl:"${ctx}/sys/sysUser/get",
				saveUrl:"${ctx}/sys/sysUser/save",
				removeUrl:"${ctx}/sys/sysUser/remove",
				exportUrl:"${ctx}/sys/sysUser/export"
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
						id: 'a.company_id',
						label: '归属公司',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.org_id',
						label: '归属部门',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.login_name',
						label: '登录名',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.password',
						label: '密码',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.no',
						label: '工号',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.name',
						label: '姓名',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.email',
						label: '邮箱',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.phone',
						label: '电话',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.mobile',
						label: '手机',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.user_type',
						label: '用户类型',
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
								$.getJSON('${ctx}/sys/dict/listDataStr?type=sys_user_type', function (data) {
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
						id: 'a.photo',
						label: '用户头像',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.login_ip',
						label: '最后登陆IP',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.login_date',
						label: '最后登陆时间',
						type: 'datetime',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.login_flag',
						label: '是否可登录',
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
</script>
</body>
</html>