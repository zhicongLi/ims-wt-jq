<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>岗位表</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
	 <style type="text/css">
	 	.mini-textbox,.mini-datepicker,.mini-combobox,.mini-buttonedit
	 	{width:180px;}
	 </style>
</head>
<body>
<div class="mini-fit">
	<div id="_splTreeMain" class="mini-splitter" style="width:100%;height:100%;">
	    <%-- <div size="240" showCollapseButton="true" style="overflow:auto;">
             <sys:treewithsearchbar dataUrl="${ctx}/pg/pgPos/allData" idField="id" valueField="id" textField="name" parentField="parentId" textFieldLabel="名称"></sys:treewithsearchbar>
	    </div> --%>
		<div size="250" showCollapseButton="true" style="overflow:auto;">
			<sys:treewithsearchbar dataUrl="${ctx}/ims-iam-ext/sys/sysOrg/allData" idField="id" valueField="id" textField="name" parentField="parentId" expandOnLoad="0" textFieldLabel="名称"></sys:treewithsearchbar>
		</div>
		<div showCollapseButton="true">
					<div class="mini-fit">
					<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
						<div title="列表" id="tabList"  style="border: 0px;"  >
								 <sys:toolbargridmain objId="PgPos" permissionEdit="pg:pgPos:edit"></sys:toolbargridmain>
								 <sys:searchadv></sys:searchadv>
								 <div class="mini-fit">
									<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-iam-ext/pg/pgPos/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" multiSelect="false"
										 editNextOnEnterKey="true"  editNextRowCell="true"
										 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
									>
										<div property="columns">
										<div type="checkcolumn"></div>
											<div name="action" width="80"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
												<div name="id"  field="id" hideable="true" visible="false" vtype="required"  headerAlign="center" allowSort="true" width="64" >id
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="name"  field="name" vtype="" sortField="a.name" headerAlign="center" allowSort="true" width="120" >岗位名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="code"  field="code" vtype="" sortField="a.code" headerAlign="center" allowSort="true" width="60" >岗位编码
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="code-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="seqNo"  field="seqNo" vtype="" headerAlign="center" hideable="true" allowSort="true" width="40" >排序
													<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
												</div>
												<div name="orgName"  field="orgName" vtype=""  headerAlign="center" allowSort="true" width="100" >所属组织机构名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="orgName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="specName"  field="specName" vtype=""  headerAlign="center" allowSort="true" width="64" >专业
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="specId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="roleId"  field="roleId" vtype="" hideable="true" visible="false" headerAlign="center" allowSort="true" width="64" >对应角色ID
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="roleId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
                                                <div name="roleName"  field="roleName"  vtype=""  headerAlign="center" allowSort="true" width="64" sortField="role.name">对应角色名称
                                                    <input property="editor" class="mini-textbox" style="width:100%;" />
													<input id="roleName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
                                                </div>
									</div>
								</div>
							 </div>
						</div>
						<div title="明细" id="tabForm"  style="border: 0px;"  >
							<sys:toolbarformmain permissionEdit="pg:pgPos:edit"></sys:toolbarformmain>
									<div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
											<input class="mini-hidden" name="id" id="id"/>
											<input class="mini-hidden" name="saveToUap" id="saveToUap"/>
											<table border="0" cellpadding="3" cellspacing="3" >
												<tr>
													<td style="text-align:right;">所属组织机构：</td>
													<td>
<!-- 													<input name="orgId" id="orgId" class="mini-textbox"  vtype = ""  required="false" /> -->
													<input name="orgId" id="orgId" textName="orgName" class="mini-buttonedit"  vtype = ""  required="true" width="180px" allowInput="false" 
												onbuttonclick="popLov(this,'选择所属部门',false,true,'${ctxRoot}/form?view=sys/sysOrgList&classId=0',850,500,'id,name','orgId,orgName')"   />
													</td>
													<td style="text-align:right;">排序：</td>
													<td>
													   <input name="seqNo" id="seqNo" class="mini-spinner" allowLimitValue="false" vtype = ""  required="false" />
													</td>

												</tr>
												<tr>
													<td style="text-align:right;">岗位名称：</td>
													<td>
													   <input name="name" id="posname" class="mini-textbox"  vtype = ""  required="true" />
													</td>
													<td style="text-align:right;">岗位编码：</td>
													<td>
													   <input name="code" id="code" class="mini-textbox"  vtype = ""  required="false" />
													</td>
												</tr>
												<tr>
													<td style="text-align:right;">对应专业：</td>
													<td>
														<input name="specId" id="specId" textName="specName" class="mini-buttonedit" vtype = "" required="false" showClose="true" oncloseclick="close(this)"
														onbuttonclick="popLov(this,'选择专业',false,true,'${ctxRoot}/form?view=pg/pgPosUserList',800,500,'id,name','specId,specName')"  />
<!-- 													   <input name="specId" id="specId" class="mini-textbox"  vtype = ""  required="false" /> -->
													</td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<!-- <td>
													   <input name="roleId" id="roleId" class="mini-textbox"  vtype = ""  required="false" />
													</td> -->
													<td style="text-align:right;">对应角色：</td>
													<td>
													<input name="roleId" id="roleId" textName="role.name" class="mini-buttonedit"  vtype = "" showClose="true" oncloseclick="close(this)" required="false" width="180px" allowInput="false" 
												onbuttonclick="popLov(this,'角色选择',false,true,'${ctxRoot}/form?view=sys/sysRoleList',850,500,'id,name,enname','roleId,role.name,role.enname')"   />
													</td>
													<td style="text-align:right;">角色英文名：</td>
													<td>
													   <input name="role.enname" id="role.enname" class="mini-textbox" vtype = "" allowInput="false" required="false" />
														*不要对应到通用角色
													</td>
												</tr>
											</table>
				                </div> <!--panel-->
				                <div class="mini-panel" title="人员岗位信息" width="auto"  id="tabPgPosUserList" name="tabPgPosUserList"
													 showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true" >
<%-- 														<sys:toolbargridsub girdId="gridPgPosUser" permissionEdit="pg:pgPosUser:view"></sys:toolbargridsub> --%>
														<div style="width:100%;">
															<div class="mini-toolbar" id="_tbgridPgPosUser"  style="border-bottom:0;padding:0px;">
																<table style="width:100%;">
																	<tr>
																		<td style="width:100%;">
																			<a class="mini-button" id="_tbgridPgPosUser_add" iconCls="icon-plus-sign"  onclick="addUser('gridPgPosUser')" plain="true" tooltip="新建行"></a>
																			<a class="mini-button" id="_tbgridPgPosUser_remove" iconCls="icon-remove" style="color:red;" onclick="removeRow('gridPgPosUser')"  plain="true" tooltip="删除行"></a>
																			<span class="separator"></span>
																		    <%--<a class="mini-button" id="_tbgridPgPosUser_import" iconCls="icon-upload-alt"  onclick="ImportExcel('gridPgPosUser' )" plain="true">导入行</a>--%>
																			<a class="mini-button" id="_tbgridPgPosUser_export" iconCls="icon-download-alt"  onclick="ExportExcel('gridPgPosUser' )" plain="true" tooltip="导出行"></a>
																			<span class="separator"></span>
																			<a class="mini-button" id="_tbgridPgPosUser_refresh" iconCls="icon-refresh" onclick="refreshChildGridData('gridPgPosUser')" plain="true"  tooltip="刷新"></a>
<!-- 																			<a class="mini-menubutton" id="_tbgridPgPosUser_op" iconCls="icon-cogs"  plain="true" menu="#_pmgridPgPosUser" tooltip="操作"></a> -->
																		</td>
																		<td style="white-space:nowrap;">
																		</td>
																	</tr>
																</table>
																<ul id="_pmgridPgPosUser" class="mini-menu" style="display:none;"  textField="name" idField="id" parentField="parentId"   onitemclick="onGridSubOpMiClick_gridPgPosUser">
														
																</ul>
															</div>
														</div>
														<div id="gridPgPosUser" class="mini-datagrid" style="width:100%;"
															 url="${ctx}/ims-iam-ext/pg/pgPosUser/data" idField="id"
															 allowResize="false" showPager="false"
															 allowCellSelect="true" allowCellEdit="true"
															 editNextOnEnterKey="false"  editNextRowCell="false" showFilterRow="false"
															 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
														>
															<div property="columns">
																<div type="indexcolumn" width="40"></div>
																	<div name="id" field="id" vtype="required" readOnly="true" hideable="true" visible="false" headerAlign="center" allowSort="true" width="64" >ID
																		<input property="editor" class="mini-textbox"  style="width:100%;"  />
																		<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																			   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
																		/>
																	</div>
																	<div name="posAdd" field="posAdd" vtype="required" readOnly="true" hideable="true" visible="false" headerAlign="center" allowSort="true" width="64" >posAdd
																		<input property="editor" class="mini-textbox"  style="width:100%;"  />
																	</div>
																	
																	<div name="posId" field="posId" vtype="" hideable="true" visible="false" headerAlign="center" allowSort="true" width="64" >岗位ID
																		<input property="editor" class="mini-textbox"  style="width:100%;"  />
																		<input id="posId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																			   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
																		/>
																	</div>
																	<div name="posName" field="posName" vtype=""   headerAlign="center" allowSort="true" width="120" visible="false" hideable="true">岗位名称
																		<input property="editor" class="mini-buttonedit"  style="width:100%;"   textField="posName"
																		   	onbuttonclick="popLov(this,'选择岗位',false,true,'${ctx}/ims-iam-ext/pg/pgPos/form',850,500,'id,name,roleId,roleName','posId,posName,role.id,role.name','gridPgPosUser',null,function(){posEndedit();})"
																			/>
																		<input id="posName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																			   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
																		/>
																	</div>
																	<div name="role.id" field="role.id" vtype="" hideable="true" visible="false" headerAlign="center" allowSort="true" width="120" >角色ID
																		<input property="editor" class="mini-textbox"  style="width:100%;"  />
																	</div>
																	<div name="role.name" field="role.name" vtype="" readOnly="true" headerAlign="center" allowSort="true" width="120"  visible="false" hideable="true">角色名称
																		<input property="editor" class="mini-textbox"  style="width:100%;"  />
																	</div>
																	<div name="userId" field="userId" vtype="" hideable="true" visible="false" headerAlign="center" allowSort="true" width="64" >人员ID
																		<input property="editor" class="mini-textbox"  style="width:100%;"  />
																		<input id="userId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																			   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
																		/>
																	</div>
																	<div name="userName" field="userName" vtype="" readOnly="true" headerAlign="center" allowSort="true" width="120" >人员名称
																		<input property="editor" class="mini-textbox"  style="width:100%;"  />
																		<input id="userName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
																			   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
																		/>
																	</div>
																	<div name="sysUser.loginName" field="sysUser.loginName" readOnly="true" vtype=""  headerAlign="center" allowSort="false" width="120" >人员登录名称
																		<input property="editor" class="mini-textbox"  style="width:100%;"  />
																		
																	</div>
																	<div type="comboboxcolumn" autoShowPopup="true" name="mainPos"  field="mainPos" vtype=""  headerAlign="center" allowSort="true" width="120" >主职/兼职
																		<input property="editor" class="mini-combobox" style="width:100%;" valueField="value"  textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=pg_user_mainPos" />
																		<input id="mainPos-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
												                           textField="label" valueField="value" url="${ctx}/ims-ext/sys/dict/listDataStr?type=" multiSelect="true"
												                           onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
																		/>
																	</div>
												
												        </div>
												    </div>
												</div>
				            </div> <!--mini-col-->
				        </div> <!--clearfix-->
				     </div> <!--container-->
				  </div> <!--editform-->
									<div class="mini-fit">
											 <div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
											 </div>
									</div><!--fit-->

							 </div><!--fit-->

						</div>

					</div>
					</div>
	    </div>
	</div>

</div>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	var saveToUap = getUrlParam("saveToUap");
	initBase(
			{   id:"datagridMain",
			    objId:"PgPos",
			    treeFilter:"(a.org_id=[node.id] or (a.org_id in(select id from ims_sys_org where parent_ids like '%,'||'[node.id]'||',%')))",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
			    treeParentField:"parentId",
			    masterKeyField:"id",
			    treeSrcFields:"id,name",
			    treeDestFields:"orgId,orgName",
				dataUrl:"${ctx}/ims-iam-ext/pg/pgPos/data",
				getUrl:"${ctx}/ims-iam-ext/pg/pgPos/get",
				saveUrl:"${ctx}/ims-iam-ext/pg/pgPos/save",
				removeUrl:"${ctx}/ims-iam-ext/pg/pgPos/remove",
				exportUrl:"${ctx}/ims-iam-ext/pg/pgPos/export",
				onAfterLoadRecord : onAfterLoadRecord
			 }
	       );
	function onAfterLoadRecord()
	{
		var cell = mini.get("saveToUap");
		if(objIsNotNull(saveToUap))
		{
			cell.setValue(saveToUap);
		}
		else
		{
			cell.setValue("0");
		}
	}
	initChilds( "#editform", "tabsMain" ,
                      [
                    	  {
								id:"gridPgPosUser",
				                 objId:"PgPosUser",
				                 FK:"posId",
				                 cascade:true,
				                 cascadeVisible:true,
				                 insertPos:"L",
				                 insertType:"A",
				                 panelId:"tabPgPosUserList",
				                 //tabName:"tab"+objId+"List",
								 dataUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/data",
								 getUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/get",
								 saveUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/save",
								 removeUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/remove",
								 exportUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/export"
							}
	                   ]
	);

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: 'id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.name',
						label: '岗位名称',
						type: 'string',
						default_value: '',
						size: 40
					}
					,{
						id: 'a.seq_no',
						label: '排序',
						type: 'integer',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.code',
						label: '岗位编码',
						type: 'string',
						default_value: '',
						size: 40
					}
					,{
						id: 'a.org_id',
						label: '所属组织机构',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.org_name',
						label: '所属组织机构名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.spec_id',
						label: '专业ID',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.spen_name',
						label: '专业名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.role_id',
						label: '对应角色ID',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.role_name',
						label: '对应角色名称',
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
   
   function close(e){
	   e.setValue("");
	   e.setText("");
	   e.doValueChanged();
   }
   
   function addUser(gridId){
       //popLov(this,'选择人员',true,true,'${ctx}/sys/sysUser/sysMisList',850,600,'id',null,null, null,assignRole);
       popLov(null,'选择用户',true,true,'${ctx}/ims-iam-ext/sys/sysUser/sysMisList',850,500,'id',null,null, null,selectUser,null);
   }
   
   function selectUser(data){debugger;
		var grid = mini.get("gridPgPosUser");
		if(!objIsNotNull(data))
		{
			return;
		}
		var posName = mini.get("posname").getValue();
		var gridData = grid.getData();
		var userIdStr = "";
        for(var i =0;i<gridData.length;i++){
        	userIdStr += "'" + gridData[i].userId + "',";
        }
		for(var i = data.length;i--;)
		{
			var row = data[i];
			if(userIdStr.indexOf("'"+row.id+"',") != -1)
			{
				continue;
			}
			var newRow = {};
			newRow.sysUser = {};
			//id,posId,posName,role.id,role.name,userId,userName,sysUser.loginName,mainPos
			newRow.userId = row.id;
			newRow.posAdd = "1";
			newRow.userName = row.name;
			newRow.sysUser.loginName = row.loginName;
			copyObjAttr(initInsert("gridPgPosUser"),newRow,1);
			grid.addRow(newRow,0);
		}
   }
</script>
</body>
</html>