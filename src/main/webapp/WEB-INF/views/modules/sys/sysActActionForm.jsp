<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>工作流执行动作</title>
	 <meta name="decorator" content="default"/>
	  <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet"/>
	 <script type="text/javascript" src="${ctxStatic}/common/sysToolBar.js?v=20191106_02"></script>
</head>
<body>
<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysActAction" permissionEdit="sys:sysActAction:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/ims-ext/sys/sysActAction/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false">
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="false" width="64" visible="false" >编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="procKey"  field="procKey" vtype=""  headerAlign="center" allowSort="false" width="150" >流程定义编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="procKey-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="nodeId"  field="nodeId" vtype=""  headerAlign="center" allowSort="true" width="150" sortField="a.node_id">节点ID
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="nodeId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="actionType"  field="actionType" vtype="" type="comboboxcolumn"  headerAlign="center" allowSort="true" width="100" sortField="a.action_type" >动作类型
								<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_act_action_action_type"   style="width:100%;"   />
								<input id="actionType-Filter" name="mini-column-filter"  property="filter" class="mini-combobox"   style="width:100%;" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_act_action_action_type"  multiSelect="true"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="eventType"  field="eventType" vtype=""  type="comboboxcolumn" headerAlign="center" allowSort="true" width="120" sortField="a.event_type" >事件类型
								<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_act_action_event_type"  style="width:100%;"  />
								<input id="eventType-Filter" name="mini-column-filter" name="mini-column-filter"  property="filter" class="mini-combobox"   style="width:100%;" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_act_action_event_type"  multiSelect="true"  style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="seqNo"  field="seqNo" vtype=""  headerAlign="center" allowSort="true" width="100" sortField="a.seq_no">执行顺序
								<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
								<input id="seqNo-Filter" name="mini-column-filter"  property="filter" class="mini-spinner"  allowLimitValue="false" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="true" width="100" sortField="a.name">名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="false" width="255" >备注信息
								<input property="editor" class="mini-textarea" style="width:100%;"  />
								<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="actionExpr"  field="actionExpr" vtype=""  headerAlign="center" allowSort="false" width="100" >执行表达式
								<input property="editor" class="mini-textarea"  style="width:100%;"  />
								<input id="actionExpr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="actionParam"  field="actionParam" vtype=""  headerAlign="center" allowSort="false" width="100" >执行表达式参数
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="actionParam-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="actionParamValue"  field="actionParamValue" vtype=""  headerAlign="center" allowSort="false" width="100" >执行表达式参数值
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="actionParamValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="actionCond"  field="actionCond" vtype=""  headerAlign="center" allowSort="true" width="false" >执行条件
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="actionCond-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysActAction:edit"></sys:toolbarformmain>
                  <div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
									<input class="mini-hidden" name="id" id="id"/>
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
											<td style="text-align:right;">动作类型：</td>
											<td>
											 	<input name="actionType" id="actionType"  class="mini-combobox" vtype = ""    required="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_act_action_action_type"  />
											</td>
											<td style="text-align:right;">事件类型：</td>
											<td>
											   <input name="eventType" id="eventType"  class="mini-combobox" vtype = ""   required="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_act_action_event_type"  />
											</td>
											<td style="text-align:right;">执行顺序：</td>
											<td>
											   <input name="seqNo" id="seqNo" class="mini-spinner" allowLimitValue="false" vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">流程定义key：</td>
											<td>
											   <input name="procKey" id="procKey" class="mini-textbox" vtype = ""  required="false" />
											</td>
										</tr>
										<tr>
											
											<td style="text-align:right;">是否启用：</td>
											<td>
												<input name="isActive" id="isActive" class="mini-checkbox"  trueValue="1" falseValue="0"  vtype = ""  required="false"  />
											</td>
											<td style="text-align:right;">名称：</td>
											<td>
											   <input name="name" id="name"  class="mini-textbox"  vtype = "" required="false" />
											</td>
											<td style="text-align:right;">对象获取方式：</td>
											<td>
												<input name="javaClassType" id="javaClassType"  class="mini-combobox" vtype = "" showNullItem="true"   required="false" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_act_action_java_class_type"  />
											</td>
											<td style="text-align:right;">节点id：</td>
											<td>
											   <input name="nodeId" id="nodeId" class="mini-textbox" vtype = ""  required="false" />
											</td>
										</tr>
										<tr>
										<td style="text-align:right;">执行条件：</td>
											<td>
											   <input name="actionCond" id="actionCond"  class="mini-textarea"  vtype = "" required="false" />
											</td>
											<td style="text-align:right;">执行表达式：</td>
											<td>
											   <input name="actionExpr" id="actionExpr" class="mini-textarea"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">执行表达式参数：</td>
											<td>
											   <input name="actionParam" id="actionParam"  class="mini-textarea"  vtype = "" required="false" />
											</td>
											<td style="text-align:right;">流程定义id：</td>
											<td>
											   <input name="procDefId" id="procDefId" class="mini-textbox" vtype = ""  required="false" />
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">执行表达式参数值：</td>
											<td>
											   <input name="actionParamValue" id="actionParamValue" class="mini-textarea"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">备注信息：</td>
											<td>
											   <input name="remarks" id="remarks" class="mini-textarea" vtype = ""  required="false"  />
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
								<div title="工作流执行动作写入" id="tabSysActActionWriteList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSysActActionWrite" permissionEdit="sys:sysActActionWrite:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSysActActionWrite" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-ext/sys/sysActActionWrite/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>

											<div name="id"  field="id" hideable="true" visible="false"  headerAlign="center" allowSort="false"  width="64" >编号
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionWrite')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionWrite')"
												/>
											</div>
											<div name="actId" hideable="true" visible="false"  field="actId" headerAlign="center" allowSort="true" width="150" sortField="a.act_id">动作编号
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div name="name"  field="name"   vtype="" headerAlign="center" allowSort="true"  width="100" sortField="a.name">名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionWrite')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionWrite')"
												/>
											</div>
											
											<div type="checkboxcolumn"  name="isActive"  field="isActive"  vtype=""  trueValue="1" falseValue="0" headerAlign="center" allowSort="false" width="100">是否启用
											</div>
											<div type="comboboxcolumn" autoShowPopup="true"  name="dataType"  field="dataType"  vtype="" headerAlign="center" allowSort="false" width="100">数据类型
												<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"   url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_data_type" />
											</div>
											<div name="writeTable"  field="writeTable"   vtype="" headerAlign="center" allowSort="true"  width="64" sortField="a.write_table">写入表
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="writeTable-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionWrite')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionWrite')"
												/>
											</div>
											<div name="writeField"  field="writeField"   vtype="" headerAlign="center" allowSort="true"  width="64" sortField="a.write_field">写入表字段
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="writeField-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionWrite')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionWrite')"
												/>
											</div>
											<div name="writeWhere"  field="writeWhere"   vtype="required" headerAlign="center" allowSort="true"  width="200" sortField="a.write_where">写入where
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="writeWhere-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionWrite')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionWrite')"
												/>
											</div>
											<div name="writeExpr"  field="writeExpr"   vtype="" headerAlign="center" allowSort="false"  width="100" >写入表达式
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="writeExpr-Filter" name="mini-column-filter"  property="filter" class="mini-textarea" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionWrite')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionWrite')"
												/>
											</div>
											<div name="writeCond"  field="writeCond"   vtype="" headerAlign="center" allowSort="false"  width="100" >写入条件
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="writeCond-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionWrite')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionWrite')"
												/>
											</div>
											<div name="remarks"  field="remarks"  vtype="" headerAlign="center" allowSort="false" width="255" >备注信息
												<input property="editor" class="mini-textarea" style="width:100%;"  />
												<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionWrite')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionWrite')"
												/>
											</div>
										</div>
									</div>
								 </div>
							  </div>
								<div title="工作流执行动作读取" id="tabSysActActionReadList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSysActActionRead" permissionEdit="sys:sysActActionRead:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSysActActionRead" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-ext/sys/sysActActionRead/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>
											<div name="id"  field="id" hideable="true" visible="false"  headerAlign="center" allowSort="false"  width="64" >编号
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionRead')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionRead')"
												/>
											</div>
											<div name="actId" hideable="true" visible="false"  field="actId" headerAlign="center" allowSort="true" width="150" sortField="a.act_id">
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div name="name"  field="name"   vtype="" headerAlign="center" allowSort="true"  width="100" sortField="a.name">名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionRead')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionRead')"
												/>
											</div>
											<div type="checkboxcolumn"  name="isActive"  field="isActive"  vtype=""  trueValue="1" falseValue="0" headerAlign="center" allowSort="false" width="100">是否启用
											</div>
											<div name="varId"  field="varId"   vtype="" headerAlign="center" allowSort="true"  width="64" sortField="a.var_id">变量ID
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="varId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionRead')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionRead')"
												/>
											</div>
											<div type="comboboxcolumn" autoShowPopup="true"  name="dataType"  field="dataType"  vtype="" headerAlign="center" allowSort="false" width="100">数据类型
												<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"   url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_data_type" />
											</div>
											<div type="comboboxcolumn" autoShowPopup="true"  name="readType"  field="readType"  vtype="" headerAlign="center" allowSort="false" width="100">读取类型
												<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"   url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_act_action_read_read_type" />
											</div>
											<div type="comboboxcolumn" autoShowPopup="true"  name="javaClassType"  field="javaClassType"  vtype="" headerAlign="center" allowSort="false" width="100">对象获取方式
												<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"   url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_act_action_java_class_type" />
											</div>
											<div name="readExpr"  field="readExpr"   vtype="" headerAlign="center" allowSort="true"  width="100" sortField="a.read_expr">读取表达式
												<input property="editor" class="mini-textarea"  style="width:100%;"  />
												<input id="readExpr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionRead')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionRead')"
												/>
											</div>
											<div name="readParam"  field="readParam"   vtype="" headerAlign="center" allowSort="true"  width="100" sortField="a.read_param">读取参数
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="readParam-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionRead')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionRead')"
												/>
											</div>
											<div name="readParamValue"  field="readParamValue"   vtype="" headerAlign="center" allowSort="true"  width="100" sortField="a.read_param_value">读取参数值
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="readParamValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionRead')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionRead')"
												/>
											</div>
											<div name="readCond"  field="readCond"   vtype="" headerAlign="center" allowSort="true"  width="100" sortField="a.read_cond">读取条件
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="readCond-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionRead')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionRead')"
												/>
											</div>
											<div name="remarks"  field="remarks"  vtype="" headerAlign="center" allowSort="false" width="255" >备注信息
												<input property="editor" class="mini-textarea" style="width:100%;"  />
												<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysActActionRead')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysActActionRead')"
												/>
											</div>

										</div>
									</div>
								 </div>
							  </div>
						 </div>
		        </div><!--fit-->

	    </div>
	<div title="说明" id="tabForm"  style="border: 0px;"  >
		<p><b>配置说明</b>：目前内置的变量有：actionName ,objId,cuId,内置变量使用 &#36{objId} ,目前内置函数：date,内置方法使用 [date()]</p>
		<p><b>动作类型</b>：目前可以用的有写入、sql、java方法</p>
		<p><b>事件类型</b>：目前可以用的有任务创建后、任务完成后、流程启动后、流程结束后</p>
		<p><b>执行顺序</b>：在同时有多个配置满足条件时，按照执行顺序从小到大开始执行</p>
		<p><b>流程定义key</b>：从流程定义处获取</p>
		<p><b>对象获取方式</b>：如果已经注入spring选择 spring，否则选择java反射</p>
		<p><b>节点id</b>：从流程定义处获取</p>
		<p><b>执行条件</b>：满足条件时才会执行，例如 &#36{actionName}=='agree'</p>
		<p><b>执行表达式</b>：java方法时起作用，类全路径的名称.方法名称 例如com.ims.et.contract.service.Impl.EtTerminationServiceImpl.updateTerminationStatus，如果是spring方式获取，可以是类名.方法名，例如：EtTerminationServiceImpl.updateTerminationStatus</p>
		<p><b>执行表达式参数</b>：java方法时起作用,例如 ：string;;string;;string  多个参数之间用双分号隔离</p>
		<p><b>执行表达式参数值</b>：java方法时起作用，例如：&#36{objId};;&#36{cuId};;&#36{actionName}，多个参数间用双分号隔离</p>
		
		
		
	</div>
   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysActAction",
			    masterKeyField:"id",
				dataUrl:"${ctx}/ims-ext/sys/sysActAction/data",
				getUrl:"${ctx}/ims-ext/sys/sysActAction/get",
				saveUrl:"${ctx}/ims-ext/sys/sysActAction/save",
				removeUrl:"${ctx}/ims-ext/sys/sysActAction/remove",
				exportUrl:"${ctx}/ims-ext/sys/sysActAction/export",
				initData:{isActive:'1'}
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                    {
		                 id:"gridSysActActionWrite",
		                 objId:"SysActActionWrite",
		                 FK:"actId",
		                 cascade:true,
						 dataUrl:"${ctx}/ims-ext/sys/sysActActionWrite/data",
						 getUrl:"${ctx}/ims-ext/sys/sysActActionWrite/get",
						 saveUrl:"${ctx}/ims-ext/sys/sysActActionWrite/save",
						 removeUrl:"${ctx}/ims-ext/sys/sysActActionWrite/remove",
						 exportUrl:"${ctx}/ims-ext/sys/sysActActionWrite/export"
	                    }
	                    ,{
		                 id:"gridSysActActionRead",
		                 objId:"SysActActionRead",
		                 FK:"actId",
		                 cascade:true,
						 dataUrl:"${ctx}/ims-ext/sys/sysActActionRead/data",
						 getUrl:"${ctx}/ims-ext/sys/sysActActionRead/get",
						 saveUrl:"${ctx}/ims-ext/sys/sysActActionRead/save",
						 removeUrl:"${ctx}/ims-ext/sys/sysActActionRead/remove",
						 exportUrl:"${ctx}/ims-ext/sys/sysActActionRead/export"
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
						size: 64
					}
					,{
						id: 'a.seq_no',
						label: '执行顺序',
						type: 'integer',
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

   }
   //////////form操作菜单项点击事件方法/////////
   function onFormOpMiClick(e){

   }
   //////////子表格操作菜单项点击事件方法/////////
   function onGridSubOpMiClick_SysActActionWrite(e){

   }
   function onGridSubOpMiClick_SysActActionRead(e){

   }
	function initWrite(){
		var grid = mini.get("gridSysActActionWrite");
		
		var row3 = {
				name:'修改状态',
				isActive:'1',
				dataType:'string',
				writeField:'status',
				writeWhere:"id='\\${objId}'"
		};
		grid.addRow(row3);
	}
   function addButton(){
	   sysToolBar_.addButtonOption({
		   buttonId:'_init',
		   functionStr:'initWrite',
		   name:'初始化',
		   gridId:'gridSysActActionWrite'
	   });
   }
   
   function addButton2(){
	   sysToolBar_.addButtonOption({
		   buttonId:'_copy',
		   functionStr:'copyData()',
		   name:'复制数据',
		   gridId:'gridSysActActionWrite'
	   });
   }
   
   $(function(){
	   addButton();
	   addButton2();
   });
   
	function copyData(obj){
		var param={
				obj:obj,
				title:"选择数据",
				multiSel:true,
				readOnly:true,							
				url:"${ctx}/ims-ext/sys/sysActActionWrite/list",
				width:850,
				height:500,
				selFields:'name,isActive,dataType,writeTable,writeField,writeWhere,writeExpr,writeCond,remarks',
				refFields:'name,isActive,dataType,writeTable,writeField,writeWhere,writeExpr,writeCond,remarks',
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
		var actId = mini.get("id").getValue();
	  for(var i=0;i<s.length;i++){
			//在这里新增表格的数据
			var grid = mini.get("gridSysActActionWrite");
			var row = {
					name:s[i].name,
					writeTable:s[i].writeTable,
					writeField:s[i].writeField,
					writeWhere:s[i].writeWhere,
					isActive:s[i].isActive,
					dataType:s[i].dataType,
					actId:actId,
					writeExpr:s[i].writeExpr,
					writeCond:s[i].writeCond,
					remarks:s[i].remarks
			};
			grid.addRow(row);
		}
		
	}
</script>
</body>
</html>