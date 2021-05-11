<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>组织结构</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

	   <sys:toolbargridsingle objId="SysOrg" permissionEdit="sys:sysOrg:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-treegrid" style="width:100%"
			 url="${ctx}/ims-iam-ext/sys/sysOrg/allDataNoControl?likeParentId=${param.likeParentId}&parentId=${param.parentId}" idField="id"
			 parentField="parentId" resultAsTree="false" showTreeIcon="true" treeColumn="name"
			 expandOnLoad="0" treeColumn="name" allowDrag="true" allowDrop="true" allowLeafDropIn="true"
			 allowResize="true" pageSize="100" autoLoad="false"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true" virtualScroll="true"
		>
			<div property="columns">

				<div type="checkcolumn"></div>
				<div name="action" width="80" headerAlign="center" align="center"
						renderer="onTreeActionRenderer" cellStyle="padding:0;">操作</div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编号
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="name" field="name" vtype="required"   headerAlign="center" allowSort="true" width="200" >名称
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="shortName"  field="shortName" vtype=""  headerAlign="center" allowSort="true" width="100" >简称
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="shortName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="sort" field="sort" vtype=""   headerAlign="center" allowSort="true" width="120" >排序
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="code" field="code" vtype=""   headerAlign="center" allowSort="true" width="100" >区域编码
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
                    <div name="orgCode" field="orgCode" vtype=""   headerAlign="center" allowSort="true" width="100" >机构编码
                        <input property="editor" class="mini-textbox" style="width:100%;"  />
                    </div>
                    <div name="status" field="status" vtype=""   headerAlign="center" allowSort="true" width="100" >状态
                        <input property="editor" class="mini-textbox" style="width:100%;"  />
                    </div>
					<div type="comboboxcolumn" autoShowPopup="true" name="type"  field="type" vtype="required"  headerAlign="center" allowSort="true" width="120" >机构类型
						<input property="editor" class="mini-combobox" style="width:100%;" valueField="value"  textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_type" />
					</div>

					<div type="comboboxcolumn" autoShowPopup="true" name="grade"  field="grade" vtype="required"  headerAlign="center" allowSort="true" width="120" >机构等级
						<input property="editor" class="mini-combobox" style="width:100%;" valueField="value"  textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_grade" />
					</div>

					<div name="address" field="address" vtype=""   headerAlign="center" allowSort="true" width="255" >联系地址
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="zipCode" field="zipCode" vtype=""   headerAlign="center" allowSort="true" width="100" >邮政编码
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="master" field="master" vtype=""   headerAlign="center" allowSort="true" width="100" >联系人
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="phone" field="phone" vtype=""   headerAlign="center" allowSort="true" width="200" >电话
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="fax" field="fax" vtype=""   headerAlign="center" allowSort="true" width="200" >传真
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="email" field="email" vtype=""   headerAlign="center" allowSort="true" width="200" >邮箱
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div type="checkboxcolumn"  name="useable"  field="useable"  vtype=""  headerAlign="center" allowSort="true" width="64" >是否启用

					</div>
					<div name="primaryPerson" field="primaryPerson" vtype=""   headerAlign="center" allowSort="true" width="64" >负责人
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="addr" field="addr" vtype=""   headerAlign="center" allowSort="true" width="200" >详细地址
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="lng" field="lng" vtype=""   headerAlign="center" allowSort="true" width="120" >经度
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="lat" field="lat" vtype=""   headerAlign="center" allowSort="true" width="120" >纬度
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="siteId" field="siteId" vtype=""   headerAlign="center" allowSort="true" width="64" >站点ID
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="deputyPerson" field="deputyPerson" vtype=""   headerAlign="center" allowSort="true" width="64" >副负责人
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
        </div>
    </div>
    
   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysOrg",
				dataUrl:"${ctx}/ims-iam-ext/sys/sysOrg/allDataNoControl?likeParentId=${param.likeParentId}&parentId=${param.parentId}",
				getUrl:"${ctx}/ims-iam-ext/sys/sysOrg/get",
				saveUrl:"${ctx}/ims-iam-ext/sys/sysOrg/save",
				removeUrl:"${ctx}/ims-iam-ext/sys/sysOrg/remove",
				exportUrl:"${ctx}/ims-iam-ext/sys/sysOrg/export"
			 }
	       );

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[	
			]
	);
   loadWindow();
	// var _mainGrid = mini.get("datagridMain");
	// _mainGrid.setHeight(document.body.clientHeight-70);
    orgSelectAll();
   
   function orgSelectAll(){
	   var select = "${select}";
	   var tree = mini.get("datagridMain");
	   console.log("select:",select);
	   if(select==1){
       	tree.selectAll();
	   }
   }
</script>
</body>
</html>