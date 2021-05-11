<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>查询结果保存</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysQueryResult" permissionEdit="sys:sysQueryResult:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"onrowdblclick='onrowdblclick'
					 url="${ctx}/sys/sysQueryResult/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="100"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="true" width="80" >名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="queryCriteria-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="queryCriteria"  field="queryCriteria" vtype=""  headerAlign="center" allowSort="true" width="270" hideable="true" visible="false">查询条件
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="queryCriteria-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="objId"  field="objId" vtype="required"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">对象编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="objId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">创建者
								<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="createDate"  field="createDate" vtype="required" dateFormat="yyyy-MM-dd " headerAlign="center" allowSort="true" width="100" >创建时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
								<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">更新者
								<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="updateDate"  field="updateDate" vtype="required" dateFormat="yyyy-MM-dd " headerAlign="center" allowSort="true" width="100" >更新时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
								<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							
							<div name="siteId"  field="siteId" vtype=""  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">站点ID
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="siteId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="url"  field="url" vtype=""  headerAlign="center" allowSort="true" width="255" hideable="true" visible="false">URL
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="url-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
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
		<sys:toolbarformmain permissionEdit="sys:sysQueryResult:edit"></sys:toolbarformmain>
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
											<td style="text-align:right;display:none;">查询条件：</td>
											<td>
											   <input name="queryCriteria" id="queryCriteria" class="mini-hidden"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;display:none;">URL：</td>
											<td>
											   <input id="url" name="url" id="url" class="mini-hidden"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;display:none;">对象编号：</td>
											<td>
											   <input name="objId" id="objId" class="mini-hidden"   vtype = "" required="true" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;display:none;">创建时间：</td>
											<td>
											   <input name="createDate" id="createDate" class="mini-hidden" dateFormat="yyyy-MM-dd HH:mm:ss" vtype = "" readOnly="false" required="false"/>
											</td>
											<td style="text-align:right;display:none;">站点ID：</td>
											<td>
											   <input name="siteId" id="siteId" class="mini-hidden"   vtype = "" required="false" />
											</td>
											
											<td style="text-align:right;display:none;">创建者：</td>
											<td>
											   <input name="createBy" id="createBy" class="mini-hidden" />
											</td>
											

										</tr>
										<tr>
											<td style="text-align:right;">名称：</td>
											<td>
											   <input id="na'me" name="name" id="url" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;display:none;">更新者：</td>
											<td>
											   <input name="updateBy" id="updateBy" class="mini-hidden" />
											</td>
											

										</tr>
										<tr>
											<td style="text-align:right;">备注信息：</td>
											<td>
											   <input name="remarks" id="remarks" class="mini-textarea" vtype = ""  required="false"  />
											</td>
											<td style="text-align:right;display:none;">更新时间：</td>
											<td>
											   <input name="updateDate" id="updateDate" class="mini-hidden" dateFormat="yyyy-MM-dd HH:mm:ss" vtype = "" readOnly="false" required="false"/>
											</td>
											
											

										</tr>
										<tr>
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
		       	
					<Iframe  id="iframeId" width="100%" height="100%" scrolling="no" frameborder="x" name="main"  ></iframe> 
		        </div><!--fit-->

	    </div>

   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">
	initBase(
			{   id:"datagridMain",
			    objId:"SysQueryResult",
				dataUrl:"${ctx}/sys/sysQueryResult/data",
				getUrl:"${ctx}/sys/sysQueryResult/get",
				saveUrl:"${ctx}/sys/sysQueryResult/save",
				removeUrl:"${ctx}/sys/sysQueryResult/remove",
				exportUrl:"${ctx}/sys/sysQueryResult/export",
				addCan:"0",
				cloneCan:"0"
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
						id: 'a.query_criteria',
						label: '查询条件',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.obj_id',
						label: '对象编号',
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
						label: '备注信息',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.site_id',
						label: '站点ID',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.url',
						label: 'URL',
						type: 'string',
						default_value: '',
						size: 255
					}
			]
	);
   loadWindow();
   function onrowdblclick(e){
	   var record = e.record;
	   var url = record.url;
	   $("iframe").attr("src", url );
	   var ifrm1 = document.getElementById('iframeId');
	   ifrm1.onload=function(){  
	   		var r=ifrm1.contentWindow.document.getElementById('tableId');
	    	div1=ifrm1.contentWindow.document.getElementById('headForm');
	   		if(div1 && typeof div1=="object"){
		  		ifrm1.contentWindow.document.getElementById('headForm').style.display = "none";
	   		}
	   		var div2=ifrm1.contentWindow.document.getElementById('headForm2');
	  		 if(div2 &&typeof div2=="object"){
		   		ifrm1.contentWindow.document.getElementById('headForm2').style.display = "none";
	   		}
	   		r.innerHTML="";
	   };  
   }
   function onActionRenderer(e){
       var gridTemp = e.sender;
       var record = e.record;
       var uid = record._uid;
       var id = record.id;
       var categoryId = record.categoryId
       var rowIndex = e.rowIndex;
       var s = '';
              s += '<a class="Edit_Button" href="javascript:editFormRow(\'' + gridTemp.id + '\',\'' + uid + '\',1)"  ><i class="icon-list-alt" data-tooltip="明细" data-placement="top"></i></a>'
                   +  ' <a class="Delete_Button" href="javascript:removeOneRowAndSave(\'' + gridTemp.id + '\',\'' + uid + '\')"><i class="icon-remove" data-tooltip="删除" data-placement="top"></i></a>';
         return s;
       }
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