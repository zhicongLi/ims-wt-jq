<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>安全目标库</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SmGoalItemLib" permissionEdit="sm:smGoalItemLib:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLib/data" idField="id"
					 allowResize="true" pageSize="20"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>


							<div name="createByName"  field="createByName" vtype=""  headerAlign="center" allowSort="true" width="64" >创建人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="createByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
                        <div name="createDate"  field="createDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss"  headerAlign="center" allowSort="true" width="64" >创建时间
                            <input property="editor" class="mini-textbox"  style="width:100%;"  />
                            <input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
                                   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
                            />
                        </div>



							
							<div name="content"  field="content" vtype=""  headerAlign="center" allowSort="true" width="500" >目标内容
								<input property="editor" class="mini-textarea" style="width:100%;"  />
								<input id="content-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
						<div type="comboboxcolumn" autoShowPopup="true" name="goalLevel"  field="goalLevel" headerAlign="center" allowSort="true" width="120" >目标级别
							<input property="editor" class="mini-combobox"  textField="label" valueField="value"  style="width:100%;"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_goal_level" />
							<input
									id="goalLevel-Filter" name="mini-column-filter"
									property="filter" class="mini-combobox" style="width: 100%;"
									url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_goal_level"
									multiSelect="true" style="width: 100%;"
									onvaluechanged="onFilterChanged" valueField="value"
									textField="label" showClose="true"
									oncloseclick="onFilterClose(this)" />
						</div>
							<div name="relationship"  field="relationship" vtype=""  headerAlign="center" allowSort="true" width="64" >指标关系
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="relationship-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="indexValue"  field="indexValue" vtype=""  headerAlign="center" allowSort="true" width="64" >指标值
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="indexValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="actValue"  field="actValue" vtype=""  headerAlign="center" allowSort="true" width="64" >实际值
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="actValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>

				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sm:smGoalItemLib:edit"></sys:toolbarformmain>
                  <div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
									<input class="mini-hidden" name="id" id="id"/>
									<table border="0" cellpadding="3" cellspacing="3" >

										<tr>
											<td style="text-align:right;">目标级别：</td>
											<td>
												<input name="goalLevel" id="goalLevel"  class="mini-combobox" vtype = "" required="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_goal_level" />
											</td>
											<td style="text-align:right;">指标关系：</td>
											<td>
											   <input name="relationship" id="relationship" class="mini-textbox"   vtype = "" required="false" />
											</td>
											<td style="text-align:right;">指标值：</td>
											<td>
											   <input name="indexValue" id="indexValue" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">实际值：</td>
											<td>
											   <input name="actValue" id="actValue" class="mini-textbox"   vtype = "" required="false" />
											</td>

										</tr>
                                        <tr style="width: 500%">
                                            <td style="text-align:right;">目标内容：</td>
                                            <td>
                                                <input name="content" id="content" class="mini-textarea" width="500%" vtype = ""  required="false"/>
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
								<div title="安全目标库保障措施" name="tabSmGoalItemLibMeasureList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSmGoalItemLibMeasure" permissionEdit="sm:smGoalItemLibMeasure:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSmGoalItemLibMeasure" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLibMeasure/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>


                                            <div type="indexcolumn" >序号</div>
											<div name="itemLibId" hideable="true" visible="false"  field="itemLibId" headerAlign="center" allowSort="true" width="150" visable="false" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div name="measure"  field="measure"   vtype="" headerAlign="center" allowSort="true"  width="500" >保障措施
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="measure-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmGoalItemLibMeasure')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmGoalItemLibMeasure')"
												/>
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
			    objId:"SmGoalItemLib",
			    masterKeyField:"id",
				dataUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLib/data",
				getUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLib/get",
				saveUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLib/save",
				removeUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLib/remove",
				exportUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLib/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                    {
		                 id:"gridSmGoalItemLibMeasure",
		                 objId:"SmGoalItemLibMeasure",
		                 FK:"itemLibId",
		                 cascade:true,
		                 cascadeVisible:true,
		                 tabName:"tabSmGoalItemLibMeasureList",
						 dataUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLibMeasure/data",
						 getUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLibMeasure/get",
						 saveUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLibMeasure/save",
						 removeUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLibMeasure/remove",
						 exportUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItemLibMeasure/export"
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
						id: 'a.create_comp',
						label: '创建公司',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.seq_no',
						label: '序号',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.content',
						label: '目标内容',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.goal_level',
						label: '目标级别',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.relationship',
						label: '指标关系',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.index_value',
						label: '指标值',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.act_value',
						label: '实际值',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.num',
						label: '使用次数',
						type: 'string',
						default_value: '',
						size: 100
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
   function onGridSubOpMiClick_SmGoalItemLibMeasure(e){
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