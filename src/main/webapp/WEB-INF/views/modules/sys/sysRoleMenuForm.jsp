<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>角色菜单关联</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysRoleMenu" permissionEdit="sys:sysRoleMenu:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysRoleMenu/data" idField="id"
					 allowResize="true" pageSize="20"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="roleId"  field="roleId" vtype="required"  headerAlign="center" allowSort="true" width="64" >role_id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="roleId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="menuId"  field="menuId" vtype="required"  headerAlign="center" allowSort="true" width="64" >menu_id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="menuId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysRoleMenu:edit"></sys:toolbarformmain>
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
											<td style="text-align:right;">role_id：</td>
											<td>
											   <input name="roleId" id="roleId" class="mini-textbox"  vtype = ""  required="true" />
											</td>
											<td style="text-align:right;">menu_id：</td>
											<td>
											   <input name="menuId" id="menuId" class="mini-textbox"   vtype = "" required="true" />
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
						 </div>
		        </div><!--fit-->

	    </div>

   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysRoleMenu",
				dataUrl:"${ctx}/sys/sysRoleMenu/data",
				getUrl:"${ctx}/sys/sysRoleMenu/get",
				saveUrl:"${ctx}/sys/sysRoleMenu/save",
				removeUrl:"${ctx}/sys/sysRoleMenu/remove",
				exportUrl:"${ctx}/sys/sysRoleMenu/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                   ]
	);

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.role_id',
						label: 'role_id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.menu_id',
						label: 'menu_id',
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

</script>
</body>
</html>