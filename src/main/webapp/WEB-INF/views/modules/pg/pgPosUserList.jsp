<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>岗位人员</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="PgPosUser"  permissionEdit="pg:pgPosUser:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/ims-iam-ext/pg/pgPosUser/data" idField="id"
			 allowResize="true" pageSize="10"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64"  visible="false">ID
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="posId" field="posId" vtype=""   headerAlign="center" allowSort="true" width="64" visible="false" >岗位ID
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="posId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="posName" field="posName" vtype=""   headerAlign="center" allowSort="true" width="64" >岗位名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="posName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="userName" field="userName" vtype=""   headerAlign="center" allowSort="true" width="64" >人员名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="userName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div type="comboboxcolumn" autoShowPopup="true" name="mainPos"  field="mainPos" vtype=""  headerAlign="center" allowSort="true" width="64" >是否主职岗位
						<input property="editor" class="mini-combobox" style="width:100%;" valueField="value"  textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=" />
						<input id="mainPos-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" style="width:100%;"
                           textField="label" valueField="value" url="${ctx}/ims-ext/sys/dict/listDataStr?type=" multiSelect="true"
                           onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>

        </div>
    </div>
   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"PgPosUser",
				dataUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/data",
				getUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/get",
				saveUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/save",
				removeUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/remove",
				exportUrl:"${ctx}/ims-iam-ext/pg/pgPosUser/export"
			 }
	       );

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: 'ID',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.pos_id',
						label: '岗位ID',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.pos_name',
						label: '岗位名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.user_id',
						label: '人员ID',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.user_name',
						label: '人员名称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.main_pos',
						label: '是否主职岗位',
						type: 'string',
						default_value: '',
						size: 64
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
								$.getJSON('${ctx}/ims-ext/sys/dict/listDataStr?type=', function (data) {
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
			]
	);
   loadWindow();
   //////////操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){

   }
</script>
</body>
</html>