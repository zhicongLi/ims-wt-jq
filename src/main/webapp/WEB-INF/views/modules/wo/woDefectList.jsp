<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>wo_defect</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="WoDefect"  permissionEdit="wo:woDefect:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/wo-wt${wo_wt_suffix}/wo/woDefect/data" idField="id"
			 allowResize="true" pageSize="20"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="100" >id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="code" field="code" vtype=""   headerAlign="center" allowSort="true" width="100" >缺陷编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="code-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="defectLevel" field="defectLevel" vtype=""   headerAlign="center" allowSort="true" width="100" >缺陷类别
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="defectLevel-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="specId" field="specId" vtype=""   headerAlign="center" allowSort="true" width="100" >专业id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="specId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="specName" field="specName" vtype=""   headerAlign="center" allowSort="true" width="100" >专业
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="specName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="status" field="status" vtype=""   headerAlign="center" allowSort="true" width="100" >状态
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="status-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="plantUnit" field="plantUnit" vtype=""   headerAlign="center" allowSort="true" width="100" >机组
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="plantUnit-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="details" field="details" vtype=""   headerAlign="center" allowSort="true" width="100" >缺陷内容
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="details-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="reportBy" field="reportBy" vtype=""   headerAlign="center" allowSort="true" width="100" >发现人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="reportBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="reportByName" field="reportByName" vtype=""   headerAlign="center" allowSort="true" width="100" >发现人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="reportByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="reportDate" field="reportDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >发现时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="reportDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="reportOrg" field="reportOrg" vtype=""   headerAlign="center" allowSort="true" width="100" >发现班组
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="reportOrg-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="reportOrgName" field="reportOrgName" vtype=""   headerAlign="center" allowSort="true" width="100" >发现班组名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="reportOrgName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="reportDept" field="reportDept" vtype=""   headerAlign="center" allowSort="true" width="100" >发现部门
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="reportDept-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="reportDeptName" field="reportDeptName" vtype=""   headerAlign="center" allowSort="true" width="100" >发现部门名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="reportDeptName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="maintOrg" field="maintOrg" vtype=""   headerAlign="center" allowSort="true" width="100" >消缺班组
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="maintOrg-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="maintOrgName" field="maintOrgName" vtype=""   headerAlign="center" allowSort="true" width="100" >消缺班组名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="maintOrgName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="planStartDate" field="planStartDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >计划消缺开始时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="planStartDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="planEndDate" field="planEndDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >计划消缺结束时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="planEndDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="100" >备注
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="leader" field="leader" vtype=""   headerAlign="center" allowSort="true" width="100" >消缺负责人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="leader-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="leaderName" field="leaderName" vtype=""   headerAlign="center" allowSort="true" width="100" >消缺负责人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="leaderName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="finishDate" field="finishDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >消缺完成时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="finishDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="finishRes" field="finishRes" vtype=""   headerAlign="center" allowSort="true" width="100" >消缺内容
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="finishRes-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="finishMeasures" field="finishMeasures" vtype=""   headerAlign="center" allowSort="true" width="100" >采取措施
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="finishMeasures-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkBy2" field="checkBy2" vtype=""   headerAlign="center" allowSort="true" width="100" >点检验收人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkBy2-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkByName2" field="checkByName2" vtype=""   headerAlign="center" allowSort="true" width="100" >点检验收人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkByName2-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkDate2" field="checkDate2" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >点检验收时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkDate2-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkNote2" field="checkNote2" vtype=""   headerAlign="center" allowSort="true" width="100" >点检验收意见
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkNote2-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkBy1" field="checkBy1" vtype=""   headerAlign="center" allowSort="true" width="100" >运行验收人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkBy1-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkByName1" field="checkByName1" vtype=""   headerAlign="center" allowSort="true" width="100" >运行验收人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkByName1-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkDate1" field="checkDate1" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >运行验收时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkDate1-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkNote1" field="checkNote1" vtype=""   headerAlign="center" allowSort="true" width="100" >运行验收意见
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkNote1-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createBy" field="createBy" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="100" >创建人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createDate"  field="createDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >创建时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateBy" field="updateBy" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="100" >更新者
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateDate"  field="updateDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >更新时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"WoDefect",
				dataUrl:"${ctx}/wo-wt${wo_wt_suffix}/wo/woDefect/data",
				getUrl:"${ctx}/wo-wt${wo_wt_suffix}/wo/woDefect/get",
				saveUrl:"${ctx}/wo-wt${wo_wt_suffix}/wo/woDefect/save",
				removeUrl:"${ctx}/wo-wt${wo_wt_suffix}/wo/woDefect/remove",
				exportUrl:"${ctx}/wo-wt${wo_wt_suffix}/wo/woDefect/export"
			 }
	       );

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: 'id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.code',
						label: '缺陷编号',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.defect_level',
						label: '缺陷类别',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.spec_id',
						label: '专业id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.spec_name',
						label: '专业',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.status',
						label: '状态',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.plant_unit',
						label: '机组',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.details',
						label: '缺陷内容',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.report_by',
						label: '发现人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.report_by_name',
						label: '发现人名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.report_date',
						label: '发现时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.report_org',
						label: '发现班组',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.report_org_name',
						label: '发现班组名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.report_dept',
						label: '发现部门',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.report_dept_name',
						label: '发现部门名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.maint_org',
						label: '消缺班组',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.maint_org_name',
						label: '消缺班组名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.plan_start_date',
						label: '计划消缺开始时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.plan_end_date',
						label: '计划消缺结束时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.remarks',
						label: '备注',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.leader',
						label: '消缺负责人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.leader_name',
						label: '消缺负责人名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.finish_date',
						label: '消缺完成时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.finish_res',
						label: '消缺内容',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.finish_measures',
						label: '采取措施',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_by2',
						label: '点检验收人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_by_name2',
						label: '点检验收人名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_date2',
						label: '点检验收时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_note2',
						label: '点检验收意见',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_by1',
						label: '运行验收人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_by_name1',
						label: '运行验收人名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_date1',
						label: '运行验收时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_note1',
						label: '运行验收意见',
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
						size: 100
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
   //////////操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){

   }
</script>
</body>
</html>