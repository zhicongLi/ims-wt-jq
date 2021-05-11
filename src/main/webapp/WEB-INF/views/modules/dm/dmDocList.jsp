<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文档管理</title>
	<meta name="decorator" content="default"/>
</head>
<body>
<style type="text/css">
	html, body{
		margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	}
</style>
	   <sys:toolbargridsingle objId="DmDoc" permissionEdit="dm:dmDoc:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/dm/dmDoc/data" idField="id"
			 allowResize="true" pageSize="10"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编码
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="descr" field="descr" vtype=""   headerAlign="center" allowSort="true" width="255" >描述
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="objKey" field="objKey" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="200" >对象编码
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="objDescr" field="objDescr" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="120" >对象描述
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="objDescr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="objType" field="objType" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="64" >对象类型
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="objType-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="docPath" field="docPath" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="255" >文档路径
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="docFileName" field="docFileName" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="255" >文件名称
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建者
					</div>
					<div name="createDate"  field="createDate"  vtype="required" readOnly="true" dateFormat="yyyy-MM-dd hh:mm:ss" headerAlign="center" allowSort="true" width="120" >创建时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
					</div>
					<div name="seqNo" field="seqNo" vtype=""   headerAlign="center" allowSort="true" width="11" >序号
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
			    objId:"DmDoc",
				dataUrl:"${ctx}/dm/dmDoc/data",
				getUrl:"${ctx}/dm/dmDoc/get",
				saveUrl:"${ctx}/dm/dmDoc/save",
				removeUrl:"${ctx}/dm/dmDoc/remove",
				exportUrl:"${ctx}/dm/dmDoc/export"
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
						id: 'a.descr',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.obj_key',
						label: '对象编码',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.obj_descr',
						label: '对象描述',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.obj_type',
						label: '对象类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.doc_path',
						label: '文档路径',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.doc_file_name',
						label: '文件名称',
						type: 'string',
						default_value: '',
						size: 255
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
</script>
</body>
</html>