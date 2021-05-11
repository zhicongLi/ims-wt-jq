<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>日志</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysLog"  permissionEdit="sys:sysLog:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/ims-log${ims_log_suffix}/sys/sysLog/data" idField="id"
			 allowResize="true" pageSize="20"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="100" >编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createByName" field="createByName" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="100" >创建人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
					<div name="updateByName" field="updateByName" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="100" >修改人名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="updateByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateBy" field="updateBy" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="100" >修改人
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
					<div name="createDept" field="createDept" vtype=""   headerAlign="center" allowSort="true" width="100" >创建部门
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createDept-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createDeptName" field="createDeptName" vtype=""   headerAlign="center" allowSort="true" width="100" >创建部门名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createDeptName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createCompany" field="createCompany" vtype=""   headerAlign="center" allowSort="true" width="100" >创建公司
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createCompany-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createCompanyName" field="createCompanyName" vtype=""   headerAlign="center" allowSort="true" width="100" >创建公司名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="createCompanyName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="sysName" field="sysName" vtype=""   headerAlign="center" allowSort="true" width="100" >系统名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="sysName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="module" field="module" vtype=""   headerAlign="center" allowSort="true" width="100" >模块
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="module-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="detail" field="detail" vtype=""   headerAlign="center" allowSort="true" width="100" >日志调用详细位置
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="detail-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="content"  field="content" vtype=""   headerAlign="center" allowSort="true" width="100" >日志内容
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="content-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="location" field="location" vtype=""   headerAlign="center" allowSort="true" width="100" >位置
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="location-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="client" field="client" vtype=""   headerAlign="center" allowSort="true" width="100" >客户端
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="client-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="ip" field="ip" vtype=""   headerAlign="center" allowSort="true" width="100" >IP
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="ip-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"SysLog",
				dataUrl:"${ctx}/ims-log${ims_log_suffix}/sys/sysLog/data",
				getUrl:"${ctx}/ims-log${ims_log_suffix}/sys/sysLog/get",
				saveUrl:"${ctx}/ims-log${ims_log_suffix}/sys/sysLog/save",
				removeUrl:"${ctx}/ims-log${ims_log_suffix}/sys/sysLog/remove",
				exportUrl:"${ctx}/ims-log${ims_log_suffix}/sys/sysLog/export"
			 }
	       );

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: '编码',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.create_by_name',
						label: '创建人名称',
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
						id: 'a.update_by_name',
						label: '修改人名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.update_by',
						label: '修改人',
						type: 'string',
						default_value: '',
						size: 100
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
						id: 'a.create_dept',
						label: '创建部门',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.create_dept_name',
						label: '创建部门名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.create_company',
						label: '创建公司',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.create_company_name',
						label: '创建公司名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.sys_name',
						label: '系统名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.module',
						label: '模块',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.detail',
						label: '日志调用详细位置',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.content',
						label: '日志内容',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.location',
						label: '位置',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.client',
						label: '客户端',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.ip',
						label: 'IP',
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