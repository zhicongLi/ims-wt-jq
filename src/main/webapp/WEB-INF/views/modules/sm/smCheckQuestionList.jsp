<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全检查问题</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SmCheckQuestion"  permissionEdit="sm:smCheckQuestion:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/data" idField="id"
			 allowResize="true" pageSize="20"
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
					<div name="createByName" field="createByName" vtype=""   headerAlign="center" allowSort="true" width="64" >创建人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="tenantId" field="tenantId" vtype=""   headerAlign="center" allowSort="true" width="64" >租户id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="tenantId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createBy" field="createBy" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createDept" field="createDept" vtype=""   headerAlign="center" allowSort="true" width="64" >创建部门
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createDept-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createDate"  field="createDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >创建时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateByName" field="updateByName" vtype=""   headerAlign="center" allowSort="true" width="64" >修改人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="updateByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateBy" field="updateBy" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="64" >修改人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateDate"  field="updateDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >修改时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="siteId" field="siteId" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="64" >站点id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="siteId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="checkId" field="checkId" vtype=""   headerAlign="center" allowSort="true" width="64" >安全检查id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="checkId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="reportBy" field="reportBy" vtype=""   headerAlign="center" allowSort="true" width="64" >发现人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="reportBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="reportByName" field="reportByName" vtype=""   headerAlign="center" allowSort="true" width="64" >发现人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="reportByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="reportDept" field="reportDept" vtype=""   headerAlign="center" allowSort="true" width="64" >发现部门id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="reportDept-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="reportDeptName" field="reportDeptName" vtype=""   headerAlign="center" allowSort="true" width="64" >发现部门名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="reportDeptName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="reportDate" field="reportDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >发现时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="reportDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="descrs" field="descrs" vtype=""   headerAlign="center" allowSort="true" width="500" >问题描述
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="descrs-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="dealBy" field="dealBy" vtype=""   headerAlign="center" allowSort="true" width="64" >处理人
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="dealBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="dealByName" field="dealByName" vtype=""   headerAlign="center" allowSort="true" width="64" >处理人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="dealByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="dealDept" field="dealDept" vtype=""   headerAlign="center" allowSort="true" width="64" >处理部门
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="dealDept-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="dealDeptName" field="dealDeptName" vtype=""   headerAlign="center" allowSort="true" width="64" >处理部门名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="dealDeptName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="dealDate" field="dealDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >处理时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="dealDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="dealNote" field="dealNote" vtype=""   headerAlign="center" allowSort="true" width="500" >处理说明
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="dealNote-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="types" field="types" vtype=""   headerAlign="center" allowSort="true" width="64" >类型
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="types-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"SmCheckQuestion",
				dataUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/data",
				getUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/get",
				saveUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/save",
				removeUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/remove",
				exportUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/export"
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
						id: 'a.report_by',
						label: '发现人',
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
						id: 'a.report_dept',
						label: '发现部门id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.report_dept_name',
						label: '发现部门名称',
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
						id: 'a.descrs',
						label: '问题描述',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.deal_by',
						label: '处理人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.deal_by_name',
						label: '处理人名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.deal_dept',
						label: '处理部门',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.deal_dept_name',
						label: '处理部门名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.deal_date',
						label: '处理时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.deal_note',
						label: '处理说明',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.types',
						label: '类型',
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