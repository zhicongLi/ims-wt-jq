<%@ tag language="java" pageEncoding="UTF-8"%>
<!--导出Excel相关HTML-->
<div id="_excelImportWin" class="mini-window" title="Excel导入" style="width:350px;"
	 showModal="true" allowResize="true" allowDrag="true"
>

	<div id="_excelImportForm" class="form" >
		<input class="mini-hidden" name="importGridId" id="importGridId"  />
		<table style="width:100%;">


			<tr>
				<td style="width:60px;">文件：</td>
				<td style="width:250px;" id="_excelImportFile_td">
					<input width="250" class="mini-htmlfile"   id="_excelImportFile" name="excelFile"  />
				</td>

			</tr>


		</table>
	</div>
	<div class="mini-toolbar"  style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
		<a class="mini-button" style="width:60px;" onclick="excelImportOk()">确定</a>
		<span style="display:inline-block;width:25px;"></span>
		<a class="mini-button" style="width:60px;" onclick="excelImportCancel()">取消</a>
	</div>
</div>
