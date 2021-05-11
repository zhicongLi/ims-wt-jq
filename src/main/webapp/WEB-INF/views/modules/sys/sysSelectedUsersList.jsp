<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>常选用户</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysSelectedUsers"  permissionEdit="sys:sysSelectedUsers:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysSelectedUsers/data" idField="id"
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
					<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建者
						<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createDate"  field="createDate"  vtype="required" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >创建时间
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
					<div name="updateDate"  field="updateDate"  vtype="required" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >更新时间
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
					<div name="userLoginName" field="userLoginName" vtype=""   headerAlign="center" allowSort="true" width="64" >用户登录名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="userLoginName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="userName" field="userName" vtype=""   headerAlign="center" allowSort="true" width="255" >用户名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="userName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="selectedUserId" field="selectedUserId" vtype=""   headerAlign="center" allowSort="true" width="64" >被选用户编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="selectedUserId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="selectedUserLoginName" field="selectedUserLoginName" vtype=""   headerAlign="center" allowSort="true" width="64" >被选用户登录名
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="selectedUserLoginName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="selectedUserName" field="selectedUserName" vtype=""   headerAlign="center" allowSort="true" width="255" >被选用户名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="selectedUserName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="tmp1" field="tmp1" vtype=""   headerAlign="center" allowSort="true" width="64" >临时字段1
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="tmp1-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="tmp2" field="tmp2" vtype=""   headerAlign="center" allowSort="true" width="64" >临时字段2
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="tmp2-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="tmp3" field="tmp3" vtype=""   headerAlign="center" allowSort="true" width="64" >临时字段3
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="tmp3-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="type" field="type" vtype=""   headerAlign="center" allowSort="true" width="64" >类型
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="type-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"SysSelectedUsers",
				dataUrl:"${ctx}/sys/sysSelectedUsers/data",
				getUrl:"${ctx}/sys/sysSelectedUsers/get",
				saveUrl:"${ctx}/sys/sysSelectedUsers/save",
				removeUrl:"${ctx}/sys/sysSelectedUsers/remove",
				exportUrl:"${ctx}/sys/sysSelectedUsers/export"
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
						id: 'a.remarks',
						label: '备注信息',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.user_id',
						label: '用户编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.user_login_name',
						label: '用户登录名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.user_name',
						label: '用户名称',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.selected_user_id',
						label: '被选用户编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.selected_user_login_name',
						label: '被选用户登录名',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.selected_user_name',
						label: '被选用户名称',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.tmp1',
						label: '临时字段1',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.tmp2',
						label: '临时字段2',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.tmp3',
						label: '临时字段3',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.type',
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