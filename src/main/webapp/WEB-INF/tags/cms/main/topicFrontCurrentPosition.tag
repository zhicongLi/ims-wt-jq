<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ attribute name="cmsTopic" type="com.treps.modules.cms.entity.CmsTopic" required="true" description="专题对象"%>
当前位置：<a href="${ctx}/index-1${urlSuffix}">首页</a></li><%-- <c:forEach items="${fnc:getCategoryListByIds(category.parentIds)}" var="tpl">
	<c:if test="${tpl.id ne '1'}"><li><span class="divider">/</span> <a href="${ctx}/list-${tpl.id}${urlSuffix}">${tpl.name}</a></li></c:if> 
</c:forEach>--%>-&gt;<a href="${ctx}/list-${cmsTopic.id}${urlSuffix}">${cmsTopic.name}</a>
