<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>安全检查问题</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SmCheckQuestion" permissionEdit="sm:smCheckQuestion:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/data" idField="id"
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

							<div name="checkId"  field="checkId" vtype=""  headerAlign="center" allowSort="true" width="64" >安全检查id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="checkId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="reportBy"  field="reportBy" vtype=""  headerAlign="center" allowSort="true" width="64" >发现人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="reportBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="reportByName"  field="reportByName" vtype=""  headerAlign="center" allowSort="true" width="64" >发现人名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="reportByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="reportDept"  field="reportDept" vtype=""  headerAlign="center" allowSort="true" width="64" >发现部门id
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="reportDept-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="reportDeptName"  field="reportDeptName" vtype=""  headerAlign="center" allowSort="true" width="64" >发现部门名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="reportDeptName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="reportDate"  field="reportDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >发现时间
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="reportDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="descrs"  field="descrs" vtype=""  headerAlign="center" allowSort="true" width="500" >问题描述
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="descrs-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="dealBy"  field="dealBy" vtype=""  headerAlign="center" allowSort="true" width="64" >处理人
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="dealBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="dealByName"  field="dealByName" vtype=""  headerAlign="center" allowSort="true" width="64" >处理人名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="dealByName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="dealDept"  field="dealDept" vtype=""  headerAlign="center" allowSort="true" width="64" >处理部门
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="dealDept-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="dealDeptName"  field="dealDeptName" vtype=""  headerAlign="center" allowSort="true" width="64" >处理部门名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="dealDeptName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="dealDate"  field="dealDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >处理时间
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="dealDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="dealNote"  field="dealNote" vtype=""  headerAlign="center" allowSort="true" width="500" >处理说明
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="dealNote-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="types"  field="types" vtype=""  headerAlign="center" allowSort="true" width="64" >类型
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="types-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sm:smCheckQuestion:edit"></sys:toolbarformmain>
                  <div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="发现情况" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
									<input class="mini-hidden" name="id" id="id"/>
									<input class="mini-hidden" name="reportDeptName" id="reportDeptName"/><%--发现部门名称--%>
									<input class="mini-hidden" name="reportByName" id="reportByName"/><%--发现人名称 --%>
									<input class="mini-hidden" name="dealByName" id="dealByName"/><%-- 处理人名称--%>
									<input class="mini-hidden" name="dealDeptName" id="dealDeptName"/><%-- 处理部门名称--%>
									<input class="mini-hidden" name="checkId" id="checkId"/><%-- 安全检查id--%>
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>

											<td style="text-align:right;">发现人名称：</td>
											<td>
												<input name="reportBy" id="reportBy" textName="reportByName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
													   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smUserList',850,500,'id,name','reportBy,reportByName')"   />
											</td>


											<td style="text-align:right;">发现部门名称：</td>
											<td>
												<input name="reportDept" id="reportDept" textName="reportDeptName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
													   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smOrgList',850,500,'id,name','reportDept,reportDeptName')"   />
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">发现时间：</td>
											<td>
											   <input name="reportDate" id="reportDate" class="mini-datepicker" showtime="true" format="yyyy-MM-dd HH:mm:ss" timeformat="HH:mm:ss" vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">问题描述：</td>
											<td>
											   <input name="descrs" id="descrs" class="mini-textbox"  vtype = ""  required="false" />
											</td>


										</tr>
									</table>
								</div>
								<div class="mini-panel" title="处理情况" width="auto" height="auto"
									 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

								>
									<table>
									<div>
										<tr>
											<td style="text-align:right;">处理人名称：</td>
											<td>
												<input name="dealBy" id="dealBy" textName="dealByName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
													   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smUserList',850,500,'id,name','dealBy,dealByName')"   />
											</td>
											<td style="text-align:right;">处理部门名称：</td>
											<td>
												<input name="dealDept" id="dealDept" textName="dealDeptName" class="mini-buttonedit"  vtype = ""  required="false" width="180px" allowInput="false"
													   onbuttonclick="popLov(this,'选择',false,true,'${ctxRoot}/form?view=sm/smOrgList',850,500,'id,name','dealDept,dealDeptName')"   />
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">处理时间：</td>
											<td>
											   <input name="dealDate" id="dealDate" class="mini-datepicker" showtime="true" format="yyyy-MM-dd HH:mm:ss" timeformat="HH:mm:ss" vtype = ""  required="false" />
											</td>


											<td style="text-align:right;">处理说明：</td>
											<td>
											   <input name="dealNote" id="dealNote" class="mini-textbox"  vtype = ""  required="false" />
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">类型：</td>
											<td>
											   <input name="types" id="types" class="mini-textbox"   vtype = "" required="false" />
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
			    objId:"SmCheckQuestion",
				dataUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/data",
				getUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/get",
				saveUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/save",
				removeUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/remove",
				exportUrl:"${ctx}/ims-check${ims_check_suffix}/sm/smCheckQuestion/export",
				initData:{checkId:'${param.checkId}'}
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
						label: '编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_by_name',
						label: '创建人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.tenant_id',
						label: '租户id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_by',
						label: '创建人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_dept',
						label: '创建部门',
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
						id: 'a.update_by_name',
						label: '修改人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.update_by',
						label: '修改人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.update_date',
						label: '修改时间',
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
						id: 'a.site_id',
						label: '站点id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.remarks',
						label: '备注',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.check_id',
						label: '安全检查id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.report_by',
						label: '发现人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.report_by_name',
						label: '发现人名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.report_dept',
						label: '发现部门id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.report_dept_name',
						label: '发现部门名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.report_date',
						label: '发现时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.descrs',
						label: '问题描述',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.deal_by',
						label: '处理人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.deal_by_name',
						label: '处理人名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.deal_dept',
						label: '处理部门',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.deal_dept_name',
						label: '处理部门名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.deal_date',
						label: '处理时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.deal_note',
						label: '处理说明',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.types',
						label: '类型',
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