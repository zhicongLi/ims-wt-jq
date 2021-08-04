<%@ page language="java" pageEncoding="UTF-8"%>
<div title="热控保护措施票" id="tabWoWtRkMeasureList" name="tabWoWtRkMeasureList"  style="border: 0px;"  >

	<div id="formWoWtRkMeasure" class="form" style="width:99.999%;height:99.999%;">
	  <div class="mini-panel" title="基本信息" width="auto" height="auto"
	      showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
	      <table class="formtable" border="0" cellpadding="0" cellspacing="1" bgColor="#333">										
			  <tr>
			    <td style="text-align:right;">措施票流水号：</td>
				<td>
				  <input name="measureNumber" id="measureNumber" class="mini-textbox" width="200px"/>
				</td>
				<td style="text-align:right;">编号：</td>
				<td>
				  <input name="measureCode" id="measureCode" class="mini-textbox" width="200px" />
				</td>
				<td style="text-align:right;">工作票流水号：</td>
				<td>
				  <input name="serialNumber" id="serialNumber3" class="mini-textbox" width="200px" readonly="readonly"/>
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
			    <td style="text-align:right;">投入/退出热工装置名称：</td>
			    <td colspan="5">
			      <input name="deviceName" id="deviceName" class="mini-textarea" vtype="" required="false" width="100%" readonly="readonly"/>
			    </td>
			  </tr>						  										 			 					
			  <tr>
			    <td style="text-align:right;">投入/退出要求：</td>
			    <td colspan="5">
			      <input name="exitRequire" id="exitRequire" class="mini-textarea" vtype="" required="false" width="100%" />
			    </td>
			  </tr> 
			  <tr>
			    <td style="text-align:right;">投入/退出原因：</td>
			    <td colspan="5">
			      <input name="exitCause" id="exitCause" class="mini-textarea" vtype="" required="false" width="100%" />
			    </td>
			  </tr>		
	      </table>						
	    </div> 
		
		<div class="mini-panel" title="退出保护安全措施" width="auto"  id="tabWoWtsm16List" name="tabWoWtsm16List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">		   
		    <sys:toolbargridsub girdId="gridWoWtsm16" permissionEdit="wo:woWtSm:edit"></sys:toolbargridsub>
			<p>1.按照工作顺序填写应强制、应拆除、应断开或应恢复的信号、联锁及保护以及其他安全措施，执行后分别在执行栏内打"√"</p>
		    <p>2.注明相关软件编号、地址、机柜(控制箱、端子盒)端子编号等内容。</p>
			<div id="gridWoWtsm16" class="mini-datagrid sGrid" style="width: 99.999%;"
				url="${ctx}/wo-wt/wo/woWtSm/allData?typeId=16"
				idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
				editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div type="indexcolumn" width="30">序号</div>
					<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="32" visible="false" hideable="true">序号 
						<input property="editor" class="mini-textbox" style="width: 100%;" />
					</div>
					<div name="descr" field="descr" vtype="" headerAlign="center" allowSort="false" width="800" allowCellWrap="true">安全措施内容(退出保护)
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
					<td style="text-align:right;">热工保护或自动装置退出执行情况:</td>
					<td colspan="5">
					  <input name="exitCondition" id="exitCondition" class="mini-textarea" vtype="" required="false" width="100%"  />
					</td>
				</tr>
				<tr>
				    <td style="text-align:right;">许可退出时间：</td>
					<td>
					  <input name="exitPermitDate" id="exitPermitDate" class="mini-datepicker" allowInput="false" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;"/>
					</td>								    
					<td style="text-align:right;">工作许可人：</td>
					<td>
					  <input name="exitPermitBy" id="exitPermitByName_" textName="exitPermitByName"
					    onbuttonclick="sign_('exitPermitByName_','3')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/>										
					</td>
					<td style="text-align:right;">工作负责人：</td>
					<td >
					  <input name="exitWorkLeader" id="exitWorkLeaderName_" textName="exitWorkLeaderName" onbuttonclick="sign_('exitWorkLeaderName_','1')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/> 										
					</td>									
				</tr>
				<tr>
				    <td style="text-align:right;">退出完成时间：</td>
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
	   
	    <div class="mini-panel" title="投入保护安全措施" width="auto"  id="tabWoWtsm17List" name="tabWoWtsm17List" showCollapseButton="true" onbuttonclick="onPanelButtonClick" showFooter="true">		   
		    <sys:toolbargridsub girdId="gridWoWtsm17" permissionEdit="wo:woWtSm:edit"></sys:toolbargridsub>			
			<div id="gridWoWtsm17" class="mini-datagrid sGrid" style="width: 99.999%;"
				url="${ctx}/wo-wt/wo/woWtSm/allData?typeId=17"
				idField="id" allowResize="false" showPager="false" pageSize="1000" allowCellSelect="true" allowCellEdit="true"
				editNextOnEnterKey="true" editNextRowCell="true" showFilterRow="false" allowAlternating="true" showColumnsMenu="true" multiSelect="true">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div type="indexcolumn" width="30">序号</div>
					<div name="seqNo" field="seqNo" vtype="int" headerAlign="center" allowSort="true" width="32" visible="false" hideable="true">序号 
						<input property="editor" class="mini-textbox" style="width: 100%;" />
					</div>
					<div name="descr" field="descr" vtype="" headerAlign="center" allowSort="false" width="800" allowCellWrap="true">安全措施内容(投入保护)
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
			<table class="formtable" style="width:99.999%" >						
				<tr>
					<td style="text-align:right;">热工保护或自动装置投入执行情况:</td>
					<td colspan="5">
					  <input name="intoCondition" id="intoCondition" class="mini-textarea" vtype="" required="false" width="100%"  />
					</td>
				</tr>
				<tr>
				    <td style="text-align:right;">许可投入时间：</td>
					<td>
					  <input name="intoPermitDate" id="intoPermitDate" class="mini-datepicker" allowInput="false" showTime="true" vtype="" format="yyyy-MM-dd HH:mm:ss" required="false" style="width: 200px;"/>
					</td>								    
					<td style="text-align:right;">工作许可人：</td>
					<td>
					  <input name="intoPermitBy" id="intoPermitByName_" textName="intoPermitByName"
					    onbuttonclick="sign_('intoPermitByName_','3')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/>										
					</td>
					<td style="text-align:right;">工作负责人：</td>
					<td >
					  <input name="intoWorkLeader" id="intoWorkLeaderName_" textName="intoWorkLeaderName" onbuttonclick="sign_('exitWorkLeaderName_','1')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="false" style="width: 200px;"/> 										
					</td>									
				</tr>
				<tr>
				    <td style="text-align:right;">投入完成时间：</td>
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