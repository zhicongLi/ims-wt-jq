<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>域</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
	 <script src="${ctxStatic}/layui/layui.js" type="text/javascript"></script>
	<%-- <link rel="stylesheet" href="${ctxStatic}/layui/css/layui.css" media="all"> --%>
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysSite" permissionEdit="sys:sysSite:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysSite/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
							<div name="id"  field="id" vtype=""  headerAlign="center" allowSort="true" width="100" >编码
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="true" width="100" >名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div type="checkboxcolumn" trueValue="1" falseValue="0"  name="isActive"  field="isActive" vtype=""  headerAlign="center" allowSort="true" width="64" >是否启用
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="isActive-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="cmsSiteId"  field="cmsSiteId" displayField="cmsSiteName" vtype=""  headerAlign="center" allowSort="true" width="100" >站点
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="cmsSiteId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="note"  field="note" vtype=""  headerAlign="center" allowSort="true" width="200" >备注
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="note-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysSite:edit"></sys:toolbarformmain>
                  <div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
											<td style="text-align:right;">编码：</td>
											<td>
											   <input name="id" id="id" width="80" class="mini-textbox" vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">名称：</td>
											<td>
											   <input name="name" id="name"  width="200" class="mini-textbox"  vtype = ""  required="true" />
											</td>
											
											<td style="text-align:right;">是否启用：</td>
											<td>
											   <input trueValue="1" falseValue="0" name="isActive" id="isActive" class="mini-checkbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">站点：</td>
											<td>
				   								<input name="cmsSiteId" id="cmsSiteId" textName="cmsSiteName" class="mini-buttonedit" style="width:200px" vtype = "" onbuttonclick="popLov(this,'选择站点',false,true,'${ctx}/cms/cmsSite/form',1200,600,'id,name','cmsSiteId,cmsSiteName','#editform')" />
											</td>
											<td style="text-align:right;">备注：</td>
											<td>
											   <input  name="note" id="note" width="200" class="mini-textbox"   vtype = "" required="false" />
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
						 <div id="tabsSub"  class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
			 					<div title="系统配置" id="tabSysConfigList"  name="tabSysConfigList" style="border: 0px;"  >
											<sys:toolbargridsub girdId="gridSysConfig" permissionEdit="sys:sysConfig:edit"></sys:toolbargridsub>
											<div class="mini-fit">
											<div id="gridSysConfig" class="mini-datagrid" style="width:100%;height:100%;"
												 url="${ctx}/sys/sysConfig/data" idField="id"
												 allowResize="true" pageSize="10"  showFilterRow="true"
												 allowCellSelect="true" allowCellEdit="true"
												 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="true"
												 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
												ondrawcell="ondrawCell"
											>
												<div property="columns">
													<div type="checkcolumn"></div>
													<div name="siteId" hideable="true" visible="false"  field="siteId" headerAlign="center" allowSort="true" width="150" >
														<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
													</div>
													 <div name="id"  sortField="a.id" field="id"  readOnly="true"   headerAlign="center" allowSort="true"  width="64" visible="false">编码
														<input property="editor" class="mini-textbox" style="width:100%;"  />
														<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
															   onvaluechanged="onFilterChanged"
														/>
													</div>
													
													<div name="propId" field="propId" vtype=""   headerAlign="center" allowSort="true" width="120" displayField="propId">属性编码
														<input property="editor"  textName="propId" class="mini-buttonedit" style="width:200px" vtype = "" onbuttonclick="popLov(this,'选择',false,true,'${ctx}/sys/sysConfigItem/list',1200,600,'propId,propValue,name,isImmedActive,type,isActive,remarks,description','propId,propValue,name,isImmedActive,type,isActive,remarks,description','gridSysConfig')" />
														
														<input id="propId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
															   onvaluechanged="onFilterChangedChild(this,'gridSysConfig')"
														/>
														
													</div>
													<div name="propValue" field="propValue" vtype=""   headerAlign="center" allowSort="true" width="200" >属性值
														<input property="editor" class="mini-textbox" style="width:100%;"  />
														 <sys:ckfindergrid grid="gridSysConfig" input="propValue" type="images" uploadPath="/cms/site" selectMultiple="false" maxWidth="100" maxHeight="100"/>
														<input id="propValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
															   onvaluechanged="onFilterChangedChild(this,'gridSysConfig')"
														/>
													</div>
													<div name="type"   field="type"   headerAlign="center" allowSort="true" width="100" type="comboboxcolumn" vtype="required">属性类别
														<input property="editor"  class="mini-combobox"  required="true"   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_config_type"/>
														<input id="type-Filter" name="mini-column-filter"  property="filter" class="mini-combobox"   style="width:100%;" textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_config_type"
															   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
														/>
													</div>
													<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="100" >属性名称
														<input property="editor" class="mini-textbox" style="width:100%;"  />
														<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
															   onvaluechanged="onFilterChangedChild(this,'gridSysConfig')"
														/>
													</div>
													<div type="checkboxcolumn" trueValue="1" falseValue="0"  name="isActive"  field="isActive" vtype=""  headerAlign="center" allowSort="true" width="64" >是否启用
													</div>
													<div type="checkboxcolumn" trueValue="1" falseValue="2"  name="isImmedActive" vtype=""  field="isImmedActive"   headerAlign="center" allowSort="true" width="100" >是否立即生效
													</div>
													<div name="propType"   field="propType"   headerAlign="center" allowSort="true" width="100" type="comboboxcolumn" vtype="required">自定义属性
														<input property="editor" name="propType" id="propType"  class="mini-combobox"  required="true"   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=prop_types"/>
													</div>
													<div name="description" field="description" vtype=""   headerAlign="center" allowSort="true" width="150" >描述
														<input property="editor" class="mini-textbox" style="width:100%;"  />
													</div>
													<div name="img" field="img"  vtype="" readOnly="true"   headerAlign="center" allowSort="false" width="75" >图片
														<input property="editor" class="mini-textbox" style="width:100%;"  />
													</div>
													<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="200" >备注信息
														<input property="editor" class="mini-textarea" style="width:100%;"  />
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
			    objId:"SysSite",
			    masterKeyField:"id",
				dataUrl:"${ctx}/sys/sysSite/data",
				getUrl:"${ctx}/sys/sysSite/get",
				saveUrl:"${ctx}/sys/sysSite/save",
				removeUrl:"${ctx}/sys/sysSite/remove",
				exportUrl:"${ctx}/sys/sysSite/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
                    	{
	                   	    id:"gridSysConfig",
			                objId:"SysConfig",
			                FK:"siteId",
			                cascade:true,
							cascadeVisible:true,
			                tabName:"tabSysConfigList",
	          				dataUrl:"${ctx}/sys/sysConfig/data",
	          				getUrl:"${ctx}/sys/sysConfig/get",
	          				saveUrl:"${ctx}/sys/sysConfig/save",
	          				removeUrl:"${ctx}/sys/sysConfig/remove",
	          				exportUrl:"${ctx}/sys/sysConfig/export"
                    	}
	                  ]
	);

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: '模块编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.name',
						label: '模块名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.note',
						label: '备注',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.is_active',
						label: '是否启用',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.cms_site_id',
						label: '内容站点',
						type: 'string',
						default_value: '',
						size: 64
					}
			]
	);
   loadWindow();
   var layer;
   layui.use('layer', function(){
	    layer = layui.layer;
	 });   
   
    var gridSysConfig = mini.get("gridSysConfig");
	gridSysConfig.on("cellclick",function(e){
		var row = e.row;
   		if(e.field=="img"&&row.img&&row.propValue){
   			var propValue = row.propValue;
	    	var img = "<img src='" + propValue + "' />";
	    	layer.open({  
	    	    type: 1,  
	    	    shade: false,  
	    	    title: false, //不显示标题  
	    	    area:['90%','90%'],  
	    	    content: img
	    	})
	    	    
	    } 
	})
	 function ondrawCell(e){
		  var record = e.record,
		  field=e.field,
		  propValue = record.propValue;
		  if(field=="img"&&propValue&&propValue.indexOf("/images/")>=0){
			  record.img = '<span><img width ="50" height="20" src="'+propValue+'"></span>';
			  e.cellHtml = '<span><img width ="50" height="20" src="'+propValue+'"></span>';
		  }	
	}
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