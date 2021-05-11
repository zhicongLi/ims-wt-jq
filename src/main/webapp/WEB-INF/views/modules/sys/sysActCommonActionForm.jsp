<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>工作流通用执行动作</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysActCommonAction" permissionEdit="sys:sysActCommonAction:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysActCommonAction/data" idField="id"
					 allowResize="true" pageSize="20"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" visible="false" >编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="actionType"  field="actionType" vtype="" type="comboboxcolumn"  headerAlign="center" allowSort="true" width="100" sortField="a.action_type" >动作类型
								<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_action_action_type"   style="width:100%;"   />
								<input id="actionType-Filter" name="mini-column-filter"  property="filter" class="mini-combobox"   style="width:100%;" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_action_action_type"  multiSelect="true"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="eventType"  field="eventType" vtype=""  type="comboboxcolumn" headerAlign="center" allowSort="true" width="120" sortField="a.event_type" >事件类型
								<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_action_event_type"  style="width:100%;"  />
								<input id="eventType-Filter" name="mini-column-filter" name="mini-column-filter"  property="filter" class="mini-combobox"   style="width:100%;" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_action_event_type"  multiSelect="true"  style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="seqNo"  field="seqNo" vtype=""  headerAlign="center" allowSort="true" width="100" >执行顺序
								<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
								<input id="seqNo-Filter" name="mini-column-filter"  property="filter" class="mini-spinner"  allowLimitValue="false" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="true" width="100" >名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							
							<div name="isActive"  field="isActive" vtype=""  type="comboboxcolumn" headerAlign="center" allowSort="true" width="120" sortField="a.is_active" >是否启用
								<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=yes_no"  style="width:100%;"  />
								<input id="isActive-Filter" name="mini-column-filter" name="mini-column-filter"  property="filter" class="mini-combobox"   style="width:100%;" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=yes_no"  multiSelect="true"  style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="actionExpr"  field="actionExpr" vtype=""  headerAlign="center" allowSort="true" width="100" >执行表达式
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="actionExpr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="actionParam"  field="actionParam" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">执行表达式参数
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="actionParam-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="actionParamValue"  field="actionParamValue" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">执行表达式参数值
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="actionParamValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="actionCond"  field="actionCond" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false">执行条件
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="actionCond-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="javaClassType"  field="javaClassType" vtype=""  type="comboboxcolumn" headerAlign="center" allowSort="true" width="120" sortField="a.java_class_type" >java类获取方式
								<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_action_java_class_type"  style="width:100%;"  />
								<input id="javaClassType-Filter" name="mini-column-filter" name="mini-column-filter"  property="filter" class="mini-combobox"   style="width:100%;" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_action_java_class_type"  multiSelect="true"  style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="execNode"  field="execNode" vtype=""  type="comboboxcolumn" headerAlign="center" allowSort="true" width="120" sortField="a.exec_node" >执行节点
								<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_common_action_exec_node"  style="width:100%;"  />
								<input id="execNode-Filter" name="mini-column-filter" name="mini-column-filter"  property="filter" class="mini-combobox"   style="width:100%;" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_common_action_exec_node"  multiSelect="true"  style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="255" >备注信息
								<input property="editor" class="mini-textarea" style="width:100%;"  />
								<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysActCommonAction:edit"></sys:toolbarformmain>
                  <div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
									<input class="mini-hidden" name="id" id="id"/>
									<input class="mini-hidden" name="actionParam" id="actionParam"/>
									<input class="mini-hidden" name="actionParamValue" id="actionParamValue"/>
									<input class="mini-hidden" name="actionCond" id="actionCond"/>
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
											<td style="text-align:right;">名称：</td>
											<td colspan="3">
											   <input name="name" id="name" class="mini-textbox"   vtype = "" required="false" width="100%"/>
											</td>
											<td style="text-align:right;">动作类型：</td>
											<td>
											 	<input name="actionType" id="actionType"  class="mini-combobox" vtype = ""    required="true" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_action_action_type"  readonly="readonly"/>
											</td>
											<td style="text-align:right;">事件类型：</td>
											<td>
											   <input name="eventType" id="eventType"  class="mini-combobox" vtype = ""   multiSelect="true" required="true" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_action_event_type"  />
											</td>
											
											
											
										</tr>
										
										<tr>
											<td style="text-align:right;">Java类类型：</td>
											<td>
											   <input name="javaClassType" id="javaClassType"  class="mini-combobox" vtype = "" showNullItem="true"   required="false" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_action_java_class_type"  />
											</td>
											<td style="text-align:right;">执行节点：</td>
											<td>
												<input name="execNode" id="execNode"  class="mini-combobox" vtype = "" showNullItem="true"   required="false" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_common_action_exec_node"  />
											</td>
											<td style="text-align:right;">是否启用：</td>
											<td>
											   <input name="isActive" id="isActive" class="mini-checkbox"  trueValue="1" falseValue="0"  vtype = ""  required="false"  />
											</td>
											<td style="text-align:right;">执行顺序：</td>
											<td>
											   <input name="seqNo" id="seqNo" class="mini-spinner" allowLimitValue="false" vtype = ""  required="false" />
											</td>
										</tr>
										
										<tr>
											<td style="text-align:right;">执行表达式：</td>
											<td colspan="7">
											   <input name="actionExpr" id="actionExpr" class="mini-textarea"  vtype = ""  required="false" width="100%"/>
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">备注信息：</td>
											<td colspan="7">
											   <input name="remarks" id="remarks" class="mini-textarea" vtype = ""  required="false"  width="100%"/>
											</td>
											

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
			    objId:"SysActCommonAction",
				dataUrl:"${ctx}/sys/sysActCommonAction/data",
				getUrl:"${ctx}/sys/sysActCommonAction/get",
				saveUrl:"${ctx}/sys/sysActCommonAction/save",
				removeUrl:"${ctx}/sys/sysActCommonAction/remove",
				exportUrl:"${ctx}/sys/sysActCommonAction/export",
				initData:{"actionType":'3'}
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
						id: 'a.action_type',
						label: '动作类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.event_type',
						label: '事件类型',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.seq_no',
						label: '执行顺序',
						type: 'string',
						default_value: '',
						size: 100
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
						id: 'a.is_active',
						label: '是否启用',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.action_expr',
						label: '执行表达式',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.action_param',
						label: '执行表达式参数',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.action_param_value',
						label: '执行表达式参数值',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.action_cond',
						label: '执行条件',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.java_class_type',
						label: 'Java类类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.exec_node',
						label: '执行节点',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_by',
						label: '创建者',
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
						id: 'a.update_by',
						label: '更新者',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.update_date',
						label: '更新时间',
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