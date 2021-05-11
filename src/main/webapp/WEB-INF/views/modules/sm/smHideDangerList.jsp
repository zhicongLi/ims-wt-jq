<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>隐患</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SmHideDanger" permissionEdit="sm:smHideDanger:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-treegrid" style="width:100%;height:100%;"
			 url="${ctx}/ims-check${ims_check_suffix}/sm/smHideDanger/allData" idField="id"
			 parentField="parentId" resultAsTree="false" showTreeIcon="true" treeColumn="name"
			 expandOnLoad="0" treeColumn="name" allowDrag="true" allowDrop="true" allowLeafDropIn="true"
			 allowResize="true" pageSize="100" autoLoad="false"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false" virtualScroll="true"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
				<div name="action" width="120" headerAlign="center" align="center"
						renderer="onTreeActionRenderer" cellStyle="padding:0;">操作</div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createByName" field="createByName" vtype=""   headerAlign="center" allowSort="true" width="64" >创建人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="tenantId" field="tenantId" vtype=""   headerAlign="center" allowSort="true" width="64" >租户id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="tenantId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createBy" field="createBy" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createDept" field="createDept" vtype=""   headerAlign="center" allowSort="true" width="64" >创建部门
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createDept-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createDate"  field="createDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >创建时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateByName" field="updateByName" vtype=""   headerAlign="center" allowSort="true" width="64" >修改人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="updateByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateBy" field="updateBy" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="64" >修改人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateDate"  field="updateDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >修改时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="siteId" field="siteId" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="64" >站点id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="siteId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkId" field="checkId" vtype=""   headerAlign="center" allowSort="true" width="64" >安全检查id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkQuestionId" field="checkQuestionId" vtype=""   headerAlign="center" allowSort="true" width="64" >安全检查问题id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkQuestionId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="title" field="title" vtype=""   headerAlign="center" allowSort="true" width="255" >隐患名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="title-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="reportBy" field="reportBy" vtype=""   headerAlign="center" allowSort="true" width="64" >发现人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="reportBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="reportByName" field="reportByName" vtype=""   headerAlign="center" allowSort="true" width="64" >发现人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="reportByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="reportDate" field="reportDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >发现时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="reportDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="types" field="types" vtype=""   headerAlign="center" allowSort="true" width="64" >隐患类型
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="types-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="levels" field="levels" vtype=""   headerAlign="center" allowSort="true" width="64" >隐患级别
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="levels-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="orgLevel" field="orgLevel" vtype=""   headerAlign="center" allowSort="true" width="64" >级别
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="orgLevel-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="respDeptId" field="respDeptId" vtype=""   headerAlign="center" allowSort="true" width="64" >责任部门
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="respDeptId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="respDeptName" field="respDeptName" vtype=""   headerAlign="center" allowSort="true" width="64" >责任部门名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="respDeptName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="respId" field="respId" vtype=""   headerAlign="center" allowSort="true" width="64" >责任人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="respId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="respName" field="respName" vtype=""   headerAlign="center" allowSort="true" width="64" >责任人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="respName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="appBy" field="appBy" vtype=""   headerAlign="center" allowSort="true" width="64" >审批人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="appBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="appName" field="appName" vtype=""   headerAlign="center" allowSort="true" width="64" >审批人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="appName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="appDate" field="appDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >审批时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="appDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="measure" field="measure" vtype=""   headerAlign="center" allowSort="true" width="500" >治理措施
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="measure-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="result" field="result" vtype=""   headerAlign="center" allowSort="true" width="64" >治理结果
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="result-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="handleBy" field="handleBy" vtype=""   headerAlign="center" allowSort="true" width="64" >治理人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="handleBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="handleByName" field="handleByName" vtype=""   headerAlign="center" allowSort="true" width="64" >治理人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="handleByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="handleDate" field="handleDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >治理时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="handleDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="handleNote" field="handleNote" vtype=""   headerAlign="center" allowSort="true" width="500" >治理说明
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="handleNote-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkOpinion" field="checkOpinion" vtype=""   headerAlign="center" allowSort="true" width="64" >验收意见
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkOpinion-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkBy" field="checkBy" vtype=""   headerAlign="center" allowSort="true" width="64" >验收人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkByName" field="checkByName" vtype=""   headerAlign="center" allowSort="true" width="64" >验收人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkDate" field="checkDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >验收时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkNote" field="checkNote" vtype=""   headerAlign="center" allowSort="true" width="500" >验收记录
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkNote-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="status" field="status" vtype=""   headerAlign="center" allowSort="true" width="64" >状态
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="status-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
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
			    objId:"SmHideDanger",
				dataUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smHideDanger/allData",
				getUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smHideDanger/get",
				saveUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smHideDanger/save",
				removeUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smHideDanger/remove",
				exportUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smHideDanger/export"
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
						id: 'a.remarks',
						label: '备注',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.check_id',
						label: '安全检查id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.check_question_id',
						label: '安全检查问题id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.title',
						label: '隐患名称',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.report_by',
						label: '发现人id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.report_by_name',
						label: '发现人名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.report_date',
						label: '发现时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.types',
						label: '隐患类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.levels',
						label: '隐患级别',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.org_level',
						label: '级别',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.resp_dept_id',
						label: '责任部门',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.resp_dept_name',
						label: '责任部门名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.resp_id',
						label: '责任人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.resp_name',
						label: '责任人名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.app_by',
						label: '审批人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.app_name',
						label: '审批人名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.app_date',
						label: '审批时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.measure',
						label: '治理措施',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.result',
						label: '治理结果',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.handle_by',
						label: '治理人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.handle_by_name',
						label: '治理人名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.handle_date',
						label: '治理时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.handle_note',
						label: '治理说明',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.check_opinion',
						label: '验收意见',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.check_by',
						label: '验收人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.check_by_name',
						label: '验收人名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.check_date',
						label: '验收时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.check_note',
						label: '验收记录',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.status',
						label: '状态',
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