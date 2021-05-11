<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>客户账户管理</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="mini-fit">
<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
	   <%-- <sys:toolbargridmain objId="SysUser" permissionEdit="sys:sysUser:view"></sys:toolbargridmain> --%>
			 <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/user/data" idField="id"
					 allowResize="true" pageSize="100"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true"
				>
					<div property="columns">										    
						    <!-- <div name="action" width="80"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div> -->
						    <!-- <div type="checkcolumn" hideable="true" visible="false"></div> -->
							<!-- <div name="orgName"  field="orgName" vtype="required"  headerAlign="center" allowSort="true" width="500" >归属部门
							    <input property="editor" class="mini-textbox" style="width:100%;"/>
							</div> -->
							<div name="companyName"  field="companyName" vtype="required"  headerAlign="center" allowSort="true" width="300" >单位名称
							    <input property="editor" class="mini-textbox" style="width:100%;"/>
							</div>
							<%-- <div type="comboboxcolumn" autoShowPopup="true" name="posCode"  field="posCode" vtype="" headerAlign="center" allowSort="true" width="120" >岗位
								<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_user_pos" />
								<input id="posCode-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
									    url="${ctx}/sys/dict/listDataStr?type=sys_user_pos" multiSelect="true" style="width: 100%;"
									   onvaluechanged = "onFilterChanged" valueField="value"  textField="label"
									   showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div> --%>
							<div name="loginName"  field="loginName" vtype="required"  headerAlign="center" allowSort="true" width="100" >登录名
								<input property="editor" class="mini-textbox" style="width:100%;"  />
								<input id="loginName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged"
								/>
							</div>												
							<div name="name"  field="name" vtype="required"  headerAlign="center" allowSort="true" width="100" >姓名
								<input property="editor" class="mini-textbox" style="width:100%;"  />
								<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged"
								/>
							</div>
							<div name="email"  field="email" vtype=""  headerAlign="center" allowSort="true" width="200" >邮箱
								<input property="editor" class="mini-textbox" style="width:100%;"  />
							</div>
							<!-- <div name="phone"  field="phone" vtype=""  headerAlign="center" allowSort="true" width="100" >电话
								<input property="editor" class="mini-textbox" style="width:100%;"  />
							</div> -->
							<div name="mobile"  field="mobile" vtype=""  headerAlign="center" allowSort="true" width="100" >手机
								<input property="editor" class="mini-textbox" style="width:100%;"  />
							</div>
							<%-- <div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="100" >编号
								<input property="editor" class="mini-textbox" style="width:100%;"  />
							</div>	
							<div name="no"  field="no" vtype=""  headerAlign="center" allowSort="true" width="100" >工号
								<input property="editor" class="mini-textbox" style="width:100%;"  />
								<input id="no-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged"
								/>
							</div>
							<div type="comboboxcolumn" autoShowPopup="true" name="userType"  field="userType" vtype="" headerAlign="center" allowSort="true" width="120" >用户类型
								<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_user_type" />
							</div>
							<div name="photo"  field="photo" vtype=""  headerAlign="center" allowSort="true" width="120" >用户头像
								<input property="editor" class="mini-textbox" style="width:100%;"  />
							</div> --%>
							<div name="loginIp"  field="loginIp" vtype=""  headerAlign="center" allowSort="true" width="100" >最后登陆IP
								<input property="editor" class="mini-textbox" style="width:100%;"  />
							</div>
							<!-- <div name="loginDate"  field="loginDate" vtype="" dateFormat="yyyy-MM-dd hh:mm:ss" headerAlign="center" allowSort="true" width="120" >最后登陆时间
								<input property="editor" class="mini-textbox" style="width:100%;"  />
							</div>
							<div name="loginFlag"  field="loginFlag" vtype=""  headerAlign="center" allowSort="true" width="64" >是否可登录
								<input property="editor" class="mini-checkbox" style="width:100%;"  />
							</div>
							<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建者
							</div> -->
							<div name="createDate"  field="createDate" vtype="required" dateFormat="yyyy-MM-dd hh:mm:ss" headerAlign="center" allowSort="true" width="120" >创建时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
							</div>
							<!-- <div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >更新者
							</div>
							<div name="updateDate"  field="updateDate" vtype="required" dateFormat="yyyy-MM-dd hh:mm:ss" headerAlign="center" allowSort="true" width="120" >更新时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
							</div>
							<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="255" >备注信息
								<input property="editor" class="mini-textarea" style="width:100%;"  />
							</div> -->
				</div>
			</div>
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
			    dataUrl:"${ctx}/sys/sysUser/data",
				//getUrl:"${ctx}/sys/sysUser/get",
				//saveUrl:"${ctx}/sys/sysUser/save",
				//removeUrl:"${ctx}/sys/sysUser/remove",
				//exportUrl:"${ctx}/sys/sysUser/export"
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
   //////////操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){

   }
</script>
</body>
</html>