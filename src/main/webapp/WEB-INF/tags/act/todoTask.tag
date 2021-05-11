<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%--<%@ attribute name="procInsId" type="java.lang.String" required="true" description="流程实例ID"%>--%>
<%@ attribute name="title" type="java.lang.String" required="true" description="标题" %>
<%@ attribute name="tbodyId" type="java.lang.String" required="true" description="待办内容id" %>
<%@ attribute name="procDefKey" type="java.lang.String" required="true" description="流程定义key" %>
<%@ attribute name="needVar" type="java.lang.String" required="true" description="是否需要流程变量" %>
<%@ attribute name="url" type="java.lang.String" required="true" description="获取分页数据时的url" %>
<%@ attribute name="pageSize" type="java.lang.String" required="true" description="每页显示几条" %>
<%@ attribute name="func" type="java.lang.String" required="true" description="点击分页时调用的方法" %>
<%@ attribute name="isToDo" type="java.lang.String" required="false" description="是否是待办" %>
<c:if test="${needVar!=1 }">
	<c:set var="needVar" value="0"></c:set>
</c:if>
<div id="_${tbodyId }_content_div" style="display: none;">
	<table class="table table-hover" style="table-layout: fixed">
	  	<caption><b>${title }</b></caption>
	  <thead>
	    <tr>
	    <c:if test="${isToDo=='1' }">
	      <th width="32px"></th>
	    </c:if>
	      <th width="50%">任务</th>
	      <th>当前节点</th>
	      <th class="time">日期</th>
	    </tr>
	  </thead>
	  <tbody id="${tbodyId }">
	  </tbody>
	</table>
	<div id = "${tbodyId }Page" align="center">
		<sys:pageTool procDefKey="${procDefKey }" isToDo="${isToDo }" needVar="${needVar }" div_id="${tbodyId }Page" tb_id="${tbodyId }" url="${url }" pageSize="${pageSize }" func="${func }"></sys:pageTool>
	</div>
</div>