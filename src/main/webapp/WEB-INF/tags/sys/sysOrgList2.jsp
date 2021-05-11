<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>sys_org</title>
	<meta name="decorator" content="default"/>
	<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
</head>
<body>
	   <sys:toolbargridsingle objId="SysOrg" permissionEdit="sys2:sysOrg:edit"></sys:toolbargridsingle>
       <sys:searchadv></sys:searchadv>
	   <div class="mini-fit">
		<div id="datagridMain" class="mini-treegrid" style="width:100%;height:100%;"
			 url="${ctx}/sys2/sysOrg/allData" idField="id"
			 parentField="parentId" resultAsTree="false" showTreeIcon="true" treeColumn="name"
			 expandOnLoad="0" treeColumn="name" allowDrag="true" allowDrop="true" allowLeafDropIn="true"
			 allowResize="true" pageSize="100" autoLoad="false"
			 allowCellEdit="true" allowCellSelect="true" multiSelect="true"
			 editNextOnEnterKey="true"  editNextRowCell="true"
			 allowAlternating="true" showFilterRow="true"  showColumnsMenu="false" virtualScroll="true"
		>
			<div property="columns">
				<div type="indexcolumn"></div>
				<div type="checkcolumn"></div>
				<div name="action" width="120" headerAlign="center" align="center"
						renderer="onTreeActionRenderer" cellStyle="padding:0;">操作</div>
					<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center" allowSort="true" width="64" >id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="id-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
                    <div name="parentId"  field="parentId"  vtype=""   headerAlign="center" allowSort="true" width="64" >parent_id
                        <input property="editor" class="mini-treeselect" url="" valueField="id" textField="name" parentField="parentId" style="width:100%;" />
						<input id="parentId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
                    </div>
					<div name="parentIds" field="parentIds" vtype=""   headerAlign="center" allowSort="true" width="100" >parent_ids
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="parentIds-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="name" field="name" vtype=""   headerAlign="center" allowSort="true" width="100" >name
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="name-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="sort" field="sort" vtype=""   headerAlign="center" allowSort="true" width="100" >sort
						<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
						<input id="sort-Filter" name="mini-column-filter"  property="filter" class="mini-spinner" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="code" field="code" vtype=""   headerAlign="center" allowSort="true" width="100" >code
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="code-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="orgCode" field="orgCode" vtype=""   headerAlign="center" allowSort="true" width="100" >org_code
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="orgCode-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="status" field="status" vtype=""   headerAlign="center" allowSort="true" width="64" >status
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="status-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="businessType" field="businessType" vtype=""   headerAlign="center" allowSort="true" width="200" >business_type
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="businessType-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="type" field="type" vtype=""   headerAlign="center" allowSort="true" width="100" >type
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="type-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="grade" field="grade" vtype=""   headerAlign="center" allowSort="true" width="100" >grade
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="grade-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="address" field="address" vtype=""   headerAlign="center" allowSort="true" width="255" >address
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="address-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="zipCode" field="zipCode" vtype=""   headerAlign="center" allowSort="true" width="100" >zip_code
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="zipCode-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="master" field="master" vtype=""   headerAlign="center" allowSort="true" width="100" >master
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="master-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="phone" field="phone" vtype=""   headerAlign="center" allowSort="true" width="200" >phone
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="phone-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="fax" field="fax" vtype=""   headerAlign="center" allowSort="true" width="200" >fax
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="fax-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="email" field="email" vtype=""   headerAlign="center" allowSort="true" width="200" >email
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="email-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="useable" field="useable" vtype=""   headerAlign="center" allowSort="true" width="64" >useable
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="useable-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="primaryPerson" field="primaryPerson" vtype=""   headerAlign="center" allowSort="true" width="64" >primary_person
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="primaryPerson-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="addr" field="addr" vtype=""   headerAlign="center" allowSort="true" width="200" >addr
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="addr-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="lng" field="lng" vtype=""   headerAlign="center" allowSort="true" width="30" >lng
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="lng-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="lat" field="lat" vtype=""   headerAlign="center" allowSort="true" width="30" >lat
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="lat-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="siteId" field="siteId" vtype="" readOnly="true"  headerAlign="center" allowSort="true" width="64" >site_id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="siteId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="deputyPerson" field="deputyPerson" vtype=""   headerAlign="center" allowSort="true" width="64" >deputy_person
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="deputyPerson-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createBy"  field="createBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >create_by
						<input id="createBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="createDate"  field="createDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >create_date
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="createDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateBy"  field="updateBy" readOnly="true"  headerAlign="center" allowSort="true" width="64" >update_by
						<input id="updateBy-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="updateDate"  field="updateDate"  vtype="" readOnly="true" dateFormat="yyyy-MM-dd HH:mm:ss" headerAlign="center" allowSort="true" width="100" >update_date
						<input property="editor" class="mini-datepicker" style="width:100%;"  />
						<input id="updateDate-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="remarks"  field="remarks" vtype=""   headerAlign="center" allowSort="true" width="255" >remarks
						<input property="editor" class="mini-textarea" style="width:100%;"  />
						<input id="remarks-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="shortName" field="shortName" vtype=""   headerAlign="center" allowSort="true" width="100" >short_name
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="shortName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="classId" field="classId" vtype=""   headerAlign="center" allowSort="true" width="64" >class_id
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="classId-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="classId2" field="classId2" vtype=""   headerAlign="center" allowSort="true" width="64" >class_id2
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="classId2-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="star" field="star" vtype=""   headerAlign="center" allowSort="true" width="64" >star
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="star-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="mapName" field="mapName" vtype=""   headerAlign="center" allowSort="true" width="150" >map_name
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="mapName-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="isBm" field="isBm" vtype=""   headerAlign="center" allowSort="true" width="100" >is_bm
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="isBm-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="isMarket" field="isMarket" vtype=""   headerAlign="center" allowSort="true" width="100" >is_market
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="isMarket-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="nativeNo" field="nativeNo" vtype=""   headerAlign="center" allowSort="true" width="64" >native_no
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="nativeNo-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
					</div>
					<div name="isVirtual" field="isVirtual" vtype=""   headerAlign="center" allowSort="true" width="255" >是否虚拟班组
						<input property="editor" class="mini-textbox"  style="width:100%;"  />
						<input id="isVirtual-Filter" name="mini-column-filter"  property="filter" class="mini-textbox" style="width:100%;"
							   onvaluechanged="onFilterChanged" showClose="true" oncloseclick="onFilterClose(this)"
						/>
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
				dataUrl:"${ctx}/sys2/sysOrg/allData",
				getUrl:"${ctx}/sys2/sysOrg/get",
				saveUrl:"${ctx}/sys2/sysOrg/save",
				removeUrl:"${ctx}/sys2/sysOrg/remove",
				exportUrl:"${ctx}/sys2/sysOrg/export"
			 }
	       );

	initQb( "#builder","pnlQuery", "tabsQuery", "txtSQL","btnAdvSearch",
			[
					{
						id: 'a.id',
						label: 'id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.parent_id',
						label: 'parent_id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.parent_ids',
						label: 'parent_ids',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.name',
						label: 'name',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.sort',
						label: 'sort',
						type: 'integer',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.area_id',
						label: 'area_id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.code',
						label: 'code',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.org_code',
						label: 'org_code',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.status',
						label: 'status',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.business_type',
						label: 'business_type',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.type',
						label: 'type',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.grade',
						label: 'grade',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.address',
						label: 'address',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.zip_code',
						label: 'zip_code',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.master',
						label: 'master',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.phone',
						label: 'phone',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.fax',
						label: 'fax',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.email',
						label: 'email',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.useable',
						label: 'useable',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.primary_person',
						label: 'primary_person',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.addr',
						label: 'addr',
						type: 'string',
						default_value: '',
						size: 200
					}
					,{
						id: 'a.lng',
						label: 'lng',
						type: 'string',
						default_value: '',
						size: 30
					}
					,{
						id: 'a.lat',
						label: 'lat',
						type: 'string',
						default_value: '',
						size: 30
					}
					,{
						id: 'a.site_id',
						label: 'site_id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.deputy_person',
						label: 'deputy_person',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_by',
						label: 'create_by',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.create_date',
						label: 'create_date',
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
						label: 'update_by',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.update_date',
						label: 'update_date',
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
						label: 'remarks',
						type: 'string',
						default_value: '',
						size: 255
					}
					,{
						id: 'a.short_name',
						label: 'short_name',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.class_id',
						label: 'class_id',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.class_id2',
						label: 'class_id2',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.star',
						label: 'star',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.map_name',
						label: 'map_name',
						type: 'string',
						default_value: '',
						size: 150
					}
					,{
						id: 'a.is_bm',
						label: 'is_bm',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.is_market',
						label: 'is_market',
						type: 'string',
						default_value: '',
						size: 100
					}
					,{
						id: 'a.native_no',
						label: 'native_no',
						type: 'string',
						default_value: '',
						size: 64
					}
					,{
						id: 'a.is_virtual',
						label: '是否虚拟班组',
						type: 'string',
						default_value: '',
						size: 255
					}
			]
	);
   loadWindow();
   //////////操作菜单项点击事件方法/////////
   function onGridOpMiClick(e){

   }

</script>
</body>
</html>