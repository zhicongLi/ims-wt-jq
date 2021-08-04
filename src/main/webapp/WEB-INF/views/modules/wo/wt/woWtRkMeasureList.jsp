<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>wo_wt_rk_measure</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="WoWtRkMeasure"  permissionEdit="wo:woWtRkMeasure:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/wo-wt${wo_wt_suffix}/wo/woWtRkMeasure/data" idField="id"
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
					<div name="exitRequire" field="exitRequire" vtype=""   headerAlign="center" allowSort="true" width="100" >保护/退出要求
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitRequire-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitCause" field="exitCause" vtype=""   headerAlign="center" allowSort="true" width="100" >保护/退出原因
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitCause-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitCondition" field="exitCondition" vtype=""   headerAlign="center" allowSort="true" width="100" >退出执行情况
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitCondition-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitPermitDate" field="exitPermitDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >许可退出时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitPermitDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitPermitBy" field="exitPermitBy" vtype=""   headerAlign="center" allowSort="true" width="100" >工作许可人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitPermitBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitPermitByName" field="exitPermitByName" vtype=""   headerAlign="center" allowSort="true" width="100" >工作许可人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitPermitByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitWorkLeader" field="exitWorkLeader" vtype=""   headerAlign="center" allowSort="true" width="100" >退出工作负责人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitWorkLeader-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitWorkLeaderName" field="exitWorkLeaderName" vtype=""   headerAlign="center" allowSort="true" width="100" >退出工作负责人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitWorkLeaderName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitFinishDate" field="exitFinishDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >退出完成时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitFinishDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitOperator" field="exitOperator" vtype=""   headerAlign="center" allowSort="true" width="100" >退出操作人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitOperator-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitOperatorName" field="exitOperatorName" vtype=""   headerAlign="center" allowSort="true" width="100" >退出操作人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitOperatorName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitGuardian" field="exitGuardian" vtype=""   headerAlign="center" allowSort="true" width="100" >退出监护人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitGuardian-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="exitGuardianName" field="exitGuardianName" vtype=""   headerAlign="center" allowSort="true" width="100" >退出监护人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="exitGuardianName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoCondition" field="intoCondition" vtype=""   headerAlign="center" allowSort="true" width="100" >投入情况
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoCondition-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoPermitDate" field="intoPermitDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >投入许可投入时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoPermitDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoPermitBy" field="intoPermitBy" vtype=""   headerAlign="center" allowSort="true" width="100" >投入许可人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoPermitBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoPermitByName" field="intoPermitByName" vtype=""   headerAlign="center" allowSort="true" width="100" >投入许可人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoPermitByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoWorkLeader" field="intoWorkLeader" vtype=""   headerAlign="center" allowSort="true" width="100" >投入工作负责人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoWorkLeader-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoWorkLeaderName" field="intoWorkLeaderName" vtype=""   headerAlign="center" allowSort="true" width="100" >投入工作负责人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoWorkLeaderName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoFinishDate" field="intoFinishDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >投入完成时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoFinishDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoOperator" field="intoOperator" vtype=""   headerAlign="center" allowSort="true" width="100" >投入操作人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoOperator-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoOperatorName" field="intoOperatorName" vtype=""   headerAlign="center" allowSort="true" width="100" >投入操作人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoOperatorName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoGuardian" field="intoGuardian" vtype=""   headerAlign="center" allowSort="true" width="100" >投入监护人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="intoGuardian-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="intoGuardianName" field="intoGuardianName" vtype=""   headerAlign="center" allowSort="true" width="100" >投入监护人
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
        </div>
    </div>
   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"WoWtRkMeasure",
				dataUrl:"${ctx}/wo-wt${wo_wt_suffix}/wo/woWtRkMeasure/data",
				getUrl:"${ctx}/wo-wt${wo_wt_suffix}/wo/woWtRkMeasure/get",
				saveUrl:"${ctx}/wo-wt${wo_wt_suffix}/wo/woWtRkMeasure/save",
				removeUrl:"${ctx}/wo-wt${wo_wt_suffix}/wo/woWtRkMeasure/remove",
				exportUrl:"${ctx}/wo-wt${wo_wt_suffix}/wo/woWtRkMeasure/export"
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
						id: 'a.exit_require',
						label: '保护/退出要求',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_cause',
						label: '保护/退出原因',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_condition',
						label: '退出执行情况',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_permit_date',
						label: '许可退出时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_permit_by',
						label: '工作许可人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_permit_by_name',
						label: '工作许可人名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_work_leader',
						label: '退出工作负责人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_work_leader_name',
						label: '退出工作负责人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_finish_date',
						label: '退出完成时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_operator',
						label: '退出操作人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_operator_name',
						label: '退出操作人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_guardian',
						label: '退出监护人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.exit_guardian_name',
						label: '退出监护人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_condition',
						label: '投入情况',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_permit_date',
						label: '投入许可投入时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_permit_by',
						label: '投入许可人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_permit_by_name',
						label: '投入许可人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_work_leader',
						label: '投入工作负责人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_work_leader_name',
						label: '投入工作负责人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_finish_date',
						label: '投入完成时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_operator',
						label: '投入操作人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_operator_name',
						label: '投入操作人',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_guardian',
						label: '投入监护人id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.into_guardian_name',
						label: '投入监护人',
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
			]
	);
   loadWindow();
   //////////操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){

   }
</script>
</body>
</html>