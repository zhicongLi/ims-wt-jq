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

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SmMeet" permissionEdit="sm:smMeet:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/ims-meet${ims_meet_suffix}/sm/smMeet/data" idField="id"
					 allowResize="true" pageSize="20"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>

							<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="true" width="200" >会议名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>

						<div type="comboboxcolumn" autoShowPopup="true" name="meetType"  field="meetType" headerAlign="center" allowSort="true" width="120" >会议类别
							<input property="editor" class="mini-combobox"  textField="label" valueField="value"  style="width:100%;"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_meet_type" />
							<input
									id="meetType-Filter" name="mini-column-filter"
									property="filter" class="mini-combobox" style="width: 100%;"
									url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_meet_type"
									multiSelect="true" style="width: 100%;"
									onvaluechanged="onFilterChanged" valueField="value"
									textField="label" showClose="true"
									oncloseclick="onFilterClose(this)" />
						</div>

							<div name="startTime"  field="startTime" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >会议开始时间
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="startTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>


							<div name="hostOrgName"  field="hostOrgName" vtype=""  headerAlign="center" allowSort="true" width="200" >组织部门名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="hostOrgName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>

				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sm:smMeet:edit"></sys:toolbarformmain>
                  <div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
									<input class="mini-hidden" name="id" id="id"/>
									<input class="mini-hidden" name="hostByName" id="hostByName"/><%--主持人名称--%>
									<input class="mini-hidden" name="hostOrgName" id="hostOrgName"/><%--组织部门名称--%>
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
											<td style="text-align:right;">会议名称：</td>
											<td>
											   <input name="name" id="name" class="mini-textbox"   vtype = "" required="false" />
											</td>
											<td style="text-align:right;">会议类别：</td>
											<td>
												<input name="meetType" id="meetType"  class="mini-combobox" vtype = "" required="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_meet_type" />

											</td>
											<td style="text-align:right;">会议室：</td>
											<td>
												<input name="room" id="room"  class="mini-combobox" vtype = "" required="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_meet_room" />

											</td>

										</tr>
										<tr>
											<td style="text-align:right;">会议开始时间：</td>
											<td>
<%--
											   <input name="startTime" id="startTime" class="mini-textbox"  vtype = ""  required="false" />
--%>											   <input name="startTime" id="startTime" class="mini-datepicker" format="yyyy-MM-dd H:mm:ss" timeFormat="H:mm:ss" showTime="true"  vtype = ""  required="false" />
                                            </td>

										<%--	<td style="text-align:right;">主持人名称：</td>
											<td>
											   <input name="hostByName" id="hostByName" class="mini-textbox"   vtype = "" required="false" />
											</td>--%>
											<td style="text-align:right;">主持人名称：</td>
											<td>
												<input name="hostBy" id="hostBy" textName="hostByName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
													   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smUserList',850,500,'id,name','reportBy,hostByName')"   />
											</td>
											<%--<td style="text-align:right;">组织部门名称：</td>
											<td>
											   <input name="hostOrgName" id="hostOrgName" class="mini-textbox"   vtype = "" required="false" />
											</td>--%>
											<td style="text-align:right;">组织部门名称：</td>
											<td>
												<input name="hostOrgId" id="hostOrgId" textName="hostOrgName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
													   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smOrgList',850,500,'id,name','hostOrgId,hostOrgName')"   />
											</td>

										</tr>
										<tr style="width: 400%">
											<td style="text-align:right;">会议内容：</td>
											<td>
											   <input name="content" id="content" class="mini-textarea" width="400%" vtype = ""  required="false"  />
											</td>


										</tr>


										<tr>
										</tr>
									</table>
				                </div> <!--panel-->
				            </div> <!--mini-col-->
				        </div> <!--clearfix-->
				     </div> <!--container-->
				  </div> <!--editform-->
		        <div class="mini-fit">
						 <div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
								<div title="安全会议任务" name="tabSmMeetTaskList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSmMeetTask" permissionEdit="sm:smMeetTask:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSmMeetTask" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-meet${ims_meet_suffix}/sm/smMeetTask/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>

											<div name="content"  field="content"  vtype="" headerAlign="center" allowSort="true" width="500" >工作任务内容
												<input property="editor" class="mini-textarea" style="width:100%;"  />
												<input id="content-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmMeetTask')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmMeetTask')"
												/>
											</div>

											<div name="respOrgId"  field="respOrgId"   vtype="" headerAlign="center" allowSort="true"  width="200" visible="false">责任部门id
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="respOrgId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmMeetTask')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmMeetTask')"
												/>
											</div>
											<div name="respOrgName"  field="respOrgName"   vtype="" headerAlign="center" allowSort="true"  width="160" displayField="respOrgName">责任部门
												<input property="editor"   textName="respOrgName" class="mini-buttonedit"
													   style="width:100%;"  vtype = ""  required="false" width="180px" allowInput="false"
													   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smOrgList',850,500,'id,name','respOrgId,respOrgName','gridSmMeetTask')"   />
												<input id="respOrgName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmMeetTask')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmMeetTask')"
												/>
											</div>
											<div name="requiredTime"  field="requiredTime"  dateFormat="yyyy-MM-dd HH:mm:ss" vtype="" headerAlign="center" allowSort="true"  width="100" >要求完成时间
												<input property="editor" class="mini-datepicker" format="yyyy-MM-dd H:mm:ss" timeFormat="H:mm:ss" showTime="true"  style="width:100%;"  />
												<input id="requiredTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmMeetTask')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmMeetTask')"
												/>
											</div>
											<div name="note"  field="note"   vtype="" headerAlign="center" allowSort="true"  width="200" >完成说明
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="note-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmMeetTask')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmMeetTask')"
												/>
											</div>
											<div name="actEndTime"  field="actEndTime"  dateFormat="yyyy-MM-dd HH:mm:ss" vtype="" headerAlign="center" allowSort="true"  width="100" >实际完成时间
												<input property="editor" class="mini-datepicker" format="yyyy-MM-dd H:mm:ss" timeFormat="H:mm:ss" showTime="true"   style="width:100%;"  />
												<input id="actEndTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmMeetTask')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmMeetTask')"
												/>
											</div>

											<div name="meetId" hideable="false" visible="false"  field="meetId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>


										</div>
									</div>
								 </div>
							  </div>
								<div title="安全会议签到" name="tabSmMeetAttendenceList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSmMeetAttendence" permissionEdit="sm:smMeetAttendence:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSmMeetAttendence" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-meet${ims_meet_suffix}/sm/smMeetAttendence/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>


											<div name="attendUserId"  field="attendUserId"   vtype="" headerAlign="center" allowSort="true"  width="200" visible="false">用户名称id
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="attendUserId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmMeetAttendence')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmMeetAttendence')"
												/>
											</div>
											<div name="attendUserName"  field="attendUserName"   vtype="" headerAlign="center" allowSort="true"  width="160" displayField="attendUserName">用户名称
												<input property="editor"   textName="attendUserName" class="mini-buttonedit"
													   style="width:100%;"  vtype = ""  required="false" width="180px" allowInput="false"
													   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smUserList',850,500,'id,name','attendUserId,attendUserName','gridSmMeetAttendence')"   />
												<input id="attendUserName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmMeetAttendence')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmMeetAttendence')"
												/>
											</div>
											<div name="signTime"  field="signTime"  dateFormat="yyyy-MM-dd HH:mm:ss" vtype="" headerAlign="center" allowSort="true"  width="100" >签到时间
												<input property="editor" class="mini-datepicker" format="yyyy-MM-dd H:mm:ss" timeFormat="H:mm:ss" showTime="true"   style="width:100%;"  />
												<input id="signTime-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmMeetAttendence')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmMeetAttendence')"
												/>
											</div>
											<div name="meetId" hideable="true" visible="false"  field="meetId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>



										</div>
									</div>
								 </div>
							  </div>
						 </div>
		        </div><!--fit-->

	    </div>

   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SmMeet",
			    masterKeyField:"id",
				dataUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeet/data",
				getUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeet/get",
				saveUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeet/save",
				removeUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeet/remove",
				exportUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeet/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                    {
		                 id:"gridSmMeetTask",
		                 objId:"SmMeetTask",
		                 FK:"meetId",
		                 cascade:true,
		                 cascadeVisible:true,
		                 tabName:"tabSmMeetTaskList",
						 dataUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeetTask/data",
						 getUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeetTask/get",
						 saveUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeetTask/save",
						 removeUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeetTask/remove",
						 exportUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeetTask/export"
	                    }
	                    ,{
		                 id:"gridSmMeetAttendence",
		                 objId:"SmMeetAttendence",
		                 FK:"meetId",
		                 cascade:true,
		                 cascadeVisible:true,
		                 tabName:"tabSmMeetAttendenceList",
						 dataUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeetAttendence/data",
						 getUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeetAttendence/get",
						 saveUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeetAttendence/save",
						 removeUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeetAttendence/remove",
						 exportUrl:"${ctx}/ims-meet${ims_meet_suffix}/sm/smMeetAttendence/export"
	                    }
	                   ]
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
   //////////表格操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }

   }
   //////////form操作菜单项点击事件方法/////////
   function onFormOpMiClick(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }
   }
   //////////子表格操作菜单项点击事件方法/////////
   function onGridSubOpMiClick_SmMeetTask(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }
   }
   function onGridSubOpMiClick_SmMeetAttendence(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }
   }

</script>
</body>
</html>