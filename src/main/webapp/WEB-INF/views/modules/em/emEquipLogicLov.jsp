<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>逻辑设备</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	  <%--  <sys:toolbargridsingle objId="EmEquipLogic" permissionEdit="em:emEquipLogic:edit"></sys:toolbargridsingle> --%>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-treegrid" style="width:auto;height:100%;"
			 url="${ctx}/cb-em/em/emEquipLogic/lazyTree?baseQuery=a.building=0" idField="id"
			 parentField="parentId" resultAsTree="false" showTreeIcon="true" treeColumn="name"
			 treeColumn="name" allowDrag="true" allowDrop="true" allowLeafDropIn="true"
			 allowResize="true" pageSize="100" autoLoad="false" multiSelect="true" expandOnDblClick="false"
			 showFilterRow="false"  virtualScroll="true"
			 onbeforeLoad="onBeforeTreeLoad1"
			
			 
			 
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<!-- <div type="checkcolumn"></div> -->
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="false" width="64" >编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="name" field="name" vtype=""   headerAlign="center" allowSort="false" width="200" >名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="installPostion" field="installPostion" vtype=""   headerAlign="center" allowSort="false" width="120" sortField="a.install_postion" visible="false">安装位置
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="installPostion-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="installPostionName" field="installPostionName" vtype=""   headerAlign="center" allowSort="false" width="150" sortField="a.install_postion_name" visible="false">安装位置名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="installPostionName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="parentIds" field="parentIds" vtype="required" readOnly="true"  headerAlign="center" allowSort="false" width="64" hideable="true" visible="false">parentIds
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="parentIds-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"EmEquipLogic",
				dataUrl:"${ctx}/cb-em/em/emEquipLogic/lazyTree?baseQuery=a.building=0&initParentId=",
				getUrl:"${ctx}/cb-em/em/emEquipLogic/get",
				saveUrl:"${ctx}/cb-em/em/emEquipLogic/save",
				removeUrl:"${ctx}/cb-em/em/emEquipLogic/remove",
				exportUrl:"${ctx}/cb-em/em/emEquipLogic/export"
			 }
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
						id: 'a.name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.descr',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 255
					}
					
					
					,{
						id: 'a.remarks',
						label: '备注信息',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.type_id',
						label: '计划类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.org_id',
						label: '机构',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.group_id',
						label: '设备组编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.equip_level',
						label: '设备层次',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.site_id',
						label: '域',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.inter_no',
						label: '内部编码',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.total_cost',
						label: '总成本',
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
   function onBeforeTreeLoad1(e){
	   var tree = e.sender;    //树控件
	    var node = e.node;      //当前节点
	    var params = e.params;  //参数对象
	    params.dynamicLoad=1;
    	if(node.id){
 	 	   params.parentId=node.id;
 	    }else{
    	   params.parentId='';
 	    }
	    
   }
</script>
</body>
</html>