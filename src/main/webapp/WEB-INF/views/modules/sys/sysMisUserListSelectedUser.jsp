<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>用户管理</title>
<meta name="decorator" content="default" />
<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css"
	rel="stylesheet" />
	
<style type="text/css">
    .mini-panel-border{
    border-left:2px solid #ddd;   
    border-bottom:3px solid #ddd;   
   }
   
</style>

</head>
<body>

	<div class="mini-fit">
		<div class="mini-splitter" id="_splTreeMain"
			style="width: 100%; height: 100%;">
			<div size="240" showCollapseButton="true" style="overflow: auto;">
				<div id="_tabsTreeMain" class="mini-tabs" tabPosition="bottom"
					activeIndex="0" plain="false" style="width: 100%; height: 100%;">
					<div title="按组织" id="tabOrg" style="border: 0px;">
						<sys:treewithsearchbar
							dataUrl="${ctx}/sys/sysOrg/allDataNoControl?baseQuery=${orgQuery }" idField="id"
							valueField="id" textField="name" parentField="parentId" expandOnLoad="0"
							textFieldLabel="名称"></sys:treewithsearchbar>
					</div>
					
				</div>
			</div>
			<div showCollapseButton="true">
				<div class="mini-fit">
				           <table style="width:100%;height:5%">
					                  <tr>
					                      <td style="width:66%;text-align:left;">可选人员列表：</td>
					                       <td style="width:2%"></td>
					                       <td> 常选人员列表：</td>
					                  </tr>
					       </table>
							<div id="datagridMain" class="mini-datagrid"  style="width:66%; height:86%;display: inline-block;vertical-align: top;margin-right:2%"
									url="${ctx}/sys/user/allData"
									idField="id" allowResize="true" pageSize="20"
									allowCellSelect="true" multiSelect="true"
									editNextOnEnterKey="true" editNextRowCell="true"
									allowAlternating="true" showFilterRow="true"
									showColumnsMenu="true">
									<div property="columns">
										<div type="indexcolumn"></div>
										<div name="orgId" field="orgId" vtype="required"
											headerAlign="center" allowSort="true" width="100" hideable="true" visible="false">
											归属部门编号<input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="orgName" field="orgName" vtype="required"
											headerAlign="center" allowSort="true" width="200">
											归属部门 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="loginName" field="loginName" vtype="required"
											headerAlign="center" allowSort="true" width="100">
											登录名 <input property="editor" class="mini-textbox"
												style="width: 100%;" /> <input id="loginName-Filter"
												name="mini-column-filter" property="filter"
												class="mini-textbox" style="width: 100%;"
												onvaluechanged="onFilterChanged" />
										</div>
										<div name="name" field="name" vtype="required"
											headerAlign="center" allowSort="true" width="100">
											姓名 <input property="editor" class="mini-textbox"
												style="width: 100%;" /> <input id="name-Filter"
												name="mini-column-filter" property="filter"
												class="mini-textbox" style="width: 100%;"
												onvaluechanged="onFilterChanged" />
										</div>
										<div name="email" field="email" vtype="" headerAlign="center"
											allowSort="true" width="200">
											邮箱 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="phone" field="phone" vtype="" headerAlign="center"
											allowSort="true" width="100">
											电话 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
										<div name="mobile" field="mobile" vtype=""
											headerAlign="center" allowSort="true" width="100">
											手机 <input property="editor" class="mini-textbox"
												style="width: 100%;" />
										</div>
									</div>
								</div>
		      
					                <div id="datagridOften" class="mini-datagrid" style="width:30%;height:86%;display: inline-block;vertical-align: top; "
										idField="id" allowResize="false"
										pageSize="20" allowCellSelect="true" multiSelect="false"
										editNextOnEnterKey="true" editNextRowCell="true"
										allowAlternating="true" showFilterRow="false"
										showColumnsMenu="true" autoLoad="false" showPager="false" url="${ctx}/sys/sysSelectedUsers/selectedData">
										<div property="columns">
											<div name="selectedUserLoginName" field="selectedUserLoginName" vtype="required"
												headerAlign="center" allowSort="true" width="80">
												登录名 <input property="editor" class="mini-textbox"
													style="width: 100%;" /><input id="selectedUserLoginName-Filter"
													name="mini-column-filter" property="filter"
													class="mini-textbox" style="width: 100%;"
													onvaluechanged="onFilterChanged" /> 
											</div>
											<div name="selectedUserName" field="selectedUserName" vtype="required"
												headerAlign="center" allowSort="true" width="60">
												姓名 <input property="editor" class="mini-textbox"
													style="width: 100%;" /> <input id="selectedUserName-Filter"
													name="mini-column-filter" property="filter"
													class="mini-textbox" style="width: 100%;"
													onvaluechanged="onFilterChanged" />
											</div>
			
										</div>						
							</div>
				</div>
			</div>
		</div>
	</div>
			
					<sys:toolbarfooter></sys:toolbarfooter>
					<sys:excelframe></sys:excelframe>

					<script type="text/javascript">

					mini.parse();
					var dgMain = mini.get("datagridMain");							
					var dgOften = mini.get("datagridOften");
					dgOften.load();
					dgMain.load();
					
					initBase({
							id : "datagridMain",
							objId : "SysUser",
							treeFilter : "(o.id='[node.id]') or (o.parent_ids like '%,[node.id],%')",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
							treeSrcFields : "id",
							treeDestFields : "orgId",
							treeFilter2 : "(e.id='[node.id]')",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
							masterKeyField : "id",
							dataUrl : "${ctx}/sys/sysUser/misData?orgQuery=${orgQuery}",
							getUrl : "${ctx}/sys/sysUser/get",
							saveUrl : "${ctx}/sys/sysUser/save",
							removeUrl : "${ctx}/sys/sysUser/remove",
							exportUrl : "${ctx}/sys/sysUser/export"
						});

						initQb(
								"#builder",
								"pnlQuery",
								"tabsQuery",
								"txtSQL",
								"btnAdvSearch",
								[{
									id: 'a.name',
									label: '名称',
									type: 'string',
									default_value: '',
									size: 100
								}
										]);
						loadWindow();
						/////////////////////////////////////////////
					    function onLovOk() {
							//默认选中所有行
				            saveSelected();
							closeWindow("ok");
						}
						
						//保存已选人员
						function saveSelected() {
				            var mainitem = dgMain.getSelected();	
							var data=[];
							if (mainitem == null || mainitem == undefined || mainitem == '') { 
								var item = dgOften.getSelected();
								var temp={};
								//console.log("item:O",item);
								if(item != null && item != undefined && item != ''){
									temp.id=item.selectedUserId;
							        temp.loginName=item.selectedUserLoginName;
							        temp.name=item.selectedUserName;	
							        data=[temp];
								}								
							}else{
								 data=[mainitem];
							}
							for(var i=0,l=data.length;i<l;i++){
							    delete data[i]._id;				    
							}
													
				            var json = mini.encode(data);
				            //console.log("json",json);	
				            var type="${param.type}";
				           //console.log("sava",json);	            
							//将已选列表人员保存到常选人员列表
							$.ajax({
					            url:"${ctx}/sys/sysSelectedUsers/saveSelected",
					            data:{ data: json,
					                   type:type  },
					            async:true,
					            type: "post",
					            success: function (data) {
					            	var o = mini.decode(data);
					            	 //showTipM("info","提示",o.message);		            	
					            },
					            error: function (jqXHR, textStatus, errorThrown) {
					            	alert(jqXHR.responseText);
					            }
					        });			
							
						}	
									
						
					</script>
</body>
</html>