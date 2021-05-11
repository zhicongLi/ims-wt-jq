<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="objId" type="java.lang.String" required="true" description="对象Class"%>
<%@ attribute name="permissionEdit" type="java.lang.String" required="true" description="编辑权限"%>
<div style="width:100%;">
	<div class="mini-toolbar"  style="border-bottom:0;padding:0px;">
		<table style="width:100%;">
			<tr>
				<td style="width:100%;">
                    
						<input class="mini-hidden" name="_permissionEdit_flag" id="_permissionEdit_flag"/>
						<a class="mini-button" iconCls="" id="_tbGrid_add"   onclick="addRow(null,'after')" plain="true" tooltip="新建"><i class="fa fa-plus-circle"></i> 新建</a>
						<span class="separator"></span>
						<a class="mini-button" iconCls="" id="_tbGrid_clone" onclick="cloneRow()" plain="true" tooltip="复制"><i class="fa fa-copy"></i> 复制</a>
						<a class="mini-button ims-remove" iconCls="" id="_tbGrid_remove"  onclick="removeRow()" plain="true" tooltip="删除"><i class="far fa-trash-alt"  ></i> 删除</a>
						<a class="mini-button ims-save" iconCls="" id="_tbGrid_save"   onclick="saveGrid()" plain="true" tooltip="保存"><i class="fa fa-save"></i> 保存</a>
					    <a class="mini-button" iconCls=""  id="_tbGrid_import" onclick="ImportExcel()" plain="true" tooltip="导入"><i class="fa fa-upload"></i> 导入</a>
                 
					<a class="mini-button" iconCls=""  id="_tbGrid_export" onclick="ExportExcel()" plain="true" tooltip="导出"><i class="fa fa-download"></i> 导出</a>
					<a class="mini-button" id="btnAdvSearch" iconCls="" onclick="showAdvQuery()"  plain="true" tooltip="高级查询"><i class="fa fa-search"></i> 高级查询</a>
					<input id="btnQueryList" class="mini-combobox" style="width:150px;" textField="name" valueField="id"
						   url="${ctx}/ims-ext/sys/sysQuery/allData?objId=${objId}&isActive=1&isShow=1" showNullItem="true"  emptyText="[选择查询...]"
						   nullItemText="[选择查询]"  valueFromSelect="true"  />
					<span class="separator"></span>
					<a class="mini-button" id="_tbGrid_refresh" iconCls="" onclick="refreshGridData()" plain="true" tooltip="刷新"><i class="fa fa-refresh"></i></a>
					<a class="mini-menubutton" id="_tbGrid_op" iconCls=""  plain="true" menu="#_pmGrid" tooltip="操作" ><i class="fas fa-bars"></i></a>
				</td>
				<td style="white-space:nowrap;">
					<input id="_key" class="mini-textbox" emptyText="快速定位" style="width:150px;" onenter="onKeyEnter"/>
					<a class="mini-button" id="_keyGridSearch" onclick="searchGrid()" iconCls=""  plain="true" tooltip="快速定位"><i class="fa fa-key"></i></a>
				</td>
			</tr>
		</table>
		<ul id="_pmGrid" class="mini-menu" style="display:none;"  textField="name" idField="id" parentField="parentId"    onitemclick="onGridOpMiClick">

		</ul>
	</div>
</div>