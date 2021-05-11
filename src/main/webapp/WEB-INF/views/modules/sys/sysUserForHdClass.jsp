<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>用户管理</title>
<meta name="decorator" content="default" />
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
							dataUrl="${ctx}/sys/sysOrg/allDataNoControl?baseQuery=${orgQuery }" idField="id"
							valueField="id" textField="name" parentField="parentId" expandOnLoad="0"
							textFieldLabel="名称"></sys:treewithsearchbar>
					</div>
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
										<div name="orgName" field="orgName" vtype="required"
											headerAlign="center" allowSort="true" width="300">
											班组 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
<!-- 										<div type="comboboxcolumn" autoShowPopup="true" name="posCode" -->
<!-- 											field="posCode" vtype="" headerAlign="center" -->
<!-- 											allowSort="true" width="120"> -->
<!-- 											岗位 <input property="editor" class="mini-combobox" -->
<!-- 												style="width: 100%;" textField="label" valueField="value" -->
<%-- 												url="${ctx}/sys/dict/listDataStr?type=sys_user_pos" /> <input --%>
<!-- 												id="posCode-Filter" name="mini-column-filter" -->
<!-- 												property="filter" class="mini-combobox" style="width: 100%;" -->
<%-- 												url="${ctx}/sys/dict/listDataStr?type=sys_user_pos" --%>
<!-- 												multiSelect="true" style="width: 100%;" -->
<!-- 												onvaluechanged="onFilterChanged" valueField="value" -->
<!-- 												textField="label" showClose="true" -->
<!-- 												oncloseclick="onFilterClose(this)" /> -->
<!-- 										</div> -->
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
									</div>
								</div>
							</div>
						</div>
						<div title="明细" id="tabForm" style="border: 0px;">
							<sys:toolbarformmain permissionEdit="sys:sysUser:edit"></sys:toolbarformmain>
							<div id="editform" class="form"
								style="width: 100%; height: 500px;">
								<div class="container" style="width: 100%;">
									<div class="mini-clearfix ">
										<div class="mini-col-12">

											<div class="mini-panel" title="基本信息" width="auto"
												height="auto" showCollapseButton="true"
												onbuttonclick="onPanelButtonClick" name="_panel_exp">
												
												<input class="mini-hidden" name="token" id="token" /> 
												<input class="mini-hidden" name="companyId" id="companyId" />
												<input class="mini-hidden" name="id" id="id" /> 
												<input class="mini-hidden" name="nation" id="nation"/>
												<input class="mini-hidden" name="userType" id="userType"/>
												<input class="mini-hidden" name="no" id="no"/>
												<input class="mini-hidden" name="loginFlag" id="loginFlag"/>
												<input class="mini-hidden" name="photo" id="photo"/>
												<input class="mini-hidden" name="loginDate" id="loginDate"/>
												
												<input class="mini-hidden" name="loginIp" id="loginDate"/>
												<input class="mini-hidden" name="phone" id="phone"/>
												<input class="mini-hidden" name="residence" id="residence"/>
												<input class="mini-hidden" name="orgName" id="orgName"/>
												<input class="mini-hidden" name="sort" id="sort"/>
												<input class="mini-hidden" name="partyCost" id="partyCost"/>
												<input class="mini-hidden" name="inParty" id="inParty"/>
												<input class="mini-hidden" name="formalParty" id="formalParty"/>
												<input class="mini-hidden" name="technicalTitlesm" id="technicalTitlesm"/>
												<input class="mini-hidden" name="nativePlace" id="nativePlace"/>
												<input class="mini-hidden" name="integral" id="integral"/>
												<input class="mini-hidden" name="ex.id" id="ex.id"/>
												<input class="mini-hidden" name="ex.posCode" id="ex.posCode"/>
												
												
												<table border="0" cellpadding="3" cellspacing="3">
													<tr>

														<td style="text-align: right;">归属组织：</td>
														<td>
															<input name="orgId" id="orgId" textName="orgName" class="mini-buttonedit"  onbuttonclick="popLov(this,'选择部门',false,true,'${ctx}/sys/sysOrg/mislist',850,500,'id,name','orgId,orgName')"  readonly="readonly" />
														</td>
														<td style="text-align: right;">姓名：</td>
														<td><input name="name" id="name" class="mini-textbox"
															vtype="" required="true"  readonly="readonly" /></td>
															
														<td style="text-align: right;">性别：</td>
														<td><input name="gender" id="gender"
															class="mini-combobox" vtype="" required="true"
															valueField="value" textField="label"
															url="${ctx}/sys/dict/listDataStr?type=sex"  readonly="readonly" />

													</tr>
													<tr>
														<td style="text-align: right;">登录名：</td>
														<td><input name="loginName" id="loginName"
															class="mini-textbox" vtype="" required="true"  readonly="readonly" /></td>
														<td style="text-align: right;">生日：</td>
														<td><input name="birthday" id="birthday" format="yyyy-MM-dd" class="mini-datepicker" vtype="" required="false"  readonly="readonly" /></td>
														
														<td style="text-align: right;">参加工作日期：</td>
														<td>
															<input name="workDate" id="workDate" format="yyyy-MM-dd" class="mini-datepicker" vtype="" required="false"  readonly="readonly" />
														</td>
														
													</tr>
													<tr>
														
														<td style="text-align: right;">学历：</td>
														<td><input name="education" id="education"
															class="mini-combobox" vtype="" required="true"
															valueField="value" textField="label"
															url="${ctx}/sys/dict/listDataStr?type=sys_user_edu" />
														</td>
														<td style="text-align: right;">邮箱：</td>
														<td><input name="email" id="email"
															class="mini-textbox" vtype="email" required="false" /></td>
														<td style="text-align: right;">手机：</td>
														<td><input name="mobile" id="mobile"
															class="mini-textbox" vtype="" required="false" /></td>
														
													</tr>
													<tr>
														<td style="text-align: right;">班内职务：</td>
														<td><input name="posCode" id="posCode"
															class="mini-combobox" vtype="" valueField="value"
															textField="label" required="false" 
															url="${ctx}/sys/dict/listDataStr?type=sys_user_pos"
															 /></td>
														
														<td style="text-align: right;">专业：</td>
														<td>
															<input name="ex.specId" id="ex.specId"
															class="mini-combobox" vtype="" valueField="id"  showNullItem="true" textField="name" url="${ctx}/pg/pgSpec/dictData?groupId=1"/>
														</td>
														<td style="text-align: right;">是否班委成员：</td>
														<td>
															<input name="ex.isClasser" id="ex.isClasser"
															class="mini-combobox" vtype=""  showNullItem="true" textField="label" required="false" valueField="value"
															url="${ctx}/sys/dict/listDataStr?type=yes_no"/>
														</td>
													</tr>
													<tr>
														<td style="text-align: right;">备注信息：</td>
														<td colspan="1"><input name="remarks" id="remarks"
															class="mini-textarea" vtype="" width=""
															required="false" /></td>
													</tr>
													<tr style="display:none">
														<td style="text-align: right;">角色列表：</td>
														<td colspan="4">
															<div id="roleIdStr" name="roleIdStr"
																class="mini-checkboxlist" repeatItems="3"
																repeatLayout="table" textField="name" valueField="id"
																url="${ctx}/sys/sysUser/roleListData"></div>
														</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
								
								
						<div class="mini-fit"> 
								<div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width: 100%; height: 100%;">
								</div>
						</div>
				</div>
			</div>

					</div>
					<sys:toolbarfooter></sys:toolbarfooter>
					<sys:excelframe></sys:excelframe>

					<script type="text/javascript">
					var isUserEx = '${param.userEx}';
						initBase({
							id : "datagridMain",
							objId : "SysUser",
							treeFilter : "((o.id='[node.id]') or (o.parent_ids like '%,[node.id],%'))",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
							treeSrcFields : "id",
							treeDestFields : "orgId",
							treeFilter2 : "(e.id='[node.id]')",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
							//masterKeyField : "id",
							dataUrl : "${ctx}/sys/sysUser/data",
							getUrl : "${ctx}/sys/sysUser/get",
							saveUrl : "${ctx}/sys/sysUser/save",
							removeUrl : "${ctx}/sys/sysUser/remove",
							exportUrl : "${ctx}/sys/sysUser/export",
							onAfterLoadRecord : onAfterLoadRecord,
							onAfterSaveForm:afterSaveForm,
							onBeforeSaveForm:beforeSaveForm
						});

						initChilds("#editform", "tabsMain", [ ]); 
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
						
						
						
						var onAfterLoadRecord = function(data) {

							loadEx();
						}
						
						
						 function loadEx(){
								if(isUserEx!='1'){
									return;
								}
								var id = mini.get("id").getValue();
								$.ajax({
						            url: "${ctx}/sys/sysUserExt/data",
						         	data : {userId:id},
						            type: "post",
						            success: function (data) {
						            	debugger;
						            	var d = mini.decode(data);
						            	if(d&&d.data&&d.data.length>0){
						            		var uex = d.data[0];
						            		mini.get("ex.id").setValue(uex.id);
											mini.get("ex.specId").setValue(uex.specId);
											mini.get("ex.posCode").setValue(uex.posCode);
											mini.get("ex.isClasser").setValue(uex.isClasser);
						            	}
						            }
						        });
							}
							function saveEx(){
								if(isUserEx!='1'){
									return;
								}
								var arr = new Array();
								arr.push(userEx);
								var dataStr = mini.encode(arr);
								$.ajax({
						            url: "${ctx}/sys/sysUserExt/save",
						         	data :{data:dataStr} ,
						            type: "post",
						            success: function (data) {
						            	loadEx();
						            }
						        });
							}
							var userEx = null;
							function afterSaveForm(){
								saveEx();
							}
							function beforeSaveForm(){
								var id = mini.get("ex.id").getValue();
								var userId = mini.get("id").getValue();
								var specId = mini.get("ex.specId").getValue();
								var posCode = mini.get("ex.posCode").getValue();
								var isClasser = mini.get("ex.isClasser").getValue();
								userEx =  {'id':id,
										'userId':userId,
										'specId':specId,
										'posCode':posCode,
										'isClasser':isClasser
										};
								return true;
							}
					</script>
</body>
</html>