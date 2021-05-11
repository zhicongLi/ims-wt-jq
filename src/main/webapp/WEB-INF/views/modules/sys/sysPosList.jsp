<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>岗位管理</title>
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
							<sys:toolbargridmain objId="PgPos"
								permissionEdit="pg:pgPos:edit"></sys:toolbargridmain>
							<sys:searchadv></sys:searchadv>
							<div class="mini-fit">
								<div id="datagridMain" class="mini-datagrid"
									style="width: 100%; height: 100%;" url="${ctx}/ims-iam-ext/pg/pgPos/allData"
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