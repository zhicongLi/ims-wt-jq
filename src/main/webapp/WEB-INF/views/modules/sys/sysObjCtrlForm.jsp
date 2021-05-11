<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>对象展示控制</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysObjCtrl" permissionEdit="sys:sysObjCtrl:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysObjCtrl/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" >编码
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
							<div name="descr"  field="descr" vtype=""  headerAlign="center" allowSort="true" width="64" >描述
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div type="checkboxcolumn"  name="isActive"  field="isActive" vtype="" headerAlign="center" allowSort="true" width="120" trueValue="1" falseValue="0" >是否启用
                                <%--<input property="editor" class="mini-checkbox" style="width:100%;"/>--%>
								<input id="isActive-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
									   data="checkValues" multiSelect="true" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="objId"  field="objId" vtype=""  headerAlign="center" allowSort="true" width="64" >对象编码
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="objId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div type="comboboxcolumn" autoShowPopup="true" name="ctrlType"  field="ctrlType" vtype="" headerAlign="center" allowSort="true" width="100" >控制类型
								<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_type" />
								<input id="ctrlType-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
								   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_type" multiSelect="true"
								   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>

							<div name="priority"  field="priority" vtype=""  headerAlign="center" allowSort="true" width="60" >优先级
								<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
								<input id="priority-Filter" name="mini-column-filter"  property="filter" class="mini-spinner"  allowLimitValue="false" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div type="comboboxcolumn" autoShowPopup="true"  name="isEdit"  field="isEdit" vtype="" headerAlign="center" allowSort="true" width="100" >是否可编辑
								<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" />
								<input id="isEdit-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
									   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" multiSelect="true"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>

							<div type="comboboxcolumn" autoShowPopup="true"  name="isRemove"  field="isRemove" vtype="" headerAlign="center" allowSort="true" width="100"  >是否可删除
								<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" />
								<input id="isRemove-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
									   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" multiSelect="true"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div type="comboboxcolumn" autoShowPopup="true"  name="isNew"  field="isNew" vtype="" headerAlign="center" allowSort="true" width="100" >是否可新建
								<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" />
								<input id="isNew-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
									   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" multiSelect="true"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div type="comboboxcolumn" autoShowPopup="true"  name="isEnabled"  field="isEnabled" vtype="" headerAlign="center" allowSort="true" width="120" >是否可用
								<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" />
								<input id="isEnabled-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
									   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" multiSelect="true"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div type="comboboxcolumn" autoShowPopup="true"  name="isShow"  field="isShow" vtype="" headerAlign="center" allowSort="true" width="120" >是否显示
								<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" />
								<input id="isShow-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
									   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" multiSelect="true"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="ruleId" field="ruleId"  displayField="ruleId_name" vtype=""  headerAlign="center" allowSort="true" width="64" >规则条件
								<input id="ruleId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>

							<div name="createDate"  field="createDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >创建时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
								<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>

							<div name="updateDate"  field="updateDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >更新时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
								<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
		<sys:toolbarformmain permissionEdit="sys:sysObjCtrl:edit"></sys:toolbarformmain>
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
											<td style="text-align:right;">名称：</td>
											<td>
											   <input name="name" id="name" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">描述：</td>
											<td>
											   <input name="descr" id="descr"  class="mini-textbox"  vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">是否启用：</td>
											<td>
											   <input name="isActive" id="isActive" class="mini-checkbox" vtype = ""  required="false"   trueValue="1" falseValue="0"   />
											</td>
											<td style="text-align:right;">对象编码：</td>
											<td>
											   <input name="objId" id="objId"  class="mini-textbox"  vtype = "" required="true" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">控制类型：</td>
											<td>
											   <input name="ctrlType" id="ctrlType" class="mini-combobox" vtype = ""  required="true" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_type" />
											</td>
											<td style="text-align:right;">优先级：</td>
											<td>
												<input name="priority" id="priority" class="mini-spinner" allowLimitValue="false" vtype = ""  required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">规则：</td>
											<td>
												<input name="ruleId" id="ruleId" class="mini-buttonedit"  textName="ruleName"  onbuttonclick="onRulePopLov"   />
											</td>
											<td style="text-align:right;">规则条件：</td>
											<td>
												<input name="ruleStr" id="ruleStr" class="mini-textarea"     />
											</td>


										</tr>
										<tr>
											<td style="text-align:right;">是否可新建：</td>
											<td>
												<input name="isNew" id="isNew" class="mini-combobox" vtype = ""  required="false" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag"/>
											</td>
											<td style="text-align:right;">是否可删除：</td>
											<td>
											   <input name="isRemove" id="isRemove"  class="mini-combobox" vtype = "" required="false" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag"/>
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">是否可编辑：</td>
											<td>
												<input name="isEdit" id="isEdit"  class="mini-combobox" vtype = "" required="false" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag"  />
											</td>
											<td style="text-align:right;">是否可用：</td>
											<td>
												<input name="isEnabled" id="isEnabled" class="mini-combobox" vtype = ""  required="false" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag"/>
											</td>


										</tr>
										<tr>
											<td style="text-align:right;">是否显示：</td>
											<td>
												<input name="isShow" id="isShow"  class="mini-combobox" vtype = "" required="false" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag"/>
											</td>
											<td style="text-align:right;">创建时间：</td>
											<td>
												<input name="createDate" id="createDate" class="mini-datepicker" dateFormat="yyyy-MM-dd HH:mm:ss" vtype = "" readOnly="true" required="false" />
											</td>
										</tr>

										<tr>

											<td style="text-align:right;">备注信息：</td>
											<td colspan="3">
											   <input name="remarks" id="remarks"  class="mini-textarea"  vtype = "" required="false" width="400"  />
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
								<div title="控制行" id="tabSysObjCtrlLineList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSysObjCtrlLine" permissionEdit="sys:sysObjCtrlLine:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSysObjCtrlLine" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/sys/sysObjCtrlLine/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>

											<div name="id"  field="id" readOnly="true"  vtype="" headerAlign="center" allowSort="true"  width="64" >编码
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysObjCtrlLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysObjCtrlLine')"
												/>
											</div>
											<div name="ctrlId" hideable="true" visible="false"  field="ctrlId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div name="name"  field="name"   vtype="" headerAlign="center" allowSort="true"  width="100" >名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysObjCtrlLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysObjCtrlLine')"
												/>
											</div>
											<div name="attrName"  field="attrName"   vtype="" headerAlign="center" allowSort="true"  width="64" >属性名
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="attrName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysObjCtrlLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysObjCtrlLine')"
												/>
											</div>
											<div type="checkboxcolumn"  name="isActive"  field="isActive"   trueValue="1" falseValue="0" vtype="" headerAlign="center" allowSort="true"  width="100" >是否启用

												<input id="isActive-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
													   data="checkValues" multiSelect="true" onvaluechanged="onFilterChangedChild('gridSysObjCtrlLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysObjCtrlLine')"
												/>
											</div>

											<div name="descr"  field="descr"   vtype="" headerAlign="center" allowSort="true"  width="64" >描述
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysObjCtrlLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysObjCtrlLine')"
												/>
											</div>
											<div type="comboboxcolumn" autoShowPopup="true"  name="isEdit"  field="isEdit" vtype="" headerAlign="center" allowSort="true" width="100" >是否可编辑
												<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" />
												<input id="isEdit-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
													   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" multiSelect="true"
													   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
												/>
											</div>
											<div type="comboboxcolumn" autoShowPopup="true"  name="isEnabled"  field="isEnabled" vtype="" headerAlign="center" allowSort="true" width="100" >是否可用
												<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" />
												<input id="isEnabled-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
													   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" multiSelect="true"
													   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
												/>
											</div>
											<div type="comboboxcolumn" autoShowPopup="true"  name="isListFrozen"  field="isListFrozen" vtype="" headerAlign="center" allowSort="true" width="100" >是否列表冻结
												<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" />
												<input id="isListFrozen-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
													   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" multiSelect="true"
													   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
												/>
											</div>
											<div type="comboboxcolumn" autoShowPopup="true"  name="isShowList"  field="isShowList" vtype="" headerAlign="center" allowSort="true" width="100" >是否列表显示
												<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" />
												<input id="isShowList-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
													   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" multiSelect="true"
													   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
												/>
											</div>
											<div type="comboboxcolumn" autoShowPopup="true"  name="isShowForm"  field="isShowForm" vtype="" headerAlign="center" allowSort="true" width="100" >是否明细显示
												<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" />
												<input id="isShowForm-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
													   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_flag" multiSelect="true"
													   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
												/>
											</div>

											<div name="vtType"  field="vtType"   vtype="" headerAlign="center" allowSort="true"  width="200" >前端控制规则
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="vtType-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysObjCtrlLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysObjCtrlLine')"
												/>
											</div>

											<div name="seqNo"  field="seqNo"   vtype="" headerAlign="center" allowSort="true"  width="70" >显示序号
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="seqNo-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysObjCtrlLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysObjCtrlLine')"
												/>
											</div>

											<div name="createDate"  field="createDate" readOnly="true" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >创建时间
												<input property="editor" class="mini-datepicker" style="width:100%;"  />
												<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysObjCtrlLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysObjCtrlLine')"
												/>
											</div>


											<div name="remarks"  field="remarks"  vtype="" headerAlign="center" allowSort="true" width="255" >备注信息
												<input property="editor" class="mini-textarea" style="width:100%;"  />
												<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysObjCtrlLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysObjCtrlLine')"
												/>
											</div>


										</div>
									</div>
								 </div>
							  </div>
								<div title="用户" id="tabSysObjCtrlUserList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSysObjCtrlUser" permissionEdit="sys:sysObjCtrlUser:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSysObjCtrlUser" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/sys/sysObjCtrlUser/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>

											<div name="id"  field="id" readOnly="true"  vtype="" headerAlign="center" allowSort="true"  width="64" >编码
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysObjCtrlUser')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysObjCtrlUser')"
												/>
											</div>
											<div name="ctrlId" hideable="true" visible="false"  field="ctrlId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>

											<div type="checkboxcolumn"  name="isActive"  field="isActive"   trueValue="1" falseValue="0" vtype="" headerAlign="center" allowSort="true"  width="100" >是否启用
												<input id="isActive-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
													   data="checkValues" multiSelect="true" onvaluechanged="onFilterChangedChild('gridSysObjCtrlUser')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysObjCtrlUser')"
												/>
											</div>

											<div name="userId"  field="userId" displayField="userName"  vtype="" headerAlign="center" allowSort="true"  width="64" >用户
												<input property="editor"  allowInput = 'false'  class="mini-buttonedit" onbuttonclick="popLov(this,'选择用户',false,true,'${ctx}/sys/sysUser/form',850,500,'id,name','userId,userName','gridSysObjCtrlUser')" style="width:100%;"  />
											</div>
											<div name="roleId"  field="roleId"   vtype="" headerAlign="center" allowSort="true"  width="64" >角色
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="roleId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysObjCtrlUser')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysObjCtrlUser')"
												/>
											</div>
											<div name="name"  field="name"   vtype="" headerAlign="center" allowSort="true"  width="100" >名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysObjCtrlUser')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysObjCtrlUser')"
												/>
											</div>

										</div>
									</div>
								 </div>
							  </div>
						 </div>
		        </div><!--fit-->

	    </div>

   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysObjCtrl",
			    masterKeyField:"id",
				dataUrl:"${ctx}/sys/sysObjCtrl/data",
				getUrl:"${ctx}/sys/sysObjCtrl/get",
				saveUrl:"${ctx}/sys/sysObjCtrl/save",
				removeUrl:"${ctx}/sys/sysObjCtrl/remove",
				exportUrl:"${ctx}/sys/sysObjCtrl/export",
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                    {
		                 id:"gridSysObjCtrlLine",
		                 objId:"SysObjCtrlLine",
		                 FK:"ctrlId",
		                 cascade:true,
						 dataUrl:"${ctx}/sys/sysObjCtrlLine/data",
						 getUrl:"${ctx}/sys/sysObjCtrlLine/get",
						 saveUrl:"${ctx}/sys/sysObjCtrlLine/save",
						 removeUrl:"${ctx}/sys/sysObjCtrlLine/remove",
						 exportUrl:"${ctx}/sys/sysObjCtrlLine/export"
	                    }
	                    ,{
		                 id:"gridSysObjCtrlUser",
		                 objId:"SysObjCtrlUser",
		                 FK:"ctrlId",
		                 cascade:true,
						 dataUrl:"${ctx}/sys/sysObjCtrlUser/data",
						 getUrl:"${ctx}/sys/sysObjCtrlUser/get",
						 saveUrl:"${ctx}/sys/sysObjCtrlUser/save",
						 removeUrl:"${ctx}/sys/sysObjCtrlUser/remove",
						 exportUrl:"${ctx}/sys/sysObjCtrlUser/export"
	                    }

	                   ]

	);

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: '编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.descr',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.is_active',
						label: '控制是否启用',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.obj_id',
						label: '对象编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.ctrl_type',
						label: '控制类型',
						type: 'string',
						default_value: '',
						size: 64
						,
						plugin: 'selectize',
						plugin_config: {
							valueField: 'value',
							labelField: 'label',
							searchField: 'label',
							sortField: 'value',
							create: true,
							maxItems: 1,
							onInitialize: function () {
								var that = this;
								$.getJSON('${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_type', function (data) {
									data.forEach(function (item) {
										that.addOption(item);
									});
								});
							}
						},
						valueSetter: function(rule, value) {
							rule.$el.find('.rule-value-container select')[0].selectize.setValue(value);
						}
					}
					,{
						id: 'a.site_id',
						label: '域编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.priority',
						label: '优先级',
						type: 'integer',
						default_value: '',
						size: 11
					}
					,{
						id: 'a.is_edit',
						label: '是否可编辑',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.is_enabled',
						label: '是否可用',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.is_remove',
						label: '是否可删除',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.is_new',
						label: '是否可新建',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.is_show',
						label: '是否显示',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.rule_id',
						label: '规则条件',
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
						size: 120
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
						size: 120
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
						id: 'a.remarks',
						label: '备注信息',
						type: 'string',
						default_value: '',
						size: 255
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
   function onGridSubOpMiClick_SysObjCtrlLine(e){

   }
   function onGridSubOpMiClick_SysObjCtrlUser(e){

   }
  function onRulePopLov(){
     var objId=mini.get('objId')  ;
     popLov(this,'选择规则条件',false,true,'${ctx}/sys/sysObjRule/list?objId='+objId.getValue(),850,500,'id','ruleId');
  }
</script>
</body>
</html>