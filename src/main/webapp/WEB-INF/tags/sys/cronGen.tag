<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="Id"%>

<a name="${id}Buttom" id="${id}Buttom" class="mini-button">...</a>

<script type="text/javascript">
$(function() {
       $("#${id}Buttom").cronGen({
           direction : 'bottom',
           objId : '${id}'
       });
   });
</script>
