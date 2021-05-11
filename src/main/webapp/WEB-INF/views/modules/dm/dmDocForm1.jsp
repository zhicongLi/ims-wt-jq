<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>文档管理</title>
<meta name="decorator" content="default" />
<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css"
	rel="stylesheet" />
</head>
<body>
	<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false"
		style="width: 100%; height: 100%;">
		<div title="列表" id="tabList" style="border: 0px;">
			<sys:toolbargridmain objId="DmDoc" permissionEdit="dm:dmDoc:edit"></sys:toolbargridmain>
			<sys:searchadv></sys:searchadv>
			<div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid"
					style="width: 100%; height: 100%;" url="${ctx}/dm/dmDoc/data"
					idField="id" allowResize="true" pageSize="10"
					allowCellSelect="true" multiSelect="false"
					editNextOnEnterKey="true" editNextRowCell="true"
					allowAlternating="true" showFilterRow="true"
					showColumnsMenu="false">
					<div property="columns">
						<div type="indexcolumn"></div>
						<div name="action" width="120" headerAlign="center" align="center"
							renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
						<div name="id" field="id" vtype="required" readOnly="true"
							headerAlign="center" allowSort="true" width="64">
							编号 <input property="editor" class="mini-textbox"
								style="width: 100%;" /> <input id="id-Filter"
								name="mini-column-filter" property="filter" class="mini-textbox"
								style="width: 100%;" onvaluechanged="onFilterChanged"
								showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="descr" field="descr" vtype="" headerAlign="center"
							allowSort="true" width="100">
							描述 <input property="editor" class="mini-textbox"
								style="width: 100%;" /> <input id="descr-Filter"
								name="mini-column-filter" property="filter" class="mini-textbox"
								style="width: 100%;" onvaluechanged="onFilterChanged"
								showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						<div name="objKey" field="objKey" vtype="" headerAlign="center"
							allowSort="true" width="100">
							对象编码 <input property="editor" class="mini-textbox"
								style="width: 100%;" /> <input id=objKey-Filter
								" name="mini-column-filter" property="filter"
								class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true"
								oncloseclick="onFilterClose(this)" />
						</div>
						<div name="objDescr" field="objDescr" vtype=""
							headerAlign="center" allowSort="true" width="100">
							对象描述 <input property="editor" class="mini-textbox"
								style="width: 100%;" /> <input id=objDescr-Filter
								" name="mini-column-filter" property="filter"
								class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true"
								oncloseclick="onFilterClose(this)" />
						</div>
						<div name="objType" field="objType" vtype="" type="comboboxcolumn"
							headerAlign="center" allowSort="true" width="100">
							对象类型 <input property="editor" class="mini-combobox"
								style="width: 100%;" valueField="value" textField="label"
								url="${ctx}/sys/dict/listDataStr?type=party_file_type" /> <input
								id="objType-Filter" name="mini-column-filter" property="filter"
								class="mini-combobox" valueField="value" textField="label"
								multiSelect="true"
								url="${ctx}/sys/dict/listDataStr?type=party_file_type"
								style="width: 100%;"
								showClose="true"
								onvaluechanged="onFilterChanged" showClose="true"
								oncloseclick="onFilterClose(this)" />
						</div>
						<div name="docPath" field="docPath" vtype="" headerAlign="center"
							allowSort="true" width="100">
							文档路径 <input property="editor" class="mini-textbox"
								style="width: 100%;" /> <input id=docPath-Filter
								" name="mini-column-filter" property="filter"
								class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true"
								oncloseclick="onFilterClose(this)" />
						</div>
						<div name="docFileName" field="docFileName" vtype=""
							headerAlign="center" allowSort="true" width="100">
							文件名称 <input property="editor" class="mini-textbox"
								style="width: 100%;" /> <input id=docFileName-Filter
								" name="mini-column-filter" property="filter"
								class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true"
								oncloseclick="onFilterClose(this)" />
						</div>
						<div name="createBy" field="createBy" vtype=""
							headerAlign="center" allowSort="true" width="100">
							创建者 <input property="editor" class="mini-textbox"
								style="width: 100%;" /> <input id=createBy-Filter
								" name="mini-column-filter" property="filter"
								class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true"
								oncloseclick="onFilterClose(this)" />
						</div>
						<div name="createDate" field="createDate" vtype=""
							dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center"
							allowSort="true" width="100">
							创建时间 <input property="editor" class="mini-textbox"
								style="width: 100%;" /> <input id="createDate-Filter"
								name="mini-column-filter" property="filter" class="mini-textbox"
								style="width: 100%;" onvaluechanged="onFilterChanged"
								showClose="true" oncloseclick="onFilterClose(this)" />
						</div>
						
						<div name="seqNo" field="seqNo" vtype="" headerAlign="center"
							allowSort="true" width="100">
							序号 <input property="editor" class="mini-textbox"
								style="width: 100%;" /> <input id=seqNo-Filter
								" name="mini-column-filter" property="filter"
								class="mini-textbox" style="width: 100%;"
								onvaluechanged="onFilterChanged" showClose="true"
								oncloseclick="onFilterClose(this)" />
						</div>
					
                   </div>
				</div>
			</div>
		</div>
		<div title="明细" id="tabForm" style="border: 0px;">
			<sys:toolbarformmain permissionEdit="dm:dmDoc:edit"></sys:toolbarformmain>
			<div id="editform" class="form" style="width: 100%;">
				<div class="container" style="width: 100%;">
					<div class="mini-clearfix ">
						<div class="mini-col-12">
							<div class="mini-panel" title="基本信息" width="auto" height="auto"
								showCollapseButton="true" onbuttonclick="onPanelButtonClick"
								name="_panel_exp">
								<input class="mini-hidden" name="id" id="id" />
								<table border="0" cellpadding="3" cellspacing="3">
									<tr>
										<td style="text-align: right;">对象类型：</td>
										<td><input name="objType" id="objType" width="100%"
											class="mini-combobox"  vtype = ""  required="false" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=party_file_type" /></td>
										
									</tr>
									<tr>
									    <td style="text-align: right;">展示图片：</td>
										<td id="uploadFile1">
										<input width="100%" name="file2" id="file2" class="mini-htmlfile"
											vtype="" required="false" />
										</td>
									</tr>
									
									<tr>
										<td style="text-align: right;">文件名称：</td>
										<td id=>
										<input width="500" name="docFileName" id="docFileName" class="mini-textbox"
											vtype="" required="false" />
										</td>
									</tr>
									<!-- <tr>
										<td style="text-align: right;">文件名称：</td>
										<td><input name="docFileName" id="docFileName"
											class="mini-textbox" vtype="" required="false" /></td>
										<td style="text-align: right;">文档路径：</td>
										<td><input name="docPath" id="docPath"
											class="mini-textbox" vtype="" required="false" /></td>
									</tr> -->
									<tr>
										<td>附件</td>
										<td id="uploadFile" >
										<input width="500" class="mini-htmlfile" name="file" id="file" />
										</td> 
									</tr>
									
									<tr>
										<td style="text-align: right;">描述：</td>
										<td ><input name="descr" id="descr" class="mini-textarea"
											vtype="" required="false" style="width: 500px;height: 80px"/></td>
											
											
									</tr>
								</table>
							</div>
						</div>
						<!--mini-col-->
					</div>
					<!--clearfix-->
				</div>
				<!--container-->
			</div>
			<!--editform-->

		</div>
	</div>
	
	
	<sys:toolbarfooter></sys:toolbarfooter>
	<sys:excelframe></sys:excelframe>

	<script type="text/javascript">
		initBase({
			id : "datagridMain",
			objId : "DmDoc",
			masterKeyField : "id",
			dataUrl : "${ctx}/dm/dmDoc/data",
			getUrl : "${ctx}/dm/dmDoc/get",
			saveUrl : "${ctx}/dm/dmDoc/formSave",
			removeUrl : "${ctx}/dm/dmDoc/remove",
			exportUrl : "${ctx}/dm/dmDoc/export",
		});
		
	/* 	function saveForm() {
			var form = new mini.Form("#editform");
			console.log(form);
			alert("11111111111111"+form);

		}
		 */
		initChilds("#editform", "tabsMain", []

		);
		initQb("#builder", "pnlQuery", "tabsQuery", "txtSQL", "btnAdvSearch", [
				{
					id : 'a.id',
					label : '编码',
					type : 'string',
					default_value : '',
					size : 64
				}, {
					id : 'a.descr',
					label : '描述',
					type : 'string',
					default_value : '',
					size : 255
				}, {
					id : 'a.obj_key',
					label : '对象编码',
					type : 'string',
					default_value : '',
					size : 200
				}, {
					id : 'a.obj_descr',
					label : '对象描述',
					type : 'string',
					default_value : '',
					size : 120
				}, {
					id : 'a.obj_type',
					label : '对象类型',
					type : 'string',
					default_value : '',
					size : 64
				}, {
					id : 'a.doc_path',
					label : '文档路径',
					type : 'string',
					default_value : '',
					size : 255
				}, {
					id : 'a.doc_file_name',
					label : '文件名称',
					type : 'string',
					default_value : '',
					size : 255
				}, {
					id : 'a.create_by',
					label : '创建者',
					type : 'string',
					default_value : '',
					size : 64
				}, {
					id : 'a.create_date',
					label : '创建时间',
					type : 'datetime',
					default_value : '',
					size : 120,
					plugin : 'datepicker',
					plugin_config : {
						format : 'yyyy-mm-dd',
						todayBtn : 'linked',
						todayHighlight : true,
						autoclose : true,
						language : "zh-CN"
					}
				}, {
					id : 'a.update_by',
					label : '更新者',
					type : 'string',
					default_value : '',
					size : 64
				}, {
					id : 'a.update_date',
					label : '更新时间',
					type : 'datetime',
					default_value : '',
					size : 120,
					plugin : 'datepicker',
					plugin_config : {
						format : 'yyyy-mm-dd',
						todayBtn : 'linked',
						todayHighlight : true,
						autoclose : true,
						language : "zh-CN"
					}
				}, {
					id : 'a.remarks',
					label : '备注信息',
					type : 'string',
					default_value : '',
					size : 255
				} ]);
		
		loadWindow();
		
		
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
				url : '${ctx}/dm/dmDoc/save', //用于文件上传的服务器端请求地址
				fileElementId : inputFile, //文件上传域的ID
				data : json[0], //附加的额外参数
				dataType : 'text', //返回值类型 一般设置为json
				success : function(data, status) { //服务器成功响应处理函数
			console.log("data:",data);
					data = eval('(' + data + ')');
					if (data.status == 'success') {
						if(data.data){
							form.reset();
							form.setData(data.data);
							renderFileHtml();
						}
						grid.reload();
						
					/////保存子表结束
					hideMessageBox( );
						showTipM("success", "提示", data.message);
					} else {
						hideMessageBox( );
						showTipM("fail", "提示", data.message);
					}
				},
				error : function(data, status, e) { //服务器响应失败处理函数
					hideMessageBox( );
					alert(e);
				},
	            complete: function () {
	                var filez = mini.get("file");
	                filez.destroy();
	            }
			});
		}
		
		function renderFileHtml(){
			var textbox=new mini.HtmlFile();
			textbox.set({limitType:"*.xls;*.xlsx",id:"file",name:"file",width:"300"});
			textbox.render("uploadFile");	
			
		}
		
	</script>
</body>
</html>