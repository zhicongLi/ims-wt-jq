<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>日志管理</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="mini-fit">
<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysOpLog" permissionEdit="sys:sysOpLog:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysOpLog/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false" >编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
							<div name="objId"  field="objId" vtype=""  headerAlign="center" allowSort="true" width="64" >业务对象
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="objId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged"
								/>
							</div>
							<div name="opKey"  field="opKey" vtype=""  headerAlign="center" allowSort="true" width="150" >业务主键
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="opKey-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged"
								/>
							</div>
							<div name="valueNew"  field="valueNew" vtype=""  headerAlign="center" allowSort="true" width="120" >修改后
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="valueNew-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged"
								/>
							</div>
							<div name="valueOld"  field="valueOld" vtype=""  headerAlign="center" allowSort="true" width="120" >修改前
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="valueOld-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged"
								/>
							</div>
							<div name="opText"  field="opText" vtype=""  headerAlign="center" allowSort="true" width="120" >内容
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
							<div name="opField"  field="opField" vtype=""  headerAlign="center" allowSort="true" width="150" >字段
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="opField-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged"
								/>
							</div>
							<div name="logType"  field="logType" vtype=""  headerAlign="center" allowSort="true" width="150" displayField="logTypeName">操作类型
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="logType-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;" showNullItem="true"
					   valueField="value"  textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_op_log_log_type"	   onvaluechanged="onFilterChanged"
				/>
							</div>
							<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建者
							</div>
							<div name="createDate"  field="createDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >创建时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
							</div>
							<div name="note"  field="note" vtype=""  headerAlign="center" allowSort="true" width="200" >备注
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysOpLog:edit"></sys:toolbarformmain>
		<div class="mini-fit">
				<div id="editform" class="form" style="width:100%;height:400px;">
						<input class="mini-hidden" name="id" id="id"/>
						<table border="0" cellpadding="3" cellspacing="3" >
							<tr>
								<td style="text-align:right;">业务对象：</td>
								<td>
								   <input name="objId" id="objId" class="mini-textbox"  vtype = ""  required="false" />
								</td>
							</tr>
							<tr>
								<td style="text-align:right;">业务主键：</td>
								<td>
								   <input name="opKey" id="opKey"  class="mini-textbox"  vtype = "" required="false" />
								</td>

							</tr>
							
							
							<tr>
								<td style="text-align:right;">内容：</td>
								<td>
								   <input name="opText" id="opText" class="mini-textbox"  vtype = ""  required="false" />
								</td>
							</tr>
							<tr>
								<td style="text-align:right;">字段：</td>
								<td>
								   <input name="opField" id="opField"  class="mini-textbox"  vtype = "" required="false" />
								</td>

							</tr>
							<tr>
								<td style="text-align:right;">创建者id：</td>
								<td>
								   <input name="createBy" id="createBy" class="mini-textbox asLabel"  readonly="true"/>
								</td>
							</tr>
							<tr>
								<td style="text-align:right;">创建者：</td>
								<td>
								   <input name="createName" id="createName" class="mini-textbox asLabel" readonly="true"/>
								</td>
							</tr>
							<tr>
								<td style="text-align:right;">创建时间：</td>
								<td>
								   <input name="createDate" id="createDate" format="yyyy-MM-dd HH:mm:ss"  class="mini-datepicker" vtype = "" required="false"/>
								</td>
							</tr>
							<tr>
								<td style="text-align:right;">修改前：</td>
								<td >
								<textarea name="valueOld" id="valueOld" class="mini-textarea"  vtype = "" required="false" width="600px" height="50px" ></textarea>
								</td>
							</tr>
							
							<tr>
								<td style="text-align:right;">修改后：</td>
								<td >
									<textarea name="valueNew" id="valueNew" class="mini-textarea"  vtype = "" required="false" width="600px" height="50px" ></textarea>
								</td>
							</tr>
							<tr>
								<td style="text-align:right;">备注：</td>
								<td >
								   <textarea name="note" id="note" class="mini-textarea"  vtype = "" required="false" width="600px" height="50px" ></textarea>
								</td>

							</tr>

						</table>
				</div>
		        <div class="mini-fit">
						 <div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
						 </div>
		        </div><!--fit-->

	     </div><!--fit-->

	</div>

</div>
</div>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysOpLog",
			    masterKeyField:"",
				dataUrl:"${ctx}/sys/sysOpLog/data",
				getUrl:"${ctx}/sys/sysOpLog/get",
				saveUrl:"${ctx}/sys/sysOpLog/save",
				removeUrl:"${ctx}/sys/sysOpLog/remove",
				exportUrl:"${ctx}/sys/sysOpLog/export",
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [

	                   ]

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
						id: 'a.obj_id',
						label: '业务对象',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.op_key',
						label: '业务主键',
						type: 'string',
						default_value: '',
						size: 150
					}
					,{
						id: 'a.value_new',
						label: '修改后',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.value_old',
						label: '修改前',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.op_text',
						label: '内容',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.op_field',
						label: '字段',
						type: 'string',
						default_value: '',
						size: 150
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
						size: 120
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
						id: 'a.note',
						label: '备注',
						type: 'string',
						default_value: '',
						size: 200
					}
			]
	);
   loadWindow();
   //////////表格操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){

   }
   //////////form操作菜单项点击事件方法/////////
   function onFormOpMiClick(e){

   }
   //////////子表格操作菜单项点击事件方法/////////

</script>
</body>
</html>