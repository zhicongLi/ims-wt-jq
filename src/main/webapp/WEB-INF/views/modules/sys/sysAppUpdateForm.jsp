<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>版本更新</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysAppUpdate" permissionEdit="sys:sysAppUpdate:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysAppUpdate/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" >编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="versionName"  field="versionName" vtype=""  headerAlign="center" allowSort="true" width="200" >标题
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="versionName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="version"  field="version" vtype=""  headerAlign="center" allowSort="true" width="100" >描述
								<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
								<input id="version-Filter" name="mini-column-filter"  property="filter" class="mini-spinner"  allowLimitValue="false" style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="url"  field="url" vtype=""  headerAlign="center" allowSort="true" width="128" >下载地址
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="url-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="remarks"  field="remarks" readOnly="true"  headerAlign="center" allowSort="true" width="64" >更新内容
							</div>
							<div name="createDate"  field="createDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >创建时间
								<input property="editor" class="mini-datepicker" style="width:100%;"  />
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysAppUpdate:edit"></sys:toolbarformmain>
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
											<td style="text-align:right;">标题：</td>
											<td>
											   <input name="versionName" id="versionName" class="mini-textbox"  vtype = ""  required="false" style="width:500px;"/>
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">描述：</td>
											<td>
											   <input name="version" id="version" class="mini-spinner"  allowLimitValue="false" vtype = "" required="false" style="width:500px;"/>
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">下载地址：</td>
											<td> 
											   <input name="url" id="url" class="mini-textbox"  vtype = ""  required="false" style="width:500px;" readonly="readonly"/>
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">大小：</td>
											<td> 
											   <input name="appSize" id="appSize" class="mini-textbox"  vtype = ""  required="false" style="width:500px;" readonly="readonly"/>
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">APP上传：</td>
											<td id="uploadFile" ><input class="mini-htmlfile" name="file" id="file" style="width:500px;"/>
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
											   <input name="remarks" id="remarks" class="mini-textarea"  vtype = ""  required="false" style="width:500px;height:260px;"/>
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
						 </div>
		        </div><!--fit-->

	    </div>

   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysAppUpdate",
				dataUrl:"${ctx}/sys/sysAppUpdate/data",
				getUrl:"${ctx}/sys/sysAppUpdate/get",
				saveUrl:"${ctx}/sys/sysAppUpdate/save",
				removeUrl:"${ctx}/sys/sysAppUpdate/remove",
				exportUrl:"${ctx}/sys/sysAppUpdate/export"
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
					},{
						id: 'a.app_size',
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

   function saveForm() {
			var grid = mini.get("datagridMain");
			var form = new mini.Form("#editform");
			var o = form.getData();
			form.validate();
		    if (form.isValid() == false) {
		        showMessageBox("警告","保存失败,请检查输入内容(必填项,格式错误等)!","warning");
		        return;
		    }
		    
		    console.log("form data:",o.id);
			showMessageBox(null,"加载中，请稍后......","loading");
			var json = mini.encode([ o ]);
			json = mini.decode(json);
			var inputFile = $("#file > input:file")[0];
			$.ajaxFileUpload({
				type : "POST",
				url : '${ctx}/sys/sysAppUpdate/save', //用于文件上传的服务器端请求地址
				fileElementId : inputFile, //文件上传域的ID
				data : json[0], //附加的额外参数
				dataType : 'text', //返回值类型 一般设置为json
				// contentType:'application/json',
				success : function(data, status) { //服务器成功响应处理函数
					console.log("data:",data);
		        
					data = eval('(' + data + ')');
					
					if (data.status == 'success') {
						//var p1 = saveBizFormAttrData(data.temp);

					//	var p2 = saveBizFormStatusData(data.temp);
						//reloadRow(data.temp)
// 						if(data.data){
							
// 							form.reset();
							
// 							form.setData(data.data);
// 							renderFileHtml();
// 						}
// 						grid.reload();
						
					/////保存子表结束
// 					hideMessageBox( );
					  //去除主表不刷新
					formsSetChanged(mainForms,false);
					
						showTipM("success", "提示", data.message);
						
					} else {
// 						hideMessageBox( );
						showTipM("fail", "提示", data.message);
					}
				},
				error : function(data, status, e) { //服务器响应失败处理函数
					hideMessageBox( );
					alert(e);
				},
	            complete: function () {
					/*                 var jq = $("#file > input:file");
					 jq.before(inputFile);
					 jq.remove(); */
	                var filez = mini.get("file");
	                filez.destroy();
	            }
			});

		}
   
   function renderFileHtml(){
		
		/*  var edit_file = mini.get("excelFile");

	        //console.log("edit_file:",edit_file);

	        if(edit_file == null && edit_file == undefined ){
	            renderExcelFileHtml();
	        }
*/
		
		var textbox=new mini.HtmlFile();
		textbox.set({limitType:"*.xls;*.xlsx",id:"file",name:"file",width:"300"});
		//textbox.on("fileselect",newVersion);
		textbox.render("uploadFile");	
		
	}
   
</script>
</body>
</html>