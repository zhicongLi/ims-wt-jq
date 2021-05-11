<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>表扩展</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysTableExt" permissionEdit="sys:sysTableExt:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysTableExt/data" idField="id"
					 allowResize="true" pageSize="20"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" visible="false">编码
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="siteId "  field="siteId   " vtype=""  headerAlign="center" allowSort="true" width="255"  visible="false" hideable="true">站点ID
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="siteId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="menuId"  field="menuId" vtype=""  headerAlign="center" allowSort="true" width="255" hideable="true"visible="false" hideable="true">菜单ID
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="menuId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="tableName"  field="tableName" vtype=""  headerAlign="center" allowSort="true" width="255" >表名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="tableName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="className"  field="className" vtype=""  headerAlign="center" allowSort="true" width="255" >类名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="className-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="descr"  field="descr" vtype=""  headerAlign="center" allowSort="true" width="255" >描述
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="selectFields"  field="selectFields" vtype=""  headerAlign="center" allowSort="true" width="100" >查询字段
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="selectFields-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="insertFields"  field="insertFields" vtype=""  headerAlign="center" allowSort="true" width="100" >插入字段
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="insertFields-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="insertValues"  field="insertValues" vtype=""  headerAlign="center" allowSort="true" width="100" >插入值
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="insertValues-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="updateFields"  field="updateFields" vtype=""  headerAlign="center" allowSort="true" width="100" >更新字段
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="updateFields-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="shortName"  field="shortName" vtype=""  headerAlign="center" allowSort="true" width="64" >表简称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="shortName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="tempStr1"  field="tempStr1" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">临时字段1
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="tempStr1-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="tempStr2"  field="tempStr2" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">临时字段2
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="tempStr2-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="tempStr3"  field="tempStr3" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">临时字段3
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="tempStr3-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="tempStr4"  field="tempStr4" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">临时字段4
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="tempStr4-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="tempStr5"  field="tempStr5" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false">临时字段5
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="tempStr5-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysTableExt:edit"></sys:toolbarformmain>
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
									<td style="text-align:right;" >站点ID：</td>
											<td>
											   <input name="siteId" id="siteId" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">菜单ID：</td>
											<td>
											   <input name="menuId" id="menuId" class="mini-textbox"   vtype = "" required="false" />
											</td>
									</tr>
										<tr>
											<td style="text-align:right;">表名称：</td>
											<td>
											   <input name="tableName" id="tableName" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">类名称：</td>
											<td>
											   <input name="className" id="className" class="mini-textbox"   vtype = "" required="false" />
											</td>

										
											<td style="text-align:right;">描述：</td>
											<td>
											   <input name="descr" id="descr" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">表简称：</td>
											<td>
											   <input name="shortName" id="shortName" class="mini-textbox"   vtype = "" required="false" />
											</td>
											

										</tr>
										<tr>
										
											<td style="text-align:right;">插入字段：</td>
											<td colspan="3">
											   <input name="insertFields" id="insertFields" class="mini-textarea"  width="100%" vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">插入值：</td>
											<td colspan="3">
											   <input name="insertValues" id="insertValues" class="mini-textarea" width="100%"    vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">查询字段：</td>
											<td colspan="3">
											   <input name="selectFields" id="selectFields" class="mini-textarea" width="100%"   vtype = "" required="false" />
											</td>
											<td style="text-align:right;">更新字段：</td>
											<td colspan="3">
											   <input name="updateFields" id="updateFields" class="mini-textarea"  width="100%" vtype = ""  required="false" />
											</td>
											

										</tr>
										<tr>
											<td style="text-align:right;">where条件：</td>
											<td colspan="3">
											   <input name="whereStr" id="whereStr" class="mini-textarea" width="100%"   vtype = "" required="false" />
											</td>
											<td style="text-align:right;">连接表：</td>
											<td colspan="3">
											   <input name="joinTable" id="joinTable" class="mini-textarea"  width="100%" vtype = ""  required="false" />
											</td>
											

										</tr>
										<tr>
											<td style="text-align:right;">临时字段1：</td>
											<td colspan="3">
											   <input name="tempStr1" id="tempStr1" class="mini-textarea" width="100%"   vtype = "" required="false" />
											</td>
											<td style="text-align:right;">临时字段2：</td>
											<td colspan="3">
											   <input name="tempStr2" id="tempStr2" class="mini-textarea" width="100%"   vtype = "" required="false" />
											</td>

										</tr>
										<!-- <tr>
											<td style="text-align:right;">临时字段3：</td>
											<td>
											   <input name="tempStr3" id="tempStr3" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">临时字段4：</td>
											<td>
											   <input name="tempStr4" id="tempStr4" class="mini-textbox"   vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">临时字段5：</td>
											<td>
											   <input name="tempStr5" id="tempStr5" class="mini-textbox"  vtype = ""  required="false" />
											</td>

										</tr> -->

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
								<div title="表扩展子表" name="tabSysTableExtLineList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSysTableExtLine" permissionEdit="sys:sysTableExtLine:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSysTableExtLine" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/sys/sysTableExtLine/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>
											<div name="sort"  field="sort"   vtype="" headerAlign="center" allowSort="true"  width="60" >排序
												<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
												<input id="sort-Filter" name="mini-column-filter"  property="filter" class="mini-spinner" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysTableExtLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysTableExtLine')"
												/>
											</div>
											<div name="id"  field="id" readOnly="true"  vtype="required" headerAlign="center" allowSort="true"  width="64" visible="false">编码
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysTableExtLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysTableExtLine')"
												/>
											</div>
											<div name="tableExtId" hideable="true" visible="false"  field="tableExtId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div name="sqlField"  field="sqlField"   vtype="" headerAlign="center" allowSort="true"  width="100" >sql字段
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="sqlField-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysTableExtLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysTableExtLine')"
												/>
											</div>
											<div name="javaField"  field="javaField"   vtype="" headerAlign="center" allowSort="true"  width="100" >java字段
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="javaField-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysTableExtLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysTableExtLine')"
												/>
											</div>
											<div name="descr"  field="descr"   vtype="" headerAlign="center" allowSort="true"  width="150" >描述
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysTableExtLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysTableExtLine')"
												/>
											</div>
											<div name="sqlShortName"  field="sqlShortName"   vtype="" headerAlign="center" allowSort="true"  width="150" >表别名
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="sqlShortName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysTableExtLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysTableExtLine')"
												/>
											</div>
											<div name="javaObjName"  field="javaObjName"   vtype="" headerAlign="center" allowSort="true"  width="150" >对象名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="javaObjName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysTableExtLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysTableExtLine')"
												/>
											</div>
											 <div type="checkboxcolumn" field="isUpdateField" name="isUpdateField" trueValue="1" falseValue="0" width="60" headerAlign="center">是否需要更新
											 </div>       
											<div name="remarks"  field="remarks"  vtype="" headerAlign="center" allowSort="true" width="150" >备注
												<input property="editor" class="mini-textarea" style="width:100%;"  />
												<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysTableExtLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysTableExtLine')"
												/>
											</div>
											<div name="dataType"   field="dataType"   headerAlign="center" allowSort="true" width="100" type="comboboxcolumn" >数据类型
														<input property="editor"  class="mini-combobox"  required="true"   textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_table_ext_data_type"/>
														<input id="dataType-Filter" name="mini-column-filter"  property="filter" class="mini-combobox"   style="width:100%;" textField="label" valueField="value" url="${ctx}/sys/dict/listDataStr?type=sys_table_ext_data_type"
															   onvaluechanged="onFilterChangedChild(this,'gridSysTableExtLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysTableExtLine')"
														/>
													</div>
											<div name="format"  field="format"   vtype="" headerAlign="center" allowSort="true"  width="150" >数据格式
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="format-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysTableExtLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysTableExtLine')"
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
			    objId:"SysTableExt",
			    masterKeyField:"id",
				dataUrl:"${ctx}/sys/sysTableExt/data?showOtherSite=1",
				getUrl:"${ctx}/sys/sysTableExt/get",
				saveUrl:"${ctx}/sys/sysTableExt/save",
				removeUrl:"${ctx}/sys/sysTableExt/remove",
				exportUrl:"${ctx}/sys/sysTableExt/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                    {
		                 id:"gridSysTableExtLine",
		                 objId:"SysTableExtLine",
		                 FK:"tableExtId",
		                 cascade:true,
		                 cascadeVisible:true,
		                 tabName:"tabSysTableExtLineList",
						 dataUrl:"${ctx}/sys/sysTableExtLine/data",
						 getUrl:"${ctx}/sys/sysTableExtLine/get",
						 saveUrl:"${ctx}/sys/sysTableExtLine/save",
						 removeUrl:"${ctx}/sys/sysTableExtLine/remove",
						 exportUrl:"${ctx}/sys/sysTableExtLine/export",
						 initInsertUrl:"${ctx}/sys/sysTableExtLine/initInsert",
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
						id: 'a.table_name',
						label: '表名称',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.class_name',
						label: '类名称',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.descr',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.select_fields',
						label: '查询字段',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.insert_fields',
						label: '插入字段',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.insert_values',
						label: '插入值',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.update_fields',
						label: '更新字段',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.short_name',
						label: '表简称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.temp_str1',
						label: '临时字段1',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.temp_str2',
						label: '临时字段1临时字段2',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.temp_str3',
						label: '临时字段3',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.temp_str4',
						label: '临时字段4',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.temp_str5',
						label: '临时字段5',
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
     
     if(menuItem.menuNo=='createSqlField'){
    	 createSqlFields();
	 }
   }
   //////////子表格操作菜单项点击事件方法/////////
   function onGridSubOpMiClick_SysTableExtLine(e){
     var menuItem=null;
     if(e.item==undefined){
        menuItem=e.sender.item;
     }else{
        menuItem=e.item;
     }
   }

   
   function createSqlFields(){
	   var id = mini.get("id").getValue();
	   if(id==""){
		   mini.alert("请先保存");
		   return;
	   }
	   $.ajax({
           url: "${ctx}/sys/sysTableExt/createSqlFields",
        	data : {id:id},
           type: "post",
           dataType:"json",
           success: function (data) {
           		if(data.type='I'){
           		 	showTipM("info","提示","生成成功");
           		 	var form = new mini.Form("#editform");
           		 	form.setData(data.data);
           		}else{
           			showMessageBox("警告",data.message,"warning");
           		}
           },
           error: function (jqXHR, textStatus, errorThrown) {
               var callback=function (action) {
                   if(action=='详细')  viewErrorDetail(jqXHR.responseText);
               }
               var buttonsTemp=["ok","详细"];
               showMessageBox("错误","生成数据时报错","error",null,callback,buttonsTemp);
               form.unmask();
           }
       });
   }
</script>
</body>
</html>