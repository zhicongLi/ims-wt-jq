<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>专业</title>
	 <meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="PgSpec" permissionEdit="pg:pgSpec:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/ims-iam-ext/pg/pgSpec/data" idField="id"
					 allowResize="true" pageSize="20"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype=""  headerAlign="center" allowSort="true" width="64" >编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							
							<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="true" width="100" >名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="descr"  field="descr" vtype=""  headerAlign="center" allowSort="true" width="80" >专业编码
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="groupId"  field="groupId" vtype=""  headerAlign="center" allowSort="true" width="64" >专业分组
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="groupId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="seqNo"  field="seqNo" vtype=""  headerAlign="center" allowSort="true" width="60" >排序
								<input property="editor" class="mini-textbox" style="width:100%;"  />
								<input id="seqNo-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="80" >备注信息
								<input property="editor" class="mini-textarea" style="width:100%;"  />
								<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="siteId"  field="siteId" vtype=""  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">站点ID
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="siteId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div type="checkboxcolumn"  name="isActive"  field="isActive"  vtype=""  trueValue="1" falseValue="0" headerAlign="center" allowSort="true" width="50" sortField="a.is_active">是否启用
							</div>
							 <div name="code"  field="code" vtype=""  headerAlign="center" allowSort="true" width="80" class="mini-hidden">描述
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="code-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="pg:pgSpec:edit"></sys:toolbarformmain>
                  <div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
									<input name="isNewRecord" id="isNewRecord" class="mini-hidden"/>
									<input name="_state" id="_state" class="mini-hidden"/>
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
										    <td style="text-align:right;">编号：</td>
											<td>
											   <input name="id" id="id" class="mini-textbox"  vtype = ""  required="false"/>
											</td>
											
											<td style="text-align:right;">名称：</td>
											<td>
											   <input name="name" id="name" class="mini-textbox"   vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">专业编码：</td>
											<td>
											   <input name="descr" id="descr" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">专业分组：</td>
											<td>
											   <input name="groupId" id="groupId" class="mini-textbox"   vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">排序：</td>
											<td>
											   <input name="seqNo" id="seqNo" class="mini-textbox" vtype = ""  required="false"  />
											</td>
											<td style="text-align:right;">是否启用：</td>
											<td>
											   <input name="isActive" id="isActive"  class="mini-checkbox"  trueValue="1" falseValue="0"  vtype = ""  required="false"  />
											</td>
                                            
										</tr>
										<tr>
											<td style="text-align:right;">备注信息：</td>
											<td>
											   <input name="remarks" id="remarks" class="mini-textarea" vtype = ""  required="false"  />
											</td>
											<td style="text-align:right;">描述：</td>
											<td>
											   <input name="code" id="code" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											
										</tr>
									</table>
				                </div> <!--panel-->
				            </div> <!--mini-col-->
				        </div> <!--clearfix-->
				     </div> <!--container-->
				  </div> <!--editform-->


		        <div class="mini-fit">
					<div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;"></div>
		        </div><!--fit-->

	    </div>

   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"PgSpec",
			    // masterKeyField:"id",
				dataUrl:"${ctx}/ims-iam-ext/pg/pgSpec/data",
				getUrl:"${ctx}/ims-iam-ext/pg/pgSpec/get",
				saveUrl:"${ctx}/ims-iam-extpg/pgSpec/save",
				removeUrl:"${ctx}/ims-iam-ext/pg/pgSpec/remove",
				exportUrl:"${ctx}/ims-iam-ext/pg/pgSpec/export",
				initInsertUrl:"${ctx}/ims-iam-ext/pg/pgSpec/initInsert",
				onAfterInsertRecord:onAfterInsertRecord,
				onAfterSaveForm:onAfterSaveForm
			 }
	       );

	  function onAfterInsertRecord(data) {
		 mini.get("id").setAllowInput(true);
		 data["isActive"]='1';	
		} 
		
	    function onAfterSaveForm() {
	    	mini.get("id").setAllowInput(false);
		}


	initChilds( "#editform", "tabsMain" ,
                      [
	                    <%--{--%>
		                 <%--id:"gridPgSpecResp",--%>
		                 <%--objId:"PgSpecResp",--%>
		                 <%--FK:"specId",--%>
		                 <%--cascade:true,--%>
						 <%--dataUrl:"${ctx}/ims-iam-ext/pg/pgSpecResp/data",--%>
						 <%--getUrl:"${ctx}/ims-iam-ext/pg/pgSpecResp/get",--%>
						 <%--saveUrl:"${ctx}/ims-iam-ext/pg/pgSpecResp/save",--%>
						 <%--removeUrl:"${ctx}/ims-iam-ext/pg/pgSpecResp/remove",--%>
						 <%--exportUrl:"${ctx}/ims-iam-ext/pg/pgSpecResp/export"--%>
	                    <%--}--%>
	                   ]
	);

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: '编号',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.code',
						label: '专业编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.name',
						label: '单元名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.descr',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.group_id',
						label: '专业分组',
						type: 'string',
						default_value: '',
						size: 64
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
						label: '站点ID',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.is_active',
						label: '是否启用',
						type: 'string',
						default_value: '',
						size: 100
					}
			]
	);

   loadWindow();
   //////////表格操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){

   }
   //////////form操作菜单项点击事件方法/////////
   function onFormOpMiClick(e){

   }
   //////////子表格操作菜单项点击事件方法/////////
   function onGridSubOpMiClick_PgSpecResp(e){

   }
   function	beforeSaveForm(){
		var isNew = mini.get("isNewRecord").getValue();
		if(isNew){
			mini.get("_state").setValue("added");
		}
		
		return true;
	}
</script>
</body>
</html>