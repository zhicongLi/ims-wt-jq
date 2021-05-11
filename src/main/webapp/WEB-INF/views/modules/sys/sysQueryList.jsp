<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>高级查询</title>
	<meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp" %>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>

       <sys:toolbargridsingle objId="SysQuery" permissionEdit="sys:sysQuery:edit"></sys:toolbargridsingle>

       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/ims-ext/sys/sysQuery/data" idField="id"
			 allowResize="true" pageSize="20"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编码
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="100" >名称
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="descr"  field="descr" vtype=""   headerAlign="center" allowSort="true" width="64" >描述
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div type="checkboxcolumn"  name="isShow"   field="isShow" vtype="" trueValue="1" falseValue="0"  headerAlign="center" allowSort="true" width="70" >是否显示

					</div>
					<div type="checkboxcolumn"  name="isActive"  field="isActive"  vtype="" trueValue="1" falseValue="0" headerAlign="center" allowSort="true" width="70" >是否启用


					</div>
					<div name="objId" field="objId" vtype=""   headerAlign="center" allowSort="true" width="64" >对象编码
						<input property="editor" class="mini-textbox" style="width:100%;"  />
						<input id="objId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>

					<div name="seqNo" field="seqNo" vtype=""   headerAlign="center" allowSort="true" width="70" >显示序号
						<input property="editor" class="mini-textbox" style="width:100%;"  />
					</div>
					<div name="sqlWhere"  field="sqlWhere" vtype=""   headerAlign="center" allowSort="true" width="500" >Where语句
						<input property="editor" class="mini-textarea" style="width:100%;"  />
					</div>
					<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建者
					</div>
					<div name="createDate"  field="createDate" readOnly="true" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true" width="70" >创建时间
					</div>
					<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >更新者
					</div>
					<div name="updateDate"  field="updateDate" readOnly="true" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true" width="70" >更新时间
					</div>
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注信息
						<input property="editor" class="mini-textarea" style="width:100%;"  />
					</div>
        </div>
    </div>
   </div>
	<div class="mini-toolbar" id="lov_action_bar"  style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
		<a class="mini-button" style="width:60px;" onclick="onLovOk()">确定</a>
		<span style="display:inline-block;width:25px;"></span>
		<a class="mini-button" style="width:60px;" onclick="onLovCancel()">取消</a>
	</div>

<sys:excelframe></sys:excelframe>

<script type="text/javascript">
	initBase(
			{   id:"datagridMain",
			    objId:"SysQuery",
				dataUrl:"${ctx}/ims-ext/sys/sysQuery/data",
				getUrl:"${ctx}/ims-ext/sys/sysQuery/get",
				saveUrl:"${ctx}/ims-ext/sys/sysQuery/save",
				removeUrl:"${ctx}/ims-ext/sys/sysQuery/remove",
				exportUrl:"${ctx}/ims-ext/sys/sysQuery/export"
			 }
	       );


	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					
			]
	);
    loadWindow();
</script>
</body>
</html>