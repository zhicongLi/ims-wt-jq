<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>多级字典</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="mini-fit">
	<div id="_splTreeMain" class="mini-splitter" style="width:100%;height:100%;">
	    <div size="240" showCollapseButton="true" style="overflow:auto;">
             <sys:treewithsearchbar dataUrl="${ctx}/sys/sysMdict/allTypes" idField="type" valueField="type"  parentField="parentId" textField="description" textFieldLabel="名称"></sys:treewithsearchbar>
	    </div>

		<div showCollapseButton="true">
			   <sys:toolbargridsingle objId="SysMdict" permissionEdit="sys:sysMdict:edit"></sys:toolbargridsingle>
			   <sys:searchadv></sys:searchadv>
			   <div class="mini-fit">
				<div id="datagridMain" class="mini-treegrid" style="width:100%;height:100%;"
					 url="${ctx}/sys/sysMdict/allData" idField="id"
					 parentField="parentId" resultAsTree="false" showTreeIcon="true" treeColumn="label"
					 expandOnLoad="0"   allowDrag="true" allowDrop="true" allowLeafDropIn="true"
					 allowResize="true" pageSize="100" autoLoad="false"
					 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
					 editNextOnEnterKey="true"  editNextRowCell="true"
					 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false" virtualScroll="true"
				>
					<div property="columns">
						<div type="indexcolumn"></div>
						<div type="checkcolumn"></div>
						<div name="action" width="80" headerAlign="center" align="center"
								renderer="onTreeActionRenderer" cellStyle="padding:0;">操作</div>
							<div name="id" field="id" readonly="true"   headerAlign="center" allowSort="true" width="64" >编号
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
							<div name="parentId"  field="parentId"  vtype=""   headerAlign="center" allowSort="true" width="64" >父级编号
								<%--<input property="editor" class="mini-treeselect" url="${ctx}/" valueField="id" textField="name" parentField="parentId" style="width:100%;" />--%>
							</div>
							<%--<div name="parentIds" field="parentIds" vtype=""   headerAlign="center" allowSort="true" width="120" >所有父级编号--%>
								<%--<input property="editor" class="mini-textbox"  style="width:100%;"  />--%>
							<%--</div>--%>
							<div name="value" field="value" vtype=""   headerAlign="center" allowSort="true" width="64" >值
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
							<div name="label" field="label" vtype=""   headerAlign="center" allowSort="true" width="200" >文本标签
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
							<div name="type" field="type" vtype=""   headerAlign="center" allowSort="true" width="100" >类型
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>

							<div name="description" field="description" vtype=""   headerAlign="center" allowSort="true" width="100" >描述
								<input property="editor" class="mini-textbox"  style="width:100%;"  />
							</div>
                            <div name="sort" field="sort" vtype=""   headerAlign="center" allowSort="true" width="120" >排序
                                <input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
                            </div>
							<div name="interNo" field="interNo" vtype=""   headerAlign="center" allowSort="true" width="120" >统一编码
								<input property="editor" class="mini-textbox" allowLimitValue="false" style="width:100%;"  />
							</div>
							<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注信息
								<input property="editor" class="mini-textarea" style="width:100%;"  />
							</div>
				</div>
			</div>
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
				treeFilter:"(a.type='[node.type]') or (a.parent_ids like '%,[node.type],%')",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
                treeSrcFields:"type,description",
                treeDestFields:"type,description",
                treeSubSrcFields:"id,type,description",
                treeSubDestFields:"parentId,type,description",
				dataUrl:"${ctx}/sys/sysMdict/allData",
				getUrl:"${ctx}/sys/sysMdict/get",
				saveUrl:"${ctx}/sys/sysMdict/save",
				removeUrl:"${ctx}/sys/sysMdict/remove",
				exportUrl:"${ctx}/sys/sysMdict/export"
			 }
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
						id: 'a.value',
						label: '值',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.label',
						label: '文本标签',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.type',
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
						id: 'a.description',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 100
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
			]
	);
   loadWindow();
   //////////操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){

   }

</script>
</body>
</html>