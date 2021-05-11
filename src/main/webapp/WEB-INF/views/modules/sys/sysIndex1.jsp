<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<html>
<head>
	<title>${fns:getConfig('productName')}</title>
	<meta charset="UTF-8">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%--    <meta http-equiv="X-UA-Compatible" content="IE=8,IE=edge">--%>
<%--	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

	<style type="text/css">
		/*body{*/
		/*	margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;*/
		/*}*/
        .header{
		    /*filter: progid:DXImageTransform.Microsoft.Gradient(startColorStr='#54b4eb',endColorStr='#2fa4e7',gradientType='1');*/
			background-image: linear-gradient(to bottom,#54b4eb,#2fa4e7);
			background:url('${ctxStatic}/images/${fns:getConfig("headerTopImage")}')  repeat-x;

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
		<%--.loading .pic{--%>
		<%--	width: 64px;--%>
		<%--	height: 64px;--%>
		<%--	border:0px solid red;--%>
		<%--	background: url('${ctxStatic}/images/loading.gif') no-repeat;--%>
		<%--	position: absolute;--%>
		<%--	top: 0;--%>
		<%--	bottom: 0;--%>
		<%--	left: 0;--%>
		<%--	right: 0;--%>
		<%--	margin: auto;--%>
		<%--}--%>
	</style>

	<link rel="stylesheet" href="${ctxStatic}/templates/1/font/iconsmind-s/css/iconsminds.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/font/simple-line-icons/css/simple-line-icons.css" />

	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/vendor/bootstrap.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/vendor/bootstrap.rtl.only.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/vendor/fullcalendar.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/vendor/dataTables.bootstrap4.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/vendor/datatables.responsive.bootstrap4.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/vendor/select2.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/vendor/perfect-scrollbar.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/vendor/glide.core.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/vendor/bootstrap-stars.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/vendor/nouislider.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/vendor/bootstrap-datepicker3.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/vendor/component-custom-switch.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/1/css/main.css" />
	<script type="text/javascript">

		class TreeBuilder {
			constructor(data) {
				this.makeTree(data);
			}

			makeTree(list) {
				const root = {};

				// 建立 ID 到节点数据的映射表
				const map = list.reduce((nodes, node) => {
					nodes[node.id] = node;
					return nodes;
				}, {});

				// 通过映射表查找 pid，找到父节点，建立树结构
				list.forEach(node => {
					const parent = map[node.parentId] || root;
					const children = parent.children = parent.children || [];
					children.push(node);
				});

				this.tree = root;
				console.log(this.tree);
			}

			build(rootId) {
				// buildChildren 和 buildNode 是双函数的递归实现
				return this.buildChildren(this.tree,rootId,false);
			}

			/**
			 * 处理子节点
			 */
			buildChildren(parent,rootId,subMenu) {

				var $ul = $('<ul id="menu_'+rootId+'" class="list-unstyled" data-link="root_'+rootId+'" style="display: none;" >');
				if(subMenu){
					var $ul = $(' <div id="_collapseMenu_'+rootId+'" class="collapse"   >');

					var $ul2 = $('<ul class="list-unstyled inner-level-menu" style="display: none;">');
					$ul.append($ul2);
					parent.children
							.map(node => this.buildNode(node))
							.forEach(node => $ul2.append(node))

					;
				}else{
					parent.children
							.map(node => this.buildNode(node))
							.forEach(node => $ul.append(node))

					;
				}

				return $ul;
			}

			/**
			 * 处理节点，若有子节点则调用 buildChildren 生成子树
			 */
			buildNode(node) {
				var $li=null ;
				var icon_class=node.icon;
				if(objIsNotNull(icon_class)){
					icon_class='fa '+icon_class.replace('icon-','fa-');
				}
				if (node.children && node.children.length) {


					$li = $("<li>").append(
							$('<a   data-toggle="collapse" data-target="#_collapseMenu_'+node.id+'" aria-expanded="false"' +
									'                            aria-controls="_collapseMenu_'+node.id+'" class="rotate-arrow-icon collapsed">')
									.append($('<i class="'+icon_class+'"></i>'))
									.append($('<span class="d-inline-block">').text(node.name || ""))
									.attr("href", node.href || "#")
					)
					;
					$li.append(this.buildChildren(node,node.id,true));
				} else{
					$li = $("<li>").append(
							//$('<a  οnclick="onNodeSelectNew('+JSON.stringify(node).replace(/"/g, '&quot;')+');" >')
							$('<a  >')
									.append($('<i class="'+icon_class+'"></i>'))
									.append($('<span class="d-inline-block">').text(node.name || ""))
									.attr("href", 'javascript:onNodeSelectNew('+JSON.stringify(node).replace(/'/g, '&quot;')+');')
					)
					;
				}
				return $li;
			}
		}

		function genMenuSub(parentId ){

			if(!objIsNotNull(parentId)){
				return;
			}

			var res='';
			$.ajax({
				url: baseUrl+"/sys/menu/menuList?parentId="+parentId,
				async:true,
				success: function (text) {
					//alert(text);
					var o = mini.decode(text);
					console.log(o);
					const treeBuilder = new TreeBuilder(o);
					treeBuilder.build(parentId)
							.appendTo($("#_sub_tree"));

					res= 1;

				},
				error: function (jqXHR, textStatus, errorThrown) {
					var callback=function (action) {
						if(action=='详细')  viewErrorDetail(jqXHR.responseText);
					}
					var buttonsTemp=["ok","详细"];
					showMessageBox("错误","菜单加载失败","error",null,callback,buttonsTemp,true);

				}
			});
			return res;
		}




	</script>
</head>

<body id="app-container" class="menu-default show-spinner">
<div class="loading">
	<div class="pic">
	</div>
</div>
<nav class="navbar fixed-top">
	<div class="d-flex align-items-center navbar-left">
		<a href="#" class="menu-button d-none d-md-block">
			<svg class="main" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 9 17">
				<rect x="0.48" y="0.5" width="7" height="1" />
				<rect x="0.48" y="7.5" width="7" height="1" />
				<rect x="0.48" y="15.5" width="7" height="1" />
			</svg>
			<svg class="sub" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 18 17">
				<rect x="1.56" y="0.5" width="16" height="1" />
				<rect x="1.56" y="7.5" width="16" height="1" />
				<rect x="1.56" y="15.5" width="16" height="1" />
			</svg>
		</a>

		<a href="#" class="menu-button-mobile d-xs-block d-sm-block d-md-none">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 26 17">
				<rect x="0.5" y="0.5" width="25" height="1" />
				<rect x="0.5" y="7.5" width="25" height="1" />
				<rect x="0.5" y="15.5" width="25" height="1" />
			</svg>
		</a>

		<div class="search" data-search-path="Pages.Search.html?q=">
			<input placeholder="搜索...">
			<span class="search-icon">
                    <i class="simple-icon-magnifier"></i>
                </span>
		</div>

<%--		<a class="btn btn-sm btn-outline-primary ml-3 d-none d-md-inline-block"--%>
<%--		   href="https://1.envato.market/5kAb">&nbsp;BUY&nbsp;</a>--%>
	</div>


	<a class="navbar-logo" >
		<span class="logo d-none d-xs-block"></span>
		<span class="logo-mobile d-block d-xs-none"></span>
	</a>

	<div class="navbar-right">
		<div class="header-icons d-inline-block align-middle">
			<div class="d-none d-md-inline-block align-text-bottom mr-3">
				<div class="custom-switch custom-switch-primary-inverse custom-switch-small pl-1"
					 data-toggle="tooltip" data-placement="left" title="黑色模式">
					<input class="custom-switch-input" id="switchDark" type="checkbox" checked>
					<label class="custom-switch-btn" for="switchDark"></label>
				</div>
			</div>

			<div class="position-relative d-none d-sm-inline-block">
				<button class="header-icon btn btn-empty" type="button" id="iconMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
					<i class="simple-icon-grid"></i>
				</button>
				<div class="dropdown-menu dropdown-menu-right mt-3  position-absolute" id="iconMenuDropdown">
					<a href="#" class="icon-menu-item">
						<i class="iconsminds-equalizer d-block"></i>
						<span>Settings</span>
					</a>

					<a href="#" class="icon-menu-item">
						<i class="iconsminds-male-female d-block"></i>
						<span>Users</span>
					</a>

					<a href="#" class="icon-menu-item">
						<i class="iconsminds-puzzle d-block"></i>
						<span>Components</span>
					</a>

					<a href="#" class="icon-menu-item">
						<i class="iconsminds-bar-chart-4 d-block"></i>
						<span>Profits</span>
					</a>

					<a href="#" class="icon-menu-item">
						<i class="iconsminds-file d-block"></i>
						<span>Surveys</span>
					</a>

					<a href="#" class="icon-menu-item">
						<i class="iconsminds-suitcase d-block"></i>
						<span>Tasks</span>
					</a>

				</div>
			</div>

			<div class="position-relative d-inline-block">
				<button class="header-icon btn btn-empty" type="button" id="notificationButton"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="simple-icon-bell"></i>
					<span class="count">3</span>
				</button>
				<div class="dropdown-menu dropdown-menu-right mt-3 position-absolute" id="notificationDropdown">
					<div class="scroll">
						<div class="d-flex flex-row mb-3 pb-3 border-bottom">
							<a href="#">
								<img src="img/profile-pic-l-2.jpg" alt="Notification Image"
									 class="img-thumbnail list-thumbnail xsmall border-0 rounded-circle" />
							</a>
							<div class="pl-3">
								<a href="#">
									<p class="font-weight-medium mb-1">Joisse Kaycee just sent a new comment!</p>
									<p class="text-muted mb-0 text-small">09.04.2018 - 12:45</p>
								</a>
							</div>
						</div>
						<div class="d-flex flex-row mb-3 pb-3 border-bottom">
							<a href="#">
								<img src="img/notification-thumb.jpg" alt="Notification Image"
									 class="img-thumbnail list-thumbnail xsmall border-0 rounded-circle" />
							</a>
							<div class="pl-3">
								<a href="#">
									<p class="font-weight-medium mb-1">1 item is out of stock!</p>
									<p class="text-muted mb-0 text-small">09.04.2018 - 12:45</p>
								</a>
							</div>
						</div>
						<div class="d-flex flex-row mb-3 pb-3 border-bottom">
							<a href="#">
								<img src="img/notification-thumb-2.jpg" alt="Notification Image"
									 class="img-thumbnail list-thumbnail xsmall border-0 rounded-circle" />
							</a>
							<div class="pl-3">
								<a href="#">
									<p class="font-weight-medium mb-1">New order received! It is total $147,20.</p>
									<p class="text-muted mb-0 text-small">09.04.2018 - 12:45</p>
								</a>
							</div>
						</div>
						<div class="d-flex flex-row mb-3 pb-3 ">
							<a href="#">
								<img src="img/notification-thumb-3.jpg" alt="Notification Image"
									 class="img-thumbnail list-thumbnail xsmall border-0 rounded-circle" />
							</a>
							<div class="pl-3">
								<a href="#">
									<p class="font-weight-medium mb-1">3 items just added to wish list by a user!
									</p>
									<p class="text-muted mb-0 text-small">09.04.2018 - 12:45</p>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<button class="header-icon btn btn-empty d-none d-sm-inline-block" type="button" id="fullScreenButton">
				<i class="simple-icon-size-fullscreen"></i>
				<i class="simple-icon-size-actual"></i>
			</button>

		</div>

		<div class="user d-inline-block">
			<button class="btn btn-empty p-0" type="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">
				<span class="name">${fns:getUser().name}</span>
				<span>

                    </span>
			</button>

			<div class="dropdown-menu dropdown-menu-right mt-3">
				<a class="dropdown-item" href="javascript:openUserInfo();">个人信息</a>
				<a class="dropdown-item" href="javascript:modifyUserPassword();">修改密码</a>
				<a class="dropdown-item" href="${ctx}/logout">退出</a>
			</div>
		</div>
	</div>
</nav>
<div class="menu">
	<div class="main-menu">
		<div class="scroll">
			<ul class="list-unstyled" id="_root_menu_ul">

				<c:forEach items="${fns:getRootMenuList()}" var="menu" varStatus="idxStatus">
				<li>
					<a name="_rootMenuItem" id="_rootMenuItem_${menu.id}"  href="#root_${menu.id}"  >
						<i class="fa ${fn:replace(menu.icon, "icon-", "fa-")}"></i>${menu.name}
					</a>
				</li>

				</c:forEach>

			</ul>
		</div>
	</div>

	<div class="sub-menu">
		<div class="scroll" id="_sub_tree">


			<c:forEach items="${fns:getRootMenuList()}" var="menu" varStatus="idxStatus">

				<script type="text/javascript">genMenuSub("${menu.id}");</script>
			</c:forEach>
		</div>
	</div>
</div>

<main>

	<div class="container-fluid">
		<div class="row">

			<div id="_mainTabs" class="mini-tabs" activeIndex="0" style="width:100%;height:1000px;"
				 plain="false" onactivechanged="onTabsActiveChanged" onbeforecloseclick="onTabsBeforeClose"  contextMenu="#_tabsMenu"
			>
				<div title="首页" id="_tabHome" name="_tabHome" url="${ctx}/sys/home" iconCls="fa fa-home" >
				</div>
			</div>

		</div>

	</div>
</main>
<ul id="_tabsMenu" class="mini-contextmenu"   onbeforeopen="onBeforeOpen">
	<li onclick="refreshTab">刷新</li>
	<li onclick="closeTab">关闭标签页</li>
	<li onclick="closeAllBut">关闭其他标签页</li>
	<li onclick="closeAll">关闭所有标签页</li>
</ul>

</body>


<script src="${ctxStatic}/templates/1/js/vendor/jquery-3.3.1.min.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/bootstrap.bundle.min.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/Chart.bundle.min.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/chartjs-plugin-datalabels.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/moment.min.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/fullcalendar.min.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/datatables.min.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/perfect-scrollbar.min.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/progressbar.min.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/jquery.barrating.min.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/select2.full.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/nouislider.min.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/bootstrap-datepicker.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/Sortable.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/mousetrap.min.js"></script>
<script src="${ctxStatic}/templates/1/js/vendor/glide.min.js"></script>
<script src="${ctxStatic}/templates/1/js/dore.script.js"></script>
<script src="${ctxStatic}/templates/1/js/scripts.js"></script>

<script type="text/javascript">
	mini.parse();
	var _mainMenuId="${fns:getConfig('sys.defaultMenuId')}";//'91';//主业id务系统
	var _currMenuId=null;//当前选中一级菜单id
	_mainTabs = mini.get("_mainTabs");
	var currentTab = null;
	//var firstCheckRootMenu = mini.get("_rootMenuItem_"+_mainMenuId);
	//var _leftMenuTree = null;
	//var _main_splitter = mini.get("_main_splitter");
	//if(objIsNotNull(firstCheckRootMenu)){
	//	onRootMenuClick(firstCheckRootMenu,_mainMenuId);
	//}
	var homeLoaded=false;
	$(".loading").fadeOut();
	//var layoutMain=mini.get("layout1");
	//layoutMain.show ( );
	var _tabsMenu=mini.get("_tabsMenu");
	//_tabsMenu.show ( );

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
				tab.title = node.name;
				tab.showCloseButton = true;
				if(objIsNotNull(node.icon))
				   tab.iconCls = 'fa '+node.icon.replace('icon-','fa-');
				if(objIsNotNull(_currMenuId))
					tab['menuId'] = _currMenuId;
				if(node.href.indexOf( '://')>=0){
					tab.url = node.href;
				}else{
					tab.url = '${ctx}'+node.href;
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
		// if(objIsNotNull(_main_splitter)&&objIsNotNull(_main_splitter.getPane(1))){
		// 	if(_main_splitter.getPane(1).expanded){
		// 		if(isCloseTree=='1'){
		// 			_main_splitter.collapsePane(1);
		//
		// 		}
		// 	}else{
		// 		if(isCloseTree=='0'||objIsNull(node.isCloseTree)){
		// 			_main_splitter.expandPane(1);
		//
		// 		}
		// 	}
		// }
	}
	function onNodeSelect(e) {
		var node = e.node;
		var isLeaf = e.isLeaf;

		//if (isLeaf) {
		if (objIsNotNull(node.href) ) {
			showTab(node);
		}
	}
	function onNodeSelectStr(str) {
		var node =  encodeStrToJson(str); ;
          console.log(node);
		//if (isLeaf) {
		if (objIsNotNull(node.href) ) {
			showTab(node);
		}
	}
	function onNodeSelectNew(node) {

		console.log(node);
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
			//_main_splitter.hidePane(1);
			tabs.reloadTab(tab);
		}else{
			//_main_splitter.showPane(1);
		}
		if (tab && tab._nodeid) {
			_currMenuId=tab['menuId'];
			//_leftMenuTree = mini.get("_leftTree_"+_currMenuId);
			// if( objIsNotNull(_leftMenuTree)){
			// 	var node = _leftMenuTree.getNode(tab._nodeid);
			// 	if (node && !_leftMenuTree.isSelectedNode(node)) {
			// 		_leftMenuTree.selectNode(node);
			// 		processCollapsePane(node.isCloseTree);
			// 	}
			// 	if( !_leftMenuTree.getVisible())
			// 		showTree(_leftMenuTree);
			// }
			// var currMenuItem = mini.get("_rootMenuItem_"+_currMenuId);
			// if( objIsNotNull(currMenuItem)){
			// 	var  controls = mini.getsbyName("_rootMenuItem","_rootMenu");
			// 	$.each(controls,function(i,item){
			// 		if(objIsNotNull(item)) {
			// 			item.set({checked: false});
			// 		}
			//
			// 	});
			// 	currMenuItem.set({checked:true});
			// }


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

	function openUserInfo( ) {

		newTabPage("我的信息",  "${ctx}/sys/user/info", true,"info","openUserInfo");

	}
	function modifyUserPassword(  ) {

		newTabPage("修改密码",  "${ctx}/sys/user/modifyPwd", true,"info","modifyUserPassword");

	}
</script>


</html>