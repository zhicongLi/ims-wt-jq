<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>用户管理</title>
<meta name="decorator" content="default" />
<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css"
	rel="stylesheet" />
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
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
							dataUrl="${ctx}/ims-iam-ext/sys/sysOrg/allDataNoControl?baseQuery=${param.orgQuery }"
							idField="id" valueField="id" textField="name"
							parentField="parentId" expandOnLoad="0" textFieldLabel="名称"></sys:treewithsearchbar>
					</div>
				</div>
			</div>

			<div showCollapseButton="true">
				<!--  <div class="mini-fit">-->
                     <!--    可选人员列表： -->
					                <div id="datagridMain" class="mini-datagrid"
										style=" height:70%;display: inline-block;vertical-align: top;margin-right:2%" idField="id" allowResize="false"
										pageSize="10" allowCellSelect="true" multiSelect="true"
										editNextOnEnterKey="true" editNextRowCell="true"
										allowAlternating="true" showFilterRow="true"
										showColumnsMenu="true" onload="onGridLoad"
										onselectionchanged="onSelectionChanged">
										<div property="columns">
											<div type="checkcolumn" style="width:50px;"></div>
			                                <!-- 
			                                <div name="id" field="id" vtype="required"
												headerAlign="center" allowSort="true" width="200" sortField="o.name">
												id
											</div> -->
											<div name="orgName" field="orgName" vtype="required"
												headerAlign="center" allowSort="true" width="200" sortField="o.name">
												归属部门 <input property="editor" class="mini-textbox"
													style="width: 100%;" />
											</div>
			
											<div name="loginName" field="loginName" vtype="required"
												headerAlign="center" allowSort="true" width="100" sortField="a.login_name">
												登录名 <input property="editor" class="mini-textbox"
													style="width: 100%;" /> <input id="loginName-Filter"
													name="mini-column-filter" property="filter"
													class="mini-textbox" style="width: 100%;"
													onvaluechanged="onFilterChanged" />
											</div>
											<div name="name" field="name" vtype="required"
												headerAlign="center" allowSort="true" width="100" sortField="a.name">
												姓名 <input property="editor" class="mini-textbox"
													style="width: 100%;" /> <input id="name-Filter"
													name="mini-column-filter" property="filter"
													class="mini-textbox" style="width: 100%;"
													onvaluechanged="onFilterChanged" />
											</div>
			
			
										</div>
									</div>	          
					         
					
					   <div style="width: 150px; height:5%; margin: 0 auto;vertical-align:center;">
							<a class="mini-button"
									onclick="add()">选择</a>
							<a class="mini-button" style="float:right;"
									onclick="removes()"">移出</a>
	
						</div>

						<!-- 已选人员列表： -->
						<div id="datagridSelected" class="mini-datagrid"
							style="width:100%; height:22%;" idField="id" allowResize="true"
							pageSize="20" allowCellSelect="true" multiSelect="true"
							editNextOnEnterKey="true" editNextRowCell="true"
							allowAlternating="true" showFilterRow="false"
							showColumnsMenu="true" autoLoad="false" showPager="false">
							<div property="columns">
								<div type="indexcolumn">序号</div>
								<div type="checkcolumn" hideable="true" visible="false"></div>
								<div name="action" width="80" headerAlign="center"
									align="center" renderer="onActionRenderer"
									cellStyle="padding:0;">操作</div>
								 
								<div name="id" field="id"  visible="false"
												headerAlign="center" allowSort="true" width="200">
												id
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

							</div>
						</div>

					<!-- </div> -->
				</div>
			</div>
		</div>
		<sys:toolbarfooter></sys:toolbarfooter>
		<sys:excelframe></sys:excelframe>

		<script type="text/javascript">
			mini.parse();
			var dgMain = mini.get("datagridMain");
			var dgSelected = mini.get("datagridSelected");			
			//var dgOften = mini.get("datagridOften");
			//dgOften.load();
        
			//存储勾选项
			var selectMaps = {};		
			initBase({
				id : "datagridMain",
				objId : "SysUser",
				treeFilter : "(o.id='[node.id]') or (o.parent_ids like '%,[node.id],%')",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
				treeSrcFields : "id",
				treeDestFields : "orgId",
				treeFilter2 : "(e.id='[node.id]')",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
				masterKeyField : "id",
				onAfterLoadRecord : onAfterLoadRecord,
				dataUrl : "${ctx}/ims-iam-ext/sys/sysUser/data",
				getUrl : "${ctx}/ims-iam-ext/sys/sysUser/get",
				saveUrl : "${ctx}/ims-iam-ext/sys/sysUser/save",
				removeUrl : "${ctx}/ims-iam-ext/sys/sysUser/remove",
				exportUrl : "${ctx}/ims-iam-ext/sys/sysUser/export"
			});
						
			dgMain.on("rowdblclick", function(e) {
				add();
			});
			
			// 监听分页前事件，阻止后自行设置当前数据和分页信息
			dgSelected.on("beforeload", function(e) {
				e.cancel = true;
				//var pageIndex = e.data.pageIndex, pageSize = e.data.pageSize;
				//var rows = dgMain.getSelecteds();		          
				//dgSelected.setData(rows);
				var selectedData=GetAllSelecteds();
				doAddItems(selectedData, dgSelected);				
			});

			dgSelected.set({
				onrowdblclick : dsrowdblclick
			});
			
			/* dgOften.on("rowdblclick", function(e) {				
				add();
			}); */

			loadWindow();

			function onGridLoad(e) {
				var rows = selectMaps[dgMain.getPageIndex()];
				if (rows){
					dgMain.selects(rows);
				}
			}
			function onSelectionChanged(e) {
				var rows = dgMain.getSelecteds();
				selectMaps[dgMain.getPageIndex()] = rows;
			}

			function GetAllSelecteds() {
			    var data = [];
			    for(var pageIndex in selectMaps){
			        var rows = selectMaps[pageIndex];
			        data.addRange(rows);
			    }
			    //常选列表
			  /*   var items = dgOften.getSelecteds();
			    //console.log("items",items);
			    for(var i=0;i<items.length;i++){
			        var item= items[i];
			        var row={};
			        row.id=item.selectedUserId;
			        row.loginName=item.selectedUserLoginName;
			        row.name=item.selectedUserName;
			        data.push(row);
			    }		*/	    
			    return data; 
			}
							
			//跨页添加
			function add() {
				var selectedData=GetAllSelecteds();
				doAddItems(selectedData, dgSelected);
				dgSelected.selectAll();
				// 第一次设置
				//fillData(0, dgSelected.getPageSize(), selectedData, dgSelected);
			}
			//添加单页
			/*
			function adds() {
				var items = dgMain.getSelecteds();
				//先清除，再添加，避免数据重复
				dgSelected.clearRows();
				doAddItems(items, dgSelected);
			}
            */
			function doAddItems(items, grid) {
				//console.log("items", items);
				items = mini.clone(items);
				//console.log("items  ----clone", items);
				//根据id判断，去除重复的item
				for (var i = items.length - 1; i >= 0; i--) {
					var item = items[i];
					var item2 = grid.findRow(function(row) {
						if (row.id == item.id)
							return true;
					});
					if (item2) {
						items.removeAt(i);
					}
				}
				grid.addRows(items);
			}

			function removes() {
				var items = dgSelected.getSelecteds();
				dgSelected.removeRows(items);
				dgMain.deselects(items);
			}

			

			// 分页填充细节处理
			/*
			function fillData(pageIndex, pageSize, dataResult, grid) {
				var data = dataResult, totalCount = dataResult.length;
				//alert("data"+data+",totalCount:"+totalCount);
				var arr = [];
				var start = pageIndex * pageSize, end = start + pageSize;
				for (var i = start, l = end; i < l; i++) {
					var record = data[i];
					if (!record)
						continue;
					arr.push(record);
				}
				grid.setTotalCount(totalCount);
				grid.setPageIndex(pageIndex);
				grid.setPageSize(pageSize);
				grid.setData(arr);
				//默认选中所有行
				//grid.selectAll();
				//grid.hideColumn("checkcolumn");
			}
			*/
			
			//已选列表双击删除行
			function dsrowdblclick(e) {
				var gridTemp = e.sender;
				var record = e.record;
				var uid = record._uid;
				var rowIndex = e.rowIndex;				
				delRow(uid);
			}

			function delRow(row_uid) {
				var row = dgSelected.getRowByUID(row_uid);
				if (row) {
					dgSelected.removeRow(row, true);
					//取消选中单行
					dgMain.deselect(row);
				}
			}
			function onActionRenderer(e) {
				var grid = e.sender;
				var record = e.record;
				var uid = record._uid;
				var rowIndex = e.rowIndex;
				var s = ' <a class="Delete_Button" href="javascript:delRow('
						+ uid + ')">删  除</a>';
				return s;
			}

			function onLovOk() {
				//默认选中所有行
              //  saveSelected();
				closeWindow("ok");
			}
			
			//保存已选人员
			function saveSelected() {
				//默认选中所有行
				dgSelected.selectAll();				
				var data = dgSelected.getChanges();
				
				for(var i=0,l=data.length;i<l;i++){
				    delete data[i]._id;				    
				}
	            var json = mini.encode(data);
	            var type="${param.type}";
	           //console.log("sava",json);	            
				//将已选列表人员保存到常选人员列表
				$.ajax({
		            url:"${ctx}/ims-iam-ext/sys/sysSelectedUsers/saveSelected",
		            data:{ data: json,type:type  },
		            async:false,
		            type: "post",
		            success: function (data) {
		            	var o = mini.decode(data);
		            	 //showTipM("info","提示",o.message);		            	
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		            	console.log("jqXHR:",jqXHR);
		            	console.log("textStatus:",textStatus);
		            	console.log("errorThrown:",errorThrown);
		            	alert(jqXHR.responseText);
		            }
		        });			
				
			}
		</script>
</body>
</html>