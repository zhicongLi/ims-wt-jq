<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@  include file="/WEB-INF/views/include/taglib.jsp"%>
<%@  include  file="/WEB-INF/views/include/head.jsp" %>

<html>
<head>
	<style>
		/* Loading Spinner */
		.spinner{margin:0;width:70px;height:18px;margin:-35px 0 0 -9px;position:absolute;top:50%;left:50%;text-align:center}.spinner > div{width:18px;height:18px;background-color:#333;border-radius:100%;display:inline-block;-webkit-animation:bouncedelay 1.4s infinite ease-in-out;animation:bouncedelay 1.4s infinite ease-in-out;-webkit-animation-fill-mode:both;animation-fill-mode:both}.spinner .bounce1{-webkit-animation-delay:-.32s;animation-delay:-.32s}.spinner .bounce2{-webkit-animation-delay:-.16s;animation-delay:-.16s}@-webkit-keyframes bouncedelay{0%,80%,100%{-webkit-transform:scale(0.0)}40%{-webkit-transform:scale(1.0)}}@keyframes bouncedelay{0%,80%,100%{transform:scale(0.0);-webkit-transform:scale(0.0)}40%{transform:scale(1.0);-webkit-transform:scale(1.0)}}
	</style>

	<title>${fns:getConfig('productName')}</title>
	<meta charset="UTF-8">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/bootstrap/css/bootstrap.css">

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/animate.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/backgrounds.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/boilerplate.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/border-radius.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/grid.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/page-transitions.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/spacing.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/typography.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/utils.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/colors.css">

	<!-- ELEMENTS -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/badges.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/buttons.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/content-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/dashboard-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/forms.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/images.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/info-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/invoice.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/loading-indicators.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/menus.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/panel-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/response-messages.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/responsive-tables.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/ribbon.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/social-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/tables.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/tile-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/elements/timeline.css">



	<!-- ICONS -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/icons/fontawesome/fontawesome.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/icons/linecons/linecons.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/icons/spinnericon/spinnericon.css">


	<!-- WIDGETS -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/accordion-ui/accordion.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/calendar/calendar.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/carousel/carousel.css">

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/charts/justgage/justgage.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/charts/morris/morris.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/charts/piegage/piegage.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/charts/xcharts/xcharts.css">

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/chosen/chosen.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/colorpicker/colorpicker.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/datatable/datatable.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/datepicker/datepicker.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/datepicker-ui/datepicker.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/dialog/dialog.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/dropdown/dropdown.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/dropzone/dropzone.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/file-input/fileinput.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/input-switch/inputswitch.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/input-switch/inputswitch-alt.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/ionrangeslider/ionrangeslider.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/jcrop/jcrop.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/jgrowl-notifications/jgrowl.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/loading-bar/loadingbar.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/maps/vector-maps/vectormaps.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/markdown/markdown.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/modal/modal.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/multi-select/multiselect.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/multi-upload/fileupload.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/nestable/nestable.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/noty-notifications/noty.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/popover/popover.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/pretty-photo/prettyphoto.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/progressbar/progressbar.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/range-slider/rangeslider.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/slidebars/slidebars.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/slider-ui/slider.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/summernote-wysiwyg/summernote-wysiwyg.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/tabs-ui/tabs.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/theme-switcher/themeswitcher.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/timepicker/timepicker.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/tocify/tocify.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/tooltip/tooltip.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/touchspin/touchspin.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/uniform/uniform.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/wizard/wizard.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/widgets/xeditable/xeditable.css">

	<!-- SNIPPETS -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/chat.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/files-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/login-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/notification-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/progress-box.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/todo.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/user-profile.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/snippets/mobile-navigation.css">

	<!-- APPLICATIONS -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/applications/mailbox.css">

	<!-- Admin theme -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/themes/admin/layout.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/themes/admin/color-schemes/default.css">

	<!-- Components theme -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/themes/components/default.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/themes/components/border-radius.css">

	<!-- Admin responsive -->

	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/responsive-elements.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/templates/3/assets/helpers/admin-responsive.css">

	<!-- JS Core -->

	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/jquery-core.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/jquery-ui-core.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/jquery-ui-widget.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/jquery-ui-mouse.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/jquery-ui-position.js"></script>
	<!--<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/transition.js"></script>-->
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/modernizr.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-core/jquery-cookie.js"></script>





	<script type="text/javascript">
		$(window).load(function(){
			setTimeout(function() {
				$('#loading').fadeOut( 400, "linear" );
			}, 300);
		});

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
					if(node.id=='117'){
						console.log('117:');
						console.log(node);
					}
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


				if(subMenu){
					var $div = $(' <div class="menu-submenu">');

					var $ul2 = $('<ul class="menu-subnav">');
					$div.append('<i class="menu-arrow"></i>');
					$div.append($ul2);
					parent.children
							.map(node => this.buildNode(node))
							.forEach(node => $ul2.append(node))

					;
					return $div;
				}else{
					var $ul = $('#'+rootId);

					parent.children
							.map(node => this.buildNode(node))
							.forEach(node => $ul.append(node))

					;
					return $ul;
				}


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
				//存在子节点
				if (node.children && node.children.length) {


					$li = $('<li class="menu-item menu-item-submenu" aria-haspopup="true" data-menu-toggle="hover">').append(
							$('<a href="javascript:;" class="menu-link menu-toggle">')
									.append($('<span class="menu-icon">').append($('<i class="'+icon_class+'" ></i>')))
									.append($('<span class="menu-text">').text(node.name || ""))
									.append($('<i class="menu-arrow"></i>'))
									.attr("href", node.href || "#")
					)
					;
					$li.append(this.buildChildren(node,node.id,true));
				} else{
					$li = $('<li class="menu-item" aria-haspopup="true">').append(

							$('<a class="menu-link">')
									.append($('<span class="menu-icon">').append($('<i class="'+icon_class+'" ></i>')))
									.append($('<span class="menu-text">').text(node.name || ""))
									.attr("href", 'javascript:onNodeSelectNew('+JSON.stringify(node).replace(/'/g, '&quot;')+');')
					)
					;
				}
				return $li;
			}
		}

		function genMenuSub(parentId  ){



			var res='';
			$.ajax({
				url: baseUrl+"/sys/menu/menuList?parentId="+parentId,
				async:true,
				success: function (text) {
					//alert(text);
					var o = mini.decode(text);
					console.log(o);
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
			return res;
		}




	</script>
</head>

<body>
<div id="sb-site">
	<div class="sb-slidebar bg-black sb-left sb-style-overlay">
		<div class="scrollable-content scrollable-slim-sidebar">
			<div class="pad10A">
				<div class="divider-header">Online</div>
				<ul class="chat-box">
					<li>
						<div class="status-badge">
							<img class="img-circle" width="40" src="${ctxStatic}/templates/3/assets/image-resources/people/testimonial1.jpg" alt="">
							<div class="small-badge bg-green"></div>
						</div>
						<b>
							Grace Padilla
						</b>
						<p>On the other hand, we denounce...</p>
						<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i class="glyph-icon icon-comments-o"></i></a>
					</li>
					<li>
						<div class="status-badge">
							<img class="img-circle" width="40" src="${ctxStatic}/templates/3/assets/image-resources/people/testimonial2.jpg" alt="">
							<div class="small-badge bg-green"></div>
						</div>
						<b>
							Carl Gamble
						</b>
						<p>Dislike men who are so beguiled...</p>
						<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i class="glyph-icon icon-comments-o"></i></a>
					</li>
					<li>
						<div class="status-badge">
							<img class="img-circle" width="40" src="${ctxStatic}/templates/3/assets/image-resources/people/testimonial3.jpg" alt="">
							<div class="small-badge bg-green"></div>
						</div>
						<b>
							Michael Poole
						</b>
						<p>Of pleasure of the moment, so...</p>
						<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i class="glyph-icon icon-comments-o"></i></a>
					</li>
					<li>
						<div class="status-badge">
							<img class="img-circle" width="40" src="${ctxStatic}/templates/3/assets/image-resources/people/testimonial4.jpg" alt="">
							<div class="small-badge bg-green"></div>
						</div>
						<b>
							Bill Green
						</b>
						<p>That they cannot foresee the...</p>
						<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i class="glyph-icon icon-comments-o"></i></a>
					</li>
					<li>
						<div class="status-badge">
							<img class="img-circle" width="40" src="${ctxStatic}/templates/3/assets/image-resources/people/testimonial5.jpg" alt="">
							<div class="small-badge bg-green"></div>
						</div>
						<b>
							Cheryl Soucy
						</b>
						<p>Pain and trouble that are bound...</p>
						<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i class="glyph-icon icon-comments-o"></i></a>
					</li>
				</ul>
				<div class="divider-header">Idle</div>
				<ul class="chat-box">
					<li>
						<div class="status-badge">
							<img class="img-circle" width="40" src="${ctxStatic}/templates/3/assets/image-resources/people/testimonial6.jpg" alt="">
							<div class="small-badge bg-orange"></div>
						</div>
						<b>
							Jose Kramer
						</b>
						<p>Equal blame belongs to those...</p>
						<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i class="glyph-icon icon-comments-o"></i></a>
					</li>
					<li>
						<div class="status-badge">
							<img class="img-circle" width="40" src="${ctxStatic}/templates/3/assets/image-resources/people/testimonial7.jpg" alt="">
							<div class="small-badge bg-orange"></div>
						</div>
						<b>
							Dan Garcia
						</b>
						<p>Weakness of will, which is same...</p>
						<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i class="glyph-icon icon-comments-o"></i></a>
					</li>
					<li>
						<div class="status-badge">
							<img class="img-circle" width="40" src="${ctxStatic}/templates/3/assets/image-resources/people/testimonial8.jpg" alt="">
							<div class="small-badge bg-orange"></div>
						</div>
						<b>
							Edward Bridges
						</b>
						<p>These cases are perfectly simple...</p>
						<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i class="glyph-icon icon-comments-o"></i></a>
					</li>
				</ul>
				<div class="divider-header">Offline</div>
				<ul class="chat-box">
					<li>
						<div class="status-badge">
							<img class="img-circle" width="40" src="${ctxStatic}/templates/3/assets/image-resources/people/testimonial1.jpg" alt="">
							<div class="small-badge bg-red"></div>
						</div>
						<b>
							Randy Herod
						</b>
						<p>In a free hour, when our power...</p>
						<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i class="glyph-icon icon-comments-o"></i></a>
					</li>
					<li>
						<div class="status-badge">
							<img class="img-circle" width="40" src="${ctxStatic}/templates/3/assets/image-resources/people/testimonial2.jpg" alt="">
							<div class="small-badge bg-red"></div>
						</div>
						<b>
							Patricia Bagley
						</b>
						<p>when nothing prevents our being...</p>
						<a href="#" class="btn btn-md no-border radius-all-100 btn-black"><i class="glyph-icon icon-comments-o"></i></a>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="sb-slidebar bg-black sb-right sb-style-overlay">
		<div class="scrollable-content scrollable-slim-sidebar">
			<div class="pad15A">
				<a href="#" title="" data-toggle="collapse" data-target="#sidebar-toggle-1" class="popover-title">
					Cloud status
				</a>
				<div id="sidebar-toggle-1" class="collapse in">
					<div class="pad15A container">
						<div class="row">
							<div class="col-md-4">
								<div class="text-center font-gray pad5B text-transform-upr font-size-12">New visits</div>
								<div class="chart-alt-3 font-gray-dark" data-percent="55"><span>55</span>%</div>
							</div>
							<div class="col-md-4">
								<div class="text-center font-gray pad5B text-transform-upr font-size-12">Bounce rate</div>
								<div class="chart-alt-3 font-gray-dark" data-percent="46"><span>46</span>%</div>
							</div>
							<div class="col-md-4">
								<div class="text-center font-gray pad5B text-transform-upr font-size-12">Server load</div>
								<div class="chart-alt-3 font-gray-dark" data-percent="92"><span>92</span>%</div>
							</div>
						</div>
						<div class="divider mrg15T mrg15B"></div>
						<div class="text-center">
							<a href="#" class="btn center-div btn-info mrg5T btn-sm text-transform-upr updateEasyPieChart">
								<i class="glyph-icon icon-refresh"></i>
								Update charts
							</a>
						</div>
					</div>
				</div>

				<div class="clear"></div>

				<a href="#" title="" data-toggle="collapse" data-target="#sidebar-toggle-6" class="popover-title">
					Latest transfers
				</a>
				<div id="sidebar-toggle-6" class="collapse in">

					<ul class="files-box">
						<li>
							<i class="files-icon glyph-icon font-red icon-file-archive-o"></i>
							<div class="files-content">
								<b>blog_export.zip</b>
								<div class="files-date">
									<i class="glyph-icon icon-clock-o"></i>
									added on <b>22.10.2014</b>
								</div>
							</div>
							<div class="files-buttons">
								<a href="#" class="btn btn-xs hover-info tooltip-button" data-placement="left" title="Download">
									<i class="glyph-icon icon-cloud-download"></i>
								</a>
								<a href="#" class="btn btn-xs hover-danger tooltip-button" data-placement="left" title="Delete">
									<i class="glyph-icon icon-times"></i>
								</a>
							</div>
						</li>
						<li class="divider"></li>
						<li>
							<i class="files-icon glyph-icon icon-file-code-o"></i>
							<div class="files-content">
								<b>homepage-test.html</b>
								<div class="files-date">
									<i class="glyph-icon icon-clock-o"></i>
									added  <b>19.10.2014</b>
								</div>
							</div>
							<div class="files-buttons">
								<a href="#" class="btn btn-xs hover-info tooltip-button" data-placement="left" title="Download">
									<i class="glyph-icon icon-cloud-download"></i>
								</a>
								<a href="#" class="btn btn-xs hover-danger tooltip-button" data-placement="left" title="Delete">
									<i class="glyph-icon icon-times"></i>
								</a>
							</div>
						</li>
						<li class="divider"></li>
						<li>
							<i class="files-icon glyph-icon font-yellow icon-file-image-o"></i>
							<div class="files-content">
								<b>monthlyReport.jpg</b>
								<div class="files-date">
									<i class="glyph-icon icon-clock-o"></i>
									added on <b>10.9.2014</b>
								</div>
							</div>
							<div class="files-buttons">
								<a href="#" class="btn btn-xs hover-info tooltip-button" data-placement="left" title="Download">
									<i class="glyph-icon icon-cloud-download"></i>
								</a>
								<a href="#" class="btn btn-xs hover-danger tooltip-button" data-placement="left" title="Delete">
									<i class="glyph-icon icon-times"></i>
								</a>
							</div>
						</li>
						<li class="divider"></li>
						<li>
							<i class="files-icon glyph-icon font-green icon-file-word-o"></i>
							<div class="files-content">
								<b>new_presentation.doc</b>
								<div class="files-date">
									<i class="glyph-icon icon-clock-o"></i>
									added on <b>5.9.2014</b>
								</div>
							</div>
							<div class="files-buttons">
								<a href="#" class="btn btn-xs hover-info tooltip-button" data-placement="left" title="Download">
									<i class="glyph-icon icon-cloud-download"></i>
								</a>
								<a href="#" class="btn btn-xs hover-danger tooltip-button" data-placement="left" title="Delete">
									<i class="glyph-icon icon-times"></i>
								</a>
							</div>
						</li>
					</ul>

				</div>

				<div class="clear"></div>

				<a href="#" title="" data-toggle="collapse" data-target="#sidebar-toggle-3" class="popover-title">
					Tasks for today
				</a>
				<div id="sidebar-toggle-3" class="collapse in">

					<ul class="progress-box">
						<li>
							<div class="progress-title">
								New features development
								<b>87%</b>
							</div>
							<div class="progressbar-smaller progressbar" data-value="87">
								<div class="progressbar-value bg-azure">
									<div class="progressbar-overlay"></div>
								</div>
							</div>
						</li>
						<li>
							<b class="pull-right">66%</b>
							<div class="progress-title">
								Finishing uploading files

							</div>
							<div class="progressbar-smaller progressbar" data-value="66">
								<div class="progressbar-value bg-red">
									<div class="progressbar-overlay"></div>
								</div>
							</div>
						</li>
						<li>
							<div class="progress-title">
								Creating tutorials
								<b>58%</b>
							</div>
							<div class="progressbar-smaller progressbar" data-value="58">
								<div class="progressbar-value bg-blue-alt"></div>
							</div>
						</li>
						<li>
							<div class="progress-title">
								Frontend bonus theme
								<b>74%</b>
							</div>
							<div class="progressbar-smaller progressbar" data-value="74">
								<div class="progressbar-value bg-purple"></div>
							</div>
						</li>
					</ul>

				</div>

				<div class="clear"></div>

				<a href="#" title="" data-toggle="collapse" data-target="#sidebar-toggle-4" class="popover-title">
					Pending notifications
					<span class="bs-label bg-orange tooltip-button" title="Label example">New</span>
				</a>
				<div id="sidebar-toggle-4" class="collapse in">
					<ul class="notifications-box notifications-box-alt">
						<li>
							<span class="bg-purple icon-notification glyph-icon icon-users"></span>
							<span class="notification-text">This is an error notification</span>
							<div class="notification-time">
								a few seconds ago
								<span class="glyph-icon icon-clock-o"></span>
							</div>
							<a href="#" class="notification-btn btn btn-xs btn-black tooltip-button" data-placement="left" title="View details">
								<i class="glyph-icon icon-arrow-right"></i>
							</a>
						</li>
						<li>
							<span class="bg-warning icon-notification glyph-icon icon-ticket"></span>
							<span class="notification-text">This is a warning notification</span>
							<div class="notification-time">
								<b>15</b> minutes ago
								<span class="glyph-icon icon-clock-o"></span>
							</div>
							<a href="#" class="notification-btn btn btn-xs btn-black tooltip-button" data-placement="left" title="View details">
								<i class="glyph-icon icon-arrow-right"></i>
							</a>
						</li>
						<li>
							<span class="bg-green icon-notification glyph-icon icon-random"></span>
							<span class="notification-text font-green">A success message example.</span>
							<div class="notification-time">
								<b>2 hours</b> ago
								<span class="glyph-icon icon-clock-o"></span>
							</div>
							<a href="#" class="notification-btn btn btn-xs btn-black tooltip-button" data-placement="left" title="View details">
								<i class="glyph-icon icon-arrow-right"></i>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="loading">
		<div class="spinner">
			<div class="bounce1"></div>
			<div class="bounce2"></div>
			<div class="bounce3"></div>
		</div>
	</div>

	<div id="page-wrapper">
		<div id="page-header" class="bg-gradient-9">
			<div id="mobile-navigation">
				<button id="nav-toggle" class="collapsed" data-toggle="collapse" data-target="#page-sidebar"><span></span></button>
				<a href="index.html" class="logo-content-small" title="MonarchUI"></a>
			</div>
			<div id="header-logo" class="logo-bg">
				<a href="index.html" class="logo-content-big" title="MonarchUI">
					Monarch <i>UI</i>
					<span>The perfect solution for user interfaces</span>
				</a>
				<a href="index.html" class="logo-content-small" title="MonarchUI">
					Monarch <i>UI</i>
					<span>The perfect solution for user interfaces</span>
				</a>
				<a id="close-sidebar" href="#" title="Close sidebar">
					<i class="glyph-icon icon-angle-left"></i>
				</a>
			</div>
			<div id="header-nav-left">
				<div class="user-account-btn dropdown">
					<a href="#" title="My Account" class="user-profile clearfix" data-toggle="dropdown">
						<img width="28" src="${ctxStatic}/templates/3/assets/image-resources/gravatar.jpg" alt="Profile image">
						<span>Thomas Barnes</span>
						<i class="glyph-icon icon-angle-down"></i>
					</a>
					<div class="dropdown-menu float-left">
						<div class="box-sm">
							<div class="login-box clearfix">
								<div class="user-img">
									<a href="#" title="" class="change-img">Change photo</a>
									<img src="${ctxStatic}/templates/3/assets/image-resources/gravatar.jpg" alt="">
								</div>
								<div class="user-info">
                            <span>
                                Thomas Barnes
                                <i>UX/UI developer</i>
                            </span>
									<a href="#" title="Edit profile">Edit profile</a>
									<a href="#" title="View notifications">View notifications</a>
								</div>
							</div>
							<div class="divider"></div>
							<ul class="reset-ul mrg5B">
								<li>
									<a href="#">
										<i class="glyph-icon float-right icon-caret-right"></i>
										View login page example

									</a>
								</li>
								<li>
									<a href="#">
										<i class="glyph-icon float-right icon-caret-right"></i>
										View lockscreen example

									</a>
								</li>
								<li>
									<a href="#">
										<i class="glyph-icon float-right icon-caret-right"></i>
										View account details

									</a>
								</li>
							</ul>
							<div class="pad5A button-pane button-pane-alt text-center">
								<a href="#" class="btn display-block font-normal btn-danger">
									<i class="glyph-icon icon-power-off"></i>
									Logout
								</a>
							</div>
						</div>
					</div>
				</div>
			</div><!-- #header-nav-left -->

			<div id="header-nav-right">
				<a href="#" class="hdr-btn popover-button" title="Search" data-placement="bottom" data-id="#popover-search">
					<i class="glyph-icon icon-search"></i>
				</a>
				<div class="hide" id="popover-search">
					<div class="pad5A box-md">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search terms here ...">
							<span class="input-group-btn">
                        <a class="btn btn-primary" href="#">Search</a>
                    </span>
						</div>
					</div>
				</div>
				<a href="#" class="hdr-btn" id="fullscreen-btn" title="Fullscreen">
					<i class="glyph-icon icon-arrows-alt"></i>
				</a>
				<a href="#" class="hdr-btn sb-toggle-left" id="chatbox-btn" title="Chat sidebar">
					<i class="glyph-icon icon-linecons-paper-plane"></i>
				</a>
				<div class="dropdown" id="notifications-btn">
					<a data-toggle="dropdown" href="#" title="">
						<span class="small-badge bg-yellow"></span>
						<i class="glyph-icon icon-linecons-megaphone"></i>
					</a>
					<div class="dropdown-menu box-md float-right">

						<div class="popover-title display-block clearfix pad10A">
							Notifications
							<a class="text-transform-cap font-primary font-normal btn-link float-right" href="#" title="View more options">
								More options...
							</a>
						</div>
						<div class="scrollable-content scrollable-slim-box">
							<ul class="no-border notifications-box">
								<li>
									<span class="bg-danger icon-notification glyph-icon icon-bullhorn"></span>
									<span class="notification-text">This is an error notification</span>
									<div class="notification-time">
										a few seconds ago
										<span class="glyph-icon icon-clock-o"></span>
									</div>
								</li>
								<li>
									<span class="bg-warning icon-notification glyph-icon icon-users"></span>
									<span class="notification-text font-blue">This is a warning notification</span>
									<div class="notification-time">
										<b>15</b> minutes ago
										<span class="glyph-icon icon-clock-o"></span>
									</div>
								</li>
								<li>
									<span class="bg-green icon-notification glyph-icon icon-sitemap"></span>
									<span class="notification-text font-green">A success message example.</span>
									<div class="notification-time">
										<b>2 hours</b> ago
										<span class="glyph-icon icon-clock-o"></span>
									</div>
								</li>
								<li>
									<span class="bg-azure icon-notification glyph-icon icon-random"></span>
									<span class="notification-text">This is an error notification</span>
									<div class="notification-time">
										a few seconds ago
										<span class="glyph-icon icon-clock-o"></span>
									</div>
								</li>
								<li>
									<span class="bg-warning icon-notification glyph-icon icon-ticket"></span>
									<span class="notification-text">This is a warning notification</span>
									<div class="notification-time">
										<b>15</b> minutes ago
										<span class="glyph-icon icon-clock-o"></span>
									</div>
								</li>
								<li>
									<span class="bg-blue icon-notification glyph-icon icon-user"></span>
									<span class="notification-text font-blue">Alternate notification styling.</span>
									<div class="notification-time">
										<b>2 hours</b> ago
										<span class="glyph-icon icon-clock-o"></span>
									</div>
								</li>
								<li>
									<span class="bg-purple icon-notification glyph-icon icon-user"></span>
									<span class="notification-text">This is an error notification</span>
									<div class="notification-time">
										a few seconds ago
										<span class="glyph-icon icon-clock-o"></span>
									</div>
								</li>
								<li>
									<span class="bg-warning icon-notification glyph-icon icon-user"></span>
									<span class="notification-text">This is a warning notification</span>
									<div class="notification-time">
										<b>15</b> minutes ago
										<span class="glyph-icon icon-clock-o"></span>
									</div>
								</li>
								<li>
									<span class="bg-green icon-notification glyph-icon icon-user"></span>
									<span class="notification-text font-green">A success message example.</span>
									<div class="notification-time">
										<b>2 hours</b> ago
										<span class="glyph-icon icon-clock-o"></span>
									</div>
								</li>
								<li>
									<span class="bg-purple icon-notification glyph-icon icon-user"></span>
									<span class="notification-text">This is an error notification</span>
									<div class="notification-time">
										a few seconds ago
										<span class="glyph-icon icon-clock-o"></span>
									</div>
								</li>
								<li>
									<span class="bg-warning icon-notification glyph-icon icon-user"></span>
									<span class="notification-text">This is a warning notification</span>
									<div class="notification-time">
										<b>15</b> minutes ago
										<span class="glyph-icon icon-clock-o"></span>
									</div>
								</li>
							</ul>
						</div>
						<div class="pad10A button-pane button-pane-alt text-center">
							<a href="#" class="btn btn-primary" title="View all notifications">
								View all notifications
							</a>
						</div>
					</div>
				</div>
				<div class="dropdown" id="progress-btn">
					<a data-toggle="dropdown" href="#" title="">
						<span class="small-badge bg-azure"></span>
						<i class="glyph-icon icon-linecons-params"></i>
					</a>
					<div class="dropdown-menu pad0A box-sm float-right" id="progress-dropdown">
						<div class="scrollable-content scrollable-slim-box">
							<ul class="no-border progress-box progress-box-links">
								<li>
									<a href="#" title="">
										<b class="pull-right">23%</b>
										<div class="progress-title">
											Finishing uploading files

										</div>
										<div class="progressbar-smaller progressbar" data-value="23">
											<div class="progressbar-value bg-blue-alt">
												<div class="progressbar-overlay"></div>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="#" title="">
										<b class="pull-right">91%</b>
										<div class="progress-title">
											Roadmap progress
										</div>
										<div class="progressbar-smaller progressbar" data-value="91">
											<div class="progressbar-value bg-red">
												<div class="progressbar-overlay"></div>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="#" title="">
										<b class="pull-right">58%</b>
										<div class="progress-title">
											Images upload
										</div>
										<div class="progressbar-smaller progressbar" data-value="58">
											<div class="progressbar-value bg-green"></div>
										</div>
									</a>
								</li>
								<li>
									<a href="#" title="">
										<b class="pull-right">74%</b>
										<div class="progress-title">
											WordPress migration
										</div>
										<div class="progressbar-smaller progressbar" data-value="74">
											<div class="progressbar-value bg-purple"></div>
										</div>
									</a>
								</li>
								<li>
									<a href="#" title="">
										<b class="pull-right">91%</b>
										<div class="progress-title">
											Agile development procedures
										</div>
										<div class="progressbar-smaller progressbar" data-value="91">
											<div class="progressbar-value bg-black">
												<div class="progressbar-overlay"></div>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="#" title="">
										<b class="pull-right">58%</b>
										<div class="progress-title">
											Systems integration
										</div>
										<div class="progressbar-smaller progressbar" data-value="58">
											<div class="progressbar-value bg-azure"></div>
										</div>
									</a>
								</li>
								<li>
									<a href="#" title="">
										<b class="pull-right">97%</b>
										<div class="progress-title">
											Code optimizations
										</div>
										<div class="progressbar-smaller progressbar" data-value="97">
											<div class="progressbar-value bg-yellow"></div>
										</div>
									</a>
								</li>
							</ul>
						</div>
						<div class="pad5A button-pane button-pane-alt text-center">
							<a href="#" class="btn display-block font-normal hover-green" title="View all notifications">
								View all notifications
							</a>
						</div>
					</div>
				</div>
				<div class="dropdown" id="cloud-btn">
					<a href="#" data-placement="bottom" class="tooltip-button sb-toggle-right" title="Statistics Sidebar">
						<i class="glyph-icon icon-linecons-cloud"></i>
					</a>
				</div>
				<div class="dropdown" id="dashnav-btn">
					<a href="#" data-toggle="dropdown" data-placement="bottom" class="popover-button-header tooltip-button" title="Dashboard Quick Menu">
						<i class="glyph-icon icon-linecons-cog"></i>
					</a>
					<div class="dropdown-menu float-right">
						<div class="box-sm">
							<div class="pad5T pad5B pad10L pad10R dashboard-buttons clearfix">
								<a href="#" class="btn vertical-button hover-blue-alt" title="">
                            <span class="glyph-icon icon-separator-vertical pad0A medium">
                                <i class="glyph-icon icon-dashboard opacity-80 font-size-20"></i>
                            </span>
									Dashboard
								</a>
								<a href="#" class="btn vertical-button hover-green" title="">
                            <span class="glyph-icon icon-separator-vertical pad0A medium">
                                <i class="glyph-icon icon-tags opacity-80 font-size-20"></i>
                            </span>
									Widgets
								</a>
								<a href="#" class="btn vertical-button hover-orange" title="">
                            <span class="glyph-icon icon-separator-vertical pad0A medium">
                                <i class="glyph-icon icon-fire opacity-80 font-size-20"></i>
                            </span>
									Tables
								</a>
								<a href="#" class="btn vertical-button hover-orange" title="">
                            <span class="glyph-icon icon-separator-vertical pad0A medium">
                                <i class="glyph-icon icon-bar-chart-o opacity-80 font-size-20"></i>
                            </span>
									Charts
								</a>
								<a href="#" class="btn vertical-button hover-purple" title="">
                            <span class="glyph-icon icon-separator-vertical pad0A medium">
                                <i class="glyph-icon icon-laptop opacity-80 font-size-20"></i>
                            </span>
									Buttons
								</a>
								<a href="#" class="btn vertical-button hover-azure" title="">
                            <span class="glyph-icon icon-separator-vertical pad0A medium">
                                <i class="glyph-icon icon-code opacity-80 font-size-20"></i>
                            </span>
									Panels
								</a>
							</div>
							<div class="divider"></div>
							<div class="pad5T pad5B pad10L pad10R dashboard-buttons clearfix">
								<a href="#" class="btn vertical-button remove-border btn-info" title="">
                            <span class="glyph-icon icon-separator-vertical pad0A medium">
                                <i class="glyph-icon icon-dashboard opacity-80 font-size-20"></i>
                            </span>
									Dashboard
								</a>
								<a href="#" class="btn vertical-button remove-border btn-danger" title="">
                            <span class="glyph-icon icon-separator-vertical pad0A medium">
                                <i class="glyph-icon icon-tags opacity-80 font-size-20"></i>
                            </span>
									Widgets
								</a>
								<a href="#" class="btn vertical-button remove-border btn-purple" title="">
                            <span class="glyph-icon icon-separator-vertical pad0A medium">
                                <i class="glyph-icon icon-fire opacity-80 font-size-20"></i>
                            </span>
									Tables
								</a>
								<a href="#" class="btn vertical-button remove-border btn-azure" title="">
                            <span class="glyph-icon icon-separator-vertical pad0A medium">
                                <i class="glyph-icon icon-bar-chart-o opacity-80 font-size-20"></i>
                            </span>
									Charts
								</a>
								<a href="#" class="btn vertical-button remove-border btn-yellow" title="">
                            <span class="glyph-icon icon-separator-vertical pad0A medium">
                                <i class="glyph-icon icon-laptop opacity-80 font-size-20"></i>
                            </span>
									Buttons
								</a>
								<a href="#" class="btn vertical-button remove-border btn-warning" title="">
                            <span class="glyph-icon icon-separator-vertical pad0A medium">
                                <i class="glyph-icon icon-code opacity-80 font-size-20"></i>
                            </span>
									Panels
								</a>
							</div>
						</div>
					</div>
				</div>
				<a class="header-btn" id="logout-btn" href="lockscreen-3.html" title="Lockscreen page example">
					<i class="glyph-icon icon-linecons-lock"></i>
				</a>

			</div><!-- #header-nav-right -->

		</div>
		<div id="page-sidebar">
			<div class="scroll-sidebar">


				<ul id="sidebar-menu">
					<li class="header"><span>Overview</span></li>
					<li>
						<a href="index.html" title="Admin Dashboard">
							<i class="glyph-icon icon-linecons-tv"></i>
							<span>Admin dashboard</span>
						</a>
					</li>
					<li class="divider"></li>
					<li class="no-menu">
						<a href="../frontend-template/index.html" title="Frontend template">
							<i class="glyph-icon icon-linecons-beaker"></i>
							<span>Frontend template</span>
							<span class="bs-label label-danger">
                NEW
            </span>
						</a>
					</li>
					<li class="header"><span>Components</span></li>
					<li>
						<a href="#" title="Elements">
							<i class="glyph-icon icon-linecons-diamond"></i>
							<span>Elements</span>
						</a>
						<div class="sidebar-submenu">

							<ul>
								<li><a href="buttons.html" title="Buttons"><span>Buttons</span></a></li>
								<li><a href="labels-badges.html" title="Labels &amp; Badges"><span>Labels &amp; Badges</span></a></li>
								<li><a href="content-boxes.html" title="Content boxes"><span>Content boxes</span></a></li>
								<li><a href="icons.html" title="Icons"><span>Icons</span></a></li>
								<li><a href="nav-menus.html" title="Navigation menus"><span>Navigation menus</span></a></li>
								<li><a href="response-messages.html" title="Response messages"><span>Response messages</span></a></li>
								<li><a href="images.html" title="Images"><span>Images</span></a></li>
							</ul>

						</div><!-- .sidebar-submenu -->
					</li>
					<li>
						<a href="#" title="Dashboard boxes">
							<i class="glyph-icon icon-linecons-lightbulb"></i>
							<span>Dashboard boxes</span>
							<span class="bs-label label-primary">Hot</span>
						</a>
						<div class="sidebar-submenu">

							<ul>
								<li><a href="chart-boxes.html" title="Chart boxes"><span>Chart boxes</span></a></li>
								<li><a href="tile-boxes.html" title="Tile boxes"><span>Tile boxes</span></a></li>
								<li><a href="social-boxes.html" title="Social boxes"><span>Social boxes</span></a></li>
								<li><a href="panel-boxes.html" title="Panel boxes"><span>Panel boxes</span></a></li>
							</ul>

						</div><!-- .sidebar-submenu -->
					</li>
					<li>
						<a href="#" title="Widgets">
							<i class="glyph-icon icon-linecons-wallet"></i>
							<span>Widgets</span>
						</a>
						<div class="sidebar-submenu">

							<ul>
								<li><a href="tabs.html" title="Responsive tabs"><span>Responsive tabs</span></a></li>
								<li><a href="collapsable.html" title="Collapsables"><span>Collapsable accordions</span></a></li>
								<li><a href="bs-carousel.html" title="Bootstrap Carousel"><span>Bootstrap carousel</span></a></li>
								<li><a href="calendar.html" title="Calendar"><span>Calendar</span></a></li>
								<li><a href="scrollbars.html" title="Custom scrollbars"><span>Custom scrollbars</span></a></li>
								<li><a href="modals.html" title="Modals"><span>Modals</span></a></li>
								<li><a href="notifications.html" title="Notifications"><span>Notifications</span></a></li>
								<li><a href="lazyload.html" title="Lazyload"><span>Lazyload</span></a></li>
								<li><a href="loading-feedback.html" title="Loading feedback"><span>Loading feedback</span></a></li>
								<li><a href="popovers-tooltips.html" title="Popovers &amp; Tooltips"><span>Popovers & Tooltips</span></a></li>
								<li><a href="progress-bars.html" title="Progress bars"><span>Progress bars</span></a></li>
								<li><a href="sortable-elements.html" title="Sortable elements"><span>Sortable elements</span></a></li>
							</ul>

						</div><!-- .sidebar-submenu -->
					</li>
					<li>
						<a href="#" title="Forms UI">
							<i class="glyph-icon icon-linecons-eye"></i>
							<span>Forms UI</span>
						</a>
						<div class="sidebar-submenu">

							<ul>
								<li><a href="forms-elements.html" title="Form elements"><span>Form elements</span></a></li>
								<li><a href="forms-validation.html" title="Form validation"><span>Form validation</span></a></li>
								<li><a href="pickers.html" title="Pickers"><span>Pickers</span></a></li>
								<li><a href="sliders.html" title="Sliders"><span>Sliders</span></a></li>
								<li><a href="forms-wizard.html" title="Form wizards"><span>Form wizards</span></a></li>
								<li><a href="forms-masks.html" title="Form input masks"><span>Form input masks</span></a></li>
								<li><a href="image-crop.html" title="Image crop"><span>Image crop</span></a></li>
								<li><a href="dropzone-uploader.html" title="Dropzone uploader"><span>Dropzone uploader</span></a></li>
								<li><a href="multi-uploader.html" title="Multi uploader"><span>Multi uploader</span></a></li>
								<li><a href="input-knobs.html" title="Input knobs"><span>Input knobs</span></a></li>
								<li><a href="ckeditor.html" title="Ckeditor"><span>Ckeditor</span></a></li>
								<li><a href="summernote.html" title="Summernote"><span>Summernote</span></a></li>
								<li><a href="markdown.html" title="Markdown editor"><span>Markdown editor</span></a></li>
								<li><a href="inline-editor.html" title="Inline editor"><span>Inline editor</span></a></li>
							</ul>

						</div><!-- .sidebar-submenu -->
					</li>
					<li>
						<a href="#" title="Advanced tables">
							<i class="glyph-icon icon-linecons-megaphone"></i>
							<span>Advanced tables</span>
						</a>
						<div class="sidebar-submenu">

							<ul>
								<li><a href="tables.html" title="Basic tables"><span>Basic tables</span></a></li>
								<li><a href="responsive-tables.html" title="Responsive tables"><span>Responsive tables</span></a></li>
								<li><a href="data-tables.html" title="Data tables"><span>Data tables</span></a></li>
								<li><a href="advanced-datatables.html" title="Advanced data tables"><span>Advanced data tables</span></a></li>
								<li><a href="fixed-datatables.html" title="Fixed data tables"><span>Fixed data tables</span></a></li>
								<li><a href="responsive-datatables.html" title="Responsive data tables"><span>Responsive data tables</span></a></li>
							</ul>

						</div><!-- .sidebar-submenu -->
					</li>
					<li>
						<a href="#" title="Charts">
							<i class="glyph-icon icon-linecons-paper-plane"></i>
							<span>Charts</span>
						</a>
						<div class="sidebar-submenu">

							<ul>
								<li>
									<a href="#" title="Flot charts">
										<i class="glyph-icon icon-linecons-paper-plane"></i>
										<span>Flot charts</span>
									</a>
									<div class="nav-level3">

										<ul>
											<li><a href="flot-charts.html" title="Flot charts1"><span>Flot charts1</span></a>

											</li>
											<li><a href="sparklines.html" title="Flot charts2"><span>Flot charts2</span></a></li>
											<li><a href="pie-gages.html" title="Flot charts3"><span>Flot charts3</span></a></li>
											<li><a href="just-gage.html" title="Flot charts4"><span>Flot charts4</span></a></li>
											<li><a href="morris-charts.html" title="Flot charts5"><span>Flot charts5</span></a></li>
											<li><a href="xcharts.html" title="Flot charts6"><span>Flot charts6</span></a></li>
											<li><a href="chart-js.html" title="Flot charts7"><span>Flot charts7</span></a></li>
										</ul>

									</div><!-- .sidebar-submenu -->
								</li>
								<li><a href="sparklines.html" title="Sparklines"><span>Sparklines</span></a></li>
								<li><a href="pie-gages.html" title="PieGages"><span>PieGages</span></a></li>
								<li><a href="just-gage.html" title="justGage"><span>justGage</span></a></li>
								<li><a href="morris-charts.html" title="Morris charts"><span>Morris charts</span></a></li>
								<li><a href="xcharts.html" title="xCharts"><span>xCharts</span></a></li>
								<li><a href="chart-js.html" title="Chart.js"><span>Chart.js</span></a></li>
							</ul>

						</div><!-- .sidebar-submenu -->
					</li>
					<li>
						<a href="#" title="Maps">
							<i class="glyph-icon icon-linecons-sound"></i>
							<span>Maps</span>
						</a>
						<div class="sidebar-submenu">

							<ul>
								<li><a href="gmaps.html" title="gMaps"><span>gMaps</span></a></li>
								<li><a href="vector-maps.html" title="Vector maps"><span>Vector maps</span></a></li>
								<li><a href="mapael.html" title="Mapael"><span>Mapael</span></a></li>
							</ul>

						</div><!-- .sidebar-submenu -->
					</li>
					<li class="header"><span>Extra</span></li>
					<li>
						<a href="#" title="Pages">
							<i class="glyph-icon icon-linecons-fire"></i>
							<span>Pages</span>
							<span class="bs-label badge-yellow">NEW</span>
						</a>
						<div class="sidebar-submenu">

							<ul>
								<li><a href="index-alt.html" title="Alternate dashboard"><span>Alternate dashboard</span></a></li>
								<li><a href="view-profile.html" title="View profile"><span>View profile</span></a></li>
								<li><a href="faq-section.html" title="FAQ section"><span>FAQ section</span></a></li>
								<li><a href="auto-menu.html" title="Auto menu"><span>Auto menu</span></a></li>
								<li><a href="invoice.html" title="Invoice"><span>Invoice</span></a></li>
								<li><a href="admin-blog.html" title="Blog posts list"><span>Blog posts list</span></a></li>
								<li><a href="admin-pricing.html" title="Pricing tables"><span>Pricing tables</span></a></li>
								<li><a href="portfolio-gallery.html" title="Portfolio gallery"><span>Portfolio gallery</span></a></li>
								<li><a href="portfolio-masonry.html" title="Portfolio masonry"><span>Portfolio masonry</span></a></li>
								<li><a href="slidebars.html" title="Slidebars"><span>Slidebars</span></a></li>
							</ul>

						</div><!-- .sidebar-submenu -->
					</li>
					<li>
						<a href="#" title="Other Pages">
							<i class="glyph-icon icon-linecons-cup"></i>
							<span>Other Pages</span>
						</a>
						<div class="sidebar-submenu">

							<ul>
								<li><a href="login-1.html" target="_blank" title="Login page 1"><span>Login page 1</span></a></li>
								<li><a href="login-2.html" target="_blank" title="Login page 2"><span>Login page 2</span></a></li>
								<li><a href="login-3.html" target="_blank" title="Login page 3"><span>Login page 3</span></a></li>
								<li><a href="login-4.html" target="_blank" title="Login page 4"><span>Login page 4</span></a></li>
								<li><a href="login-5.html" target="_blank" title="Login page 5"><span>Login page 5</span></a></li>
								<li><a href="lockscreen-1.html" target="_blank" title="Lockscreen page 1"><span>Lockscreen page 1</span></a></li>
								<li><a href="lockscreen-2.html" target="_blank" title="Lockscreen page 2"><span>Lockscreen page 2</span></a></li>
								<li><a href="lockscreen-3.html" target="_blank" title="Lockscreen page 3"><span>Lockscreen page 3</span></a></li>
								<li><a href="server-1.html" target="_blank" title="Server page 1"><span>Error 404 page</span></a></li>
								<li><a href="server-2.html" target="_blank" title="Server page 2"><span>Error 404 alternate</span></a></li>
								<li><a href="server-3.html" target="_blank" title="Server page 3"><span>Server 500 error</span></a></li>
							</ul>

						</div><!-- .sidebar-submenu -->
					</li>
					<li>
						<a href="#" title="Mailbox">
							<i class="glyph-icon icon-linecons-mail"></i>
							<span>Mailbox</span>
							<span class="bs-badge badge-danger">3</span>
						</a>
						<div class="sidebar-submenu">

							<ul>
								<li><a href="mailbox-inbox.html" title="Inbox"><span>Inbox</span></a></li>
								<li><a href="mailbox-compose.html" title="Compose message"><span>Compose message</span></a></li>
								<li><a href="mailbox-single.html" title="Single message"><span>Single message</span></a></li>
							</ul>

						</div><!-- .sidebar-submenu -->
					</li>
					<li>
						<a href="#" title="Snippets">
							<i class="glyph-icon icon-linecons-cd"></i>
							<span>Snippets</span>
						</a>
						<div class="sidebar-submenu">

							<ul>
								<li><a href="timeline.html" title="Timeline"><span>Timeline</span></a></li>
								<li><a href="chat.html" title="Chat"><span>Chat</span></a></li>
								<li><a href="checklist.html" title="Checklist"><span>Checklist</span></a></li>
							</ul>

						</div><!-- .sidebar-submenu -->
					</li>
					<li>
						<a href="#" title="Helpers">
							<i class="glyph-icon icon-linecons-doc"></i>
							<span>Helpers</span>
						</a>
						<div class="sidebar-submenu">

							<ul>
								<li><a href="helper-classes.html" title="Helper classes"><span>Helper classes</span></a></li>
								<li><a href="page-transitions.html" title="Page transitions"><span>Page transitions</span></a></li>
								<li><a href="animations.html" title="Animations"><span>Animations</span></a></li>
							</ul>

						</div><!-- .sidebar-submenu -->
					</li>
				</ul><!-- #sidebar-menu -->


			</div>
		</div>
		<div id="page-content-wrapper">
			<div id="page-content">

				<div class="container">


					<!-- Sparklines charts -->

					<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/charts/sparklines/sparklines.js"></script>
					<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/charts/sparklines/sparklines-demo.js"></script>

					<!-- Flot charts -->

					<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/charts/flot/flot.js"></script>
					<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/charts/flot/flot-resize.js"></script>
					<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/charts/flot/flot-stack.js"></script>
					<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/charts/flot/flot-pie.js"></script>
					<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/charts/flot/flot-tooltip.js"></script>
					<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/charts/flot/flot-demo-1.js"></script>

					<!-- PieGage charts -->

					<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/charts/piegage/piegage.js"></script>
					<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/charts/piegage/piegage-demo.js"></script>

					<div id="page-title">
						<h2>Dashboard</h2>
						<p>The most complete user interface framework that can be used to create stunning admin dashboards and presentation websites.</p>
						<div id="theme-options" class="admin-options">
							<a href="javascript:void(0);" class="btn btn-primary theme-switcher tooltip-button" data-placement="left" title="Color schemes and layout options">
								<i class="glyph-icon icon-linecons-cog icon-spin"></i>
							</a>
							<div id="theme-switcher-wrapper">
								<div class="scroll-switcher">
									<h5 class="header">Layout options</h5>
									<ul class="reset-ul">
										<li>
											<label for="boxed-layout">Boxed layout</label>
											<input type="checkbox" data-toggletarget="boxed-layout" id="boxed-layout" class="input-switch-alt">
										</li>
										<li>
											<label for="fixed-header">Fixed header</label>
											<input type="checkbox" data-toggletarget="fixed-header" id="fixed-header" class="input-switch-alt">
										</li>
										<li>
											<label for="fixed-sidebar">Fixed sidebar</label>
											<input type="checkbox" data-toggletarget="fixed-sidebar" id="fixed-sidebar" class="input-switch-alt">
										</li>
										<li>
											<label for="closed-sidebar">Closed sidebar</label>
											<input type="checkbox" data-toggletarget="closed-sidebar" id="closed-sidebar" class="input-switch-alt">
										</li>
									</ul>
									<div class="boxed-bg-wrapper hide">
										<h5 class="header">
											Boxed Page Background
											<a class="set-background-style" data-header-bg="" title="Remove all styles" href="javascript:void(0);">Clear</a>
										</h5>
										<div class="theme-color-wrapper clearfix">
											<h5>Patterns</h5>
											<a class="tooltip-button set-background-style pattern-bg-3" data-header-bg="pattern-bg-3" title="Pattern 3" href="javascript:void(0);">Pattern 3</a>
											<a class="tooltip-button set-background-style pattern-bg-4" data-header-bg="pattern-bg-4" title="Pattern 4" href="javascript:void(0);">Pattern 4</a>
											<a class="tooltip-button set-background-style pattern-bg-5" data-header-bg="pattern-bg-5" title="Pattern 5" href="javascript:void(0);">Pattern 5</a>
											<a class="tooltip-button set-background-style pattern-bg-6" data-header-bg="pattern-bg-6" title="Pattern 6" href="javascript:void(0);">Pattern 6</a>
											<a class="tooltip-button set-background-style pattern-bg-7" data-header-bg="pattern-bg-7" title="Pattern 7" href="javascript:void(0);">Pattern 7</a>
											<a class="tooltip-button set-background-style pattern-bg-8" data-header-bg="pattern-bg-8" title="Pattern 8" href="javascript:void(0);">Pattern 8</a>
											<a class="tooltip-button set-background-style pattern-bg-9" data-header-bg="pattern-bg-9" title="Pattern 9" href="javascript:void(0);">Pattern 9</a>
											<a class="tooltip-button set-background-style pattern-bg-10" data-header-bg="pattern-bg-10" title="Pattern 10" href="javascript:void(0);">Pattern 10</a>

											<div class="clear"></div>

											<h5 class="mrg15T">Solids &amp;Images</h5>
											<a class="tooltip-button set-background-style bg-black" data-header-bg="bg-black" title="Black" href="javascript:void(0);">Black</a>
											<a class="tooltip-button set-background-style bg-gray mrg10R" data-header-bg="bg-gray" title="Gray" href="javascript:void(0);">Gray</a>

											<a class="tooltip-button set-background-style full-bg-1" data-header-bg="full-bg-1 fixed-bg" title="Image 1" href="javascript:void(0);">Image 1</a>
											<a class="tooltip-button set-background-style full-bg-2" data-header-bg="full-bg-2 fixed-bg" title="Image 2" href="javascript:void(0);">Image 2</a>
											<a class="tooltip-button set-background-style full-bg-3" data-header-bg="full-bg-3 fixed-bg" title="Image 3" href="javascript:void(0);">Image 3</a>
											<a class="tooltip-button set-background-style full-bg-4" data-header-bg="full-bg-4 fixed-bg" title="Image 4" href="javascript:void(0);">Image 4</a>
											<a class="tooltip-button set-background-style full-bg-5" data-header-bg="full-bg-5 fixed-bg" title="Image 5" href="javascript:void(0);">Image 5</a>
											<a class="tooltip-button set-background-style full-bg-6" data-header-bg="full-bg-6 fixed-bg" title="Image 6" href="javascript:void(0);">Image 6</a>

										</div>
									</div>
									<h5 class="header">
										Header Style
										<a class="set-adminheader-style" data-header-bg="bg-gradient-9" title="Remove all styles" href="javascript:void(0);">Clear</a>
									</h5>
									<div class="theme-color-wrapper clearfix">
										<h5>Solids</h5>
										<a class="tooltip-button set-adminheader-style bg-primary" data-header-bg="bg-primary font-inverse" title="Primary" href="javascript:void(0);">Primary</a>
										<a class="tooltip-button set-adminheader-style bg-green" data-header-bg="bg-green font-inverse" title="Green" href="javascript:void(0);">Green</a>
										<a class="tooltip-button set-adminheader-style bg-red" data-header-bg="bg-red font-inverse" title="Red" href="javascript:void(0);">Red</a>
										<a class="tooltip-button set-adminheader-style bg-blue" data-header-bg="bg-blue font-inverse" title="Blue" href="javascript:void(0);">Blue</a>
										<a class="tooltip-button set-adminheader-style bg-warning" data-header-bg="bg-warning font-inverse" title="Warning" href="javascript:void(0);">Warning</a>
										<a class="tooltip-button set-adminheader-style bg-purple" data-header-bg="bg-purple font-inverse" title="Purple" href="javascript:void(0);">Purple</a>
										<a class="tooltip-button set-adminheader-style bg-black" data-header-bg="bg-black font-inverse" title="Black" href="javascript:void(0);">Black</a>

										<div class="clear"></div>

										<h5 class="mrg15T">Gradients</h5>
										<a class="tooltip-button set-adminheader-style bg-gradient-1" data-header-bg="bg-gradient-1 font-inverse" title="Gradient 1" href="javascript:void(0);">Gradient 1</a>
										<a class="tooltip-button set-adminheader-style bg-gradient-2" data-header-bg="bg-gradient-2 font-inverse" title="Gradient 2" href="javascript:void(0);">Gradient 2</a>
										<a class="tooltip-button set-adminheader-style bg-gradient-3" data-header-bg="bg-gradient-3 font-inverse" title="Gradient 3" href="javascript:void(0);">Gradient 3</a>
										<a class="tooltip-button set-adminheader-style bg-gradient-4" data-header-bg="bg-gradient-4 font-inverse" title="Gradient 4" href="javascript:void(0);">Gradient 4</a>
										<a class="tooltip-button set-adminheader-style bg-gradient-5" data-header-bg="bg-gradient-5 font-inverse" title="Gradient 5" href="javascript:void(0);">Gradient 5</a>
										<a class="tooltip-button set-adminheader-style bg-gradient-6" data-header-bg="bg-gradient-6 font-inverse" title="Gradient 6" href="javascript:void(0);">Gradient 6</a>
										<a class="tooltip-button set-adminheader-style bg-gradient-7" data-header-bg="bg-gradient-7 font-inverse" title="Gradient 7" href="javascript:void(0);">Gradient 7</a>
										<a class="tooltip-button set-adminheader-style bg-gradient-8" data-header-bg="bg-gradient-8 font-inverse" title="Gradient 8" href="javascript:void(0);">Gradient 8</a>
									</div>
									<h5 class="header">
										Sidebar Style
										<a class="set-sidebar-style" data-header-bg="" title="Remove all styles" href="javascript:void(0);">Clear</a>
									</h5>
									<div class="theme-color-wrapper clearfix">
										<h5>Solids</h5>
										<a class="tooltip-button set-sidebar-style bg-primary" data-header-bg="bg-primary font-inverse" title="Primary" href="javascript:void(0);">Primary</a>
										<a class="tooltip-button set-sidebar-style bg-green" data-header-bg="bg-green font-inverse" title="Green" href="javascript:void(0);">Green</a>
										<a class="tooltip-button set-sidebar-style bg-red" data-header-bg="bg-red font-inverse" title="Red" href="javascript:void(0);">Red</a>
										<a class="tooltip-button set-sidebar-style bg-blue" data-header-bg="bg-blue font-inverse" title="Blue" href="javascript:void(0);">Blue</a>
										<a class="tooltip-button set-sidebar-style bg-warning" data-header-bg="bg-warning font-inverse" title="Warning" href="javascript:void(0);">Warning</a>
										<a class="tooltip-button set-sidebar-style bg-purple" data-header-bg="bg-purple font-inverse" title="Purple" href="javascript:void(0);">Purple</a>
										<a class="tooltip-button set-sidebar-style bg-black" data-header-bg="bg-black font-inverse" title="Black" href="javascript:void(0);">Black</a>

										<div class="clear"></div>

										<h5 class="mrg15T">Gradients</h5>
										<a class="tooltip-button set-sidebar-style bg-gradient-1" data-header-bg="bg-gradient-1 font-inverse" title="Gradient 1" href="javascript:void(0);">Gradient 1</a>
										<a class="tooltip-button set-sidebar-style bg-gradient-2" data-header-bg="bg-gradient-2 font-inverse" title="Gradient 2" href="javascript:void(0);">Gradient 2</a>
										<a class="tooltip-button set-sidebar-style bg-gradient-3" data-header-bg="bg-gradient-3 font-inverse" title="Gradient 3" href="javascript:void(0);">Gradient 3</a>
										<a class="tooltip-button set-sidebar-style bg-gradient-4" data-header-bg="bg-gradient-4 font-inverse" title="Gradient 4" href="javascript:void(0);">Gradient 4</a>
										<a class="tooltip-button set-sidebar-style bg-gradient-5" data-header-bg="bg-gradient-5 font-inverse" title="Gradient 5" href="javascript:void(0);">Gradient 5</a>
										<a class="tooltip-button set-sidebar-style bg-gradient-6" data-header-bg="bg-gradient-6 font-inverse" title="Gradient 6" href="javascript:void(0);">Gradient 6</a>
										<a class="tooltip-button set-sidebar-style bg-gradient-7" data-header-bg="bg-gradient-7 font-inverse" title="Gradient 7" href="javascript:void(0);">Gradient 7</a>
										<a class="tooltip-button set-sidebar-style bg-gradient-8" data-header-bg="bg-gradient-8 font-inverse" title="Gradient 8" href="javascript:void(0);">Gradient 8</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4">
							<div class="dashboard-box dashboard-box-chart bg-white content-box">
								<div class="content-wrapper">
									<div class="header">
										$34,657
										<span>Total Earnings<b> in last</b> ten <b>quarters</b></span>
									</div>
									<div class="bs-label bg-green">+18%</div>
									<div class="center-div sparkline-big-alt">1245,1450,1312,1121,986,1489</div>
									<div class="row list-grade">
										<div class="col-md-2">January</div>
										<div class="col-md-2">February</div>
										<div class="col-md-2">March</div>
										<div class="col-md-2">April</div>
										<div class="col-md-2">May</div>
										<div class="col-md-2">June</div>
									</div>
								</div>
								<div class="button-pane">
									<div class="size-md float-left">
										<a href="#" title="">
											Financial statistics
										</a>
									</div>
									<a href="#" class="btn btn-info float-right tooltip-button" data-placement="top" title="View details">
										<i class="glyph-icon icon-plus"></i>
									</a>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="dashboard-box dashboard-box-chart bg-white content-box">
								<div class="content-wrapper">
									<div class="header">
										169
										<span>Total Subscriptions<b> in last</b> 6 days</span>
									</div>
									<div class="bs-label bg-red">-14%</div>
									<div class="center-div sparkline-big-alt">21,41,31,50,18,41</div>
									<div class="row list-grade">
										<div class="col-md-2">M</div>
										<div class="col-md-2">T</div>
										<div class="col-md-2">W</div>
										<div class="col-md-2">T</div>
										<div class="col-md-2">F</div>
										<div class="col-md-2">S</div>
									</div>
								</div>
								<div class="button-pane">
									<div class="size-md float-left">
										<a href="#" title="">
											View all members
										</a>
									</div>
									<a href="#" class="btn btn-default float-right tooltip-button" data-placement="top" title="View details">
										<i class="glyph-icon icon-angle-right"></i>
									</a>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="dashboard-box dashboard-box-chart bg-white content-box">
								<div class="content-wrapper">
									<div class="header">
										8960
										<span>Total Downloads<b> in last</b> 6 years</span>
									</div>
									<div class="bs-label bg-orange">~51%</div>
									<div class="center-div sparkline-big-alt">2210,2310,2010,2310,2123,2350</div>
									<div class="row list-grade">
										<div class="col-md-2">2009</div>
										<div class="col-md-2">2010</div>
										<div class="col-md-2">2011</div>
										<div class="col-md-2">2012</div>
										<div class="col-md-2">2013</div>
										<div class="col-md-2">2014</div>
									</div>
								</div>
								<div class="button-pane">
									<div class="size-md float-left">
										<a href="#" title="">
											View more details
										</a>
									</div>
									<a href="#" class="btn btn-primary float-right tooltip-button" data-placement="top" title="View details">
										<i class="glyph-icon icon-caret-right"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8">
							<div class="panel">
								<div class="panel-body">
									<h3 class="title-hero">
										Recent sales activity
									</h3>
									<div class="example-box-wrapper">
										<div id="data-example-1" class="mrg20B" style="width: 100%; height: 300px;"></div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-4">
									<a href="#" title="Example tile shortcut" class="tile-box tile-box-alt btn-success">
										<div class="tile-header">
											Photo Gallery
										</div>
										<div class="tile-content-wrapper">
											<div class="chart-alt-10" data-percent="43"><span>43</span>%</div>
										</div>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" title="Example tile shortcut" class="tile-box tile-box-alt btn-info">
										<div class="tile-header">
											Subscriptions
										</div>
										<div class="tile-content-wrapper">
											<div class="chart-alt-10" data-percent="76"><span>76</span>%</div>
										</div>
									</a>
								</div>
								<div class="col-md-4">
									<a href="#" title="Example tile shortcut" class="tile-box tile-box-alt btn-warning">
										<div class="tile-header">
											New Visitors
										</div>
										<div class="tile-content-wrapper">
											<div class="chart-alt-10" data-percent="11"><span>11</span>%</div>
										</div>
									</a>
								</div>
							</div>

							<div class="content-box mrg20T">
								<h3 class="content-box-header bg-primary">
									Toggle button closed
									<span class="header-buttons-separator">
                    <a href="#" class="icon-separator toggle-button">
                        <i class="glyph-icon icon-chevron-down"></i>
                    </a>
                </span>
								</h3>
								<div class="content-box-wrapper hide">
									This content boxes has the header with <code>.bg-default</code>.
								</div>
							</div>

							<div class="content-box">
								<h3 class="content-box-header bg-default">
									<i class="glyph-icon icon-cog"></i>
									Live server status
									<span class="header-buttons-separator">
                    <a href="#" class="icon-separator">
                        <i class="glyph-icon icon-question"></i>
                    </a>
                    <a href="#" class="icon-separator refresh-button" data-style="dark" data-theme="bg-white" data-opacity="40">
                        <i class="glyph-icon icon-refresh"></i>
                    </a>
                    <a href="#" class="icon-separator remove-button" data-animation="flipOutX">
                        <i class="glyph-icon icon-times"></i>
                    </a>
                </span>
								</h3>
								<div class="content-box-wrapper">
									<div id="data-example-3" style="width: 100%; height: 250px;"></div>
								</div>
							</div>

						</div>
						<div class="col-md-4">
							<div class="row mrg20B">
								<div class="col-md-6">
									<a href="#" title="Example tile shortcut" class="tile-box tile-box-shortcut btn-primary">
										<span class="bs-badge badge-absolute">5</span>
										<div class="tile-header">
											Dashboard
										</div>
										<div class="tile-content-wrapper">
											<i class="glyph-icon icon-dashboard"></i>
										</div>
									</a>
								</div>
								<div class="col-md-6">
									<a href="#" title="Example tile shortcut" class="tile-box tile-box-shortcut btn-black">
										<span class="bs-badge badge-absolute">5</span>
										<div class="tile-header">
											Orders
										</div>
										<div class="tile-content-wrapper">
											<i class="glyph-icon icon-cogs"></i>
										</div>
									</a>
								</div>
							</div>
							<div class="panel">
								<div class="panel-body">
									<h3 class="title-hero">
										Users activity
									</h3>
									<div class="example-box-wrapper">
										<div class="timeline-box timeline-box-left">
											<div class="tl-row">
												<div class="tl-item float-right">
													<div class="tl-icon bg-red">
														<i class="glyph-icon icon-toggle-on"></i>
													</div>
													<div class="popover left">
														<div class="arrow"></div>
														<div class="popover-content">
															<div class="tl-label bs-label label-info">Appointment</div>
															<p class="tl-content">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. </p>
															<div class="tl-time">
																<i class="glyph-icon icon-clock-o"></i>
																a few seconds ago
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tl-row">
												<div class="tl-item float-right">
													<div class="tl-icon bg-primary">
														<i class="glyph-icon icon-wifi"></i>
													</div>
													<div class="popover left">
														<div class="arrow"></div>
														<div class="popover-content">
															<div class="tl-label bs-label bg-yellow">Teleconference</div>
															<p class="tl-content">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. </p>
															<div class="tl-time">
																<i class="glyph-icon icon-clock-o"></i>
																a few seconds ago
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tl-row">
												<div class="tl-item float-right">
													<div class="tl-icon bg-black">
														<i class="glyph-icon icon-headphones"></i>
													</div>
													<div class="popover left">
														<div class="arrow"></div>
														<div class="popover-content">
															<div class="tl-label bs-label label-danger">Meeting</div>
															<p class="tl-content">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. </p>
															<div class="tl-time">
																<i class="glyph-icon icon-clock-o"></i>
																a few seconds ago
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="content-box bg-white post-box">
								<textarea name="" class="textarea-autosize" placeholder="What are you doing right now?"></textarea>
								<div class="button-pane">
									<a href="#" class="btn btn-md btn-link hover-white" title="">
										<i class="glyph-icon icon-volume-down"></i>
									</a>
									<a href="#" class="btn btn-md btn-link hover-white" title="">
										<i class="glyph-icon icon-video-camera"></i>
									</a>
									<a href="#" class="btn btn-md btn-link hover-white" title="">
										<i class="glyph-icon icon-microphone"></i>
									</a>
									<a href="#" class="btn btn-md btn-link hover-white" title="">
										<i class="glyph-icon icon-picture-o"></i>
									</a>

									<a href="#" class="btn btn-md btn-post float-right btn-success" title="">
										Post
									</a>

								</div>
							</div>
							<div class="panel">
								<div class="panel-body">
									<ul class="todo-box">
										<li class="border-red">
											<input type="checkbox" name="todo-1" id="todo-1">
											<label for="todo-1">This is an example task that i need to finish</label>
											<span class="bs-label bg-red" title="">Overdue</span>
											<a href="#" class="btn btn-xs btn-danger float-right" title="">
												<i class="glyph-icon icon-remove"></i>
											</a>
											<a href="#" class="btn btn-xs btn-success float-right" title="">
												<i class="glyph-icon icon-check"></i>
											</a>
										</li>
										<li class="border-orange">
											<input type="checkbox" name="todo-2" id="todo-2">
											<label for="todo-2">Update server to a newer version</label>
											<span class="bs-label bg-green" title="">2 Weeks</span>
											<a href="#" class="btn btn-xs btn-danger float-right" title="">
												<i class="glyph-icon icon-remove"></i>
											</a>
											<a href="#" class="btn btn-xs btn-success float-right" title="">
												<i class="glyph-icon icon-check"></i>
											</a>
										</li>
										<li class="border-blue">
											<input type="checkbox" name="todo-3" id="todo-3">
											<label for="todo-3">Add more awesome template features</label>
											<span class="bs-label bg-blue" title="">Tomorrow</span>
											<a href="#" class="btn btn-xs btn-danger float-right" title="">
												<i class="glyph-icon icon-remove"></i>
											</a>
											<a href="#" class="btn btn-xs btn-success float-right" title="">
												<i class="glyph-icon icon-check"></i>
											</a>
										</li>
										<li class="border-purple">
											<input type="checkbox" name="todo-4" id="todo-4">
											<label for="todo-4">Never forget to buy milk</label>
											<span class="bs-label bg-black" title="">Today</span>
											<a href="#" class="btn btn-xs btn-danger float-right" title="">
												<i class="glyph-icon icon-remove"></i>
											</a>
											<a href="#" class="btn btn-xs btn-success float-right" title="">
												<i class="glyph-icon icon-check"></i>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>


	<!-- WIDGETS -->
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/tether/js/tether.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/bootstrap/js/bootstrap.js"></script>

	<!-- Bootstrap Dropdown -->

	<!-- <script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/dropdown/dropdown.js"></script> -->

	<!-- Bootstrap Tooltip -->

	<!-- <script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/tooltip/tooltip.js"></script> -->

	<!-- Bootstrap Popover -->

	<!-- <script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/popover/popover.js"></script> -->

	<!-- Bootstrap Progress Bar -->

	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/progressbar/progressbar.js"></script>

	<!-- Bootstrap Buttons -->

	<!-- <script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/button/button.js"></script> -->

	<!-- Bootstrap Collapse -->

	<!-- <script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/collapse/collapse.js"></script> -->

	<!-- Superclick -->

	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/superclick/superclick.js"></script>

	<!-- Input switch alternate -->

	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/input-switch/inputswitch-alt.js"></script>

	<!-- Slim scroll -->

	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/slimscroll/slimscroll.js"></script>

	<!-- Slidebars -->

	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/slidebars/slidebars.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/slidebars/slidebars-demo.js"></script>

	<!-- PieGage -->

	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/charts/piegage/piegage.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/charts/piegage/piegage-demo.js"></script>

	<!-- Screenfull -->

	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/screenfull/screenfull.js"></script>

	<!-- Content box -->

	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/content-box/contentbox.js"></script>

	<!-- Overlay -->

	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/overlay/overlay.js"></script>

	<!-- Widgets init for demo -->

	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/js-init/widgets-init.js"></script>

	<!-- Theme layout -->

	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/themes/admin/layout.js"></script>

	<!-- Theme switcher -->

	<script type="text/javascript" src="${ctxStatic}/templates/3/assets/widgets/theme-switcher/themeswitcher.js"></script>

</div>

</body>
<script type="text/javascript">
	mini.parse();
	var _mainMenuId="${fns:getConfig('sys.defaultMenuId')}";//'91';//主业id务系统
	genMenuSub( '91' );
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
		hideUserPanel() ;

		newTabPage("我的信息",  "${ctx}/sys/user/info", true,"info","openUserInfo");

	}
	function modifyUserPassword(  ) {
		hideUserPanel() ;
		newTabPage("修改密码",  "${ctx}/sys/user/modifyPwd", true,"info","modifyUserPassword");

	}
	function hideUserPanel(  ) {
		$('.offcanvas-overlay').remove() ;
		$('#kt_quick_user').removeClass('offcanvas-on');
		$('#kt_body').removeAttr('data-offcanvas-offcanvas');


	}
</script>
<!--end::Body-->
</html>