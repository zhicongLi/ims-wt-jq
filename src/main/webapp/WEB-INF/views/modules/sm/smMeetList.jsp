<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>安全会议</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SmMeet"  permissionEdit="sm:smMeet:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/ims-meet${ims_meet_suffix}/sm/smMeet/data" idField="id"
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
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="200" >备注
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createComp" field="createComp" vtype=""   headerAlign="center" allowSort="true" width="64" >创建人公司
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createComp-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="seqNo" field="seqNo" vtype=""   headerAlign="center" allowSort="true" width="100" >排序
						<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
						<input id="seqNo-Filter" name="mini-column-filter"  property="filter" class="mini-spinner" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="200" >会议名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="meetType" field="meetType" vtype=""   headerAlign="center" allowSort="true" width="64" >会议类别
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="meetType-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="room" field="room" vtype=""   headerAlign="center" allowSort="true" width="64" >会议室
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="room-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="startTime" field="startTime" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >会议开始时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="startTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="endTime" field="endTime" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >会议结束时间
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="endTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="hostBy" field="hostBy" vtype=""   headerAlign="center" allowSort="true" width="64" >主持人id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="hostBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="hostByName" field="hostByName" vtype=""   headerAlign="center" allowSort="true" width="200" >主持人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="hostByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="hostOrgId" field="hostOrgId" vtype=""   headerAlign="center" allowSort="true" width="64" >组织部门
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="hostOrgId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="hostOrgName" field="hostOrgName" vtype=""   headerAlign="center" allowSort="true" width="200" >组织部门名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="hostOrgName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="content"  field="content" vtype=""   headerAlign="center" allowSort="true" width="100" >会议内容
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="content-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="status" field="status" vtype=""   headerAlign="center" allowSort="true" width="64" >状态
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="status-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="moduleType" field="moduleType" vtype=""   headerAlign="center" allowSort="true" width="64" >模块类型
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="moduleType-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"SmMeet",
				dataUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeet/data",
				getUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeet/get",
				saveUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeet/save",
				removeUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeet/remove",
				exportUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeet/export"
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
						size: 200
					}
					,{
						id: 'a.create_comp',
						label: '创建人公司',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.seq_no',
						label: '排序',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.name',
						label: '会议名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.meet_type',
						label: '会议类别',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.room',
						label: '会议室',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.start_time',
						label: '会议开始时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.end_time',
						label: '会议结束时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.host_by',
						label: '主持人id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.host_by_name',
						label: '主持人名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.host_org_id',
						label: '组织部门',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.host_org_name',
						label: '组织部门名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.content',
						label: '会议内容',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.status',
						label: '状态',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.module_type',
						label: '模块类型',
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