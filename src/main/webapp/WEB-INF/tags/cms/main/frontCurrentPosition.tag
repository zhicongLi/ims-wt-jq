<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ attribute name="category" type="com.treps.modules.cms.entity.Category" required="true" description="栏目对象"%>
当前位置：<a title="首页" href="${ctx}/index-1${urlSuffix}">首页</a>
<c:forEach items="${fnc:getCategoryListByIds(category.parentIds)}" var="tpl">
	<c:if test="${tpl.id ne '1'}">-&gt;<a href="${ctx}/list-${tpl.id}${urlSuffix}">${tpl.name}</a></c:if>
</c:forEach>
-&gt;<a href="${ctx}/list-${category.id}${urlSuffix}">${category.name}</a>