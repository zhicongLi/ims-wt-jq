<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="permissionEdit" type="java.lang.String" required="true" description="编辑权限"%>
<div style="width:100%;">
	<div class="mini-toolbar" id="_tbForm" style="border-bottom:0;padding:0px;">
		<table style="width:100%;">
			<tr>
				<td style="width:100%;">
					<a class="mini-button" id="_tbForm_add"  iconCls="icon-plus-sign"  onclick="addFormByRow(null,null,'after')" plain="true" tooltip="新建"></a>
					<a class="mini-button" id="_tbForm_clone" iconCls="icon-copy" onclick="cloneSelectFormRow()" plain="true" tooltip="复制"></a>
					<a class="mini-button" id="_tbForm_remove" iconCls="icon-remove" style="color:red;" onclick="removeSelectAndSave()" plain="true" tooltip="删除"></a>
					<span class="separator"></span>
					<a class="mini-button" id="_tbForm_save" iconCls="icon-save" style="color:green;" accessKey="s" onclick="saveForm()" plain="true" tooltip="保存"></a>
					<span class="separator"></span>
					<a class="mini-button" id="_tbForm_prev" iconCls="icon-arrow-left" onclick="prevData()" plain="true" tooltip="上一条"></a>
					<a class="mini-button" id="_tbForm_next" iconCls="icon-arrow-right" onclick="nextData()" plain="true" tooltip="下一条"></a>
					<span class="separator"></span>
                    <a class="mini-button" id="_tbForm_refresh" iconCls="icon-refresh" onclick="refreshFormData()" plain="true" tooltip="刷新"></a>
					<a class="mini-menubutton" id="_tbForm_op" iconCls="icon-cogs"  plain="true" menu="#_pmForm" tooltip="操作"></a>
					<span class="separator"></span>
					<a class="mini-button" id="_tbForm_sendNotice" iconCls="icon-upload"  onclick="sendNotice()" plain="true" tooltip="发送通知"></a>
					<span class="separator"></span>
					<a class="mini-button" id="_tbForm_startFlow" iconCls="icon-random"  onclick="submitFlow('0')" plain="true" tooltip="启动流程"></a>
				</td>
				<td style="white-space:nowrap;">
					<input id="_keyForm" class="mini-textbox" emptyText="请输入" style="width:150px;" onenter="onKeyEnter"/>
					<a class="mini-button" id="_keyFormSearch" onclick="searchGrid()" iconCls="icon-key"  plain="true" tooltip="快速定位"></a>
				</td>
			</tr>
		</table>
		<ul id="_pmForm" textField="name" class="mini-menu" style="display:none;" textField="name" idField="id" parentField="parentId"   onitemclick="onFormOpMiClick">

		</ul>
	</div>
</div>

