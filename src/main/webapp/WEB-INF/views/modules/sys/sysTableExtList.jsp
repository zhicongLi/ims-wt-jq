<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>表扩展</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysTableExt"  permissionEdit="sys:sysTableExt:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysTableExt/data" idField="id"
			 allowResize="true" pageSize="20"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="tableName" field="tableName" vtype=""   headerAlign="center" allowSort="true" width="255" >表名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="tableName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="className" field="className" vtype=""   headerAlign="center" allowSort="true" width="255" >类名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="className-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="descr" field="descr" vtype=""   headerAlign="center" allowSort="true" width="255" >描述
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="selectFields" field="selectFields" vtype=""   headerAlign="center" allowSort="true" width="100" >查询字段
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="selectFields-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="insertFields" field="insertFields" vtype=""   headerAlign="center" allowSort="true" width="100" >插入字段
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="insertFields-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="insertValues" field="insertValues" vtype=""   headerAlign="center" allowSort="true" width="100" >插入值
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="insertValues-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateFields" field="updateFields" vtype=""   headerAlign="center" allowSort="true" width="100" >更新字段
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="updateFields-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="shortName" field="shortName" vtype=""   headerAlign="center" allowSort="true" width="64" >表简称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="shortName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="tempStr1" field="tempStr1" vtype=""   headerAlign="center" allowSort="true" width="64" >临时字段1
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="tempStr1-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="tempStr2" field="tempStr2" vtype=""   headerAlign="center" allowSort="true" width="64" >临时字段1临时字段2
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="tempStr2-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="tempStr3" field="tempStr3" vtype=""   headerAlign="center" allowSort="true" width="64" >临时字段3
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="tempStr3-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="tempStr4" field="tempStr4" vtype=""   headerAlign="center" allowSort="true" width="64" >临时字段4
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="tempStr4-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true"  oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="tempStr5" field="tempStr5" vtype=""   headerAlign="center" allowSort="true" width="64" >临时字段5
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="tempStr5-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
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
			    objId:"SysTableExt",
				dataUrl:"${ctx}/sys/sysTableExt/data",
				getUrl:"${ctx}/sys/sysTableExt/get",
				saveUrl:"${ctx}/sys/sysTableExt/save",
				removeUrl:"${ctx}/sys/sysTableExt/remove",
				exportUrl:"${ctx}/sys/sysTableExt/export"
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
						id: 'a.table_name',
						label: '表名称',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.class_name',
						label: '类名称',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.descr',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.select_fields',
						label: '查询字段',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.insert_fields',
						label: '插入字段',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.insert_values',
						label: '插入值',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.update_fields',
						label: '更新字段',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.short_name',
						label: '表简称',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.temp_str1',
						label: '临时字段1',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.temp_str2',
						label: '临时字段1临时字段2',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.temp_str3',
						label: '临时字段3',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.temp_str4',
						label: '临时字段4',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.temp_str5',
						label: '临时字段5',
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