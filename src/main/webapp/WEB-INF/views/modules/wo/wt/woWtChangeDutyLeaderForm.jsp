<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<html>
<head>
	 <title>变更负责人</title>
	 <meta name="decorator" content="default"/>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" /> 
	 
</head>
<body >
	
	<div id="editform" class="form" style="width:100%;">
		<table class="formtable" style="border-collapse:separate; border-spacing:10px;">
			<tr>
					<td>原工作负责人：</td>
					<td>
						<input style="width:180px" name="oldWorkLeader" id="oldWorkLeader" required="true" textName="oldWorkLeaderName" class="mini-buttonedit" allowInput="false" onbuttonclick="	popLov(this,'选择人员',false,true,'${ctx}/sys/sysUser/sysMisList',850,500,'id,name','oldWorkLeader,oldWorkLeaderName');"  /> 
					</td>
					<td>新工作负责人：</td>
					<td>
						<%-- <input style="width:180px" name="nowWorkLeader" id="nowWorkLeader" required="true" textName="nowWorkLeaderName" class="mini-buttonedit" allowInput="false" onbuttonclick="popLov(this,'选择人员',false,true,'${ctx}/sys/sysUser/sysMisList',850,500,'id,name','nowWorkLeader,nowWorkLeaderName')" />  --%>
				      	<input style="width:180px" name="nowWorkLeader" id="nowWorkLeader" required="true" textName="nowWorkLeaderName" class="mini-buttonedit" allowInput="false" onbuttonclick="findUserName(this)" /> 		       				       
				    </td>				
				</tr>				
				<tr>
					<td>工作签发人:</td>
					<td >
						<input name="wtSigner" id="wtChangeDutyLeaderSignerName_" style="width:180px"  textName="wtSignerName" onbuttonclick="sign_('wtChangeDutyLeaderSignerName_','2')" allowInput="false"  class="mini-buttonedit defSign_" vtype = "" required="true" /> 
						<!-- <input name="wtSigner" id="wtChangeDutyLeaderSignerName_" style="width:180px"textName="wtSignerName" onbuttonclick="openFingerVerify('2','wtChangeDutyLeaderSignerName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="true" /> -->
						<!-- <a class="mini-button"  id="wtChangeDutyLeaderSignerName_" name="wtChangeDutyLeaderSignerName_" value="2" onClick="sign(this.name,this.value)">签字</a> -->
					</td>
					<td>
						<c:choose>
							<c:when test="${wtType=='3'||wtType=='1' }">
								运行值班负责人：
							</c:when>
							<c:otherwise>
								工作票许可人：
							</c:otherwise>
						</c:choose>
					</td>
					<td >
						<c:choose>
							<c:when test="${wtType=='3'||wtType=='1' }">
							   <input name="permitBy" id="permitByName_" style="width:180px"  textName="permitByName" onbuttonclick="sign_('permitByName_','100')" allowInput="false"  class="mini-buttonedit defSign_" vtype = "" required="true" /> 
							  <!--  <input name="permitBy" id="permitByName_" style="width:180px"textName="permitByName" onbuttonclick="openFingerVerify('100','permitByName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="true" /> --> 
							</c:when>
							<c:otherwise>
								<input name="permitBy" id="permitByName_" style="width:180px"  textName="permitByName" onbuttonclick="sign_('permitByName_','3')" allowInput="false"  class="mini-buttonedit defSign_" vtype = "" required="true" /> 
								<!-- <input name="permitBy" id="permitByName_" style="width:180px"textName="permitByName" onbuttonclick="openFingerVerify('3','permitByName_')" allowInput="false" class="mini-buttonedit defSign_" vtype="" required="true" /> -->
							</c:otherwise>
						</c:choose>
						
					</td>
				</tr>
				<tr>
					<td>变动时间：</td>
					<td>
						<input name="changeTime" style="width:180px"  id="changeTime" class="mini-datepicker" showTime="true"  vtype = "" format="yyyy-MM-dd HH:mm:ss" required="true"  allowInput="false"/> 
					</td>
				</tr>								
			</table>
			<br>						
			<input class="mini-hidden" name="workLeader" id="workLeader" value="${workLeader }"/>
			<input class="mini-hidden" name="workLeaderName" id="workLeaderName" value="${workLeaderName }"/>
			<input class="mini-hidden" name="nowWorkLeaderName" id="nowWorkLeaderName"/>
			<input class="mini-hidden" name="oldWorkLeaderName" id="oldWorkLeaderName"/>
			<input class="mini-hidden" id="wtSignerName_" value="${wtChangeDutyLeaderSigner}"/>
			<!-- <input class="mini-hidden" name="wtSigner" id="wtChangeDutyLeaderSigner" /> -->
			<input class="mini-hidden" name="id" id="id" value="${wtId }"/>
			<input class="mini-hidden" name="wtId" id="wtId" value="${wtId }"/>
			<!-- <input class="mini-hidden" name="permitBy" id="permitBy"/> -->
			<input class="mini-hidden" name="wtType" id="wtType" value="${param.wtType}"/>
			<!-- 新增 责任部门2020.01.03 -->
			<input class="mini-hidden" id="dutyOrgId" name="dutyOrgId" value="${dutyOrgId }"/>
			<div id="buttonDiv" style="text-align:center;margin-top: 200px">
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
		    
	var form = new mini.Form("#editform");
	loadWindow();
	//变更负责人
	function onLovOk()
	{	
		var wtId = mini.get("wtId").getValue();
		var oldWorkLeader  = mini.get("oldWorkLeader").getValue();
		var nowWorkLeader = mini.get("nowWorkLeader").getValue();
		var wtChangeDutyLeaderSignerName = mini.get("wtChangeDutyLeaderSignerName_").getText();
		var permitByName = mini.get("permitByName_").getText();
		var wtChangeDutyLeaderSigner = mini.get("wtChangeDutyLeaderSignerName_").getValue();
		var permitBy = mini.get("permitByName_").getValue();
		var wtChangeDutyLeaderSigner = mini.get("wtChangeDutyLeaderSignerName_").getValue();
		var changeTime = mini.get("changeTime").getFormValue();
		var nowWorkLeaderName  = mini.get("nowWorkLeaderName").getValue();
		var oldWorkLeaderName = mini.get("oldWorkLeaderName").getValue();
		var form = new mini.Form("#editform");
		form.validate();
	    if (form.isValid() == false) {
	        showMessageBox("警告","保存失败,请检查输入内容(必填项,格式错误等)!","warning");
	        return;
	    }
		
		$.ajax({
			url:"${ctx}/wo/woWt/changeDutyLeader",
			data:{wtId:wtId,oldWorkLeader:oldWorkLeader,nowWorkLeader:nowWorkLeader,
				wtChangeDutyLeaderSignerName:wtChangeDutyLeaderSignerName,permitByName:permitByName,wtChangeDutyLeaderSigner:wtChangeDutyLeaderSigner,permitBy:permitBy,
				changeTime:changeTime,nowWorkLeaderName:nowWorkLeaderName,oldWorkLeaderName:oldWorkLeaderName},
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
        			mini.get("wtChangeDutyLeaderSignerName_").setEnabled(false);
           			mini.get("permitByName_").setEnabled(false);
           			closeWindow("ok");
        			
        		}
    		}
		});
		
		
	}
	//页面载入之前,查询是否有相应的数据,如果有则隐藏确认和取消按钮
	window.onload=function(){
	    var wtId= mini.get("wtId").getValue();
		$.ajax({
			url:"${ctx}/wo/woWtLeaderChange/getData",
			data:{wtId:wtId},
			type:"post",
            success: function (o) {
            	var data = mini.decode(o);
            	if(data!=null&&data!=""){
            		var form = new mini.Form("#editform");
           			//form.setData(data);
           			//form.setEnabled(false);
           			var workLeader = mini.get("workLeader").getValue();
            		var workLeaderName = mini.get("workLeaderName").getValue();
            		mini.get("oldWorkLeader").setValue(workLeader);
            		mini.get("oldWorkLeaderName").setValue(workLeaderName);
            		mini.get("oldWorkLeader").setText(workLeaderName);
            		//原工作负责人不可编辑
            		mini.get("oldWorkLeader").setEnabled(false);
           			mini.get("confimButton").setVisible(true);
           			mini.get("resetButton").setVisible(true);
           			mini.get("wtChangeDutyLeaderSignerName_").setEnabled(true);
           			mini.get("permitByName_").setEnabled(true);
           			
            	}else{
            		var workLeader = mini.get("workLeader").getValue();
            		var workLeaderName = mini.get("workLeaderName").getValue();
            		mini.get("oldWorkLeader").setValue(workLeader);
            		mini.get("oldWorkLeaderName").setValue(workLeaderName);
            		mini.get("oldWorkLeader").setText(workLeaderName);
            		//原工作负责人不可编辑
            		mini.get("oldWorkLeader").setEnabled(false);
            	}
    		}
		}); 
		findWoUserQualLine();
	}
	 
	var userId ;
	//新工作负责人
	function findWoUserQualLine(){
		//获取是哪种工作票
		var wtType = mini.get("wtType").getValue();		
		$.ajax({
			url:"${ctx}/wo/woWt/findWoUserQualLine",
			data:{wo_type:wtType,qual_type:1},
			type:"post",
            success: function (o) {            	
            	userId = o;           	
    		}
		});						
	}
	
	//新负责人的选择事件
	function findUserName(obj){
		var wtType = mini.get("wtType").getValue();	
	    var url = '${ctx}/wo/woWtLeaderChange/newWorKLeaderList?addCan=0&wtType='+wtType+'&qualType=1';
		popLov(obj,'选择人员',false,true,url,850,500,'id,name','nowWorkLeader,nowWorkLeaderName')
	    
	}
</script>
</body>

</html>