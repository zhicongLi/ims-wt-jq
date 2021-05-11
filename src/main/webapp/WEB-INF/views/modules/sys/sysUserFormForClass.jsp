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
		<div class="mini-splitter" id="_splTreeMain"  style="width: 100%; height: 100%;">
			<div size="240" showCollapseButton="true" style="overflow: auto;">
				<div id="_tabsTreeMain" class="mini-tabs" tabPosition="bottom"
					activeIndex="0" plain="false" style="width: 100%; height: 100%;">
					<div title="按组织" id="tabOrg" style="border: 0px;">
						<sys:treewithsearchbar
							dataUrl="${ctx}/sys/sysOrg/allData?baseQuery=63" idField="id"
							valueField="id" textField="name" parentField="parentId"
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
								permissionEdit="sys:user:edit"></sys:toolbargridmain>
							<sys:searchadv></sys:searchadv>
							<div class="mini-fit">
								<div id="datagridMain" class="mini-datagrid" onrowdblclick='onrowdblclick'
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
											归属部门 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
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
										<div name="inParty" field="inParty" vtype=""
											dateFormat="yyyy-MM-dd" headerAlign="center"
											allowSort="true" width="120">
											入职时间 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
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
							<sys:toolbarformmain permissionEdit="sys:user:edit"></sys:toolbarformmain>
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
												<table border="0" cellpadding="3" cellspacing="3">
													<tr>

														<td style="text-align: right;">归属组织：</td>
														<td>
															<%--<input name="orgId" id="orgId" textName="orgName" class="mini-buttonedit" vtype = "" onbuttonclick="popLov(this,'选择部门',false,true,'${ctx}/sys/sysOrg/list',850,500,'id,name','orgId,orgName')"  required="false" />--%>
															<input name="orgId" id="orgId" class="mini-treeselect"
															vtype="" required="true" url="${ctx}/sys/sysOrg/allData?baseQuery=63"
															valueField="id" textField="name" parentField="parentId" />
														</td>
														<td style="text-align: right;">姓名：</td>
														<td><input name="name" id="name" class="mini-textbox"
															vtype="" required="true" /></td>
															
														<td style="text-align: right;">民族：</td>
														<td><input name="nation" id="nation" class="mini-textbox"
															vtype="" required="true" /></td>
														<td style="text-align: right;">性别：</td>
														<td><input name="gender" id="gender"
															class="mini-combobox" vtype="" required="true"
															valueField="value" textField="label"
															url="${ctx}/sys/dict/listDataStr?type=sex" />

													</tr>
													<tr>
														<td style="text-align: right;">用户类型：</td>
														<td><input name="userType" id="userType"
															class="mini-combobox" vtype="" required="true"
															valueField="value" textField="label"
															url="${ctx}/sys/dict/listDataStr?type=sys_user_type" />
														</td>
														<td style="text-align: right;">登录名：</td>
														<td><input name="loginName" id="loginName"
															class="mini-textbox" vtype="" required="true" /></td>
														<td style="text-align: right;">学历：</td>
														<td><input name="education" id="education"
															class="mini-combobox" vtype="" required="true"
															valueField="value" textField="label"
															url="${ctx}/sys/dict/listDataStr?type=sys_user_edu" />
														</td>
														<td style="text-align: right;">岗位：</td>
														<td><input name="posCode" id="posCode"
															class="mini-buttonedit" vtype=""
															required="true"
															textName="remarks"
											              onbuttonclick="popLov(this,'选择职位',true,true,'${ctx}/tm/tmDuties/form',850,500,'id,name','posCode,remarks')"/></td>

													</tr>
													<tr>
														<td style="text-align: right;">工号：</td>
														<td><input name="no" id="no" class="mini-textbox"
															vtype="" required="false" /></td>
														<td style="text-align: right;">是否可登录：</td>
														<td><input name="loginFlag" id="loginFlag"
															class="mini-checkbox" trueValue="1" falseValue="0"
															vtype="" required="false" /></td>
														<td style="text-align: right;">手机：</td>
														<td><input name="mobile" id="mobile"
															class="mini-textbox" vtype="" required="false" /></td>
														<td style="text-align: right;">入职时间：</td>
														<td><input name="workDate" id="workDate"
															format="yyyy-MM-dd"
															class="mini-datepicker" vtype="" required="false" /></td>
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
														<td style="text-align: right;">现居住地：</td>
														<td><input name="residence" id="residence"
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
														
														
														
													</tr>
													<tr>
														<td style="text-align: right;">备注信息：</td>
														<td colspan="3"><input name="remarks" id="remarks"
															class="mini-textarea" vtype="" width="400"
															required="false" /></td>
													</tr>
													<tr>
														<td style="text-align: right;">最后登陆时间：</td>
														<td><input name="loginDate" id="loginDate"
															readOnly="true" format="yyyy-MM-dd hh:mm:ss"
															class="mini-datepicker" vtype="" required="false" /></td>
														<td style="text-align: right;">最后登陆IP：</td>
														<td><input name="loginIp" id="loginIp"
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
														
													</tr>
													<tr>
														<td style="text-align: right;">角色列表：</td>
														<td colspan="4">
															<div id="roleIdStr" name="roleIdStr"
																class="mini-checkboxlist" repeatItems="3"
																repeatLayout="table" textField="name" valueField="id"
																url="${ctx}/sys/sysUser/roleListData"></div>
														</td>
													</tr>
													<tr>
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
						var onAfterLoadRecord = function(data) {
							photoPreview();
						}

						initBase({
							id : "datagridMain",
							objId : "SysUser",
							treeFilter : "((o.id='[node.id]') or (o.parent_ids like '%,[node.id],%'))",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
							treeSrcFields : "id",
							treeDestFields : "orgId",
							treeFilter2 : "(e.id='[node.id]')",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
							//masterKeyField : "id",
							onAfterLoadRecord : onAfterLoadRecord,
							dataUrl : "${ctx}/sys/sysUser/data",
							getUrl : "${ctx}/sys/sysUser/get",
							saveUrl : "${ctx}/sys/sysUser/save",
							removeUrl : "${ctx}/sys/sysUser/remove",
							exportUrl : "${ctx}/sys/sysUser/export"
						});

						initChilds("#editform", "tabsMain", 
							[ 
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
													$.getJSON('${ctx}/sys/dict/listDataStr?type=sys_user_type',
																	function(data) {
																		dataforEach(function(item) {
																					that.addOption(item);
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
											id : 'a.in_party',
											label : '入职时间',
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
						
						
						function findBylevelType(){
							var form = new mini.Form("#editform");
							var orgId = mini.get("orgId").getValue();
							var value ="";
							if(orgId == "1770" || orgId == "1802"){
								 value = "sys_user_pos1";
							}else if(orgId == "1771" || orgId == "1804"){
								 value = "sys_user_pos2";
							}else if(orgId == "1938" || orgId == "1939"){
								 value = "sys_user_pos3";
							}else if(orgId == "1940" || orgId == "1941"){
								 value = "sys_user_pos4";
							}else if(orgId == "1942" || orgId == "1943"){
								 value = "sys_user_pos5";
							}else if(orgId == "1944" || orgId == "1945"){
								 value = "sys_user_pos6";
							}else if(orgId == "1946" || orgId == "1947"){
								 value = "sys_user_pos7";
							}else if(orgId == "1948" || orgId == "1949"){
								 value = "sys_user_pos8";
							}else if(orgId == "1950" || orgId == "1951"){
								 value = "sys_user_pos9";
							}else if(orgId == "1952" || orgId == "1953"){
								 value = "sys_user_pos10";
							}else if(orgId == "1954" || orgId == "1955"){
								 value = "sys_user_pos11";
							}else if(orgId == "1956" || orgId == "1957"){
								 value = "sys_user_pos12";
							}else if(orgId == "1958" || orgId == "1959"){
								 value = "sys_user_pos13";
							}else if(orgId == "1960" || orgId == "1961"){
								 value = "sys_user_pos14";
							}else if(orgId == "1962" || orgId == "1963"){
								 value = "sys_user_pos15";
							}else if(orgId == "1964" || orgId == "1965"){
								 value = "sys_user_pos16";
							}else{
								value = "sys_user_pos17";
							}
							$.ajax({
					            url: "${ctx}/sys/dict/listDataStr",
					         	data : {type:value},
					            type: "post",
					            success: function (data) {
					            	console.log(data);
										var d = mini.decode(data);
						            	mini.getbyName("posCode",form).setData(d);
					            },
					            error: function (jqXHR, textStatus, errorThrown) {
					                var callback=function (action) {
					                    if(action=='详细')  viewErrorDetail(jqXHR.responseText);
					                }
					                var buttonsTemp=["ok","详细"];
					                showMessageBox("错误","获取下一接班数据出错","error",null,callback,buttonsTemp);
					                form.unmask();
					            },
					            async:false
					        });
						}
						
						
						 function onrowdblclick(e){
							   var record = e.record;
							   var orgId = record.orgId;
							   var posCode = record.posCode;
							   var value ="";
								if(orgId == "1770" || orgId == "1802"){
									 value = "sys_user_pos1";
								}else if(orgId == "1771" || orgId == "1804"){
									 value = "sys_user_pos2";
								}else if(orgId == "1938" || orgId == "1939"){
									 value = "sys_user_pos3";
								}else if(orgId == "1940" || orgId == "1941"){
									 value = "sys_user_pos4";
								}else if(orgId == "1942" || orgId == "1943"){
									 value = "sys_user_pos5";
								}else if(orgId == "1944" || orgId == "1945"){
									 value = "sys_user_pos6";
								}else if(orgId == "1946" || orgId == "1947"){
									 value = "sys_user_pos7";
								}else if(orgId == "1948" || orgId == "1949"){
									 value = "sys_user_pos8";
								}else if(orgId == "1950" || orgId == "1951"){
									 value = "sys_user_pos9";
								}else if(orgId == "1952" || orgId == "1953"){
									 value = "sys_user_pos10";
								}else if(orgId == "1954" || orgId == "1955"){
									 value = "sys_user_pos11";
								}else if(orgId == "1956" || orgId == "1957"){
									 value = "sys_user_pos12";
								}else if(orgId == "1958" || orgId == "1959"){
									 value = "sys_user_pos13";
								}else if(orgId == "1960" || orgId == "1961"){
									 value = "sys_user_pos14";
								}else if(orgId == "1962" || orgId == "1963"){
									 value = "sys_user_pos15";
								}else if(orgId == "1964" || orgId == "1965"){
									 value = "sys_user_pos16";
								}else{
									value = "sys_user_pos17";
								}
							   $.ajax({
						            url: "${ctx}/sys/dict/listDataStr",
						         	data : {type:value,value:posCode},
						            type: "post",
						            success: function (data) {
						            	console.log(data);
											var d = mini.decode(data);
							            	mini.getbyName("posCode",form).setData(d);
						            },
						            error: function (jqXHR, textStatus, errorThrown) {
						                var callback=function (action) {
						                    if(action=='详细')  viewErrorDetail(jqXHR.responseText);
						                }
						                var buttonsTemp=["ok","详细"];
						                showMessageBox("错误","获取下一接班数据出错","error",null,callback,buttonsTemp);
						                form.unmask();
						            },
						            async:false
						        });
						   }
						
						
					</script>
</body>
</html>