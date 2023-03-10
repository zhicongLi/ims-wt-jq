<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@  include file="/WEB-INF/views/include/taglib.jsp"%>
<%@  include  file="/WEB-INF/views/include/head.jsp" %>

<html>
<head>


	<title>${fns:getConfig('productName')}</title>
	<meta charset="UTF-8">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">


	<link rel="stylesheet" href="${ctxStatic}/templates/5/css/main.css">
	<link rel="stylesheet" href="${ctxStatic}/templates/5/css/index.css">
	<script type="text/javascript" src="${ctxStatic}/templates/5/js/swiper.min.js"></script>
	<link rel="stylesheet" href="${ctxStatic}/templates/5/css/swiper.min.css">
		<script type="text/javascript" src="${ctxStatic}/templates/5/js/echarts.js"></script>
	<script src="${ctxStatic}/templates/5/js/main.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/5/js/controller.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/5/js/left-side-menu.js"></script>
	<link rel="stylesheet" href="${ctxStatic}/templates/5/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ctxStatic}/templates/5/css/bootstrap-select.css">
	<link rel="stylesheet" href="${ctxStatic}/templates/5/css/build.css">
	<script type="text/javascript" src="${ctxStatic}/templates/5/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/templates/5/js/bootstrap-select.js"></script>

	<link rel="stylesheet" href="${ctxStatic}/templates/5/css/bootstrap-datepicker.css">
	<script type="text/javascript" src="${ctxStatic}/templates/5/js/bootstrap-datepicker.js"></script>


	<script type="text/javascript">
		curUsers =  null;
		$.ajax({
			url:"${ctx}/ims-idms/sysuser/getSysUser?code=" + getCookie('iamCode'),
			async: false,
			type: "post",
			data: {
			},
			success: function (data) {
				curUsers = mini.decode(data).data;
			},
			error: function (jqXHR, textStatus, errorThrown) {
			}
		});

		class TreeBuilder {
			constructor(data) {
				this.makeTree(data);
			}

			makeTree(list) {
				const root = {};

				// ?????? ID ???????????????????????????
				const map = list.reduce((nodes, node) => {
					nodes[node.id] = node;
					return nodes;
				}, {});

				// ????????????????????? pid????????????????????????????????????
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
				// buildChildren ??? buildNode ???????????????????????????
				return this.buildChildren(this.tree,rootId,false,topMenu,1);
			}

			/**
			 * ???????????????
			 */
			buildChildren(parent,rootId,subMenu,topMenu,level) {


				if(subMenu){
                    var ulClass='';
                    if(level==2){
                        ulClass='class="scroll"'
                    }else if(level==3){
                        ulClass='class="third"'
                    }else if(level==4){
                        ulClass='class="four"'
                    }

					var $ul2 = $('<ul '+ ulClass+' >');
		            if(topMenu==true){

						$ul2 = $('<ul >');
					}
					parent.children
							.map(node => this.buildNode(node,topMenu,level))
							.forEach(node => $ul2.append(node))

					;
					return $ul2;
				}else{
					var $ul = $('#'+rootId);

					parent.children
							.map(node => this.buildNode(node,topMenu,level))
							.forEach(node => $ul.append(node))

					;
					return $ul;
				}


			}

			/**
			 * ??????????????????????????????????????? buildChildren ????????????
			 */
			buildNode(node,topMenu,level) {
				var $li=null ;
				var icon_class=node.icon;
				if(topMenu){
                    if(objIsNotNull(icon_class)){
                        icon_class='fa '+icon_class.replace('icon-','fa-');
                    }
                    //???????????????
                    if (node.children && node.children.length) {
                        var liClass = '';
                        var aClass = '';
                        if (topMenu == true) {
                            liClass = '';
                            aClass = '';
                        }
                        if (level >= 2) {
                            if (objIsNotNull(icon_class)) {
                                $li = $('<li ' + liClass + ' >').append(
                                    $('<a ' + aClass + ' href="#" >')
                                        .append($('<i class="' + icon_class + '"></i>'))
                                        .append($('<span>').text(node.name || ""))
                                        .append($('<i class="my-icon lsm-sidebar-jt"></i>'))
                                    //.attr("href", node.href || "#")
                                );
                            } else {
                                $li = $('<li ' + liClass + ' >').append(
                                    $('<a ' + aClass + ' href="#" >')
                                        .append($('<span>').text(node.name || ""))
                                        .append($('<i class="my-icon lsm-sidebar-jt"></i>'))
                                    //.attr("href", node.href || "#")
                                );
                            }


                        } else {
                            if (objIsNotNull(icon_class)) {
                                $li = $('<dd ' + liClass + ' >').append(
                                    $('<a ' + aClass + ' href="#" >')
                                        .append($('<i class="' + icon_class + '"></i>'))
                                        .append($('<span>').text(node.name || ""))
                                    //.attr("href", node.href || "#")
                                );
                            } else {
                                $li = $('<dd ' + liClass + ' >').append(
                                    $('<a ' + aClass + ' href="#" >')
                                        .append($('<span>').text(node.name || ""))
                                    //.attr("href", node.href || "#")
                                );
                            }
                        }

                        $li.append(this.buildChildren(node, node.id, true, topMenu, level + 1));
                    } else {

                        var aClass = '';
                        if (topMenu == true) {

                            aClass = '';
                        }

                        if (level >= 2) {
                            if (objIsNotNull(icon_class)) {
                                $li = $('<li  >').append(
                                    $('<a ' + aClass + ' >')
                                        .append($('<i class="' + icon_class + '" ></i>'))
                                        .append($('<span>').text(node.name || ""))
                                        .attr("href", 'javascript:onNodeSelectNew(' + JSON.stringify(node).replace(/'/g, '&quot;') + ');')
                                );
                            } else {
                                $li = $('<li >').append(
                                    $('<a ' + aClass + ' >')
                                        .append($('<span>').text(node.name || ""))
                                        .attr("href", 'javascript:onNodeSelectNew(' + JSON.stringify(node).replace(/'/g, '&quot;') + ');')
                                );
                            }
                        }else{
                            if (objIsNotNull(icon_class)) {
                                $li = $('<dd  >').append(
                                    $('<a ' + aClass + ' >')
                                        .append($('<i class="' + icon_class + '" ></i>'))
                                        .append($('<span>').text(node.name || ""))
                                        .attr("href", 'javascript:onNodeSelectNew(' + JSON.stringify(node).replace(/'/g, '&quot;') + ');')
                                );
                            } else {
                                $li = $('<dd >').append(
                                    $('<a ' + aClass + ' >')
                                        .append($('<span>').text(node.name || ""))
                                        .attr("href", 'javascript:onNodeSelectNew(' + JSON.stringify(node).replace(/'/g, '&quot;') + ');')
                                );
                            }
                        }
                    }
                }else {//topmenu==false


                    if (objIsNotNull(icon_class)) {
                        icon_class = 'my-icon lsm-sidebar-icon fa fa-2x ' + icon_class.replace('icon-', 'fa-');
                    }
                    //???????????????
                    if (node.children && node.children.length) {
                        var liClass = '';
                        var aClass = '';
                        if (topMenu == true) {
                            liClass = '';
                            aClass = '';
                        }
                        if (level >= 2) {
                            if (objIsNotNull(icon_class)) {
                                $li = $('<li ' + liClass + ' >').append(
                                    $('<a ' + aClass + ' href="#" >')
                                        .append($('<i class="' + icon_class + '"></i>'))
                                        .append($('<span>').text(node.name || ""))
                                        .append($('<i class="my-icon lsm-sidebar-jt"></i>'))
                                    //.attr("href", node.href || "#")
                                );
                            } else {
                                $li = $('<li ' + liClass + ' >').append(
                                    $('<a ' + aClass + ' href="#" >')
                                        .append($('<span>').text(node.name || ""))
                                        .append($('<i class="my-icon lsm-sidebar-jt"></i>'))
                                    //.attr("href", node.href || "#")
                                );
                            }


                        } else {
                            if (objIsNotNull(icon_class)) {
                                $li = $('<li ' + liClass + ' >').append(
                                    $('<a ' + aClass + ' href="#" >')
                                        .append($('<i class="' + icon_class + '"></i>'))
                                        .append($('<span>').text(node.name || ""))
                                    //.attr("href", node.href || "#")
                                );
                            } else {
                                $li = $('<li ' + liClass + ' >').append(
                                    $('<a ' + aClass + ' href="#" >')
                                        .append($('<span>').text(node.name || ""))
                                    //.attr("href", node.href || "#")
                                );
                            }
                        }

                        $li.append(this.buildChildren(node, node.id, true, topMenu, level + 1));
                    } else {

                        var aClass = '';
                        if (topMenu == true) {

                            aClass = '';
                        }


                        if (objIsNotNull(icon_class)) {
                            $li = $('<li  >').append(
                                $('<a ' + aClass + ' >')
                                    .append($('<i class="' + icon_class + '" ></i>'))
                                    .append($('<span>').text(node.name || ""))
                                    .attr("href", 'javascript:onNodeSelectNew(' + JSON.stringify(node).replace(/'/g, '&quot;') + ');')
                            );
                        } else {
                            $li = $('<li >').append(
                                $('<a ' + aClass + ' >')
                                    .append($('<span>').text(node.name || ""))
                                    .attr("href", 'javascript:onNodeSelectNew(' + JSON.stringify(node).replace(/'/g, '&quot;') + ');')
                            );
                        }
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
						if(action=='??????')  viewErrorDetail(jqXHR.responseText);
					}
					var buttonsTemp=["ok","??????"];
					showMessageBox("??????","??????????????????","error",null,callback,buttonsTemp,true);

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
						if(action=='??????')  viewErrorDetail(jqXHR.responseText);
					}
					var buttonsTemp=["ok","??????"];
					showMessageBox("??????","??????????????????","error",null,callback,buttonsTemp,true);

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
						if(action=='??????')  viewErrorDetail(jqXHR.responseText);
					}
					var buttonsTemp=["ok","??????"];
					showMessageBox("??????","??????????????????","error",null,callback,buttonsTemp,true);

				}
			});

			return res;
		}




	</script>
</head>

<body>
<div id="wrapper">
	<div class="left-side-menu lsm-mini">
		<div class="lsm-container">
			<a href="#" class="logo_nav"><img src="${ctxStatic}/templates/5/images/icon/logo.png"></a>
			<div class="lsm-scroll">
				<div class="lsm-sidebar scroll">
					<ul id="_leftMenu">

					</ul>
				</div>
				<button type="button" class="more_btn"></button>
			</div>
			<div class="menu_botton_btn">
				<a href="javascript:;"><span class="a1"></span><label><p>???????????????</p></label></a>
				<a href="javascript:;"><span class="a2"></span><label><p>????????????</p></label></a>
				<a href="javascript:;"><span class="a3"></span><label><p>????????????</p></label></a>
			</div>
		</div>
	</div>

	<div class="F-mcsas F-mcsas-top">
		<div class="toper_cont">
			<header class="toper">
				<a href="#" class="top_logo"><img src="${ctxStatic}/templates/5/images/icon/logo2.png" /></a>
				<div class="Main_nav">
					<ul>
						<li class="nav1">
							<a href="#">????????????????????????</a>
						</li>
                        <li class="nav2" >
                            <a href="#"><i></i>????????????<span class="i_jt"></span></a>
                            <dl id="_topMenu">
                                
                            </dl>
                        </li>
					</ul>

				</div>
                <div class="top_right">
                    <ul>
                        <li class="li1">
                            <div class="search_top_box">
                                <form>
                                    <input type="text" placeholder="">
                                    <button type="submit"></button>
                                </form>
                            </div>
                        </li>
                        <li class="li2">
                            <i></i><font>3</font>
                        </li>
                        <li class="li3">
                            <i></i><font>3</font>
                        </li>
                        <li class="li4">
                            <i></i><font>3</font>
                        </li>
                        <li class="li5">
                            <select class="selectpicker">
                                <option>??????</option>
                                <option>?????????</option>
                                <option>?????????</option>
                            </select>
                        </li>
                    </ul>
                </div>
			</header>
		</div>
		<!--?????? -->
		<div class="contain">
			<div class="F-public F-public_mb_R" data-wsize="100%" data-hsize="100%">
                <div id="_mainTabs" class="mini-tabs" activeIndex="0" style="width:100%;height:100%;" showNavMenu="true" arrowPosition="side"
                     plain="false" onactivechanged="onTabsActiveChanged" onbeforecloseclick="onTabsBeforeClose"  contextMenu="#_tabsMenu"
                >
                    <div title="??????" id="_tabHome" name="_tabHome" iconCls="fa fa-home" >
                        <div class="zjy_box">


                            <div class="list_table">
                                <div class="F-public_box">
                                    <div class="F-public one" data-wsize="100%" data-hsize="70%">
                                        <div class="F-public" data-wsize="24%" data-hsize="100%">
                                            <div class="F-public-box F-public" data-wsize="100%" data-hsize="61.5%">
                                                <div class="F-box">
                                                    <div class="yjzqs_content">
                                                        <div class="list_table dataTables_wrapper">
                                                            <table border="0" border="0" cellspacing="0" cellpadding="0">
                                                                <tbody class="show_tbody">
                                                                <tr>
                                                                    <td width="25%" class="first">??????????????????</td>
                                                                    <td width="25%">239</td>
                                                                    <td width="25%">???????????????</td>
                                                                    <td width="25%">2</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="first">??????????????????</td>
                                                                    <td>239</td>
                                                                    <td>???????????????</td>
                                                                    <td>2</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="first">??????????????????</td>
                                                                    <td>239</td>
                                                                    <td>???????????????</td>
                                                                    <td>2</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="first">??????????????????</td>
                                                                    <td>239</td>
                                                                    <td>???????????????</td>
                                                                    <td>2</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="first">??????????????????</td>
                                                                    <td>239</td>
                                                                    <td>???????????????</td>
                                                                    <td>2</td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="F-public-box F-public" data-wsize="100%" data-hsize="38.5%">
                                                <div class="F-box">
                                                    <div class="yjzqs_content">
                                                        <h4 class="title" style="line-height:30px;">
                                                            <b>????????????</b><a href="#" class="more"></a>
                                                        </h4>
                                                        <div class="list_table dataTables_wrapper">
                                                            <table border="0" border="0" cellspacing="0" cellpadding="0">
                                                                <tbody class="show_tbody">
                                                                <tr>
                                                                    <td width="40%" class="first">?????????????????????</td>
                                                                    <td width="30%">2020-05-02</td>
                                                                    <td width="30%">?????????</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="first">?????????????????????</td>
                                                                    <td>020-05-02</td>
                                                                    <td>?????????</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="first">?????????????????????</td>
                                                                    <td>020-05-02</td>
                                                                    <td>?????????</td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="F-public-box F-public" data-wsize="50.5%" data-hsize="100%">
                                            <div class="F-box">
                                                <div class="img">
                                                    <img src="${ctxStatic}/templates/5/images/dczy/1.png">
                                                    <div class="position">
                                                        <input type="text" name="" placeholder="???????????????????????????">
                                                        <button type="button" class="position_icon"></button>
                                                    </div>
                                                    <button type="button" class="scale"></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="F-public right_none" data-wsize="25.5%" data-hsize="100%">
                                            <div class="F-public-box F-public" data-wsize="100%" data-hsize="61.5%">
                                                <div class="F-box">
                                                    <div class="yjzqs_content">
                                                        <h4 class="title" style="line-height:30px;">
                                                            <b>????????????</b><a href="#" class="more"></a>
                                                        </h4>
                                                        <div class="list_table dataTables_wrapper">
                                                            <table border="0" border="0" cellspacing="0" cellpadding="0">
                                                                <tbody class="show_tbody">
                                                                <tr>
                                                                    <td width="40%" class="first">????????????</td>
                                                                    <td width="30%">????????????</td>
                                                                    <td width="30%">?????????</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="first">????????????????????????????????????</td>
                                                                    <td>2020-05-03</td>
                                                                    <td>?????????</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="first">5????????????????????????????</td>
                                                                    <td>2020-05-03</td>
                                                                    <td>?????????</td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="F-public-box F-public" data-wsize="100%" data-hsize="38.5%">
                                                <div class="F-box">
                                                    <div class="yjzqs_content">
                                                        <h4 class="title" style="line-height:30px;">
                                                            <b>??????????????????????????????</b><a href="#" class="more"></a>
                                                        </h4>
                                                        <div class="list_table dataTables_wrapper">
                                                            <table border="0" border="0" cellspacing="0" cellpadding="0">
                                                                <tbody class="show_tbody">
                                                                <tr>
                                                                    <td width="25%" class="first">??????</td>
                                                                    <td width="25%">??????</td>
                                                                    <td width="25%">??????</td>
                                                                    <td width="25%">??????</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="first">?????????</td>
                                                                    <td>10</td>
                                                                    <td>GIS???</td>
                                                                    <td>0</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="first">????????????</td>
                                                                    <td>10</td>
                                                                    <td>#1???</td>
                                                                    <td>0</td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="F-public two" data-wsize="100%" data-hsize="30%">
                                        <div class="F-public-box F-public" data-wsize="24%" data-hsize="100%">
                                            <div class="F-box">
                                                <h4 class="title" style="line-height:30px;">
                                                    <b>?????????????????????</b><a href="#" class="more"></a>
                                                </h4>
                                                <div class="echart" id="zzt"></div>
                                            </div>
                                        </div>
                                        <div class="F-public-box F-public" data-wsize="50.5%" data-hsize="100%">
                                            <div class="swiper-container swiper_box">
                                                <div class="swiper-wrapper">
                                                    <div class="swiper-slide">
                                                        <div class="img">
                                                            <img src="${ctxStatic}/templates/5/images/dczy/4.jpg">
                                                        </div>
                                                        <div class="text">
                                                            <div class="cont">
                                                                <p><font>????????????:</font><span>??????????????????????????????????????</span></p>
                                                                <p><font>????????????:</font><span>2020-05-06  12:27:33</span></p>
                                                                <p><font>????????????:</font><span>??????????</span></p>
                                                                <p><font>???????????????:</font><span>?????????</span></p>
                                                                <p><font>????????????:</font><span>18888888888</span></p>
                                                            </div>
                                                            <div class="btn_two">
                                                                <button type="button" class="dqjk">????????????</button>
                                                                <button type="button" class="zctz">????????????</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="swiper-slide">
                                                        <div class="img">
                                                            <img src="${ctxStatic}/templates/5/images/dczy/4.jpg">
                                                        </div>
                                                        <div class="text">
                                                            <div class="cont">
                                                                <p><font>????????????:</font><span>??????????????????????????????????????</span></p>
                                                            </div>
                                                            <div class="btn_two">
                                                                <button type="button" class="dqjk">????????????</button>
                                                                <button type="button" class="zctz">????????????</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="swiper-slide">
                                                        <div class="img">
                                                            <img src="${ctxStatic}/templates/5/images/dczy/4.jpg">
                                                        </div>
                                                        <div class="text">
                                                            <div class="cont">
                                                                <p><font>????????????:</font><span>??????????????????????????????????????</span></p>
                                                            </div>
                                                            <div class="btn_two">
                                                                <button type="button" class="dqjk">????????????</button>
                                                                <button type="button" class="zctz">????????????</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Add Pagination -->
                                                <div class="swiper-pagination pagination_1"></div>
                                            </div>
                                        </div>
                                        <div class="F-public-box F-public right_none" data-wsize="25.5%" data-hsize="100%">
                                            <div class="F-box">
                                                <h4 class="title" style="line-height:30px;">
                                                    <b>????????????????????????</b><a href="#" class="more"></a>
                                                </h4>
                                                <div class="list_table dataTables_wrapper">
                                                    <table border="0" border="0" cellspacing="0" cellpadding="0">
                                                        <tbody class="show_tbody">
                                                        <tr>
                                                            <td width="25%" class="first">?????????</td>
                                                            <td width="25%">??????</td>
                                                            <td width="25%">?????????</td>
                                                            <td width="25%">??????</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="first">????????????</td>
                                                            <td>10</td>
                                                            <td>????????????</td>
                                                            <td>0</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="first">????????????</td>
                                                            <td>10</td>
                                                            <td>????????????</td>
                                                            <td>0</td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

			</div>
		</div>
		<!--?????? -->
	</div>

</div>
<script src="${ctxStatic}/templates/5/js/jquery.nicescroll.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
				var swiper = new Swiper('.swiper_box', {
					pagination: {
						el: '.swiper-pagination',
						clickable:true
					},
					autoplay: {
						delay: 3000,
						disableOnInteraction: false,
					},
				});
			}
</script>

<ul id="_tabsMenu" class="mini-contextmenu"   onbeforeopen="onBeforeOpen">
	<li onclick="refreshTab">??????</li>
	<li onclick="closeTab">???????????????</li>
	<li onclick="closeAllBut">?????????????????????</li>
	<li onclick="closeAll">?????????????????????</li>
</ul>
<script type="text/javascript">
	mini.parse();
	var _mainMenuId="${fns:getConfig('sys.defaultMenuId')}";//'91';//??????id?????????
	var _mainMenuText="${fns:getConfig('sys.defaultMenuText')}";//'91';//??????id?????????
	genMenuSub(_mainMenuId);

	$("#_mainMenuText").html(_mainMenuText);
	var _currMenuId=null;//????????????????????????id
	_mainTabs = mini.get("_mainTabs");
	_mainTabs.setHeight(document.body.clientHeight-90);
	var currentTab = null;
	//var firstCheckRootMenu = mini.get("_rootMenuItem_"+_mainMenuId);
	//var _leftMenuTree = null;
	//var _main_splitter = mini.get("_main_splitter");
	//if(objIsNotNull(firstCheckRootMenu)){
	//	onRootMenuClick(firstCheckRootMenu,_mainMenuId);
	//}
	var _defaultHomePage="${fns:getConfig('sys.defaultHomePage')}";
	var tabHome=_mainTabs.getTab('_tabHome');
	tabHome.url='${ctx}'+_defaultHomePage;
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
				showMessageBox("??????","?????????????????????!","warning");
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
			if(!homeLoaded){//????????????????????????
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
		newTabPage("????????????",  "${ctx}/sys/user/info", true);

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
			if (!confirm("???????????????????????????????????????????????????")) {
				return;
			}
		}
		clearStorage();
		_mainTabs.reloadTab(currentTab);
		setParentChangedFlag(false);
	}
	function closeTab() {
		var allTabs=_mainTabs.getTabs ( );
		if(currentTab.title!='??????'){
			if(currentTab.title.substring(0,1)=="*"){
				if (!confirm("???????????????????????????????????????????????????")) {
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
					if (!abandon&&!confirm("???????????????????????????????????????????????????")) {
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
				if (!abandon&&!confirm("???????????????????????????????????????????????????")) {
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
			//newTabPage("??????", data, true);
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

			//???????????????url??????????????????????????????????????????????????????url??????
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
				if (!confirm("???????????????????????????????????????????????????")) {
					e.cancel=true;
				}
			}
		}
	}

	function openUserInfo( ) {


		newTabPage("????????????",  "${ctx}/sys/user/info", true,"info","openUserInfo");

	}
	function modifyUserPassword(  ) {

		newTabPage("????????????",  "${ctx}/sys/user/modifyPwd", true,"info","modifyUserPassword");

	}

</script>

</body>

<!--end::Body-->
</html>