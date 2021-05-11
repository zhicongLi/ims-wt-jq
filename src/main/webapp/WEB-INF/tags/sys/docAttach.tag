<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="girdId" type="java.lang.String" required="true" description="表格Id"%>
<!--文档附件-->

<div id="_docAttachWin" class="mini-window" title="文件上传" style="width:550px;display: none"
	 showModal="true" allowResize="true" allowDrag="true"
>
	<%-- <input class="mini-hidden" name="defaultGridId_" id="defaultGridId_" value="${girdId }"/>
	<input class="mini-hidden" name="docGridId_" id="docGridId_" />
	<input class="mini-hidden" name="docGridSelectUId_" id="docGridSelectUId_" /> --%>
	<div id="_docAttachForm" class="form" >
		<input class="mini-hidden" name="id" />
		<input class="mini-hidden" name="objKey" />
		<input class="mini-hidden" name="objDescr"  />
		<input class="mini-hidden" name="objType"  />
		<input class="mini-hidden" name="folder"  />
		<input class="mini-hidden" name="docPath"  />
		<input class="mini-hidden" name="docAccType"  />
		<input class="mini-hidden" name="docKeyField" id="docKeyField" />
		<input class="mini-hidden" name="objRowUid" id="objRowUid" />
		<input class="mini-hidden" name="docGridId" id="docGridId"  />
		
		<table style="width:100%;">
			<tr>
				<td style="width:80px;">文件：</td>
				<td style="width:250px;" id="file_td">
					<input width="250" class="mini-htmlfile" name="file" id="_fileDocAttach"  /></td>
			</tr>
			<tr>
				<td style="width:80px;">文件名：</td>
				<td style="width:250px;" ><input width="250" readOnly="true" name="docFileName" id="docFileName" class="mini-textbox" /></td>
			</tr>
			<tr>
				<td>描述：</td>
				<td><input width="250" name="descr" id = "descr" class="mini-textbox" /></td>
			</tr>

		</table>
	</div>
	<div class="mini-toolbar"  style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
		<a class="mini-button" iconCls="icon-check" style="width:70px;" onclick="docAttachOk2('${girdId}')">确定</a>
		<span style="display:inline-block;width:25px;"></span>
		<a class="mini-button" iconCls="icon-close" style="width:70px;" onclick="docAttachCancel()">取消</a>
	</div>
</div>
