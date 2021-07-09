<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<html>
<head>
	<title>工作票</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div id="wowtTabs" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;" >
	<div title="列表" id="tabList2"  style="border: 0px;"  >
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid"
		    style="width: 100%; height: 92%;" url="${ctx}/wo-wt/wo/woWt/data" idField="id" allowResize="true" pageSize="10"
            allowCellSelect="true" multiSelect="false" editNextOnEnterKey="true" editNextRowCell="true"
			allowAlternating="true" showFilterRow="true" showColumnsMenu="false">		
			<div property="columns">
				<div type="indexcolumn" width="40"></div>
				<div type="checkcolumn"></div> 
					<div name="id" field="id" vtype="required" headerAlign="center" allowSort="true" width="64" visible="false" hideable="true">编号
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="id-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>																
					<div name="wtCode" field="wtCode" vtype="" headerAlign="center" allowSort="true" width="200">工作票号 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="wtCode-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>
					<div name="sourceType"  field="sourceType" vtype=""  headerAlign="center" type="comboboxcolumn"  allowSort="true" width="100" >票来源
						<input property="editor" class="mini-combobox"  valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_sourceType"   style="width:100%;"  />
						<input id="sourceType-Filter" name="mini-column-filter"  property="filter" class="mini-combobox" multiSelect="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_sourceType"   style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="content" field="content" vtype="" headerAlign="center" allowSort="true" width="300">工作内容 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="content-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>
					<div name="status" field="status" vtype="" type="comboboxcolumn" headerAlign="center" allowSort="true" width="100" sortField="a.status">状态
						<input property="editor" class="mini-combobox" style="width: 100%;" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_status" /> 
						<input id="status-Filter" name="mini-column-filter" property="filter" class="mini-combobox" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_wt_status" multiSelect="true" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>						
					<div name="wtType" field="wtType" vtype="" headerAlign="center" type="comboboxcolumn" allowSort="true" width="145"  hideable="true">类型 
						<input property="editor" class="mini-combobox" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_user_wt_type" style="width: 100%;" /> 
						<input id="wtType-Filter" name="mini-column-filter" property="filter" class="mini-combobox" valueField="value" textField="label" url="${ctx}/ims-ext/sys/dict/listDataStr?type=wo_user_wt_type" multiSelect="true" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>												
					<div name="descr" field="descr" vtype="" headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">描述 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="descr-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>
					<div name="location" field="location" vtype="" headerAlign="center" allowSort="true" width="200" visible="false">工作地点 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="location-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>
					<div name="planStartTime" field="planStartTime" vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center" allowSort="true" width="160"  hideable="true">计划开始时间 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="planStartTime-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>
					<div name="planEndTime" field="planEndTime" vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center" allowSort="true" width="160"  hideable="true">计划结束时间 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="planEndTime-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>														
					<div name="workLeader" field="workLeader" vtype="" headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">工作负责人 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="workLeader-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>
					<div name="workLeaderName" field="workLeaderName" vtype="" headerAlign="center" allowSort="true" width="100" sortField="a.work_leader_name">工作负责人 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="workLeaderName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>
					<div name="wtSigner" field="wtSigner" vtype="" headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">工作票签发人 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="wtSigner-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>
					<div name="wtSignerName" field="wtSignerName" vtype="" headerAlign="center" allowSort="true" width="100" sortField="a.wt_signer_name">工作签发人 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="wtSignerName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>
					<div name="wtReceiveName" field="wtReceiveName" vtype="" headerAlign="center" allowSort="true" width="100" sortField="a.wt_receive_name">工作票接收人 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="wtReceiveName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>
					<div name="wtReceiveTime" field="wtReceiveTime" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="150">工作票接收时间 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="wtReceiveTime-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>
					<div name="wtSignDate" field="wtSignDate" vtype="" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="160" visible="false">工作票签发时间 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="wtSignDate-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>
					<div name="smPermitBy" field="smPermitBy" vtype="" headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">工作票许可人 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="smPermitBy-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>
					<div name="smPermitByName" field="smPermitByName" vtype="" headerAlign="center" allowSort="true" width="100" sortField="a.sm_permit_by_name">工作许可人 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="smPermitByName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>						
					<div name="actEndTime" field="actEndTime" vtype="" dateFormat="yyyy-MM-dd HH:mm" headerAlign="center" allowSort="true" width="160">工作终结时间 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="actEndTime-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>
					
					<div name="appDutyLeaderName" field="appDutyLeaderName" vtype="" headerAlign="center" allowSort="true" width="140" visible="false" hideable="true">值长 
						<input property="editor" class="mini-textbox" style="width: 100%;" /> 
						<input id="appDutyLeaderName-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>														
					<div name="remarks" field="remarks" vtype="" headerAlign="center" allowSort="true" width="255" sortField="a.remarks" visible="false">备注信息 
						<input property="editor" class="mini-textarea" style="width: 100%;" /> 
						<input id="remarks-Filter" name="mini-column-filter" property="filter" class="mini-textbox" style="width: 100%;" onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)" />
					</div>
        		</div>
    		</div>
   			<div class="mini-toolbar" id="lov_action_bar"  style="text-align:center;vertical-align:middle;height: 8%;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
				<a class="mini-button" iconCls="icon-check"  style="width:70px;" onclick="onLovOk()">确定</a>
				<span style="display:inline-block;width:25px;"></span>
				<a class="mini-button" iconCls="icon-close"  style="width:70px;" onclick="onLovCancel()">取消</a>
			</div>
  		</div>
   </div>
   
</div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>
<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"WoWt",
				dataUrl:"${ctx}/wo-wt/wo/woWt/data",
				getUrl:"${ctx}/wo-wt/wo/woWt/get",
				saveUrl:"${ctx}/wo-wt/wo/woWt/save",
				removeUrl:"${ctx}/wo-wt/wo/woWt/remove",
				exportUrl:"${ctx}/wo-wt/wo/woWt/export",
				cloneCan:"0",
				editCan:"0",
				removeCan:"0",
				saveCan:"0",
				importCan:"0",
				exportCan:"0"
			 }
	       );

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: '编号',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.wo_id',
						label: '工单id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.swt_id',
						label: '标准工作票id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.wt_code',
						label: '工作票号',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.wt_type',
						label: '类型',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.spec_id',
						label: '专业',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.name',
						label: '工单内容',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.descr',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.location',
						label: '工作地点',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.source',
						label: '来源',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.equip_id',
						label: '设备id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.equip_name',
						label: '设备名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.equip_logic_id',
						label: '逻辑设备编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.equip_logic_name',
						label: '逻辑设备名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.plan_start_time',
						label: '计划开始时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.plan_end_time',
						label: '计划结束时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.work_leader',
						label: '工作负责人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.work_leader_name',
						label: '工作负责人名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.wt_signer',
						label: '工作票签发人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.wt_signer_name',
						label: '工作票签发人名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.wt_sign_date',
						label: '工作票签发时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.pc_signer',
						label: '点检签发人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.wt_receiver',
						label: '工作票接收人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.wt_receive_name',
						label: '工作票接收人名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.wt_receive_time',
						label: '工作票接受时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.permit_by',
						label: '工作许可人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.permit_date',
						label: '工作票许可签字时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.app_start_time',
						label: '批准工作开始时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.app_end_time',
						label: '批准工作结束时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.permit_start_time',
						label: '许可开始工作时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.create_by',
						label: '创建者',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_date',
						label: '创建时间',
						type: 'datetime',
						default_value: '',
						size: 100
							,
							plugin: 'datepicker',
					    	plugin_config: {
							format: 'yyyy-mm-dd',
							todayBtn: 'linked',
							todayHighlight: true,
							autoclose: true,
							language:"zh-CN"
						   }
					}
					,{
						id: 'a.update_by',
						label: '更新者',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.update_date',
						label: '更新时间',
						type: 'datetime',
						default_value: '',
						size: 100
							,
							plugin: 'datepicker',
					    	plugin_config: {
							format: 'yyyy-mm-dd',
							todayBtn: 'linked',
							todayHighlight: true,
							autoclose: true,
							language:"zh-CN"
						   }
					}
					,{
						id: 'a.remarks',
						label: '备注信息',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.site_id',
						label: '站点ID',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.status',
						label: '状态',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.org_id',
						label: '组织机构',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.org_name',
						label: '组织机构名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.maint_org',
						label: '检修班组',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.maint_org_name',
						label: '检修班组名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.person_num',
						label: '人员总数',
						type: 'integer',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.attach_page_num',
						label: '附页总数',
						type: 'integer',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.app_duty_leader',
						label: '批准值长',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.app_duty_leader_name',
						label: '批准值长名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.app_duty_leader_time',
						label: '批准值长签字时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.app_duty_principal',
						label: '批准值班负责人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.app_duty_principal_name',
						label: '批准值班负责人名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.app_duty_principal_time',
						label: '批准值班负责人签字时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.work_leader_sign',
						label: '安措已执行工作负责人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.work_leader_sign_name',
						label: '安措已执行工作负责人名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.work_leader_sign_time',
						label: '工作负责人签字时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.act_end_time',
						label: '实际结束时间',
						type: 'datetime',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.end_work_leader',
						label: '工作终结工作负责人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.end_work_leader_name',
						label: '工作终结工作负责人名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.end_permit_by',
						label: '工作终结工作许可人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.end_permit_by_name',
						label: '工作终结工作许可人名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.end_duty_principal',
						label: '工作终结值班负责人',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.end_duty_principal_name',
						label: '工作终结值班负责人名称',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.end_wire_total_num',
						label: '工作终结接地线总数',
						type: 'integer',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.end_wire_remove_num',
						label: '工作终结接地线已拆除数',
						type: 'integer',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.end_wire_keep_num',
						label: '工作终结接地线保留数',
						type: 'integer',
						default_value: '',
						size: 100
					}
			]
	);
   loadWindow();
   //////////操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){

   }
	
   function onLovOk() {
	    closeWindow("ok");
	}
</script>
</body>
</html>