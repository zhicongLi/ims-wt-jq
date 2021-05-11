<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务规则定义</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysBizRule"  permissionEdit="sys:sysBizRule:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysBizRule/data" idField="id"
			 allowResize="true" pageSize="10"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="descr" field="descr" vtype=""   headerAlign="center" allowSort="true" width="64" >描述
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="rulePackage" field="rulePackage" vtype=""   headerAlign="center" allowSort="true" width="200" >规则包
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="rulePackage-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="ruleImport" field="ruleImport" vtype=""   headerAlign="center" allowSort="true" width="100" >导入
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="ruleImport-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="ruleGlobal" field="ruleGlobal" vtype=""   headerAlign="center" allowSort="true" width="100" >全局定义
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="ruleGlobal-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="ruleFunction" field="ruleFunction" vtype=""   headerAlign="center" allowSort="true" width="100" >函数定义
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="ruleFunction-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="ruleQuery" field="ruleQuery" vtype=""   headerAlign="center" allowSort="true" width="100" >查询
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="ruleQuery-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="ruleName" field="ruleName" vtype=""   headerAlign="center" allowSort="true" width="100" >名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="ruleName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="noLoop" field="noLoop" vtype=""   headerAlign="center" allowSort="true" width="100" >单实例执行一次
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="noLoop-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="salience" field="salience" vtype=""   headerAlign="center" allowSort="true" width="100" >优先级
						<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
						<input id="salience-Filter" name="mini-column-filter"  property="filter" class="mini-spinner" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="lockOnActive" field="lockOnActive" vtype=""   headerAlign="center" allowSort="true" width="100" >执行时锁定
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="lockOnActive-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="autoFocus" field="autoFocus" vtype=""   headerAlign="center" allowSort="true" width="100" >自动激活
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="autoFocus-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="agendaGroup" field="agendaGroup" vtype=""   headerAlign="center" allowSort="true" width="200" >规则分组
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="agendaGroup-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="activationGroup" field="activationGroup" vtype=""   headerAlign="center" allowSort="true" width="200" >激活组
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="activationGroup-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="dialect" field="dialect" vtype=""   headerAlign="center" allowSort="true" width="200" >脚本语言 
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="dialect-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="duration" field="duration" vtype=""   headerAlign="center" allowSort="true" width="100" >延迟执行时间
						<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
						<input id="duration-Filter" name="mini-column-filter"  property="filter" class="mini-spinner" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="dateExpires" field="dateExpires" vtype=""   headerAlign="center" allowSort="true" width="200" >过期日期
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="dateExpires-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="dateEffective" field="dateEffective" vtype=""   headerAlign="center" allowSort="true" width="200" >开始生效日期
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="dateEffective-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="ruleflowGroup" field="ruleflowGroup" vtype=""   headerAlign="center" allowSort="true" width="200" >规则流组
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="ruleflowGroup-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="ruleWhen" field="ruleWhen" vtype=""   headerAlign="center" allowSort="true" width="100" >规则条件
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="ruleWhen-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="ruleThen" field="ruleThen" vtype=""   headerAlign="center" allowSort="true" width="100" >规则动作
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="ruleThen-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="isActive" field="isActive" vtype=""   headerAlign="center" allowSort="true" width="100" >是否启用
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="isActive-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注信息
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建者
						<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createDate"  field="createDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >创建时间
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
					<div name="updateDate"  field="updateDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >更新时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="ruleKey" field="ruleKey" vtype=""   headerAlign="center" allowSort="true" width="64" >规则标识
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="ruleKey-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"SysBizRule",
				dataUrl:"${ctx}/sys/sysBizRule/data",
				getUrl:"${ctx}/sys/sysBizRule/get",
				saveUrl:"${ctx}/sys/sysBizRule/save",
				removeUrl:"${ctx}/sys/sysBizRule/remove",
				exportUrl:"${ctx}/sys/sysBizRule/export"
			 }
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
						id: 'a.descr',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.rule_package',
						label: '规则包',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.rule_import',
						label: '导入',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.rule_global',
						label: '全局定义',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.rule_function',
						label: '函数定义',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.rule_query',
						label: '查询',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.rule_name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.no_loop',
						label: '单实例执行一次',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.salience',
						label: '优先级',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.lock_on_active',
						label: '执行时锁定',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.auto_focus',
						label: '自动激活',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.agenda_group',
						label: '规则分组',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.activation_group',
						label: '激活组',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.dialect',
						label: '脚本语言 ',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.duration',
						label: '延迟执行时间',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.date_expires',
						label: '过期日期',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.date_effective',
						label: '开始生效日期',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.ruleflow_group',
						label: '规则流组',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.rule_when',
						label: '规则条件',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.rule_then',
						label: '规则动作',
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
						id: 'a.remarks',
						label: '备注信息',
						type: 'string',
						default_value: '',
						size: 255
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
						id: 'a.rule_key',
						label: '规则标识',
						type: 'string',
						default_value: '',
						size: 64
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