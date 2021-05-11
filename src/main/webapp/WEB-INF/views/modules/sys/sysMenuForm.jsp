<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>系统菜单</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <script type="text/javascript" src="${ctxStatic}/common/sysToolBar.js"></script>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="mini-fit">

					<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
						<div title="列表" id="tabList"  style="border: 0px;"  >
								 <sys:toolbargridmain objId="SysMenu" permissionEdit="sys:sysMenu:edit"></sys:toolbargridmain>
								 <sys:searchadv></sys:searchadv>
								 <div class="mini-fit">
									<div id="datagridMain" class="mini-treegrid" style="width:100%;height:100%;"
										 url="${ctx}/ims-ext/sys/sysMenu/allData" idField="id"
										 parentField="parentId" resultAsTree="false" showTreeIcon="true" treeColumn="name"
										 expandOnLoad="1" treeColumn="name" allowDrag="true" allowDrop="true" allowLeafDropIn="true"
										 allowResize="true" pageSize="10" autoLoad="false"
										 allowCellSelect="true" multiSelect="false"
										 editNextOnEnterKey="true"  editNextRowCell="true"
										 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true"  virtualScroll="true"
									>
										<div property="columns">
											<div name="action" width="80"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
												<div name="id"  field="id"  headerAlign="center" allowSort="true" width="64" >编号
													<input property="editor" class="mini-textbox" style="width:100%;"  />
													<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
															   onvaluechanged="onFilterChanged"
														/>
												</div>

												<div name="name"  field="name" vtype="required"  headerAlign="center" allowSort="true" width="200" >名称
													<input property="editor" class="mini-textbox" style="width:100%;"  />
													<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged"
													/>
												</div>
												<div name="sort"  field="sort" vtype="required"  headerAlign="center" allowSort="true" width="120" >排序
													<input property="editor" class="mini-spinner" style="width:100%;"  />
												</div>
												<div name="href"  field="href" vtype=""  headerAlign="center" allowSort="true" width="120" >链接
													<input property="editor" class="mini-textbox" style="width:100%;"  />
												</div>
												<div name="target"  field="target" vtype=""  headerAlign="center" allowSort="true" width="20" >目标
													<input property="editor" class="mini-textbox" style="width:100%;"  />
												</div>
												<div name="icon"  field="icon" vtype=""  headerAlign="center" allowSort="true" width="100" >图标
													<input property="editor" class="mini-textbox" style="width:100%;"  />
												</div>
												<div type="checkboxcolumn"  name="isShow"  field="isShow" trueValue="1" falseValue="0" vtype="required" headerAlign="center" allowSort="true" width="120" >是否在菜单中显示

												</div>
												<div name="permission"  field="permission" vtype=""  headerAlign="center" allowSort="true" width="200" >权限标识
													<input property="editor" class="mini-textbox" style="width:100%;"  />
													<input id="permission-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged"
													/>
												</div>

                                            <div type="comboboxcolumn" autoShowPopup="true" name="type"  field="type" vtype="" headerAlign="center" allowSort="true" width="30" >菜单类型
                                                <input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_menu_type" />
                                            </div>
                                            <div name="objId"  field="objId" vtype=""  headerAlign="center" allowSort="true" width="64" >对象ID
                                                <input property="editor" class="mini-textbox" style="width:100%;"  />
                                            </div>
                                            <div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="255" >备注信息
                                                <input property="editor" class="mini-textarea" style="width:100%;"  />
                                            </div>
												<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建者
												</div>
												<div name="createDate"  field="createDate"  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >创建时间
													<input property="editor" class="mini-datepicker"  style="width:100%;"  />
												</div>
												<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >更新者
												</div>
												<div name="updateDate"  field="updateDate"   dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >更新时间
													<input property="editor" class="mini-datepicker"  style="width:100%;"  />
												</div>

									</div>
								</div>
							 </div>
						</div>
						<div title="明细" id="tabForm"  style="border: 0px;"  >
							<sys:toolbarformmain permissionEdit="sys:sysMenu:edit"></sys:toolbarformmain>
							<div class="mini-fit">
									<div id="editform" class="form" style="width:100%;height:400px;">
											<input class="mini-hidden" name="id" id="id"/>
											<table border="0" cellpadding="3" cellspacing="3" >
												<tr>
													<td style="text-align:right;">父级编号：</td>
													<td>
													   <input name="parentId" id="parentId" class="mini-treeselect" vtype = ""  required="true"  url="${ctx}/ims-ext/sys/sysMenu/allData" valueField="id" textField="name" parentField="parentId"/>
													</td>
                                                    <td style="text-align:right;">排序：</td>
                                                    <td>
                                                        <input name="sort" id="sort" allowLimitValue="false" width="120"  class="mini-spinner" vtype = "" required="true" />
                                                    </td>
												</tr>
												<tr>
													<td style="text-align:right;">名称：</td>
													<td colspan="3">
													   <input name="name" id="name" width="400" class="mini-textbox" vtype = ""  required="true" />
													</td>


												</tr>
												<tr>
													<td style="text-align:right;">链接：</td>
													<td  colspan="3">
													   <input name="href" id="href" width="400"  class="mini-textbox" vtype = ""  required="false" />
													</td>


												</tr>
                                                <tr>

                                                    <td style="text-align:right;">目标：</td>
                                                    <td colspan="3">
                                                        <input name="target" id="target" width="400"   class="mini-textbox" vtype = "" required="false" />
                                                    </td>

                                                </tr>
												<tr>
													<td style="text-align:right;">图标：</td>
													<td>
													   <%--<input name="icon" id="icon" class="mini-textbox" vtype = ""  required="false" />--%>
                                                        <sys:iconselect id="icon" name="icon" />
                                                    </td>
													<td style="text-align:right;">是否在菜单中显示：</td>
													<td>
													   <input name="isShow" id="isShow" trueValue="1" falseValue="0" class="mini-checkbox" vtype = "" required="true"/>
													</td>

												</tr>
												<tr>
													<td style="text-align:right;">权限标识：</td>
													<td colspan="3">
													   <input name="permission" id="permission" width="400"  class="mini-textbox" vtype = ""  required="false" />
													</td>


												</tr>
                                                <tr>
                                                    <td style="text-align:right;">菜单类型：</td>
                                                    <td>
                                                        <input name="type" id="type" class="mini-combobox" vtype = ""  required="false" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_menu_type" />
                                                    </td>
                                                    <td style="text-align:right;">对象ID：</td>
                                                    <td>
                                                        <input name="objId" id="objId"  class="mini-textbox" width="120"  vtype = "" required="false" />
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align:right;">菜单标识：</td>
                                                    <td>
                                                        <input name="menuNo" id="menuNo" class="mini-textbox" vtype = ""  required="false"   />
                                                    </td>

													<td style="text-align:right;">是否关闭左边菜单树：</td>
													<td>
													   <input name="isCloseTree" id="isCloseTree" trueValue="1" falseValue="0" class="mini-checkbox" vtype = "" required="true"/>
													</td>
                                                </tr>
												<tr>

													<td style="text-align:right;">备注信息：</td>
													<td colspan="3">
													   <input name="remarks" id="remarks"  width="400"  class="mini-textarea"  vtype = "" required="false"/>
													</td>

												</tr>


												<tr>
												</tr>
											</table>
									</div>
									<div class="mini-fit">
											 <div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
											 </div>
									</div><!--fit-->

							 </div><!--fit-->

						</div>

					</div>

</div>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">
    var onAfterLoadRecord= function(data) {

        iconPreview();
    }
	initBase(
			{   id:"datagridMain",
			    objId:"SysMenu",
			    masterKeyField:"id",
                onAfterLoadRecord:onAfterLoadRecord,
				//noloadGridAfterSave:false,
				dataUrl:"${ctx}/ims-ext/sys/sysMenu/allData",
				getUrl:"${ctx}/ims-ext/sys/sysMenu/get",
				saveUrl:"${ctx}/ims-ext/sys/sysMenu/save",
				removeUrl:"${ctx}/ims-ext/sys/sysMenu/remove",
				exportUrl:"${ctx}/ims-ext/sys/sysMenu/export"
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
						id: 'a.parent_id',
						label: '父级编号',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.parent_ids',
						label: '所有父级编号',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.sort',
						label: '排序',
						type: 'integer',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.href',
						label: '链接',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.target',
						label: '目标',
						type: 'string',
						default_value: '',
						size: 20
					}
					,{
						id: 'a.icon',
						label: '图标',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.is_show',
						label: '是否在菜单中显示',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.permission',
						label: '权限标识',
						type: 'string',
						default_value: '',
						size: 200
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
						size: 120
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
						size: 120
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
						id: 'a.type',
						label: '菜单类型',
						type: 'string',
						default_value: '',
						size: 30
						,
						plugin: 'selectize',
						plugin_config: {
							valueField: 'value',
							labelField: 'label',
							searchField: 'label',
							sortField: 'value',
							create: true,
							maxItems: 1,
							onInitialize: function () {
								var that = this;
								$.getJSON('${ctx}/ims-ext/sys/dict/listDataStr?type=sys_menu_type', function (data) {
									data.forEach(function (item) {
										that.addOption(item);
									});
								});
							}
						},
						valueSetter: function(rule, value) {
							rule.$el.find('.rule-value-container select')[0].selectize.setValue(value);
						}
					}
					,{
						id: 'a.obj_id',
						label: '对象ID',
						type: 'string',
						default_value: '',
						size: 64
					}
			]
	);
   loadWindow();

   function syncAllMenu2Workbench(e) {

       $.ajax({
           url:"${ctx}/ims-ext/sys/sysMenu/syncAllMenu2Workbench",
           async: true,
           type: "post",
           // dataType:'json',
           success: function (text) {

               console.log(text)
               var o = mini.decode(text);
               if(o.success) {
                   mini.alert("推送菜单完成");
               } else {
                   mini.alert(o.msg);
               }

           },
           error: function (jqXHR, textStatus, errorThrown) {
               mini.alert("推送菜单失败");
           }
       });


   }


    function syncSelectMenu2Workbench(e) {

       var grid = mini.get('datagridMain');
       var selectrow =  grid.getSelected();

       if(!selectrow) {
           mini.alert('选中一行再进行同步。')
           return;
	   }

	   var id = selectrow.id;
       var parentIds = selectrow.parentIds;


        $.ajax({
            url:"${ctx}/ims-ext/sys/sysMenu/syncSelectMenu2Workbench",
            async: true,
            type: "post",
			data: {id: id, parentIds: parentIds},
            // dataType:'json',
            success: function (text) {

                console.log(text)
                var o = mini.decode(text);
                if(o.success) {
                    mini.alert("推送菜单完成");
                } else {
                    mini.alert(o.msg);
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                mini.alert("推送菜单失败");
            }
        });


    }


    function addButton(){
        sysToolBar_.addButtonOption({
            "buttonId":'syncAllMenu2Workbench',
            "functionStr":'syncAllMenu2Workbench',
            "toolBarId":"_tbGrid_td_",
            "name":'整体同步'
        });

        sysToolBar_.addButtonOption({
            "buttonId":'syncSelectMenu2Workbench',
            "functionStr":'syncSelectMenu2Workbench',
            "toolBarId":"_tbGrid_td_",
            "name":'选中菜单及下级同步'
        });
    }

    $(function(){
        addButton();
    });

</script>
</body>
</html>