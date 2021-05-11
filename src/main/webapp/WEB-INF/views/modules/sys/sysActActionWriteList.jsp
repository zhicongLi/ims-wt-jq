<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>是否可编辑控制行</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysActActionWrite"  permissionEdit="sys:sysActActionWrite:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysActActionWrite/data" idField="id"
			 allowResize="true" pageSize="10"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="saa.id"  field="saa.id" hideable="true" visible="false" vtype="required"  headerAlign="center" allowSort="false" width="64" >编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="saa.procKey"  field="saa.procKey" vtype=""  headerAlign="center" allowSort="false" width="64" >流程定义编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="procKey-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="saa.nodeId"  field="saa.nodeId" vtype=""  headerAlign="center" allowSort="true" width="255" sortField="a.node_id">节点ID
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="nodeId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="saa.actionType"  field="saa.actionType" vtype="" type="comboboxcolumn"  headerAlign="center" allowSort="true" width="100" sortField="a.action_type" >动作类型
						<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_action_action_type"   style="width:100%;"   />
						<input id="actionType-Filter" name="mini-column-filter"  property="filter" class="mini-combobox"   style="width:100%;" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_action_action_type"  multiSelect="true"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="saa.eventType"  field="saa.eventType" vtype=""  type="comboboxcolumn" headerAlign="center" allowSort="true" width="120" sortField="a.event_type" >事件类型
						<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_action_event_type"  style="width:100%;"  />
						<input id="eventType-Filter" name="mini-column-filter" name="mini-column-filter"  property="filter" class="mini-combobox"   style="width:100%;" valueField="value" textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_act_action_event_type"  multiSelect="true"  style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="saa.seqNo"  field="saa.seqNo" vtype=""  headerAlign="center" allowSort="true" width="100" sortField="a.seq_no">执行顺序
						<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
						<input id="seqNo-Filter" name="mini-column-filter"  property="filter" class="mini-spinner"  allowLimitValue="false" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="id"  field="id" hideable="true" visible="false"  headerAlign="center" allowSort="false"  width="64" >编号
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="actId" hideable="true" visible="false"  field="actId" headerAlign="center" allowSort="true" width="150" sortField="a.act_id">动作编号
						<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
					</div>
					<div name="name"  field="name"   vtype="" headerAlign="center" allowSort="true"  width="100" sortField="a.name">名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div type="checkboxcolumn"  name="isActive"  field="isActive"  vtype=""  trueValue="1" falseValue="0" headerAlign="center" allowSort="false" width="100">是否启用
					</div>
					<div type="comboboxcolumn" autoShowPopup="true"  name="dataType"  field="dataType"  vtype="" headerAlign="center" allowSort="false" width="100">数据类型
						<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"   url="${ctx}/sys/dict/listDataStr?type=sys_data_type" />
					</div>
					<div name="writeTable"  field="writeTable"   vtype="" headerAlign="center" allowSort="true"  width="64" sortField="a.write_table">写入表
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="writeTable-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="writeField"  field="writeField"   vtype="" headerAlign="center" allowSort="true"  width="64" sortField="a.write_field">写入表字段
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="writeField-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="writeWhere"  field="writeWhere"   vtype="required" headerAlign="center" allowSort="true"  width="200" sortField="a.write_where">写入where
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="writeWhere-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="writeExpr"  field="writeExpr"   vtype="" headerAlign="center" allowSort="false"  width="100" >写入表达式
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="writeExpr-Filter" name="mini-column-filter"  property="filter" class="mini-textarea" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="writeCond"  field="writeCond"   vtype="" headerAlign="center" allowSort="false"  width="100" >写入条件
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="writeCond-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="remarks"  field="remarks"  vtype="" headerAlign="center" allowSort="false" width="255" >备注信息
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"SysActActionWrite",
				dataUrl:"${ctx}/sys/sysActActionWrite/data",
				getUrl:"${ctx}/sys/sysActActionWrite/get",
				saveUrl:"${ctx}/sys/sysActActionWrite/save",
				removeUrl:"${ctx}/sys/sysActActionWrite/remove",
				exportUrl:"${ctx}/sys/sysActActionWrite/export"
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
						id: 'a.type',
						label: '类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.is_active',
						label: '是否启用',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.obj_name',
						label: '对象名称',
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