<%@ page language="java" pageEncoding="UTF-8"%>
<div title="作业安全措施票" id="tabWoTaskSafeMeasureList" name="tabWoTaskSafeMeasureList"  style="border: 0px;"  >
	<div id="formWoWtWorkSafe" class="form" style="width:99.999%;height:99.999%;">
		<div class="mini-panel" title="作业安全措施" width="auto" height="" id="tabWoTaskSafeMeasure1List" name="tabWoTaskSafeMeasure1List"
				 showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true" >
			<div style="width:100%;">
				<div class="mini-toolbar" id="_tbgridWoTaskSafeMeasure"  style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
							<td style="width:100%;">
								
								<a class="mini-button" id="_tbgridWoTaskSafeMeasure_add" iconCls="icon-plus-sign"  onclick="addRowDef('gridWoTaskSafeMeasure')" plain="true" tooltip="新建行"></a>
								<a class="mini-button" id="_tbForm_save3" iconCls="icon-save" style="color:green;" accessKey="s" onclick="saveForm()" plain="true" tooltip="保存"></a>
								<a class="mini-button" id="_tbgridWoTaskSafeMeasure_insertRow" iconCls="icon-signin "onclick="insertRow('gridWoTaskSafeMeasure')" plain="true" tooltip="插入行">
								<a class="mini-button" id="_tbgridWoTaskSafeMeasure_remove" iconCls="icon-remove" style="color:red;" onclick="removeRow('gridWoTaskSafeMeasure')"  plain="true" tooltip="删除行"></a>
								<!-- <a class="mini-button" id="_tbgridWoTaskSafeMeasure_replace" iconCls="icon-search" onclick="openReplaceWin('gridWoTaskSafeMeasure')" plain="true" tooltip="查找替换"></a> -->
								<!-- <a class="mini-button"  id="_tbgridWoTaskSafeMeasure_select"  plain="true" onclick="searchDangerSource" tooltip="选择工序对应危险源">选择危险源</a> -->
								<a class="mini-button"  id="_tbgridWoTaskSafeMeasure_selectWork"  plain="true" onclick="searchDangerSourceWork" tooltip="选择工序对应危险源">选择作业</a>
								
								<!-- <a class="mini-button" id="_tbgridWoTaskSafeMeasure_act"  onclick="allAct('gridWoTaskSafeMeasure')" plain="true"  tooltip="全部执行">全部执行</a> -->
								<span class="separator"></span>
							  
								<a class="mini-button" id="_tbgridWoTaskSafeMeasure_export" iconCls="icon-download-alt"  onclick="ExportExcel('gridWoTaskSafeMeasure' )" plain="true" tooltip="导出行"></a>
								
								<span class="separator"></span>
								<a class="mini-button" id="_tbgridWoTaskSafeMeasure_refresh" iconCls="icon-refresh" onclick="refreshChildGridData('gridWoTaskSafeMeasure')" plain="true"  tooltip="刷新"></a>
								<a class="mini-menubutton" id="_tbgridWoTaskSafeMeasure_op" iconCls="icon-cogs"  plain="true" menu="#_pmgridWoTaskSafeMeasure" tooltip="操作"></a>
								 
		
							</td>
							<td style="white-space:nowrap;">
							</td>
						</tr>
					</table>
					<ul id="_pmgridWoTaskSafeMeasure" class="mini-menu" style="display:none;"  textField="name" idField="id" parentField="parentId"   onitemclick="onGridSubOpMiClick_gridWoTaskSafeMeasure">
			
					</ul>
				</div>
			</div>
			<div id="gridWoTaskSafeMeasure" class="mini-datagrid sGrid" style="width:100%;"
				 url="${ctx}/wo-wt/wo/woTaskSafeMeasure/allData" idField="id"
				 allowResize="true" pageSize="10" 
				 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
				 editNextOnEnterKey="true"  editNextRowCell="true"
				 allowAlternating="true" showFilterRow="false"  showColumnsMenu="false"
				 showPager="false" 
			>
				<div property="columns">
			    <div type="checkcolumn"></div>
			    <div type="indexcolumn" headerAlign="center" width="30">序号</div>
					<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="taskName"  field="taskName" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false" hideable="true">任务名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="taskName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="processName"  field="processName" vtype=""  headerAlign="center" allowSort="true" width="50" >工序
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="processName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="dangerSourceId"  field="dangerSourceId" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">危险源id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="dangerSourceId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="dangerSourceName"  field="dangerSourceName" vtype=""  headerAlign="center" allowSort="true" width="50" >危险源
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="dangerSourceName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="factorName"  field="factorName" vtype=""  headerAlign="center" allowSort="true" width="80" >危害因素
						<input property="editor" class="mini-textbox"  style="width:100%;"  /> 
						<input id="factorName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="consequenceName"  field="consequenceName" vtype=""  headerAlign="center" allowSort="true" width="30" visible="false" hideable="true">危害后果
						<!-- <input property="editor" class="mini-textbox"  style="width:100%;"  /> -->
						<input id="consequenceName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="consequenceCode"  field="consequenceCode" vtype=""  headerAlign="center" allowSort="true" width="22" visible="false" hideable="true">危害后果编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="consequenceCode-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="riskGradeCode"  field="riskGradeCode" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">风险等级编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="riskGradeCode-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="riskGradeName"  field="riskGradeName" vtype=""  headerAlign="center" allowSort="true" width="30" visible="false" hideable="true">风险等级
						<!-- <input property="editor" class="mini-textbox"  style="width:100%;"  /> -->
						<input id="riskGradeName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="measureName"  field="measureName" vtype=""  headerAlign="center" allowSort="true" width="150" >作业标准
						<input property="editor" class="mini-textbox"  style="width:100%;"  /> 
						<input id="measureName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">创建者
						<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createDate"  field="createDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" visible="false" hideable="true">创建时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">更新者
						<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateDate"  field="updateDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" visible="false" hideable="true">更新时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="remarks"  field="remarks" vtype=""  headerAlign="center" allowSort="true" width="500" visible="false" hideable="true">备注
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="wtId"  field="wtId" vtype=""  headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">对应工作票id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="wtId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="seqNo"  field="seqNo" vtype=""  headerAlign="center" allowSort="true" width="100" visible="false" hideable="true">排序
						<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
						<input id="seqNo-Filter" name="mini-column-filter"  property="filter" class="mini-spinner"  allowLimitValue="false" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
				</div>
	  	 </div>
	   </div>
		   <div>
				<table class="formtable" style="width:99.999%" >
					<input class="mini-hidden" name="wtId" />
					<input class="mini-hidden" name="id" />
						<tr>
							<td style="width: 15%;">作业安全措施交底:</td>
							<td style="width: 84%;"><input name="safeMeasureContent" id="safeMeasureContent"
								class="mini-textarea" vtype="" required="false" width="100%"  />
							</td>
						</tr>
					</table> 
			</div>
	   </div>
</div>