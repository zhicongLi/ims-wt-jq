<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="Id"%>
<%@ attribute name="chartId" type="java.lang.String" required="true" description="BI图形ID"%>
<%@ attribute name="width" type="java.lang.String" required="true" description="宽度"%>
<%@ attribute name="height" type="java.lang.String" required="true" description="高度"%>
<%@ attribute name="style" type="java.lang.String" required="false" description="风格"%>
<div style="width:100%;height:100%">
	<div id="_container${id}" style="width: ${width}; height: ${height};${style}"></div>

	<script type="text/javascript">
		var _BIChart_${id}=initBIChart("_container${id}",${chartId},null);
	</script>
</div>