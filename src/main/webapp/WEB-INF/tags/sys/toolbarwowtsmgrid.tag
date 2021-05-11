<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="girdId" type="java.lang.String" required="true" description="表格Id"%>
<%@ attribute name="permissionEdit" type="java.lang.String" required="true" description="编辑权限"%>
<%@ attribute name="showAdd" type="java.lang.String" required="false" description="是否显示新增"%>
<%@ attribute name="showClone" type="java.lang.String" required="false" description="是否显示复制"%>
<%@ attribute name="showRemove" type="java.lang.String" required="false" description="是否显示删除"%>
<%@ attribute name="showExport" type="java.lang.String" required="false" description="是否显示导出"%>
<%@ attribute name="showRefresh" type="java.lang.String" required="false" description="是否显示导出"%>
<%@ attribute name="showOpButton" type="java.lang.String" required="false" description="是否显示操作下拉按钮"%>
<%@ attribute name="showOneKeyExecution" type="java.lang.String" required="false" description="是否显示一键执行"%>
<%@ attribute name="showSafeMeasures" type="java.lang.String" required="false" description="是否显示安全措施库"%>
<%@ attribute name="smTypeId" type="java.lang.String" required="false" description="安全措施类型"%>
<div style="width:100%;">
	<div class="mini-toolbar" id="_tb${girdId}"  style="border-bottom:0;padding:0px;">
		<table style="width:100%;">
			<tr>
				<td style="width:100%;">
					<c:if test="${showAdd !='false' }">
						<a class="mini-button" id="_tb${girdId}_add" iconCls="icon-plus-sign"  onclick="addRow('${girdId}')" plain="true" tooltip="新建行"></a>
					</c:if>
					<c:if test="${showClone !='false' }">
						<a class="mini-button" id="_tb${girdId}_clone" iconCls="icon-copy" onclick="cloneRow('${girdId}'  )" plain="true" tooltip="复制行"></a>
					</c:if>
					<c:if test="${showRemove !='false' }">
						<a class="mini-button" id="_tb${girdId}_remove" iconCls="icon-remove" style="color:red;" onclick="removeRow('${girdId}')"  plain="true" tooltip="删除行"></a>
					</c:if>
					<c:if test="${showOneKeyExecution!='false' }">
					<a class="mini-button" id="_tb${girdId}_OneKeyExecution" iconCls="icon-hand-right" style="color: green;" onclick="updFieldValue('${girdId}','execRes','√')" plain="true" tooltip="一键执行"></a>
					</c:if>
					<span class="separator"></span>
				    <%--<a class="mini-button" id="_tb${girdId}_import" iconCls="icon-upload-alt"  onclick="ImportExcel('${girdId}' )" plain="true">导入行</a>--%>
				   <c:if test="${showExport !='false' }">
						<a class="mini-button" id="_tb${girdId}_export" iconCls="icon-download-alt"  onclick="ExportExcel('${girdId}' )" plain="true" tooltip="导出行"></a>
						<span class="separator"></span>
					</c:if>
					<c:if test="${showRefresh !='false' }">
						<a class="mini-button" id="_tb${girdId}_refresh" iconCls="icon-refresh" onclick="refreshChildGridData('${girdId}')" plain="true"  tooltip="刷新"></a>
					</c:if>
					<c:if test="${showOpButton !='false' }">
						<a class="mini-menubutton" id="_tb${girdId}_op" iconCls="icon-cogs"  plain="true" menu="#_pm${girdId}" tooltip="操作"></a>
					</c:if>
					<c:if test="${showSafeMeasures !='false' }">
						<a class="mini-button" id="_tb${girdId}_add_safe_measures" iconCls="icon-signin" onclick="addSafeMeasures_('${girdId}')" plain="true"  tooltip="添加到安全措施库"></a>
						<a class="mini-button" id="_tb${girdId}_choose_safe_measures" iconCls="icon-search" onclick="chooseSafeMeasures_('${girdId}','${smTypeId}')" plain="true"  tooltip="选择安全措施"></a>
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


