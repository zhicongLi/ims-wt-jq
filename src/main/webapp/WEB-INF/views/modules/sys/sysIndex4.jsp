<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@  include file="/WEB-INF/views/include/taglib.jsp"%>
<%@  include  file="/WEB-INF/views/include/head.jsp" %>

<html class="fixed has-top-menu has-left-sidebar-half">
<head>


	<title><%--${fns:getConfig('productName')}--%>智能安全管理系统</title>
	<meta charset="UTF-8">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Vendor CSS -->
	<link rel="stylesheet" href="${ctxStatic}/templates/4/vendor/bootstrap/css/bootstrap.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/4/vendor/animate/animate.css">

	<link rel="stylesheet" href="${ctxStatic}/templates/4/vendor/font-awesome/css/all.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/4/vendor/magnific-popup/magnific-popup.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/4/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.css" />

	<!-- Specific Page Vendor CSS -->
	<link rel="stylesheet" href="${ctxStatic}/templates/4/vendor/jquery-ui/jquery-ui.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/4/vendor/jquery-ui/jquery-ui.theme.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/4/vendor/bootstrap-multiselect/css/bootstrap-multiselect.css" />
	<link rel="stylesheet" href="${ctxStatic}/templates/4/vendor/morris/morris.css" />

	<!-- Theme CSS -->
	<link rel="stylesheet" href="${ctxStatic}/templates/4/css/theme.css" />

	<!-- Skin CSS -->
	<link rel="stylesheet" href="${ctxStatic}/templates/4/css/skins/default.css" />

	<!-- Theme Custom CSS -->
	<link rel="stylesheet" href="${ctxStatic}/templates/4/css/custom.css">
	<link rel="stylesheet" href="${ctxStatic}/templates/4/master/style-switcher/style-switcher.css">

	<!-- Head Libs -->
	<script src="${ctxStatic}/templates/4/vendor/modernizr/modernizr.js"></script>


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
					// if(node.id=='117'){
					// 	console.log('117:');
					// 	console.log(node);
					// }
				});

				this.tree = root;
				console.log(this.tree);
			}

			build(rootId,topMenu) {
				console.log('topMenu1');
				console.log(topMenu);
				// buildChildren 和 buildNode 是双函数的递归实现
				return this.buildChildren(this.tree,rootId,false,topMenu);
			}

			/**
			 * 处理子节点
			 */
			buildChildren(parent,rootId,subMenu,topMenu) {


				if(subMenu){


					var $ul2 = $('<ul class="nav nav-children">');
		                       if(topMenu==true){

						$ul2 = $('<ul class="dropdown-menu">');
					}
					parent.children
							.map(node => this.buildNode(node,topMenu))
							.forEach(node => $ul2.append(node))

					;
					return $ul2;
				}else{
					var $ul = $('#'+rootId);

					parent.children
							.map(node => this.buildNode(node,topMenu))
							.forEach(node => $ul.append(node))

					;
					return $ul;
				}


			}

			/**
			 * 处理节点，若有子节点则调用 buildChildren 生成子树
			 */
			buildNode(node,topMenu) {
				var $li=null ;
				var icon_class=node.icon;
				if(objIsNotNull(icon_class)){
					icon_class='fa '+icon_class.replace('icon-','fa-');
				}
				//存在子节点
				if (node.children && node.children.length) {
                                        var liClass='class="nav-parent"';
					var aClass='';
                                        if(topMenu==true){
					  liClass='class="dropdown-submenu"';
				          aClass='class="nav-link"';
					}
					if(objIsNotNull(icon_class)) {
						$li = $('<li '+liClass+' >').append(
								$('<a '+aClass+' href="#" >')
										.append($('<i class="' + icon_class + '" aria-hidden="true" ></i>'))
										.append($('<span>').text(node.name || ""))
										.attr("href", node.href || "#")
						);
					}else{
						$li = $('<li '+liClass+' >').append(
								$('<a '+aClass+' href="#" >')
										.append($('<span>').text(node.name || ""))
										.attr("href", node.href || "#")
						);
					}
					;
					$li.append(this.buildChildren(node,node.id,true,topMenu));
				} else{
	                                
					 var aClass='';
                                        if(topMenu==true){
					  
					  aClass='class="nav-link"';
					}			
				

					if(objIsNotNull(icon_class)) {
						$li = $('<li  >').append(
								$('<a '+aClass+' >')
										.append($('<i class="' + icon_class + '" ></i>'))
										.text(node.name || "")
										.attr("href", 'javascript:onNodeSelectNew(' + JSON.stringify(node).replace(/'/g, '&quot;') + ');')
						);
					}else{
						$li = $('<li >').append(
								$('<a '+aClass+' >')
										.text(node.name || "")
										.attr("href", 'javascript:onNodeSelectNew(' + JSON.stringify(node).replace(/'/g, '&quot;') + ');')
						);
					}
				}
				return $li;
			}
		}

		function genMenuSub(parentId  ){



			var res='';
			$.ajax({
				url: baseUrl+"/ims-ext/sys/sysMenu/menuList?parentId="+parentId,
				async:false,
				success: function (text) {
					//alert(text);
					var o = mini.decode(text);
					//console.log(o);
					const treeBuilder = new TreeBuilder(o);
					treeBuilder.build("_leftMenu");

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
			///top menu
			$.ajax({
				url: baseUrl+"/ims-ext/sys/sysMenu/menuList?parentId=79",

				async:true,
				success: function (text) {
					//alert(text);
					var o = mini.decode(text);
					//console.log(o);
					const treeBuilderTop = new TreeBuilder(o);
					treeBuilderTop.build("_topMenu",true);

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
			$.ajax({
				url: baseUrl+"/ims-ext/sys/sysMenu/menuList?parentId=2",

				async:true,
				success: function (text) {
					//alert(text);
					var o = mini.decode(text);
					//console.log(o);
					const treeBuilderTop2 = new TreeBuilder(o);
					treeBuilderTop2.build("_topMenu",true);

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

<body>
<section class="body">

	<!-- start: header -->
	<header class="header header-nav-menu">
		<div class="logo-container">
			<a href="javascript:;" class="logo">
				<img src="${ctxStatic}/images/logo.png" width="145" height="40" alt="logo" />
			</a>
			<div class="d-md-none toggle-sidebar-left d-lg-none" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
				<i class="fas fa-bars" aria-label="Toggle sidebar"></i>
			</div>
			<button class="btn header-btn-collapse-nav d-lg-none" data-toggle="collapse" data-target=".header-nav">
				<i class="fas fa-bars"></i>
			</button>

			<!-- start: header nav menu -->
			<div class="header-nav collapse">
				<div class="header-nav-main header-nav-main-effect-1 header-nav-main-sub-effect-1">
					<nav>
						<ul class="nav nav-pills" id="mainNav">
							<li class="">
								<a class="nav-link" href="layouts-default.html">
									领导驾驶舱
								</a>
							</li>
							<li class="dropdown active">
								<a class="nav-link dropdown-toggle" href="#">
									系统管理
								</a>
								<ul class="dropdown-menu"  id="_topMenu">

								</ul>
							</li>
							<li class="dropdown">
								<a class="nav-link dropdown-toggle" href="#">
									快捷操作
								</a>
								<ul class="dropdown-menu">
									<li>
										<a class="nav-link" href="pages-signup.html">
											Sign Up
										</a>
									</li>
									<li>
										<a class="nav-link" href="pages-signin.html">
											Sign In
										</a>
									</li>
									<li>
										<a class="nav-link" href="pages-recover-password.html">
											Recover Password
										</a>
									</li>
									<li>
										<a class="nav-link" href="pages-lock-screen.html">
											Locked Screen
										</a>
									</li>
									<li>
										<a class="nav-link" href="pages-user-profile.html">
											User Profile
										</a>
									</li>
									<li>
										<a class="nav-link" href="pages-session-timeout.html">
											Session Timeout
										</a>
									</li>
									<li>
										<a class="nav-link" href="pages-calendar.html">
											Calendar
										</a>
									</li>
									<li>
										<a class="nav-link" href="pages-timeline.html">
											Timeline
										</a>
									</li>
									<li>
										<a class="nav-link" href="pages-media-gallery.html">
											Media Gallery
										</a>
									</li>
									<li>
										<a class="nav-link" href="pages-invoice.html">
											Invoice
										</a>
									</li>
									<li>
										<a class="nav-link" href="pages-blank.html">
											Blank Page
										</a>
									</li>
									<li>
										<a class="nav-link" href="pages-404.html">
											404
										</a>
									</li>
									<li>
										<a class="nav-link" href="pages-500.html">
											500
										</a>
									</li>
									<li>
										<a class="nav-link" href="pages-log-viewer.html">
											Log Viewer
										</a>
									</li>
									<li>
										<a class="nav-link" href="pages-search-results.html">
											Search Results
										</a>
									</li>
								</ul>
							</li>
							<li class="dropdown dropdown-mega">
								<a class="nav-link dropdown-toggle" href="#">应用中心</a>
								<ul class="dropdown-menu">
									<li>
										<div class="dropdown-mega-content">
											<div class="row">
												<div class="col-lg-3">
													<ul class="dropdown-mega-sub-nav">
														<li>
															<a class="nav-link" href="ui-elements-typography.html">
																Typography
															</a>
														</li>
														<li>
															<a class="nav-link" href="#">
																Icons <span class="mega-sub-nav-toggle toggled float-right" data-toggle="collapse" data-target=".mega-sub-nav-sub-menu-1"></span>
															</a>
															<ul class="dropdown-mega-sub-nav mega-sub-nav-sub-menu-1 collapse in">
																<li>
																	<a class="nav-link" href="ui-elements-icons-elusive.html">
																		Elusive
																	</a>
																</li>
																<li>
																	<a class="nav-link" href="ui-elements-icons-font-awesome.html">
																		Font Awesome
																	</a>
																</li>
																<li>
																	<a class="nav-link" href="ui-elements-icons-line-icons.html">
																		Line Icons
																	</a>
																</li>
																<li>
																	<a class="nav-link" href="ui-elements-icons-meteocons.html">
																		Meteocons
																	</a>
																</li>
															</ul>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-tabs.html">
																Tabs
															</a>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-cards.html">
																Cards
															</a>
														</li>
													</ul>
												</div>
												<div class="col-lg-3">
													<ul class="dropdown-mega-sub-nav">
														<li>
															<a class="nav-link" href="ui-elements-widgets.html">
																Widgets
															</a>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-portlets.html">
																Portlets
															</a>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-buttons.html">
																Buttons
															</a>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-alerts.html">
																Alerts
															</a>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-notifications.html">
																Notifications
															</a>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-modals.html">
																Modals
															</a>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-lightbox.html">
																Lightbox
															</a>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-progressbars.html">
																Progress Bars
															</a>
														</li>
													</ul>
												</div>
												<div class="col-lg-3">
													<ul class="dropdown-mega-sub-nav">
														<li>
															<a class="nav-link" href="ui-elements-sliders.html">
																Sliders
															</a>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-carousels.html">
																Carousels
															</a>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-accordions.html">
																Accordions
															</a>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-toggles.html">
																Toggles
															</a>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-nestable.html">
																Nestable
															</a>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-tree-view.html">
																Tree View
															</a>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-scrollable.html">
																Scrollable
															</a>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-grid-system.html">
																Grid System
															</a>
														</li>
													</ul>
												</div>
												<div class="col-lg-3">
													<ul class="dropdown-mega-sub-nav">
														<li>
															<a class="nav-link" href="ui-elements-charts.html">
																Charts
															</a>
														</li>
														<li>
															<a class="nav-link" href="#">
																Animations <span class="mega-sub-nav-toggle float-right" data-toggle="collapse" data-target=".mega-sub-nav-sub-menu-2"></span>
															</a>
															<ul class="dropdown-mega-sub-nav mega-sub-nav-sub-menu-2 collapse">
																<li>
																	<a class="nav-link" href="ui-elements-animations-appear.html">
																		Appear
																	</a>
																</li>
																<li>
																	<a class="nav-link" href="ui-elements-animations-hover.html">
																		Hover
																	</a>
																</li>
															</ul>
														</li>
														<li>
															<a class="nav-link" href="#">
																Loading <span class="mega-sub-nav-toggle float-right" data-toggle="collapse" data-target=".mega-sub-nav-sub-menu-3"></span>
															</a>
															<ul class="dropdown-mega-sub-nav mega-sub-nav-sub-menu-3 collapse">
																<li>
																	<a class="nav-link" href="ui-elements-loading-overlay.html">
																		Overlay
																	</a>
																</li>
																<li>
																	<a class="nav-link" href="ui-elements-loading-progress.html">
																		Progress
																	</a>
																</li>
															</ul>
														</li>
														<li>
															<a class="nav-link" href="ui-elements-extra.html">
																Extra
															</a>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</li>
							<li class="dropdown d-md-none">
								<a href="#" class="nav-link dropdown-toggle">More</a>
								<ul class="dropdown-menu">
									<li class="dropdown-submenu">
										<a class="nav-link" href="#">
											Forms
										</a>
										<ul class="dropdown-menu">
											<li>
												<a class="nav-link" href="forms-basic.html">
													Basic
												</a>
											</li>
											<li>
												<a class="nav-link" href="forms-advanced.html">
													Advanced
												</a>
											</li>
											<li>
												<a class="nav-link" href="forms-validation.html">
													Validation
												</a>
											</li>
											<li>
												<a class="nav-link" href="forms-layouts.html">
													Layouts
												</a>
											</li>
											<li>
												<a class="nav-link" href="forms-wizard.html">
													Wizard
												</a>
											</li>
											<li>
												<a class="nav-link" href="forms-code-editor.html">
													Code Editor
												</a>
											</li>
										</ul>
									</li>
									<li class="dropdown-submenu">
										<a class="nav-link" href="#">
											Tables
										</a>
										<ul class="dropdown-menu">
											<li>
												<a class="nav-link" href="tables-basic.html">
													Basic
												</a>
											</li>
											<li>
												<a class="nav-link" href="tables-advanced.html">
													Advanced
												</a>
											</li>
											<li>
												<a class="nav-link" href="tables-responsive.html">
													Responsive
												</a>
											</li>
											<li>
												<a class="nav-link" href="tables-editable.html">
													Editable
												</a>
											</li>
											<li>
												<a class="nav-link" href="tables-ajax.html">
													Ajax
												</a>
											</li>
											<li>
												<a class="nav-link" href="tables-pricing.html">
													Pricing
												</a>
											</li>
										</ul>
									</li>
									<li>
										<a class="nav-link" href="mailbox-folder.html">
											Mailbox
											<span class="float-right badge badge-primary">182</span>
										</a>
									</li>
									<li class="dropdown-submenu">
										<a class="nav-link" href="#">
											Maps
										</a>
										<ul class="dropdown-menu">
											<li>
												<a class="nav-link" href="maps-google-maps.html">
													Basic
												</a>
											</li>
											<li>
												<a class="nav-link" href="maps-google-maps-builder.html">
													Map Builder
												</a>
											</li>
											<li>
												<a class="nav-link" href="maps-vector.html">
													Vector
												</a>
											</li>
										</ul>
									</li>
									<li class="dropdown-submenu">
										<a class="nav-link" href="#">
											Extra
										</a>
										<ul class="dropdown-menu">
											<li>
												<a class="nav-link" href="extra-changelog.html">
													Changelog
												</a>
											</li>
											<li>
												<a class="nav-link" href="extra-ajax-made-easy.html">
													Ajax Made Easy
												</a>
											</li>
										</ul>
									</li>
									<li>
										<a class="nav-link" href="http://themeforest.net/item/porto-responsive-html5-template/4106987?ref=Okler">
											Front-End <span class="tip tip-dark">hot</span><em class="not-included">(Not Included)</em>
										</a>
									</li>
									<li class="dropdown-submenu">
										<a class="nav-link" href="#">
											Menu Levels
										</a>
										<ul class="dropdown-menu">
											<li>
												<a class="nav-link">
													First Level
												</a>
											</li>
											<li class="dropdown-submenu">
												<a class="nav-link" href="#">
													Second Level
												</a>
												<ul class="dropdown-menu">
													<li>
														<a class="nav-link">
															Second Level Link #1
														</a>
													</li>
													<li>
														<a class="nav-link">
															Second Level Link #2
														</a>
													</li>
													<li class="dropdown-submenu">
														<a class="nav-link" href="#">
															Third Level
														</a>
														<ul class="dropdown-menu">
															<li>
																<a class="nav-link">
																	Third Level Link #1
																</a>
															</li>
															<li>
																<a class="nav-link">
																	Third Level Link #2
																</a>
															</li>
														</ul>
													</li>
												</ul>
											</li>
										</ul>
									</li>
								</ul>
							</li>

						</ul>
					</nav>
				</div>
			</div>
			<!-- end: header nav menu -->
		</div>

		<!-- start: search & user box -->
		<div class="header-right">

			<a class="btn search-toggle d-none d-md-inline-block d-xl-none" data-toggle-class="active" data-target=".search"><i class="fas fa-search"></i></a>
			<form action="pages-search-results.html" class="search nav-form d-none d-xl-inline-block">
				<div class="input-group">
					<input type="text" class="form-control" name="q" id="q" placeholder="搜索...">
					<span class="input-group-append">
								<button class="btn btn-default" type="submit"><i class="fas fa-search"></i></button>
							</span>
				</div>
			</form>

			<span class="separator"></span>

			<ul class="notifications">
				<li>
					<a href="#" class="dropdown-toggle notification-icon" data-toggle="dropdown">
						<i class="fas fa-tasks"></i>
						<span class="badge">3</span>
					</a>

					<div class="dropdown-menu notification-menu large">
						<div class="notification-title">
							<span class="float-right badge badge-default">3</span>
							Tasks
						</div>

						<div class="content">
							<ul>
								<li>
									<p class="clearfix mb-1">
										<span class="message float-left">Generating Sales Report</span>
										<span class="message float-right text-dark">60%</span>
									</p>
									<div class="progress progress-xs light">
										<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
									</div>
								</li>

								<li>
									<p class="clearfix mb-1">
										<span class="message float-left">Importing Contacts</span>
										<span class="message float-right text-dark">98%</span>
									</p>
									<div class="progress progress-xs light">
										<div class="progress-bar" role="progressbar" aria-valuenow="98" aria-valuemin="0" aria-valuemax="100" style="width: 98%;"></div>
									</div>
								</li>

								<li>
									<p class="clearfix mb-1">
										<span class="message float-left">Uploading something big</span>
										<span class="message float-right text-dark">33%</span>
									</p>
									<div class="progress progress-xs light mb-1">
										<div class="progress-bar" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100" style="width: 33%;"></div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<a href="#" class="dropdown-toggle notification-icon" data-toggle="dropdown">
						<i class="fas fa-envelope"></i>
						<span class="badge">4</span>
					</a>

					<div class="dropdown-menu notification-menu">
						<div class="notification-title">
							<span class="float-right badge badge-default">230</span>
							Messages
						</div>

						<div class="content">
							<ul>
								<li>
									<a href="#" class="clearfix">
										<figure class="image">
											<img src="img/userinfo.jpg.jpg" alt="Joseph Doe Junior" class="rounded-circle" />
										</figure>
										<span class="title">Joseph Doe</span>
										<span class="message">Lorem ipsum dolor sit.</span>
									</a>
								</li>
								<li>
									<a href="#" class="clearfix">
										<figure class="image">
											<img src="img/!sample-user.jpg" alt="Joseph Junior" class="rounded-circle" />
										</figure>
										<span class="title">Joseph Junior</span>
										<span class="message truncate">Truncated message. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet lacinia orci. Proin vestibulum eget risus non luctus. Nunc cursus lacinia lacinia. Nulla molestie malesuada est ac tincidunt. Quisque eget convallis diam, nec venenatis risus. Vestibulum blandit faucibus est et malesuada. Sed interdum cursus dui nec venenatis. Pellentesque non nisi lobortis, rutrum eros ut, convallis nisi. Sed tellus turpis, dignissim sit amet tristique quis, pretium id est. Sed aliquam diam diam, sit amet faucibus tellus ultricies eu. Aliquam lacinia nibh a metus bibendum, eu commodo eros commodo. Sed commodo molestie elit, a molestie lacus porttitor id. Donec facilisis varius sapien, ac fringilla velit porttitor et. Nam tincidunt gravida dui, sed pharetra odio pharetra nec. Duis consectetur venenatis pharetra. Vestibulum egestas nisi quis elementum elementum.</span>
									</a>
								</li>
								<li>
									<a href="#" class="clearfix">
										<figure class="image">
											<img src="img/!sample-user.jpg" alt="Joe Junior" class="rounded-circle" />
										</figure>
										<span class="title">Joe Junior</span>
										<span class="message">Lorem ipsum dolor sit.</span>
									</a>
								</li>
								<li>
									<a href="#" class="clearfix">
										<figure class="image">
											<img src="img/!sample-user.jpg" alt="Joseph Junior" class="rounded-circle" />
										</figure>
										<span class="title">Joseph Junior</span>
										<span class="message">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet lacinia orci. Proin vestibulum eget risus non luctus. Nunc cursus lacinia lacinia. Nulla molestie malesuada est ac tincidunt. Quisque eget convallis diam.</span>
									</a>
								</li>
							</ul>

							<hr />

							<div class="text-right">
								<a href="#" class="view-more">View All</a>
							</div>
						</div>
					</div>
				</li>
				<li>
					<a href="#" class="dropdown-toggle notification-icon" data-toggle="dropdown">
						<i class="fas fa-bell"></i>
						<span class="badge">3</span>
					</a>

					<div class="dropdown-menu notification-menu">
						<div class="notification-title">
							<span class="float-right badge badge-default">3</span>
							Alerts
						</div>

						<div class="content">
							<ul>
								<li>
									<a href="#" class="clearfix">
										<div class="image">
											<i class="fas fa-thumbs-down bg-danger"></i>
										</div>
										<span class="title">Server is Down!</span>
										<span class="message">Just now</span>
									</a>
								</li>
								<li>
									<a href="#" class="clearfix">
										<div class="image">
											<i class="fas fa-lock bg-warning"></i>
										</div>
										<span class="title">User Locked</span>
										<span class="message">15 minutes ago</span>
									</a>
								</li>
								<li>
									<a href="#" class="clearfix">
										<div class="image">
											<i class="fas fa-signal bg-success"></i>
										</div>
										<span class="title">Connection Restaured</span>
										<span class="message">10/10/2017</span>
									</a>
								</li>
							</ul>

							<hr />

							<div class="text-right">
								<a href="#" class="view-more">View All</a>
							</div>
						</div>
					</div>
				</li>
			</ul>

			<span class="separator"></span>

			<div id="userbox" class="userbox">
				<a href="#" data-toggle="dropdown">
					<figure class="profile-picture">
						<img src="${ctxStatic}/images/userinfo.jpg" alt="${fns:getUser().name}" class="rounded-circle" data-lock-picture="img/!logged-user.jpg" />
					</figure>
					<div class="profile-info" data-lock-name="John Doe" data-lock-email="johndoe@okler.com">
						<span class="name">${fns:getUser().name}</span>
						<span class="role"></span>
					</div>

					<i class="fa custom-caret"></i>
				</a>

				<div class="dropdown-menu">
					<ul class="list-unstyled">
						<li class="divider"></li>
						<li>
							<a role="menuitem" tabindex="-1" href="javascript:openUserInfo();"><i class="fas fa-user"></i> 我的信息</a>
						</li>
						<li>
							<a role="menuitem" tabindex="-1" href="javascript:modifyUserPassword();" data-lock-screen="true"><i class="fas fa-lock"></i> 修改密码</a>
						</li>
						<li>
							<a role="menuitem" tabindex="-1" href="${ctx}/logout"><i class="fas fa-power-off"></i> 注销</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- end: search & user box -->
	</header>
	<!-- end: header -->

	<div class="inner-wrapper">
		<!-- start: sidebar -->
		<aside id="sidebar-left" class="sidebar-left">

			<div class="sidebar-header">
				<div class="sidebar-title" id="_mainMenuText">
					电力营销
				</div>
				<div class="sidebar-toggle d-none d-md-block" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
					<i class="fas fa-bars" aria-label="Toggle sidebar"></i>
				</div>
			</div>

			<div class="nano">
				<div class="nano-content">
					<nav id="menu" class="nav-main" role="navigation">

						<ul class="nav nav-main"  id="_leftMenu">


						</ul>
					</nav>

					<hr class="separator" />

					<div class="sidebar-widget widget-tasks">
						<div class="widget-header">
							<h6>常用操作</h6>
							<div class="widget-toggle">+</div>
						</div>
						<div class="widget-content">
							<ul class="list-unstyled m-0">
								<li><a href="#">网上营业厅</a></li>
								<li><a href="#">客户画像</a></li>
								<li><a href="#">合同管理</a></li>
							</ul>
						</div>
					</div>

					<hr class="separator" />

					<div class="sidebar-widget widget-stats">
						<div class="widget-header">
							<h6>统计信息</h6>
							<div class="widget-toggle">+</div>
						</div>
						<div class="widget-content">
							<ul>
								<li>
									<span class="stats-title">测试1</span>
									<span class="stats-complete">85%</span>
									<div class="progress">
										<div class="progress-bar progress-bar-primary progress-without-number" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%;">
											<span class="sr-only">85% Complete</span>
										</div>
									</div>
								</li>
								<li>
									<span class="stats-title">测试2</span>
									<span class="stats-complete">70%</span>
									<div class="progress">
										<div class="progress-bar progress-bar-primary progress-without-number" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%;">
											<span class="sr-only">70% Complete</span>
										</div>
									</div>
								</li>
								<li>
									<span class="stats-title">测试3</span>
									<span class="stats-complete">2%</span>
									<div class="progress">
										<div class="progress-bar progress-bar-primary progress-without-number" role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100" style="width: 2%;">
											<span class="sr-only">2% Complete</span>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<script>
					// Maintain Scroll Position
					if (typeof localStorage !== 'undefined') {
						if (localStorage.getItem('sidebar-left-position') !== null) {
							var initialPosition = localStorage.getItem('sidebar-left-position'),
									sidebarLeft = document.querySelector('#sidebar-left .nano-content');

							sidebarLeft.scrollTop = initialPosition;
						}
					}
				</script>


			</div>

		</aside>
		<!-- end: sidebar -->

		<section role="main" class="content-body">
<%--			<header class="page-header">--%>
<%--				<h2>Two Navigations Layout</h2>--%>

<%--				<div class="right-wrapper text-right">--%>
<%--					<ol class="breadcrumbs">--%>
<%--						<li>--%>
<%--							<a href="index.html">--%>
<%--								<i class="fas fa-home"></i>--%>
<%--							</a>--%>
<%--						</li>--%>
<%--						<li><span>Layouts</span></li>--%>
<%--						<li><span>Two Navigations</span></li>--%>
<%--					</ol>--%>

<%--					<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fas fa-chevron-left"></i></a>--%>
<%--				</div>--%>
<%--			</header>--%>

			<!-- start: page -->
			<div class="row">
				<div id="_mainTabs" class="mini-tabs" activeIndex="0" style="width:100%;height:800px;"
					 plain="false" onactivechanged="onTabsActiveChanged" onbeforecloseclick="onTabsBeforeClose"  contextMenu="#_tabsMenu"
				>
					<div title="首页" id="_tabHome" name="_tabHome" url="${ctx}/sys/home" iconCls="fa fa-home" >
					</div>
				</div>
			</div>


			<!-- end: page -->
		</section>
	</div>

	<aside id="sidebar-right" class="sidebar-right">
		<div class="nano">
			<div class="nano-content">
				<a href="#" class="mobile-close d-md-none">
					Collapse <i class="fas fa-chevron-right"></i>
				</a>

				<div class="sidebar-right-wrapper">

					<div class="sidebar-widget widget-calendar">
						<h6>Upcoming Tasks</h6>
						<div data-plugin-datepicker data-plugin-skin="dark"></div>

						<ul>
							<li>
								<time datetime="2017-04-19T00:00+00:00">04/19/2017</time>
								<span>Company Meeting</span>
							</li>
						</ul>
					</div>

					<div class="sidebar-widget widget-friends">
						<h6>Friends</h6>
						<ul>
							<li class="status-online">
								<figure class="profile-picture">
									<img src="img/!sample-user.jpg" alt="Joseph Doe" class="rounded-circle">
								</figure>
								<div class="profile-info">
									<span class="name">Joseph Doe Junior</span>
									<span class="title">Hey, how are you?</span>
								</div>
							</li>
							<li class="status-online">
								<figure class="profile-picture">
									<img src="img/!sample-user.jpg" alt="Joseph Doe" class="rounded-circle">
								</figure>
								<div class="profile-info">
									<span class="name">Joseph Doe Junior</span>
									<span class="title">Hey, how are you?</span>
								</div>
							</li>
							<li class="status-offline">
								<figure class="profile-picture">
									<img src="img/!sample-user.jpg" alt="Joseph Doe" class="rounded-circle">
								</figure>
								<div class="profile-info">
									<span class="name">Joseph Doe Junior</span>
									<span class="title">Hey, how are you?</span>
								</div>
							</li>
							<li class="status-offline">
								<figure class="profile-picture">
									<img src="img/!sample-user.jpg" alt="Joseph Doe" class="rounded-circle">
								</figure>
								<div class="profile-info">
									<span class="name">Joseph Doe Junior</span>
									<span class="title">Hey, how are you?</span>
								</div>
							</li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</aside>

</section>
<ul id="_tabsMenu" class="mini-contextmenu"   onbeforeopen="onBeforeOpen">
	<li onclick="refreshTab">刷新</li>
	<li onclick="closeTab">关闭标签页</li>
	<li onclick="closeAllBut">关闭其他标签页</li>
	<li onclick="closeAll">关闭所有标签页</li>
</ul>
<script type="text/javascript">
	mini.parse();
	var _mainMenuId="${fns:getConfig('sys.defaultMenuId')}";//'91';//主业id务系统
	var _mainMenuText="${fns:getConfig('sys.defaultMenuText')}";//'91';//主业id务系统
	genMenuSub(_mainMenuId);

	$("#_mainMenuText").html(_mainMenuText);
	var _currMenuId=null;//当前选中一级菜单id
	_mainTabs = mini.get("_mainTabs");
	var currentTab = null;
	//var firstCheckRootMenu = mini.get("_rootMenuItem_"+_mainMenuId);
	//var _leftMenuTree = null;
	//var _main_splitter = mini.get("_main_splitter");
	//if(objIsNotNull(firstCheckRootMenu)){
	//	onRootMenuClick(firstCheckRootMenu,_mainMenuId);
	//}
	var _defaultHomePage="${fns:getConfig('sys.defaultHomePage')}";
	var tabHome=_mainTabs.getTab('_tabHome');
	tabHome.url='${ctxRoot}'+_defaultHomePage;
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
		KTLayoutQuickUser.hide();
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
<!-- Vendor -->
<script src="${ctxStatic}/templates/4/vendor/jquery/jquery.js"></script>
<script src="${ctxStatic}/templates/4/vendor/jquery-cookie/jquery.cookie.js"></script>
<script src="${ctxStatic}/templates/4/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="${ctxStatic}/templates/4/vendor/popper/umd/popper.min.js"></script>
<script src="${ctxStatic}/templates/4/vendor/bootstrap/js/bootstrap.js"></script>
<script src="${ctxStatic}/templates/4/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${ctxStatic}/templates/4/vendor/common/common.js"></script>
<script src="${ctxStatic}/templates/4/vendor/nanoscroller/nanoscroller.js"></script>
<script src="${ctxStatic}/templates/4/vendor/magnific-popup/jquery.magnific-popup.js"></script>
<script src="${ctxStatic}/templates/4/vendor/jquery-placeholder/jquery.placeholder.js"></script>

<!-- Specific Page Vendor -->
<script src="${ctxStatic}/templates/4/vendor/jquery-ui/jquery-ui.js"></script>
<script src="${ctxStatic}/templates/4/vendor/jqueryui-touch-punch/jquery.ui.touch-punch.js"></script>
<script src="${ctxStatic}/templates/4/vendor/jquery-appear/jquery.appear.js"></script>
<%--<script src="${ctxStatic}/templates/4/vendor/bootstrap-multiselect/js/bootstrap-multiselect.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/jquery.easy-pie-chart/jquery.easypiechart.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/flot/jquery.flot.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/flot.tooltip/jquery.flot.tooltip.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/flot/jquery.flot.pie.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/flot/jquery.flot.categories.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/flot/jquery.flot.resize.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/jquery-sparkline/jquery.sparkline.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/raphael/raphael.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/morris/morris.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/gauge/gauge.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/snap.svg/snap.svg.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/liquid-meter/liquid.meter.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/jqvmap/jquery.vmap.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/jqvmap/data/jquery.vmap.sampledata.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/jqvmap/maps/jquery.vmap.world.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/jqvmap/maps/continents/jquery.vmap.africa.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/jqvmap/maps/continents/jquery.vmap.asia.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/jqvmap/maps/continents/jquery.vmap.australia.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/jqvmap/maps/continents/jquery.vmap.europe.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/jqvmap/maps/continents/jquery.vmap.north-america.js"></script>--%>
<%--<script src="${ctxStatic}/templates/4/vendor/jqvmap/maps/continents/jquery.vmap.south-america.js"></script>--%>
<script src="${ctxStatic}/templates/4/master/style-switcher/cssbeautify/cssbeautify.js"></script>
<script src="${ctxStatic}/templates/4/master/style-switcher/style.switcher.js" id="styleSwitcherScript" data-skin-src=""></script>

<!-- Theme Base, Components and Settings -->
<script src="${ctxStatic}/templates/4/js/theme.js"></script>

<!-- Theme Custom -->
<script src="${ctxStatic}/templates/4/js/custom.js"></script>

<!-- Theme Initialization Files -->
<script src="${ctxStatic}/templates/4/js/theme.init.js"></script>

<!-- Examples -->
<script src="${ctxStatic}/templates/4/js/examples/examples.header.menu.js"></script>
<%--<script src="${ctxStatic}/templates/4/js/examples/examples.dashboard.js"></script>--%>
</body>

<!--end::Body-->
</html>