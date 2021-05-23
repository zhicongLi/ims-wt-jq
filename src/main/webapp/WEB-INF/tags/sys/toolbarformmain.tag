<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="permissionEdit" type="java.lang.String" required="true" description="编辑权限"%>
<%@ attribute name="showFast" type="java.lang.Boolean" required="false" description="是否展示快速定位" %>
<div style="width:100%;">
	<div class="mini-toolbar" id="_tbForm" style="border-bottom:0;padding:0px;">
		<table style="width:100%;">
			<tr>
				<td style="width:100%;" id="toolbarformmain_td_">
                
					<a class="mini-button" id="_tbForm_add"  iconCls=""  onclick="addFormByRow(null,null,'after')" plain="true" tooltip="新建"><i class="fa fa-plus-circle"></i> 新建</a>
					<a class="mini-button" id="_tbForm_clone" iconCls="" onclick="cloneSelectFormRow()" plain="true" tooltip="复制"><i class="fa fa-copy"></i> 复制</a>
					<a class="mini-button ims-remove" id="_tbForm_remove" iconCls=""  onclick="removeSelectAndSave()" plain="true" tooltip="删除"><i class="far fa-trash-alt"></i> 删除</a>
					<span class="separator"></span>
					<a class="mini-button ims-save" id="_tbForm_save" iconCls="" style="" accessKey="s" onclick="saveForm()" plain="true" tooltip="保存"><i class="fa fa-save"></i> 保存</a>
					<span class="separator"></span>
                    
					<a class="mini-button" id="_tbForm_prev" iconCls="" onclick="prevData()" plain="true" tooltip="上一条"><i class="fa fa-arrow-left"></i></a>
					<a class="mini-button" id="_tbForm_next" iconCls="" onclick="nextData()" plain="true" tooltip="下一条"><i class="fa fa-arrow-right"></i></a>
					<span class="separator"></span>
                    <a class="mini-button" id="_tbForm_refresh" iconCls="" onclick="refreshFormData()" plain="true" tooltip="刷新"><i class="fa fa-refresh"></i></a>
					<a class="mini-menubutton" id="_tbForm_op" iconCls=""  plain="true" menu="#_pmForm" tooltip="操作"><i class="fas fa-bars"></i></a>
					<span class="separator"></span>
					<a class="mini-button" id="_tbForm_startFlow" iconCls=""  onclick="submitFlow('0')" plain="true" tooltip="启动流程"><i class="fa fa-random"></i></a>
					<span id="toolbarformmain_td_div_" style="white-space:nowrap;color: red;margin-left: 0px"></span>
					<span id="toolbarformmain_td_overflow_div_" style="white-space:nowrap;color: red;margin-left: 0px"></span>
				</td>
				<c:if test="${showFast}">
					<td style="white-space:nowrap;">
						<input id="_keyForm" class="mini-textbox" emptyText="快速定位" style="width:150px;" onenter="onKeyEnter"/>
						<a class="mini-button" id="_keyFormSearch" onclick="searchGrid()" iconCls=""  plain="true" tooltip="快速定位"><i class="fa fa-key"></i> </a>
					</td>
				</c:if>
			</tr>
		</table>
		<ul id="_pmForm" textField="name" class="mini-menu" style="display:none;" textField="name" idField="id" parentField="parentId"   onitemclick="onFormOpMiClick">

		</ul>
	</div>
</div>

