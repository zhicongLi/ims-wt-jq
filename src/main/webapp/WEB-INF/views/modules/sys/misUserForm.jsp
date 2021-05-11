<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>用户管理</title>
<meta name="decorator" content="default" />
<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css"
	rel="stylesheet" />
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<style type="text/css">
		body{
			display: block;
		}
	</style>
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
							dataUrl="${ctx}/sys/sysOrg/allData" idField="id"
							valueField="id" textField="name" parentField="parentId" expandOnLoad="0"
							textFieldLabel="名称"></sys:treewithsearchbar>
					</div>
					<div title="按分组" id="tabGroup" style="border: 0px;">
						<sys:treewithsearchbar idSuffix="2"
							dataUrl="${ctx}/sys/sysGroup/allData" idField="id"
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
									style="width: 100%; height: 100%;" url="${ctx}/sys/sysUser/allData"
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
											headerAlign="center" allowSort="true" width="300" sortField="o.name">
											归属部门 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div type="comboboxcolumn" autoShowPopup="true" name="posCode"
											field="posCode" vtype="" headerAlign="center"
											allowSort="true" width="120" sortField="a.pos_code">
											岗位 <input property="editor" class="mini-combobox"
												style="width: 100%;" textField="label" valueField="value"
												url="${ctx}/sys/dict/listDataStr?type=sys_user_pos" /> <input
												id="posCode-Filter" name="mini-column-filter"
												property="filter" class="mini-combobox" style="width: 100%;"
												url="${ctx}/sys/dict/listDataStr?type=sys_user_pos"
												multiSelect="true" style="width: 100%;"
												onvaluechanged="onFilterChanged" valueField="value"
												textField="label" showClose="true"
												oncloseclick="onFilterClose(this)" />
										</div>
										<div name="loginName" field="loginName" vtype="required" 
											headerAlign="center" allowSort="true" width="100" sortField="a.login_name">
											登录名 <input property="editor" class="mini-textbox"
												style="width: 100%;" /> <input id="loginName-Filter"
												name="mini-column-filter" property="filter"
												class="mini-textbox" style="width: 100%;"
												onvaluechanged="onFilterChanged" />
										</div>
										<div name="name" field="name" vtype="required"
											headerAlign="center" allowSort="true" width="100" sortField="a.name">
											姓名 <input property="editor" class="mini-textbox"
												style="width: 100%;" /> <input id="name-Filter"
												name="mini-column-filter" property="filter"
												class="mini-textbox" style="width: 100%;"
												onvaluechanged="onFilterChanged" />
										</div>
										<div name="email" field="email" vtype="" headerAlign="center"
											allowSort="true" width="200" sortField="a.email">
											邮箱 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="phone" field="phone" vtype="" headerAlign="center"
											allowSort="true" width="100" sortField="a.phone">
											电话 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="mobile" field="mobile" vtype=""
											headerAlign="center" allowSort="true" width="100" sortField="a.mobile">
											手机 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="no" field="no" vtype="" headerAlign="center"
											allowSort="true" width="100" sortField="a.no">
											工号 <input property="editor" class="mini-textbox"
												style="width: 100%;" /> <input id="no-Filter"
												name="mini-column-filter" property="filter"
												class="mini-textbox" style="width: 100%;"
												onvaluechanged="onFilterChanged" />
										</div>									
										<div type="checkboxcolumn"   name="loginFlag" field="loginFlag" vtype="" headerAlign="center" allowSort="true" width="64" >是否可登录

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
												
												<input class="mini-hidden" name="token" id="token" /> <input
													class="mini-hidden" name="companyId" id="companyId" />
												<input class="mini-hidden" name="id" id="id" /> <input
													class="mini-hidden" name="companyId" id="companyId" />
													<input class="mini-hidden" name="ex.id" id="ex.id" /> 
													<input class="mini-hidden" name="ex.isClasser" id="ex.isClasser" /> 
												<table border="0" cellpadding="3" cellspacing="3">
													<tr>

														<td style="text-align: right;">归属组织：</td>
														<td>
															<%--<input name="orgId" id="orgId" textName="orgName" class="mini-buttonedit" vtype = "" onbuttonclick="popLov(this,'选择部门',false,true,'${ctx}/sys/sysOrg/list',850,500,'id,name','orgId,orgName')"  required="false" />--%>
															<input name="orgId" id="orgId" class="mini-treeselect"
															vtype="" required="false" url="${ctx}/sys/sysOrg/allData"
															valueField="id" textField="name" parentField="parentId" />
														</td>
														<td style="text-align: right;">姓名：</td>
														<td><input name="name" id="name" class="mini-textbox"
															vtype="" required="true" /></td>
														<td style="text-align: right;">性别：</td>
														<td><input name="gender" id="gender"
															class="mini-combobox" vtype="" required="true"
															valueField="value" textField="label"
															url="${ctx}/sys/dict/listDataStr?type=sex" />
														</td>
														<td style="text-align: right;">民族：</td>
														<td><input name="nation" id="nation" class="mini-textbox"
															vtype="" required="false" /></td>

													</tr>
													<tr>
														<td style="text-align: right;">用户类型：</td>
														<td><input name="userType" id="userType"
															class="mini-combobox" vtype="" required="false"
															valueField="value" textField="label"
															url="${ctx}/sys/dict/listDataStr?type=sys_user_type" />
														</td>
														<td style="text-align: right;">登录名：</td>
														<td><input name="loginName" id="loginName"
															class="mini-textbox" vtype="" required="true" /></td>
														<td style="text-align: right;">学历：</td>
														<td><input name="education" id="education"
															class="mini-combobox" vtype="" required="false"
															valueField="value" textField="label"
															url="${ctx}/sys/dict/listDataStr?type=sys_user_edu" />
														</td>
														<td style="text-align: right;">岗位：</td>
														<td><input name="posCode" id="posCode"
															class="mini-combobox" vtype="" valueField="value" showNullItem="true"
															textField="label"
															url="${ctx}/sys/dict/listDataStr?type=sys_user_pos" /></td>

													</tr>
													<tr>

														<td style="text-align: right;">工号：</td>
														<td><input name="no" id="no" class="mini-textbox"
															vtype="" required="false" /></td>
														<td style="text-align: right;">是否可登录：</td>
														<td><input name="loginFlag" id="loginFlag"
															class="mini-checkbox" trueValue="1" falseValue="0"
															vtype="" required="false" /></td>
														<td style="text-align: right;">最后登陆时间：</td>
														<td><input name="loginDate" id="loginDate"
															readOnly="true" format="yyyy-MM-dd hh:mm:ss"
															class="mini-datepicker" vtype="" required="false" /></td>
														<td style="text-align: right;">最后登陆IP：</td>
														<td><input name="loginIp" id="loginIp"
															class="mini-textbox" vtype="" required="false" /></td>
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
														<td style="text-align: right;">新密码：</td>
														<td><input name="newPassword" id="newPassword"
															class="mini-password" vtype="" required="false" /></td>
														<td style="text-align: right;">确认密码：</td>
														<td><input name="confirmNewPassword"
															id="confirmNewPassword" onvalidation="onPwdValidation"
															class="mini-password" vtype="" required="false" /></td>
														
														
													</tr>
													<tr>
														<td style="text-align: right;">专业：</td>
														<td>
															<input name="ex.specId" id="ex.specId"
															class="mini-combobox" vtype="" valueField="id"  showNullItem="true" textField="name" url="${ctx}/pg/pgSpec/dictData?groupId=1"/>
														</td>
														<td style="text-align: right;">职位：</td>
														<td>
															<input name="ex.posCode" id="ex.posCode"
															class="mini-combobox" vtype="" valueField="value"
															textField="label"
															url="${ctx}/sys/dict/listDataStr?type=sys_user_pos" showNullItem="true"/>
														</td>
														<td style="text-align: right;">备注信息：</td>
														<td colspan="3"><input name="remarks" id="remarks"
															class="mini-textarea" vtype="" width="400"
															required="false" /></td>


													</tr>
												</table>
												<table border="0" cellpadding="3" cellspacing="3">
												<tr>
														<td style="text-align: right;">角色列表：</td>
														<td colspan="3">
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
								
								
								<!-- 					<div class="mini-fit"> -->
								<!--fit-->
								<!-- </div> -->
							</div>
						</div>

					</div>
					<sys:toolbarfooter></sys:toolbarfooter>
					<sys:excelframe></sys:excelframe>

					<script type="text/javascript">
					var isUserEx = '${param.userEx}';
					
						var onAfterLoadRecord = function(data) {

							//alert(mini.get("photo").getValue() );
							//mini.get("photo").setValue(data);
							photoPreview();
							loadEx();
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
							onAfterSaveForm:afterSaveForm,
							onBeforeSaveForm:beforeSaveForm,
							dataUrl : "${ctx}/sys/sysUser/allData",
							getUrl : "${ctx}/sys/sysUser/get",
							saveUrl : "${ctx}/sys/sysUser/save",
							removeUrl : "${ctx}/sys/sysUser/remove",
							exportUrl : "${ctx}/sys/sysUser/export"
						});

						initChilds("#editform", "tabsMain", 
							[ 
								]); 
						initQb(
								"#builder",
								"pnlQuery",
								"tabsQuery",
								"txtSQL",
								"btnAdvSearch",
								[
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
											id : 'a.login_flag',
											label : '是否可登录',
											type : 'string',
											default_value : '',
											size : 64
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
						
						
						function loadEx(){
							if(isUserEx!='1'){
								return;
							}
							var id = mini.get("id").getValue();
							$.ajax({
					            url: "${ctx}/sys/sysUserExt/get",
					         	data : {id:id},
					            type: "post",
					            success: function (data) {
					            	debugger;
					            	var uex = mini.decode(data);
					            	if(uex){
					            		
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