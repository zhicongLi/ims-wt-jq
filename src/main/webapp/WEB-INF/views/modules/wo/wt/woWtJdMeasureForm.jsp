<%@ page language="java" pageEncoding="UTF-8"%>
<div title="继电保护措施票" id="tabWoWtJdMeasureList" name="tabWoWtJdMeasureList"  style="border: 0px;"  >

	<div id="formWoWtJdMeasure" class="form" style="width:99.999%;height:99.999%;">
	  <div class="mini-panel" title="基本信息" width="auto" height="auto"
	      showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
	      <table class="formtable" border="0" cellpadding="0" cellspacing="1" bgColor="#333">										
			  <tr>
			    <td style="text-align:right;">措施票流水号：</td>
				<td>
				  <input name="measureNumber" id="measureNumber" class="mini-textbox" width="200px" readonly="readonly"/>
				</td>
				<td style="text-align:right;">编号：</td>
				<td>
				  <input name="measureCode" id="measureCode" class="mini-textbox" width="200px" readonly="readonly"/>
				</td>
				<td style="text-align:right;">工作票流水号：</td>
				<td>
				  <input name="serialNumber" id="serialNumber2" class="mini-textbox" width="200px" readonly="readonly"/>
				</td>									
			  </tr>	
			  <tr>							
				<td style="text-align:right;">班组：</td>									
				<td >				  
				  <input name="maintOrgName" id="maintOrgName" class="mini-textbox" width="200px" readonly="readonly"/>
				</td>
				<td style="text-align:right;">功能位置：</td>
				<td>
				  <input name="equipLogicName" id="equipLogicName" textName="equipLogicName" allowInput="false" width="200px" class="mini-buttonedit" vtype="" required="false" readonly="readonly"
					onbuttonclick="popLov(this,'选择逻辑设备',false,true,'${ctxRoot}/form?view=/em/emEquipLogicLov',800,500,'id,name','equipLogicId,equipLogicName')"/>
				</td>
				<td style="text-align:right;">状态：</td>
				<td>
				  <input name="status" id="status" class="mini-combobox" allowInput="false" enabled="true" required="false" valueField="value" textField="label" vtype=""  width="200px" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_status" readonly="readonly"/>
				</td>								
			  </tr>			  		  
			  <tr>
				<td style="text-align:right;">工作负责人：</td>
				<td>				 
				  <input name="workLeaderName" id="workLeaderName" class="mini-textbox" width="200px" readonly="readonly"/>
				</td>
				<td style="text-align:right;">部门：</td>
				<td colspan="3">				  
				  <input name="orgName" id="orgName" class="mini-textbox" width="200px" readonly="readonly"/>
				</td>					
			  </tr>	
			  <tr>
				<td style="text-align:right;">工作内容：</td>
				<td colspan="5">
				  <input name="content" id="content" class="mini-textarea" vtype="" required="false" width="100%" readonly="readonly"/>
				</td>
			  </tr>
			  <tr>
				<td style="text-align:right;">计划工作开始时间：</td>
				<td>
				  <input name="planStartTime" id="planStartTime" allowInput="false" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;" />
				</td>
				<td style="text-align:right;">计划工作结束时间：</td>
				<td colspan="3">   
				  <input name="planEndTime" id="planEndTime" allowInput="false" class="mini-datepicker" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;" />
				</td>
			  </tr>	
			  <tr>
			    <td style="text-align:right;">退出继电保护或自动装置名称：</td>
			    <td colspan="5">
			      <input name="deviceName" id="deviceName" class="mini-textarea" vtype="" required="false" width="100%" />
			    </td>
			  </tr>						  										 			 								 
	      </table>						
	    </div> 
		
		<div class="mini-panel" title="工作条件" width="auto" height="auto"
	      showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
	      <table class="formtable">
	        <tr>
			    <td style="text-align:right;width:19%;">1.一次设备运行情况：</td>
			    <td colspan="5">
			      <input name="condition1" id="condition1" class="mini-textarea" vtype="" required="false" width="100%" />
			    </td>
			</tr>
			<tr>
			    <td style="text-align:right;width:19%;">2.被试保护作用的断路器：</td>
			    <td colspan="5">
			      <input name="condition2" id="condition2" class="mini-textarea" vtype="" required="false" width="100%" />
			    </td>
			</tr>
			<tr>
			    <td style="text-align:right;width:19%;">3.被试保护屏上的运行设备：</td>
			    <td colspan="5">
			      <input name="condition3" id="condition3" class="mini-textarea" vtype="" required="false" width="100%" />
			    </td>
			</tr>
			<tr>
			    <td style="text-align:right;width:19%;">4.被试保护屏、端子箱与其他保护连接线：</td>
			    <td colspan="5">
			      <input name="condition4" id="condition4" class="mini-textarea" vtype="" required="false" width="100%" />
			    </td>
			</tr>
			<tr>
			    <td style="text-align:right;width:19%;">5.其他：</td>
			    <td colspan="5">
			      <input name="condition5" id="condition5" class="mini-textarea" vtype="" required="false" width="100%" />
			    </td>
			</tr>
				
	      </table>
	    </div>
		
		<div class="mini-panel" title="执行保护安全措施" width="auto"  id="tabWoWtsm18List" name="tabWoWtsm18List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">		   
		    <sys:toolbargridsub girdId="gridWoWtsm18" permissionEdit="wo:woWtSm:edit"></sys:toolbargridsub>
			<div id="gridWoWtsm18" class="mini-datagrid sGrid" style="width: 99.999%;"
				url="${ctx}/wo-wt/wo/woWtSm/allData?typeId=18"
				idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
				editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div type="indexcolumn" width="30">序号</div>
					<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="32" visible="false" hideable="true">序号 
						<input property="editor" class="mini-textbox" style="width: 100%;" />
					</div>
					<div name="descr" field="descr" vtype="" headerAlign="center" allowSort="false" width="800" allowCellWrap="true">安全措施内容(执行)
						<input property="editor" class="mini-textarea" style="width: 100%;" />
					</div>
					<div name="execRes" field="execRes" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="200">执行情况
						<input property="editor" class="mini-textarea" style="width: 100%;" />
					</div>
					<div name="typeId" field="typeId" vtype="" headerAlign="center" visible="false" hideable="true"allowSort="false" width="32">安措类型 
						<input property="editor" class="mini-textbox" style="width: 100%;" />
					</div>					
				</div>
			</div>
		</div>
	    <div>
			<table class="formtable" >		
				<input class="mini-hidden" name="wtId" id="wtId"/>
				<input class="mini-hidden" name="id" />				
				<tr>
				    <td style="text-align:right;">许可执行时间：</td>
					<td>
					  <input name="exitPermitDate" id="exitPermitDate" class="mini-datepicker" allowInput="false" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;"/>
					</td>								    
					<td style="text-align:right;">许可人：</td>
					<td>
					  <input name="exitPermitBy" id="exitPermitByName_" textName="exitPermitByName"
					    onbuttonclick="sign_('exitPermitByName_','3')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/>										
					</td>
					<td style="text-align:right;">工作负责人：</td>
					<td >
					  <input name="exitWorkLeader" id="exitWorkLeaderName_" textName="exitWorkLeaderName" onbuttonclick="sign_('exitWorkLeaderName_','99')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/> 										
					</td>									
				</tr>
				<tr>
				    <td style="text-align:right;">执行完成时间：</td>
					<td>
					  <input name="exitFinishDate" id="exitFinishDate" class="mini-datepicker" allowInput="false" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;"/>
					</td>								    
					<td style="text-align:right;">操作人：</td>
					<td>
					  <input name="exitOperator" id="exitOperatorName_" textName="exitOperatorName"
					    onbuttonclick="sign_('exitOperatorName_','99')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/>										
					</td>
					<td style="text-align:right;">监护人：</td>
					<td >
					  <input name="exitGuardian" id="exitGuardianName_" textName="exitGuardianName" onbuttonclick="sign_('exitGuardianName_','99')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/> 										
					</td>									
				</tr>
			</table> 
		</div>
	   
	    <div class="mini-panel" title="恢复保护安全措施" width="auto"  id="tabWoWtsm19List" name="tabWoWtsm19List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">		   
		    <sys:toolbargridsub girdId="gridWoWtsm19" permissionEdit="wo:woWtSm:edit"></sys:toolbargridsub>			
			<div id="gridWoWtsm19" class="mini-datagrid sGrid" style="width: 99.999%;"
				url="${ctx}/wo-wt/wo/woWtSm/allData?typeId=19"
				idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
				editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div type="indexcolumn" width="30">序号</div>
					<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="32" visible="false" hideable="true">序号 
						<input property="editor" class="mini-textbox" style="width: 100%;" />
					</div>
					<div name="descr" field="descr" vtype="" headerAlign="center" allowSort="false" width="800" allowCellWrap="true">安全措施内容(恢复)
						<input property="editor" class="mini-textarea" style="width: 100%;" />
					</div>
					<div name="execRes" field="execRes" vtype="" headerAlign="center" allowCellWrap="true" allowSort="false" width="200">执行情况
						<input property="editor" class="mini-textarea" style="width: 100%;" />
					</div>
					<div name="typeId" field="typeId" vtype="" headerAlign="center" visible="false" hideable="true"allowSort="false" width="32">安措类型 
						<input property="editor" class="mini-textbox" style="width: 100%;" />
					</div>					
				</div>
			</div>
		</div>
	   
	    <div>
			<table class="formtable">										
				<tr>
				    <td style="text-align:right;">许可恢复时间：</td>
					<td>
					  <input name="intoPermitDate" id="intoPermitDate" class="mini-datepicker" allowInput="false" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;"/>
					</td>								    
					<td style="text-align:right;">许可人：</td>
					<td>
					  <input name="intoPermitBy" id="intoPermitByName_" textName="intoPermitByName"
					    onbuttonclick="sign_('intoPermitByName_','3')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/>										
					</td>
					<td style="text-align:right;">工作负责人：</td>
					<td >
					  <input name="intoWorkLeader" id="intoWorkLeaderName_" textName="intoWorkLeaderName" onbuttonclick="sign_('intoWorkLeaderName_','99')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/> 										
					</td>									
				</tr>
				<tr>
				    <td style="text-align:right;">恢复完成时间：</td>
					<td>
					  <input name="intoFinishDate" id="intoFinishDate" class="mini-datepicker" allowInput="false" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;"/>
					</td>								    
					<td style="text-align:right;">操作人：</td>
					<td>
					  <input name="intoOperator" id="intoOperatorName_" textName="intoOperatorName"
					    onbuttonclick="sign_('intoOperatorName_','99')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/>										
					</td>
					<td style="text-align:right;">监护人：</td>
					<td >
					  <input name="intoGuardian" id="intoGuardianName_" textName="intoGuardianName" onbuttonclick="sign_('intoGuardianName_','99')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/> 										
					</td>									
				</tr>
			</table> 
		</div>
	   
	    <div class="mini-panel" title="审核信息" width="auto" height="auto"
	      showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
	      <table class="formtable">
	        <tr>
	            <td style="text-align:right;">审核人：</td>
				<td >
				  <input name="auditor" id="auditorName_" textName="auditorName"
				    onbuttonclick="sign_('auditorName_','99')" allowInput="false" class="mini-buttonedit defSign_" vtype=""required="false" style="width: 200px;"/>
				</td>
				<td style="text-align:right;">审核时间：</td>
				<td colspan="3">
				  <input name="auditorDate" id="auditorDate" class="mini-datepicker" allowInput="false" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;"/>
				</td>												
			</tr>
			<tr>
	            <td style="text-align:right;">签发人：</td>
				<td >
				  <input name="wtSigner" id="wtSignerName_" textName="wtSignerName"
				    onbuttonclick="sign_('wtSignerName_','99')" allowInput="false" class="mini-buttonedit defSign_" vtype=""required="false" style="width: 200px;"/>
				</td>
				<td style="text-align:right;">签发时间：</td>
				<td colspan="3">
				  <input name="wtSignerDate" id="wtSignerDate" class="mini-datepicker" allowInput="false" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;"/>
				</td>												
			</tr>
	      </table>
	    </div>
	    
	</div>
</div>