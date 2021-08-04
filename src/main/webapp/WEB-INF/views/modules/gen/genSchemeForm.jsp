<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>对象生成代码</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="${ctxStatic}/common/sysToolBar.js"></script>
</head>
<body>
<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
	<div title="列表" id="tabList"  style="border: 0px;"  >
	    <sys:toolbargridmain objId="GenScheme"  permissionEdit="gen:genScheme:edit"></sys:toolbargridmain>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/ims-ext${ims_ext_suffix}/gen/genScheme/data" idField="id"
			 allowResize="true" pageSize="20"
			 allowCellSelect="true" multiSelect="false"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>

					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="100" >名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="category" field="category" vtype=""   headerAlign="center" allowSort="true" width="120" >分类
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="category-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="packageName" field="packageName" vtype=""   headerAlign="center" allowSort="true" width="200" >包路径
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="packageName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="moduleName" field="moduleName" vtype=""   headerAlign="center" allowSort="true" width="100" >生成模块名
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="moduleName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="subModuleName" field="subModuleName" vtype=""   headerAlign="center" allowSort="true" width="100" >生成子模块名
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="subModuleName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="functionName" field="functionName" vtype=""   headerAlign="center" allowSort="true" width="200" >生成功能名
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="functionName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="functionNameSimple" field="functionNameSimple" vtype=""   headerAlign="center" allowSort="true" width="100" >生成功能名（简写）
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="functionNameSimple-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="functionAuthor" field="functionAuthor" vtype=""   headerAlign="center" allowSort="true" width="100" >生成功能作者
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="functionAuthor-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="genTableId" field="genTableId" vtype=""   headerAlign="center" allowSort="true" width="100" >生成表编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="genTableId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
				<div name="parentMenuId" field="parentMenuId" vtype=""   headerAlign="center" allowSort="true" width="64" >父级菜单
					<input property="editor" class="mini-textbox"  style="width:100%;"  />
					<input id="parentMenuId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
						   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
					/>
				</div>
					<div name="createDate"  field="createDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >创建时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>

					<div name="updateDate"  field="updateDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >更新时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注信息
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>

        </div>
    </div>
   </div>
	</div>
	<div title="明细" id="tabForm"  style="border: 0px;"  >
		<sys:toolbarformmain permissionEdit="gen:genScheme:edit"></sys:toolbarformmain>
		<div id="editform" class="form" style="width:100%;">
			<div class="container"  style="width: 100%;"  >
				<div class="mini-clearfix ">
					<div class="mini-col-12">
						<div class="mini-panel" title="基本信息" width="auto" height="auto"
							 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp"

						>
							<input class="mini-hidden" name="id" id="id"/>
							<input class="mini-hidden" name="moduleName" id="moduleName"/>
							<table border="0" cellpadding="3" cellspacing="3" >
								<tr>
									<td style="text-align:right;">对象：</td>
									<td>
										<input name="genTableId" id="genTableId"   class="mini-buttonedit"  textName="genTableName"  onbuttonclick="popLov(this,'选择对象',false,true,'${ctxRoot}/form?view=gen/genTableList',850,500,'id,name,comments,comments,comments','genTableId,genTableName,name,functionName,functionNameSimple','',null,actionLovGenTable);" vtype = "" required="false" />
									</td>
									<td style="text-align:right;">名称：</td>
									<td>
										<input name="name"  id="name"  class="mini-textbox"   vtype = ""  required="false" />


									</td>
									<td rowspan="6" width="500px">
										说明：<br/>
										1、如果是在测试代码时请不要选择父级菜单，选择父级菜单会在菜单管理中自动插入数据<br/>
										2、包路径为com.ims.工程名.模块名  例如 安全管理工程名为ims-sm,安全目标管理模块名为 sm-goal,最后包路径为com.ims.sm.goal<br/>
										3、微服务名目前为 工程名-模块名-  ，例如sm-goal<br/>
									</td>

								</tr>

								<tr>

									<td style="text-align:right;">父级菜单：</td>
									<td>
										<input name="parentMenuId" id="parentMenuId" class="mini-buttonedit"  textName="parentMenuName"  onbuttonclick="popLov(this,'选择菜单',false,true,'${ctxRoot}/form?view=/sys/sysMenuList',850,500,'id,name','parentMenuId,parentMenuName');"   vtype = "" required="false" />
									</td>
									<td style="text-align:right;">菜单排序：</td>
									<td>
										<input name="menuOrder" id="menuOrder"   class="mini-spinner"  vtype = "" required="false" allowLimitValue="false"  />
									</td>
								</tr>
								<tr>


									<td style="text-align:right;">模板分类：</td>
									<td colspan="3" >
										<input name="category" id="category" textField="label" valueField="value" data="config_categoryList" class="mini-combobox"  vtype = "" required="false" width="400" />
									</td>
								</tr>

								<tr>
									<%--<td style="text-align:right;">子模块名：</td>--%>
									<%--<td>--%>
										<%--<input name="subModuleName" id="subModuleName"  class="mini-textbox"    vtype = "" required="false" />--%>
									<%--</td>--%>
									<td style="text-align:right;">功能名：</td>
									<td>
										<input name="functionName" id="functionName"    class="mini-textbox"    vtype = "" required="false" />
									</td>
									<td style="text-align:right;">简写功能名：</td>
									<td>
										<input name="functionNameSimple" id="functionNameSimple"  class="mini-textbox"     vtype = "" required="false" />
									</td>
								</tr>
								<tr>
									<td style="text-align:right;">包路径：</td>
									<td>
										<input name="packageName" id="packageName" class="mini-textbox"  vtype = ""   required="false" />
									</td>

									<!-- <td style="text-align:right;">模块名：</td>
									<td>
										<input name="moduleName" id="moduleName" class="mini-textbox"  vtype = ""  required="false" />
									</td> -->
									<td style="text-align:right;">微服务名：</td>
									<td>
										<input name="serviceName" id="serviceName"   class="mini-textbox"  vtype = "" required="false" />
									</td>
								</tr>
								<tr>

									<td style="text-align:right;">作者：</td>
									<td colspan="3">
										<input name="functionAuthor" id="functionAuthor"   class="mini-textbox"  vtype = "" required="false" />
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


	</div>
</div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>


<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"genScheme",
                masterKeyField:"id",
				dataUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genScheme/data",
				getUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genScheme/get",
				saveUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genScheme/save",
				removeUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genScheme/remove",
				exportUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genScheme/export",
                initInsertUrl:"${ctx}/ims-ext${ims_ext_suffix}/gen/genScheme/initInsert",
                onBeforeSaveCheck:onBeforeSaveCheck
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
						id: 'a.name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.category',
						label: '分类',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.package_name',
						label: '生成包路径',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.module_name',
						label: '生成模块名',
						type: 'string',
						default_value: '',
						size: 30
					}
					,{
						id: 'a.sub_module_name',
						label: '生成子模块名',
						type: 'string',
						default_value: '',
						size: 30
					}
					,{
						id: 'a.function_name',
						label: '生成功能名',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.function_name_simple',
						label: '生成功能名（简写）',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.function_author',
						label: '生成功能作者',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.gen_table_id',
						label: '生成表编号',
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
						id: 'a.parent_menu_id',
						label: '父级菜单',
						type: 'string',
						default_value: '',
						size: 64
					}
			]
	);
   loadWindow();
   //////////操作菜单项点击事件方法/////////
   function onFormOpMiClick(e){
       //开始执行
       if(e.item.menuNo=='genCode'){
           genCodeFun();
       }
   }
   
    var configObj = null;
    var config_categoryList= null;
   
   // console.log(config_categoryList);
	function actionLovGenTable(data) {
	    if(objIsNotNull(data)){
            for (var i = 0, l = data.length; i < l; i++) {
                var row = data[i];
                var aFields= new Array(); //定义一数组
				aFields=row['name'].split("_"); //字符分割
                if(aFields.length>0){
                    var moduleName=mini.get('moduleName');
                  //  moduleName.setValue(aFields[0]);
				}
            }
		}

    }
	function getConfigData(){
    	$.ajax({
            url: "${ctx}/ims-ext${ims_ext_suffix}/gen/genTable/configData",
         	data : {},
            type: "post",
            success: function (data) {
            	debugger;
            	var d = mini.decode(data);
            	if(d.type=='I'){
            		configObj = d.data;
           		    config_javaTypeList= configObj.javaTypeList;
            		config_queryTypeList= configObj.queryTypeList;
            		config_showTypeList= configObj.showTypeList;
            		config_categoryList = configObj.categoryList;
            		var category=mini.get('category');
            		category.setData(config_categoryList);
            	}else{
            		mini.alert(d.message);
            	}
            	
            },
            error: function (jqXHR, textStatus, errorThrown) {
                var callback=function (action) {
                    if(action=='详细')  viewErrorDetail(jqXHR.responseText);
                }
                var buttonsTemp=["ok",""];
                showMessageBox("错误","获取配置出错","error",null,callback,buttonsTemp);
                form.unmask();
            }
        });
    }
    function onBeforeSaveCheck(o){
    	var genTableId = mini.get("genTableId").getValue();
    	var category = mini.get("category").getValue();
    	
    	var serviceName = mini.get("serviceName").getValue();
    	
    	if(genTableId==''){
    		mini.alert("请选择对象");
    		return false;
    	}
    	if(category==''){
    		mini.alert("请选择模板分类");
    		return false;
    	}
    	if(serviceName==''){
    		mini.alert("请填写微服务名称");
    		return false;
    	}
    	var arr = serviceName.split("-");
    	if(arr.length!=2 || arr[0]=='' || arr[1] == ''){
    		mini.alert("微服务名称格式错误");
    		return false;
    	}
    	var packageName = "com.ims."+arr[0]+"."+arr[1];
    	mini.get("packageName").setValue(packageName);
    	return true;
    }
    
    function addButton(){
		sysToolBar_.addButtonOption({
			"buttonId":'genCodeButton',
			"functionStr":'genCodeFun',
			//"gridId":"gridSmGoalItem",
			"name":'生成代码'
		});
	}
    
    function genCodeFun(){
    	var genId=mini.get('id');
        showMessageBox(null,"代码生成中，请稍后......","loading");

        $.ajax({
            url: "${ctx}/ims-ext${ims_ext_suffix}/gen/genScheme/genCode?id="+genId.getValue(),
            success: function (text) {
                var o = mini.decode(text);
                if(objIsNotNull(o.type)){
                    //alert(text);
                    if(o.type=="E"){
                        showMessageBox("错误",o.message,"error");
                        return;
                    }else if(o.type=="W"){
                        showMessageBox("警告",o.message,"warning");
                    }else if(o.type=="I"){
                        showTipM("info","提示",o.message);
                        var code = getCookie("iamCode");
                        window.open("${ctx}/ims-ext${ims_ext_suffix}/gen/genScheme/download-code?fileName="+o.data+"&code="+code);
                    }

                }

                hideMessageBox();

            },
            error: function (jqXHR, textStatus, errorThrown) {
                var callback=function (action) {
                    if(action=='详细')  viewErrorDetail(jqXHR.responseText);
                }
                var buttonsTemp=["ok","详细"];
                showMessageBox("错误","代码生成失败","error",null,callback,buttonsTemp);

            }
        });
    }
    $(function(){
    	getConfigData();
    	addButton();
    });
</script>
</body>
</html>