<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>对象配置</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
	
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="GenTable" permissionEdit="gen:genTable:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/ims-ext${ims_ext_suffix}/gen/genTable/data" idField="id"
					 allowResize="true" pageSize="20"
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
							<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="true" width="200" >名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="comments"  field="comments" vtype=""  headerAlign="center" allowSort="true" width="500" >描述
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="comments-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="className"  field="className" vtype=""  headerAlign="center" allowSort="true" width="100" >实体类名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="className-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="parentTable"  field="parentTable" vtype=""  headerAlign="center" allowSort="true" width="200" >关联父表
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="parentTable-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="parentTableFk"  field="parentTableFk" vtype=""  headerAlign="center" allowSort="true" width="100" >关联父表外键
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="parentTableFk-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="parentTableKeyField"  field="parentTableKeyField" vtype=""  headerAlign="center" allowSort="true" width="100" >关联父表主键字段
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="parentTableKeyField-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建者
								<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="createDate"  field="createDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >创建时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
								<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >更新者
								<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
		<sys:toolbarformmain permissionEdit="gen:genTable:edit"></sys:toolbarformmain>
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
											   <input name="name" textField="name" valueField="name" id="name"  class="mini-combobox"  showNullItem="true" allowInput="true" vtype = ""  required="false" />


											</td>
											<td style="text-align:right;">描述：</td>
											<td>
											   <input name="comments" id="comments"  class="mini-textbox"  vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">实体类名称：</td>
											<td>
											   <input name="className" id="className" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">关联子表字段：</td>
											<td>
												<input name="parentTableKeyField" id="parentTableKeyField"  textField="name" valueField="name" class="mini-combobox" showNullItem="true" allowInput="true"  vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">父表：</td>
											<td>
												<input name="parentTable" id="parentTable"  textField="name" valueField="name" class="mini-combobox"  showNullItem="true" allowInput="true"  vtype = "" required="false" />
											</td>
											<td style="text-align:right;">关联父表字段：</td>
											<td>
												<input name="parentTableFk" id="parentTableFk" textField="name" valueField="name" class="mini-combobox" showNullItem="true" allowInput="true"  vtype = "" required="false" />
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
								<div title="业务表字段" id="tabGenTableColumnList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridGenTableColumn" permissionEdit="gen:genTableColumn:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridGenTableColumn" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-ext${ims_ext_suffix}/gen/genTableColumn/data" idField="id"
										 allowResize="true" pageSize="20"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>

											<div name="id"  field="id" readOnly="true" hideable="true" visible="false"   vtype="required" headerAlign="center" allowSort="true"  width="64" >编号
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div name="genTableId" hideable="true" visible="false"  field="genTableId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div name="name"  field="name"   vtype="" headerAlign="center" allowSort="true"  width="100" >列名
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div name="comments"  field="comments"   vtype="" headerAlign="center" allowSort="true"  width="100" >描述
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="comments-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div name="jdbcType"  field="jdbcType"   vtype="" headerAlign="center" allowSort="true"  width="100" >数据库类型
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="jdbcType-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div type="comboboxcolumn"  name="javaType"  field="javaType"   vtype="" headerAlign="center" allowSort="true"  width="100" >JAVA类型
												<input property="editor" class="mini-combobox" data="config_javaTypeList" textField="label" valueField="value"  style="width:100%;"  />
												<input id="javaType-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div name="javaField"  field="javaField"   vtype="" headerAlign="center" allowSort="true"  width="100" >JAVA字段名
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="javaField-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div type="checkboxcolumn" trueValue="1" falseValue="0" name="isPk"  field="isPk"   vtype="" headerAlign="center" allowSort="true"  width="60" >主键
												<%--<input property="editor" class="mini-checkbox"  style="width:100%;"  />--%>
												<input id="isPk-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div type="checkboxcolumn" trueValue="1" falseValue="0" name="isNull"  field="isNull"   vtype="" headerAlign="center" allowSort="true"  width="80" >允许为空
												<%--<input property="editor" class="mini-checkbox"  style="width:100%;"  />--%>
												<input id="isNull-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div type="checkboxcolumn" trueValue="1" falseValue="0" name="isInsert"  field="isInsert"   vtype="" headerAlign="center" allowSort="true"  width="80" >允许新建
												<%--<input property="editor" class="mini-checkbox"  style="width:100%;"  />--%>
												<input id="isInsert-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div type="checkboxcolumn" trueValue="1" falseValue="0" name="isEdit"  field="isEdit"   vtype="" headerAlign="center" allowSort="true"  width="80" >允许编辑
												<%--<input property="editor" class="mini-checkbox"  style="width:100%;"  />--%>
												<input id="isEdit-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>

											<div type="checkboxcolumn" trueValue="1" falseValue="0" name="isQuery"  field="isQuery"   vtype="" headerAlign="center" allowSort="true"  width="80" >高级查询
												<%--<input property="editor" class="mini-checkbox"  style="width:100%;"  />--%>
												<input id="isQuery-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div type="checkboxcolumn" trueValue="1" falseValue="0" name="isQuerySimple"  field="isQuerySimple"   vtype="" headerAlign="center" allowSort="true"  width="80" >简要查询
												<%--<input property="editor" class="mini-checkbox"  style="width:100%;"  />--%>
												<input id="isQuerySimple-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div type="checkboxcolumn" trueValue="1" falseValue="0" name="isKey"  field="isKey"   vtype="" headerAlign="center" allowSort="true"  width="80" >快速定位
												<%--<input property="editor" class="mini-checkbox"  style="width:100%;"  />--%>
												<input id="isKey-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div type="checkboxcolumn" trueValue="1" falseValue="0" name="isList"  field="isList"   vtype="" headerAlign="center" allowSort="true"  width="80" >列表显示
												<%--<input property="editor" class="mini-checkbox"  style="width:100%;"  />--%>
												<input id="isList-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div type="checkboxcolumn" trueValue="1" falseValue="0"  name="isInForm"  field="isInForm"   vtype="" headerAlign="center" allowSort="true"  width="80" >表单显示
												<%--<input property="editor" class="mini-checkbox"  style="width:100%;"  />--%>
												<input id="isInForm-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div type="comboboxcolumn" name="queryType"  field="queryType"   vtype="" headerAlign="center" allowSort="true"  width="100" >匹配方式
												<input property="editor" class="mini-combobox" data="config_queryTypeList" textField="label" valueField="value"  style="width:100%;"  />
												<input id="queryType-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div type="comboboxcolumn" name="showType"  field="showType"   vtype="" headerAlign="center" allowSort="true"  width="100" >控件类型
												<input property="editor" class="mini-combobox" data="config_showTypeList" textField="label" valueField="value"  style="width:100%;"  />
												<input id="showType-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div name="dictType"  field="dictType"   vtype="" headerAlign="center" allowSort="true"  width="100" >字典类型
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="dictType-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>

											<div name="sort"  field="sort"   vtype="" headerAlign="center" allowSort="true"  width="60" >排序
												<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
												<input id="sort-Filter" name="mini-column-filter"  property="filter" class="mini-spinner" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>



											<div name="vtype"  field="vtype"   vtype="" headerAlign="center" allowSort="true"  width="100" >验证规则
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="vtype-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div type="checkboxcolumn" name="isLov"  field="isLov"   vtype="" headerAlign="center" allowSort="true"  width="80" trueValue="1" falseValue="0" >LOV字段
												<%--<input property="editor" class="mini-checkbox"  style="width:100%;"  />--%>
												<input id="isLov-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div name="lovUrl"  field="lovUrl"   vtype="" headerAlign="center" allowSort="true"  width="100" >LOV地址
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="lovUrl-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>

											<div name="format"  field="format"   vtype="" headerAlign="center" allowSort="true"  width="100" >格式
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="format-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div name="settings"  field="settings"   vtype="" headerAlign="center" allowSort="true"  width="120" >其它设置（扩展字段JSON）
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="settings-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div name="remarks"  field="remarks"  vtype="" headerAlign="center" allowSort="true" width="255" >备注信息
												<input property="editor" class="mini-textarea" style="width:100%;"  />
												<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>
											<div name="createDate"  field="createDate" readOnly="true" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >创建时间
												<input property="editor" class="mini-datepicker" style="width:100%;"  />
												<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
												/>
											</div>

											<div name="updateDate"  field="updateDate" readOnly="true" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >更新时间
												<input property="editor" class="mini-datepicker" style="width:100%;"  />
												<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridGenTableColumn')" showClose="true" oncloseclick="onChildFilterClose(this,'gridGenTableColumn')"
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

	var tableList = null;

	initBase(
			{   id:"datagridMain",
			    objId:"GenTable",
			    masterKeyField:"id",
				dataUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genTable/data",
				getUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genTable/get",
				saveUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genTable/save",
				removeUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genTable/remove",
				exportUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genTable/export",
				onAfterInsertRecord:onAfterInsertRecord,
                onAfterLoadRecord:onAfterLoadRecord
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                    {
		                 id:"gridGenTableColumn",
		                 objId:"GenTableColumn",
		                 FK:"genTableId",
		                 cascade:true,
						 dataUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genTableColumn/data",
						 getUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genTableColumn/get",
						 saveUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genTableColumn/save",
						 removeUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genTableColumn/remove",
						 exportUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genTableColumn/export"
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
						id: 'a.name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.comments',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.class_name',
						label: '实体类名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.parent_table',
						label: '关联父表',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.parent_table_fk',
						label: '关联父表外键',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.parent_table_key_field',
						label: '关联父表主键字段',
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
   function onGridSubOpMiClick_GenTableColumn(e){

   }
    function onAfterInsertRecord(data){
     /*  var table=mini.get('name');
      debugger;
        table.setData(tableList); */

    }
    function onAfterLoadRecord(data){

        var parentTableKeyField=mini.get('parentTableKeyField');
        parentTableKeyField.setData(data.columnList);
        var parentTableFk=mini.get('parentTableFk');
        parentTableFk.setData(data.columnList);
    }
   
    var configObj =null;
    var config_javaTypeList= null;
    var config_queryTypeList= null;
    var config_showTypeList= null;
    
    
    function getTableList(){
    	$.ajax({
            url: "${ctx}/ims-ext${ims_ext_suffix}/gen/genTable/tableList",
         	data : {},
            type: "post",
            success: function (data) {
            	debugger;
            	var d = mini.decode(data);
            	if(d.type=='I'){
            		tableList = d.data;
            		var parentTable=mini.get('parentTable');
            		parentTable.setData(tableList);
            		var table=mini.get('name');
            		table.setData(tableList);
            	}else{
            		mini.alert(d.message);
            	}
            	
            },
            error: function (jqXHR, textStatus, errorThrown) {
                var callback=function (action) {
                    if(action=='详细')  viewErrorDetail(jqXHR.responseText);
                }
                var buttonsTemp=["ok",""];
                showMessageBox("错误","获取数据库表出错","error",null,callback,buttonsTemp);
                form.unmask();
            }
        });
    }
    
    function getConfigData(){
    	$.ajax({
            url: "${ctx}/ims-ext${ims_ext_suffix}/gen/genTable/configData",
         	data : {},
            type: "post",
            success: function (data) {
            	debugger;
            	var d = mini.decode(data);
            	if(d.type=='I'){
            		configObj = d.data;
           		    config_javaTypeList= configObj.javaTypeList;
            		config_queryTypeList= configObj.queryTypeList;
            		config_showTypeList= configObj.showTypeList;
            	}else{
            		mini.alert(d.message);
            	}
            	
            },
            error: function (jqXHR, textStatus, errorThrown) {
                var callback=function (action) {
                    if(action=='详细')  viewErrorDetail(jqXHR.responseText);
                }
                var buttonsTemp=["ok",""];
                showMessageBox("错误","获取配置出错","error",null,callback,buttonsTemp);
                form.unmask();
            }
        });
    }
    
    $(function(){
    	getTableList();
    	getConfigData();
    });
    
    //console.log(config_javaTypeList);
//    function onParentTableChanged(e) {
//        var id = parentTable.getValue();
//
//        parentTableKeyField.setValue("");
//
//        var url = "../data/AjaxService.aspx?method=GetPositionsByDepartmenId&id=" + id
//        positionCombo.setUrl(url);
//
//        positionCombo.select(0);
//    }
</script>
</body>
</html>