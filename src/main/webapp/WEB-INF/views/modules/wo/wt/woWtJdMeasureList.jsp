<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>wo_wt_jd_measure</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="WoWtJdMeasure"  permissionEdit="wo:woWtJdMeasure:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/wo-wt${wo_wt_suffix}/wo/woWtJdMeasure/data" idField="id"
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
					<div name="measureNumber" field="measureNumber" vtype=""   headerAlign="center" allowSort="true" width="100" >措施票流水号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="measureNumber-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="measureCode" field="measureCode" vtype=""   headerAlign="center" allowSort="true" width="100" >编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="measureCode-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="planStartTime" field="planStartTime" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >计划工作开始时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="planStartTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="planEndTime" field="planEndTime" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >计划工作结束时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="planEndTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="deviceName" field="deviceName" vtype=""   headerAlign="center" allowSort="true" width="100" >退出继电保护或自动装置名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="deviceName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="condition1" field="condition1" vtype=""   headerAlign="center" allowSort="true" width="100" >一次设备运行情况
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="condition1-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="condition2" field="condition2" vtype=""   headerAlign="center" allowSort="true" width="100" >被试保护作用的断路器
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="condition2-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="condition3" field="condition3" vtype=""   headerAlign="center" allowSort="true" width="100" >被试保护屏上的运行设备
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="condition3-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="condition4" field="condition4" vtype=""   headerAlign="center" allowSort="true" width="100" >被试保护屏、端子箱与其他保护连接线
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="condition4-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="condition5" field="condition5" vtype=""   headerAlign="center" allowSort="true" width="100" >其他
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="condition5-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitPermitDate" field="exitPermitDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >许可执行时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitPermitDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitPermitBy" field="exitPermitBy" vtype=""   headerAlign="center" allowSort="true" width="100" >执行许可人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitPermitBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitPermitByName" field="exitPermitByName" vtype=""   headerAlign="center" allowSort="true" width="100" >执行许可人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitPermitByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitWorkLeader" field="exitWorkLeader" vtype=""   headerAlign="center" allowSort="true" width="100" >执行工作负责人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitWorkLeader-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitWorkLeaderName" field="exitWorkLeaderName" vtype=""   headerAlign="center" allowSort="true" width="100" >执行工作负责人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitWorkLeaderName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitFinishDate" field="exitFinishDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >执行完成时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitFinishDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitOperator" field="exitOperator" vtype=""   headerAlign="center" allowSort="true" width="100" >执行操作人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitOperator-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitOperatorName" field="exitOperatorName" vtype=""   headerAlign="center" allowSort="true" width="100" >执行操作人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitOperatorName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitGuardian" field="exitGuardian" vtype=""   headerAlign="center" allowSort="true" width="100" >执行监护人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitGuardian-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitGuardianName" field="exitGuardianName" vtype=""   headerAlign="center" allowSort="true" width="100" >执行监护人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitGuardianName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoPermitDate" field="intoPermitDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >许可恢复时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoPermitDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoPermitBy" field="intoPermitBy" vtype=""   headerAlign="center" allowSort="true" width="100" >恢复许可人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoPermitBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoPermitByName" field="intoPermitByName" vtype=""   headerAlign="center" allowSort="true" width="100" >恢复许可人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoPermitByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoWorkLeader" field="intoWorkLeader" vtype=""   headerAlign="center" allowSort="true" width="100" >恢复工作负责人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoWorkLeader-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoWorkLeaderName" field="intoWorkLeaderName" vtype=""   headerAlign="center" allowSort="true" width="100" >恢复工作负责人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoWorkLeaderName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoFinishDate" field="intoFinishDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >恢复完成时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoFinishDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoOperator" field="intoOperator" vtype=""   headerAlign="center" allowSort="true" width="100" >恢复操作人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoOperator-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoOperatorName" field="intoOperatorName" vtype=""   headerAlign="center" allowSort="true" width="100" >恢复操作人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoOperatorName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoGuardian" field="intoGuardian" vtype=""   headerAlign="center" allowSort="true" width="100" >恢复监护人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoGuardian-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoGuardianName" field="intoGuardianName" vtype=""   headerAlign="center" allowSort="true" width="100" >恢复监护人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoGuardianName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="auditor" field="auditor" vtype=""   headerAlign="center" allowSort="true" width="100" >审核人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="auditor-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="auditorName" field="auditorName" vtype=""   headerAlign="center" allowSort="true" width="100" >审核人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="auditorName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="auditorDate" field="auditorDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >审核时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="auditorDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="wtSigner" field="wtSigner" vtype=""   headerAlign="center" allowSort="true" width="100" >签发人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="wtSigner-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="wtSignerName" field="wtSignerName" vtype=""   headerAlign="center" allowSort="true" width="100" >签发人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="wtSignerName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="wtSignerDate" field="wtSignerDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >签发时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="wtSignerDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="wtId" field="wtId" vtype=""   headerAlign="center" allowSort="true" width="100" >外键电二工作票id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="wtId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"WoWtJdMeasure",
				dataUrl:"${ctx}/wo-wt${wo_wt_suffix}/wo/woWtJdMeasure/data",
				getUrl:"${ctx}/wo-wt${wo_wt_suffix}/wo/woWtJdMeasure/get",
				saveUrl:"${ctx}/wo-wt${wo_wt_suffix}/wo/woWtJdMeasure/save",
				removeUrl:"${ctx}/wo-wt${wo_wt_suffix}/wo/woWtJdMeasure/remove",
				exportUrl:"${ctx}/wo-wt${wo_wt_suffix}/wo/woWtJdMeasure/export"
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
						id: 'a.measure_number',
						label: '措施票流水号',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.measure_code',
						label: '编号',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.plan_start_time',
						label: '计划工作开始时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.plan_end_time',
						label: '计划工作结束时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.device_name',
						label: '退出继电保护或自动装置名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.condition1',
						label: '一次设备运行情况',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.condition2',
						label: '被试保护作用的断路器',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.condition3',
						label: '被试保护屏上的运行设备',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.condition4',
						label: '被试保护屏、端子箱与其他保护连接线',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.condition5',
						label: '其他',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_permit_date',
						label: '许可执行时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_permit_by',
						label: '执行许可人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_permit_by_name',
						label: '执行许可人名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_work_leader',
						label: '执行工作负责人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_work_leader_name',
						label: '执行工作负责人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_finish_date',
						label: '执行完成时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_operator',
						label: '执行操作人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_operator_name',
						label: '执行操作人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_guardian',
						label: '执行监护人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_guardian_name',
						label: '执行监护人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_permit_date',
						label: '许可恢复时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_permit_by',
						label: '恢复许可人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_permit_by_name',
						label: '恢复许可人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_work_leader',
						label: '恢复工作负责人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_work_leader_name',
						label: '恢复工作负责人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_finish_date',
						label: '恢复完成时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_operator',
						label: '恢复操作人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_operator_name',
						label: '恢复操作人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_guardian',
						label: '恢复监护人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_guardian_name',
						label: '恢复监护人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.auditor',
						label: '审核人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.auditor_name',
						label: '审核人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.auditor_date',
						label: '审核时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.wt_signer',
						label: '签发人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.wt_signer_name',
						label: '签发人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.wt_signer_date',
						label: '签发时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.wt_id',
						label: '外键电二工作票id',
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