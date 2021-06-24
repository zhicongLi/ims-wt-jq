<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<html>
<head>
	 <title>申请延期</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" /> 
</head>
<body>
	
	<div id="editform" class="form" style="width:100%;">
		<table class="formtable" style="border-collapse:separate; border-spacing:10px;">
				<tr>
					<td>有效期延长到：</td>
					<td>
						<input name="delayTime" id="delayTime" allowInput="false" class="mini-datepicker" showTime="true"  vtype = "" format="yyyy-MM-dd HH:mm:ss" required="true" />
					</td>
					
				</tr>
				<tr id="dutyLeaderTr">
					<td>
					<c:choose>
						<c:when test="${param.wtType=='1'||param.wtType=='2'}">
							值长或值班负责人：
						</c:when>
						<c:otherwise>
							值(或单元长)长
						</c:otherwise>
					</c:choose>
					</td>
					<td >
						<input name="dutyLeader" id="dutyLeaderName_" textName="dutyLeaderName" onbuttonclick="sign_('dutyLeaderName_','100')" allowInput="false"  class="mini-buttonedit defSign_" vtype = "" required="true" onvaluechanged="updateSignTime('dutyLeader')"/>
					    <!-- <input name="dutyLeader" id="dutyLeaderName_" textName="dutyLeaderName" onbuttonclick="openFingerVerify('100','dutyLeaderName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="true" onvaluechanged="updateSignTime('dutyLeader')"/> -->
					</td>
					<td>签字时间：</td>
					<td><input name="dutyLeaderTime" id="dutyLeaderTime"
							class="mini-datepicker" showTime="true" vtype=""
							format="yyyy-MM-dd HH:mm:ss" allowInput="false"
							style="width: 180px;" required="true"/></td>
				</tr>
				<tr id="permitByTr">
					<td>
						<c:choose>
							<c:when test="${param.wtType=='1'||param.wtType=='2'}">
								工作许可人：
							</c:when>
							<c:otherwise>
								运行值班负责人：
							</c:otherwise>
						</c:choose>
					
					</td>
					<td>
						<c:choose>
							<c:when test="${param.wtType=='1'||param.wtType=='2'}">
								<input name="permitBy" id="permitByName_" textName="permitByName" onbuttonclick="sign_('permitByName_','3')" allowInput="false"  class="mini-buttonedit defSign_" vtype = "" required="true" onvaluechanged="updateSignTime('permitBy')"/> 
							    <!-- <input name="permitBy" id="permitByName_" textName="permitByName" onbuttonclick="openFingerVerify('3','permitByName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="true" onvaluechanged="updateSignTime('permitBy')"/> -->
							</c:when>
							<c:otherwise>
								<input name="permitBy" id="permitByName_" textName="permitByName" onbuttonclick="sign_('permitByName_','100')" allowInput="false"  class="mini-buttonedit defSign_" vtype = "" required="true" onvaluechanged="updateSignTime('permitBy')"/> 
							    <!-- <input name="permitBy" id="permitByName_" textName="permitByName" onbuttonclick="openFingerVerify('100','permitByName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="true" onvaluechanged="updateSignTime('permitBy')"/> -->
							</c:otherwise>
						</c:choose>
						
					</td>
					<td>签字时间：</td>
					<td><input name="permitByTime" id="permitByTime"
							class="mini-datepicker" showTime="true" vtype=""
							format="yyyy-MM-dd HH:mm:ss" allowInput="false"
							style="width: 180px;" required="true"/></td>
				</tr>
				<tr>
					<td>工作负责人签名：</td>
					<td >
						<input name="workLeader" id="applyDelayWorkLeaderName_" textName="workLeaderName" onbuttonclick="sign_('applyDelayWorkLeaderName_','1')" allowInput="false"  class="mini-buttonedit defSign_" vtype = "" required="true" onvaluechanged="updateSignTime('workLeader')"/> 
						<!-- <input name="workLeader" id="applyDelayWorkLeaderName_" textName="workLeaderName" onbuttonclick="openFingerVerify('1','applyDelayWorkLeaderName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="true" onvaluechanged="updateSignTime('workLeader')"/> -->
						<!-- <a class="mini-button"  id="applyDelayWorkLeaderName_" name="applyDelayWorkLeaderName_" value="1" onClick="sign(this.name,this.value)">签字</a> -->
					</td>
					<td>签字时间：</td>
					<td><input name="workLeaderTime" id="workLeaderTime"
							class="mini-datepicker" showTime="true" vtype=""
							format="yyyy-MM-dd HH:mm:ss" allowInput="false"
							style="width: 180px;"  required="true"/></td>
				</tr>
				
			</table>
			<br>
		
			<!-- <input class="mini-hidden" name="workLeader" id="applyDelayWorkLeader"/> -->
			<!-- <input class="mini-hidden" name="dutyLeader" id="dutyLeader"/> -->
			<input class="mini-hidden" name="id" id="id" value="${param.wtId}"/>
			<input class="mini-hidden" name="wtId" id="wtId" value="${param.wtId}"/>
			
			<input class="mini-hidden"  id="workLeader"  value="${param.applyDelayWorkLeader}"/> 
			<input class="mini-hidden" name="wtType" id="wtType" value="${param.wtType}"/>
			<!-- 新增 责任部门2020.01.03 -->
			<input class="mini-hidden" id="dutyOrgId" name="dutyOrgId" value="${param.dutyOrgId }"/>
			
			<div id="buttonDiv" style="text-align:center;margin-top: 100px">
				<a class="mini-button" iconCls="icon-check" id="confimButton" style="width:70px;" onclick="onLovOk()">确定</a>
				<span style="display:inline-block;width:25px;"></span>
				<a class="mini-button" iconCls="icon-close" id="resetButton" style="width:70px;" onclick="onLovCancel()">取消</a>
			</div>
			</div>
			<jsp:include page="/WEB-INF/views/include/sign.jsp"></jsp:include>
			<sys:toolbarfooter></sys:toolbarfooter>
<%-- <jsp:include page="permit.jsp"></jsp:include> --%>
		
<script type="text/javascript">
	initBase({
		
	});
	//申请延期
	function onLovOk()
	{	
		var wtId = mini.get("wtId").getValue();
		var applyDelayWorkLeaderName  = mini.get("applyDelayWorkLeaderName_").getText();
		var dutyLeaderName = mini.get("dutyLeaderName_").getText();
		var dutyLeader = mini.get("dutyLeaderName_").getValue();
		var applyDelayWorkLeader = mini.get("applyDelayWorkLeaderName_").getValue();
		var delayTime = mini.get("delayTime").getFormValue();
		var permitBy = mini.get("permitByName_").getValue();
		var permitByName = mini.get("permitByName_").getText();
		var workLeaderTime = mini.get("workLeaderTime").getFormValue();
		var permitByTime = mini.get("permitByTime").getFormValue();
		var dutyLeaderTime = mini.get("dutyLeaderTime").getFormValue();
		var form = new mini.Form("#editform");
		form.validate();
	    if (form.isValid() == false) {
	        showMessageBox("警告","保存失败,请检查输入内容(必填项,格式错误等)!","warning");
	        return;
	    }
		$.ajax({
			url:"${ctx}/wo-wt/wo/woWt/applyDelay",
			data:{wtId:wtId,applyDelayWorkLeaderName:applyDelayWorkLeaderName,
				permitBy:permitBy,permitByName:permitByName,dutyLeaderName:dutyLeaderName,
				dutyLeader:dutyLeader,applyDelayWorkLeader:applyDelayWorkLeader,
				delayTime:delayTime,workLeaderTime:workLeaderTime,permitByTime:permitByTime,dutyLeaderTime:dutyLeaderTime},
			type:"post",
            success: function (o) {
            	var data = mini.decode(o);
        		if(data.type=="E"){
        			showMessageBox("错误",data.message,"error");
        			
        		}else{
        			//showMessageBox("提示",data.message,"info");
        			var form = new mini.Form("#editform");
        			form.setEnabled(false);
        			mini.get("confimButton").setVisible(false);
        			mini.get("resetButton").setVisible(false);
        			mini.get("applyDelayWorkLeaderName_").setEnabled(false);
           			mini.get("dutyLeaderName_").setEnabled(false);
           			mini.get("permitByName_").setEnabled(false);
           			mini.get("workLeaderTime").setEnabled(false);
           			mini.get("permitByTime").setEnabled(false);
           			mini.get("dutyLeaderTime").setEnabled(false);
           			closeWindow("ok");
        			
        		}
    		}
		});
		
		
	}
	//页面载入之前,查询是否有相应的数据,如果有则隐藏确认和取消按钮
	window.onload=function(){
		var wtType = mini.get("wtType").getValue();
		var permitByTr = document.getElementById("permitByTr");
		var dutyLeaderTr = document.getElementById("dutyLeaderTr");
		
		if(wtType=="1"){
			permitByTr.style.display="none";
			dutyLeaderTr.style.display="";
		}else if(wtType=="2"){
			dutyLeaderTr.style.display="none";
			permitByTr.style.display="";
		}else{
			dutyLeaderTr.style.display="";
			permitByTr.style.display="";
		}
		var wtId = mini.get("wtId").getValue();
		$.ajax({
			url:"${ctx}/wo-wt/wo/woWtDelay/getData",
			data:{wtId:wtId},
			type:"post",
            success: function (o) {
            	var data = mini.decode(o);
            	if(data!=null&&data!=""){
            		var form = new mini.Form("#editform");
           			//form.setData(data);
           			form.setEnabled(true);
           			mini.get("confimButton").setVisible(true);
           			mini.get("resetButton").setVisible(true);
           			mini.get("applyDelayWorkLeaderName_").setEnabled(true);
           			mini.get("dutyLeaderName_").setEnabled(true);
           			mini.get("permitByName_").setEnabled(true);
           			mini.get("workLeaderTime").setEnabled(true);
           			mini.get("permitByTime").setEnabled(true);
           			mini.get("dutyLeaderTime").setEnabled(true);
            	}
    		}
		});
		
	}
	function updateSignTime(name){		
		if(name=="workLeader"){
			mini.get("workLeaderTime").setValue(new Date());
		}else if(name=="permitBy"){
			mini.get("permitByTime").setValue(new Date());
		}else if(name=="dutyLeader"){
			mini.get("dutyLeaderTime").setValue(new Date());
		}
	}
</script>
</body>

</html>