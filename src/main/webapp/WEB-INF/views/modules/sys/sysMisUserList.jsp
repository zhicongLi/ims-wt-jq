<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>用户管理</title>
<meta name="decorator" content="default" />
<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css"
	rel="stylesheet" />
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
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
							dataUrl="${ctx}/ims-iam-ext/sys/sysOrg/allDataNoControl?baseQuery=${param.orgQuery }&parentId=${param.orgId}&likeParentId=${param.likeParentId}" idField="id"
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
									style="width: 100%; height: 100%;" url="${ctx}/ims-iam-ext/sys/user/allData"
									idField="id" allowResize="true" pageSize="20"
									allowCellSelect="true" multiSelect="true"
									editNextOnEnterKey="true" editNextRowCell="true"
									allowAlternating="true" showFilterRow="true"
									showColumnsMenu="true">
									<div property="columns">
										<div type="indexcolumn"></div>
										<div type="checkcolumn" style="width:50px;"></div>
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

										<div name="unitName" field="unitName" vtype="required"
											 headerAlign="center" allowSort="true" width="200" hideable="true">
											公司 <input property="editor" class="mini-textbox"
														style="width: 100%;" />
										</div>

										<div name="deptName" field="deptName" vtype="required"
											 headerAlign="center" allowSort="true" width="200" hideable="true">
											部门 <input property="editor" class="mini-textbox"
													  style="width: 100%;" />
										</div>

										<div name="teamName" field="teamName" vtype="required"
											 headerAlign="center" allowSort="true" width="200" hideable="true" >
											班组 <input property="editor" class="mini-textbox"
													  style="width: 100%;" />
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
							objId : "SysUser",
							treeFilter : "((o.id=[node.id]) or (o.parent_ids like '%,[node.id],%'))",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
							treeSrcFields : "id",
							treeDestFields : "orgId",
							treeFilter2 : "(e.id='[node.id]')",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
							masterKeyField : "id",
							dataUrl : "${ctx}/ims-iam-ext/sys/sysUser/misData?orgQuery=${param.orgQuery}&queryField=orgQuery",
							getUrl : "${ctx}/ims-iam-ext/sys/sysUser/get",
							saveUrl : "${ctx}/ims-iam-ext/sys/sysUser/save",
							removeUrl : "${ctx}/ims-iam-ext/sys/sysUser/remove",
							exportUrl : "${ctx}/ims-iam-ext/sys/sysUser/export"
						});

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
						/////////////////////////////////////////////
						
						
						
					</script>
</body>
</html>