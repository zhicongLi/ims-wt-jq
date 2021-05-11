<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>用户组</title>
	 <meta name="decorator" content="default"/>
	<%@ page contentType="text/html;charset=UTF-8" %><meta http-equiv="Content-Type" content="text/html;charset=utf-8" /><meta name="author" content="http://treps.com/"/>
	<link rel="shortcut icon" href="${ctxStatic}/images/favicon.ico" />
	<meta name="renderer" content="webkit"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<%--<meta http-equiv="Expires" content="0"><meta http-equiv="Cache-Control" content="no-cache"><meta http-equiv="Cache-Control" content="no-store">--%>

	<%--<link href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'cerulean'}/bootstrap.min.css" type="text/css" rel="stylesheet" />--%>
	<%--<link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome.min.css" type="text/css" rel="stylesheet" />--%>

	<%--<link href="${ctxStatic}/bootstrap/3.3.6/css/bootstrap.min.css" type="text/css" rel="stylesheet" />--%>
	<%--<script src="${ctxStatic}/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>--%>
	<%--<link href="${ctxStatic}/bootstrap/3.3.6/awesome/font-awesome.min.css" type="text/css" rel="stylesheet" />--%>
	<%--<link href="${ctxStatic}/bootstrap/3.3.6/awesome/font-awesome.css" type="text/css" rel="stylesheet" />--%>
	<script src="${ctxStatic}/jquery/jquery-1.12.4.min.js"></script>
	<%--<script src="${ctxStatic}/jquery/jquery-3.3.1.min.js"></script>--%>
	<script src="${ctxStatic}/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<%--<link rel="stylesheet" href="${ctxStatic}/bootstrap/3.3.7/css/bootstrap.css">--%>
	<link href="${ctxStatic}/Font-Awesome/3.2.1/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/trepsui/scripts/boot.js" type="text/javascript"></script>







	<%--<link href="${ctxStatic}/jquery-select2/3.4/select2.min.css" rel="stylesheet" />--%>
	<%--<script src="${ctxStatic}/jquery-select2/3.4/select2.min.js" type="text/javascript"></script>--%>

	<%--<link href="${ctxStatic}/jquery-validation/1.17.0/dist/jquery.validate.min.css" type="text/css" rel="stylesheet" />--%>

	<script src="${ctxStatic}/jquery-validation/1.17.0/dist/jquery.validate.min.js" type="text/javascript"></script>
	<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Blue/jbox.css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	<%--
    <script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    --%>
	<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>


	<link href="${ctxStatic}/common/treps.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/common/treps.js" type="text/javascript"></script>


	<script src="${ctxStatic}/common/trepsui-ext.min.js?t=201911040002"></script>
	<%--<script src="${ctxStatic}/common/trepsui-ext.js"></script>--%>
	<script type="text/javascript">
		
		var currUser =  null;
		getCurrUserInfo(true);
	</script>

	<link rel="stylesheet" href="${ctxStatic}/jquery-querybuilder/dist/css/query-builder.default.css" id="qb-theme">
	<%--<link rel="stylesheet" href="${ctxStatic}/bootstrap-select/dist/css/bootstrap-select.min.css">--%>
	<%--<link rel="stylesheet" href="${ctxStatic}/chosenjs/chosen.css">--%>
	<%--<link rel="stylesheet" href="${ctxStatic}/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css">--%>
	<%--<link rel="stylesheet" href="${ctxStatic}/bootstrap-slider/dist/css/bootstrap-slider.css">--%>
	<%--<link rel="stylesheet" href="${ctxStatic}/selectize/dist/css/selectize.bootstrap3.css">--%>

	<%--<script src="${ctxStatic}/jquery/jquery-2.2.4.min.js"></script>--%>

	<script src="${ctxStatic}/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
	<%--<script src="${ctxStatic}/chosenjs/chosen.jquery.js"></script>--%>

	<%--<script src="${ctxStatic}/bootbox/bootbox.js"></script>--%>
	<script src="${ctxStatic}/jquery-extendext/jQuery.extendext.js"></script>
	<%--<script src="${ctxStatic}/selectize/dist/js/standalone/selectize.js"></script>--%>
	<script src="${ctxStatic}/sql-parser-mistic/browser/sql-parser.js"></script>
	<script src="${ctxStatic}/doT/doT.min.js"></script>
	<script src="${ctxStatic}/interactjs/dist/interact.js"></script>


	<script src="${ctxStatic}/jquery-querybuilder/dist/js/query-builder-treps.js"></script>
	<%--<script src="${ctxStatic}/jquery-querybuilder/dist/js/query-builder.min.js"></script>--%>
	<script src="${ctxStatic}/jquery-querybuilder/dist/i18n/query-builder.zh-CN.js"></script>
	<%--<script src="${ctxStatic}/moment/min/moment.min.js"></script>--%>
	<%--<link rel="stylesheet" href="${ctxStatic}/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">--%>

	<%--<script src="${ctxStatic}/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>--%>
	<%--<script src="${ctxStatic}/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>--%>

	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />

	<script>
        $.support.cors = true;
		var _ajax = $.ajax;
		$.ajax = function(p) {
		    var t = localStorage.getItem('t');
		    var code = localStorage.getItem('code');
		    if(p.headers) {
				p.headers['iamAccessToken'] = t;
                p.headers['code'] = code;
			} else {
		        p.headers = {iamAccessToken:t,code:code}
			}
            if(p.data) {
                p.data['iamAccessToken'] = t;
                p.data['code'] = code;
            } else {
                p.data = {iamAccessToken:t,code:code}
			}

			p['crossDomain']=true;
		    console.log('==================>',p);
			return _ajax(p)
		}
	</script>
</head>
<body>
<div class="mini-fit">
<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
             <sys:toolbargridmain objId="SysGroup" permissionEdit="sys:sysGroup:edit"></sys:toolbargridmain>
             <sys:searchadv></sys:searchadv>
			 <div class="mini-fit">
				<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
					 url="http://192.168.0.241:8181/treps/mis/sys/sysGroup/data" idField="id"
					 allowResize="true" pageSize="10"
					 allowCellSelect="true" multiSelect="false"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
				>
					<div property="columns">
						<div name="action" width="80"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" sortField="a.id">编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
								<div name="name"  field="name" vtype="required"  headerAlign="center" allowSort="true" width="100" sortField="a.name">名称
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
								<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
									   onvaluechanged="onFilterChanged"
								/>
							</div>
							<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="255" sortField="a.remarks">备注信息
								<input property="editor" class="mini-textarea" style="width:100%;"  />
							</div>

				</div>
			</div>
		 </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="sys:sysGroup:edit"></sys:toolbarformmain>
		<div class="mini-fit">
				<div id="editform" class="form" style="width:100%;height:50px;">
						<input class="mini-hidden" name="id" id="id"/>
						<table border="0" cellpadding="3" cellspacing="3" >
							<tr>
								<td style="text-align:right;">名称：</td>
								<td>
								   <input name="name" id="name"  class="mini-textbox"  vtype = "" required="true" />
								</td>
								<td style="text-align:right;">备注信息：</td>
								<td>
								   <input name="remarks" id="remarks" class="mini-textarea" height="25" vtype = ""  required="false"  />
								</td>
								<td style="text-align:right;">归属部门：</td>
								<td>
								   <input name="orgId" id="orgId"  textName="orgName" class="mini-buttonedit"
													onbuttonclick="popLov(this,'选择归属部门',false,true,'http://192.168.0.241:8181/treps/mis/sys/sysOrg/list?classId=0',850,500,'id,name','orgId,orgName')"/>
								</td>
								<td style="text-align:right;">组类型：</td>
								<td>
								   <input name="groupType" id="groupType"  class="mini-combobox"  vtype = "" required="false" valueField="value" textField="label"  url="http://192.168.0.241:8181/treps/mis/sys/dict/listDataStr?type=sys_user_pos" />
								</td>
								
							</tr>
							<tr>
							</tr>
						</table>
				</div>
		        <div class="mini-fit">
						 <div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
								<div title="用户" id="tabSysGroupUserList"  style="border: 0px;"  >
									<sys:toolbargridsub girdId="gridSysGroupUser" permissionEdit="sys:sysGroupUser:edit"></sys:toolbargridsub>
									<div class="mini-fit">
									<div id="gridSysGroupUser" class="mini-datagrid" style="width:100%;height:100%;"
										 url="http://192.168.0.241:8181/treps/mis/sys/sysGroupUser/data" idField="id"
										 allowResize="true" pageSize="10"
										 allowCellSelect="true" allowCellEdit="true"
										 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="true"
										 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
									>
										<div property="columns">
											<div type="checkcolumn"></div>
											<div name="id"  field="id" hideable="true" visible="false"   headerAlign="center" allowSort="true"  width="64" >
												<input property="editor" class="mini-textbox"  style="width:100%;"  />
											</div>
											<div name="groupId" hideable="true" visible="false"  field="groupId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
											<div name="name"  field="name" displayField="name"  vtype="required" headerAlign="center" allowSort="true"  width="100" sortField="a.name">名称
					   							<input property="editor" class="mini-buttonedit" allowInput = 'false'  style="width:100%"  onbuttonclick="popLov(this,'选择用户',false,true,'http://192.168.0.241:8181/treps/mis/sys/sysUser/form',1200,720,'id,name','userId,name','gridSysGroupUser')"/>
												<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
													   onvaluechanged="onFilterChanged"
												/>
											</div>
											<div name="remarks"  field="remarks"  vtype="" headerAlign="center" allowSort="true" width="255" sortField="a.remarks">备注信息
												<input property="editor" class="mini-textarea" style="width:100%;"  />
											</div>
											<div name="userId" hideable="true"  visible="false" field="userId" headerAlign="center" allowSort="true" width="150" >
												<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
											</div>
										</div>
									</div>
								 </div>
							  </div>
							  <div title="用户组扩展信息" id="tabSysGroupExtInfo"  style="border: 0px;"  >
										<div id="formSysGroupExtInfo" class="form" style="width:100%;height:100%;">
											<input name="id"   class="mini-hidden"  vtype = ""  required="false" />
											<input name="groupId" id="groupId"  class="mini-hidden" vtype = "" required="false" />
											<input name="specName" id="specName"  class="mini-hidden" vtype = "" required="false" />
											<table border="0" cellpadding="3" cellspacing="3" >
												
												 <tr >
												   <td style="width:120px;text-align:right;">专业：</td>
													<td>
													   <input name="specId" id="specId" textName="specName" showClose="false"  class="mini-buttonedit" allowInput="false" vtype = "" required="false" onbuttonclick="popLov(this,'选择专业',false,true,'http://192.168.0.241:8181/treps/mis/pg/pgSpec/lov?groupId=1',800,500,'id,name','specId,specName','#formSysGroupExtInfo')"  />
													</td>
												
												   <td style="width:120px;text-align:right;">其他分组：</td>
													<td>
													   <input name="otherType" id="otherType" class="mini-textarea" />
													</td>
												
													<td style="width:100px;text-align:right;">备注信息：</td>
													<td>
														<input name="remarks" id="remarks" class="mini-textarea" vtype = ""  required="false" valueField="id" textField="name" />
													</td>
												</tr>
												
											</table>
										</div>
									</div>
						 </div>
		        </div><!--fit-->

	     </div><!--fit-->

	</div>

</div>
</div>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysGroup",
			    masterKeyField:"id",
				dataUrl:ctx+"/sys/sysGroup/data",
				getUrl:ctx+"/sys/sysGroup/get",
				saveUrl:ctx+"/sys/sysGroup/save",
				removeUrl:ctx+"/sys/sysGroup/remove",
				exportUrl:ctx+"/sys/sysGroup/export"
			 }
	       );

	initChilds( "#editform", "tabsMain" ,
                      [
	                    {
		                 id:"gridSysGroupUser",
		                 objId:"SysGroupUser",
		               	 FK:"groupId",
		                 cascade:true,
						 dataUrl:ctx+"/sys/sysGroupUser/data",
						 getUrl:ctx+"/sys/sysGroupUser/get",
						 saveUrl:ctx+"/sys/sysGroupUser/save",
						 removeUrl:ctx+"/sys/sysGroupUser/remove",
						 exportUrl:ctx+"/sys/sysGroupUser/export"
	                    },
	                    {
	    					id:"#formSysGroupExtInfo",
	    					objId:"SysGroupExt",
	    				//	FK:"groupId",
	    					FKLinks:[
		                         {FK:"groupId",masterKeyField:"id"}
		                        ],
	    					cascade:true,
	    					cascadeVisible:true,
	    					dataUrl:ctx+"/sys/sysGroupExt/data",
    						getUrl:ctx+"/sys/sysGroupExt/get",
    						saveUrl:ctx+"/sys/sysGroupExt/save",
    						removeUrl:ctx+"/sys/sysGroupExt/remove",
    						exportUrl:ctx+"/sys/sysGroupExt/export"
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
						id: 'a.org_id',
						label: '归属部门',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.remarks',
						label: '备注信息',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.site_id',
						label: '站点ID',
						type: 'string',
						default_value: '',
						size: 64
					}
			]
	);
   loadWindow();
   //////////表格操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){

   }
   //////////form操作菜单项点击事件方法/////////
   function onFormOpMiClick(e){

   }
   //////////子表格操作菜单项点击事件方法/////////
   function onGridSubOpMiClick_SysGroupUser(e){

   }

</script>
</body>
</html>