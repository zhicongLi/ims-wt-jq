<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="tb_id" type="java.lang.String" required="false" description="Id"%>
<%@ attribute name="div_id" type="java.lang.String" required="false" description="divId"%>
<%@ attribute name="func" type="java.lang.String" required="false" description="调用函数"%>
<%@ attribute name="url" type="java.lang.String" required="false" description="路径"%>
<%@ attribute name="pageCount" type="java.lang.String" required="false" description="总页数"%>
<%@ attribute name="pageIndex" type="java.lang.String" required="false" description="起始"%>
<%@ attribute name="pageSize" type="java.lang.String" required="false" description="每页大小"%>
<%@ attribute name="readFlag" type="java.lang.String" required="false" description="读取标记"%>
<%@ attribute name="procDefKey" type="java.lang.String" required="false" description="流程id"%>
<%@ attribute name="needVar" type="java.lang.String" required="false" description="needVar"%>
<%@ attribute name="isToDo" type="java.lang.String" required="false" description="是否是待办"%>

<div class="input-group" style="height: 35px">
	<div id="facebook" hidden="true">
	  <div class="bar"></div>
	  <div class="bar"></div>
	  <div class="bar"></div>
	</div>
	<div class="input-group" style="width: 200px;display: inline-table;" align="center">
		<input type="hidden" name="id" value="${tb_id }">
		<input type="hidden" name="func" value="${func }">
		<input type="hidden" name="url" value="${url }">
		<input type="hidden" name="pageCount" value="${pageCount }">
		<input type="hidden" name="pageIndex" value="${pageIndex }">
		<input type="hidden" name="pageSize" value="${pageSize }">
		<input type="hidden" name="readFlag" value="${readFlag }">
		<input type="hidden" name="procDefKey" value="${procDefKey }">
		<input type="hidden" name="needVar" value="${needVar }">
		<input type="hidden" name="isToDo" value="${isToDo }">
		<input type="hidden" id="pageNoReal" value="1">
		<span class="input-group-btn">
			<button class="btn btn-default first_page" type="button" id="first_page" pid="${div_id}" style="height: 35px">
				&laquo;&laquo;
			</button>
			<button class="btn btn-default prev_page" type="button" id="prev_page" pid="${div_id}" style="height: 35px">
				&laquo;
			</button>
		</span>
		<input type="text" id="pageNo" class="form-control pageNo" value="1" pid="${div_id}" style="text-align: center;height: 35px">
		<span class="input-group-btn">
			<button class="btn btn-default next_page" type="button" id="next_page" pid="${div_id}" style="height: 35px">
				&raquo;
			</button>
			<button class="btn btn-default last_page" type="button" id="last_page" pid="${div_id}" style="height: 35px">
				&raquo;&raquo;
			</button>
		</span>
	</div><!-- /input-group -->
	<div class="input-group"  style="display: inline-table;float: right;padding-left: 20px"><h5 style="vertical-align: middle;line-height: 40px">共&nbsp;&nbsp;<span class="count" style="font-weight: bold;"></span>&nbsp;&nbsp;页</span></h5></div>
</div>
<script>

</script>