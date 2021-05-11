<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>sys_serialnum_setting</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysSerialnumSetting" permissionEdit="sys:sysSerialnumSetting:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/ims-ext${ims_ext_suffix}/sys/sysSerialnumSetting/data" idField="id"
					 allowResize="true" pageSize="20"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="100" >ID
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>

							<div name="code"  field="code" vtype=""  headerAlign="center" allowSort="true" width="100" >编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="code-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="desc"  field="desc" vtype=""  headerAlign="center" allowSort="true" width="100" >描述
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="desc-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="isLenFilling"  field="isLenFilling" vtype=""  headerAlign="center" allowSort="true" width="100" >是否补齐长度
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="isLenFilling-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="serialLen"  field="serialLen" vtype=""  headerAlign="center" allowSort="true" width="100" >序列长度
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="serialLen-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="codePattern"  field="codePattern" vtype=""  headerAlign="center" allowSort="true" width="100" >编码样式
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="codePattern-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="keyPattern"  field="keyPattern" vtype=""  headerAlign="center" allowSort="true" width="100" >序列key样式
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="keyPattern-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="conditions"  field="conditions" vtype=""  headerAlign="center" allowSort="true" width="100" >规则条件
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="conditions-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="isValid"  field="isValid" vtype=""  headerAlign="center" allowSort="true" width="100" >是否有效
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="isValid-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysSerialnumSetting:edit"></sys:toolbarformmain>
                  <div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
									<input class="mini-hidden" name="id" id="id"/>
									<input class="mini-hidden" name="createByName" id="createByName"/>
									<input class="mini-hidden" name="tenantId" id="tenantId"/>
									<input class="mini-hidden" name="createBy" id="createBy"/>
									<input class="mini-hidden" name="createDept" id="createDept"/>
									<input class="mini-hidden" name="createDate" id="createDate"/>
									<input class="mini-hidden" name="updateByName" id="updateByName"/>
									<input class="mini-hidden" name="updateBy" id="updateBy"/>
									<input class="mini-hidden" name="updateDate" id="updateDate"/>
									<input class="mini-hidden" name="siteId" id="siteId"/>


									<table border="0" cellpadding="3" cellspacing="3" >



										<tr>

											<td style="text-align:right;">编号：</td>
											<td>
											   <input name="code" id="code" class="mini-textbox"   vtype = "" required="false" />
											</td>

											<td style="text-align:right;">描述：</td>
											<td >
												<input name="desc" id="desc" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td rowspan="5">
											说明:<br/>
											编号：序号标识<br/>
											序列长度：生成流水号的长度，例如 3 生成的为 001，002 等<br/>
											是否补齐长度：如果选择是，则会生成类似001这样，如果选择否，则会生成，1，2，前面不会自动补0<br/>
											编码样式：序号生成的规则样式，目前有内容变量 {yyyy}4位年，{yy} 两位年，{mm} 月，{dd} 日，{serialno}序列，其他自定义用 {}包裹，在获取时传入<br/>
											规则条件：满足此条件才会生效，目前使用javascript语法<br/>
											</td>


										</tr>
										<tr>

											<td style="text-align:right;">序列长度：</td>
											<td>
												<input name="serialLen" id="serialLen" class="mini-textbox"  vtype = ""  required="false" />
											</td>

											<td style="text-align:right;">是否补齐长度：</td>
											<td>
											   <input name="isLenFilling" id="isLenFilling" class="mini-checkbox"   vtype = "" required="false" trueValue="1" falseValue="0" />
											</td>



										</tr>
										<tr>

											<td style="text-align:right;">编码样式：</td>
											<td >
											   <input name="codePattern" id="codePattern" class="mini-textbox"   vtype = "" required="false" />
											</td>

											<td style="text-align:right;">是否有效：</td>
											<td>
												<input name="isValid" id="isValid" class="mini-checkbox"  vtype = ""  required="false" trueValue="1" falseValue="0" />
											</td>


										</tr>
										<tr>
											<td style="text-align:right;">序列key样式：</td>
											<td >
											   <input name="keyPattern" id="keyPattern" class="mini-textbox"  vtype = ""  required="false" />
											</td>


										</tr>
										<tr>
											<td style="text-align:right;">规则条件：</td>
											<td colspan="3">
												<input name="conditions" id="conditions" class="mini-textarea"   vtype = "" width="600" required="false" />
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
			    objId:"SysSerialnumSetting",
				dataUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysSerialnumSetting/data",
				getUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysSerialnumSetting/get",
				saveUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysSerialnumSetting/save",
				removeUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysSerialnumSetting/remove",
				exportUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysSerialnumSetting/export"
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
						label: 'ID',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.create_by_name',
						label: '创建人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.tenant_id',
						label: '租户id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.create_by',
						label: '创建人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.create_dept',
						label: '创建部门',
						type: 'string',
						default_value: '',
						size: 100
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
						size: 100
					}
					,{
						id: 'a.update_by',
						label: '修改人',
						type: 'string',
						default_value: '',
						size: 100
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
						size: 100
					}
					,{
						id: 'a.code',
						label: '编号',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.desc',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.is_len_filling',
						label: '是否补齐长度',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.serial_len',
						label: '序列长度',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.code_pattern',
						label: '编码样式',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.key_pattern',
						label: '序列key样式',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.conditions',
						label: '规则条件',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.is_valid',
						label: '父级目标id',
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