<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
	String contextPath = request.getContextPath();    
	String realPath = request.getSession().
	                getServletContext().getRealPath("/");    
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+
	                request.getServerPort();
%>
<html>
<head>
	 <title>版本更新</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysAppUpdateNew" permissionEdit="sys:sysAppUpdateNew:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysAppUpdateNew/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype=""  headerAlign="center" allowSort="true" width="64" >序号
								<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
							</div>
							<div name="version"  field="version" vtype=""  headerAlign="center" allowSort="true" width="100" >版本
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="version-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="versionName"  field="versionName" vtype=""  headerAlign="center" allowSort="true" width="100" >版本名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="versionName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
						<div name="type"  field="type" vtype=""  headerAlign="center" allowSort="true" width="100" type="comboboxcolumn" >类型
								<input property="editor" class="mini-combobox"  style="width:100%;"  valueField="value" textField="label" url="${ctx}/sys/dict/listDataStr?type=sys_app_type"/>
								<input id="type-Filter" name="mini-column-filter"  property="filter" class="mini-combobox"   style="width:100%;" valueField="value" textField="label"
									url="${ctx}/sys/dict/listDataStr?type=sys_app_type"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<!-- <div name="url"  field="url" vtype=""  headerAlign="center" allowSort="true" width="100" >下载地址
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="url-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div> -->
							<div name="remarks"  field="remarks" readOnly="true"  headerAlign="center" allowSort="true" width="120" >更新内容
							</div>
							<div name="createDate"  field="createDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >创建时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysAppUpdateNew:edit"></sys:toolbarformmain>
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
											<td style="text-align:right;">版本：</td>
											<td>
											   <input name="version" id="version" class="mini-spinner"  vtype = ""  required="false" style="width:500px;"/>
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">版本名称：</td>
											<td>
											   <input name="versionName" id="versionName" class="mini-textbox"  vtype = ""  required="false" style="width:500px;"/>
											</td>
										</tr>
										<tr>
											<td style="text-align: right;">类型：</td>
														<td><input name="type" id="type"
															class="mini-combobox" vtype="" required="true"
															valueField="value" textField="label"
															url="${ctx}/sys/dict/listDataStr?type=sys_app_type" style="width:500px;"/>
														</td>
											<td style="text-align:right;"></td>
											<td>
											</td> 
										<tr>
										<tr>
											<td style="text-align:right;">更新内容：</td>
											<td>
											   <input name="remarks" id="remarks" class="mini-textarea"  vtype = ""  required="false" style="width:500px;height:150px;"/>
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
						      <div title="APP上传" id="tabSysAppUpdateNewDocList" style="border: 0px;">
							<sys:toolbargriddoc girdId="dgTestSub" permissionEdit="sys:sysAppUpdateNew:edit" objKeyField="id" objDescrField="name" objType="updata"></sys:toolbargriddoc>
								<div class="mini-fit">
								    <sys:griddoc  girdId="dgTestSub"></sys:griddoc>
								</div>
						</div> 
						 </div>
		        </div><!--fit-->

	    </div>

   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>
<sys:docAttach1 girdId="dgTestSub"></sys:docAttach1>
<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysAppUpdateNew",
			    masterKeyField:"id",
				dataUrl:"${ctx}/sys/sysAppUpdateNew/data",
				getUrl:"${ctx}/sys/sysAppUpdateNew/get",
				saveUrl:"${ctx}/sys/sysAppUpdateNew/save",
				removeUrl:"${ctx}/sys/sysAppUpdateNew/remove",
				exportUrl:"${ctx}/sys/sysAppUpdateNew/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
                    	  {
                              id:"dgTestSub",
                              cascade:true,
                              fileTypes:"*.apk",
                              limitType:"*.apk",
                              folder:"updata",
                                FKLinks:[
                                {FK:"objKey",masterKeyField:"id"},
                                {FK:"objType",masterKeyField:"(\"updata\")"}
                                ],
                                dataUrl:"${ctx}/dm/dmDoc/data",
                                getUrl:"${ctx}/dm/dmDoc/get",
                                saveUrl:"${ctx}/dm/dmDoc/save",
                                removeUrl:"${ctx}/dm/dmDoc/remove",
                                exportUrl:"${ctx}/dm/dmDoc/export"
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
						id: 'a.version_name',
						label: '标题',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.version',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.url',
						label: '下载地址',
						type: 'string',
						default_value: '',
						size: 128
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
function onDocActionRenderer(e) {
       var gridTemp = e.sender;
       var record = e.record;
       var uid = record._uid;
       var rowIndex = e.rowIndex;
       var del  = ' <a class="Delete_Button" href="javascript:del(\''+gridTemp.id+'\',\'' + uid + '\')">删除</a>';
       var down = '| <a class="Edit_Button" href="<%=basePath%>'+"/treps"+record.docPath+ '"  download="'+record.docFileName+'">下载</a>';
       return del + down;
   }
   function del(id,uid){
		docAttachDelRow(id,uid)
	}
   function docAttachOk1(e){
	   //获取表单中的所有的数据判断数量  最多只允许一个apk存在
	   var grids = mini.get("dgTestSub");
	   var n = grids.getTotalCount();
	   if(n >= 1){ //数量大于1
		   mini.alert("每条记录最多只允许上传一个安装包","警告");
	      return;
	   }else{
		   docAttachOk("dgTestSub");
	   }
   }
   var mid = mini.get("id").getValue();
   
</script>
</body>
</html>