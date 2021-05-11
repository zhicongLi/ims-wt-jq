<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>职位选择</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="mini-fit">
<div class="mini-splitter" id="_splTreeMain"  style="width: 100%; height: 100%;">
<div size="240" showCollapseButton="true" style="overflow: auto;">
				<div id="_tabsTreeMain" class="mini-tabs" tabPosition="bottom"
					activeIndex="0" plain="false" style="width: 100%; height: 100%;">
					<div title="按组织" id="tabOrg" style="border: 0px;">
						<sys:treewithsearchbar
							dataUrl="${ctx}/sys/sysOrg/allData" idField="id"
							valueField="id" textField="name" parentField="parentId"
							textFieldLabel="名称"></sys:treewithsearchbar>
					</div>
				</div>
</div>
</div>
<div showCollapseButton="true">
<div class="mini-fit">
<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysDuties" permissionEdit="sys:sysDuties:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysDuties/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
					<div name="name" field="name" vtype="required"   headerAlign="center" allowSort="true" width="100" >职位名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="sort" field="sort" vtype=""   headerAlign="center" allowSort="true" width="100" >排序
						<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
						<input id="sort-Filter" name="mini-column-filter"  property="filter" class="mini-spinner" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div type="comboboxcolumn" autoShowPopup="true" name="typeId"  field="typeId" vtype="" headerAlign="center" allowSort="true" width="120" >类型
								<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/sys/dict/listDataStr?type=wp_duties_type_id" />
					</div>	
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注信息
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysDuties:edit"></sys:toolbarformmain>
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
										<!-- 
											<td style="text-align:right;">类型：</td>
											<td>
											   <input name="type" id="type" class="mini-combobox"    valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_edit_control_type"  vtype = ""  required="false" />
											</td>
											 -->
											 
											<td style="text-align:right;" width="150px">对象名称：</td>
											<td  width="150px">
											   <input name="objName" id="objName" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;"  width="150px">名称：</td>
											<td width="150px">
											   <input name="name" id="name" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;"  width="150px">序号：</td>
											<td width="150px">
											   <input name="seqNo" id="seqNo" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;"  width="150px">是否启用：</td>
											<td width="150px">
											   <input name="isActive" id="isActive" class="mini-CheckBox"   trueValue="1" falseValue="0" vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">控制gridIDs：</td>
											<td  colspan="3">
											   <input name="disabledGridIds" id="disabledGridIds" class="mini-textArea"  vtype = ""  required="false" width="100%"/>
											</td>
											<td style="text-align:right;">控制formIDs：</td>
											<td  colspan="3">
											   <input name="disabledFormIds" id="disabledFormIds" class="mini-textArea"  vtype = ""  required="false" width="100%"/>
											</td>
											
										</tr>
										<tr>
											<td style="text-align:right;">通过get能获取的Ids：</td>
											<td  colspan="3">
											   <input name="disabledGetItemIds" id="disabledGetItemIds" class="mini-textArea"  vtype = ""  required="false" width="100%" />
											</td> 
											<td style="text-align:right;">备注：</td>
											<td  colspan="3">
											   <input name="remarks" id="remarks" class="mini-textArea"  vtype = ""  required="false" width="100%"/>
											</td>
										</tr>
									</table>
				                </div> <!--panel-->
				            </div> <!--mini-col-->
				        </div> <!--clearfix-->
				     </div> <!--container-->
				  </div> <!--editform-->
				  </div><!--fit-->
				  </div><!--fit-->
		        <div class="mini-fit">
		        </div><!--fit-->
	    </div>

   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysDuties",
			    treeFilter : "((o.id='[node.id]') or (o.parent_ids like '%,[node.id],%'))",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
				treeSrcFields : "id",
				treeDestFields : "typeId",
				treeFilter2 : "(e.id='[node.id]')",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
				dataUrl:"${ctx}/sys/sysDuties/data",
				getUrl:"${ctx}/sys/sysDuties/get",
				saveUrl:"${ctx}/sys/sysDuties/save",
				removeUrl:"${ctx}/sys/sysDuties/remove",
				exportUrl:"${ctx}/sys/sysDuties/export"
				
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
						id: 'a.type',
						label: '类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.is_active',
						label: '是否启用',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.obj_name',
						label: '对象名称',
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
   function onGridSubOpMiClick_SysEditControlLine(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }
   }
   function onGridSubOpMiClick_SysEditControlCondtion(e){
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