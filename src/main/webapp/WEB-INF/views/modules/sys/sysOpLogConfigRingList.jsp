<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务操作日志配置工作圈</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysOpLogConfigRing"  permissionEdit="sys:sysOpLogConfigRing:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysOpLogConfigRing/data" idField="id"
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
					<div name="configId" field="configId" vtype=""   headerAlign="center" allowSort="true" width="64" >配置编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="configId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="logDelete" field="logDelete" vtype=""   headerAlign="center" allowSort="true" width="100" >记录删除
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="logDelete-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="logUpdate" field="logUpdate" vtype=""   headerAlign="center" allowSort="true" width="100" >记录更新
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="logUpdate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="logInsert" field="logInsert" vtype=""   headerAlign="center" allowSort="true" width="100" >记录新建
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="logInsert-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="isActive" field="isActive" vtype=""   headerAlign="center" allowSort="true" width="100" >是否启用
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="isActive-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="note" field="note" vtype=""   headerAlign="center" allowSort="true" width="200" >备注
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="note-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="icon" field="icon" vtype=""   headerAlign="center" allowSort="true" width="50" >图标
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="icon-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="headerStr" field="headerStr" vtype=""   headerAlign="center" allowSort="true" width="500" >内容头
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="headerStr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="bodyStr" field="bodyStr" vtype=""   headerAlign="center" allowSort="true" width="100" >内容体
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="bodyStr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="isShowDoc" field="isShowDoc" vtype=""   headerAlign="center" allowSort="true" width="100" >是否显示附件
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="isShowDoc-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"SysOpLogConfigRing",
				dataUrl:"${ctx}/sys/sysOpLogConfigRing/data",
				getUrl:"${ctx}/sys/sysOpLogConfigRing/get",
				saveUrl:"${ctx}/sys/sysOpLogConfigRing/save",
				removeUrl:"${ctx}/sys/sysOpLogConfigRing/remove",
				exportUrl:"${ctx}/sys/sysOpLogConfigRing/export"
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
						id: 'a.config_id',
						label: '配置编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.log_delete',
						label: '记录删除',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.log_update',
						label: '记录更新',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.log_insert',
						label: '记录新建',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.is_active',
						label: '是否启用',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.note',
						label: '备注',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.icon',
						label: '图标',
						type: 'string',
						default_value: '',
						size: 50
					}
					,{
						id: 'a.header_str',
						label: '内容头',
						type: 'string',
						default_value: '',
						size: 500
					}
					,{
						id: 'a.body_str',
						label: '内容体',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.is_show_doc',
						label: '是否显示附件',
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