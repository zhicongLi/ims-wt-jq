<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>对象展示控制</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysObjCtrl"  permissionEdit="sys:sysObjCtrl:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysObjCtrl/data" idField="id"
			 allowResize="true" pageSize="10"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="100" >名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="descr" field="descr" vtype=""   headerAlign="center" allowSort="true" width="64" >描述
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div type="checkboxcolumn"  name="isActive"  field="isActive" vtype="" headerAlign="center" allowSort="true" width="120" trueValue="1" falseValue="0" >控制是否启用
						<input property="editor" class="mini-checkbox" style="width:100%;"  />
						<input id="isActive-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
							   data="checkValues" multiSelect="true" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="objId" field="objId" vtype=""   headerAlign="center" allowSort="true" width="64" >对象编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="objId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div type="comboboxcolumn" autoShowPopup="true" name="ctrlType"  field="ctrlType" vtype=""  headerAlign="center" allowSort="true" width="64" >控制类型
						<input property="editor" class="mini-combobox" style="width:100%;" valueField="value"  textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_type" />
						<input id="ctrlType-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
                           textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_obj_ctrl_type" multiSelect="true"
                           onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>

					<div name="siteId" field="siteId" vtype=""   headerAlign="center" allowSort="true" width="64" >域编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="siteId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="priority" field="priority" vtype=""   headerAlign="center" allowSort="true" width="11" >优先级
						<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
						<input id="priority-Filter" name="mini-column-filter"  property="filter" class="mini-spinner" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div type="checkboxcolumn"  name="isEdit"  field="isEdit" vtype="" headerAlign="center" allowSort="true" width="120" trueValue="1" falseValue="0" >是否可编辑
						<input property="editor" class="mini-checkbox" style="width:100%;"  />
						<input id="isEdit-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
							   data="checkValues" multiSelect="true" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div type="checkboxcolumn"  name="isEnabled"  field="isEnabled" vtype="" headerAlign="center" allowSort="true" width="120" trueValue="1" falseValue="0" >是否可用
						<input property="editor" class="mini-checkbox" style="width:100%;"  />
						<input id="isEnabled-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
							   data="checkValues" multiSelect="true" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div type="checkboxcolumn"  name="isRemove"  field="isRemove" vtype="" headerAlign="center" allowSort="true" width="120" trueValue="1" falseValue="0" >是否可删除
						<input property="editor" class="mini-checkbox" style="width:100%;"  />
						<input id="isRemove-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
							   data="checkValues" multiSelect="true" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div type="checkboxcolumn"  name="isNew"  field="isNew" vtype="" headerAlign="center" allowSort="true" width="120" trueValue="1" falseValue="0" >是否可新建
						<input property="editor" class="mini-checkbox" style="width:100%;"  />
						<input id="isNew-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
							   data="checkValues" multiSelect="true" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div type="checkboxcolumn"  name="isShow"  field="isShow" vtype="" headerAlign="center" allowSort="true" width="120" trueValue="1" falseValue="0" >是否显示
						<input property="editor" class="mini-checkbox" style="width:100%;"  />
						<input id="isShow-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
							   data="checkValues" multiSelect="true" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="ruleId" field="ruleId" displayField="ruleId"  vtype=""  headerAlign="center" allowSort="true" width="64" >规则条件
						<input property="editor"  class="mini-buttonedit" onbuttonclick="popLov(this,'选择规则条件',false,true,'${ctx}//sys/sysObjRule/list',850,500,'id','ruleId' )" style="width:100%;"  />
						<input id="ruleId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建者
						<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createDate"  field="createDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >创建时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >更新者
						<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateDate"  field="updateDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >更新时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注信息
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
        </div>
    </div>
   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysObjCtrl",
				dataUrl:"${ctx}/sys/sysObjCtrl/data",
				getUrl:"${ctx}/sys/sysObjCtrl/get",
				saveUrl:"${ctx}/sys/sysObjCtrl/save",
				removeUrl:"${ctx}/sys/sysObjCtrl/remove",
				exportUrl:"${ctx}/sys/sysObjCtrl/export"
			 }
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
   //////////操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){

   }
</script>
</body>
</html>