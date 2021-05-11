<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="girdId" type="java.lang.String" required="true" description="表格Id"%>
<%@ attribute name="permissionEdit" type="java.lang.String" required="true" description="编辑权限"%>
<%@ attribute name="showAdd" type="java.lang.String" required="false" description="是否显示新增"%>
<%@ attribute name="showClone" type="java.lang.String" required="false" description="是否显示复制"%>
<%@ attribute name="showRemove" type="java.lang.String" required="false" description="是否显示删除"%>
<%@ attribute name="showImport" type="java.lang.String" required="false" description="是否显示导入"%>
<%@ attribute name="showExport" type="java.lang.String" required="false" description="是否显示导出"%>
<%@ attribute name="showRefresh" type="java.lang.String" required="false" description="是否显示刷新"%>
<%@ attribute name="showOpButton" type="java.lang.String" required="false" description="是否显示操作下拉按钮"%>
<div style="width:100%;">
	<div class="mini-toolbar" id="_tb${girdId}"  style="border-bottom:0;padding:0px;">
		<table style="width:100%;">
			<tr>
				<td style="width:100%;" id="toolbargridsub_${girdId}_td_">
					<c:if test="${showAdd !='false' }">
					<a class="mini-button" id="_tb${girdId}_add" iconCls=""  onclick="addRow('${girdId}')" plain="true" tooltip="新建行"><i class="fa fa-plus-circle"></i></a>
					</c:if>
					<c:if test="${showClone !='false' }">
					<a class="mini-button" id="_tb${girdId}_clone" iconCls="" onclick="cloneRow('${girdId}'  )" plain="true" tooltip="复制行"><i class="fa fa-copy"></i></a>
					</c:if>
					<c:if test="${showRemove !='false' }">
					<a class="mini-button ims-remove" id="_tb${girdId}_remove" iconCls="" style="color:red;" onclick="removeRow('${girdId}')"  plain="true" tooltip="删除行"><i class="far fa-trash-alt"></i></a>
					</c:if>
                    <c:if test="${showImport !='false' }">
					<span class="separator"></span>
					<a class="mini-button" id="_tb${girdId}_import" iconCls=""  onclick="ImportExcel('','${girdId}' )" plain="true" tooltip="导入行"><i class="fa fa-upload"></i></a>
				   </c:if>
					<c:if test="${showExport !='false' }">
					<a class="mini-button" id="_tb${girdId}_export" iconCls=""  onclick="ExportExcel('${girdId}' )" plain="true" tooltip="导出行"><i class="fa fa-download"></i></a>
						<span class="separator"></span>
					</c:if>

					<c:if test="${showRefresh !='false' }">
					<a class="mini-button" id="_tb${girdId}_refresh" iconCls="" onclick="refreshChildGridData('${girdId}')" plain="true"  tooltip="刷新"><i class="fa fa-refresh"></i></a>
					</c:if>
					<c:if test="${showOpButton !='false' }">
					<a class="mini-menubutton" id="_tb${girdId}_op" iconCls=""  plain="true" menu="#_pm${girdId}" tooltip="操作"><i class="fas fa-bars"></i></a>
					</c:if>
				</td>
				<td style="white-space:nowrap;">
				</td>
			</tr>
		</table>
		<ul id="_pm${girdId}" class="mini-menu" style="display:none;"  textField="name" idField="id" parentField="parentId"   onitemclick="onGridSubOpMiClick_${girdId}">

		</ul>
	</div>
</div>