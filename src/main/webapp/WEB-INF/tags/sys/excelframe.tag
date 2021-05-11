<%@ tag language="java" pageEncoding="UTF-8"%>
<!--导出Excel相关HTML-->
<form id="excelForm" style="display:none;height: 0px;margin: 0px;"  action="" method="post" target="excelIFrame">
	<input type="hidden" name="columns" id="_excelColumns" />
	<input type="hidden" name="dataFilter" id="_excelDataFilter" />
	<input type="hidden" name="key" id="_excelKey" />
	<input type="hidden" name="baseQuery" id="_excelBaseQuery" />
	<input type="hidden" name="specQuery" id="_excelSpecQuery" />
	<input type="hidden" name="baseFilter" id="_excelBaseFilter" />
	<div id="_filter"></div>
</form>
<iframe id="exportIFrame" style="display:none;"></iframe>