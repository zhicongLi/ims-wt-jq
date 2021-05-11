<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>组织结构</title>
	
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<style type="text/css">
		body{
			display: block;
		}
	</style>
</head>
<body>

<div class="mini-fit">
	<div class="mini-splitter" id="_splTreeMain" style="width:100%;height:100%;">
		<div size="240" showCollapseButton="true" style="overflow:auto;">
			<sys:treewithsearchbar dataUrl="${ctx}/ims-iam-ext/sys/sysOrg/allData" idField="id" valueField="id" textField="name" parentField="parentId" expandOnLoad="0" textFieldLabel="名称"></sys:treewithsearchbar>
		</div>

		<div showCollapseButton="true">
			<div class="mini-fit">
				<div id="tabsMain" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;">
					<div title="列表" id="tabList"  style="border: 0px;"  >
						<sys:toolbargridmain objId="SysOrg" permissionEdit="sys:sysOrg:edit"></sys:toolbargridmain>
						<sys:searchadv></sys:searchadv>
						<div class="mini-fit">
							<div id="datagridMain" class="mini-treegrid" style="width:100%;"
								 url="${ctx}/ims-iam-ext/sys/sysOrg/allData" idField="id"
								 parentField="parentId" resultAsTree="false" showTreeIcon="true" treeColumn="name"
								 expandOnLoad="0" treeColumn="name" allowDrag="true" allowDrop="true" allowLeafDropIn="true"
								 allowResize="true" pageSize="10" autoLoad="false"
								 allowCellSelect="true" multiSelect="false"
								 editNextOnEnterKey="true"  editNextRowCell="true"
								 allowAlternating="true" showFilterRow="true" virtualScroll="true"
							>
								<div property="columns">
									<div name="action" width="80"  headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
									<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" >编号
										<input property="editor" class="mini-textbox" style="width:100%;"  />
										<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
											   onvaluechanged="onFilterChanged"
										/>
									</div>
									<div name="name"  field="name" vtype="required"  headerAlign="center" allowSort="true" width="200" >名称
										<input property="editor" class="mini-textbox" style="width:100%;"  />
										<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
											   onvaluechanged="onFilterChanged"
										/>
									</div>
									<div name="shortName"  field="shortName" vtype=""  headerAlign="center" allowSort="true" width="100" >简称
										<input property="editor" class="mini-textbox" style="width:100%;"  />
										<input id="shortName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
											   onvaluechanged="onFilterChanged"
										/>
									</div>
									<div name="sort"  field="sort" vtype=""  headerAlign="center" allowSort="true" width="120" >排序
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div name="code"  field="code" vtype=""  headerAlign="center" allowSort="true" width="100" >区域编码
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div name="orgCode" field="orgCode" vtype=""   headerAlign="center" allowSort="true" width="100" >机构编码
										<input property="editor" class="mini-textbox" style="width:100%;"  />
										<input id="orgCode-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
											   onvaluechanged="onFilterChanged"
										/>
									</div>
									<div name="status" field="status" vtype=""   headerAlign="center" allowSort="true" width="100" >状态
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div type="comboboxcolumn" autoShowPopup="true" name="type"  field="type" vtype="required" headerAlign="center" allowSort="true" width="120" >机构类型
										<input property="editor" class="mini-combobox"  textField="label" valueField="value"  style="width:100%;"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_type" />
									</div>
									<div type="comboboxcolumn" autoShowPopup="true" name="grade"  field="grade" vtype="required" headerAlign="center" allowSort="true" width="120" >机构等级
										<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value"   url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_grade" />
									</div>
									<div name="nativeNo"  field="nativeNo" vtype=""  headerAlign="center" allowSort="true" width="100" >特征码
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div name="address"  field="address" vtype=""  headerAlign="center" allowSort="true" width="255" >联系地址
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div name="zipCode"  field="zipCode" vtype=""  headerAlign="center" allowSort="true" width="100" >邮政编码
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div name="master"  field="master" vtype=""  headerAlign="center" allowSort="true" width="100" >联系人
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div name="phone"  field="phone" vtype=""  headerAlign="center" allowSort="true" width="200" >电话
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div name="fax"  field="fax" vtype=""  headerAlign="center" allowSort="true" width="200" >传真
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div name="email"  field="email" vtype=""  headerAlign="center" allowSort="true" width="200" >邮箱
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div type="checkboxcolumn"  name="useable"  field="useable" vtype="" headerAlign="center" allowSort="true" width="64" >是否启用

									</div>
									<div name="primaryPerson"  field="primaryPerson" vtype=""  headerAlign="center" allowSort="true" width="64" >负责人
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div name="addr"  field="addr" vtype=""  headerAlign="center" allowSort="true" width="200" >详细地址
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div name="lng"  field="lng" vtype=""  headerAlign="center" allowSort="true" width="120" >经度
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div name="lat"  field="lat" vtype=""  headerAlign="center" allowSort="true" width="120" >纬度
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<%--<div name="siteId"  field="siteId" vtype=""  headerAlign="center" allowSort="true" width="64" >站点ID--%>
									<%--<input property="editor" class="mini-textbox" style="width:100%;"  />--%>
									<%--</div>--%>
									<div name="deputyPerson"  field="deputyPerson" vtype=""  headerAlign="center" allowSort="true" width="64" >副负责人
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div name="unitCount"  field="unitCount" vtype=""  headerAlign="center" allowSort="true" width="64" >机组台数
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div name="totalCapacity"  field="totalCapacity" vtype=""  headerAlign="center" allowSort="true" width="70" >总装机容量(万千瓦)
										<input property="editor" class="mini-textbox" style="width:100%;"  />
									</div>
									<div name="plantTypeName"  field="plantTypeName" vtype=""  headerAlign="center" allowSort="true" width="64" >发电类型
										<input property="editor"  class="mini-textbox"  style="width:100%;"/>
									</div>
									<div type="checkboxcolumn" name="isMarket"  field="isMarket" vtype=""  headerAlign="center" allowSort="true" width="80" >是否市场竞争
										
									</div>
									<div type="checkboxcolumn" name="isBm"  field="isBm" vtype=""  headerAlign="center" allowSort="true" width="64" >是否对标
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<div title="明细" id="tabForm"  style="border: 0px;"  >
						<sys:toolbarformmain  permissionEdit="sys:sysOrg:edit"></sys:toolbarformmain>
						
		<div id="editform" class="form"  style="width: 100%;">
			<div class="container"  style="width: 100%;"  >
				<div class="mini-clearfix ">
					<div class="mini-col-12">
						<div class="mini-panel" title="基本信息" width="auto" height="auto"
							 showCollapseButton="true" onbuttonclick="onPanelButtonClick" name="_panel_exp">
						
						
										<input class="mini-hidden" name="id" id="id"/>
										<table border="0" cellpadding="3" cellspacing="3" >
											<tr>
												<td style="text-align:right;">父组织：</td>
												<td colspan="3">
													<input name="parentId" id="parentId" class="mini-treeselect" vtype = ""  required="false"  url="${ctx}/ims-iam-ext/sys/sysOrg/allData" valueField="id" textField="name" parentField="parentId" expandOnLoad="0" width="400" />
												</td>
												<td style="text-align:right;">简称：</td>
												<td>
													<input name="shortName" id="shortName" class="mini-textbox" vtype = ""  required="false" />
												</td>
											</tr>
											<tr>

												<td style="text-align:right;">名称：</td>
												<td colspan="3">
													<input name="name" id="name"  class="mini-textbox" vtype = "" required="true" width="400" />
												</td>

												<td style="text-align:right;">星级：</td>
												<td>
													<input name="star" id="star" class="mini-combobox" vtype = ""  required="false" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_star" />
												</td>


											</tr>
											<tr>
												<td style="text-align:right;">机构分类1：</td>
												<td>
													<input name="classId" id="classId" class="mini-combobox" vtype = ""  required="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_class" />
												</td>
												<td style="text-align:right;">机构分类2：</td>
												<td>
													<input name="classId2" id="classId2" class="mini-combobox" vtype = ""  required="false" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_class2" />
												</td>
												<td style="text-align:right;">机构类型：</td>
												<td>
													<input name="type" id="type"  class="mini-combobox" vtype = "" required="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_type" />
												</td>


											</tr>
											<tr>

												<td style="text-align:right;">排序：</td>
												<td>
													<input name="sort" id="sort" class="mini-textbox" vtype = ""  required="true" />
												</td>

												<td style="text-align:right;">机构编码：</td>
												<td>
													<input name="orgCode" id="orgCode" class="mini-textbox" vtype = ""  required="false" />
												</td>
												<td style="text-align:right;">状态：</td>
												<td>
													<input name="status" id="status"  class="mini-textbox" vtype = "" required="false" />
												</td>

											</tr>
											<tr>
												<td style="text-align:right;">机构等级：</td>
												<td>
													<input name="grade" id="grade" class="mini-combobox" vtype = ""  required="true" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_grade" />
												</td>
												<td style="text-align:right;">企业类型：</td>
												<td colspan="3">
													<div id="businessType" name="businessType" class="mini-checkboxlist" repeatItems="3" repeatLayout="table"
														 textField="label" valueField="value"
														 url="${ctx}/ims-ext/sys/dict/listDataStr?type=org_type" >
													</div>

												</td>



											</tr>
											<tr>
												<td style="text-align:right;">联系人：</td>
												<td>
													<input name="master" id="master"  class="mini-textbox" vtype = "" required="false" />
												</td>
												<td style="text-align:right;">电话：</td>
												<td>
													<input name="phone" id="phone" class="mini-textbox" vtype = ""  required="false" />
												</td>
												<td style="text-align:right;">传真：</td>
												<td>
													<input name="fax" id="fax"  class="mini-textbox" vtype = "" required="false" />
												</td>

											</tr>
											<tr>
												<td style="text-align:right;">邮箱：</td>
												<td>
													<input name="email" id="email" class="mini-textbox" vtype = ""  required="false" />
												</td>
												<td style="text-align:right;">是否启用：</td>
												<td>
													<input name="useable" id="useable"  class="mini-checkbox" vtype = "" required="false"/>
												</td>


												<td style="text-align:right;">负责人：</td>
												<td>
													<input name="primaryPerson" id="primaryPerson" class="mini-textbox" vtype = ""  required="false" />
												</td>


											</tr>
											<tr>
												<td style="text-align:right;">详细地址：</td>
												<td>
													<input name="addr" id="addr"  class="mini-textbox" vtype = "" required="false" />
												</td>
												<td style="text-align:right;">经度：</td>
												<td>
													<input name="lng" id="lng" class="mini-textbox" vtype = ""  required="false" />
												</td>
												<td style="text-align:right;">纬度：</td>
												<td>
													<input name="lat" id="lat"  class="mini-textbox" vtype = "" required="false" />
												</td>

											</tr>
											<%--<tr>--%>
											<%--<td style="text-align:right;">站点ID：</td>--%>
											<%--<td>--%>
											<%--<input name="siteId" id="siteId" class="mini-textbox" vtype = ""  required="false" />--%>
											<%--</td>--%>
											<%--<td style="text-align:right;">副负责人：</td>--%>
											<%--<td>--%>
											<%--<input name="deputyPerson" id="deputyPerson"  class="mini-textbox" vtype = "" required="false" />--%>
											<%--</td>--%>

											<%--</tr>--%>

											<tr>
												<td style="text-align:right;">联系地址：</td>
												<td>
													<input name="address" id="address"  class="mini-textbox" vtype = "" required="false" />
												</td>

												<td style="text-align:right;">邮政编码：</td>
												<td>
													<input name="zipCode" id="zipCode" class="mini-textbox" vtype = ""  required="false" />
												</td>
												<td style="text-align:right;">归属区域：</td>
												<td>
													<input name="area.id" id="area.id" class="mini-buttonedit"  textName="area.name" required="true"   onbuttonclick="popLov(this,'选择区域',true,true,'${ctx}/ims-system/sys/sysArea/list',850,500,'id,name','area.id,area.name')" />
												</td>
											</tr>
											<tr>
												<td style="text-align:right;">区域编码：</td>
												<td>
													<input name="code" id="code" class="mini-textbox" vtype = ""  required="false" />
												</td>
												<td style="text-align:right;">备注信息：</td>
												<td>
													<input name="remarks" id="remarks" class="mini-textarea" vtype = ""  required="false"  />
												</td>
												<td style="text-align:right;">地图名称：</td>
												<td>
													<input name="mapName" id="mapName" class="mini-textbox" vtype = ""  required="false" />
												</td>

											</tr>
											<tr>
												<td style="text-align:right;">是否市场竞争：</td>
												<td>
													<input name="isMarket" id="isMarket" class="mini-checkbox" vtype = ""  required="false"  trueValue="1" falseValue="0"/>
												</td>
												<td style="text-align:right;">是否对标：</td>
												<td>
													<input name="isBm" id="isBm"  class="mini-checkbox" vtype = "" required="false" trueValue="1" falseValue="0"/>
												</td>
												<td style="text-align:right;">特征码：</td>
												<td>
													<input name="nativeNo" id="nativeNo" class="mini-textbox" vtype = ""  required="false" />
												</td>

											</tr>
											<tr>
											</tr>
										</table>
								</div>
					</div>
					<%--<div class="mini-col-6">--%>
						<%--<div class="mini-panel" title="基本信息" width="auto" height="auto"--%>
							 <%--showCollapseButton="true" onbuttonclick="onPanelButtonClick" id="panel2"--%>

						<%-->--%>
							<%--<input name="conNo" width="250px"--%>
								   <%--id="conNo" class="mini-textbox" required = "true" required="true"   onvaluechanged = "onCheckGridDuplicate"/>--%>

						<%--</div>--%>
					<%--</div>--%>
				</div>
			</div>
		</div>
							<div class="mini-fit">
								<div id="tabsSub" class="mini-tabs" activeIndex="0" plain="false" style="width:100%;height:100%;">
									<div title="电厂信息" id="tabPgPlantInfo"  style="border: 0px;"  >
										<div id="formPgPlantInfo" class="form" style="width:100%;height:100%;">
											<input name="id"  hideable="true" visible="false" class="mini-textbox" vtype = ""  required="false" />

											<table border="0" cellpadding="3" cellspacing="3" >
												<tr>
													<td style="text-align:left;">投产日期：</td>
													<td>
														<input name="buildDate" id="buildDate" class="mini-datepicker" vtype = ""  required="false" />
													</td>
												</tr>
												<tr>
													<td style="text-align:left;">总装机容量(万千瓦)：</td>
													<td>
														<input name="totalCapacity" id="totalCapacity" class="mini-spinner" vtype = ""  required="false" allowLimitValue="false"/>
													</td>
												</tr>
												<tr>
													<td style="text-align:left;">机组数：</td>
													<td>
														<input name="unitCount" id="unitCount"   class="mini-spinner"  value="0" vtype = ""  required="false" />
													</td>
												</tr>
												<tr>
													<td style="text-align:left;">发电类型：</td>
													<td>
														<input name="plantType" id="plantType" textName="plantTypeName" class="mini-buttonedit" vtype = ""  required="false"  onbuttonclick="onPlantTypeFormLov(this)" />
													</td>
												</tr>
												<tr>
													<td style="text-align:left;">入市日期：</td>
													<td>
														<input name="enterDate" id="enterDate" class="mini-datepicker" vtype = ""  required="false" />
													</td>
												</tr>
												<tr>
													<td style="text-align:left;">退市日期：</td>
													<td>
														<input name="exitDate" id="exitDate" class="mini-datepicker" vtype = ""  required="false" />
													</td>
												</tr>
												<tr>
													<td style="text-align:left;">法人代表：</td>
													<td>
														<input name="represent"  class="mini-textbox" vtype = ""  required="false" />
													</td>
												</tr>
												<tr>
													<td style="text-align:left;">备注：</td>
													<td>
														<input name="note"  class="mini-textarea" vtype = ""  required="false" />
													</td>
												</tr>

											</table>
										</div>
									</div>
									<div title="机组" id="tabPgUnitList"  style="border: 0px;"  >
										<sys:toolbargridsub girdId="gridPgUnit"  permissionEdit="pg:pgUnit:edit"></sys:toolbargridsub>
										<div id="gridPgUnit" class="mini-datagrid" style="width:100%;height:100%;"
											 url="${ctx}/ims-iam-ext/pg/pgUnit/data" idField="id"
											 allowResize="true" pageSize="10"
											 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
											 editNextOnEnterKey="true"  editNextRowCell="true"
											 allowAlternating="true" showFilterRow="false"  showColumnsMenu="true"
										>
											<div property="columns">
												<div type="indexcolumn"></div>
												<div type="checkcolumn"></div>

												<div name="unitCode" field="unitCode" vtype=""   headerAlign="center" allowSort="true" width="64" >机组编号
													<input property="editor" class="mini-textbox" style="width:100%;"  />
												</div>
												<div name="plantId" field="plantId" vtype="" hideable="true" visible="false"   headerAlign="center" allowSort="true" width="64" >电厂编号
													<input property="editor" class="mini-textbox" style="width:100%;"  />
												</div>
												<div name="unitCapacity" field="unitCapacity" vtype=""   headerAlign="center" allowSort="true" width="64" >单机容量(万千瓦)
													<input property="editor" class="mini-textbox" style="width:100%;"  />
												</div>

												<div name="unitType"  field="unitType"  vtype="" displayField="unitTypeName"   headerAlign="center" allowSort="true" width="64" >机组类型
													<input property="editor" class="mini-combobox" valueField="value"  textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=pg_unit_type"  style="width:100%;" />
												</div>
												<div name="plantType"  field="plantType"  vtype="" displayField="plantTypeName"   headerAlign="center" allowSort="true" width="64" >发电类型
													<input property="editor" class="mini-buttonedit" onbuttonclick="onPlantTypeLov(this)"  style="width:100%;" />
												</div>
												<div type="comboboxcolumn" autoShowPopup="true" name="unitLevel"  field="unitLevel" vtype=""  headerAlign="center" allowSort="true" width="64" >机组等级
													<input property="editor" class="mini-combobox" style="width:100%;" valueField="value"  textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=power_level" />
												</div>



												<div name="unitGroup" field="unitGroup" vtype=""  headerAlign="center" allowSort="true" width="64"  >机组单元
													<input property="editor" class="mini-buttonedit"  	style="width: 100%;" onbuttonclick="onUnitgroupLov(this)"  />
													<%-- 														 <input property="editor"  allowInput = 'false'  class="mini-buttonedit" onbuttonclick="popLov(this,'选择电厂',false,true,'${ctx}/ims-system/pg/pgUnitGroup/list',850,500,'id,name','unitGroup,unitGroupName','datagridMain')" style="width:100%;"  />
                                                     --%>
												</div>
												<div name="unitGroupName" field="unitGroupName" vtype=""   headerAlign="center" allowSort="true" width="120" readOnly="true">机组单元名称
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
												</div>
												<div name="period" field="period" vtype=""   headerAlign="center" allowSort="true" width="64" >期别
													<input property="editor" class="mini-textbox" style="width:100%;"  />
												</div>
												<div name="buildDate" field="buildDate" dateFormat="yyyy-MM-dd" vtype=""   headerAlign="center" allowSort="true" width="64" >投产时间
													<input property="editor" class="mini-datepicker" style="width:100%;"  />
												</div>

												<div name="stockPs" field="stockPs" vtype=""   headerAlign="center" allowSort="true" width="64" >股权电厂
													<input property="editor" class="mini-textbox" style="width:100%;"  />
												</div>
												<div name="interNo" field="interNo" vtype=""   headerAlign="center" allowSort="true" width="64" >统一编码
													<input property="editor" class="mini-textbox" style="width:100%;"  />
												</div>
												<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注信息
													<input property="editor" class="mini-textarea" style="width:100%;"  />
												</div>
												<div name="priceAppr" field="priceAppr" vtype=""   headerAlign="center" allowSort="true" width="64" >批复电价
													<input property="editor" class="mini-spinner" style="width:100%;"  />
												</div>
											</div>
										</div>
									</div>
									<div title="机组单元" id="tabPgUnitGroupList"  style="border: 0px;"  >
										<sys:toolbargridsub girdId="gridPgUnitGroup" permissionEdit="pg:pgUnitGroup:edit"></sys:toolbargridsub>
										<div id="gridPgUnitGroup" class="mini-datagrid" style="width:100%;height:100%;"
											 url="${ctx}/ims-system/pg/pgUnitGroup/data" idField="id"
											 allowResize="true" pageSize="10"
											 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
											 editNextOnEnterKey="true"  editNextRowCell="true"
											 allowAlternating="true" showFilterRow="false"  showColumnsMenu="true"
										>
											<div property="columns">
												<div type="indexcolumn"></div>
												<div type="checkcolumn"></div>
												<div name="id" field="id" readOnly="true"  headerAlign="center" allowSort="true" width="64" >编号
													<input property="editor" class="mini-textbox" style="width:100%;"  />
												</div>
												<div name="plantId" field="plantId" vtype="" hideable="true" visible="false"   headerAlign="center" allowSort="true" width="64" >电厂编号
													<input property="editor" class="mini-textbox" style="width:100%;"  />
												</div>
												<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="100" >单元名称
													<input property="editor" class="mini-textbox" style="width:100%;"  />
													<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
														   onvaluechanged="onFilterChanged"
													/>
												</div>

												<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >备注信息
													<input property="editor" class="mini-textarea" style="width:100%;"  />
												</div>

											</div>
										</div>
									</div>
									<div title="二级公司信息" id="tabPgCompany2Info"  style="border: 0px;"  >
										<div id="formPgCompany2Info" class="form" style="width:100%;height:100%;">
											<input name="id"  hideable="true" visible="false" class="mini-textbox" vtype = ""  required="false" />
											<table border="0" cellpadding="3" cellspacing="3" >
												<tr>
													<td style="text-align:left;">名称：</td>
													<td>
														<input name="name"  class="mini-textbox" vtype = ""  required="false" />
													</td>
													<td style="width:150px;text-align:right;">电网公司：</td>
													<td style="width:64px;">
														<input name="gridId" id="gridId" class="mini-buttonedit"  allowInput = "false"  required="false" textName="custName"  onbuttonclick="popLov(this,'选择电网公司',false,true,'${ctx}/ims-system/sd/sdCust/list',800,500,'id,name','gridId,custName','#formPgCompany2Info')" />
													</td>
												</tr>

											</table>
										</div>
									</div>
									<div title="公司信息" id="tabSysCompanyInfo"  style="border: 0px;"  >
										<div id="formSysCompanyInfo" class="form" style="width:100%;height:100%;">
											<input name="id"  hideable="true" visible="false" class="mini-textbox" vtype = ""  required="false" />
											<table border="0" cellpadding="3" cellspacing="3" >
												<tr>
													<td style="text-align:left;">名称：</td>
													<td>
														<input name="name"  class="mini-textbox" vtype = ""  required="false" />
													</td>
													<td style="text-align:left;">语言：</td>
													<td>
														<input name="langId"  class="mini-textbox" vtype = ""  required="false" />
													</td>
													<td style="text-align:left;">国家：</td>
													<td>
														<input name="couId"  class="mini-textbox" vtype = ""  required="false" />
													</td>
												</tr>

											</table>
										</div>
									</div>
								   <div title="分配角色" id="tabSysOrgRoleList"  style="border: 0px;"  >
										<div style="width:100%;">
											<div class="mini-toolbar" id="_tbgridSysOrgRole"  style="border-bottom:0;padding:0px;">
												<table style="width:100%;">
													<tr>
														<td style="width:100%;">
															<a class="mini-button" id="_tbgridSysOrgRole_add" iconCls="icon-plus-sign"  onclick="sysOrgRoleAdd" plain="true" tooltip="分配角色...">分配角色</a>
															<a class="mini-button" id="_tbgridSysOrgRole_remove" iconCls="icon-remove" style="color:red;" onclick="removeRow('gridSysOrgRole')" plain="true">删除行</a>
															<span class="separator"></span>
															<a class="mini-button" id="_tbgridSysOrgRole_refresh" iconCls="icon-refresh" onclick="refreshGridData('gridSysOrgRole')" plain="true">刷新</a>
															<a class="mini-menubutton" id="_tbgridSysOrgRole_op" iconCls="icon-cogs"  plain="true" menu="#_pmgridSysOrgRole">操作</a>
														</td>
														<td style="white-space:nowrap;">
														</td>
													</tr>
												</table>
												<ul id="_pmgridSysOrgRole" class="mini-menu" style="display:none;"  textField="name" idField="id" parentField="parentId"   onitemclick="onGridSubOpMiClick_gridSysUserRole">							
												</ul>
											</div>
										</div>
										<div class="mini-fit">
										<div id="gridSysOrgRole" class="mini-datagrid" style="width:100%;height:100%;"
											  url="${ctx}/ims-system/sys/sysRole/data" idField="id"
											  allowResize="true" pageSize="10"
											  allowCellSelect="true" allowCellEdit="true"
											  editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
											  allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
										>
											<div property="columns">
												<div type="checkcolumn"></div>	
	  							                <div name="name"  field="name"   vtype="" headerAlign="center" allowSort="true"  width="200" sortField="a.name" >角色名称
													
												</div>											
												<div name="enname"  field="enname"   vtype="" headerAlign="center" allowSort="true"  width="200" >英文名称
													
												</div>
												<div type="comboboxcolumn" autoShowPopup="true" name="dataScope"  field="dataScope" vtype="" headerAlign="center" allowSort="true" width="120" >数据范围
													<input property="editor" class="mini-combobox" readonly="readonly" style="width:100%;" textField="label" valueField="value"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=sys_data_scope" />
												</div>
											</div>
										</div>
									 </div>
								  </div>									

									<%-- <div title="开户信息" id="tabEbBankList"  style="border: 0px;"  >
										<div id="editform3" class="form" style="width:100%;height:100%;">
											<input name="id"  hideable="true" visible="false" class="mini-textbox" vtype = ""  required="false" />
											<input name="objId"  hideable="true" visible="false" class="mini-textbox" vtype = ""  required="false" />
											<input name="objKey"  hideable="true" visible="false" class="mini-textbox" vtype = ""  required="false" />
				
											<table border="0" cellpadding="3" cellspacing="3" >
											
												<tr>
													<td style="text-align:left;">名称：</td>
													<td>
														<input name="name" id="name" class="mini-textbox" vtype = "" required="false" width="300"/>
													</td>
												</tr>
												<tr>
													<td style="text-align:left;">纳税人类型：</td>
													<td>
														<input name="companyType" id="companyType" class="mini-combobox" vtype = ""  required="false" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=eb_bank_company_type" />
													</td>
												</tr>
												<tr>
													<td style="text-align:left;">开户银行：</td>
													<td>
														<input name="bank" id="bank" class="mini-textbox" vtype = ""  required="false" width="300"/>
													</td>
												</tr>
												<tr>
													<td style="text-align:left;">开户账号：</td>
													<td>
														<input name="accountNo" id="accountNo" class="mini-textbox" vtype = ""  required="false" width="300"/>
													</td>
												</tr>
												<tr>
													<td style="text-align:left;">开户许可证：</td>
													<td>
														<input name="bankCert" id="bankCert" class="mini-textbox" vtype = "" required="false" width="300"/>
													</td>
												</tr>
												<tr>
													<td style="text-align:left;">开户银行地址：</td>
													<td>
														<input name="addr" id="addr" class="mini-textarea" vtype = ""  required="false" width="400"/>
													</td>
												</tr>
				
												<tr>
													<td style="text-align:left;">是否银行代扣：</td>
													<td>
														<input name="isDefault" id="isDefault" class="mini-checkbox" vtype = ""  required="false" trueValue="1" falseValue="0"  />
													</td>
												</tr>
											</table>
										</div>
									</div>
									
									<div title="客户地址" id="tabSdCustAddrList"  style="border: 0px;"  >
										<sys:toolbargridsub girdId="gridEbAddr" permissionEdit="eb:ebAddr:edit"></sys:toolbargridsub>
										<div class="mini-fit">
											<div id="gridEbAddr" class="mini-datagrid" style="width:100%;height:100%;"
												 url="${ctx}/ims-system/eb/ebAddr/data" idField="id"
												 allowResize="true" pageSize="10"
												 allowCellSelect="true" allowCellEdit="true"
												 editNextOnEnterKey="true"  editNextRowCell="true" showFilterRow="false"
												 allowAlternating="true"    showColumnsMenu="true" multiSelect="true"
											>
												<div property="columns">
													<div type="checkcolumn"></div>
													<div name="objId" hideable="true" visible="false"  field="objId" headerAlign="center" allowSort="true" width="150" >
														<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
													</div>
													<div name="objKey" hideable="true" visible="false"  field="objId" headerAlign="center" allowSort="true" width="150" >
														<input property="editor" class="mini-textbox" style="width:100%;" minWidth="200" />
													</div>
													<div name="name"  field="name"   vtype="required" headerAlign="center" allowSort="true"  width="100" >名称
														<input property="editor" class="mini-textbox" style="width:100%;"  />
													</div>
													<div name="addrType"  field="addrType"   vtype="" headerAlign="center" allowSort="true"  width="64" >地址类型
														<input property="editor" class="mini-textbox" style="width:100%;"  />
													</div>
													<div name="addr"  field="addr"   vtype="" headerAlign="center" allowSort="true"  width="250" >详细地址
														<input property="editor" class="mini-textbox" required="true" style="width:100%;"  />
													</div>
													<div name="postCode"  field="postCode"   vtype="" headerAlign="center" allowSort="true"  width="250" >邮编
														<input property="editor" class="mini-textbox" required="true" style="width:100%;"  />
													</div>
													
													<div name="phone"  field="phone"   vtype="" headerAlign="center" allowSort="true"  width="64" >电话
														<input property="editor" class="mini-textbox" style="width:100%;"  />
													</div>
													<div name="fax"  field="fax"   vtype="" headerAlign="center" allowSort="true"  width="64" >传真
														<input property="editor" class="mini-textbox" style="width:100%;"  />
													</div>
													<div type="comboboxcolumn" autoShowPopup="true"  name="isDefault"  field="isDefault"  vtype="" headerAlign="center" allowSort="true" width="50" >是否默认
														<input property="editor" class="mini-combobox" style="width:100%;" textField="label" valueField="value" url="${ctx}/ims-ext/sys/dict/listDataStr?type=yes_no" />
													</div>
													<div name="remarks"  field="remarks"  vtype="" headerAlign="center" allowSort="true" width="255" >备注信息
														<input property="editor" class="mini-textarea" style="width:100%;"  />
													</div>
												</div>
											</div>
										</div>
									</div>
											  
								  <div title="售电信息" id="tabPgSeInfo"  style="border: 0px;"  >
										<div id="formPgSeInfo" class="form" style="width:100%;height:100%;">
											<input name="id"  hideable="true" visible="false" class="mini-textbox" vtype = ""  required="false" />
											<table border="0" cellpadding="3" cellspacing="3" >
												<tr>
													<td style="width:64px;text-align:left;">电源商：</td>
													<td style="width:64px;">
 														<input name="isVendor" id="isVendor"   class="mini-checkbox"  value="0" trueValue="1" falseValue="0" vtype = ""  required="false" /></td>
													<td style="width:150px;text-align:right;">
														<input name="vendorId" id="vendorId" class="mini-buttonedit"  allowInput = "false"  required="false" textName="vendorName"  onbuttonclick="popLov(this,'选择电源商',false,true,'${ctx}/ims-system/pur/purVendor/list',800,500,'id,name','vendorId,vendorName','#formPgSeInfo')" />
													</td>
													<td style="width:150px;">
														<a class="mini-button" iconCls="icon-file-alt" onclick="onClick">打开</a>
													</td>
												</tr>
												<tr>
													<td style="width:64px;text-align:left;">客户：</td>
													<td style="width:64px;"> 
													<input name="isCust" id="isCust"   class="mini-checkbox"  value="0" trueValue="1" falseValue="0" vtype = ""  required="false" />													</td>
													</td>
													<td style="width:150px;text-align:right;">
														<input name="custId" id="custId" class="mini-buttonedit"  allowInput = "false"  required="false" textName="custName"  onbuttonclick="popLov(this,'选择客户',false,true,'${ctx}/ims-system/sd/sdCust/list',800,500,'id,name','custId,custName','#formPgSeInfo')" />
													</td>
													<td style="width:150px;">
														<a class="mini-button" iconCls="icon-file-alt" onclick="onClick">打开</a>
													</td>
												</tr>
												<tr>
												<td style="text-align:left;">备注：</td>
												<td colspan="3">
													<input name="note" id="note" class="mini-textarea" style="width:286px;"/>
												</td>
												</tr>

											</table>
										</div>
									</div> --%>	

	                               <div title="班组信息" id="tabPgClassInfo"  style="border: 0px;"  >
										<div id="formPgClassInfo" class="form" style="width:100%;height:100%;">
											<input name="id"   class="mini-hidden"  vtype = ""  required="false" />
											<input name="orgId" id="orgId"  class="mini-hidden" vtype = "" required="false" />
											<input name="specName" id="specName"  class="mini-hidden" vtype = "" required="false" />
											<input name="leaderName" id="leaderName"  class="mini-hidden" vtype = "" required="false" />
											<table border="0" cellpadding="3" cellspacing="3" >
												
                                                <tr >
													<td style="width:120px;text-align:right;">班组类型：</td>
													<td>
														<input name="orgType" id="orgType" showClose="false" showNullItem="true"  class="mini-combobox" vtype = "" required="false" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=pg_class_info_org_type" />
													</td>
													
													<td style="width:120px;text-align:right;">班组运行类型：</td>
													<td>
														<input name="classType" id="classType" showClose="false" showNullItem="true"  class="mini-combobox" vtype = "" required="false" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=pg_class_type" />
													</td>
												
													<td style="width:120px;text-align:right;">值别类型：</td>
													<td>
														<input name="dutyId" name="dutyId"  showClose="false" showNullItem="true"  class="mini-combobox"  vtype = ""  required="false" valueField="id" textField="name"  />
													</td>
												</tr>
												 <tr >
												   <td style="width:120px;text-align:right;">专业：</td>
													<td>
													   <input name="specId" id="specId" textName="specName" showClose="false"  class="mini-buttonedit" allowInput="false" vtype = "" required="false" onbuttonclick="popLov(this,'选择专业',false,true,'${ctx}/ims-system/pg/pgSpec/lov',800,500,'id,name','specId,specName','#formPgClassInfo')"  />
													</td>
													<td style="text-align:right;">班长：</td>
													<td>
													   <input name="leader" id="leader" showClose="false"  class="mini-buttonedit"  vtype = ""  required="false" width="" allowInput="false" textName="leaderName"
													   onbuttonclick="popLov(this,'选择班长',false,true,'${ctx}/sys/sysUser/sysMisList',850,500,'id,name','leader,leaderName','#formPgClassInfo')"/>
													</td>
													<td style="text-align:right;">班组简称：</td>
													<td>
													    <input name="shortCode" id="shortCode" class="mini-textbox" vtype = ""  required="false" />
													</td>
												</tr>
												 <tr >
												
													<td style="width:100px;text-align:right;">备注信息：</td>
													<td>
														<input name="remarks" id="remarks" class="mini-textarea" vtype = ""  required="false" valueField="id" textField="name"  url="${ctx}/ims-system/om/omDuty/allData"/>
													</td>
												</tr>
												
											</table>
										</div>
									</div>
								</div>
							</div><!--fit-->

						</div><!--fit-->

					</div>

				</div>
			</div>
		</div>
	</div>

</div>
<sys:toolbarfooter></sys:toolbarfooter>
<sys:excelframe></sys:excelframe>

<script type="text/javascript">

	initBase(
			{   id:"datagridMain",
				objId:"SysOrg",
				treeFilter:"((a.id='[node.id]') or (a.parent_ids like '%,[node.id],%'))",//左树右表时不能为空,示例:"a.class_id='[node.id]'",
				treeSrcFields:"id",
				treeDestFields:"parentId",
				treeSubSrcFields:"id",
				treeSubDestFields:"parentId",
				masterKeyField:"id",
				dataUrl:"${ctx}/ims-iam-ext/sys/sysOrg/allData",
				getUrl:"${ctx}/ims-iam-ext/sys/sysOrg/get",
				//initInsertUrl:"${ctx}/ims-system/sys/sysOrg/initInsert",
				//checkSaveUrl:"${ctx}/ims-system/sys/sysOrg/checkSave",
				saveUrl:"${ctx}/ims-iam-ext/sys/sysOrg/save",
				//checkRemoveUrl:"${ctx}/ims-system/sys/sysOrg/checkRemove",
				removeUrl:"${ctx}/ims-iam-ext/sys/sysOrg/remove",
				exportUrl:"${ctx}/ims-iam-ext/sys/sysOrg/export"
			}
	);

	initChilds( "#editform", "tabsMain" ,
			[

			]

	);

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
				{
					id: 'a.id',
					label: '编码',
					type: 'string',
					default_value: '',
					size: 64
//				       ,tableName:"biz_app_ins_attr",
//						fK:"app_ins_id=a.id",
//						idField:"var_id",
//						valueField:"value"
				}
				,{
				id: 'a.parent_id',
				label: '父级编号',
				type: 'string',
				default_value: '',
				size: 64
			}
				,{
				id: 'a.parent_ids',
				label: '所有父级编号',
				type: 'string',
				default_value: '',
				size: 120
			}
				,{
				id: 'a.name',
				label: '名称',
				type: 'string',
				default_value: '',
				size: 100
			}
				,{
				id: 'a.short_name ',
				label: '简称',
				type: 'string',
				default_value: '',
				size: 100
			},{
				id: 'a.class_id',
				label: '机构分类',
				type: 'string',
				default_value: '',
				size: 120
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
						$.getJSON('${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_class', function (data) {
							data.forEach(function (item) {
								that.addOption(item);
							});
						});
					}
				},
				valueSetter: function(rule, value) {
					rule.$el.find('.rule-value-container select')[0].selectize.setValue(value);
				}
			},{
				id: 'a.class_id2',
				label: '机构分类2',
				type: 'string',
				default_value: '',
				size: 120
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
						$.getJSON('${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_class2', function (data) {
							data.forEach(function (item) {
								that.addOption(item);
							});
						});
					}
				},
				valueSetter: function(rule, value) {
					rule.$el.find('.rule-value-container select')[0].selectize.setValue(value);
				}
			},{
				id: 'a.star',
				label: '星级',
				type: 'string',
				default_value: '',
				size: 120
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
						$.getJSON('${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_star', function (data) {
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
				id: 'a.sort',
				label: '排序',
				type: 'integer',
				default_value: '',
				size: 120
			}
				,{
				id: 'a.area_id',
				label: '归属区域',
				type: 'string',
				default_value: '',
				size: 64
			}
				,{
				id: 'a.code',
				label: '区域编码',
				type: 'string',
				default_value: '',
				size: 100
			},{
				id: 'a.orgCode',
				label: '机构编码',
				type: 'string',
				default_value: '',
				size: 100
			},{
				id: 'a.status',
				label: '状态',
				type: 'string',
				default_value: '',
				size: 64
			}
				,{
				id: 'a.type',
				label: '机构类型',
				type: 'string',
				default_value: '',
				size: 120
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
						$.getJSON('${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_type', function (data) {
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
				id: 'a.grade',
				label: '机构等级',
				type: 'string',
				default_value: '',
				size: 120
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
						$.getJSON('${ctx}/ims-ext/sys/dict/listDataStr?type=sys_org_grade', function (data) {
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
				id: 'a.address',
				label: '联系地址',
				type: 'string',
				default_value: '',
				size: 255
			}
				,{
				id: 'a.zip_code',
				label: '邮政编码',
				type: 'string',
				default_value: '',
				size: 100
			}
				,{
				id: 'a.master',
				label: '负责人',
				type: 'string',
				default_value: '',
				size: 100
			}
				,{
				id: 'a.phone',
				label: '电话',
				type: 'string',
				default_value: '',
				size: 200
			}
				,{
				id: 'a.fax',
				label: '传真',
				type: 'string',
				default_value: '',
				size: 200
			}
				,{
				id: 'a.email',
				label: '邮箱',
				type: 'string',
				default_value: '',
				size: 200
			}
				,{
				id: 'a.useable',
				label: '是否启用',
				type: 'string',
				default_value: '',
				size: 64
			}
				,{
				id: 'a.primary_person',
				label: '负责人',
				type: 'string',
				default_value: '',
				size: 64
			}
				,{
				id: 'a.addr',
				label: '详细地址',
				type: 'string',
				default_value: '',
				size: 200
			}
				,{
				id: 'a.lng',
				label: '经度',
				type: 'string',
				default_value: '',
				size: 120
			}
				,{
				id: 'a.lat',
				label: '纬度',
				type: 'string',
				default_value: '',
				size: 120
			}
				,{
				id: 'a.site_id',
				label: '站点ID',
				type: 'string',
				default_value: '',
				size: 64
			}
				,{
				id: 'a.deputy_person',
				label: '副负责人',
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
			},{
                id: 'plant_type',
                label: '发电类型',
                type: 'string',
                default_value: '',
                size: 120 ,
                tableName:'pg_plant_info',
				fK:"id=a.id",
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
                        $.getJSON('${ctx}/ims-ext/sys/dict/listDataStr?type=plant_type', function (data) {
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
			]
	);
	loadWindow();
	var tabsMainTemp = mini.get("tabsMain");
	tabsMainTemp.setHeight(document.body.clientHeight-25);
	// var datagridMainTemp = mini.get("datagridMain");
	// datagridMainTemp.setHeight(document.body.clientHeight-100);

	function onUnitgroupLov(obj) {
		var plantId=mini.get("id");
		popLov(obj,'选择机组单元',false,true,'${ctx}/pg/pgUnitGroup/list?baseFilter='+encodeStr('a.plant_id=\''+plantId.getValue()+'\''),850,500,'id,name','unitGroup,unitGroupName','gridPgUnit' );
	}
	function onPlantTypeLov(obj) {
		//url="${ctx}/sys/sysMdict/allData?type=plant_type"
		//var plantId=mini.get("id");
		popLov(obj,'选择发电类型',false,true,'${ctx}/sys/sysMdict/list?baseFilter='+encodeStr('a.type=\'plant_type\'')+'&showTree=0',850,500,'value,label','plantType,plantTypeName','gridPgUnit' );
	}
	function onPlantTypeFormLov(obj) {
		popLov(obj,'选择发电类型',false,true,'${ctx}/sys/sysMdict/list?baseFilter='+encodeStr('a.type=\'plant_type\'')+'&showTree=0',850,500,'value,label','plantType,plantTypeName','#formPgPlantInfo'  );
	}
	
	  function sysOrgRoleAdd(){
		   var gridSysOrgRole = mini.get("gridSysOrgRole");
	       var data = gridSysOrgRole.getData();
	       var role_id="";       
	       for(var i=0;i<data.length;i++){  
	    	    if(i>0){
	    	    	role_id+=",";
	    	    }
	    	    role_id+=data[i].id;    	    
	       } 
	       popLov(role_id,'分配角色',true,true,'${ctx}/sys/sysRole/list',850,600,'id',null,null, null,assignRole);
	   }
	   
	   function assignRole(e){
		   var gridSysOrgRole = mini.get("gridSysOrgRole");
		   var orgIdStr = mini.get("id");
		   for(var i=0;i<e.length;i++){  
	   	       e[i].orgIdStr=orgIdStr.getValue();
	       } 	   
		   var json = mini.encode(e);
	       $.ajax({
	           url:"${ctx}/ims-system/sys/sysOrg/assignRoleToOrg",
	           async: false,  
	           data: { data: json },
		       type: "post",
		       dataType:'json',
	           success: function (text) {
	               var o = mini.decode(text);
		            if(objIsNotNull(o)){
		            	if(o.type=="E"){
                            showMessageBox("错误",o.message,"error");
                            return;
                        }else if(o.type=="W"){
                            showMessageBox("警告",o.message,"warning");
                        }else if(o.type=="I"){
                            showTipM("info","提示",o.message);
                        }
		            }
		            gridSysOrgRole.reload();   
	           },
	           error: function (jqXHR, textStatus, errorThrown) {
	               var callback=function (action) {
	                   viewErrorDetail(jqXHR.responseText);
	               }
	               var buttonsTemp=["ok","详细"];
	               showMessageBox("错误","保存分配机构错误","error",null,callback,buttonsTemp);
	               form.unmask();
	           }
	       }); 
	   }
	   
	   function close(Obj){
		  // e.setValue("");
		   //e.setText("");
		  // e.selectIndex(1);
	   }
	   
	
</script>
</body>
</html>