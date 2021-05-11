<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="showDelegate" type="java.lang.String" required="false" description="是否显示委派转办" %>

<div class="mini-toolbar" id="_tbWF" style="border-bottom:0;padding:0px;">
	<table style="width:100%;">
		<tr>
			<td style="width:100%;">
				<a class="mini-button" id="_tbWF_prev" iconCls="" onclick="prevData()" plain="true" tooltip="上一条"><i class="fa fa-arrow-left"></i></a>
				<a class="mini-button" id="_tbWF_next" iconCls="" onclick="nextData()" plain="true" tooltip="下一条"><i class="fa fa-arrow-right"></i></a>
				<span class="separator"></span>
				 
				<a class="mini-button" id="_tbWF_submit"  iconCls=""  style="color:green;"  onclick="submitFlow('1')" plain="true" tooltip="提交"><i class="fa fa-check"></i> 提交</a>
				<c:if test="${showDelegate=='true' }">
				
					<a class="mini-button" id="_tbWF_transfer"  iconCls=""     onclick="submitFlow('2')" plain="true" tooltip="转办"><i class="fa fa-thumbs-up"></i> 转办</a>
					<a class="mini-button" id="_tbWF_delegate"  iconCls=""  onclick="submitFlow('3')" plain="true" tooltip="委派"><i class="fa fa-hand-right"></i> 委派</a>
				
				</c:if>
				
				<span class="separator"></span>

				<a class="mini-button" id="_tbWF_refresh" iconCls="fa-refresh" onclick="refreshFormData()" plain="true" tooltip="刷新"></a>
				<a class="mini-menubutton" id="_tbWF_op" iconCls="fa-cogs"  plain="true" menu="#_pmForm" tooltip="操作"></a>

				 
			</td>

		</tr>
	</table>

</div>