<%@ tag language="java" pageEncoding="UTF-8"%>
<div id="pnlQuery" class="mini-panel"  title="header" iconCls="icon-add" style="width:100%;height:250px;z-index:999;"
	 allowResize="true" showHeader="false" visible="false" showFooter="true"

>
	<div id="tabsQuery" class="mini-tabs" tabPosition="right"  style="width:100%;height:100%;z-index:999;"  onactivechanged="tabQuerySwitch()" activeIndex="0" plain="true">
		<div title="条件" id="tabRule"  style="border: 0px;z-index:999;" >
			<div id="builder"></div>

		</div>
		<div title="SQL" id="tabSQL"  style="border: 0px;" >
			<div id="result"  style="width:100%;height:100%;" >

				<textarea id="txtSQL" class="mini-textarea" style="width:100%;height:100%;"  emptyText="请输入SQL"></textarea>
			</div>

		</div>
	</div>

	<div property="footer">
		<div class="mini-toolbar" id="_tbQueryFooter"  style="border-bottom:0;padding:0px;">
            <table style="height:100%">
				<tr>
					<td>
						<a class="mini-button" iconCls=""  plain="true" id="_btnSearchDo" tooltip="搜索"><i class="fa fa-search"></i> 搜索</a>
					</td>
					<td>
						<a class="mini-button" iconCls="" id="_btnSearchReset"  plain="true" tooltip="重置"><i class="fas fa-eraser"></i> 重置</a>
					</td>
					<td>
						<a class="mini-button ims-save" iconCls="" id="_btnSearchSave"  plain="true" tooltip="保存查询"><i class="fa fa-save"></i> 保存查询</a>
					</td>
				</tr>

			</table>
		</div>
	</div>

</div>
<script type="text/javascript">
	$("#builder").bind("keydown",function(e){
		// 兼容FF和IE和Opera
		var theEvent = e || window.event;
		var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
		 //alert(code);
		if (code == 13) {
			//回车执行查询
			//searchAdvGrid();
			$('#_btnSearchDo').focus();
			$('#_btnSearchDo').click();
		}
	});
//	$('#builder').keypress(function(event){
//		//do something here
//		alert(this.id);
//	})
</script>