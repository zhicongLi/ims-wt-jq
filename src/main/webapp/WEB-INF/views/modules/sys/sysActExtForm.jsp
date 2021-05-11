<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>工作流扩展属性</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysActExt" permissionEdit="sys:sysActExt:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysActExt/data" idField="id"
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
							<div name="procKey"  field="procKey" vtype=""  headerAlign="center" allowSort="true" width="64" >流程定义编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="procKey-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="nodeId"  field="nodeId" vtype=""  headerAlign="center" allowSort="true" width="255" >节点ID
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="nodeId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="true" width="100" >名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="255" >备注信息
								<input property="editor" class="mini-textarea" style="width:100%;"  />
								<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="msgType"  field="msgType" vtype=""  headerAlign="center" allowSort="true" width="64" >消息类型
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="msgType-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="msgText"  field="msgText" vtype=""  headerAlign="center" allowSort="true" width="100" >消息内容
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="msgText-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="ctrlId"  field="ctrlId" vtype=""  headerAlign="center" allowSort="true" width="64" >控制编码
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="ctrlId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysActExt:edit"></sys:toolbarformmain>
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
											<td style="text-align:right;">流程定义编号：</td>
											<td>
											   <input name="procKey" id="procKey" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">节点ID：</td>
											<td>
											   <input name="nodeId" id="nodeId"  class="mini-textbox"  vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">名称：</td>
											<td>
											   <input name="name" id="name" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">备注信息：</td>
											<td>
											   <input name="remarks" id="remarks"  class="mini-textarea"  vtype = "" required="false"/>
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">是否发送消息：</td>
											<td>
											<input name="isSendMsg" id="isSendMsg" class="mini-checkbox"  trueValue="1" falseValue="0"  vtype = ""  required="false"  />
											</td>
											<td style="text-align:right;">消息类型：</td>
											<td>
											   <input name="msgType" id="msgType"  class="mini-textbox"  vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">消息内容：</td>
											<td>
											   <input name="msgText" id="msgText" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">控制编码：</td>
											<td>
											   <input name="ctrlId" id="ctrlId"  class="mini-textbox"  vtype = "" required="false" />
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
			    objId:"SysActExt",
			    masterKeyField:"",
				dataUrl:"${ctx}/sys/sysActExt/data",
				getUrl:"${ctx}/sys/sysActExt/get",
				saveUrl:"${ctx}/sys/sysActExt/save",
				removeUrl:"${ctx}/sys/sysActExt/remove",
				exportUrl:"${ctx}/sys/sysActExt/export"
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
						id: 'a.proc_def_id',
						label: '流程定义编号',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.node_id',
						label: '节点ID',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.remarks',
						label: '备注信息',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.is_send_msg',
						label: '是否发送消息',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.msg_type',
						label: '消息类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.msg_text',
						label: '消息内容',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.ctrl_id',
						label: '控制编码',
						type: 'string',
						default_value: '',
						size: 64
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

</script>
</body>
</html>