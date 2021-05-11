<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>业务操作日志配置工作圈</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysOpLogConfigRing" permissionEdit="sys:sysOpLogConfigRing:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysOpLogConfigRing/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" >编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="configId"  field="configId" vtype=""  headerAlign="center" allowSort="true" width="64" >配置编码
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="configId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="logDelete"  field="logDelete" vtype=""  headerAlign="center" allowSort="true" width="100" >记录删除
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="logDelete-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="logUpdate"  field="logUpdate" vtype=""  headerAlign="center" allowSort="true" width="100" >记录更新
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="logUpdate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="logInsert"  field="logInsert" vtype=""  headerAlign="center" allowSort="true" width="100" >记录新建
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="logInsert-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="isActive"  field="isActive" vtype=""  headerAlign="center" allowSort="true" width="100" >是否启用
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="isActive-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="note"  field="note" vtype=""  headerAlign="center" allowSort="true" width="200" >备注
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="note-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="icon"  field="icon" vtype=""  headerAlign="center" allowSort="true" width="50" >图标
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="icon-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="headerStr"  field="headerStr" vtype=""  headerAlign="center" allowSort="true" width="500" >内容头
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="headerStr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="bodyStr"  field="bodyStr" vtype=""  headerAlign="center" allowSort="true" width="100" >内容体
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="bodyStr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="isShowDoc"  field="isShowDoc" vtype=""  headerAlign="center" allowSort="true" width="100" >是否显示附件
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="isShowDoc-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysOpLogConfigRing:edit"></sys:toolbarformmain>
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
											<td style="text-align:right;">配置编码：</td>
											<td>
											   <input name="configId" id="configId" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">记录删除：</td>
											<td>
											   <input name="logDelete" id="logDelete" class="mini-textbox"   vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">记录更新：</td>
											<td>
											   <input name="logUpdate" id="logUpdate" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">记录新建：</td>
											<td>
											   <input name="logInsert" id="logInsert" class="mini-textbox"   vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">是否启用：</td>
											<td>
											   <input name="isActive" id="isActive" class="mini-textbox"  vtype = ""  required="false" />
											</td>
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
											<td style="text-align:right;">内容头：</td>
											<td>
											   <input name="headerStr" id="headerStr" class="mini-textbox"   vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">内容体：</td>
											<td>
											   <input name="bodyStr" id="bodyStr" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">是否显示附件：</td>
											<td>
											   <input name="isShowDoc" id="isShowDoc" class="mini-textbox"   vtype = "" required="false" />
											</td>

										</tr>

										<tr>
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

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysOpLogConfigRing",
				dataUrl:"${ctx}/sys/sysOpLogConfigRing/data",
				getUrl:"${ctx}/sys/sysOpLogConfigRing/get",
				saveUrl:"${ctx}/sys/sysOpLogConfigRing/save",
				removeUrl:"${ctx}/sys/sysOpLogConfigRing/remove",
				exportUrl:"${ctx}/sys/sysOpLogConfigRing/export"
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
						label: '编号',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.config_id',
						label: '配置编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.log_delete',
						label: '记录删除',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.log_update',
						label: '记录更新',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.log_insert',
						label: '记录新建',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.is_active',
						label: '是否启用',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.note',
						label: '备注',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.icon',
						label: '图标',
						type: 'string',
						default_value: '',
						size: 50
					}
					,{
						id: 'a.header_str',
						label: '内容头',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.body_str',
						label: '内容体',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.is_show_doc',
						label: '是否显示附件',
						type: 'string',
						default_value: '',
						size: 100
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