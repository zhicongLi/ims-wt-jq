<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>用户扩展表</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
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
<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysUserExt" permissionEdit="sys:sysUserExt:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysUserExt/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="100"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" sortField="a.id" visible="false">编码
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="su.orgName" field="su.orgName" vtype="required" headerAlign="center" allowSort="true" width="100" sortField="u.org_id">班组
								<input property="editor" class="mini-textbox" style="width: 100%;" />
							</div>
							<div name="su.loginName" field="su.loginName" vtype="required" headerAlign="center" allowSort="true" width="100" sortField="u.login_name">登录名 
								<input property="editor" class="mini-textbox"	style="width: 100%;" /> 
								<input id="loginName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" />
							</div>
							<div name="su.name" field="su.name" vtype="required" headerAlign="center" allowSort="true" width="100" sortField="u.name">姓名
								 <input property="editor" class="mini-textbox" style="width: 100%;" /> 
								 <input id="name-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" />
							</div>
							<div name="specId"  field="specId" vtype=""  headerAlign="center" allowSort="true" width="64" >专业
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="specId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="su.posCode"  field="su.posCode" vtype="" type="comboboxcolumn"   headerAlign="center" allowSort="true" width="64" sortField="u.pos_code" >岗位
								<input property="editor" class="mini-combobox" textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_user_pos" style="width:100%;"  />
								<input id="su.posCode-Filter" name="mini-column-filter"  property="filter" class="mini-combobox"   style="width:100%;" textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_user_pos""  
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							
							<div name="isClasser"  field="isClasser" vtype="" type="comboboxcolumn"  headerAlign="center" allowSort="true" width="64" >是否班委成员
								<input property="editor" class="mini-combobox" textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=yes_no"  style="width:100%;"  />
								<input id="isClasser-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" multiSelect="true"  valueField="value" textField="label" required="false" 
												url="${ctx}/sys/dict/listDataStr?type=yes_no"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="su.email" field="su.email" vtype="" headerAlign="center" allowSort="true" width="200"  sortField="u.email"> 邮箱
								 <input property="editor" class="mini-textbox" style="width: 100%;" />
							</div>
							<div name="su.phone" field="su.phone" vtype="" headerAlign="center" allowSort="true" width="100" sortField="u.phone">电话 
								<input property="editor" class="mini-textbox" style="width: 100%;" />
							</div>
							<div name="su.mobile" field="su.mobile" vtype="" headerAlign="center" allowSort="true" width="100" sortField="u.mobile">手机 
								<input property="editor" class="mini-textbox" style="width: 100%;" />
							</div>
							
							
							
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysUserExt:edit"></sys:toolbarformmain>
                  <div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
									<input class="mini-hidden" name="id" id="id"/>
									
									<input class="mini-hidden" name="su.orgName" id="su.orgName"/>
									<input class="mini-hidden" name="su.id" id="su.id"/>
									<table border="0" cellpadding="3" cellspacing="3" >

										<tr>

											<td style="text-align: right;">归属组织：</td>
											<td>
												<input name="su.orgId" id="orgId" textName="su.orgName" class="mini-buttonedit"  onbuttonclick="popLov(this,'选择部门',false,true,'${ctx}/sys/sysOrg/mislist',850,500,'id,name','su.orgId,su.orgName')"  readonly="readonly" />
											</td>
											<td style="text-align: right;">姓名：</td>
											<td><input name="su.name" id="su.name" class="mini-textbox"
												vtype="" required="true"  readonly="readonly" /></td>
												
											<td style="text-align: right;">性别：</td>
											<td><input name="su.gender" id="su.gender"
												class="mini-combobox" vtype="" required="true"
												valueField="value" textField="label"
												url="${ctx}/sys/dict/listDataStr?type=sex"  readonly="readonly" />

										</tr>
										<tr>
											<td style="text-align: right;">登录名：</td>
											<td><input name="su.loginName" id="su.loginName"
												class="mini-textbox" vtype="" required="true"  readonly="readonly" /></td>
											<td style="text-align: right;">生日：</td>
											<td><input name="su.birthday" id="su.birthday" format="yyyy-MM-dd" class="mini-datepicker" vtype="" required="false"  readonly="readonly" /></td>
											
											<td style="text-align: right;">参加工作日期：</td>
											<td>
												<input name="su.workDate" id="su.workDate" format="yyyy-MM-dd" class="mini-datepicker" vtype="" required="false"  readonly="readonly" />
											</td>
											
										</tr>
										<tr>
											
											<td style="text-align: right;">学历：</td>
											<td><input name="su.education" id="su.education"
												class="mini-combobox" vtype="" required="false"
												valueField="value" textField="label"
												url="${ctx}/sys/dict/listDataStr?type=sys_user_edu" />
											</td>
											<td style="text-align: right;">邮箱：</td>
											<td><input name="su.email" id="su.email"
												class="mini-textbox" vtype="email" required="false" /></td>
											<td style="text-align: right;">手机：</td>
											<td><input name="su.mobile" id="su.mobile"
												class="mini-textbox" vtype="" required="false" /></td>
											
										</tr>
										<tr>
											<td style="text-align: right;">班内职务：</td>
											<td><input name="su.posCode" id="su.posCode"
												class="mini-combobox" vtype="" valueField="value"
												textField="label" required="false" 
												url="${ctx}/sys/dict/listDataStr?type=sys_user_pos"
												 /></td>
											
											<td style="text-align: right;">专业：</td>
											<td>
												<input name="specId" id="specId"
												class="mini-combobox" vtype="" valueField="id"  showNullItem="true" textField="name" url="${ctx}/pg/pgSpec/dictData?groupId=1"/>
											</td>
											<td style="text-align: right;">是否班委成员：</td>
											<td>
												<input name="isClasser" id="isClasser"
												class="mini-combobox" vtype=""  showNullItem="true" valueField="value" textField="label" required="false"  valueField="value" 
												url="${ctx}/sys/dict/listDataStr?type=yes_no"/>
											</td>
										</tr>
										<tr>
											<td style="text-align: right;">备注信息：</td>
											<td colspan="1"><input name="su.remarks" id="su.remarks"
												class="mini-textarea" vtype="" width=""
												required="false" /></td>
										</tr>
									</table>
				                </div> <!--panel-->
				            </div> <!--mini-col-->
				        </div> <!--clearfix-->
				     </div> <!--container-->
				  </div> <!--editform-->
		        <div class="mini-fit">
						 <div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
						 </div>
		        </div><!--fit-->

	    </div>

   </div>
   </div>
</div>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysUserExt",
				treeFilter : "((o.id='[node.id]') or (o.parent_ids like '%,[node.id],%'))",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
				treeSrcFields : "id",
				treeDestFields : "su.orgId",
				treeFilter2 : "(e.id='[node.id]')",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
				masterKeyField:"id",
				dataUrl:"${ctx}/sys/sysUserExt/data",
				getUrl:"${ctx}/sys/sysUserExt/get",
				saveUrl:"${ctx}/sys/sysUserExt/save",
				removeUrl:"${ctx}/sys/sysUserExt/remove",
				exportUrl:"${ctx}/sys/sysUserExt/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                   ]
	);

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: '编码',
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
						size: 100
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
						size: 100
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
						id: 'a.site_id',
						label: '站点id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.user_id',
						label: '用户id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.spec_id',
						label: '专业',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.pos_code',
						label: '职位',
						type: 'string',
						default_value: '',
						size: 64
					}
			]
	);
   loadWindow();
   //////////表格操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }

   }
   //////////form操作菜单项点击事件方法/////////
   function onFormOpMiClick(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }
   }
   //////////子表格操作菜单项点击事件方法/////////

</script>
</body>
</html>