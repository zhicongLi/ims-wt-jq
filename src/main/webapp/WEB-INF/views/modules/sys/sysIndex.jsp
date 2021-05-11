<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<html>
<head>
	<title></title>
	<meta http-equiv="X-UA-Compatible" content="IE=8,IE=edge">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

	<style type="text/css">
		body{
			margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
		}
		.header{
			/*filter: progid:DXImageTransform.Microsoft.Gradient(startColorStr='#54b4eb',endColorStr='#2fa4e7',gradientType='1');*/
			background-image: linear-gradient(to bottom,#54b4eb,#2fa4e7);
			background:url('${ctxStatic}/images/top-bg3_se.jpg')  repeat-x;
			/* background:url('${ctxStatic}/images/${fns:getConfig("headerTopImage")}')  repeat-x; */

			filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
			/*-moz-background-size:100% 100%;*/
			/*background-size:100% 100%;*/
			/*background-repeat: repeat-x;*/
			/*color: #fff;*/
		}
		.h1{

			color: #fff;
		}
		body .mini-button-pressed, body a:hover.mini-button-pressed, body .mini-button-checked, body a:hover.mini-button-checked, body a.mini-button-popup, body a:hover.mini-button-popup {
			background: #777;
			border-color: #adadad;
			color: #333333;
			box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125);
		}
		.loading .pic{
			width: 64px;
			height: 64px;
			border:0px solid red;
			background: url('${ctxStatic}/images/loading.gif') no-repeat;
			position: absolute;
			top: 0;
			bottom: 0;
			left: 0;
			right: 0;
			margin: auto;
		}
	</style>
	<script type="text/javascript">
		var homeLoaded = false;
	</script>
</head>
<body>
<div class="loading">
	<div class="pic">
	</div>
</div>
<!--Layout-->
<div id="layout1" class="mini-layout" style="width:100%;height:100%;display: none;" splitSize="0" >
	<div class="header" region="north" height="60" showSplit="false" showHeader="false"  >

		<%--<h1 style="margin:0;padding:5px;cursor:default;font-family:微软雅黑,黑体,宋体;color: #fff;">${fns:getConfig('productName')}</h1>--%>
		<div id="_rootMenu" style="position:absolute;top:8px;left:550px;">

			<%-- <c:forEach items="${fns:getRootMenuList()}" var="menu" varStatus="idxStatus">
				<a name="_rootMenuItem" id="_rootMenuItem_${menu.id}" iconCls="${menu.icon}" class="mini-button mini-button-iconTop" checkOnClick="true" style="color: #fff;" onclick="onRootMenuClick(this,'${menu.id}' )" plain="true">${menu.name}</a>
			</c:forEach> --%>

		</div>
		<div style="position:absolute;top:10px;right:10px;">
			<a id="userNameId" class="mini-button mini-button-iconTop" iconCls="icon-user" style="color: #fff;"  onclick="openUserInfo()" plain="true">${fns:getUser().name}</a>
			<!-- <a id="userNameId" class="mini-button mini-button-iconTop" iconCls="icon-user" style="color: #fff;"  onclick="openUserInfo()" plain="true"></a> -->
			<a class="mini-button mini-button-iconTop" iconCls="icon-lock" style="color: #fff;" href="/logout" plain="true" >退出</a>


		</div>


	</div>
	<div title="south" region="south" showSplit="false" showHeader="false" height="20"  >
	<%--	<div style="line-height:18px;text-align:center;cursor:default">Copyright &copy; 2015-${fns:getConfig('copyrightYear')} ${fns:getConfig('productName')} ${fns:getConfig('version')}   技术支持: <a href="http://www.gdtianren.com/" target="_blank">北京华电天仁电力控制技术有限公司 TREPS平台</a> </div>--%>
	</div>
	<div title="center" region="center" style="border:0;" bodyStyle="overflow:hidden;">
		<!--Splitter-->
		<div class="mini-splitter" id="_main_splitter"  style="width:100%;height:100%;" borderStyle="border:0;">
			<div id="_leftPanel" size="210" maxSize="450" minSize="100" showCollapseButton="true" style="border:0;">
				<!--OutlookTree-->
				<%-- <c:forEach items="${fns:getRootMenuList()}" var="menu" varStatus="idxStatus">

					<div id="_leftTree_${menu.id}" name="_leftTree"   class="mini-outlooktree" url="${ctx}/sys/menu/menuList?parentId=${menu.id}" onnodeclick="onNodeSelect"
						 textField="name" idField="id" parentField="parentId" showTreeIcon="true" iconField="icon"
					>
					</div>
				</c:forEach> --%>
				<%-- <div id="_leftTree_611" name="_leftTree"   class="mini-outlooktree" url="${ctx}/sys/menu/menuList?parentId=611" onnodeclick="onNodeSelect"
                     textField="name" idField="id" parentField="parentId" showTreeIcon="true" iconField="icon"
                >
                <div id="_leftTree_91" name="_leftTree"   class="mini-outlooktree" url="${ctx}/sys/menu/menuList?parentId=91" onnodeclick="onNodeSelect"
                     textField="name" idField="id" parentField="parentId" showTreeIcon="true" iconField="icon"
                > --%>
				<%-- <div id="_leftTree_62" name="_leftTree"   class="mini-outlooktree" url="${ctx}/sys/menu/menuList?parentId=62" onnodeclick="onNodeSelect"
                     textField="name" idField="id" parentField="parentId" showTreeIcon="true" iconField="icon"
                >
                <div id="_leftTree_31" name="_leftTree"   class="mini-outlooktree" url="${ctx}/sys/menu/menuList?parentId=31" onnodeclick="onNodeSelect"
                     textField="name" idField="id" parentField="parentId" showTreeIcon="true" iconField="icon"
                >
                <div id="_leftTree_27" name="_leftTree"   class="mini-outlooktree" url="${ctx}/sys/menu/menuList?parentId=27" onnodeclick="onNodeSelect"
                     textField="name" idField="id" parentField="parentId" showTreeIcon="true" iconField="icon"
                >
                <div id="_leftTree_2" name="_leftTree"   class="mini-outlooktree" url="${ctx}/sys/menu/menuList?parentId=2" onnodeclick="onNodeSelect"
                     textField="name" idField="id" parentField="parentId" showTreeIcon="true" iconField="icon"
                >
                <div id="_leftTree_79" name="_leftTree"   class="mini-outlooktree" url="${ctx}/sys/menu/menuList?parentId=79" onnodeclick="onNodeSelect"
                     textField="name" idField="id" parentField="parentId" showTreeIcon="true" iconField="icon"
                > --%>

			</div>
			<div showCollapseButton="false" style="border:0;">
				<!--Tabs-->
				<div id="_mainTabs" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;"
					 plain="false" onactivechanged="onTabsActiveChanged" onbeforecloseclick="onTabsBeforeClose"  contextMenu="#_tabsMenu"
				>
					<div title="首页" id="_tabHome" name="_tabHome" url="${ctx}/sys/home" iconCls="icon-home" >
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<ul id="_tabsMenu" class="mini-contextmenu" style="display: none;"  onbeforeopen="onBeforeOpen">
	<li onclick="refreshTab">刷新</li>
	<li onclick="closeTab">关闭标签页</li>
	<li onclick="closeAllBut">关闭其他标签页</li>
	<li onclick="closeAll">关闭所有标签页</li>
</ul>


<script type="text/javascript">

    window.onbeforeunload = function(event) {
        localStorage.removeItem('t');
        localStorage.removeItem('code');
    }


	getRootMenuList();
	mini.parse();
	var _mainMenuId="${fns:getConfig('sys.defaultMenuId')}";//'91';//主业id务系统
	var _currMenuId=null;//当前选中一级菜单id
	_mainTabs = mini.get("_mainTabs");
	var currentTab = null;
	var firstCheckRootMenu = mini.get("_rootMenuItem_"+_mainMenuId);
	var _leftMenuTree = null;
	var _main_splitter = mini.get("_main_splitter");
	if(objIsNotNull(firstCheckRootMenu)){
		onRootMenuClick(firstCheckRootMenu,_mainMenuId);
	}
	$(".loading").fadeOut();
	var layoutMain=mini.get("layout1");
	layoutMain.show ( );
	var _tabsMenu=mini.get("_tabsMenu");
	_tabsMenu.show ( );
	//setUserName();

	//postVar("_jdbcType",_jdbcType);
	// var currUser = null;
	// getCurrUserInfo(true);

	addMessageReceiverLoc();
	/////////

	function showTab(node) {

		//alert(11);
		var id = "tab$" + node.id;
		var tab = _mainTabs.getTab(id);
		if (!tab) {

			if(objIsNotNull(node.href)   ){
				tab = {};
				tab._nodeid = node.id;
				tab.name = id;
				tab.title = node.text;
				tab.showCloseButton = true;
				tab.iconCls = node.icon;
				if(objIsNotNull(_currMenuId))
					tab['menuId'] = _currMenuId;
				if(node.href.indexOf( '://')>=0){
					tab.url = node.href;
				}else{
					tab.url = '${ctxRoot}'+node.href;
				}
				processCollapsePane(node.isCloseTree);
				_mainTabs.addTab(tab);
			}else{
				showMessageBox("警告","菜单地址未定义!","warning");
			}


		}
		if(objIsNotNull(tab))
			_mainTabs.activeTab(tab);
	}
	function processCollapsePane(isCloseTree) {
		if(objIsNotNull(_main_splitter)&&objIsNotNull(_main_splitter.getPane(1))){
			if(_main_splitter.getPane(1).expanded){
				if(isCloseTree=='1'){
					_main_splitter.collapsePane(1);

				}
			}else{
				if(isCloseTree=='0'||objIsNull(node.isCloseTree)){
					_main_splitter.expandPane(1);

				}
			}
		}
	}
	function onNodeSelect(e) {
		var node = e.node;
		var isLeaf = e.isLeaf;

		//if (isLeaf) {
		if (objIsNotNull(node.href) ) {
			showTab(node);
		}
	}
	function onRootMenuClick(e,menuId) {
		
		_currMenuId=menuId;
		if(menuId=='home_'){
			_main_splitter.hidePane(1);
			_mainTabs.activeTab( _mainTabs.getTab('_tabHome'));
		}else {
			_main_splitter.showPane(1);
		}
		var leftTree = mini.get("_leftTree_"+menuId);
		if(objIsNotNull(leftTree)){
			var  controls = mini.getsbyName("_leftTree","_leftPanel");

			$.each(controls,function(i,item){
				if(objIsNotNull(item)) {
					item.set({visible: false});
				}

			});
			leftTree.set({visible:true});
			_leftMenuTree=leftTree;
		}
		var rootMenuItem = e ;
		var  controls = mini.getsbyName("_rootMenuItem","_rootMenu");

		$.each(controls,function(i,item){
			if(objIsNotNull(item)) {
				item.set({checked: false});
			}

		});
		rootMenuItem.set({checked:true});
	}
	function showTree( leftTree) {

		var  controls = mini.getsbyName("_leftTree","_leftPanel");

		$.each(controls,function(i,item){
			if(objIsNotNull(item)) {
				item.set({visible: false});
			}

		});
		leftTree.set({visible:true});


	}

	function onTabsActiveChanged(e) {
		var tabs = e.sender;
		var tab = tabs.getActiveTab();

		if(tab && tab.name=='_tabHome'){
			if(!homeLoaded){//第一次不重新加载
				homeLoaded=true;
				return;
			}
			_main_splitter.hidePane(1);
			tabs.reloadTab(tab);
		}else{
			_main_splitter.showPane(1);
		}
		if (tab && tab._nodeid) {
			_currMenuId=tab['menuId'];
			_leftMenuTree = mini.get("_leftTree_"+_currMenuId);
			if( objIsNotNull(_leftMenuTree)){
				var node = _leftMenuTree.getNode(tab._nodeid);
				if (node && !_leftMenuTree.isSelectedNode(node)) {
					_leftMenuTree.selectNode(node);
					processCollapsePane(node.isCloseTree);
				}
				if( !_leftMenuTree.getVisible())
					showTree(_leftMenuTree);
			}
			var currMenuItem = mini.get("_rootMenuItem_"+_currMenuId);
			if( objIsNotNull(currMenuItem)){
				var  controls = mini.getsbyName("_rootMenuItem","_rootMenu");
				$.each(controls,function(i,item){
					if(objIsNotNull(item)) {
						item.set({checked: false});
					}

				});
				currMenuItem.set({checked:true});
			}


		}
	}
	function openUserInfo(  ) {

		newTabPage("我的信息",  "${ctx}/sys/user/info", true);

	}


	function onBeforeOpen(e) {
		currentTab = _mainTabs.getTabByEvent(e.htmlEvent);
		if (!currentTab) {
			e.cancel = true;
		}
	}

	///////////////////////////
	function refreshTab() {
		if(currentTab.title.substring(0,1)=="*"){
			if (!confirm("有数据未保存，确定放弃所做的修改？")) {
				return;
			}
		}
		clearStorage();
		_mainTabs.reloadTab(currentTab);
		setParentChangedFlag(false);
	}
	function closeTab() {
		var allTabs=_mainTabs.getTabs ( );
		if(currentTab.title!='首页'){
			if(currentTab.title.substring(0,1)=="*"){
				if (!confirm("有数据未保存，确定放弃所做的修改？")) {
					return;
				}
			}
			_mainTabs.removeTab(currentTab);
		}

	}
	function closeAllBut() {
		var abandon=false;
		var allTabs=_mainTabs.getTabs ( );
		for(var i=allTabs.length-1;i>0;i--){
			if(allTabs[i]!=currentTab){
				if(allTabs[i].title.substring(0,1)=="*"){
					if (!abandon&&!confirm("有数据未保存，确定放弃所做的修改？")) {
						return;
					}else{
						abandon=true;
					}
				}
				_mainTabs.removeTab(allTabs[i]);
			}

		}
	}
	function closeAll() {
		var abandon=false;
		var allTabs=_mainTabs.getTabs ( );
		for(var i=allTabs.length-1;i>0;i--){
			if(allTabs[i].title.substring(0,1)=="*"){
				if (!abandon&&!confirm("有数据未保存，确定放弃所做的修改？")) {
					return;
				}else{
					abandon=true;
				}
			}
			_mainTabs.removeTab(allTabs[i]);
		}
	}
	function addMessageReceiverLoc()
	{
		window.addEventListener('message', function(ev) {
			// if (ev.source !== window.parent) {return;}
			var data = ev.data;
			console.info('message from tab:', data);
			if(data.type=="updateTab"){
				var targetTab =null;
				var targetTabAttr=data.targetTab;
				if(objIsNotNull(targetTabAttr)){
					if(objIsNotNull(targetTabAttr.id)){
						targetTab=_mainTabs.getTab(targetTabAttr.id);
					}else if(objIsNotNull(targetTabAttr.title)){
						var allTabs=_mainTabs.getTabs ( );
						for(var i=allTabs.length-1;i>0;i--){

							if(allTabs[i].title ==targetTabAttr.title){
								targetTab=allTabs[i];
								break;
							}


						}
					}else if(objIsNotNull(targetTabAttr.url)){
						var allTabs=_mainTabs.getTabs ( );
						for(var i=allTabs.length-1;i>0;i--){

							if(allTabs[i].url.indexOf(targetTabAttr.url)==0){
								targetTab=allTabs[i];
								break;
							}


						}
					}
				}
				if(objIsNotNull(targetTab))
					_mainTabs.activeTab(targetTab);
			}
			else if(data.type=="newTab"){
				if(data.data && (data.data.length>0) )
					newTabPage(data.data[0].text, data.data[0].href, data.data[0].closeable,data.data[0].tabOption );
			}else if(data.type=="var"){
				if(data.id && data.id=="changedFlag"){
					setParentChangedFlag(data.data);
				}
			}
			//newTabPage("百度", data, true);
		}, false);
	}
	function newTabPage(title, url, closeable,tabOption){
		debugger;
	
		//mini.parse();
		if(objIsNotNull(_mainTabs)){

			tab = {};
			//tab._nodeid = node.id;
			//tab.name = id;
			tab.title = title;
			tab.showCloseButton = closeable;
			// if(objIsNotNull(_currMenuId))
			//     tab['menuId'] = _currMenuId;

			//这里拼接了url，实际项目，应该从后台直接获得完整的url地址
			//alert(url);
			if(url!=null ){
				//if(url.indexOf( '://')>=0){
				tab.url = url;
				clearStorage();
				_mainTabs.addTab(tab);
				_mainTabs.updateTab ( tab, tabOption )
				_mainTabs.activeTab(tab);

			}

		}


	}
	function setParentChangedFlag(changedFlag){
		if(objIsNotNull(_mainTabs)){
			var tabObj = _mainTabs.getActiveTab();

			if(objIsNotNull(tabObj)){
				var newTitle=tabObj.title;
				if(changedFlag){
					if(tabObj.title.substring(0,1)!="*"){
						newTitle= "*"+tabObj.title;
					}
				}else{
					if(tabObj.title.substring(0,1)=="*"){
						newTitle= tabObj.title.substring(1);
					}
				}

				_mainTabs.updateTab( tabObj, {title: newTitle} );
			}

		}

	}
	function onTabsBeforeClose(e){
		var tabObj = e.tab;
		if(tabObj.title){
			if(tabObj.title.length>0&&tabObj.title.substring(0,1)=="*"){
				if (!confirm("有数据未保存，确定放弃所做的修改？")) {
					e.cancel=true;
				}
			}
		}
	}


	function getRootMenuList(){
		var html = "";
		$.ajax({
			//url: "${ctx}/sys/sysMenu/getRootMenu",
			url: ctx + "/ims-ext/sys/sysMenu/getRootMenu",
			type: "get",
			success: function (text) {
				var o = mini.decode(text);
				//console.log("oooooooooooooooooo");
				//console.log(o);
				for(var i = 0; i < o.length; i++) {
					var menu = o[i];
					var id = menu.id;
					var icon = menu.icon;
					var name = menu.name;
					menuHtml = "<a name=\"_rootMenuItem\" id=\"_rootMenuItem_" + id + "\" iconCls=\"" + icon + "\" class=\"mini-button mini-button-iconTop\" checkOnClick=\"true\" style=\"color: #fff;\" onclick=\"onRootMenuClick(this,'" + id + "' )\" plain=\"true\">" + name + "</a>";
					//hrml += "<a name="_rootMenuItem" id="_rootMenuItem_${menu.id}" iconCls="${menu.icon}" class="mini-button mini-button-iconTop" checkOnClick="true" style="color: #fff;" onclick="onRootMenuClick(this,'${menu.id}' )" plain="true">${menu.name}</a>"
					console.log(menuHtml);
					html += menuHtml;
				}
				$("#_rootMenu").html(html);
				setMenuList(o);
			}
		});
	}

	function setMenuList(o) {
		var html = "";
		for(var i = 0; i < o.length; i++) {
			var menu = o[i];
			var id = menu.id;
			menuHtml = "<div id=\"_leftTree_" + id + "\" name=\"_leftTree\"   class=\"mini-outlooktree\" url=\"${ctx}/ims-ext/sys/sysMenu/menuList?parentId=" + id + "\" onnodeclick=\"onNodeSelect\" textField=\"name\" idField=\"id\" parentField=\"parentId\" showTreeIcon=\"true\" iconField=\"icon\"></div>";
			//console.log(menuHtml);
			html += menuHtml;
			$("#_leftPanel").html(html);
		}
		mini.parse();
	}

	<%-- <div id="_leftTree_${menu.id}" name="_leftTree"   class="mini-outlooktree" url="${ctx}/sys/menu/menuList?parentId=${menu.id}" onnodeclick="onNodeSelect"
         textField="name" idField="id" parentField="parentId" showTreeIcon="true" iconField="icon">
    </div> --%>

	function setUserName() {
		$.ajax({
			//url: "${ctx}/sys/sysTest/getUser",
			url: ctx + "/sys/sysUser/getUser",
			type: "get",
			success: function (text) {
				var o = mini.decode(text);
				console.log("oooooooooooooooooo");
				console.log(o);
				//var name = o.name;
				var name = o.name;
				$("#userNameId").text(name);
			}
		});
	}

</script>

</body>
</html>