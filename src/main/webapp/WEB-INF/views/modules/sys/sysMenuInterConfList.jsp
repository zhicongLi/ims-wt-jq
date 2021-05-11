<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>菜单接口配置表</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysMenuInterConf"  permissionEdit="sys:sysMenuInterConf:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/ims-ext${ims_ext_suffix}/sys/sysMenuInterConf/data" idField="id"
			 allowResize="true" pageSize="20"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="100" visible="false">id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>

					<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="50" >名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>

					<div name="menuid" field="menuid" vtype=""   headerAlign="center" allowSort="true" width="50" >根菜单id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="menuid-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>

					<div name="baseurl" field="baseurl" vtype=""   headerAlign="center" allowSort="true" width="100" >站点url
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="baseurl-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>

					<div name="appid" field="appid" vtype=""   headerAlign="center" allowSort="true" width="80" >appid
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="appid-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="secret" field="secret" vtype=""   headerAlign="center" allowSort="true" width="100" >secret
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="secret-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>




					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="150" >备注
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
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
			    objId:"SysMenuInterConf",
				dataUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysMenuInterConf/data",
				getUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysMenuInterConf/get",
				saveUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysMenuInterConf/save",
				removeUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysMenuInterConf/remove",
				exportUrl:"${ctx}/ims-ext${ims_ext_suffix}/sys/sysMenuInterConf/export"
			 }
	       );

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: 'id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.appid',
						label: 'appid',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.secret',
						label: 'secret',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.baseurl',
						label: '站点url',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.menuid',
						label: '根菜单id',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.remarks',
						label: '备注',
						type: 'string',
						default_value: '',
						size: 100
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