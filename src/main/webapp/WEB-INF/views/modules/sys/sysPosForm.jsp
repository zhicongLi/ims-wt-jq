<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>岗位管理</title>
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
						<sys:treewithsearchbar
							dataUrl="${ctx}/ims-iam-ext/sys/sysOrg/allDataNoControl?baseQuery=${param.orgQuery }&parentId=${param.orgId}&likeParentId=${param.likeParentId}" idField="id"
							valueField="id" textField="name" parentField="parentId" expandOnLoad="0"
							textFieldLabel="名称"></sys:treewithsearchbar>
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
									style="width: 100%; height: 100%;" url="${ctx}/ims-iam-ext/pg/pgPos/allData"
									idField="id" allowResize="true" pageSize="100"
									allowCellSelect="true" multiSelect="false"
									editNextOnEnterKey="true" editNextRowCell="true"
									allowAlternating="true" showFilterRow="true"
									showColumnsMenu="true">
									<div property="columns">
										<div type="checkcolumn" hideable="true" visible="false"></div>
										<div type="indexcolumn"></div>
										<div name="orgId" field="orgId" vtype="required"
											headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">
											归属部门 编号<input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="orgName" field="orgName" vtype="required"
											headerAlign="center" allowSort="true" width="200" hideable="true" visible="false">
											归属部门 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>

										<div name="name" field="name" vtype="required"
											 headerAlign="center" allowSort="true" width="100" sortField="a.name">
											岗位名称 <input property="editor" class="mini-textbox"
													  style="width: 100%;" /> <input id="name-Filter"
																					 name="mini-column-filter" property="filter"
																					 class="mini-textbox" style="width: 100%;"
																					 onvaluechanged="onFilterChanged" />
										</div>
									</div>
								</div>
							</div>
						</div>
						<div title="明细" id="tabForm" style="border: 0px;">
							<sys:toolbarformmain permissionEdit="sys:sysUser:edit"></sys:toolbarformmain>
							<div id="editform" class="form"
								style="width: 100%; height:100%;">
								<div class="container" style="width: 100%;">
									<div class="mini-clearfix ">
										<div class="mini-col-12">

											<div class="mini-panel" title="基本信息" width="auto"
												height="auto" showCollapseButton="true"
												onbuttonclick="onPanelButtonClick" name="_panel_exp">
												
												<input class="mini-hidden" name="id" id="id" />
												<table border="0" cellpadding="3" cellspacing="3">
													<tr>

														<td style="text-align: right;">归属组织：</td>
														<td>
															<input name="orgId" id="orgId" textName="orgId"
                                                                       class="mini-buttonedit" vtype="" required="false"
                                                                       width="180px" allowInput="false"
                                                                       onbuttonclick="popLov(this,'选择',false,true,' ${ctxRoot}/form?view=sys/sysOrgList&likeParentId=1&parentId=${userInfo.unitId}&likeParentId=1&type=3&parentId=${userInfo.unitId}',850,500,'id,name,shortName','compId,compName,shortName')"/>
														</td>
														<td style="text-align: right;">机构名称：</td>
														<td><input name="orgName" id="orgName" class="mini-textbox"
															vtype="" required="true" /></td>
														</td>
														<td style="text-align: right;">名称：</td>
														<td><input name="name" id="name" class="mini-textbox"
															vtype="" required="true" /></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
								
								
						<div class="mini-fit"> 
								<div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width: 100%; height: 100%;">
									<div title="分配用户" id="tabPgPosUserList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridPgPosUser" showClone="false" permissionEdit="pg:pgPosUser:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridPgPosUser" class="mini-datagrid" style="width:100%;height:100%;"
										  url="${ctx}/ims-iam-ext/pg/pgPosUser/data" idField="id"
										  allowResize="true" pageSize="10"
										  allowCellSelect="true" allowCellEdit="false"
										  editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="true"
										  allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>
											<div name="posId"  field="posId"   vtype="" headerAlign="center" allowSort="true"  width="200" visible="false">posId
											</div>
											<div name="userId"  field="userId"   vtype="" headerAlign="center" allowSort="true"  width="200" visible="false">userId
											</div>
											<div name="userName"  field="userName"  vtype="" headerAlign="center" allowSort="true" width="150">用户名
												<input property="editor" class="mini-textbox" allowLimitValue="false" style="width:100%;"/>
                                                <input id="seqNo-Filter" name="mini-column-filter" property="filter"
                                                       class="mini-textbox" style="width:100%;" onvaluechanged="onFilterChangedChild(this,'gridPgPosUser')"
                                                       showClose="true" oncloseclick="onChildFilterClose(this,'gridPgPosUser')"
                                               />
											</div>
											<div name="mainPos"  field="mainPos" vtype=""  headerAlign="center" type="comboboxcolumn"  allowSort="true" width="85" allowSort="false">是否主职
												<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/ims-idms/sysdict/dictionary?type=pg_user_mainPos"  style="width:100%;"  />
												<input id="mainPos-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" multiSelect="true" valueField="value" textField="label"  style="width:100%;" url="${ctx}/ims-idms/sysdict/dictionary?type=pg_user_mainPos"
													   onvaluechanged="onFilterChangedChild(this,'gridPgPosUser')"  showClose="true" oncloseclick="onChildFilterClose(this,'gridPgPosUser')"
												/>
											</div>
										</div>
									</div>
								 </div>
							  </div>
								</div>
						</div>
						
						
							</div>
						</div>

					</div>
					<sys:toolbarfooter></sys:toolbarfooter>
					<sys:excelframe></sys:excelframe>

					<script type="text/javascript">

						initBase({
							id : "datagridMain",
							objId : "PgPos",
							treeFilter : "((org.id=[node.id]) or (org.parent_ids like '%,[node.id],%'))",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
							treeSrcFields : "id",
							treeDestFields : "orgId",
							treeFilter2 : "(e.id='[node.id]')",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
							masterKeyField : "id",
							dataUrl : "${ctx}/ims-iam-ext/pg/pgPos/data?orgQuery=${param.orgQuery}&queryField=orgQuery",
							getUrl : "${ctx}/ims-iam-ext/pg/pgPos/get",
							saveUrl : "${ctx}/ims-iam-ext/pg/pgPos/save",
							removeUrl : "${ctx}/ims-iam-ext/pg/pgPos/remove",
							exportUrl : "${ctx}/ims-iam-ext/pg/pgPos/export",
							addCan : '0',
							removeCan :'0',
							cloneCan : '0'
							
						});

						initChilds("#editform", "tabsMain", 
						[
							{
							    id:"gridPgPosUser",
							    objId:"PgPosUser",
							    FK:"posId",
							    cascade:true,
								dataUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/data",
							    getUrl:"",
								saveUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/save",
								removeUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/remove",
								exportUrl:"",
				                  addCan:'0',
				                  removeCan:'0',
				                  cloneCan:'0'
							   },
						]
						); 
						initQb(
								"#builder",
								"pnlQuery",
								"tabsQuery",
								"txtSQL",
								"btnAdvSearch",
								[{
									id: 'a.name',
									label: '名称',
									type: 'string',
									default_value: '',
									size: 100
								}
										]);
						loadWindow();	
			$(function(){
				mini.get("_tbForm_save").setEnabled(false);			
				var form = new mini.Form("#editform");     
				form.setEnabled(false);
			});
							
	</script>
</body>
</html>