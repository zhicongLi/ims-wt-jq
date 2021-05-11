<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工作流扩展属性</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysActExt"  permissionEdit="sys:sysActExt:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysActExt/data" idField="id"
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
					<div name="procKey" field="procKey" vtype=""   headerAlign="center" allowSort="true" width="64" >流程定义编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="procKey-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="nodeId" field="nodeId" vtype=""   headerAlign="center" allowSort="true" width="255" >节点ID
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="nodeId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="100" >名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注信息
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="msgType" field="msgType" vtype=""   headerAlign="center" allowSort="true" width="64" >消息类型
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="msgType-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="msgText" field="msgText" vtype=""   headerAlign="center" allowSort="true" width="100" >消息内容
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="msgText-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="ctrlId" field="ctrlId" vtype=""   headerAlign="center" allowSort="true" width="64" >控制编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="ctrlId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"SysActExt",
				dataUrl:"${ctx}/sys/sysActExt/data",
				getUrl:"${ctx}/sys/sysActExt/get",
				saveUrl:"${ctx}/sys/sysActExt/save",
				removeUrl:"${ctx}/sys/sysActExt/remove",
				exportUrl:"${ctx}/sys/sysActExt/export"
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
						id: 'a.proc_def_id',
						label: '流程定义编号',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.node_id',
						label: '节点ID',
						type: 'string',
						default_value: '',
						size: 255
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
						label: '备注信息',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.is_send_msg',
						label: '是否发送消息',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.msg_type',
						label: '消息类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.msg_text',
						label: '消息内容',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.ctrl_id',
						label: '控制编码',
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