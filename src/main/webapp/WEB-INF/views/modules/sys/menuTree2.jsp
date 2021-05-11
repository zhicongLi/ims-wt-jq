<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	 <c:set var="menuList" value="${fns:getMenuList()}"/>
     <c:set var="firstMenu" value="true"/>
     <c:forEach items="${menuList}" var="menu" varStatus="idxStatus">
		 <%--menu日常工作管理--%>
		 <c:if test="${menu.parentId eq (not empty param.parentId ? param.parentId:1)&&menu.isShow eq '1'&&(empty menu.type||menu.type eq '0')}">
               <%--<ul class="treeview-menu"   id="menu-${menu.id}" data-parent="${menu.parentId}" >--%>
                    <li class="treeview menuLevel2"  id="menu-${menu.id}" data-parent="${menu.parentId}">
                           <a  data-id="${menu.id}"  data-text="${menu.name}" data-parent="#menu-${param.parentId}" data-href="#menu-${menu.id}" href="#">

							   <i class="fa fa-${fn:substring(not empty fn:trim(menu.icon) ? fn:trim(menu.icon) : 'icon-sticky-note-o',5,-1)}"></i>
                               <span>${menu.name}</span>
                               <c:set var="existChild" value="false" />
                               <c:forEach items="${menuList}" var="menuTemp">
                                   <%--menu3集团任务--%>
                                   <c:if test="${menuTemp.parentId eq menu.id&&menuTemp.isShow eq '1'&&(empty menuTemp.type||menuTemp.type eq '0')}">
                                       <c:set var="existChild" value="true"/>
                                   </c:if>
                               </c:forEach>
                               <c:if test="${existChild}">
                                   <span class="pull-right-container">  <i class="fa fa-angle-left pull-right"></i> </span>
                               </c:if>
                           </a>
						   <ul class="treeview-menu" >
                               <c:forEach items="${menuList}" var="menu2">
								   <%--menu2工作任务计划--%>
                                   <c:if test="${menu2.parentId eq menu.id&&menu2.isShow eq '1'&&(empty menu2.type||menu2.type eq '0')}">
                                       <li class="treeview">
                                           <a  data-id="${menu2.id}" data-href=".menu-${menu2.id}" data-text="${menu2.name}" href="${not empty menu2.href&&fn:indexOf(menu2.href, '://') eq -1 ? ctx : ''}${not empty menu2.href ? menu2.href : '#'}" target="${not empty menu2.target ? menu2.target : 'mainFrame'}" >
                                               <c:set var="existChild" value="false" />
                                               <c:forEach items="${menuList}" var="menuTemp">
                                                   <%--menu3集团任务--%>
                                                   <c:if test="${menuTemp.parentId eq menu2.id&&menuTemp.isShow eq '1'&&(empty menuTemp.type||menuTemp.type eq '0')}">
                                                       <c:set var="existChild" value="true"/>
                                                   </c:if>
                                               </c:forEach>
                                               <c:choose>
                                                   <c:when test="${existChild}">
                                                       <i class="fa fa-folder-o"></i>
                                                   </c:when>
                                                   <c:otherwise>
                                                       <i class="fa fa-${fn:substring(not empty fn:trim(menu2.icon) ? fn:trim(menu2.icon) : 'icon-sticky-note-o',5,-1)}"></i>
                                                   </c:otherwise>
                                               </c:choose>
                                               <span>${menu2.name}</span>
                                               <c:if test="${existChild}">
                                                   <span class="pull-right-container">  <i class="fa fa-angle-left pull-right"></i> </span>
                                               </c:if>
										   </a>
                                           <ul class="treeview-menu" >
                                               <c:forEach items="${menuList}" var="menu3">
												   <%--menu3集团任务--%>
												   <c:if test="${menu3.parentId eq menu2.id&&menu3.isShow eq '1'&&(empty menu3.type||menu3.type eq '0')}">
                                                       <li class="treeview">
                                                           <a data-id="${menu3.id}" data-href=".menu-${menu3.id}" data-text="${menu3.name}" href="${not empty menu3.href&&fn:indexOf(menu3.href, '://') eq -1 ? ctx : ''}${not empty menu3.href ? menu3.href : '#'}" target="${not empty menu3.target ? menu3.target : 'mainFrame'}" >
                                                               <c:set var="existChild" value="false" />
                                                               <c:forEach items="${menuList}" var="menuTemp">
                                                                   <%--menu3集团任务--%>
                                                                   <c:if test="${menuTemp.parentId eq menu3.id&&menuTemp.isShow eq '1'&&(empty menuTemp.type||menuTemp.type eq '0')}">
                                                                       <c:set var="existChild" value="true"/>
                                                                   </c:if>
                                                               </c:forEach>
                                                               <c:choose>
                                                                   <c:when test="${existChild}">
                                                                       <i class="fa fa-folder-o"></i>
                                                                   </c:when>
                                                                   <c:otherwise>
                                                                       <i class="fa fa-${fn:substring(not empty fn:trim(menu3.icon) ? fn:trim(menu3.icon) : 'icon-sticky-note-o',5,-1)}"></i>
                                                                   </c:otherwise>
                                                               </c:choose>

                                                               <span>${menu3.name}</span>

                                                               <c:if test="${existChild}">
                                                                   <span class="pull-right-container">  <i class="fa fa-angle-left pull-right"></i> </span>
                                                               </c:if>
                                                           </a>
                                                           <ul class="treeview-menu"  >
                                                               <c:forEach items="${menuList}" var="menu4">
                                                                   <%--menu3集团任务--%>
                                                                   <c:if test="${menu4.parentId eq menu3.id&&menu4.isShow eq '1'&&(empty menu4.type||menu4.type eq '0')}">
                                                                       <li class="treeview">
                                                                           <a data-id="${menu4.id}" data-href=".menu-${menu4.id}" data-text="${menu4.name}" href="${not empty menu4.href&&fn:indexOf(menu4.href, '://') eq -1 ? ctx : ''}${not empty menu4.href ? menu4.href : '#'}" target="${not empty menu4.target ? menu4.target : 'mainFrame'}" >
                                                                               <c:set var="existChild" value="false" />
                                                                               <c:forEach items="${menuList}" var="menuTemp">
                                                                                   <%--menu4集团任务--%>
                                                                                   <c:if test="${menuTemp.parentId eq menu4.id&&menuTemp.isShow eq '1'&&(empty menuTemp.type||menuTemp.type eq '0')}">
                                                                                       <c:set var="existChild" value="true"/>
                                                                                   </c:if>
                                                                               </c:forEach>
                                                                               <c:choose>
                                                                                   <c:when test="${existChild}">
                                                                                       <i class="fa fa-folder-o"></i>
                                                                                   </c:when>
                                                                                   <c:otherwise>
                                                                                       <i class="fa fa-${fn:substring(not empty fn:trim(menu4.icon) ? fn:trim(menu4.icon) : 'icon-sticky-note-o',5,-1)}"></i>
                                                                                   </c:otherwise>
                                                                               </c:choose>
                                                                               <span>${menu4.name}</span>

                                                                               <c:if test="${existChild}">
                                                                                   <span class="pull-right-container">  <i class="fa fa-angle-left pull-right"></i> </span>
                                                                               </c:if>
                                                                           </a>


                                                                       </li>
                                                                   </c:if>
                                                               </c:forEach>
                                                           </ul>

                                                       </li>
                                                   </c:if>
                                              </c:forEach>
                                           </ul>
                                       </li>
                                       <c:set var="firstMenu" value="false"/>
                                   </c:if>
                               </c:forEach>
                           </ul>
                    </li>
                <%--</ul>--%>
          </c:if>
    </c:forEach>
