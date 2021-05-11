<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>系统配置可选择项</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysConfigItem" permissionEdit="sys:sysConfigItem:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysConfigItem/data" idField="id"
					 allowResize="true" pageSize="20"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64"  visible="false">编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="propId"  field="propId" vtype=""  headerAlign="center" allowSort="true" width="150">属性编码
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="propId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="propValue"  field="propValue" vtype=""  headerAlign="center" allowSort="true" width="100" >属性值
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="propValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="true" width="100" >属性名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="description"  field="description" vtype=""  headerAlign="center" allowSort="true" width="100" >描述
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="description-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="255" >备注信息
								<input property="editor" class="mini-textarea" style="width:100%;"  />
								<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							
							<div name="type"   field="type"   headerAlign="center" allowSort="true" width="100" type="comboboxcolumn" vtype="required">属性类别
								<input property="editor"  class="mini-combobox"  required="true"   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_config_type"/>
								<input id="type-Filter" name="mini-column-filter"  property="filter" class="mini-combobox"   style="width:100%;" textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_config_type"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="defaultValue"  field="defaultValue" vtype=""  headerAlign="center" allowSort="true" width="100" >默认值
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="defaultValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div type="checkboxcolumn" trueValue="1" falseValue="0"  name="isActive"  field="isActive" vtype=""  headerAlign="center" allowSort="true" width="64" >是否启用
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="isActive-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div type="checkboxcolumn" trueValue="1" falseValue="0"  name="isImmedActive"  field="isImmedActive" vtype=""  headerAlign="center" allowSort="true" width="64" >是否立即生效
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="isImmedActive-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysConfigItem:edit"></sys:toolbarformmain>
                  <div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
									<input class="mini-hidden" name="id" id="id"/>
									<input class="mini-hidden" name="validFrom" id="validFrom"/>
									<input class="mini-hidden" name="validTo" id="validTo"/>
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
											<td style="text-align:right;">属性编码：</td>
											<td>
											   <input name="propId" id="propId" class="mini-textbox"  vtype = ""  required="false" width="250"/>
											</td>
											<td style="text-align:right;">属性值：</td>
											<td>
											   <input name="propValue" id="propValue" class="mini-textbox"   vtype = "" required="false"  width="250"/>
											</td>
											<td style="text-align:right;">属性名称：</td>
											<td>
											   <input name="name" id="name" class="mini-textbox"  vtype = ""  required="false"  width="250"/>
											</td>
											
											
										</tr>
										<tr>
										<td style="text-align:right;">是否立即生效：</td>
											<td>
											<input trueValue="1" falseValue="0" name="isImmedActive" id="isImmedActive" class="mini-checkbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">属性类别：</td>
											<td>
												<input name="type" id="type"  class="mini-combobox"  required="true"  showNullItem="true"  textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_config_type"/>
											</td>
											
											<td style="text-align:right;">是否有效：</td>
											<td>
												<input trueValue="1" falseValue="0" name="isActive" id="isActive" class="mini-checkbox"  vtype = ""  required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">默认值：</td>
											<td>
											   <input name="defaultValue" id="defaultValue" class="mini-textbox"  vtype = "" width="250" required="false" />
											</td>
											<td style="text-align:right;">备注信息：</td>
											<td>
											   <input name="remarks" id="remarks" class="mini-textarea" vtype = ""  required="false"  width="250"/>
											</td>
											<td style="text-align:right;">描述：</td>
											<td>
											   <input name="description" id="description" class="mini-textarea"   vtype = "" required="false" width="250" />
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
			    objId:"SysConfigItem",
				dataUrl:"${ctx}/sys/sysConfigItem/data",
				getUrl:"${ctx}/sys/sysConfigItem/get",
				saveUrl:"${ctx}/sys/sysConfigItem/save",
				removeUrl:"${ctx}/sys/sysConfigItem/remove",
				exportUrl:"${ctx}/sys/sysConfigItem/export"
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
						id: 'a.prop_id',
						label: '属性编码',
						type: 'string',
						default_value: '',
						size: 50
					}
					,{
						id: 'a.prop_value',
						label: '属性值',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.name',
						label: '属性名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.description',
						label: '描述',
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
					,{
						id: 'a.remarks',
						label: '备注信息',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.type',
						label: '属性类别',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.valid_from',
						label: '有效开始',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.valid_to',
						label: '有效结束',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.default_value',
						label: '默认值',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.is_active',
						label: '是否有效',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.is_immed_active',
						label: '是否立即生效',
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