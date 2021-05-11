<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>安全组织用户</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
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
								 <sys:toolbargridmain objId="SmUser" permissionEdit="sm:smUser:edit"></sys:toolbargridmain>
								 <sys:searchadv></sys:searchadv>
								 <div class="mini-fit">
									<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-org${ims_org_suffix}/sm/smUser/data" idField="id"
										 allowResize="true" pageSize="20"
										 allowCellSelect="true" multiSelect="false"
										 editNextOnEnterKey="true"  editNextRowCell="true"
										 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
									>
										<div property="columns">
											<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>

												<div name="smOrgId"  field="smOrgId" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">安全组织机构id
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="smOrgId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="true" width="200" >姓名
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="phone"  field="phone" vtype=""  headerAlign="center" allowSort="true" width="64" >电话
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="phone-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div type="comboboxcolumn" autoShowPopup="true" name="posCode"  field="posCode" headerAlign="center" allowSort="true" width="120" >岗位
													<input property="editor" class="mini-combobox"  textField="label" valueField="value"  style="width:100%;"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_user_position" />
													<input
															id="posCode-Filter" name="mini-column-filter"
															property="filter" class="mini-combobox" style="width: 100%;"
															url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_user_position"
															multiSelect="true" style="width: 100%;"
															onvaluechanged="onFilterChanged" valueField="value"
															textField="label" showClose="true"
															oncloseclick="onFilterClose(this)" />
												</div>
												<div type="comboboxcolumn" autoShowPopup="true" name="sex"  field="sex" headerAlign="center" allowSort="true" width="120" >性别
													<input property="editor" class="mini-combobox"  textField="label" valueField="value"  style="width:100%;"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sex" />
													<input
															id="sex-Filter" name="mini-column-filter"
															property="filter" class="mini-combobox" style="width: 100%;"
															url="${ctx}/ims-ext/sys/dict/listDataStr?type=sex"
															multiSelect="true" style="width: 100%;"
															onvaluechanged="onFilterChanged" valueField="value"
															textField="label" showClose="true"
															oncloseclick="onFilterClose(this)" />
												</div>

									</div>
								</div>
							 </div>
						</div>
						<div title="明细" id="tabForm"  style="border: 0px;"  >
							<sys:toolbarformmain permissionEdit="sm:smUser:edit"></sys:toolbarformmain>
									<div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
											<input class="mini-hidden" name="id" id="id"/>
											<table border="0" cellpadding="3" cellspacing="3" >

												<tr>


													<td style="text-align:right;">姓名：</td>
													<td>
													   <input name="name" id="name" class="mini-textbox"  vtype = ""  required="false" />
													</td>
                                                    </td>
                                                    <td style="text-align:right;">电话：</td>
                                                    <td>
                                                        <input name="phone" id="phone" class="mini-textbox"  vtype = ""  required="false" />
                                                    </td>
													<%--<input name="smOrgId" id="smOrgId" class="mini-hidden"  vtype = ""  required="false" />--%>
													<td style="text-align:right;">组织单位名称：</td>
													<td>
														<input name="smOrgId" id="smOrgId" textName="smOrgName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
															   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smOrgList',850,500,'id,name','smOrgId,smOrgName')"   />
													</td>
													<input class="mini-hidden" name="smOrgName" id="smOrgName"/>
												<tr>
												</tr>



													<td style="text-align:right;">岗位：</td>
													<td>
														<input name="posCode" id="posCode"  class="mini-combobox" vtype = "" required="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_user_position" />

													</td>

													<td style="text-align:right;">性别：</td>
													<td>
														<input name="sex" id="sex"  class="mini-combobox" vtype = "" required="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sex" />

													</td>

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
			    objId:"SmUser",
                treeFilter:"(a.sm_org_id='[node.id]') ",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
			    treeParentField:"parentId",
                treeSrcFields : "id,name",
                treeDestFields : "smOrgId,smOrgName",
				dataUrl:"${ctx}/ims-org${ims_org_suffix}/sm/smUser/data",
				getUrl:"${ctx}/ims-org${ims_org_suffix}/sm/smUser/get",
				saveUrl:"${ctx}/ims-org${ims_org_suffix}/sm/smUser/save",
				removeUrl:"${ctx}/ims-org${ims_org_suffix}/sm/smUser/remove",
				exportUrl:"${ctx}/ims-org${ims_org_suffix}/sm/smUser/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                   ]
	);

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
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
						id: 'a.sm_org_id',
						label: '安全组织机构id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.name',
						label: '姓名',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.user_id',
						label: '用户id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.phone',
						label: '电话',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.pos_code',
						label: '岗位',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.sex',
						label: '性别',
						type: 'string',
						default_value: '',
						size: 64
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
					,{
						id: 'a.remarks',
						label: '备注',
						type: 'string',
						default_value: '',
						size: 200
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
   //////////子表格操作菜单项点击事件方法/////////
</script>
</body>
</html>