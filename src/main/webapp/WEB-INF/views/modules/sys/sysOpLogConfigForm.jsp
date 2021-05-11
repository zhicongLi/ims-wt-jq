<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>日志管理配置</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="mini-fit">
<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysOpLogConfig" permissionEdit="sys:sysOpLogConfig:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysOpLogConfig/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false" >编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
							<div name="objId"  field="objId" vtype=""  headerAlign="center" allowSort="true" width="64" >业务对象
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
							<div name="keyField"  field="keyField" vtype=""  headerAlign="center" allowSort="true" width="150" >业务主键字段
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
							<div type="checkboxcolumn"  name="isActive"  field="isActive"    trueValue="1" falseValue="0" vtype=""  headerAlign="center" allowSort="true" width="120" sortField="a.is_active">是否启用
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
							<div type="checkboxcolumn" trueValue="1" falseValue="0" name="logDelete"  field="logDelete" vtype=""  headerAlign="center" allowSort="true" width="120" >记录删除
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
							<div type="checkboxcolumn" trueValue="1" falseValue="0" name="logUpdate"  field="logUpdate" vtype=""  headerAlign="center" allowSort="true" width="120" >记录更新
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
							<div type="checkboxcolumn" trueValue="1" falseValue="0" name="logInsert"  field="logInsert" vtype=""  headerAlign="center" allowSort="true" width="120" >记录新建
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
							<div name="note"  field="note" vtype=""  headerAlign="center" allowSort="true" width="200" >备注
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysOpLogConfig:edit"></sys:toolbarformmain>
		<div class="mini-fit">
				<div id="editform" class="form" style="width:100%;height:130px;">
						<input class="mini-hidden" name="id" id="id"/>
						<table border="0" cellpadding="3" cellspacing="3" >
							<tr>
								<td style="text-align:right;">业务对象：</td>
								<td>
								   <input name="objId" id="objId" class="mini-textbox"  vtype = ""  required="true" />
								</td>
								<td style="text-align:right;">业务主键字段：</td>
								<td>
								   <input name="keyField" id="keyField"  class="mini-textbox"  vtype = "" required="false" />
								</td>

							</tr>
							<tr>
								<td style="text-align:right;">是否启用：</td>
								<td>
								   <input class="mini-checkbox"  trueValue="1" falseValue="0"   name="isActive" id="isActive" class="mini-textbox"  vtype = ""  required="false" />
								</td>
								<td style="text-align:right;">记录删除：</td>
								<td>
								   <input class="mini-checkbox"  trueValue="1" falseValue="0"  name="logDelete" id="logDelete"  class="mini-textbox"  vtype = "" required="false" />
								</td>

							</tr>
							<tr>
								<td style="text-align:right;">记录更新：</td>
								<td>
								   <input class="mini-checkbox"  trueValue="1" falseValue="0"  name="logUpdate" id="logUpdate" class="mini-textbox"  vtype = ""  required="false" />
								</td>
								<td style="text-align:right;">记录新建：</td>
								<td>
								   <input class="mini-checkbox"  trueValue="1" falseValue="0"  name="logInsert" id="logInsert"  class="mini-textbox"  vtype = "" required="false" />
								</td>

							</tr>
							<tr>
								<td style="text-align:right;">备注：</td>
								<td>
								   <input name="note" id="note" class="mini-textbox"  vtype = ""  required="false" />
								</td>

							</tr>

							<tr>
							</tr>
						</table>
				</div>
		        <div class="mini-fit">
						 <div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
								<div title="业务操作日志配置字段表" id="tabSysOpLogConfigLineList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSysOpLogConfigLine" permissionEdit="sys:sysOpLogConfigLine:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSysOpLogConfigLine" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/sys/sysOpLogConfigLine/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="true"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>

											<div name="configId" hideable="true" visible="false"  field="configId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div name="logField"  field="logField"   vtype="required" headerAlign="center" allowSort="true"  width="150" >业务字段
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
											</div>
											<div type="checkboxcolumn"  name="isActive"  field="isActive"    trueValue="1" falseValue="0"  vtype="" headerAlign="center" allowSort="true"  width="120" >是否启用
											</div>
											<div name="note"  field="note"   vtype="" headerAlign="center" allowSort="true"  width="200" >备注
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
											</div>


										</div>
									</div>
								 </div>
							  </div>
							  
							  <div title="工作圈配置" id="SysOpLogConfigRingList" name="SysOpLogConfigRingList" style="border: 0px;"  >
									<div id="editform2" class="form" style="width:100%;height:100%;">
										<input name="id"  hideable="true" visible="false" class="mini-textbox" vtype = ""  required="false" />
										<input name="configId"  hideable="true" visible="false" class="mini-textbox" vtype = ""  required="false" />
										
										
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
											<td style="text-align:right;">记录删除：</td>
											<td>
											   <input name="logDelete" id="logDelete" class="mini-checkbox"   vtype = "" required="false" trueValue="1" falseValue="0"/>
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">记录更新：</td>
											<td>
											   <input name="logUpdate" id="logUpdate" class="mini-checkbox"  vtype = ""  required="false" trueValue="1" falseValue="0"/>
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">记录新建：</td>
											<td>
											   <input name="logInsert" id="logInsert" class="mini-checkbox"   vtype = "" required="false" trueValue="1" falseValue="0"/>
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">是否启用：</td>
											<td>
											   <input name="isActive" id="isActive" class="mini-checkbox"  vtype = ""  required="false" trueValue="1" falseValue="0"/>
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">是否显示附件：</td>
											<td>
											   <input name="isShowDoc" id="isShowDoc" class="mini-checkbox"   vtype = "" required="false" trueValue="1" falseValue="0"/>
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">备注：</td>
											<td>
											   <input name="note" id="note" class="mini-textbox"   vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">图标：</td>
											<td>
											   <input name="icon" id="icon" class="mini-textbox"  vtype = ""  required="false" />
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">内容头：</td>
											<td>
											   <input name="headerStr" id="headerStr" class="mini-textarea"   vtype = "" required="false" width="300"/>
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">内容体：</td>
											<td>
											   <input name="bodyStr" id="bodyStr" class="mini-textarea"  vtype = ""  required="false" width="300"/>
											</td>
										</tr>
										</table>
									</div>
								</div>
							  
						 </div>
		        </div><!--fit-->

	     </div><!--fit-->

	</div>

</div>
</div>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysOpLogConfig",
			    masterKeyField:"id",
				dataUrl:"${ctx}/sys/sysOpLogConfig/data",
				getUrl:"${ctx}/sys/sysOpLogConfig/get",
				saveUrl:"${ctx}/sys/sysOpLogConfig/save",
				removeUrl:"${ctx}/sys/sysOpLogConfig/remove",
				exportUrl:"${ctx}/sys/sysOpLogConfig/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                    {
		                 id:"gridSysOpLogConfigLine",
		                 objId:"SysOpLogConfigLine",
		                 FK:"configId",
		                 cascade:true,
						 dataUrl:"${ctx}/sys/sysOpLogConfigLine/data",
						 getUrl:"${ctx}/sys/sysOpLogConfigLine/get",
						 saveUrl:"${ctx}/sys/sysOpLogConfigLine/save",
						 removeUrl:"${ctx}/sys/sysOpLogConfigLine/remove",
						 exportUrl:"${ctx}/sys/sysOpLogConfigLine/export"
	                    },
   	                    {
   		                 id:"#editform2",
   		                 objId:"SysOpLogConfigRing",
   		                 FK:"configId",
   		                 cascade:true,
   		                 tabName:"SysOpLogConfigRingList",
   						 dataUrl:"${ctx}/sys/sysOpLogConfigRing/data",
   						 getUrl:"${ctx}/sys/sysOpLogConfigRing/get",
   						 saveUrl:"${ctx}/sys/sysOpLogConfigRing/save",
   						 removeUrl:"${ctx}/sys/sysOpLogConfigRing/remove",
   						 exportUrl:"${ctx}/sys/sysOpLogConfigRing/export"
   	                    }
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
						id: 'a.obj_id',
						label: '业务对象',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.key_field',
						label: '业务主键字段',
						type: 'string',
						default_value: '',
						size: 150
					}
					,{
						id: 'a.is_active',
						label: '是否启用',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.log_delete',
						label: '记录删除',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.log_update',
						label: '记录更新',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.log_insert',
						label: '记录新建',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.note',
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

   }
   //////////form操作菜单项点击事件方法/////////
   function onFormOpMiClick(e){

   }
   //////////子表格操作菜单项点击事件方法/////////
   function onGridSubOpMiClick_SysOpLogConfigLine(e){

   }

</script>
</body>
</html>