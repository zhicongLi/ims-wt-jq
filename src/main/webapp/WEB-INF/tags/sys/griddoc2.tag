<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="girdId" type="java.lang.String" required="true" description="表格Id"%>
<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false"
						style="width: 100%; height: 100%;">
						<div title="常选人员" id="tabList" style="border: 0px;">
<div id="${girdId}" class="mini-datagrid"
	 style="width: 100%; height:100%"
	 url="${ctx}/om/omLog/data" idField="id"
	 allowResize="true" pageSize="10" allowCellSelect="true"
	 allowCellEdit="true" editNextOnEnterKey="true"
	 editNextRowCell="true" allowAlternating="true" ondrawcell="onDrawCellDoc"
	 showColumnsMenu="true" multiSelect="true">
	<div  property="columns">
		<div name="code" field="code" vtype="" readOnly="true"   headerAlign="center" allowSort="true" width="50" >名称
			
		</div>
		<div name="id"  field="id"   headerAlign="center" allowSort="true" width="84" >ID
		</div>
		<!-- <div name="name"  field="name"   headerAlign="center" allowSort="true" width="64" >名称
		</div> -->
		<!-- <div name="docFileName"  field="docFileName" readOnly="true"  headerAlign="center" allowSort="true" width="100" >文件名xxxx
			<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
				   onvaluechanged="onFilterChanged"

			/>
		</div> -->

		
	</div>
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
       /*  if (field == "docFileName") {
            e.cellHtml = '<a style="color:blue;text-decoration:underline;" href='+rootUrl+record.docPath+ '"  download="'+record.docFileName+'">'+ record.docFileName + '</a>';
        } */
    };

</script>