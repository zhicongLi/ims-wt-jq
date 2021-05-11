<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>自动打开链接</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysLinkAuto"  permissionEdit="sys:sysLinkAuto:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysLinkAuto/data" idField="id"
			 allowResize="true" pageSize="10"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
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
					<div name="sort" field="sort" vtype=""   headerAlign="center" allowSort="true" width="120" >排序
						<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
						<input id="sort-Filter" name="mini-column-filter"  property="filter" class="mini-spinner" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="href" field="href" vtype=""   headerAlign="center" allowSort="true" width="120" >链接
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="href-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="target" field="target" vtype=""   headerAlign="center" allowSort="true" width="20" >目标
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="target-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="validFromDate" field="validFromDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >有效结束日期
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="validFromDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="validToDate" field="validToDate" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >有效结束日期
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="validToDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="maxNum" field="maxNum" vtype=""   headerAlign="center" allowSort="true" width="11" >最大次数
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="maxNum-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"SysLinkAuto",
				dataUrl:"${ctx}/sys/sysLinkAuto/data",
				getUrl:"${ctx}/sys/sysLinkAuto/get",
				saveUrl:"${ctx}/sys/sysLinkAuto/save",
				removeUrl:"${ctx}/sys/sysLinkAuto/remove",
				exportUrl:"${ctx}/sys/sysLinkAuto/export"
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
						id: 'a.name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.user_id',
						label: '用户',
						type: 'string',
						default_value: '',
						size: 64
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
						id: 'a.valid_from_date',
						label: '有效结束日期',
						type: 'datetime',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.valid_to_date',
						label: '有效结束日期',
						type: 'datetime',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.max_num',
						label: '最大次数',
						type: 'string',
						default_value: '',
						size: 11
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