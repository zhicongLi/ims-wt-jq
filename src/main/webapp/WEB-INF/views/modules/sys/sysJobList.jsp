<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>后台任务</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysJob" permissionEdit="sys:sysJob:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-datagrid" style="width:100%;height:100%;"
			 url="${ctx}/sys/sysJob/data" idField="id"
			 allowResize="true" pageSize="10"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="true"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
					<div name="id" field="id" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="100" >名称
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div name="descr" field="descr" vtype=""   headerAlign="center" allowSort="true" width="64" >描述
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="descr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
					</div>
					<div type="checkboxcolumn"  name="isActive"  field="isActive"  vtype=""  trueValue="1" falseValue="0"
					headerAlign="center" allowSort="true" width="120" >是否启用

					</div>

				<div name="jobGroup" field="jobGroup" vtype=""   headerAlign="center" allowSort="true" width="100" >任务分组
					<input property="editor" class="mini-textbox"  style="width:100%;"  />
					<input id="jobGroup-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
				</div>
				<div name="keyId" field="keyId" vtype=""   headerAlign="center" allowSort="true" width="100" >对象主键
					<input property="editor" class="mini-textbox"  style="width:100%;"  />
					<input id="keyId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
				</div>
				<div name="objId" field="objId" vtype=""   headerAlign="center" allowSort="true" width="100" >实体类名称
					<input property="editor" class="mini-textbox"  style="width:100%;"  />
					<input id="objId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
				</div>
				<div type="comboboxcolumn" autoShowPopup="true" name="jobStatus"  field="jobStatus" vtype=""  headerAlign="center" allowSort="true" width="64" >任务状态
					<input property="editor" class="mini-combobox" style="width:100%;" valueField="value"  textField="label"  url="${ctx}/sys/dict/listDataStr?type=sys_job_status" />
				</div>

				<div name="cronExpression" field="cronExpression" vtype=""   headerAlign="center" allowSort="true" width="255" >cron表达式
					<input property="editor" class="mini-textbox"  style="width:100%;"  />
				</div>
				<div name="beanClass" field="beanClass" vtype=""   headerAlign="center" allowSort="true" width="100" >bean类
					<input property="editor" class="mini-textbox"  style="width:100%;"  />
					<input id="beanClass-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged"
						/>
				</div>
				<div name="lastProcessTime" field="lastProcessTime" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >上次执行日期
					<input property="editor" class="mini-textbox"  style="width:100%;"  />
				</div>
				<div name="nextProcessTime" field="nextProcessTime" vtype=""  dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >下次执行日期
					<input property="editor" class="mini-textbox"  style="width:100%;"  />
				</div>
					<div name="siteId" field="siteId" vtype=""   headerAlign="center" allowSort="true" width="64" >域编码
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
					</div>
					<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >创建者
					</div>
					<div name="createDate"  field="createDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >创建时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
					</div>
					<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >更新者
					</div>
					<div name="updateDate"  field="updateDate"  vtype=""  readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="120" >更新时间
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
					</div>
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注信息
						<input property="editor" class="mini-textarea" style="width:100%;"  />
					</div>

        </div>
    </div>
   </div>

<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
			    objId:"SysJob",
				dataUrl:"${ctx}/sys/sysJob/data",
				getUrl:"${ctx}/sys/sysJob/get",
				saveUrl:"${ctx}/sys/sysJob/save",
				removeUrl:"${ctx}/sys/sysJob/remove",
				exportUrl:"${ctx}/sys/sysJob/export"
			 }
	       );

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: '编码',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.name',
						label: '名称',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.descr',
						label: '描述',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.is_active',
						label: '是否启用',
						type: 'string',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.site_id',
						label: '域编码',
						type: 'string',
						default_value: '',
						size: 64
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
						size: 120
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
						size: 120
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
						id: 'a.last_process_time',
						label: '上次执行日期',
						type: 'datetime',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.next_process_time',
						label: '下次执行日期',
						type: 'datetime',
						default_value: '',
						size: 120
					}
					,{
						id: 'a.job_group',
						label: '任务分组',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.job_status',
						label: '任务状态',
						type: 'string',
						default_value: '',
						size: 64
						,
						plugin: 'selectize',
						plugin_config: {
							valueField: 'value',
							labelField: 'label',
							searchField: 'label',
							sortField: 'value',
							create: true,
							maxItems: 1,
							onInitialize: function () {
								var that = this;
								$.getJSON('${ctx}/sys/dict/listDataStr?type=sys_job_status', function (data) {
									data.forEach(function (item) {
										that.addOption(item);
									});
								});
							}
						},
						valueSetter: function(rule, value) {
							rule.$el.find('.rule-value-container select')[0].selectize.setValue(value);
						}
					}
					,{
						id: 'a.cron_expression',
						label: 'cron表达式',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.bean_class',
						label: 'bean类',
						type: 'string',
						default_value: '',
						size: 100
					}
			]
	);
	function onGridOpMiClick(e){
        var row = grid.getSelected()
        if (row) {
        	if(e.item.menuNo=='start'){
        		 showMessageBox(null,"操作中，请稍后......","loading");
         		$.ajax({
	                url: "${ctx}"+e.item.href+"?id="+row.id,
	                success: function (text) {
	                    var o = mini.decode(text);
	                    if(objIsNotNull(o.type)){
	                        //alert(text);
	                        if(o.type=="E"){
	                            showMessageBox("错误",o.message,"error");
	                            return;
	                        }else if(o.type=="W"){
	                            showMessageBox("警告",o.message,"warning");
	                        }else if(o.type=="I"){
	                            showTipM("info","提示",o.message);
	                        }
	                        hideMessageBox();
	                    }

	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    var callback=function (action) {
	                        viewErrorDetail(jqXHR.responseText);
	                    }
	                    var buttonsTemp=["ok","详细"];
	                    showMessageBox("错误",o.message,"error",null,callback,buttonsTemp);
	                }
	            });
    		}
    	} else{
			showMessageBox("警告","请选择要操作的数据","warning");
    	}
	}
   loadWindow();
</script>
</body>
</html>