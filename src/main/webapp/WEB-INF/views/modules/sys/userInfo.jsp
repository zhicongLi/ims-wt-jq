<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>个人信息</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css"
	rel="stylesheet" />
</head>
<body>
	<div class="mini-fit">
		<div style="width:100%;height:35px;">
				<div class="mini-toolbar" id="_tbForm" style="border-bottom:0;padding:0px;position: fixed;z-index: 999;">
					<table style="width:100%;">
						<tr>
							<td style="width:100%;">
								<a class="mini-button" id="_tbForm_save" iconCls="icon-save" style="color:green;" accessKey="s" onclick="newSave()" plain="true" tooltip="保存"></a>
			                    <a class="mini-button" id="_tbForm_changePass" iconCls="icon-lock" style="color:blue;" accessKey="s" onclick="changePassword()" plain="true" tooltip="修改密码"></a>
			                    <!-- <a class="mini-button" id="_tbForm_changeOrgId" iconCls="icon-pencil" style="color:red;" accessKey="s" onclick="changeOrg()" plain="true" tooltip="更改部门"></a> -->
								<span class="separator"></span>
			                    <a class="mini-button" id="_tbForm_refresh" iconCls="icon-refresh" onclick="refreshFormData()" plain="true" tooltip="刷新"></a>
								<a class="mini-menubutton" id="_tbForm_op" iconCls="icon-cogs"  plain="true" menu="#_pmForm" tooltip="操作"></a>
							</td>
						</tr>
					</table>
			
				</div>
			</div>
		<div id="editform" class="form"
			style="width: 100%; height: 100%;">
			<div class="container" style="width: 100%;">
				<div class="mini-clearfix ">
					<div class="mini-col-12">
	
						<div class="mini-panel" title="基本信息" width="auto"
							height="500" showCollapseButton="true"
							onbuttonclick="onPanelButtonClick" name="_panel_exp">
				<input  name="id" id="id" class="mini-hidden" value="${user.id }">
				 <input  name="orgIdOld" id="orgIdOld" class="mini-hidden" value="${user.orgId }">
				 
				<table border="0" cellpadding="5" cellspacing="5" >
					<tr>
						<td style="text-align:right;">登录名：</td>
						<td >
							<input name="loginName" id="loginName" readonly="true"  width="200" class="mini-textbox"  value="${user.loginName }" />
						</td>
							<td style="text-align:right;">名称：</td>
						<td >
						   <input name="name" id="name" class="mini-textbox" vtype = "" readonly="true" width="200"  value="${user.name}"/>
						</td>
						<td style="text-align: right;" ></td>
						<td rowspan="4" style="max-height: 150;max-width: 150;">
							<input class="mini-hidden" name="photo" id="photo"  value="${user.photo }"/> <sys:ckfinder 
								input="photo" type="images" uploadPath="/photo"
								selectMultiple="false" maxWidth="150" maxHeight="150" />
						</td>
				    </tr>
					<tr>
						<td style="text-align:right;">部门：</td>
						<td >
						  <%--  <input name="orgId" id="orgId" class="mini-textbox" vtype = "" readonly="true"  width="200"  value="${user.org.name}"/> --%>
							<input name="orgId" id="orgId" class="mini-buttonedit"  textName="orgName" required="false"  width="200"  onbuttonclick="updateOrg"  />
						</td>
						<td style="text-align:right;">手机：</td>
						<td >
						   <input name="mobile" id="mobile" class="mini-textbox" vtype = "float"  width="200"  value="${user.mobile }"/>
						</td>

				    </tr>
				    <tr>
						<td style="text-align:right;">岗位：</td>
						<td colspan="3">
						   <input name="posCode" id="posCode" class="mini-textbox" vtype = "" readonly="true" width="100%"  value="${pgPos }" />
						</td>
				    </tr>

					<tr>
						<td style="text-align:right;">上次登录ip：</td>
						<td >
						   <input name="ip" id="ip" class="mini-textbox" vtype = "" readonly="true" width="200" value="${user.oldLoginIp}"/>
						</td>
						<td style="text-align:right;">邮箱：</td>
						<td>
						   <input name="email" id="email" class="mini-textbox"  vtype="email"  width="200"  value="${user.email }"/>
						</td>
						
					</tr>
					<tr>
						<td style="text-align:right;">角色：</td>
						<td colspan="9">
						   <input name="roleName" id="roleName" class="mini-textarea" vtype = "" readonly="true"  width="100%" height="100"   value="${roleNames}"/>
						</td>
						
					</tr>
				</table>
	     			</div>
	     		</div>
	   		 </div>
	    	</div>
	    </div>
	 </div>
	     

	<script type="text/javascript">
		initBase({
			
		});
		loadWindow();
		function newSave(){
			var id = mini.get("id").getValue();
			var photo = mini.get("photo").getValue();
			var email = mini.get("email").getValue();
			var mobile = mini.get("mobile").getValue();
			var orgId = mini.get("orgId").getValue();
			var form = new mini.Form("#editform");
			var photoUrl = $("#photo").val();
			if(photoUrl==null||photoUrl==""){
				photo = null;	
			}
			form.validate();
		    if (form.isValid() == false) {
		        showMessageBox("警告","保存失败,请检查输入内容(必填项,格式错误等)!","warning");
		        return;
		    }
        	$.ajax({
		        url: "${ctx}/sys/sysUserNew/save",
		        data: {id:id, photo: photo,email:email,mobile:mobile,orgId:orgId},
		        type: "post",
		        success: function (o) {
		        	var data = mini.decode(o);
	        		if(data.type=="E"){
	        			showMessageBox("错误",data.message,"error");
	        			
	        		}else if(data.type=="I"){
	        			showTipM("info","提示",data.message);
	        		}
		        }
		     });
					
		}
		function changePassword(){
			mini.open({
				//targetWindow: window.top,   //页面对象。默认是顶级页面。
     		    url: "${ctx}/sys/user/modifyPwd",     //页面地址
     		    title: "修改密码",      //标题
     		    width: 400,      //宽度
     		    height: 450,     //高度
     		    allowResize: true,       //允许尺寸调节
     		    allowDrag: true,         //允许拖拽位置
     		    showCloseButton: true,   //显示关闭按钮
     		    showMaxButton: true,     //显示最大化按钮
     		    showModal: true,         //显示遮罩
     		    loadOnRefresh: true,       //true每次刷新都激发onload事件
     		    onload: function () {       //弹出页面加载完成
     		      /*  var iframe = this.getIFrameEl(); 
     		        var data = {};       
     		        //调用弹出页面方法进行初始化
     		        iframe.contentWindow.SetData(data); 
     		        */                
     		    },ondestroy:function(action){
     		    	/* if(action=="ok"){
     		    		showTipM("info","提示","申请延期成功！");
     		    		refreshFormData(); 
     		    	} */
     		    }
			});
		}
		
		window.onload=function(){
			var id = mini.get("id").getValue();
			$.ajax({
		        url: "${ctx}/sys/sysUser/get",
		        data: {id:id},
		        type: "post",
		        async: false,
		        success: function (o) {
		        	var data = mini.decode(o);
		        	mini.get("mobile").setValue(data.mobile);
		        	mini.get("email").setValue(data.email);
		        	mini.get("orgIdOld").setValue(data.orgId);
		        }
		     });
			var orgId = mini.get("orgIdOld").getValue();
			$.ajax({
		        url: "${ctx}/sys/sysOrg/get",
		        data: {id:orgId},
		        type: "post",
		        async: false,
		        success: function (o) {
		        	var data = mini.decode(o);
		        	mini.get("orgId").setValue(data.id);
		        	mini.get("orgId").setText(data.name);
		        }
		     });
		}
		
		function updateOrg(){
			var org = mini.get("orgId");
			popLov(org,'选择部门',true,true,'${ctx}/sys/sysOrg/list',850,500,'id,name','orgId,orgName',null,function (data){
				for (var i = 0, l = data.length; i < l; i++) {
					var row = data[i];
		           
		        
					mini.get("orgId").setValue(row.id);
		        	mini.get("orgId").setText(row.name);
		            
		            
		        } 
			});
		}
	</script>
</body>
</html>