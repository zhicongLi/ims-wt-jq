<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全目标库</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SmGoalItemLib"  permissionEdit="sm:smGoalItemLib:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLib/data" idField="id"
			 allowResize="true" pageSize="20"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="content"  field="content" vtype=""   headerAlign="center" allowSort="true" width="500" >目标内容
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="content-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="goalLevel" field="goalLevel" vtype=""   headerAlign="center" allowSort="true" width="64" >目标级别
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="goalLevel-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="relationship" field="relationship" vtype=""   headerAlign="center" allowSort="true" width="64" >指标关系
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="relationship-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="indexValue" field="indexValue" vtype=""   headerAlign="center" allowSort="true" width="64" >指标值
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="indexValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="actValue" field="actValue" vtype=""   headerAlign="center" allowSort="true" width="64" >实际值
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="actValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="measure" field="measure" vtype=""   headerAlign="center" allowSort="true" width="64" >保障措施
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="measure-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"SmGoalItemLib",
				dataUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLib/data",
				getUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLib/get",
				saveUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLib/save",
				removeUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLib/remove",
				exportUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLib/export"
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
						id: 'a.create_by_name',
						label: '创建人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.tenant_id',
						label: '租户id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_by',
						label: '创建人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_dept',
						label: '创建部门',
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
						id: 'a.update_by_name',
						label: '修改人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.update_by',
						label: '修改人',
						type: 'string',
						default_value: '',
						size: 64
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
						size: 64
					}
					,{
						id: 'a.create_comp',
						label: '创建公司',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.seq_no',
						label: '序号',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.content',
						label: '目标内容',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.goal_level',
						label: '目标级别',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.relationship',
						label: '指标关系',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.index_value',
						label: '指标值',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.act_value',
						label: '实际值',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.num',
						label: '使用次数',
						type: 'string',
						default_value: '',
						size: 100
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