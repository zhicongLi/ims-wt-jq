<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>安全组织机构</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <script type="text/javascript" src="${ctxStatic}/common/sysToolBar.js"></script>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="mini-fit">
	<div id="_splTreeMain" class="mini-splitter" style="width:100%;height:100%;">
	    <div size="240" showCollapseButton="true" style="overflow:auto;">
             <sys:treewithsearchbar dataUrl="${ctx}/ims-org${ims_org_suffix}/sm/smOrg/allData" idField="id" valueField="id" textField="name" parentField="parentId" textFieldLabel="名称"></sys:treewithsearchbar>
	    </div>

		<div showCollapseButton="true">
					<div class="mini-fit">
					<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
						<div title="列表" id="tabList"  style="border: 0px;"  >
								 <sys:toolbargridmain objId="SmOrg" permissionEdit="sm:smOrg:edit"></sys:toolbargridmain>
								 <sys:searchadv></sys:searchadv>
								 <div class="mini-fit">
									<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-org${ims_org_suffix}/sm/smOrg/data" idField="id"
										 allowResize="true" pageSize="20"
										 allowCellSelect="true" multiSelect="false"
										 editNextOnEnterKey="true"  editNextRowCell="true"
										 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
									>
										<div property="columns">
											<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>

												<div name="refOrgId"  field="refOrgId" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">组织机构id
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="refOrgId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="true" width="200" >组织机构名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="feature"  field="feature" vtype=""  headerAlign="center" allowSort="true" width="64" >组织性质
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="feature-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
                                                <div name="parentId"  field="parentId"  vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">父id
                                             <input property="editor" class="mini-treeselect"  url="" valueField="id" textField="name" parentField="parentId" style="width:100%;" />
													<input id="parentId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged"
													/>
                                                </div>
												<div name="parentIds"  field="parentIds" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">父ids
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="parentIds-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>


									</div>
								</div>
							 </div>
						</div>
						<div title="明细" id="tabForm"  style="border: 0px;"  >
							<sys:toolbarformmain permissionEdit="sm:smOrg:edit"></sys:toolbarformmain>
									<div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
											<input class="mini-hidden" name="id" id="id"/>
											<input class="mini-hidden" name="parentName" id="parentName"/>
											<table border="0" cellpadding="3" cellspacing="3" >


												<tr>
													<td style="text-align:right;">组织机构名称：</td>
													<td>
													   <input name="name" id="name" class="mini-textbox"  vtype = ""  required="false" />
													</td>
													<td style="text-align:right;">组织性质：</td>
													<td>
													   <input name="feature" id="feature" class="mini-textbox"  vtype = ""  required="false" />
													</td>
													<td style="text-align:right;">上级单位名称：</td>
													<td>
														<input name="parentId" id="parentId" textName="parentName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
															   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smOrgList',850,500,'id,name','parentId,parentName')"   />
													</td>
												</tr>
												<tr>
												<%--	<td style="text-align:right;">父id：</td>
													<td>--%>
													   <%--<input name="parentId" id="parentId" class="mini-hidden" vtype = ""  required="false"  url="" valueField="id" textField="name" parentField="parentId"/>--%>
													<%--</td>
--%>

												</tr>





												<%--<tr>
												<td>
													<a class="mini-button"  iconCls="icon-plus-sign"  onclick="test" plain="true" tooltip="新建">测试</a>
												</td>
												</tr>--%>
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

	initBase(
			{   id:"datagridMain",
			    objId:"SmOrg",
			    treeFilter:"((a.parent_ids like '%[node.id]%'))",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
			    treeSrcFields : "id,name",
				treeDestFields : "parentId,parentName",
			    treeParentField:"parentId",
			    treeParamStr:"id",
				dataUrl:"${ctx}/ims-org${ims_org_suffix}/sm/smOrg/data",
				getUrl:"${ctx}/ims-org${ims_org_suffix}/sm/smOrg/get",
				saveUrl:"${ctx}/ims-org${ims_org_suffix}/sm/smOrg/save",
				removeUrl:"${ctx}/ims-org${ims_org_suffix}/sm/smOrg/remove",
				exportUrl:"${ctx}/ims-org${ims_org_suffix}/sm/smOrg/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                   ]
	);

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.remarks',
						label: '备注',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.create_comp',
						label: '创建人公司',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.seq_no',
						label: '排序',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.ref_org_id',
						label: '组织机构id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.name',
						label: '组织机构名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.feature',
						label: '组织性质',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.parent_id',
						label: '父id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.parent_ids',
						label: '父ids',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.id',
						label: '编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_by_name',
						label: '创建人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.tenant_id',
						label: '租户id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_by',
						label: '创建人',
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
						id: 'a.update_by_name',
						label: '修改人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.update_by',
						label: '修改人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.update_date',
						label: '修改时间',
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
						id: 'a.site_id',
						label: '站点id',
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
   function test(){
	   
	   var tree = mini.get("treeMain");
	   var node = tree.getSelectedNode();
	   alert(node.id);
	  console.log(node);
   }
   
   function addButton(){
		sysToolBar_.addButtonOption({
			"buttonId":'addOrgList',
			"functionStr":'addOrgList',
			"toolBarId":"_tbGrid_td_",
			"name":'从组织机构选择'
		});
	}
   
   function addOrgList(e){
	   
	   var tree = mini.get("treeMain");
	   var node = tree.getSelectedNode();
	   if(!node){
		   mini.alert("请先选择左边的父节点");
		   return false;
	   }
	   var param={
				obj:e,
				title:"选择安全目标",
				multiSel:true,
				readOnly:true,							
				url:'${ctxRoot}/form?view=sys/misOrgList',
				width:1000,
				height:600,
				selFields:"id,name",
				refFields:"id,name",
				refGridId:null,
				actionLovValid:null,
				actionLov:returnSelectData,
				actionClose:null,
				gridId:"datagridMain",
				allowDblclickSelect:true
		};					
		var data1 = popLov2(param);
   }
   function returnSelectData(s){
	   var gridId = "datagridMain";
	   debugger;
	   var tree = mini.get("treeMain");
	   var node = tree.getSelectedNode();
	   var nodeId = node.id;
	   var nodeName = node.name;
	   
	 //在这里新增表格的数据
		var grid = mini.get(gridId);
		for(var i=0;i<s.length;i++){
			
			var row = {id:s[i].id,name:s[i].name,parentId:nodeId,parentName:nodeName};
			grid.addRow(row);
		}
		saveGrid(gridId,"${ctx}/ims-org${ims_org_suffix}/sm/smOrg/save");
	}
   
   $(function(){
	   addButton();
   });
   //////////子表格操作菜单项点击事件方法/////////
</script>
</body>
</html>