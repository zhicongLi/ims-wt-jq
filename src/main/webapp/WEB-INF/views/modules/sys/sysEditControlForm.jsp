<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>是否可编辑控制</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysEditControl" permissionEdit="sys:sysEditControl:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="${ctx}/ims-ext/sys/sysEditControl/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="120"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" hideable="true"  visible="false" >编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="objName"  field="objName" vtype=""  headerAlign="center" allowSort="true" width="200" >对象名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="objName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="true" width="200" >名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div name="seqNo"  field="seqNo" vtype=""  headerAlign="center" allowSort="true" width="200" >序号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="seqNo-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
							<div type="checkboxcolumn" field="isActive" trueValue="1" falseValue="0" width="60" headerAlign="center">是否启用</div>
							<div type="checkboxcolumn" field="isInit" trueValue="1" falseValue="0" width="60" headerAlign="center">是否初始化</div>
							<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="200" >备注
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
									   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
								/>
							</div>
				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysEditControl:edit"></sys:toolbarformmain>
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
											<td  colspan="1">
											   <input name="remarks" id="remarks" class="mini-textArea"  vtype = ""  required="false" width="100%"/>
											</td>
											<td style="text-align:right;"  width="150px">是否初始化：</td>
											<td width="150px">
											   <input name="isInit" id="isInit" class="mini-CheckBox"   trueValue="1" falseValue="0" vtype = "" required="false" />
											</td>
										</tr>
										<tr>
											<td style="text-align:right;">url：</td>
											<td  colspan="5">
											   <input name="formUrl" id="formUrl" class="mini-textbox"  vtype = ""  required="false" width="100%" />
											</td> 
											<td style="text-align:right;">KEY：</td>
											<td  colspan="1">
											   <input name="queryKey" id="queryKey" class="mini-textbox"  vtype = ""  required="false" width="100%"/>
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
								
								<div title="条件" name="tabSysEditControlCondtionList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSysEditControlCondtion" permissionEdit="sys:sysEditControlCondtion:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSysEditControlCondtion" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-ext/sys/sysEditControlCondtion/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>

											<div name="id"  field="id" readOnly="true"  vtype="required" headerAlign="center" allowSort="true" hideable="true"  visible="false"  width="64" >编号
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysEditControlCondtion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysEditControlCondtion')"
												/>
											</div>
											
											<div name="editControlId" hideable="true" visible="false"  field="editControlId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div name="fieldType"  field="fieldType" vtype=""  headerAlign="center" allowSort="true" width="64" type="comboboxcolumn" >字段类型
												<input property="editor" class="mini-combobox"  style="width:100%;"  valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_edit_control_condtion_field_type"  />
											</div>
											
											<div name="valueMethod"  field="valueMethod" vtype=""  headerAlign="center" allowSort="true" width="64" type="comboboxcolumn" >获取方式
												<input property="editor" class="mini-combobox"  style="width:100%;"  valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_edit_control_condtion_value_method"  />
											</div>
											<div name="fieldName"  field="fieldName"   vtype="" headerAlign="center" allowSort="true"  width="64" >字段名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="fieldName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysEditControlCondtion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysEditControlCondtion')"
												/>
											</div>
											<div name="fieldDesc"  field="fieldDesc"   vtype="" headerAlign="center" allowSort="true"  width="64" >字段描述
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="fieldDesc-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysEditControlCondtion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysEditControlCondtion')"
												/>
											</div>
											<div name="fieldValue"  field="fieldValue"   vtype="" headerAlign="center" allowSort="true"  width="64" >字段值
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="fieldValue-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysEditControlCondtion')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysEditControlCondtion')"
												/>
											</div>
											<div name="condGroup"  field="condGroup" vtype="required"   headerAlign="center" allowSort="true" width="64" type="comboboxcolumn" >条件分组
												<input property="editor" class="mini-combobox"  style="width:100%;"  valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_edit_control_condtion_cond_group"  />
											</div>

										</div>
									</div>
								 </div>
							  </div>
							  <div title="可编辑字段" name="tabSysEditControlLineList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSysEditControlLine" permissionEdit="sys:sysEditControlLine:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSysEditControlLine" class="mini-datagrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-ext/sys/sysEditControlLine/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="true"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>
											<div name="sort"  field="sort" headerAlign="center" allowSort="true" width="60" >排序
												<input property="editor" class="mini-textbox" style="width:100%;" />
											</div>
											<div name="id"  field="id" readOnly="true"  vtype="required" headerAlign="center" allowSort="true"  width="64" hideable="true"  visible="false">编号
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild('gridSysEditControlLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysEditControlLine')"
												/>
											</div>
											<div name="editControlId" hideable="true" visible="false"  field="editControlId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div name="fieldName"  field="fieldName"   vtype="" headerAlign="center" allowSort="true"  width="64" >字段名称
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="fieldName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysEditControlLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysEditControlLine')"
												/>
											</div>
											<div name="fieldDesc"  field="fieldDesc"   vtype="" headerAlign="center" allowSort="true"  width="64" >字段描述
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="fieldDesc-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysEditControlLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysEditControlCondtion')"
												/>
											</div>
											<div name="type"  field="type" vtype=""  headerAlign="center" allowSort="true" width="64" type="comboboxcolumn" sortField="a.type">类型
												<input property="editor" class="mini-combobox"  style="width:100%;"  valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_edit_control_line_type"  />
											</div>
											<div type="checkboxcolumn" field="isEdit" trueValue="1" falseValue="0" width="60" headerAlign="center">是否可编辑</div>
											<div type="checkboxcolumn" field="isRequired" trueValue="1" falseValue="0" width="60" headerAlign="center">是否必填</div>
											<div name="formId"  field="formId"   vtype="" headerAlign="center" allowSort="true"  width="64" >表单id
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
												<input id="formId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChangedChild(this,'gridSysEditControlLine')" showClose="true" oncloseclick="onChildFilterClose(this,'gridSysEditControlLine')"
												/>
											</div>
											<div name="condGroup"  field="condGroup" vtype="required"  headerAlign="center" allowSort="true" width="64" type="comboboxcolumn" >条件分组
												<input property="editor" class="mini-combobox"  style="width:100%;"  valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_edit_control_condtion_cond_group"  />
											</div>
											<div name="message"  field="message"   vtype="" headerAlign="center" allowSort="true"  width="64" >提示信息
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
											</div>
											<div name="maxLength"  field="maxLength"   vtype="" headerAlign="center" allowSort="true"  width="64" >字符最大长度
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
											</div>
											<div name="minRowNum"  field="minRowNum"   vtype="" headerAlign="center" allowSort="true"  width="64" >表格最少行数
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
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
			    objId:"SysEditControl",
			    masterKeyField:"id",
				dataUrl:"${ctx}/ims-ext/sys/sysEditControl/data",
				getUrl:"${ctx}/ims-ext/sys/sysEditControl/get",
				saveUrl:"${ctx}/ims-ext/sys/sysEditControl/save",
				removeUrl:"${ctx}/ims-ext/sys/sysEditControl/remove",
				exportUrl:"${ctx}/ims-ext/sys/sysEditControl/export"
				
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                    {
		                 id:"gridSysEditControlLine",
		                 objId:"SysEditControlLine",
		                 FK:"editControlId",
		                 cascade:true,
		                 cascadeVisible:true,
		                 tabName:"tabSysEditControlLineList",
						 dataUrl:"${ctx}/ims-ext/sys/sysEditControlLine/data",
						 getUrl:"${ctx}/ims-ext/sys/sysEditControlLine/get",
						 saveUrl:"${ctx}/ims-ext/sys/sysEditControlLine/save",
						 removeUrl:"${ctx}/ims-ext/sys/sysEditControlLine/remove",
						 exportUrl:"${ctx}/ims-ext/sys/sysEditControlLine/export",
						 initInsertUrl:"${ctx}/ims-ext/sys/sysEditControlLine/initInsert?type=1&condGroup=1&isEdit=1"
	                    }
	                    ,{
		                 id:"gridSysEditControlCondtion",
		                 objId:"SysEditControlCondtion",
		                 FK:"editControlId",
		                 cascade:true,
		                 cascadeVisible:true,
		                 tabName:"tabSysEditControlCondtionList",
						 dataUrl:"${ctx}/ims-ext/sys/sysEditControlCondtion/data",
						 getUrl:"${ctx}/ims-ext/sys/sysEditControlCondtion/get",
						 saveUrl:"${ctx}/ims-ext/sys/sysEditControlCondtion/save",
						 removeUrl:"${ctx}/ims-ext/sys/sysEditControlCondtion/remove",
						 exportUrl:"${ctx}/ims-ext/sys/sysEditControlCondtion/export",
						 initInsertUrl:"${ctx}/ims-ext/sys/sysEditControlCondtion/initInsert?fieldType=1&condGroup=1&valueMethod=1"
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
$(function(){
	var str = '<a class="mini-button" id="_tbgridSysEditControlLine_copyFromOther" iconCls="icon-upload-alt"  onclick="copyData()" plain="true">复制数据</a>';
	$("#_tbgridSysEditControlLine").find("table tr td").first().append($(str));
	str = '<a class="mini-button" id="_tbgridSysEditControlLine_formUrl"   onclick="formUrlConfig()" plain="true">配置数据</a>';
	$("#_tbgridSysEditControlLine").find("table tr td").first().append($(str));
	mini.parse();
});

function formUrlConfig(){
	
	var formUrl = mini.get("formUrl").getValue();
	if(formUrl==''){
		mini.alert('请先配置url');
		return;
	}
	var id = mini.get("id").getValue();
	formUrl = escape(formUrl);
	var url = '${ctxRoot}/form?view=sys/sysEditControlEditForm&formUrl='+formUrl+"&editControlId="+id;
	var name = mini.get("name").getValue();
	name +='编辑控制';
	newTabPage(name,url,true);
}

function copyData(obj){
	var param={
			obj:obj,
			title:"选择数据",
			multiSel:true,
			readOnly:true,							
			url:"${ctxRoot}/form/view=sys/sysEditControlLineList",
			width:850,
			height:500,
			selFields:'fieldName,fieldDesc,type,isEdit,isRequired,formId,condGroup,message,maxLength,minRowNum',
			refFields:'fieldName,fieldDesc,type,isEdit,isRequired,formId,condGroup,message,maxLength,minRowNum',
			refGridId:null,
			actionLovValid:null,
			actionLov:returnSelectData,
			actionClose:null,
			gridId:"datagridMain",
			allowDblclickSelect:true
	};					
	var data1 = popLov2(param);
	//popLov(obj,'请选择班组',false,true,'${ctx}/sys/sysEditControlLine/list',850,500,'fieldName,fieldDesc,type,isEdit,isRequired,formId,condGroup,message','fieldName,fieldDesc,type,isEdit,isRequired,formId,condGroup,message',gridId)
}
function returnSelectData(s){
	var editControlId = mini.get("id").getValue();
  for(var i=0;i<s.length;i++){
		//在这里新增表格的数据
		var grid = mini.get("gridSysEditControlLine");
		var row = {
				fieldName:s[i].fieldName,
				fieldDesc:s[i].fieldDesc,
				type:s[i].type,
				isEdit:s[i].isEdit,
				isRequired:s[i].isRequired,
				formId:s[i].formId,
				condGroup:s[i].condGroup,
				message:s[i].message,
				editControlId:editControlId,
				maxLength:s[i].maxLength,
				minRowNum:s[i].minRowNum
		};
		grid.addRow(row);
	}
	
}

</script>
</body>
</html>