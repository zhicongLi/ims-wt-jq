<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>多级字典</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
     		   <sys:toolbargridsingle objId="SysMdict" permissionEdit="sys:sysMdict:edit"></sys:toolbargridsingle>
			   <sys:searchadv></sys:searchadv>
			   <div class="mini-fit">
				<div id="datagridMain" class="mini-treegrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysMdict/allTypes" idField="id" 					 
					 expandOnLoad="0"   allowDrag="true" allowDrop="true" allowLeafDropIn="true"
					 allowResize="true" pageSize="100" autoLoad="false"
					 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false" virtualScroll="true"
				>
					<div property="columns">
						<div type="indexcolumn"></div>
						<div type="checkcolumn"></div>
						<div name="type" field="type" vtype=""   headerAlign="center" allowSort="true" width="100" >类型
							<input property="editor" class="mini-textbox"  style="width:100%;"  />
						</div>
						<div name="description" field="description" vtype=""   headerAlign="center" allowSort="true" width="100" >名称
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
			    objId:"SysMdict",				
				dataUrl:"${ctx}/sys/sysMdict/allTypes",
				getUrl:"${ctx}/sys/sysMdict/get",
				saveUrl:"${ctx}/sys/sysMdict/save",
				removeUrl:"${ctx}/sys/sysMdict/remove",
				exportUrl:"${ctx}/sys/sysMdict/export"
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