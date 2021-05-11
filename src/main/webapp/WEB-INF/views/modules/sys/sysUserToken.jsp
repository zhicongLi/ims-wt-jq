<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>用户Token</title>
<meta name="decorator" content="default" />
<link href="${ctxStatic}/common/trepsui-ext.css" type="text/css"
	rel="stylesheet" />
</head>
<body>

	<div class="mini-fit">
		
		<div id="editform" class="form" style="width:100%;">
					<div class="container"  style="width: 100%;"  >
						<div class="mini-clearfix ">
							<div class="mini-col-12">
								<div class="mini-panel" title="基本信息" width="auto" height="auto"
									  name="_panel_exp"

								>
									<input class="mini-hidden" name="id" id="id"/>
									<table border="0" cellpadding="3" cellspacing="3" >
										<tr>
											<td style="text-align:right;">党组织编号：</td>
											<td>
											   <input name="partyOrgId" id="partyOrgId" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">党组织名称：</td>
											<td>
											   <input name="partyOrgName" id="partyOrgName" class="mini-textbox"   vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">谈话人编号：</td>
											<td>
											   <input name="chatPerson" id="chatPerson" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">谈话人姓名：</td>
											<td>
											   <input name="chatPersonName" id="chatPersonName" class="mini-textbox"   vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">谈话对象编码：</td>
											<td>
											   <input name="chatObject" id="chatObject" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">谈话对象名称：</td>
											<td>
											   <input name="chatObjectName" id="chatObjectName" class="mini-textbox"   vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">类别：</td>
											<td>
											   <input name="typeId" id="typeId" class="mini-textbox"  vtype = ""  required="false" />
											</td>
											<td style="text-align:right;">标题：</td>
											<td>
											   <input name="title" id="title" class="mini-textbox"   vtype = "" required="false" />
											</td>

										</tr>
										<tr>
											<td style="text-align:right;">正文：</td>
											<td>
											   <input name="content" id="content" class="mini-textarea" vtype = ""  required="false"  />
											</td>
											<td style="text-align:right;">谈话日期：</td>
											<td>
											   <input name="chatDate" id="chatDate" class="mini-datepicker" dateFormat="yyyy-MM-dd HH:mm:ss" vtype = ""  required="false"/>
											</td>

										</tr>

										<tr>
										</tr>
									</table>
				                </div> <!--panel-->
				            </div> <!--mini-col-->
				        </div> <!--clearfix-->
				     </div> <!--container-->
				  </div>
		
		
							</div>

					<script type="text/javascript">
						
					</script>
</body>
</html>