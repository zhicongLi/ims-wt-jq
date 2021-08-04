<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="girdId" type="java.lang.String" required="true" description="表格Id"%>
<%@ attribute name="permissionEdit" type="java.lang.String" required="true" description="编辑权限"%>
<%@ attribute name="objKeyField" type="java.lang.String" required="true" description="对象主键属性"%>
<%@ attribute name="objDescrField" type="java.lang.String" required="true" description="对象描述属性"%>
<%@ attribute name="objType" type="java.lang.String" required="true" description="对象类型"%>
<%@ attribute name="directSelect" type="java.lang.String" required="false"   description="是否直接选择上传"%>
<%@ attribute name="directMultiple" type="java.lang.String" required="false" description="直接选择是否允许多选"%>
<%@ attribute name="showNewButton" type="java.lang.String" required="false" description="是否新增按钮"%>
<%@ attribute name="showDragBox" type="java.lang.String" required="false" description="是否显示拖拽框"%>
<div style="width:100%;">
<c:if test="${showNewButton !='false' }">
	<div class="mini-toolbar" id="_tbDoc_${girdId}"  style="border-bottom: 0; padding: 0px;">
		<table style="width: 100%;">
			<tr>
				<td style="width: 100%;">
					<a id="_sm_doc_add" class="mini-button" iconCls="" onclick="docAttachNew('${girdId}','${objKeyField}','${objDescrField}','${objType}','','','${directSelect=='true'?'true':''}','${directMultiple=='true'?'true':''}')"
					   plain="true"
					   tooltip="新建行..."><i class="fa fa-plus-circle"></i></a>
<%-- 					<a class="mini-button" iconCls="" onclick="docAttachNew('${girdId}','${objKeyField}','${objDescrField}','${objType}','','',${directSelect=='true'?'true':''},${directMultiple=='true'?'true':''})"
					   plain="true"
					   tooltip="新建行..."><i class="fa fa-plus-circle"></i></a> --%>
					 

				<td style="white-space: nowrap;"></td>
			</tr>
		</table>
	</div>
</c:if>
	<div  id="__file_drag_${girdId}" onclick="docAttachSelect('${girdId}',true)" style="min-width:300px;min-height:100px;border:3px dashed silver;display: ${showDragBox=='true'?'block':'none'}">
		<div style="top:50%;text-align:center;margin-top: 35px;font-style: italic;color:gray"><H2><i class="fa fa-plus-circle"></i>点击或拖拽到此处上传</H2></div>
	</div>

</div>
<script type="text/javascript">
	docAttachDragInit('${girdId}');
</script>