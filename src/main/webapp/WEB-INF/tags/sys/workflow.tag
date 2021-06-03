<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/editControl.js"></script>
<%@ attribute name="flowKey" type="java.lang.String" required="true" description="工作流key"%>

<div id="bpmPopBox" style="display: none;background-color: transparent;z-index: 10001;width: 900px;height: 600px;position:fixed;top:0;right:0;left:0;bottom:0;margin:auto;">
	<div class="content">
		<iframe id="flowIframe" src="" frameborder="none" style="width:100%;height:100%;"></iframe>
	</div>
</div>
<script type="text/javascript">
	/************************* 流程相关begin ****************************/
	var bpmPopBox = document.getElementById("bpmPopBox");

	//打开流程对话框
	function popBox() {
		bpmPopBox.style.display = "block";
	};

	//关闭流程对话框
	function closeBox() {
		bpmPopBox.style.display = "none";
	}

	function wfAfterLoad(o){
		clearBpmButtons();				//清除流程操作按钮方法，请自行实现
		var id = mini.get("id").getValue();  	//获取业务数据ID
		var iamCode = '${param.iamCode}';
		if(!iamCode) {
			iamCode = getCookie('iamCode'); 	//获取iamCode
		}
		var url = "${fns:getConfig('workflow.url')}/agilebpm-ui/bpm/vueForm/processFlowPop2.html?validateBizForm=true&flowKey=${flowKey }&bizId="+id+"&iamCode=" + iamCode;
		$("#flowIframe").attr("src",url);
		editControl.afterLoad(o);
	}

	//添加流程按钮
	function addBpmButtons(buttonId,buttonName){
		sysToolBar_.addButtonOption({
			buttonId:'_tb'+buttonId+"_",
			functionStr:'onBpmButtonClick(\''+buttonId+'\')',
			tooltip:buttonName,
			name: buttonName,
			toolBarId:'toolbarformmain_td_overflow_div_'
		});
	}

	//清除流程按钮
	function clearBpmButtons() {
		$("#toolbarformmain_td_overflow_div_").html("");
	}

	//流程按钮响应事件
	function onBpmButtonClick(buttonId){
		var data = {
			eventName: 'parentClickButton',
			alias:buttonId,
			data:{}
		};
		sendBpmMsg(data);
		popBox();
	}

	function sendBpmMsg(info) {
		document.getElementById('flowIframe').contentWindow.postMessage(info, "*" );
	}

	//监听流程事件
	window.addEventListener("message", function(e) {
		if(!e || !e.data || !e.data.eventName) {
			//无效事件
			return;
		}
		handleBpmMsg(e.data.eventName, e.data);
	});

	//处理流程消息
	function handleBpmMsg(eventName, msg) {
		if('bpm_closeDialog' === eventName) {
			//关闭工作流弹出对话框
			closeBox();
			return;
		} else if('bpm_opResult' === eventName) {
			//操作处理成功
			if(msg.success) {
				closeBox();
				refreshFormData();
				// wfAfterLoad();
			}
			return;
		} else if('flowDataLoaded' === eventName ) {
			editControl.afterFlowLoad(msg);
			//页面加载成功，添加页面button
			var buttonList = msg.buttonList;
			if (buttonList && buttonList.length > 0) {
				for (var i = 0; i < buttonList.length; i++) {
					var button = buttonList[i];
					addBpmButtons(button.alias, button.name);
				}
			}
			//流程启动后页面不可编辑(by xzc)
			// if(msg.bpmTask){
			// 	setToolbarStatus(false);
			// }else{
			// 	setToolbarStatus(true);
			// }
		} else if('toValidateBizForm' === eventName) {
			//执行表单校验
			var data = {
				eventName: 'validateBizFormCallback',// 表单校验的callBack Event
				isValid: true, // 校验是否成功，若成功才提交流程
				invalidMsg: '表单身份证必填', //校验失败若需要提示消息，则返回消息，否则请自行提示
				flowVariables: {"test": "2"}, // 流程变量，会设置到act variables中
				data: {id : mini.get("id").getValue()}
			};
			sendBpmMsg(data);
		}
	}
	var toolbarExcludeBtns = [];
	//控制按钮是否可编辑(控制主表保存、删除不可用，控制子表都不可用)
	function setToolbarStatus(status) {
		$("div.mini-toolbar").each(function (i) {
			var index = [0,1,2,3,4];
			if(i<=1) return;
			if(i==2) index = [2,3];
			$(this).find("a.mini-button").each(function (j) {
				if(index.indexOf(j) != -1){
					var id = $(this).attr("id");
					if(id && toolbarExcludeBtns.indexOf(id)==-1){
						mini.get(id).setEnabled(status);
					}
				}
			})
		})
	}
	/************************* 流程相关end ****************************/
</script>