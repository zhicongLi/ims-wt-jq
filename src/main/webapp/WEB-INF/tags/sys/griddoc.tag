<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="girdId" type="java.lang.String" required="true" description="表格Id"%>
<%@ attribute name="height" type="java.lang.String" required="false" description="高度"%>
<c:if test="${height==null }">
	<c:set var="height" value=" height:100%;"></c:set>
</c:if>
<div id="${girdId}" class="mini-datagrid"
	 style="width: 100%;${height}"
	 url="${ctx}/ims-ext/dm/dmDoc/data" idField="id"
	 allowResize="true" pageSize="10" allowCellSelect="true"
	 allowCellEdit="true" editNextOnEnterKey="true"
	 editNextRowCell="true" allowAlternating="true" ondrawcell="onDrawCellDoc"
	 showColumnsMenu="true" multiSelect="true">
	<div property="columns">

		<div name="action" width="90"  headerAlign="center" align="center" renderer="onDocActionRenderer" cellStyle="padding:0;">操作</div>
		<div name="id"  field="id" hideable="true" visible="false"  headerAlign="center" allowSort="true" width="64" >
		</div>
		<div name="docPath"  field="docPath" hideable="true" visible="false"  headerAlign="center" allowSort="true" width="64" >路径
		</div>
		<div name="docAccType"  field="docAccType" hideable="true" visible="false"  headerAlign="center" allowSort="true" width="64" >编号
		</div>
		<div name="docFileName"  field="docFileName" readOnly="true"  headerAlign="center" allowSort="true" width="100" >文件名编号
			<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
				   onvaluechanged="onFilterChanged"

			/>
		</div>

		<div name="descr" field="descr" vtype="" readOnly="true"   headerAlign="center" allowSort="true" width="255" >描述
			<input property="editor" class="mini-textbox" style="width:100%;"  />
			<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
				   onvaluechanged="onFilterChanged"
			/>
		</div>
<%--		<div name="fileSize" field="fileSize" vtype="" readOnly="true"   headerAlign="center" allowSort="true" width="255" >文件大小(单位B)--%>
<%--			<input property="editor" class="mini-textbox" style="width:100%;"  />--%>
<%--		</div>--%>
		<div name="kBFileSize" field="kBFileSize" vtype="" readOnly="true"   headerAlign="center" allowSort="true" width="255" >文件大小(单位KB)
			<input property="editor" class="mini-textbox" style="width:100%;"  />
		</div>
<%--		<div name="mBFileSize" field="mBFileSize" vtype="" readOnly="true"   headerAlign="center" allowSort="true" width="255" >文件大小(单位MB)--%>
<%--			<input property="editor" class="mini-textbox" style="width:100%;"  />--%>
<%--		</div>--%>
		<div name="createBy" field="createBy" hideable="true" visible="false" vtype=""  headerAlign="center" allowSort="true" width="34" >创建人
			<input property="editor" class="mini-textbox" style="width:100%;"  />
			<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
				   onvaluechanged="onFilterChanged"
			/>
		</div>
	</div>
</div>
<script>
	function onDrawCellDoc(e){

		var record = e.record,
				column = e.column,
				field = e.field,
				value = e.value;
		//链接
		if (field == "docFileName") {
			//var html = '<a style="color:blue;text-decoration:underline;" target="new" href="'+rootDocUrl+record.docPath+'"  download="'+record.docFileName+'">'+ record.docFileName + '</a>';
			var url =rootDocPreviewUrl+"?url="+encodeURIComponent(rootDocUrl+record.docPath);
			var html= '<a style="color:blue;text-decoration:underline;" target="new" href="'+url+'"  download="'+record.docFileName+'">'+ record.docFileName + '</a>';
			e.cellHtml = html;
		}
	};

	function newTabDown(filePath){
		newTabPage("下载", filePath, true);
	}
	/* function onDocActionRenderer(e){
        var s=null;
        var gridTemp = e.sender;
        var record = e.record;
        var uid = record._uid;
        var rowIndex = e.rowIndex;

        var edit = '<a class="Edit_Button" onclick="addAttach(\''+gridTemp.id+'\',\'' + uid + '\')" >编辑</a>' ;
    //    var down = ' <a class="Edit_Button" target="new" href="'+ rootUrl+record.docPath+ '"  download="'+record.docFileName+'">下载</a>';
        var del  = ' <a class="Delete_Button" onclick="docAttachDelRow(\''+gridTemp.id+'\',\'' + uid + '\')">删除</a>';


      //  var kaohe = '<input type="button" value="附件上传" onclick="addAttach(\''+gridTemp.id+'\',\'' + uid + '\')"/>';
        var str = edit + del;
        return str;
    } */
</script>