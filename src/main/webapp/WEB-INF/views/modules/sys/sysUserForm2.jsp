<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>用户管理</title>
<meta name="decorator" content="default" />
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css"
	rel="stylesheet" />

</head>
<body>

	<div class="mini-fit">
		<div class="mini-splitter" id="_splTreeMain"
			style="width: 100%; height: 100%;">
			<div size="240" showCollapseButton="true" style="overflow: auto;">
				<div id="_tabsTreeMain" class="mini-tabs" tabPosition="bottom"
					activeIndex="0" plain="false" style="width: 100%; height: 100%;">
					<div title="按组织" id="tabOrg" style="border: 0px;">
						<sys:treewithsearchbar
							dataUrl="${ctx}/ims-iam-ext/sys/sysOrg/allData" idField="id" expandOnLoad="0"
							valueField="id" textField="name" parentField="parentId"
							textFieldLabel="名称"></sys:treewithsearchbar>
					</div>
					<%--<div title="按分组" id="tabGroup" style="border: 0px;">--%>
						<%--<sys:treewithsearchbar idSuffix="2"--%>
							<%--dataUrl="${ctx}/ims-iam-ext/sys/sysGroup/allData" idField="id"--%>
							<%--valueField="id" textField="name" parentField="parentId"--%>
							<%--textFieldLabel="名称"></sys:treewithsearchbar>--%>
					<%--</div>--%>
				</div>
			</div>

			<div showCollapseButton="true">
				<div class="mini-fit">
					<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false"
						style="width: 100%; height: 100%;">
						<div title="列表" id="tabList" style="border: 0px;">
							<sys:toolbargridmain objId="SysUser"
								permissionEdit="sys:sysUser:edit"></sys:toolbargridmain>
							<sys:searchadv></sys:searchadv>
							<div class="mini-fit">
								<div id="datagridMain" class="mini-datagrid"
									style="width: 100%; height: 100%;" url="${ctx}/sys/user/data"
									idField="id" allowResize="true" pageSize="100"
									allowCellSelect="true" multiSelect="false"
									editNextOnEnterKey="true" editNextRowCell="true"
									allowAlternating="true" showFilterRow="true"
									showColumnsMenu="true">
									<div property="columns">
										<div name="action" width="80" headerAlign="center"
											align="center" renderer="onActionRenderer"
											cellStyle="padding:0;">操作</div>
										<div type="checkcolumn" hideable="true" visible="false"></div>
										<div name="orgId" field="orgId" vtype="required"
											headerAlign="center" allowSort="true" width="100">
											归属部门 编号<input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="orgName" field="orgName" vtype="required"
											headerAlign="center" allowSort="true" width="200">
											归属部门 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<%--<div type="comboboxcolumn" autoShowPopup="true" name="posCode"--%>
											<%--field="posCode" vtype="" headerAlign="center"--%>
											<%--allowSort="true" width="120">--%>
											<%--岗位 <input property="editor" class="mini-combobox"--%>
												<%--style="width: 100%;" textField="label" valueField="value"--%>
												<%--url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_user_pos" /> <input--%>
												<%--id="posCode-Filter" name="mini-column-filter"--%>
												<%--property="filter" class="mini-combobox" style="width: 100%;"--%>
												<%--url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_user_pos"--%>
												<%--multiSelect="true" style="width: 100%;"--%>
												<%--onvaluechanged="onFilterChanged" valueField="value"--%>
												<%--textField="label" showClose="true"--%>
												<%--oncloseclick="onFilterClose(this)" />--%>
										<%--</div>--%>
										<div name="loginName" field="loginName" vtype="required"
											headerAlign="center" allowSort="true" width="100">
											登录名 <input property="editor" class="mini-textbox"
												style="width: 100%;" /> <input id="loginName-Filter"
												name="mini-column-filter" property="filter"
												class="mini-textbox" style="width: 100%;"
												onvaluechanged="onFilterChanged" />
										</div>
										<div name="name" field="name" vtype="required"
											headerAlign="center" allowSort="true" width="100">
											姓名 <input property="editor" class="mini-textbox"
												style="width: 100%;" /> <input id="name-Filter"
												name="mini-column-filter" property="filter"
												class="mini-textbox" style="width: 100%;"
												onvaluechanged="onFilterChanged" />
										</div>
										<div name="email" field="email" vtype="" headerAlign="center"
											allowSort="true" width="200">
											邮箱 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="phone" field="phone" vtype="" headerAlign="center"
											allowSort="true" width="100">
											电话 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="mobile" field="mobile" vtype=""
											headerAlign="center" allowSort="true" width="100">
											手机 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="id" field="id" vtype="required"
											headerAlign="center" allowSort="true" width="100">
											编号 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="no" field="no" vtype="" headerAlign="center"
											allowSort="true" width="100">
											工号 <input property="editor" class="mini-textbox"
												style="width: 100%;" /> <input id="no-Filter"
												name="mini-column-filter" property="filter"
												class="mini-textbox" style="width: 100%;"
												onvaluechanged="onFilterChanged" />
										</div>
										<div type="comboboxcolumn" autoShowPopup="true"
											name="userType" field="userType" vtype=""
											headerAlign="center" allowSort="true" width="120">
											用户类型 <input property="editor" class="mini-combobox"
												style="width: 100%;" textField="label" valueField="value"
												url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_user_type" />
										</div>
										<div name="photo" field="photo" vtype="" headerAlign="center"
											allowSort="true" width="120">
											用户头像 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="loginIp" field="loginIp" vtype=""
											headerAlign="center" allowSort="true" width="100">
											最后登陆IP <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="loginDate" field="loginDate" vtype=""
											dateFormat="yyyy-MM-dd hh:mm:ss" headerAlign="center"
											allowSort="true" width="120">
											最后登陆时间 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="loginFlag" field="loginFlag" vtype=""
											headerAlign="center" allowSort="true" width="64">
											是否可登录 <input property="editor" class="mini-checkbox"
												style="width: 100%;" />
										</div>
										<div name="createBy" field="createBy" readOnly="true"
											headerAlign="center" allowSort="true" width="64">创建者</div>
										<div name="createDate" field="createDate" vtype="required"
											dateFormat="yyyy-MM-dd hh:mm:ss" headerAlign="center"
											allowSort="true" width="120">
											创建时间 <input property="editor" class="mini-datepicker"
												style="width: 100%;" />
										</div>
										<div name="updateBy" field="updateBy" readOnly="true"
											headerAlign="center" allowSort="true" width="64">更新者</div>
										<div name="updateDate" field="updateDate" vtype="required"
											dateFormat="yyyy-MM-dd hh:mm:ss" headerAlign="center"
											allowSort="true" width="120">
											更新时间 <input property="editor" class="mini-datepicker"
												style="width: 100%;" />
										</div>
										<div name="token" field="token" vtype=""
											headerAlign="center" allowSort="true" width="100">
											Token <input property="editor" class="mini-textarea"
												style="width: 100%;" />
										</div>
									</div>
								</div>
							</div>
						</div>
						<div title="明细" id="tabForm" style="border: 0px;">
							<sys:toolbarformmain permissionEdit="sys:sysUser:edit"></sys:toolbarformmain>
							<div id="editform" class="form"
								style="width: 100%; height: 100%;">
								<div class="container" style="width: 100%;">
									<div class="mini-clearfix ">
										<div class="mini-col-12">

											<div class="mini-panel" title="基本信息" width="auto"
												height="auto" showCollapseButton="true"
												onbuttonclick="onPanelButtonClick" name="_panel_exp">
												
												<input class="mini-hidden" name="token" id="token" /> <input
													class="mini-hidden" name="companyId" id="companyId" />
												<input class="mini-hidden" name="id" id="id" /> <input
													class="mini-hidden" name="companyId" id="companyId" />
												<table border="0" cellpadding="3" cellspacing="3">
													<tr>

														<td style="text-align: right;">归属组织：</td>
														<td>
															<%--<input name="orgId" id="orgId" textName="orgName" class="mini-buttonedit" vtype = "" onbuttonclick="popLov(this,'选择部门',false,true,'${ctx}/sys/sysOrg/list',850,500,'id,name','orgId,orgName')"  required="false" />--%>
															<input name="orgId" id="orgId" class="mini-treeselect"
															vtype="" required="false" url="${ctx}/ims-iam-ext/sys/sysOrg/allData"
															valueField="id" textField="name" parentField="parentId" />
														</td>
														<td style="text-align: right;">姓名：</td>
														<td><input name="name" id="name" class="mini-textbox"
															vtype="" required="true" /></td>
														<td style="text-align: right;">性别：</td>
														<td><input name="gender" id="gender"
															class="mini-combobox" vtype="" required="true"
															valueField="value" textField="label"
															url="${ctx}/ims-ext/sys/dict/listDataStr?type=sex" />
														</td>
														<td style="text-align: right;">民族：</td>
														<td><input name="nation" id="nation" class="mini-textbox"
															vtype="" required="true" /></td>

													</tr>
													<tr>
														<td style="text-align: right;">用户类型：</td>
														<td><input name="userType" id="userType"
															class="mini-combobox" vtype="" required="true"
															valueField="value" textField="label"
															url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_user_type" />
														</td>
														<td style="text-align: right;">登录名：</td>
														<td><input name="loginName" id="loginName"
															class="mini-textbox" vtype="" required="true" /></td>
														<td style="text-align: right;">学历：</td>
														<td><input name="education" id="education"
															class="mini-combobox" vtype="" required="true"
															valueField="value" textField="label"
															url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_user_edu" />
														</td>
														<td style="text-align: right;">岗位：</td>
														<td><input name="posCode" id="posCode"
															class="mini-combobox" vtype="" valueField="value"
															textField="label"
															url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_user_pos" /></td>

													</tr>
													<tr>

														<td style="text-align: right;">工号：</td>
														<td><input name="no" id="no" class="mini-textbox"
															vtype="" required="false" /></td>
														<td style="text-align: right;">应缴党费：</td>
														<td><input name="partyCost" id="partyCost" class="mini-textbox"
															vtype="float" required="true" /></td>
														<td style="text-align: right;">是否可登录：</td>
														<td><input name="loginFlag" id="loginFlag"
															class="mini-checkbox" trueValue="1" falseValue="0"
															vtype="" required="false" /></td>
													</tr>
													<tr>
														<td style="text-align: right;">邮箱：</td>
														<td><input name="email" id="email"
															class="mini-textbox" vtype="email" required="false" /></td>
														<td style="text-align: right;">电话：</td>
														<td><input name="phone" id="phone"
															class="mini-textbox" vtype="" required="false" /></td>
														<td style="text-align: right;">生日：</td>
														<td><input name="birthday" id="birthday"
															format="yyyy-MM-dd"
															class="mini-datepicker" vtype="" required="false" /></td>
														<td style="text-align: right;">手机：</td>
														<td><input name="mobile" id="mobile"
															class="mini-textbox" vtype="" required="false" /></td>

													</tr>
													<tr>
														
														<td style="text-align: right;">用户头像：</td>
														<td>
															<%--<input name="photo" id="photo" class="mini-textbox" vtype = ""  required="false" />--%>
															<input class="mini-hidden" name="photo" id="photo" /> <sys:ckfinder
																input="photo" type="images" uploadPath="/photo"
																selectMultiple="false" maxWidth="100" maxHeight="100" />
														</td>
														<td style="text-align: right;">现居住地：</td>
														<td><input name="residence" id="residence"
															class="mini-textbox" vtype="" required="false" /></td>
														<td style="text-align: right;">备注信息：</td>
														<td colspan="3"><input name="remarks" id="remarks"
															class="mini-textarea" vtype="" width="400"
															required="false" /></td>
														
													</tr>
													<tr>

														

													</tr>
												
													<%-- <tr>
														<td style="text-align: right;">角色列表：</td>
														<td colspan="7">
															<div id="roleIdStr" name="roleIdStr"
																class="mini-checkboxlist" repeatItems="7"
																repeatLayout="table" textField="name" valueField="id"
																url="${ctx}/ims-iam-ext/sys/sysUser/roleListData"
																url="${ctx}/ims-iam-ext/sys/sysRole/allData"
															></div>
														</td>
													</tr> --%>
													<tr>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
								
								
						<div class="mini-fit">
						 <div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
								<div title="角色" name="tabSysUserRoleList"  style="border: 0px;"  >
									<div class="mini-fit">
									<div id="gridSysUserRoleSublist" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-iam-ext/sys/sysRole/getUserRole" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="true"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="indexcolumn" headerAlign="center" width="30">序号</div>
											<div name="id" hideable="true" visible="false" field="id"
												 headerAlign="center" allowSort="true" width="150">
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200"/>
											</div>
											<div name="name"  field="name" readonly="true"  vtype="" headerAlign="center" allowSort="true"  width="100" >角色名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="name-Filter"  name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysUserRoleSublist')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysUserRoleSublist')"
												/>
											</div>
											<div name="roleCode"  field="roleCode"  readonly="true"  vtype="" headerAlign="center" allowSort="true"  width="100" >编码
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="roleCode-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysUserRoleSublist')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysUserRoleSublist')"
												/>
											</div>
											
											
											<div name="groupValue"  field="groupValue" vtype=""  headerAlign="center" type="comboboxcolumn"  allowSort="true" width="85" >分组
												<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/ims-idms/sysdict/dictionary?type=role_group"  style="width:100%;"  />
												<input id="groupValue-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" multiSelect="true" valueField="value" textField="label"  style="width:100%;" url="${ctx}/ims-idms/sysdict/dictionary?type=role_group"
													   onvaluechanged="onFilterChangedChild(this,'gridSysUserRoleSublist')"showClose="true" oncloseclick="onChildFilterClose(this,'gridSysUserRoleSublist')"
												/>
											</div>
											
											<div name="userId"  field="userId"  readonly="true"  vtype="" headerAlign="center" allowSort="true"  width="100" visible="false">userId
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="userId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysUserRoleSublist')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysUserRoleSublist')"
												/>
											</div>
										</div>
									</div>
								 </div>
							  </div>
							  <div title="岗位" name="tabPgPosUserList"  style="border: 0px;"  >
									<div class="mini-fit">
									<div id="gridPgPosUserSublist" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-iam-ext/pg/pgPosUser/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="true"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="indexcolumn" headerAlign="center" width="30">序号</div>
											<div name="id" hideable="true" visible="false" field="id"
												 headerAlign="center" allowSort="true" width="150">
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200"/>
											</div>
											<div name="pgPos.name"  field="pgPos.name" readonly="true"  vtype="" headerAlign="center" allowSort="true"  width="100" sortField="pos.name">岗位名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="pgPos.name-Filter"  name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridPgPosUserSublist')" showClose="true" oncloseclick="onChildFilterClose(this,'gridPgPosUserSublist')"
												/>
											</div>
											<div name="pgPos.deptName"  field="pgPos.deptName" readonly="true"  vtype="" headerAlign="center" allowSort="true"  width="100" sortField="o1.name">部门
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="pgPos.deptName-Filter"  name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridPgPosUserSublist')" showClose="true" oncloseclick="onChildFilterClose(this,'gridPgPosUserSublist')"
												/>
											</div>
											<div name="pgPos.companyName"  field="pgPos.companyName" readonly="true"  vtype="" headerAlign="center" allowSort="true"  width="100" sortField="o2.name">公司
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="pgPos.companyName-Filter"  name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridPgPosUserSublist')" showClose="true" oncloseclick="onChildFilterClose(this,'gridPgPosUserSublist')"
												/>
											</div>
											<div name="userId"  field="userId"  readonly="true"  vtype="" headerAlign="center" allowSort="true"  width="100" visible="false">userId
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="userId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridPgPosUserSublist')" showClose="true" oncloseclick="onChildFilterClose(this,'gridPgPosUserSublist')"
												/>
											</div>
										</div>
									</div>
								 </div>
							  </div>
						 </div>
		        </div><!--fit-->
						
						
							</div>
						</div>

					</div>
					<sys:toolbarfooter></sys:toolbarfooter>
					<sys:excelframe></sys:excelframe>

					<script type="text/javascript">
						var onAfterLoadRecord = function(data) {

							//alert(mini.get("photo").getValue() );
							//mini.get("photo").setValue(data);
							photoPreview();
						}

						initBase({
							id : "datagridMain",
							objId : "SysUser",
							treeFilter : "((o.id='[node.id]') or (o.parent_ids like '%,[node.id],%'))",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
							treeSrcFields : "id",
							treeDestFields : "orgId",
							treeFilter2 : "(e.id='[node.id]')",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
							masterKeyField : "id",
							onAfterLoadRecord : onAfterLoadRecord,
							dataUrl : "${ctx}/ims-iam-ext/sys/sysUser/data",
							getUrl : "${ctx}/ims-iam-ext/sys/sysUser/get",
							saveUrl : "${ctx}/ims-iam-ext/sys/sysUser/save",
							removeUrl : "${ctx}/ims-iam-ext/sys/sysUser/remove",
							exportUrl : "${ctx}/ims-iam-ext/sys/sysUser/export",
							addCan:'0',
							cloneCan:'0',
							removeCan:'0'
						});

						initChilds("#editform", "tabsMain", 
						[
							{
				                 id:"gridSysUserRoleSublist",
				                 objId:"SysRole",
				                 FK:"userId",
				                 cascade:true,
				                 cascadeVisible:true,
				                 tabName:"tabSysUserRoleList",
								 dataUrl:"${ctx}/ims-iam-ext/sys/sysRole/getUserRole",
								 getUrl:"${ctx}/ims-iam-ext/sys/sysRole/get",
								 saveUrl:"${ctx}/ims-iam-ext/sys/sysRole/save",
								 removeUrl:"${ctx}/ims-iam-ext/sys/sysRole/remove",
								 exportUrl:"${ctx}/ims-iam-ext/sys/sysRole/export"
			                    },
			                    {
					                 id:"gridPgPosUserSublist",
					                 objId:"SysRole",
					                 FK:"userId",
					                 cascade:true,
					                 cascadeVisible:true,
					                 tabName:"tabPgPosUserList",
									 dataUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/data",
									 getUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/get",
									 saveUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/save",
									 removeUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/remove",
									 exportUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/export"
				                    }
							
						]
						); 
						initQb(
								"#builder",
								"pnlQuery",
								"tabsQuery",
								"txtSQL",
								"btnAdvSearch",
								[
										{
											id : 'a.id',
											label : '编号',
											type : 'string',
											default_value : '',
											size : 64
										},
										{
											id : 'a.company_id',
											label : '归属公司',
											type : 'string',
											default_value : '',
											size : 64
										},
										{
											id : 'a.org_id',
											label : '归属部门',
											type : 'string',
											default_value : '',
											size : 64
										},
										{
											id : 'a.login_name',
											label : '登录名',
											type : 'string',
											default_value : '',
											size : 100
										},
										{
											id : 'a.password',
											label : '密码',
											type : 'string',
											default_value : '',
											size : 100
										},
										{
											id : 'a.no',
											label : '工号',
											type : 'string',
											default_value : '',
											size : 100
										},
										{
											id : 'a.name',
											label : '姓名',
											type : 'string',
											default_value : '',
											size : 100
										},
										{
											id : 'a.email',
											label : '邮箱',
											type : 'string',
											default_value : '',
											size : 200
										},
										{
											id : 'a.phone',
											label : '电话',
											type : 'string',
											default_value : '',
											size : 200
										},
										{
											id : 'a.mobile',
											label : '手机',
											type : 'string',
											default_value : '',
											size : 200
										},
										{
											id : 'a.user_type',
											label : '用户类型',
											type : 'string',
											default_value : '',
											size : 120,
											plugin : 'selectize',
											plugin_config : {
												valueField : 'value',
												labelField : 'label',
												searchField : 'label',
												sortField : 'value',
												create : true,
												maxItems : 1,
												onInitialize : function() {
													var that = this;
													$
															.getJSON(
																	'${ctx}/ims-ext/sys/dict/listDataStr?type=sys_user_type',
																	function(
																			data) {
																		data
																				.forEach(function(
																						item) {
																					that
																							.addOption(item);
																				});
																	});
												}
											},
											valueSetter : function(rule, value) {
												rule.$el
														.find('.rule-value-container select')[0].selectize
														.setValue(value);
											}
										}, {
											id : 'a.photo',
											label : '用户头像',
											type : 'string',
											default_value : '',
											size : 120
										}, {
											id : 'a.login_ip',
											label : '最后登陆IP',
											type : 'string',
											default_value : '',
											size : 100
										}, {
											id : 'a.login_date',
											label : '最后登陆时间',
											type : 'datetime',
											default_value : '',
											size : 120
										}, {
											id : 'a.login_flag',
											label : '是否可登录',
											type : 'string',
											default_value : '',
											size : 64
										}, {
											id : 'a.create_by',
											label : '创建者',
											type : 'string',
											default_value : '',
											size : 64
										}, {
											id : 'a.create_date',
											label : '创建时间',
											type : 'datetime',
											default_value : '',
											size : 120,
											plugin : 'datepicker',
											plugin_config : {
												format : 'yyyy-mm-dd',
												todayBtn : 'linked',
												todayHighlight : true,
												autoclose : true,
												language : "zh-CN"
											}
										}, {
											id : 'a.update_by',
											label : '更新者',
											type : 'string',
											default_value : '',
											size : 64
										}, {
											id : 'a.update_date',
											label : '更新时间',
											type : 'datetime',
											default_value : '',
											size : 120,
											plugin : 'datepicker',
											plugin_config : {
												format : 'yyyy-mm-dd',
												todayBtn : 'linked',
												todayHighlight : true,
												autoclose : true,
												language : "zh-CN"
											}
										}, {
											id : 'a.remarks',
											label : '备注信息',
											type : 'string',
											default_value : '',
											size : 255
										}]);
						loadWindow();
						/////////////////////////////////////////////
						function onPwdValidation(e) {
							if (e.isValid) {
								var newPassword = mini.get("newPassword");
								if ((e.value) != newPassword.getValue()) {
									e.errorText = "两次输入密码不一致!";
									e.isValid = false;
								}
							}
						}
						
						
						function onGridOpMiClick(e){
							 var grid = mini.get("datagridMain");
							 var row = grid.getSelected();
							 var id = "";
							 var url = "${ctx}/sys/sysUser/resetToken";
							 
							 console.log("eeee:",grid);
							 
							 if(row){
								 url = url + "?id="+row.id;
							 }
							 console.log("url:",url);
							 showMessageBox(null,"生成中，请稍后......","loading"); 
							 
							  $.ajax({
				    	            url: url ,
				    	            //url: url,
				    	            success: function (text) {

				    	            	var o = mini.decode(text);

				    	            	if(o.type == 'S'){
				    	            	showTipM("success", "提示", o.message);
				    	            	hideMessageBox( );
				    	            
				    	            	}
									else
										showMessageBox("错误",o.message,"error");
				    	            },
				    	            error: function () {
				    	                alert("服务器查询错误");

				    	            }
				    	        });
						}
						
				function getDuties(){
					var otherOrgId = $("input[name='otherOrgId']").val();
					
					}
				
				function orgDutiesLov(){
					//sys/sysOtherOrg/getOrgAndDuties
					popLov(this,'选择组织',false,true,'${ctx}/sys/sysOtherOrg/sysOtherOrgAndDuties?typeId=0',850,500,'id,dutiesName,name','orgDutiesId,orgName,orgDutiesName','gridSysUserOrgDuties');	
					//popLov(this,'选择组织',false,true,'${ctx}/sys/sysOrgDuties/list',850,500,'id,otherOrgName,dutiesName','orgDutiesId,orgName,orgDutiesName','gridSysUserOrgDuties');
					//popLov(this,'选择组织',false,true,'${ctx}/sys/sysOrgDuties/list',850,500,'id,otherOrgName,dutiesName','orgDutiesId,orgName,orgDutiesName','gridSysUserOrgDuties')
			}	
				
				//url:"${ctx}/sys/sysUser/misList",
				function popLovJson(e){
					var param={
							obj:e,
							title:"选择用户",
							multiSel:true,
							readOnly:true,							
							url:"${ctx}/ims-iam-ext/sys/sysUser/misList",
							width:1000,
							height:600,
							selFields:"id,name",
							refFields:"userId,userName",
							refGridId:null,
							actionLovValid:null,
							actionLov:returnSelectData,
							actionClose:null,
							gridId:"datagridMain",
							allowDblclickSelect:true,
							gridId2:"datagridOften",
							selFields2:"selectedUserId,selectedUserName"
					};					
				
					var data1 = popLov2(param);
					console.log("ssssssssssssss",data1);
					//popLov(this,'选择用户',true,true,'${ctx}/sys/sysUser/misList',1000,600,'id,name','userId,userName',null,null,null,null,'datagridSelected',false);
					//"popLov(this,'选择用户',false,true,'${ctx}/sys/sysUser/sysMisList?type=defect',1200,600,'id,name','userId2,userName2',null,null,null,null,'datagridMain',true,'datagridOften','selectedUserId,selectedUserName')"
					//"popLov(this,'选择用户',false,true,'${ctx}/sys/sysUser/sysMisList?type=defect',1200,600,'selectedUserId,selectedUserName','userId2,userName2',null,null,null,null,'datagridOften',true,'datagridMain','id,name')"
				}
				
				function returnSelectData(s){
					for(var i=0;i<s.length;i++){
						console.log("name:",s[i].name);
						console.log("id:",s[i].id);
					}
					
				}
				$(function(){
					mini.parse();
					mini.get("_tbForm_save").setEnabled(false);
				});					
	</script>
</body>
</html>