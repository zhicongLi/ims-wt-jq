<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>用户资质信息</title>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="WoUserQual" permissionEdit="wo:woUserQual:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/wo-wt/wo/woUserQual/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64"  hideable="true" visible="false" >编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="wtType"  field="wtType" vtype=""  headerAlign="center" type="comboboxcolumn" allowSort="true" width="255" >工作票类型
								<input property="editor" class="mini-combobox" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_user_wt_type"  style="width:100%;"  />
								<input id="wtType-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" multiSelect="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_user_wt_type" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
								/>
							</div>
							<!-- 
							<div name="qualType"  field="qualType" vtype=""  headerAlign="center" allowSort="true" width="64" >资质类型
								<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_user_qual_type"   style="width:100%;"  />
								<input id="qualType-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" multiSelect="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_user_qual_type"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							 -->
							<!-- <div name="deptName"  field="deptName" vtype=""  headerAlign="center" allowSort="true" width="255" >部门名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="deptName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div> -->
							<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="255" >备注信息
								<input property="editor" class="mini-textarea" style="width:100%;"  />
								<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="wo:woUserQual:edit"></sys:toolbarformmain>
                  <div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"
								>
									<input class="mini-hidden" name="id" id="id"/>
									<input class="mini-hidden" name="deptName" id="deptName"/>
									<input class="mini-hidden" name="orgId" id="orgId"/>
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
											<td style="text-align:right;">工作票类型：</td>
											<td>
											   <input name="wtType" id="wtType" class="mini-combobox"  vtype = "" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_user_wt_type" required="false" />
											</td>
											<td style="text-align:right;">资质类型：</td>
											<td>
											   <input name="qualType" id="qualType" class="mini-combobox" enabled="false" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_user_qual_type"   />
											</td>

										</tr>
										<tr>											
											<td style="text-align:right;">备注信息：</td>
											<td colspan="3">
											   <input name="remarks" id="remarks" class="mini-textarea" vtype = ""  required="false" width="100%" />
											</td>

										</tr>
									</table>
				                </div> <!--panel-->
				            </div> <!--mini-col-->
				        </div> <!--clearfix-->
				     </div> <!--container-->
				  </div> <!--editform-->
		        <div class="mini-fit">
						 <div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
								<div title="用户资质行" name="tabWoUserQualLineList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridWoUserQualLine" permissionEdit="wo:woUserQualLine:edit" ></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridWoUserQualLine" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/wo-wt/wo/woUserQualLine/data" idField="id"
										 allowResize="true" pageSize="10"		
										 allowCellSelect="true" allowCellEdit="true"	 oncellendedit="validateTime"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="true"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
										 oncellbeginedit="OnCellBeginEdit"  allowCellWrap="true">
										<div property="columns">
										    <div type="indexcolumn"></div>
											<div type="checkcolumn"></div>
											<div name="id"  field="id" readOnly="true"  vtype="required" headerAlign="center" allowSort="true"  width="64"  hideable="true" visible="false">编号
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridWoUserQualLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridWoUserQualLine')"
												/>
											</div>
											<div name="userId" hideable="true" visible="false"  field="userId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div name="userQualId" hideable="true" visible="false"  field="userQualId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div name="userName"  field="userName"   vtype="" headerAlign="center" allowSort="true"  width="255" displayField="userName">用户名称
												<input property="editor" class="mini-buttonedit"  style="width:100%;"   textField="userName" allowInput="false"
											   	onbuttonclick="popLov(this,'选择人员',false,true,'${ctxRoot}/form?view=sys/misUserList',850,500,'id,name,loginName,orgName','userId,userName,userLoginName,orgName','gridWoUserQualLine')"
												/>
												<input id="userName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridWoUserQualLine')" showClose="true" oncloseclick="onChildFilterClose(this)"
												/>
											</div>
											<div name="userLoginName"  field="userLoginName"   vtype="" headerAlign="center" allowSort="true"  width="255" >用户登录名称											
												<input id="userLoginName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridWoUserQualLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridWoUserQualLine')"
												/>
											</div>	
											<div name="orgName"  field="orgName"  vtype="" headerAlign="center" allowSort="true"  width="255"   >部门										
												<input id="orgName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridWoUserQualLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridWoUserQualLine')"
												/>
											</div>																				
											<div name="remarks"  field="remarks" sortField="a.remarks"  vtype="" headerAlign="center" allowSort="true" width="255" >备注信息
												<input property="editor" class="mini-textarea" style="width:100%;"  />
												<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridWoUserQualLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridWoUserQualLine')"
												/>
											</div>
											
											<div name="startDate"  field="startDate" vtype="required" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true" width="160"   >有效开始时间
												<input property="editor" class="mini-datepicker"  style="width:100%;" allowInput="false" />
												<input id="startDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridWoUserQualLine')" showClose="true" oncloseclick="onChildFilterClose(this)"
												/>
											</div>
											<div name="endDate"  field="endDate" vtype="required" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true" width="160" >有效结束时间
												<input property="editor" class="mini-datepicker"  style="width:100%;"  allowInput="false"/>
												<input id="endDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
													    onvaluechanged="onFilterChangedChild(this,'gridWoUserQualLine')" showClose="true" oncloseclick="onChildFilterClose(this)"
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
<sys:excelimport></sys:excelimport> 
<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"WoUserQual",
			    masterKeyField:"id",
				dataUrl:"${ctx}/wo-wt/wo/woUserQual/data",
				getUrl:"${ctx}/wo-wt/wo/woUserQual/get",
				saveUrl:"${ctx}/wo-wt/wo/woUserQual/save",
				removeUrl:"${ctx}/wo-wt/wo/woUserQual/remove",	
				importUrl:"${ctx}/wo-wt/wo/woUserQual/import",
				exportUrl:"${ctx}/wo-wt/wo/woUserQual/export",
				initData:{
					qualType:'${param.qualType}'
				}
				
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                    {
		                 id:"gridWoUserQualLine",
		                 objId:"WoUserQualLine",
		                 FK:"userQualId",
		                 cascade:true,
		                 cascadeVisible:true,
		                 tabName:"tabWoUserQualLineList",
						 dataUrl:"${ctx}/wo-wt/wo/woUserQualLine/data",
						 getUrl:"${ctx}/wo-wt/wo/woUserQualLine/get",
						 saveUrl:"${ctx}/wo-wt/wo/woUserQualLine/save",
						 importUrl:"${ctx}/wo-wt/wo/woUserQualLine/import",
						 importParam:{
						     initImport:getInitParam//导入初始化数据，类型为Function，返回格式为JSON对象
						 },
						 removeUrl:"${ctx}/wo-wt/wo/woUserQualLine/remove",
						 exportUrl:"${ctx}/wo-wt/wo/woUserQualLine/export"
	                    }
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
						id: 'a.wt_type',
						label: '工作票类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.qual_type',
						label: '资质类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.remarks',
						label: '备注信息',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.dept_name',
						label: '部门名称',
						type: 'string',
						default_value: '',
						size: 255
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
   function onGridSubOpMiClick_WoUserQualLine(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }
   }
	function validateTime(e){		
		var grid = mini.get("gridWoUserQualLine");
		var row = e.record;
		var json = mini.encode(row);
		
	
		var startTime = mini.encode(row.startDate,'yyyy-MM-dd');
		var endTime = mini.encode(row.endDate,'yyyy-MM-dd');
		if(startTime>=endTime){
			 mini.alert("有效开始时间要小于等于有效结束时间！");
			
		}else{
			return true;
		}
	} 
	
	//控制单元格是否可编辑
	function OnCellBeginEdit(e) {
       /*  var record = e.record, field = e.field;
        if (record.userName !=null&&record.id!=null) {
            e.cancel = true;    
        } */
    }

	//子表导入
	function getInitParam(){
		var id = mini.get("id").getValue();
		if (id == "" || id == null) {
   		  mini.alert("请先保存再导入人员！");
   		  return;
   	    }	
		return {userQualId:id};
	}
</script>
</body>
</html>