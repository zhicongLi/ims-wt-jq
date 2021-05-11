<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>数据过滤</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysDataFilter" permissionEdit="sys:sysDataFilter:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysDataFilter/data" idField="id"
					 allowResize="true" pageSize="20"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="90"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">创建者
								<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="createDate"  field="createDate" vtype="required" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">创建时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
								<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">更新者
								<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="updateDate"  field="updateDate" vtype="required" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">更新时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
								<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
						
							<div name="siteId"  field="siteId" vtype=""  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">站点ID
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="siteId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="true" width="164" >名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="filterType"  field="filterType" vtype=""  headerAlign="center" type="comboboxcolumn"  allowSort="true" width="100" sortField="a.filter_type">过滤类型
								<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_data_fiter_type"  style="width:100%;"  />
								<input id="filterType-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" multiSelect="true" valueField="value" textField="label"  style="width:100%;" url="${ctx}/sys/dict/listDataStr?type=sys_data_fiter_type"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="dataLevel"  field="dataLevel" vtype=""  headerAlign="center" type="comboboxcolumn"  allowSort="true" width="100" sortField="a.data_level">数据层级
								<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_data_data_level"  style="width:100%;"  />
								<input id="dataLevel-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" multiSelect="true" valueField="value" textField="label"  style="width:100%;" url="${ctx}/sys/dict/listDataStr?type=sys_data_data_level"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>				  
							<div name="priority"  field="priority" vtype=""  headerAlign="center" allowSort="true" width="65" >优先级
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="priority-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="entityName"  field="entityName" vtype=""  headerAlign="center" allowSort="true" width="105" >实体类名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="entityName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="customMethod"  field="customMethod" vtype=""  headerAlign="center" allowSort="true" width="155" >自定义方法
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="customMethod-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="filterField"  field="filterField" vtype=""  headerAlign="center" allowSort="true" width="65" >过滤字段
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="filterField-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="isDefault"  field="isDefault" vtype=""  headerAlign="center" type="comboboxcolumn"  allowSort="true" width="100" sortField="a.is_default">是否默认
								<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=yes_no"  style="width:100%;"  />
								<input id="isDefault-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" multiSelect="true" valueField="value" textField="label"  style="width:100%;" url="${ctx}/sys/dict/listDataStr?type=yes_no"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							
							<div name="customSql"  field="customSql" vtype=""  headerAlign="center" allowSort="true" width="90" >自定义sql
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="customSql-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="225" >备注信息
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
		<sys:toolbarformmain permissionEdit="sys:sysDataFilter:edit"></sys:toolbarformmain>
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
											<td style="text-align:right;">过滤类型：</td>
											<td>
											   <input name="filterType" showNullItem="true" id="filterType" class="mini-combobox"    vtype = ""  required="false"  textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=sys_data_fiter_type"/>
											</td>
											<td style="text-align:right;">数据层级：</td>
											<td>
											    <input name="dataLevel" id="dataLevel" showNullItem="true" class="mini-combobox"    vtype = ""  required="false"  textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=sys_data_data_level"/>
											</td>
											<td style="text-align:right;">优先级：</td>
											<td>
											   <input name="priority" id="priority" class="mini-spinner"  vtype = "" maxValue="999999" required="false" />
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">实体类名称：</td>
											<td>
											   <input name="entityName" id="entityName" class="mini-textbox"  vtype = ""  required="true" />
											</td>
											
											<td style="text-align:right;">过滤字段：</td>
											<td>
											   <input name="filterField" id="filterField" class="mini-textbox"  vtype = ""  required="true" />
											</td>
											<td style="text-align:right;">是否默认：</td>
											<td>
											   <input name="isDefault" id="isDefault" class="mini-CheckBox"   trueValue="1" falseValue="0" vtype = "" required="false" />
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">自定义sql：</td>
											<td colspan="3">
											   <input name="customSql" style="width:100%" id="customSql" class="mini-textarea"   vtype = "" required="false" />
											</td>
											<td style="text-align:right;">自定义方法：</td>
											<td  colspan="3">
											   <input name="customMethod" id="customMethod" style="width:100%" class="mini-textarea"   vtype = "" required="false" />
											</td>
										</tr>
										<tr>
											
										</tr>
										<tr>
											<td style="text-align:right;">备注信息：</td>
											<td colspan="3">
											   <input name="remarks" id="remarks" style="width:100%" class="mini-textarea" vtype = ""  required="false"  />
											</td>
											<td >
											   <input name="siteId" id="siteId"  class="mini-hidden" readOnly="true"  vtype = "" required="false" />
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
								<div title="数据过滤用户表" name="tabSysDataFilterUserList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSysDataFilterUser" permissionEdit="sys:sysDataFilterUser:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSysDataFilterUser" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/sys/sysDataFilterUser/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>

											<div name="id"  field="id" readOnly="true"  vtype="required" headerAlign="center" allowSort="true"  width="64" hideable="true" visible="false">编号
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterUser')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterUser')"
												/>
											</div>
											<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">创建者
												<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterUser')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterUser')"
												/>
											</div>
											<div name="createDate"  field="createDate" readOnly="true" vtype="required" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">创建时间
												<input property="editor" class="mini-datepicker" style="width:100%;"  />
												<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterUser')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterUser')"
												/>
											</div>
											<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">更新者
												<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterUser')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterUser')"
												/>
											</div>
											<div name="updateDate"  field="updateDate" readOnly="true" vtype="required" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">更新时间
												<input property="editor" class="mini-datepicker" style="width:100%;"  />
												<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterUser')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterUser')"
												/>
											</div>
											
											<div name="siteId"  field="siteId" readOnly="true"  vtype="" headerAlign="center" allowSort="true"  width="64" hideable="true" visible="false">站点ID
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="siteId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterUser')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterUser')"
												/>
											</div>
											<!-- <div name="userName"  field="userName"   vtype="" headerAlign="center" allowSort="false"  width="64" >用户名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="userName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterUser')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterUser')"
												/>
											</div> -->
											<div name="userId"  field="userId"   vtype="" headerAlign="center" allowSort="false"  width="100" displayField="userId">人员编码
												<input property="editor" class="mini-buttonedit"  style="width:100%;" allowInput="false" 
												onbuttonclick="popLov(this,'选择人员',false,true,'${ctx}/sys/sysUser/sysMisList?orgQuery=${param.orgQuery}',850,500,'id,name','userId,userName','gridSysDataFilterUser')"
												/>
											</div>
											<div name="userName"  field="userName"  hideable="false" visible="true"  vtype="" headerAlign="center" allowSort="false"  width="100" >名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
											</div>
											<div name="dfId" hideable="true" visible="false"  field="dfId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div  name="dfType"  field="dfType"  vtype="" headerAlign="center" type="comboboxcolumn" allowSort="false" width="64" hideable="true" visible="false">过滤类型
											    <input property="editor" showNullItem="true" class="mini-combobox" style="width: 100%;"  textField="label" valueField="value"
												       url="${ctx}/sys/dict/listDataStr?type=sys_data_fiter_type" />
											</div>
											<div name="remarks"  field="remarks"  vtype="" headerAlign="center" allowSort="false" width="255" >备注信息
												<input property="editor" class="mini-textarea" style="width:100%;"  />
												<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterUser')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterUser')"
												/>
											</div>


										</div>
									</div>
								 </div>
							  </div>
								<div title="数据过滤角色" name="tabSysDataFilterRoleList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSysDataFilterRole" permissionEdit="sys:sysDataFilterRole:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSysDataFilterRole" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/sys/sysDataFilterRole/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>

											<div name="id"  field="id" readOnly="true"  vtype="required" headerAlign="center" allowSort="true"  width="64" hideable="true" visible="false">编号
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
												/>
											</div>
											<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">创建者
												<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
												/>
											</div>
											<div name="createDate"  field="createDate" readOnly="true" vtype="required" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">创建时间
												<input property="editor" class="mini-datepicker" style="width:100%;"  />
												<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
												/>
											</div>
											<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">更新者
												<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
												/>
											</div>
											<div name="updateDate"  field="updateDate" readOnly="true" vtype="required" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">更新时间
												<input property="editor" class="mini-datepicker" style="width:100%;"  />
												<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
												/>
											</div>
										
											<div name="siteId"  field="siteId" readOnly="true"  vtype="" headerAlign="center" allowSort="true"  width="64" hideable="true" visible="false">站点ID
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="siteId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
												/>
											</div>
										<!-- 	<div name="roleId"  field="roleId"   vtype="" headerAlign="center" allowSort="true"  width="64" >角色id
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="roleId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
												/>
											</div>
											<div name="roleName"  field="roleName"   vtype="" headerAlign="center" allowSort="false"  width="64" >角色名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="roleName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
												/>
											</div> -->
											<div name="roleId"  field="roleId"   vtype="" headerAlign="center" allowSort="false"  width="100" >角色
												<input property="editor" class="mini-buttonedit"  style="width:100%;" allowInput="false" 
												onbuttonclick="popLov(this,'选择角色',false,true,'${ctx}/sys/sysRole/lov',850,500,'id,name','roleId,roleName','gridSysDataFilterRole')"
												/>
											</div>
											<div name="roleName"  field="roleName"  hideable="false" visible="true"  vtype="" headerAlign="center" allowSort="false"  width="100" >角色
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
											</div>
											<div name="dfId" hideable="true" visible="false"  field="dfId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div  name="dfType"  field="dfType"  vtype="" headerAlign="center" type="comboboxcolumn" allowSort="false" width="64" hideable="true" visible="false">过滤类型
											    <input property="editor" showNullItem="true" class="mini-combobox" style="width: 100%;"  textField="label" valueField="value"
												       url="${ctx}/sys/dict/listDataStr?type=sys_data_fiter_type" />
											</div>
												<div name="remarks"  field="remarks"  vtype="" headerAlign="center" allowSort="false" width="255" >备注信息
												<input property="editor" class="mini-textarea" style="width:100%;"  />
												<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
												/>
											</div>


										</div>
									</div>
								 </div>
							  </div>
								<div title="数据过滤用户组" name="tabSysDataFilterGroupList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSysDataFilterGroup" permissionEdit="sys:sysDataFilterGroup:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSysDataFilterGroup" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/sys/sysDataFilterGroup/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>

											<div name="id"  field="id" readOnly="true"  vtype="required" headerAlign="center" allowSort="true"  width="64" hideable="true" visible="false">编号
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
												/>
											</div>
											<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">创建者
												<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
												/>
											</div>
											<div name="createDate"  field="createDate" readOnly="true" vtype="required" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">创建时间
												<input property="editor" class="mini-datepicker" style="width:100%;"  />
												<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
												/>
											</div>
											<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">更新者
												<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
												/>
											</div>
											<div name="updateDate"  field="updateDate" readOnly="true" vtype="required" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">更新时间
												<input property="editor" class="mini-datepicker" style="width:100%;"  />
												<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
												/>
											</div>
										
											<div name="siteId"  field="siteId" readOnly="true"  vtype="" headerAlign="center" allowSort="true"  width="64" hideable="true" visible="false">站点ID
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="siteId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
												/>
											</div>
											<div name="groupId"  field="groupId"   vtype="" headerAlign="center" allowSort="false"  width="100" displayField="groupId">用户组名称
												<input property="editor" class="mini-buttonedit"  style="width:100%;" allowInput="false" 
												onbuttonclick="popLov(this,'选择角色',false,true,'${ctx}/sys/sysGroup/lov',850,500,'id,name','groupId,groupName','gridSysDataFilterGroup')"
												/>
											</div>
											<div name="groupName"  field="groupName"  hideable="false" visible="true"  vtype="" headerAlign="center" allowSort="false"  width="100" >
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
											</div>
											<div name="dfId" hideable="true" visible="false"  field="dfId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div  name="dfType"  field="dfType"  vtype="" headerAlign="center" type="comboboxcolumn" allowSort="false" width="64" hideable="true" visible="false">过滤类型
											    <input property="editor" showNullItem="true" class="mini-combobox" style="width: 100%;"  textField="label" valueField="value"
												       url="${ctx}/sys/dict/listDataStr?type=sys_data_fiter_type" />
											</div>
												<div name="remarks"  field="remarks"  vtype="" headerAlign="center" allowSort="false" width="255" >备注信息
												<input property="editor" class="mini-textarea" style="width:100%;"  />
												<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysDataFilterRole')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysDataFilterRole')"
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
			    objId:"SysDataFilter",
			    masterKeyField:"id",
				dataUrl:"${ctx}/sys/sysDataFilter/data",
				getUrl:"${ctx}/sys/sysDataFilter/get",
				saveUrl:"${ctx}/sys/sysDataFilter/save",
				removeUrl:"${ctx}/sys/sysDataFilter/remove",
				exportUrl:"${ctx}/sys/sysDataFilter/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                    {
		                 id:"gridSysDataFilterUser",
		                 objId:"SysDataFilterUser",
		                 FK:"dfId",
		                 cascade:true,
		                 cascadeVisible:true,
		                 tabName:"tabSysDataFilterUserList",
						 dataUrl:"${ctx}/sys/sysDataFilterUser/data",
						 getUrl:"${ctx}/sys/sysDataFilterUser/get",
						 insertPos:"L",
		                 insertType:"A",
						 saveUrl:"${ctx}/sys/sysDataFilterUser/save",
						 removeUrl:"${ctx}/sys/sysDataFilterUser/remove",
						 exportUrl:"${ctx}/sys/sysDataFilterUser/export"
	                    }
	                    ,{
		                 id:"gridSysDataFilterRole",
		                 objId:"SysDataFilterRole",
		                 FK:"dfId",
		                 cascade:true,
		                 cascadeVisible:true,
		                 tabName:"tabSysDataFilterRoleList",
						 dataUrl:"${ctx}/sys/sysDataFilterRole/data",
						 insertPos:"L",
		                 insertType:"A",
						 getUrl:"${ctx}/sys/sysDataFilterRole/get",
						 saveUrl:"${ctx}/sys/sysDataFilterRole/save",
						 removeUrl:"${ctx}/sys/sysDataFilterRole/remove",
						 exportUrl:"${ctx}/sys/sysDataFilterRole/export"
	                    }
	                    ,{
		                 id:"gridSysDataFilterGroup",
		                 objId:"SysDataFilterGroup",
		                 FK:"dfId",
		                 cascade:true,
		                 cascadeVisible:true,
		                 tabName:"tabSysDataFilterGroupList",
		                 insertPos:"L",
		                 insertType:"A",
						 dataUrl:"${ctx}/sys/sysDataFilterGroup/data",
						 getUrl:"${ctx}/sys/sysDataFilterGroup/get",
						 saveUrl:"${ctx}/sys/sysDataFilterGroup/save",
						 removeUrl:"${ctx}/sys/sysDataFilterGroup/remove",
						 exportUrl:"${ctx}/sys/sysDataFilterGroup/export"
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
						id: 'a.name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.filter_type',
						label: '过滤类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.data_level',
						label: '数据层级',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.custom_sql',
						label: '自定义sql',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.entity_name',
						label: '实体类名称',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.custom_method',
						label: '自定义方法',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.filter_field',
						label: '过滤字段',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.is_default',
						label: '是否默认',
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
   function onGridSubOpMiClick_SysDataFilterUser(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }
   }
   function onGridSubOpMiClick_SysDataFilterRole(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }
   }
   function onGridSubOpMiClick_SysDataFilterGroup(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }
   }

</script>
</body>
</html>