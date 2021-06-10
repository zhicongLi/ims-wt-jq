<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>工作票、工单危险源表</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="mini-fit">
	<div id="_splTreeMain" class="mini-splitter" style="width:100%;height:100%;">
	    <div size="240" showCollapseButton="true" style="overflow:auto;">
             <sys:treewithsearchbar dataUrl="${ctx}/wo-wt/wo/woDangerSource/workTreeData" idField="id" valueField="id" textField="dangerName" parentField="parentId" textFieldLabel="名称"></sys:treewithsearchbar>
	    </div>

		<div showCollapseButton="true">
	<div class="mini-fit">
		<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
		<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="WoDangerSource" permissionEdit="wo:woDangerSource:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/wo-wt/wo/woDangerSource/data" idField="id"
					 allowResize="true" pageSize="20"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="30"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="dangerName"  field="dangerName" vtype=""  headerAlign="center" allowSort="true" width="64" >危险源名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="dangerName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">创建者
								<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="createDate"  field="createDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" visible="false" hideable="true">创建时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
								<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">更新者
								<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="updateDate"  field="updateDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" visible="false" hideable="true">更新时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
								<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="255" visible="false" hideable="true">备注
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
		          <sys:toolbarformmain permissionEdit="wo:woDangerSource:edit"></sys:toolbarformmain> 				
                  <div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
									<input class="mini-hidden" name="id" id="id"/>
									<input class="mini-hidden" name="parentId" id="parentId"/>
									<input class="mini-hidden" name="parentIds" id="parentIds"/>
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
											<td style="text-align:right;">危险源名称：</td>
											<td colspan="3">
											   <input name="dangerName" id="dangerName" class="mini-textbox"  vtype = ""  required="false" style="width: 100%;"/>
											</td>
										</tr>
										
										<tr>
											<td style="text-align:right;">备注：</td>
											<td colspan="3">
											   <input name="remarks" id="remarks" class="mini-textarea"  vtype = ""  required="false" style="width: 100%;"/>
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
		 <%--        <div class="mini-fit">
						 <div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
							<div class="mini-panel" title="危险源" width="auto"  id="tabEmEquipLogicDangerList" name="tabEmEquipLogicDangerList"
								 showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true" >
							 <sys:toolbargridsub girdId="gridEmEquipLogicDanger" permissionEdit="wo:woDangerSource:edit"></sys:toolbargridsub>
							 	<div id="gridEmEquipLogicDanger" class="mini-datagrid" style="width:100%;height:100%;"
								 url="${ctx}/wo-wt/em/emEquipLogicDanger/data" idField="id"
								 allowResize="true" pageSize="1o"
								 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
								 editNextOnEnterKey="true"  editNextRowCell="true"
								 allowAlternating="true" showFilterRow="false"  showColumnsMenu="false"
								>
								<div property="columns">
									<div type="indexcolumn"></div>
									<div type="checkcolumn"></div>
										<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">id
											<input property="editor" class="mini-textbox"  style="width:100%;"  />
											<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
												   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
											/>
										</div>
										<div name="equipLogicId" field="equipLogicId" vtype=""   headerAlign="center" allowSort="true" width="64" >KKS
											<input property="editor" class="mini-buttonedit" vtype = "" required="false" allowInput="false"  style="width:100%;"  onbuttonclick="updateEquipLogic" />
										</div>
										<div name="equipLogicName" field="equipLogicName" vtype=""   headerAlign="center" allowSort="true" width="255" >逻辑设备名称 
											<input property="editor" class="mini-textbox"  style="width:100%;"  />
											<input id="equipLogicName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
												   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
											/>
										</div>
										<div name="dangerSourceId" field="dangerSourceId" vtype=""   headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">危险源id
											<input property="editor" class="mini-textbox"  style="width:100%;"  />
											<input id="dangerSourceId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
												   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
											/>
										</div>
										<div name="dangerSourceName" field="dangerSourceName" vtype=""   headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">危险源名称
											<input property="editor" class="mini-textbox"  style="width:100%;"  />
											<input id="dangerSourceName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
												   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
											/>
										</div>
										<div name="seqNo" field="seqNo" vtype=""   headerAlign="center" allowSort="true" width="100" visible="false" hideable="true">排序
											<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
											<input id="seqNo-Filter" name="mini-column-filter"  property="filter" class="mini-spinner" style="width:100%;"
												   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
											/>
										</div>
							   	 	</div>
						    	</div>
							</div>
						 </div>
		        </div> --%><!--fit-->
			</div>
			</div>
			</div>
			</div>
	    </div>

   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"WoDangerSource",
			    masterKeyField:"id",
			    treeSrcFields : "id",
			    treeDestFields : "parentId",
			    treeParentField:"parentId",
			    treeFilter:"a.parent_id='[node.id]' or a.id = '[node.id]'",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
				dataUrl:"${ctx}/wo-wt/wo/woDangerSource/data",
				getUrl:"${ctx}/wo-wt/wo/woDangerSource/get",
				saveUrl:"${ctx}/wo-wt/wo/woDangerSource/save",
				removeUrl:"${ctx}/wo-wt/wo/woDangerSource/remove",
				exportUrl:"${ctx}/wo-wt/wo/woDangerSource/export",
				//onBeforeNewRecord:checkIsSearchNode
				onAfterRemove:reloadTree
				//onAfterNewRecord:reloadTree
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
                    	 /*  {  
                    		id:"gridEmEquipLogicDanger",
              			    objId:"EmEquipLogicDanger",
	              			FKLinks:[
	                       	  {FK:"dangerSourceId",masterKeyField:"id"},
	                          {FK:"dangerSourceName",masterKeyField:"dangerName"}
	                        ],
	                        cascade:true,
	                        cascadeVisible:true,
			                insertPos:"L",
			                insertType:"A",
              				dataUrl:"${ctx}/em/emEquipLogicDanger/data",
              				getUrl:"${ctx}/em/emEquipLogicDanger/get",
              				saveUrl:"${ctx}/em/emEquipLogicDanger/save",
              				removeUrl:"${ctx}/em/emEquipLogicDanger/remove",
              				exportUrl:"${ctx}/em/emEquipLogicDanger/export"
              			 } */
	                   ]
	);

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: 'id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.danger_name',
						label: '危险源名称',
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
						label: '备注',
						type: 'string',
						default_value: '',
						size: 255
					}
			]
	);
   loadWindow("noload");
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
   function onGridSubOpMiClick_WoDangerFactorMeasure(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }
   }
	
   //选择设备
   function updateEquipLogic(){
	   //debugger;
	  popLov(this,'选择逻辑设备',false,true,'${ctx}/em/emEquipLogic/lov1',850,500,'id,name','equipLogicId,equipLogicName','gridEmEquipLogicDanger',null,function(data){			  
		  data = mini.clone(data);			  
		   var  grid=mini.get("gridEmEquipLogicDanger"); 
		   var row=grid.getSelected( );			  
		   row.equipLogicId=data[0].id;
		   row.equipLogicName=data[0].name;			  
		   //grid.updateRow(row,{equipId:data[0].id,equipName:data[0].name});
	   });
   }
  function reloadTree(){
	  var treeObj=tree;
	  treeObj.reload();
  }
  
  function saveAddForm(){
	  debugger;
	var rowObj=mini.get("datagridMain").getSelected();
	if(rowObj.parentIds=="" || rowObj.parentIds==null){
		var treeObj=mini.get("treeMain");
		console.log(treeObj);
		var node=treeObj.getSelectedNode();
		if(node=="" || node==null){
			showMessageBox("提示","请先选中要新增节点","info");
			return;
		}
		var parentId=node.id;
		var parentIdObject=mini.get("parentId");
		var parentIdsObject=mini.get("parentIds");
		
		if(parentId.length>1){
			parentIds=node.parentIds+parentId+",";
			parentIdObject.setValue(parentId);
			parentIdsObject.setValue(parentIds);
		}else{
			parentIds=parentId+",";
			parentIdObject.setValue(parentId);
			parentIdsObject.setValue(parentIds);
		}
		saveForm();
	}else{
		saveForm();
	}
}
</script>
</body>
</html>