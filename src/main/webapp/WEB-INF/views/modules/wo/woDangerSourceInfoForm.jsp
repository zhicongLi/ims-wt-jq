<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>危险因素及作业表</title>
	 <meta name="decorator" content="default"/>
	  <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="mini-fit">
	<div id="_splTreeMain" class="mini-splitter" style="width:100%;height:100%;">
	    <div size="240" showCollapseButton="true" style="overflow:auto;">
             <%-- <sys:treewithsearchbar dataUrl="${ctx}/wo-wt/wo/woDangerSource/dangerSourceTreeData" searchDisplay="none"  idField="id" valueField="id" textField="dangerName" parentField="parentId" textFieldLabel="名称" expandOnLoad="false" dynamicLoad="1" ></sys:treewithsearchbar> --%>
	         <%-- <sys:treewithsearchbar dataUrl="${ctx}/wo-wt/wo/woDangerSource/dangerSourceTreeData"  idField="id" valueField="id" textField="dangerName" parentField="parentId" textFieldLabel="名称" expandOnLoad="false" dynamicLoad="1"></sys:treewithsearchbar> --%>
	         <sys:treewithsearchbar dataUrl="${ctx}/wo-wt/wo/woDangerSource/workTreeData" idField="id" valueField="id" textField="dangerName" parentField="parentId" textFieldLabel="名称" expandOnLoad="false" dynamicLoad="1"></sys:treewithsearchbar>
	    </div>

		<div showCollapseButton="true">
					<div class="mini-fit">
					<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
						<div title="列表" id="tabList"  style="border: 0px;"  >
								<sys:toolbargridmain objId="WoDangerSourceInfo" permissionEdit="wo:woDangerSourceInfo:edit"></sys:toolbargridmain>								
								 <sys:searchadv></sys:searchadv>
								 <div class="mini-fit">
									<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/wo-wt/wo/woDangerSourceInfo/data" idField="id"
										 allowResize="true" pageSize="20"
										 allowCellSelect="true" multiSelect="false"
										 editNextOnEnterKey="true"  editNextRowCell="true"
										 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
									>
										<div property="columns">
											<div type="checkcolumn"></div>
											<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
												<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">id
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="100" >分类
													<input property="editor" class="mini-textarea" style="width:100%;"  />
													<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="processName"  field="processName" vtype=""  headerAlign="center" allowSort="true" width="100" >工序
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="processName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="sourceName"  field="sourceName" vtype=""  headerAlign="center" allowSort="true" width="100" >危险源名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="sourceName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="factorName"  field="factorName" vtype=""  headerAlign="center" allowSort="true" width="500" >危害因素名称 
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="factorName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="measureName"  field="measureName" vtype=""  headerAlign="center" allowSort="true" width="500" >危害作业标准
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="measureName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
												<div name="riskGradeCode"  field="riskGradeCode" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">风险等级编码
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="riskGradeCode-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="riskGradeName"  field="riskGradeName" vtype=""  headerAlign="center" allowSort="true" width="64" >风险等级
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="riskGradeName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="consequenceName"  field="consequenceName" vtype=""  headerAlign="center" allowSort="true" width="64" >危害后果
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="consequenceName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
												<div name="consequenceCode"  field="consequenceCode" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">危害后果编码
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
													<input id="consequenceCode-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									                                  onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
													/>
												</div>
									</div>
								</div>
							 </div>
						</div>
						<div title="明细" id="tabForm"  style="border: 0px;"  >
							<sys:toolbarformmain permissionEdit="wo:woDangerSourceInfo:edit"></sys:toolbarformmain>
									<div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
											<input class="mini-hidden" name="id" id="id"/>
											<input class="mini-hidden" name="dangerSourceId" id="dangerSourceId"/>
											<input class="mini-hidden" name="seqNo1" id="seqNo1"/>
											<input class="mini-hidden" name="seqNo2" id="seqNo2"/>
											<input class="mini-hidden" name="remarks" id="remarks"/>
											<table border="0" cellpadding="3" cellspacing="3" >
												<tr>
													<td style="text-align:right;">工序 ：</td>
													<td colspan="3">
													   <input name="processName" id="processName" class="mini-textbox"  vtype = ""  required="false" style="width: 100%;"/>
													</td>

												</tr>
												<tr>
													<td style="text-align:right;">危害因素名称 ：</td>
													<td colspan="3">
													   <input name="factorName" id="factorName" class="mini-textbox"  vtype = ""  required="false" style="width: 100%;"/>
													</td>

												</tr>
												<tr>
													<td style="text-align:right;">危害作业标准：</td>
													<td colspan="4">
													   <input name="measureName" id="measureName" class="mini-textarea" vtype = ""  required="false" style="width: 100%;height: 200px;" />
													</td>
												</tr>
												<tr>

												</tr>
												<tr>
													<td style="text-align:right;">危险源名称：</td>
													<td colspan="3">
													   <input name="sourceName" id="sourceName" class="mini-textbox"  vtype = ""  required="false" style="width: 100%;"/>
													</td>
													
													<!-- <td>
														<input name="riskGradeCode" id="riskGradeCode" property="editor"
															class="mini-combobox" tyle="width: 40px;" required="false"
															valueField="code" textField="name"
															url="${ctx}/wo/woDangerRiskGrade/dictData" />
													</td> ->
													<!-- <td style="text-align:right;">风险等级描述：</td>
													<td>
													   <input name="riskGradeName" id="riskGradeName" class="mini-textbox"  vtype = ""  required="false" />
													</td> -->

												</tr>
												<tr>
													<td style="text-align:right;">风险等级：</td>
													<td>
													  <!--  <input name="riskGradeName" id="riskGradeName" class="mini-textbox"  vtype = ""  required="false" /> -->
													  <input name="riskGradeCode" id="riskGradeCode" property="editor" textName="riskGradeName"
															class="mini-combobox" tyle="width: 40px;" required="false"
															valueField="code" textField="name"
															url="${ctx}/wo/woDangerRiskGrade/dictData" />
													</td>
													<td style="text-align:right;">危害后果：</td>
													<td>
													   <input name="consequenceName" id="consequenceName" class="mini-textbox"  vtype = ""  required="false" />
													</td>
													<!-- <td>
														 <input name="consequenceCode" id="consequenceCode" property="editor"
															class="mini-combobox" tyle="width: 40px;" required="false"
															valueField="code" textField="name"
															url="${ctx}/wo/woDangerConsequence/dictData" />
													</td> -->
													<!-- <td style="text-align:right;">危害后果编码：</td>
													<td>
													   <input name="consequenceCode" id="consequenceCode" class="mini-textbox"  vtype = ""  required="false" />
													</td> -->

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

							 </div><!--fit-->

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
			    objId:"WoDangerSourceInfo",
			    masterKeyField:"id",
			    treeFilter:"a.danger_source_id='[node.id]'",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
			    treeParentField:"parentId",
				dataUrl:"${ctx}/wo-wt/wo/woDangerSourceInfo/data?dynamicLoad=1&initParentId=",
				getUrl:"${ctx}/wo-wt/wo/woDangerSourceInfo/get",
				saveUrl:"${ctx}/wo-wt/wo/woDangerSourceInfo/save",
				removeUrl:"${ctx}/wo-wt/wo/woDangerSourceInfo/remove",
				exportUrl:"${ctx}/wo-wt/wo/woDangerSourceInfo/export"
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
						label: 'id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.factor_name',
						label: '危害因素名称 ',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.measure_name',
						label: '危害作业标准',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.remarks',
						label: '备注',
						type: 'string',
						default_value: '',
						size: 500
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
						id: 'a.source_name',
						label: '危险源名称',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.risk_grade_code',
						label: '风险等级编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.risk_grade_name',
						label: '风险等级描述',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.consequence_name',
						label: '危害后果名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.consequence_code',
						label: '危害后果编码',
						type: 'string',
						default_value: '',
						size: 64
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
   function ImportExcelNew(){
	 var grid=mini.get("datagridMain");
	     mini.open({
	 			//targetWindow: window,   //页面对象。默认是顶级页面。
	 		    url: "${ctx}/wo/woDangerSourceInfo/importNew",        //页面地址
	 		    title: "导入",      //标题
	 		    width: 600,      //宽度
	 		    height: 300,     //高度
	 		    allowResize: true,       //允许尺寸调节
	 		    allowDrag: true,         //允许拖拽位置
	 		    showCloseButton: true,   //显示关闭按钮
	 		    showModal: false,         //显示遮罩
	 		    loadOnRefresh: false,       //true每次刷新都激发onload事件
	 		    ondestroy: function (action) { 
	 		    	if(action=="ok"){
	 		    		showMessageBox("提示","上传成功","info");
	 		    		grid.reload ( );
	 		    	}else if(action=="no"){
	 		    		showMessageBox("提示","上传失败，请检查数据有效性","info");
	 		    	}
	 		    }
	 		});
	}
</script>
</body>
</html>