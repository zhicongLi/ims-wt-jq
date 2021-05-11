<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>高级查询</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp" %>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div class="mini-fit">
<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >


			 <sys:toolbargridmain objId="SysQuery" permissionEdit="sys:sysQuery:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/ims-ext/sys/sysQuery/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true"
				>
					<div property="columns">
						<div name="action" width="80"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" >编码
								<input property="editor" class="mini-textbox" style="width:100%;"  />
							</div>
							<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="true" width="100" >名称
								<input property="editor" class="mini-textbox" style="width:100%;"  />
								<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged"
								/>
							</div>
							<div name="descr"  field="descr" vtype=""  headerAlign="center" allowSort="true" width="64" >描述
								<input property="editor" class="mini-textarea" style="width:100%;"  />
								<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged"
								/>
							</div>
							<div type="checkboxcolumn"  name="isShow"  field="isShow" vtype="" headerAlign="center" allowSort="true" width="70" >是否显示
								<input property="editor" class="mini-textbox" style="width:100%;"  />
								<input id="isShow-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged"
								/>
							</div>
							<div type="checkboxcolumn"  name="isActive"  field="isActive" vtype="" headerAlign="center" allowSort="true" width="70" >是否启用
								<input property="editor" class="mini-textbox" style="width:100%;"  />
							</div>
							<div name="objId"  field="objId" vtype=""  headerAlign="center" allowSort="true" width="64" >对象编码
								<input property="editor" class="mini-textbox" style="width:100%;"  />
								<input id="objId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged"
								/>
							</div>
							<div name="siteId"  field="siteId" vtype=""  headerAlign="center" allowSort="true" width="64" >域编码
								<input property="editor" class="mini-textbox" style="width:100%;"  />
							</div>
							<div name="seqNo"  field="seqNo" vtype=""  headerAlign="center" allowSort="true" width="80" >显示序号
								<input property="editor" class="mini-textbox" style="width:100%;"  />
							</div>
							<div name="sqlWhere"  field="sqlWhere" vtype=""  headerAlign="center" allowSort="true" width="2000" >Where语句
								<input property="editor" class="mini-textarea" style="width:100%;"  />
							</div>
							<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建者
							</div>
							<div name="createDate"  field="createDate" readOnly="true" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true" width="70" >创建时间
							</div>
							<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >更新者
							</div>
							<div name="updateDate"  field="updateDate" readOnly="true" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true" width="70" >更新时间
							</div>
							<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="255" >备注信息
								<input property="editor" class="mini-textarea" style="width:100%;"  />
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysQuery:edit"></sys:toolbarformmain>
		<div class="mini-fit">
		<div id="editform" class="form" style="width:100%;height:100%;">
			    <input class="mini-hidden" name="id" id="id"/>
				<table  border="0" cellpadding="3" cellspacing="3" >
					<tr>
						<td style="text-align:right;">名称：</td>
						<td >
						   <input name="name" id="name"   class="mini-textbox" vtype = ""  required="true" />
						</td>
						<td style="text-align:right;">对象编码：</td>
						<td>
							<input name="objId" id="objId"  class="mini-textbox" vtype = ""  required="true" />
						</td>
				    </tr>
					<tr>
						<td style="text-align:right;">是否显示：</td>
						<td >
						   <input name="isShow" id="isShow" class="mini-checkbox" trueValue="1" falseValue="0" vtype = ""  required="false" />
						</td>
						<td style="text-align:right;">是否启用：</td>
						<td >
						   <input name="isActive" id="isActive"  class="mini-checkbox" trueValue="1" falseValue="0" vtype = "" required="false"/>
						</td>

				    </tr>
					<tr>
						<td style="text-align:right;">Where语句：</td>
						<td colspan="3">
							<input name="sqlWhere" id="sqlWhere" width="300px"  class="mini-textarea"  vtype = "" required="true"/>
						</td>


				    </tr>
					<tr>

						<td style="text-align:right;">描述：</td>
						<td colspan="3">
							<input name="descr" id="descr"  width="300px"  class="mini-textarea"  vtype = "" required="false"/>
						</td>
				    </tr>

					<tr>
						<td style="text-align:right;">备注信息：</td>
						<td colspan="3">
						   <input name="remarks" id="remarks" width="300px"   class="mini-textarea" vtype = ""  required="false"  />
						</td>

				    </tr>

					<tr>
					</tr>
				</table>
		        <div class="mini-fit">
						 <div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
								<div title="用户" id="tabSysQueryUserList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSysQueryUser" permissionEdit="sys:sysQueryUser:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSysQueryUser" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-ext/sys/sysQueryUser/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>
											<div name="query_id" hideable="true" visible="false"  field="query_id" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div name="id"  field="id" readOnly="true"  vtype="required" headerAlign="center" allowSort="true" width="64" >编码
												<input property="editor" class="mini-textbox" style="width:100%;"  />
											</div>
											<div name="name"  field="name"   vtype="" headerAlign="center" allowSort="true" width="100" >名称
												<input property="editor" class="mini-textbox" style="width:100%;"  />
												<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChanged"
												/>
											</div>
											<div type="checkboxcolumn"  name="isActive"  field="isActive"   vtype="" headerAlign="center" allowSort="true" width="70" >是否启用

											</div>
											<div name="siteId"  field="siteId"   vtype="" headerAlign="center" allowSort="true" width="64" >域编码
												<input property="editor" class="mini-textbox" style="width:100%;"  />
											</div>
											<div name="roleId"  field="roleId"   vtype="" headerAlign="center" allowSort="true" width="64" >角色编码
												<input property="editor" class="mini-textbox" style="width:100%;"  />
											</div>


										</div>
									</div>
								 </div>
							  </div>
						 </div>
		        </div><!--fit-->
	     </div>
	     </div><!--fit-->

	</div>

</div>
</div>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">
	initBase(
			{   id:"datagridMain",
			    objId:"SysQuery",
			    masterKeyField:"id",
				dataUrl:"${ctx}/ims-ext/sys/sysQuery/data",
				getUrl:"${ctx}/ims-ext/sys/sysQuery/get",
				saveUrl:"${ctx}/ims-ext/sys/sysQuery/save",
				removeUrl:"${ctx}/ims-ext/sys/sysQuery/remove",
				exportUrl:"${ctx}/ims-ext/sys/sysQuery/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,[
											{
												id:"gridSysQueryUser",
												FK:"queryId",
												cascade:false,
												dataUrl:"${ctx}/ims-ext/sys/sysQueryUser/data",
												getUrl:"${ctx}/ims-ext/sys/sysQueryUser/get",
												saveUrl:"${ctx}/ims-ext/sys/sysQueryUser/save",
												removeUrl:"${ctx}/ims-ext/sys/sysQueryUser/remove",
												exportUrl:"${ctx}/ims-ext/sys/sysQueryUser/export"
											}

										]);

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
						id: 'a.name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.descr',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.is_show',
						label: '是否显示',
						type: 'string',
						default_value: '',
						size: 70
					}
					,{
						id: 'a.is_active',
						label: '是否启用',
						type: 'string',
						default_value: '',
						size: 70
					}
					,{
						id: 'a.obj_id',
						label: '对象编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.site_id',
						label: '域编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.seq_no',
						label: '显示序号',
						type: 'string',
						default_value: '',
						size: 11
					}
					,{
						id: 'a.sql_where',
						label: 'Where语句',
						type: 'string',
						default_value: '',
						size: 2000
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
						size: 70
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
						size: 70
					}
					,{
						id: 'a.remarks',
						label: '备注信息',
						type: 'string',
						default_value: '',
						size: 255
					}
			]
	);
	loadWindow();
</script>
</body>
</html>