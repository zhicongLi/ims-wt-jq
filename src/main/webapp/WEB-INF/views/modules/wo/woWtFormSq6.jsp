<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>打印预览</title>
<!-- 引用工作票的js逻辑 -->
<script src="${ctxStatic}/static/js/workTicketNew.js?_v=<%=System.currentTimeMillis() %>" type="text/javascript"></script>	
<link rel="stylesheet" href="${ctxStatic}/static/wo/wt/css/operationOrderNew.css?_v=<%=System.currentTimeMillis() %>">
<!-- 引用工作票公共CSS样式  -->	
<link rel="stylesheet" href="${ctxStatic}/static/wo/wt/css/workTicketNewNew.css?_v=<%=System.currentTimeMillis() %>" type="text/css" />	
<link rel="stylesheet" href="${ctxStatic}/static/wo/wt/css/heatPowerNew.css?_v=<%=System.currentTimeMillis() %>" type="text/css" />

	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>打印操作票</title>
 <style type="text/css">        
     body {
        width: 649px;
        text-align: center;
        margin: 0 auto;
    }
    table{
    	    border-spacing:0;
    }
    td{
    	text-align:left;
    }
	@media print {
		.fenye-a3{
            display:none;
        }
        .fenye-a4{
            display: none;
        }
        #printWoOt{
            display: none;
        }
        .pageBreak {
            page-break-after: always; /*强制换页的关键*/
        }

        .noPrint {
            display: none;
        }
        body{
        	-webkit-print-color-adjust: exact;
        }
    	.pageFooter{
			display: none;
		}
		.pageHeader{
	 		height:94px; 
		}
		/* 设置打印时浏览器边距默认为0 */
		@page {
			margin: 0;
		}
    }
    .pageFooter{
		 height:76px;  
	}
    #describe{
	    width: 90px;
	    height: 44px;
	    position: absolute;
	    right: 0;
	    top:160px;
	}
	.input{position:relative}
    .word{position:absolute;line-height:20px;left:0px;top:1px;z-index:10;background:#fff}
    #content_{border:none; text-indent:75px;line-height:20px;background:url(${ctxStatic}/wo/icon/linebg.gif) repeat;}
    .fire04 input{
        width: 480px;
        margin-top: 3px;
        float: right;
    }
    .fire05 input{
        width: 358px;
        margin-top: 3px;
        float: right;
    }
   
 </style>
</head>

<body>
	<div style="text-align:left;" id="printWoOt">
		<c:choose>
			<c:when test="${display==true}"></c:when>
			<c:otherwise>
				<button  onclick="javascript:printWoOt()">打印</button>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="pageHeader"></div> 
    <%@ include file="/WEB-INF/views/modules/wo/woWtDangerPrint.jsp"%>
	<div class="pageFooter"></div>
	<div class="pageBreak"></div>
	<div class="pageHeader"></div> 
	<div class="print-content">		
		<header class="host header">
		    <h1>国家能源集团泰州发电有限公司</h1>
	        <h1 style="font-size:35px;">二级动火工作票&nbsp;</h1>	        
		</header>
		<table class="table01">		   
			<tr>
				<td class="title05" colspan="6" style="border:0;">
				
				<span style="float: right;margin-right: 10px">
                 	编号：
				<input  size="30" readonly="true" value="${WoWt.wtCode}"/>
				</span>
				</td>
			</tr>
			<tr>
				<td class="title05" colspan="6" style="border:0;">				
				<span style="float: right;margin-right: 10px">
           		   对应工作票编号：
				<input  size="30" readonly="true" value="${WoWt.mainTicketCode }"/>
				</span>
				</td>
			</tr>			
		</table>
		<table id="wowtFirstTable">		    
		    <tr style="height: 20px;"></tr>
			<tr >				
				<td  colspan="2"><span class="ident-number1">1.</span>部门：
					<input size="25" readonly="true" value="${WoWt.orgName}"/>
					班组：<input size="20" readonly="true" value="${WoWt.maintOrgName}"/>					
				</td>
			</tr>		
			<tr>
				<td colspan="2"><span class="ident-number1">2.</span>动火工作负责人：
					<input size="10" readonly="true" value="${WoWt.workLeaderName }"/>					
				</td>
			</tr>
			<tr>
				<td ><span class="ident-number1">3.</span>动火执行人：
					<input size="10" readonly="true" value="${woWtFire.execByName}"/>					
				</td>
				<td >动火执行人操作证编号：
					<input  readonly="true" value="${woWtFire.execByIdNumber}"/>					
				</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;动火执行人：
					<input size="10" readonly="true" value="${woWtFire.execByName2}"/>					
				</td>
				<td >动火执行人操作证编号：
					<input  readonly="true" value="${woWtFire.execByIdNumber2}"/>					
				</td>
			</tr>			
			<tr class="fire04">
				<td id="content"  class="widthValue" colspan="2" >				 	
               		 <span class="ident-number1">4.</span>动火地点及设备名称：<input readonly="true" id='location1' value="${fn:escapeXml(locationList[0])}"/>
				</td>
			</tr>
			<c:forEach begin="1" end="${fn:length(locationList)-1}" var="i">
					<tr class="ident1 work02">
						<td colspan="3">
							<input  readonly="true" value="${fn:escapeXml(locationList[i])}"/><!--value="${locationList[i]}" -->
						</td>
					</tr>					
			</c:forEach>	
			<tr class="fire05">
				<td id="content"  class="widthValue" colspan="2" style="position:relative;">				 	
               		<span class="ident-number1">5.</span>动火工作内容（必要时可附页绘图说明）：<input readonly="true" id="content1" value="${fn:escapeXml(contentList[0])}"/>
					<%-- <c:if test="${WoWt.status =='10' }">
			        <img src="${ctxStatic}/static/wo/icon/yzj_yf.png" alt="" style="position: absolute;right:0px;margin:auto;top:0px">
			        </c:if>
			        <c:if test="${WoWt.status =='8' }">
			        <img src="${ctxStatic}/static/wo/icon/zf_yf.bmp" alt="" style="position: absolute;right:0px;margin:auto;top:0px">
			        </c:if>
			        <c:if test="${WoWt.status =='30' }">
			        <img src="${ctxStatic}/static/wo/icon/bhg.bmp" alt="" style="position: absolute;right:0px;margin:auto;top:0px">
			  	    </c:if> --%>
				</td>
			</tr>
			<c:forEach begin="1" end="${fn:length(contentList)-1}" var="i">
					<tr class="ident1 work02">
						<td colspan="3">
							<input  readonly="true" value="${fn:escapeXml(contentList[i])}"/>
						</td>
					</tr>					
			</c:forEach>				
		<table class="table01">	
			<tr>
				<td width="100px">				 	
               		 6.动火方式：
				</td>
				<td>
				<c:forEach begin="0" end="5" var="dict" items="${fireModelist }">
					<label style="display:inline-block;width:80px;">
						<c:if test="${dict.remarks=='1' }">
							<!-- <input  type="checkbox" name="check" checked="checked" onclick="return false;"> -->
							<input disabled="disabled" type="checkbox" name="check" checked="checked" >
						</c:if>
						<c:if test="${dict.remarks!='1' }">
							<input disabled="disabled" type="checkbox" name="check" >
						</c:if>
						${dict.label }
					</label>
				</c:forEach>				
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
				<c:forEach begin="6" var="dict" items="${fireModelist }">
					<label style="display:inline-block;width:80px;">
						<c:if test="${dict.remarks=='1' }">
							<input disabled="disabled" type="checkbox" name="check" checked="checked" >
						</c:if>
						<c:if test="${dict.remarks!='1' }">
							<input disabled="disabled" type="checkbox" name="check">
						</c:if>
						${dict.label }
					</label>
				</c:forEach>
				</td>
			</tr>
		</table>
	    <table border="1" cellspacing="0" cellpadding="0" class="table01">
		    <tr>
				<td  class="widthValue" colspan="2"><span class="ident-number1">7.</span>运行部门应采取的安全措施</td>				
			</tr>			
			<c:forEach items="${yxSmMap}" var="i" varStatus="status">
				<tr >
					<td colspan="2">
						${ status.index + 1}.${i.value[0]}
					</td>					
				</tr>
			</c:forEach>
			<%-- <c:if test="${10>fn:length(yxSmMap)}">
				<c:forEach begin="1" end="${11- fn:length(yxSmMap)}" varStatus="status">
					<tr>
						<td  colspan="2" style="position: relative;">							
							<c:choose>
								<c:when test="${fn:length(yxSmMap)==0}">
									<c:if test="${status.first}">
										无
										<img id="#yxkb" src="${ctxStatic}/static/wo/icon/yxkb_yf.bmp" style="position: absolute;left:0px;margin:auto;top:35px">
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${status.first}">
										<img id="#yxkb" src="${ctxStatic}/static/wo/icon/yxkb_yf.bmp" style="position: absolute;left:0px;margin:auto;top:5px">
									</c:if>
								</c:otherwise>
							</c:choose>
						</td>										
					</tr>
				</c:forEach>
			</c:if> --%>
			<c:if test="${0 == fn:length(yxSmMap)}">
				<tr>
					<td class="table03-l" colspan="2" >
					  1.无
					</td>					
				</tr>
			</c:if>	
			
												
			<tr >
				<td class="widthValue" colspan="2"><span class="ident-number1">8.</span>动火部门应采取的安全措施：</td>				
			</tr>
			<c:forEach items="${dh1SmMap}" var="i" varStatus="status">
				<tr >
					<td colspan="2">
						${ status.index + 1}.${i.value[0]}
					</td>					
				</tr>
			</c:forEach>
			<%-- <c:if test="${10>fn:length(dh1SmMap)}">
				<c:forEach begin="1" end="${11- fn:length(dh1SmMap)}" varStatus="status">
					<tr>
						<td  colspan="2" style="position: relative;">							
							<c:choose>
								<c:when test="${fn:length(dh1SmMap)==0}">
									<c:if test="${status.first}">
										无
										<img id="#yxkb" src="${ctxStatic}/static/wo/icon/yxkb_yf.bmp" style="position: absolute;left:0px;margin:auto;top:35px">
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${status.first}">
										<img id="#yxkb" src="${ctxStatic}/static/wo/icon/yxkb_yf.bmp" style="position: absolute;left:0px;margin:auto;top:5px">
									</c:if>
								</c:otherwise>
							</c:choose>
						</td>										
					</tr>
				</c:forEach>
			</c:if>		 --%>
			<c:if test="${0 == fn:length(dh1SmMap)}">
				<tr>
					<td class="table03-l" colspan="2" >
					  1.无
					</td>					
				</tr>
			</c:if>	
			
							
		</table>
		<table>
			<tr class="date02">							
				<td colspan="2">
				<span class="ident-number1">9.</span>申请动火时间： 
				自 
				 <input style="width:40px;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
		         <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
		         <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
		         <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
		         <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
			       至
			     <input style="width:40px;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.planEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
		         <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.planEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
		         <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.planEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
		         <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.planEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
		         <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.planEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
				</td>
			</tr>
			<tr>
				<td>动火工作票签发人：
					<input size="10" readonly="true" value="${WoWt.wtSignerName}"/>
				</td>
				<td class="ident2">
					<input style="width: 40px;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
		            <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
		            <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
		            <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
		            <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
				</td>
			</tr>
			<tr>
		        <td><span class="ident-number2">10.</span>审批</td>
		    </tr>
			<tr >				
				<td colspan="2">
				            动火部门安监人员：
					<input size="10" readonly="true" value="${woWtFire.appCompSafeHealthName}"/>
				    <span style="margin-left:80px;"></span>动火部门负责人或技术负责人：
					<input size="10" readonly="true" value="${woWtFire.appDeptLeaderName}"/>
				</td>
			</tr>			
			<tr class="date01">
				<td colspan="2" >批准动火时间：自
				       <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
			           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
			           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
			           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
			           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分至
			           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
			           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
			           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
			           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
			           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
				</td>
			</tr>
			<tr >
				<td colspan="2"><span class="ident-number2">11.</span>运行部门应采取的安全措施已全部执行完毕</td>				
			</tr>
			<tr >			
				<td  class="ident2">运行许可动火时间：
					   <%-- <input style="width:40px;" readonly="true" placeholder="<fmt:formatDate value='${WoWt.permitStartTime}' pattern='yyyy' />"/>年
			           <input readonly="true"  placeholder="<fmt:formatDate value='${WoWt.permitStartTime}' pattern='MM' />"/>月
			           <input readonly="true" placeholder="<fmt:formatDate value='${WoWt.permitStartTime}' pattern='dd' />"/>日
			           <input readonly="true" placeholder="<fmt:formatDate value='${WoWt.permitStartTime}' pattern='HH' />"/>时
			           <input readonly="true" placeholder="<fmt:formatDate value='${WoWt.permitStartTime}' pattern='mm' />"/>分 --%>
			           <input readonly="true" />年
					   <input readonly="true" />月
					   <input readonly="true" />日
					   <input readonly="true"  />时
					   <input readonly="true"  />分	
				</td>
				<td> 运行许可人：
					<%-- <input size="10" readonly="true" value="${WoWt.permitByName}"/> --%>
					<input size="10" readonly="true" value=""/>
				</td>
			</tr>
			<tr >
				<td colspan="2"><span class="ident-number2">12.</span>应配备的消防设施和采取的消防措施、安全措施已符合要求。可燃性、易爆气体含量或粉尘浓度测定合格  </td>				
			</tr>
		</table>
		<table border="1" cellspacing="0" cellpadding="0" class="table01">
		    <tr >
				<td >测量时间</td>	
				<td >测量介质</td>		
				<td >标准值</td>		
				<td >测量值</td>		
				<td >测定人</td>					
			</tr>					   
			<c:forEach  var="i" begin="0" end="4" varStatus="vs">											
				<c:choose>
					<c:when test="${i==0}">
						<tr >
				         <td class="ident2">
						   首次动火前：
						  <input style="width:40px;" readonly="true" placeholder="<fmt:parseDate value='${measureList[i].measureTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
				          <input readonly="true"  placeholder="<fmt:parseDate value='${measureList[i].measureTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
				          <input readonly="true"  placeholder="<fmt:parseDate value='${measureList[i].measureTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
				          <input readonly="true"   placeholder="<fmt:parseDate value='${measureList[i].measureTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
				          <input readonly="true"  placeholder="<fmt:parseDate value='${measureList[i].measureTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
						  </td>
						  <td>${measureList[i].material }</td>
						  <td>${measureList[i].standardValue }</td>
						  <td>${measureList[i].measureValue }</td>
						  <td>${measureList[i].measureByName }</td>							  		
			            </tr>			
			        </c:when>			      
		       </c:choose>					
			</c:forEach>			
		</table>
					
		<table>
			<tr >
				<td >动火执行人：
					<%-- <input size="10" readonly="true" value="${woWtFire.safeExecByName}"/> --%>
					<input size="10" readonly="true" value=""/>
				</td>
				<td> 消防监护人：
					<%-- <input size="10" readonly="true" value="${woWtFire.safeFiremanByName}"/> --%>
					<input size="10" readonly="true" value=""/>
					动火工作负责人：
					<%-- <input size="10" readonly="true" value="${woWtFire.safeWorkLeaderName}"/> --%>
					<input size="10" readonly="true" value=""/>
				</td>				
			</tr> 
			<tr >
				<td >动火部门安监人员：
					<%-- <input size="8" readonly="true" value="${woWtFire.safeDeptSafeByName}"/> --%>
					<input size="8" readonly="true" value=""/>
				</td>
				<td >动火部门负责人或技术负责人：
					<%-- <input size="10" readonly="true" value="${woWtFire.endsfDeptLeaderName}"/> --%>
					<input size="10" readonly="true" value="${woWtFire.endsfDeptLeaderName}"/>
				</td>				
			</tr> 			
			<tr >			
				<td class="ident2" colspan="3">允许动火时间：
				   <%-- <input style="width:40px;" readonly="true" placeholder="<fmt:formatDate value='${woWtFire.safeFireTime}' pattern='yyyy' />"/>年
		           <input readonly="true"  placeholder="<fmt:formatDate value='${woWtFire.safeFireTime}' pattern='MM' />"/>月
		           <input readonly="true" placeholder="<fmt:formatDate value='${woWtFire.safeFireTime}' pattern='dd' />"/>日
		           <input readonly="true" placeholder="<fmt:formatDate value='${woWtFire.safeFireTime}' pattern='HH' />"/>时
		           <input readonly="true" placeholder="<fmt:formatDate value='${woWtFire.safeFireTime}' pattern='mm' />"/>分 --%>
		           <input style="width:40px;" readonly="true" />年
		           <input readonly="true"  />月
		           <input readonly="true" />日
		           <input readonly="true" />时
		           <input readonly="true" />分
				</td>				
			</tr>
		</table>
		
		<table>
		    <tr >
				<td colspan="2"><span class="ident-number2">13.</span>动火期间，可燃性、易爆气体含量或粉尘浓度测定 </td>				
			</tr>
		</table>
		<table border="1" cellspacing="0" cellpadding="0" class="table01">
		    <tr >
				<td >测量时间</td>	
				<td >测量介质</td>		
				<td >标准值</td>		
				<td >测量值</td>		
				<td >测定人</td>					
			</tr>					   		
						
			<c:forEach  var="i" begin="0" end="4" varStatus="vs">											
				<c:choose>					
			        <c:when test="${i>0}">
					    <tr>
				          <td class="ident2">第${i+1}次：
				           <input style="width:40px;" readonly="true" placeholder="<fmt:parseDate value='${measureList[i].measureTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
				           <input readonly="true"  placeholder="<fmt:parseDate value='${measureList[i].measureTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
				           <input readonly="true"  placeholder="<fmt:parseDate value='${measureList[i].measureTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
				           <input readonly="true"  placeholder="<fmt:parseDate value='${measureList[i].measureTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
				           <input readonly="true"  placeholder="<fmt:parseDate value='${measureList[i].measureTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
				          </td>
				          <td>${measureList[i].material }</td>
						  <td>${measureList[i].standardValue }</td>
						  <td>${measureList[i].measureValue }</td>
						  <td>${measureList[i].measureByName }</td>							
			            </tr>					
			       </c:when>
		       </c:choose>					
			</c:forEach>
			<c:if test="${5<fn:length(measureList)}">
				<c:forEach begin="5" end="${fn:length(measureList)-1}" var="i" varStatus="status">					
			          <td class="ident2">第${i+1}次：
					   <span><input style="width:40px;" readonly="true" placeholder="<fmt:parseDate value='${measureList[i].measureTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
			           <input readonly="true"  placeholder="<fmt:parseDate value='${measureList[i].measureTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
			           <input readonly="true"  placeholder="<fmt:parseDate value='${measureList[i].measureTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
			           <input readonly="true"  placeholder="<fmt:parseDate value='${measureList[i].measureTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
			           <input readonly="true"  placeholder="<fmt:parseDate value='${measureList[i].measureTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
					  </td>
					  <td>${measureList[i].material }</td>
					  <td>${measureList[i].standardValue }</td>
					  <td>${measureList[i].measureValue }</td>
					  <td>${measureList[i].measureByName }</td>					
		            </tr>						       
				</c:forEach>
			</c:if>		
		</table>
		
		<table>
			<tr >
				<td  class="ident2" colspan="3">
				  <span class="ident-number2">14.</span>动火工作终结：动火工作于  <input style="width:40px;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
			           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
			           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
			           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
			           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分结束，材料、工具已清理完毕，现场确无残留火种，参与现场动火工作的有关人员已全部撤离，动火工作已结束。
				</td>						
			</tr> 
			<tr >
				<td >动火执行人：
					<input size="10" readonly="true" value="${woWtFire.endExecByName}"/>
				</td>
				<td colspan="2">消防监护人：
					<input size="10" readonly="true" value="${woWtFire.endFiremanByName}"/>
				</td>				
			</tr> 
			<tr >
				<td >动火工作负责人：
					<input size="10" readonly="true" value="${WoWt.endWorkLeaderName}"/>
				</td>
				<td colspan="2">运行许可人：
					<input size="10" readonly="true" value="${woWtFire.endPermitByName}"/>
				</td>				
			</tr> 					   					          	    
		</table>
		<%-- <table class="table09">		
		<tr>
			<td id="remark"  class="widthValue" colspan="3"><span class="ident-number2">15.</span>备注：<input id="remark1"  class="table09-put"
				readonly="true" value="${fn:escapeXml(remarks[0])}" /><!-- value="${remarksList[0]}" -->
			</td>
		</tr>
		<c:forEach begin="1" end="${fn:length(remarks)-1}" var="i">
			<tr class="ident1 work02">
				<td colspan="3"><input readonly="true"
					value="${fn:escapeXml(remarks[i])}"/></td><!-- value="${remarksList[i]}" -->
			</tr>
		</c:forEach>
		</table>	 --%>
		<table class="table09">		
		<tr>
			<td id="remark"  class="widthValue" colspan="3"><span class="ident-number2">15.</span>备注：</td>
		</tr>		
		<tr class="daozhadixian">
		    <td id=""  class="widthValue" colspan="3">
			  <input id="remark1" readonly="true"  value="${fn:escapeXml(remarks[0])}"/>
			</td>
		</tr>	
		<c:if test="${fn:length(remarks)==1}">
		  <tr class="daozhadixian">
				<td colspan="3"><input readonly="true" value="" /></td>
			</tr>
		</c:if>		  		
		<c:if test="${fn:length(remarks)>1}">
		  <c:forEach begin="1" end="${fn:length(remarks)-1}" var="i">
			<tr class="daozhadixian">
				<td colspan="3"><input readonly="true"
					value="${fn:escapeXml(remarks[i])}" /></td>
			</tr>
		  </c:forEach>
		</c:if>				
		</table>	
	</div>
	<input type="hidden" id="wtCode"  value="${WoWt.wtCode}">
</body>
<script type="text/javascript">
//const A4 = 1100;
const A4 = 953 ;//+ 94
setRow1Content("location1","动火地点及设备名称:占");
setRow1Content("content1","动火工作内容（必要时可附页绘图说明）:占");
setRow1Content("remark1","备注:占");
setRow1Content("dangerContent1","工作内容:占");
setRow1Content("dangerLocation1","工作地点:占");

window.onload = function(){	    	
  loadDangerInfo();		    
} 
</script>
</html>