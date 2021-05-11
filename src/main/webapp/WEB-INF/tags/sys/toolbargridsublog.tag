<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="girdId" type="java.lang.String" required="true" description="表格Id"%>
<%@ attribute name="permissionEdit" type="java.lang.String" required="true" description="编辑权限"%>
<div style="width:100%;">
	<div class="mini-toolbar" id="_tb${girdId}"  style="border-bottom:0;padding:0px;">
		<table style="width:100%;">
			<tr>
				<td style="width:100%;">
					<a class="mini-button" id="_tb${girdId}_add" iconCls="icon-plus-sign"  onclick="addRow('${girdId}')" plain="true" tooltip="新建行"></a>
					<a class="mini-button" id="_tb${girdId}_clone" iconCls="icon-copy" onclick="cloneRow('${girdId}'  )" plain="true" tooltip="复制行"></a>
					<a class="mini-button" id="_tb${girdId}_remove" iconCls="icon-remove" style="color:red;" onclick="removeRow('${girdId}')"  plain="true" tooltip="删除行"></a>
					<span class="separator"></span>
				    <%--<a class="mini-button" id="_tb${girdId}_import" iconCls="icon-upload-alt"  onclick="ImportExcel('${girdId}' )" plain="true">导入行</a>--%>
					<a class="mini-button" id="_tb${girdId}_export" iconCls="icon-download-alt"  onclick="ExportExcel('${girdId}' )" plain="true" tooltip="导出行"></a>
					<span class="separator"></span>
					<a class="mini-button" id="_tb${girdId}_refresh" iconCls="icon-refresh" onclick="refreshChildGridData('${girdId}')" plain="true"  tooltip="刷新"></a>
					<a class="mini-menubutton" id="_tb${girdId}_op" iconCls="icon-cogs"  plain="true" menu="#_pm${girdId}" tooltip="操作"></a>
				    <a class="mini-button mini-button-success" id="_tb${girdId}_addExec"   onclick="addExec()" plain="true" tooltip="添加操作人">添加操作人</a>
				    <a class="mini-button mini-button-success" id="_tb${girdId}_addInspec" onclick="addInspec()" plain="true" tooltip="添加监护人">添加监护人</a>
                </td>
				<td style="white-space:nowrap;">
				    
				</td>
			</tr>
		</table>
		<ul id="_pm${girdId}" class="mini-menu" style="display:none;"  textField="name" idField="id" parentField="parentId"   onitemclick="onGridSubOpMiClick_${girdId}">

		</ul>
	</div>
</div>