<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<style>
.defSign_ .mini-buttonedit-trigger .mini-buttonedit-icon:before
{
	content:"\F040";
}
</style>
<div id="editWindow_" class="mini-window" title="签字" style="width: 500px;" showModal="true" allowResize="false" allowDrag="true">
	<input class="mini-hidden" id="buttonEditId_" value="" /> 
	<input class="mini-hidden" id="qualtType_" value="" />
	<div id="signform_" class="form">
		<table style="width: 100%;">
			<tr>
				<td>用户名：</td>
				<td><input name="signUserName_" id="signUserName_" class="mini-textbox"
					required="true"  vtype="required" requiredErrorText="用户名不能为空"/></td>
				<td>密码：</td>
				<td>
				
				<input type="password" name="password1_"  style="display:none"/>
				<input name="signPassWord_" id="signPassWord_" class="mini-password"
					required="true" vtype="required" requiredErrorText="密码不能为空"/></td>
			</tr>
		</table>
		<div class="mini-toolbar" id="lov_action_bar"
			style="text-align: center; vertical-align: middle; padding-top: 5px; padding-bottom: 5px;"
			borderStyle="border-left:0;border-bottom:0;border-right:0;">
			<a class="mini-button" style="width: 60px;" onclick="toSubmitSign_('sign')">确定</a>
			<span style="display: inline-block; width: 25px;"></span> <a
				class="mini-button" style="width: 60px;" onclick="closeSign_()">取消</a>
			<span style="display: inline-block; width: 25px;"></span> <a
				class="mini-button" style="width: 85px;" onclick="toSubmitSign_('clear')">清除签名</a>
		</div>
	</div>
</div>
<div id="editWindow_2" class="mini-window" title="录入" style="width: 800px;" showModal="true" allowResize="false" allowDrag="true">
	<input class="mini-hidden" id="buttonEditId_2" value="" /> 
	<input class="mini-hidden" id="qualtType_2" value="" />
	<div id="signform_2" class="form">
		<table style="width: 100%;">
			<tr>
				<td>操作项目：</td>
				<td>
 					<input name="opContent" id="opContent" style="width:700px;  height:400px" class="mini-textarea" vtype = ""  required="false"  />

				</td>
			</tr>
		</table>
		<div class="mini-toolbar" id="lov_action_bar2"
			style="text-align: center; vertical-align: middle; padding-top: 5px; padding-bottom: 5px;"
			borderStyle="border-left:0;border-bottom:0;border-right:0;">
			<a class="mini-button" style="width: 60px;" onclick="returnSelectData">确定</a>
			<span style="display: inline-block; width: 25px;"></span> <a
				class="mini-button" style="width: 60px;" onclick="closeSign2_()">取消</a>
		</div>
	</div>
</div>
<div id="exe_back" class="mini-window" title="执行反馈" style="width: 800px;" showModal="true" allowResize="false" allowDrag="true">
	<input class="mini-hidden" id="buttonEditId_2" value="" /> 
	<input class="mini-hidden" id="qualtType_2" value="" />
	<input class="mini-hidden" name="id1" id="id1"/>
	<div id="exe_back_form" class="form">
		<table style="width: 100%;">
			<tr>
				<td colspan="1">工作内容：</td>
				<td colspan="11">
 					<input name="content1" id="content1" style="width:700px;  " class="mini-textbox" vtype = ""  required="false"  />
				</td>
			</tr>
			<tr>
				<td colspan="1">执行状态：</td>
				<td colspan="11">
 					<input name="execDesc1" id="execDesc1"  class="mini-combobox" vtype = ""  required="false" valueField="value" textField="label"  url="${ctx}/ims-ext/sys/dict/listDataStr?type=omLogMeetWork_exec_status" />
				</td>
			</tr>
			<tr>
				<td colspan="1">执行反馈：</td>
				<td colspan="11">
 					<input name="execStatus1" id="execStatus1" style="width:700px;  height:100px" class="mini-textarea" vtype = ""  required="false"  />
				</td>
			</tr>
			<tr>
				<td>用户名：</td>
				<td>
 					<input name="username" id="username" class="mini-textbox" vtype = ""  required="false"  />
				</td>
				<td>密码：</td>
				<td>
 					<input name="password" id="password" class="mini-password" vtype = ""  required="false"  />
				</td>
			</tr>
		</table>
		<div class="mini-toolbar" id="lov_action_bar2"
			style="text-align: center; vertical-align: middle; padding-top: 5px; padding-bottom: 5px;"
			borderStyle="border-left:0;border-bottom:0;border-right:0;">
			<a class="mini-button" style="width: 60px;" onclick="update_exe_back()">确定</a>
			<span style="display: inline-block; width: 25px;"></span> <a
				class="mini-button" style="width: 60px;" onclick="cencel_exe_back()">取消</a>
		</div>
	</div>
</div>
<div id="editWindow_treeSelect" class="mini-window" title="选择典型操作票类型" style="width: 400px;" showModal="true" allowResize="false" allowDrag="true">
	
	<div id="signform_treeSelect" class="form">
		<table style="width: 100%;">
			<tr>
				<td>典型票分类：</td>
				<td>
				<input class="mini-hidden" id="treeName_" name="treeName_" value="" /> 
					<input style="width:180px" name="treeId_" id="treeId_" required="true" textName="treeName_" class="mini-buttonedit"  onbuttonclick="popLov(this,'选择类型',false,true,'${ctx}/wo/woSotTree/lov',850,500,'id,name','treeId_,treeName_','#signform_treeSelect')" />
				</td>
			</tr>
		</table>
		<div class="mini-toolbar" id="lov_action_bar2"
			style="text-align: center; vertical-align: middle; padding-top: 5px; padding-bottom: 5px;"
			borderStyle="border-left:0;border-bottom:0;border-right:0;">
			<a class="mini-button" style="width: 60px;" onclick="toSubmitTreeSelect()">确定</a>
			<span style="display: inline-block; width: 25px;"></span> <a
				class="mini-button" style="width: 60px;" onclick="closeTreeSelect()">取消</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	/* 
	* 打开签字窗口
		buttonEditId元件id，会将签字id和name赋予该元件的value和text属性
		qualtType  资质类型，根据资质表查询是否具有该资质，可以为空
	*/
	function changeStatus(statusValue,procStatus,signName,oldStatus,oldProStatus) {
		var a=parseInt(procStatus)
		var b=parseInt(mini.get("procStatus").getValue())
		if(signName==''){
			mini.get("status").setValue(oldStatus);
			 mini.get("procStatus").setValue(oldProStatus);
		}else{
			if(a>b){
				 mini.get("status").setValue(statusValue);
				 mini.get("procStatus").setValue(procStatus);
			}	
		}
		var data = form.getData();
		 afterLoad(data,true);
			
	}
	
	function sign_(buttonEditId,qualtType){
		
		if(!objIsNotNull(buttonEditId))
		{
			mini.alert("签字参数维护错误，请联系开发人修改！");
			return;
		}
		
		
		//处理兼容两票签字
		var wtType = "";
		var typeCell = mini.get("wtType");//工作票
		if(!objIsNotNull(typeCell))
		{
			typeCell = mini.get("typeId");//操作票
		}
		if(objIsNotNull(typeCell))
		{
			wtType = typeCell.value;
		}
		//有资质内容时
		if(objIsNotNull(qualtType) && !objIsNotNull(wtType))
		{
			mini.alert("请选择票类型！");
			return;
		}
		
		
		
		mini.get("buttonEditId_").setValue(buttonEditId);
		if(typeof(qualtType)!="undefined"){
			mini.get("qualtType_").setValue(qualtType);
		}else{
			mini.get("qualtType_").setValue("");
		}
		   
		var editWindow = mini.get("editWindow_");
		var form = new mini.Form("#signform_");
		form.reset();//清空内容
		editWindow.show();
		//原有获取当前登录者信息
		//var userJson = getCurrUserInfo(false);
		//var user = mini.decode(userJson);
				
		//现有微服务获取当前登录者信息
		 var _currUserStr_ = '${userinfoJson}';
		 var user = JSON.parse(_currUserStr_);
		mini.get("signUserName_").setValue(user.loginName);
		mini.get("signPassWord_").focus();
	}
	function sign2_(buttonEditId,qualtType){//快速录入
		var editWindow = mini.get("editWindow_2");
		var form = new mini.Form("#signform_2");
		form.reset();//清空内容
		editWindow.show();
		
	}

	function toSubmitSign_(oper){
		var signCell = mini.get(mini.get("buttonEditId_").getValue());
		if(oper == 'clear' && !objIsNotNull(signCell.getValue()))
		{
			mini.alert("尚未签名，无需清除");
			return;
		}
		
		//处理兼容两票签字
		var wtType = "";
		var typeCell = mini.get("wtType");//工作票
		if(!objIsNotNull(typeCell))
		{
			typeCell = mini.get("typeId");//操作票
		}
		if(objIsNotNull(typeCell))
		{
			wtType = typeCell.value;
		}
		
		//有资质内容时
		if(objIsNotNull(mini.get("qualtType_").getValue()) && !objIsNotNull(wtType))
		{
			mini.alert("请选择票类型！");
			return;
		}
		var userName =mini.get("signUserName_").value;
		var typeVariable =mini.get("qualtType_").value;
		/* var nameVariable1 = nameVariable.substring(0,nameVariable.length-5);
		var nameVariable2 = nameVariable.substring(0,nameVariable.length-1);
		if(nameVariable=='wtReceiveName_'){
			nameVariable1='wtReceiver';
			nameVariable2='wtReceiveName';
		} */
		var passWord =mini.get("signPassWord_").value;
		
		var form = new mini.Form("#signform_");
		form.validate();
		var errors = form.getErrors();
		if(errors && errors.length > 0)
		{
			var t = errors[0].getRequiredErrorText();
	        mini.alert(t);
	        return;
		}
		var signType = "2";//操作票
		if(mini.get("signType")){
			signType= mini.get("signType").getValue();
		}
		//signType对应签字配置类型
		if(!typeVariable){
			var json = {"userName":userName,"passWord":passWord,"wtType":wtType,"signType":signType};
		}else{
			var json = {"userName":userName,"passWord":passWord,"typeVariable":typeVariable,"wtType":wtType,"signType":signType};
		}
		/* $.ajax({
		        type: "POST",
		        url: "${ctx}/wo-wt/wo/woWt/saveQueryResult",
		        data : json,
		        success: function (text) {
		        	var o = mini.decode(text);		        	
		        	if(o.type == "I"){		        	
		        		var uid = signCell.getValue();
		        		if(oper == "sign")
		        		{
		        			
		        			signCell.setText(o.data.name);
		        			signCell.setValue(o.data.id);
							if(objIsNotNull(signCell.doValueChanged))
							{
								signCell.doValueChanged();
							}
							showTipM("info","提示",o.message);
		        		}
		        		else if(oper == 'clear')
		        		{
		        			if(objIsNotNull(uid) && uid != o.data.id)
		        			{
		        				mini.alert("您不能清除他人签名！");
		        				return;
		        			}
		        			clearSign_();
		        		}
		        		closeSign_();
		        	}if(o.type == "W"){
		        		showMessageBox("提醒",o.message,"warring");
		        	}if(o.type == "E"){
		        		showMessageBox("错误",o.message,"error");
		        	}
					
		        }
		    }) */
			$.ajax({
	          type: "POST",
	          url: "${ctx}/wo-wt/wo/woWt/saveQueryResult",
	          data : json,
	          success: function (text) {
	        	var o = mini.decode(text);
	        	if(o.type == "I"){
	        		//判断签发人，如果签发人和工作负责人为同一个人，则不允许签字
	        		if(typeVariable == "2")
	        		{	if(mini.get("workLeader").getValue()!=null&&mini.get("workLeader").getValue()!=""){
	        			if(o.data.id == mini.get("workLeader").getValue())
		        			{
		        				showMessageBox("提醒","签发人不能和工作负责人相同","warring");
		        				//mini.get(""+nameVariable2+"").setValue("");
								//mini.get(""+nameVariable1+"").setValue("");
								return;
		        			}
	        			}
	        			if(mini.get("wtSignerName_").getValue()!=null&&mini.get("wtSignerName_").getValue()!=""){
		        			if(o.data.id != mini.get("wtSignerName_").getValue())
		        			{
		        				showMessageBox("提醒","工作签发人必须一致","warring");
		        				//mini.get(""+nameVariable2+"").setValue("");
								//mini.get(""+nameVariable1+"").setValue("");
								return;
		        			}
	        			}
	        			
	        			
	        		}else if(typeVariable=="1"){		        			
	        			if(mini.get("woWtLC.nowWorkLeader")!=undefined){
	        				if(mini.get("woWtLC.nowWorkLeader").getValue()!=null&&mini.get("woWtLC.nowWorkLeader").getValue()!=""){
	        					if(o.data.id != mini.get("woWtLC.nowWorkLeader").getValue())
			        			{	
			        				showMessageBox("提醒","工作负责人必须一致！","warring");
			        				//mini.get(""+nameVariable2+"").setValue("");
									//mini.get(""+nameVariable1+"").setValue("");
									return;
			        			}
		        			}else{
		        				if(mini.get("workLeader").getValue()!=null&&mini.get("workLeader").getValue()!=""){
			        				if(o.data.id != mini.get("workLeader").getValue())
				        			{	
				        				showMessageBox("提醒","工作负责人必须一致！","warring");
				        				//mini.get(""+nameVariable2+"").setValue("");
										//mini.get(""+nameVariable1+"").setValue("");
										return;
				        			}
			        			}
		        			}
	        			}else{
	        				if(mini.get("workLeader").getValue()!=null&&mini.get("workLeader").getValue()!=""){
		        				if(o.data.id != mini.get("workLeader").getValue())
			        			{	
			        				showMessageBox("提醒","工作负责人必须一致！","warring");
			        				//mini.get(""+nameVariable2+"").setValue("");
									//mini.get(""+nameVariable1+"").setValue("");
									return;
			        			}
		        			}
	        			}
	        		}else if(typeVariable == "99"){
	        			if(mini.get("workLeader").getValue()!=null&&mini.get("workLeader").getValue()!=""){
	        				if(o.data.id == mini.get("workLeader").getValue())
		        			{	
	        					if(mini.get("buttonEditId_")!=undefined){
	        						var buttonId = mini.get("buttonEditId_").getValue();
	        						if(buttonId=="woWtFire.endExecByName_"||buttonId=="woWtFire.execByName_"){
	        							showMessageBox("提醒","动火执行人和动火负责人不能为同一人！","warring");
				        				//mini.get(""+nameVariable2+"").setValue("");
										//mini.get(""+nameVariable1+"").setValue("");
										return;
	        						}
	        					}
		        				
		        			}
	        			}
	        		}
	        		//var cell = mini.get(mini.get("buttonEditId_").getValue());
	        		var uid = signCell.getValue();
	        		if(oper == "sign")
	        		{
	        			/* if(objIsNotNull(uid) && signCell != o.data.id)
	        			{
	        				mini.alert("需先清除签名信息！");
	        				return;
	        			} */
	        			signCell.setText(o.data.name);
	        			signCell.setValue(o.data.id);
						if(objIsNotNull(signCell.doValueChanged))
						{
							signCell.doValueChanged();
						}
						showTipM("info","提示",o.message);
	        		}
	        		else if(oper == 'clear')
	        		{
	        			if(objIsNotNull(uid) && uid != o.data.id)
	        			{
	        				mini.alert("您不能清除他人签名！");
	        				return;
	        			}
	        			clearSign_();
	        		}
	        		closeSign_();
	        	}if(o.type == "W"){
	        		showMessageBox("提醒",o.message,"warring");
	        	}if(o.type == "E"){
	        		showMessageBox("错误",o.message,"error");
	        	}
				
	        }
	    })
	}

	function closeSign_() {
		var form = new mini.Form("#signform_");
		form.reset();
		var editWindow = mini.get("editWindow_");
	    editWindow.hide();
	}
	function closeSign2_() {
		var form = new mini.Form("#signform_2");
		form.reset();
		var editWindow = mini.get("editWindow_2");
	    editWindow.hide();
	}
	
	//执行反馈的确认
	function update_exe_back(){
		var editWindow = mini.get("exe_back");
		//执行反馈的内容
		var execStatus = mini.get("execStatus1").getValue();
		if(opContent == ""){
			mini.alert("请填写反馈信息");
			editWindow.hide();
			return;
		}
		
		var id = mini.get("id1").getValue();
		var execDesc = mini.get("execDesc1").getValue();
		var username = mini.get("username").getValue();
		var password = mini.get("password").getValue();
		
		var grid = mini.get("gridOmLogMeetWork");
		
		var data={"id":id,"execStatus":execStatus,"execDesc":execDesc,"username":username,"password":password};
		//发送ajax请求
		$.ajax({
			url:"${ctx}/om/omLogMeetWork/exeback",
			data:data,
			type:"POST",
			success:function(data){
				data =  mini.decode(data);
	    		 if(data.type=='I'){
	    			 editWindow.hide();
	    			 mini.alert("执行反馈操作成功");
	    			 grid.reload();
	    			 afterLoad();
	    		 }else if(data.type=='E'){
	    			 mini.alert(data.message);
	    		 }
			}
		});
	}
	
	//执行反馈的取消
	function cencel_exe_back() {
		var form = new mini.Form("#exe_back_form");
		form.reset();
		var editWindow = mini.get("exe_back");
	    editWindow.hide();
	}
	
	function clearSign_()
	{
		var buttonEdit=mini.get("buttonEditId_").getValue();
		var cell = mini.get(buttonEdit);
		if(!cell){
			return;
		}
		cell.setValue("");
		cell.setText("");
		if(objIsNotNull(cell.doValueChanged))
		{
			cell.doValueChanged();
		}
		/* var form = new mini.Form("#signform_");
		form.reset();
		var editWindow = mini.get("editWindow_");
	    editWindow.hide(); */		
	}
	function returnSelectData(){
		var editWindow = mini.get("editWindow_2");
		var opContent = mini.get("opContent").getValue();//获取文本框内容 
		var aa=opContent.replace(regTrimListSeq,'');	
		console.log(aa);
		if(opContent==""){
			editWindow.hide();
			return;
		}
		
		/* if (! opContent.startsWith("\\d")){
			
			alert(opContent.replace(regTrimListSeq,''));
			aa=opContent.replace(regTrimListSeq,'');
		} */
		var arr=opContent.split("\n");//换行符为分割
	
		for(var i=0;i<arr.length;i++){
			var regTrimListSeq = /^[0-9]+、/;
			//在这里新增表格的数据
			var aa=arr[i].replace(regTrimListSeq,'');
			var grid = mini.get("gridWoOtLine");
			var row = {descr:aa};
			grid.addRow(row);
		}
		mini.get("opContent").setValue("");
		editWindow.hide();
	}
	
	function toSubmitTreeSelect(){
		 var treeId = mini.get("treeId_").getValue();
	 	 var treeName = mini.get("treeName_").getValue();
	 	 alert(treeId);
	 	 var id = mini.get("id").getValue();
	 	 var data = {"id":id,"woSot.treeId":treeId,"woSot.treeName":treeName};
	 	showMessageBox(null,"操作中，请稍候......","loading");
	 	//var json = mini.encode(data);
		   var url = "${ctx}/wo/woOt/toTipycal";
		   $.ajax({
		        url: url,
		        data: data,
		        type: "post",
		        success: function (text) {
		        	hideMessageBox();
		        	var o = mini.decode(text);
	       	 	showTipM("info","提示",o.message);
		        },
		        error: function (jqXHR, textStatus, errorThrown) {
		        	hideMessageBox();
		            mini.showMessageBox({
						title: "转标准票失败",    
						message: "转标准票失败",
						buttons: ["确定", "详细"],    
						iconCls: "mini-messagebox-question",
						html: "",
						width:250,
						callback: function(action){
							if(action=='详细')  alert(jqXHR.responseText);
						}
		    	   });
		        }
		    });
	 }
	 function closeTreeSelect(){
		 var editWindow = mini.get("editWindow_treeSelect");
		 	mini.get("treeId_").setValue("");
		 	mini.get("treeName_").setValue("");
		 	mini.get("treeId_").setText("");
			editWindow.hide();
	 }
</script>