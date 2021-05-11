<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统字典</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysDict" permissionEdit="sys:dict:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysDict/typeData" idField="id"
			 allowResize="true" pageSize="10"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>		
					<div name="type" field="type" vtype="required"   headerAlign="center" allowSort="true" width="100" >类型
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>

					<div name="description" field="description" vtype="required"   headerAlign="center" allowSort="true" width="100" >名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>	

        </div>
    </div>
   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysDict",
				dataUrl:"${ctx}/sys/sysDict/typeData",
				getUrl:"${ctx}/sys/sysDict/get",
				saveUrl:"${ctx}/sys/sysDict/save",
				removeUrl:"${ctx}/sys/sysDict/remove",
				exportUrl:"${ctx}/sys/sysDict/export"
			 }
	       );

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.type',
						label: '类型',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.description',
						label: '描述',
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