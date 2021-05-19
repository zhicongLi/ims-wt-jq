<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工作票换行配置</title>
	<meta name="decorator" content="default"/>
		 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="WoWtChangeLineConf"  permissionEdit="wo:woWtChangeLineConf:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/wo-wt/wo/woWtChangeLineConf/data" idField="id"
			 allowResize="true" pageSize="10"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required" readOnly="false"  headerAlign="center" allowSort="true" width="64" >编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createBy"  field="createBy" readOnly="false"  headerAlign="center" allowSort="true" width="64" >创建者
						<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createDate"  field="createDate"  vtype="required" readOnly="false" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >创建时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateBy"  field="updateBy" readOnly="false"  headerAlign="center" allowSort="true" width="64" >更新者
						<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateDate"  field="updateDate"  vtype="required" readOnly="false" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >更新时间
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
					<div name="siteId" field="siteId" vtype=""   headerAlign="center" allowSort="true" width="64" >站点ID
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="siteId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="100" >名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="descrs" field="descrs" vtype=""   headerAlign="center" allowSort="true" width="100" >描述
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="descrs-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="wtType" field="wtType" vtype=""   headerAlign="center" allowSort="true" width="64" >票类型
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="wtType-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="width" field="width" vtype=""   headerAlign="center" allowSort="true" width="100" >宽度
						<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
						<input id="width-Filter" name="mini-column-filter"  property="filter" class="mini-spinner" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="fontSize" field="fontSize" vtype=""   headerAlign="center" allowSort="true" width="100" >字体大小
						<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
						<input id="fontSize-Filter" name="mini-column-filter"  property="filter" class="mini-spinner" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="autoId" field="autoId" vtype=""   headerAlign="center" allowSort="true" width="64" >自动获取宽度Id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="autoId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"WoWtChangeLineConf",
				dataUrl:"${ctx}/wo-wt/wo/woWtChangeLineConf/data",
				getUrl:"${ctx}/wo-wt/wo/woWtChangeLineConf/get",
				saveUrl:"${ctx}/wo-wt/wo/woWtChangeLineConf/save",
				removeUrl:"${ctx}/wo-wt/wo/woWtChangeLineConf/remove",
				exportUrl:"${ctx}/wo-wt/wo/woWtChangeLineConf/export"
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
						size: 100
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
						size: 100
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
						id: 'a.site_id',
						label: '站点ID',
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
						id: 'a.descrs',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.wt_type',
						label: '票类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.width',
						label: '宽度',
						type: 'integer',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.font_size',
						label: '字体大小',
						type: 'integer',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.auto_id',
						label: '自动获取宽度Id',
						type: 'string',
						default_value: '',
						size: 64
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