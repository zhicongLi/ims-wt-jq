<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>安全目标</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <script type="text/javascript" src="${ctxStatic}/common/sysToolBar.js"></script>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SmGoal" permissionEdit="sm:smGoal:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/ims-goal${ims_goal_suffix}/sm/smGoal/data" idField="id"
					 allowResize="true" pageSize="20"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>

							<div name="createByName"  field="createByName" vtype=""  headerAlign="center" allowSort="true" width="64" >编制人姓名
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="createByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>

							<div name="createDate"  field="createDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >编制时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
								<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>

							<div name="year"  field="year" vtype="" dateFormat="yyyy" headerAlign="center" allowSort="true" width="80" >年度
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="year-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>

							<div name="title"  field="title" vtype=""  headerAlign="center" allowSort="true" width="200" >标题
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="title-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="content"  field="content" vtype=""  headerAlign="center" allowSort="true" width="100" >指导思想
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

				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sm:smGoal:edit"></sys:toolbarformmain>
                  <div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
									<input class="mini-hidden" name="id" id="id"/>
									<input class="mini-hidden" name="orgName" id="orgName"/>
									<input class="mini-hidden" name="deptName" id="deptName"/>
									<table border="0" cellpadding="3" cellspacing="3" >

										<tr>

											<td style="text-align:right;">创建部门：</td>
											<td>
											   <input name="createDept" id="createDept" class="mini-textbox"   vtype = "" required="false" />
											</td>
											<td style="text-align:right;">年度：</td>
											<td>
												<%--<input name="year" id="year" class="mini-textbox"   vtype = "" required="false" />--%>
												<input name="year" id="year" class="mini-datepicker"  format="yyyy"  vtype = "" required="false" />
											</td>
											<td style="text-align:right;">班组名称：</td>
											<td>
												<input name="orgId" id="orgId" textName="orgName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false" 
												onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sys/misOrgList',850,500,'id,name','orgId,orgName')"   />
											</td>
										</tr>


										<tr>

											<td style="text-align:right;">单位名称：</td>
											<td>
												<input name="deptId" id="deptId" textName="deptName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false" 
												onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sys/misOrgList',850,500,'id,name','deptId,deptName')"   />
											</td>
											<td style="text-align:right;">标题：</td>
											<td>
											   <input name="title" id="title" class="mini-textbox"   vtype = "" required="false" />
											</td>
											<td style="text-align:right;">目标级别：</td>
											<td>
												<input name="goalLevel" id="goalLevel"  class="mini-combobox" vtype = "" required="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sm_goal_level" />

											</td>

										</tr>
                                        <tr style="width: 400%" >
											<td style="text-align:right;">指导思想：</td>
											<td >
												<input name="content" id="content" class="mini-textarea" width="400%" vtype = ""  required="false" />
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
								<div title="安全文明生产指标" name="tabSmGoalItemList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSmGoalItem" permissionEdit="sm:smGoalItem:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSmGoalItem" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItem/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>

											<div name="id"  field="id" readOnly="true"  vtype="required" headerAlign="center" allowSort="true"  width="64"  visible="false">编码
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmGoalItem')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmGoalItem')"
												/>
											</div>

											<div name="goalId" hideable="true" visible="false"  field="goalId" headerAlign="center" allowSort="true" width="150" visible="false">
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div name="seqNo"  field="seqNo"   vtype="" headerAlign="center" allowSort="true"  width="100"  visible="false">序号
												<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
												<input id="seqNo-Filter" name="mini-column-filter"  property="filter" class="mini-spinner" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmGoalItem')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmGoalItem')"
												/>
											</div>
											<div name="content"  field="content"  vtype="" headerAlign="center" allowSort="true" width="200" >目标内容
												<input property="editor" class="mini-textarea" style="width:100%;"  />
												<input id="content-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmGoalItem')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmGoalItem')"
												/>
											</div>
											<div name="relationship"  field="relationship"   vtype="" headerAlign="center" allowSort="true"  width="80" >指标关系
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="relationship-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmGoalItem')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmGoalItem')"
												/>
											</div>
											<div name="indexValue"  field="indexValue"   vtype="" headerAlign="center" allowSort="true"  width="80" >指标值
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="indexValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmGoalItem')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmGoalItem')"
												/>
											</div>
											<div name="actValue"  field="actValue"   vtype="" headerAlign="center" allowSort="true"  width="80" >实际值
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="actValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmGoalItem')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmGoalItem')"
												/>
											</div>
											<div name="measure"  field="measure"   vtype="" headerAlign="center" allowSort="true"  width="100" >保障措施
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="measure-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmGoalItem')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmGoalItem')"
												/>
											</div>
											<div name="comments"  field="comments"   vtype="" headerAlign="center" allowSort="true"  width="150" >领导点评
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="comments-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmGoalItem')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmGoalItem')"
												/>
											</div>
											<div name="commentsBy"  field="commentsBy"   vtype="" headerAlign="center" allowSort="true"  width="64" visible="false">点评领导
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="commentsBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmGoalItem')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmGoalItem')"
												/>
											</div>
											<div name="commentsByName"  field="commentsByName"   vtype="" headerAlign="center" allowSort="true"  width="255" >点评领导名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="commentsByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmGoalItem')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmGoalItem')"
												/>
											</div>
											<div name="goalItemLibId"  field="goalItemLibId"   vtype="" headerAlign="center" allowSort="true"  width="64" visible="false">安全目标库id
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="goalItemLibId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSmGoalItem')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSmGoalItem')"
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
			    objId:"SmGoal",
			    masterKeyField:"id",
				dataUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoal/data",
				getUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoal/get",
				saveUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoal/save",
				removeUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoal/remove",
				exportUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoal/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                    {
		                 id:"gridSmGoalItem",
		                 objId:"SmGoalItem",
		                 FK:"goalId",
		                 cascade:true,
		                 cascadeVisible:true,
		                 tabName:"tabSmGoalItemList",
						 dataUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItem/data",
						 getUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItem/get",
						 saveUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItem/save",
						 removeUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItem/remove",
						 exportUrl:"${ctx}/ims-goal${ims_goal_suffix}/sm/smGoalItem/export"
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
						id: 'a.year',
						label: '年度',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.org_id',
						label: '班组id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.org_name',
						label: '班组名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.dept_id',
						label: '部门id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.dept_name',
						label: '部门名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.code',
						label: '编号',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.title',
						label: '标题',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.content',
						label: '指导思想',
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
						id: 'a.goal_level',
						label: '目标级别',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.comp_id',
						label: '公司id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.comp_name',
						label: '公司名称',
						type: 'string',
						default_value: '',
						size: 200
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
   function onGridSubOpMiClick_SmGoalItem(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }
   }
   function addButton(){
		sysToolBar_.addButtonOption({
			"buttonId":'addGoalItemLib',
			"functionStr":'addGoalItemLib',
			"gridId":"gridSmGoalItem",
			"name":'新增安全目标库'
		});
		sysToolBar_.bindClick("_tbgridSmGoalItem_add",addGoalItem,'');
	}
   function addGoalItemLib(){
	   newTabPage('新增安全目标库',"${ctxRoot}/form?view=sm/smGoalItemLibForm&action=view&showList=1",true);
   }
	 
   function addGoalItem(e){
		var param={
				obj:e,
				title:"选择安全目标",
				multiSel:true,
				readOnly:true,							
				url:"${ctxRoot}/form?view=sm/smGoalItemLibList",
				width:1000,
				height:600,
				selFields:"id,content,goalLevel,relationship,indexValue,actValue,measure",
				refFields:"goalItemLibId,content,goalLevel,relationship,indexValue,actValue,measure",
				refGridId:null,
				actionLovValid:null,
				actionLov:returnSelectData,
				actionClose:null,
				gridId:"datagridMain",
				allowDblclickSelect:true
		};					
		var data1 = popLov2(param);
 }
 function returnSelectData(s){
		for(var i=0;i<s.length;i++){
			//在这里新增表格的数据
			var grid = mini.get("gridSmGoalItem");
			var row = {goalItemLibId:s[i].id,content:s[i].content,goalLevel:s[i].goalLevel,relationship:s[i].relationship,indexValue:s[i].indexValue,actValue:s[i].actValue,measure:s[i].measure};
			grid.addRow(row);
			//console.log("name:",s[i].name);
			//console.log("id:",s[i].id);
		}
		
	}
   $(function(){
	   addButton();
   });
</script>
</body>
</html>