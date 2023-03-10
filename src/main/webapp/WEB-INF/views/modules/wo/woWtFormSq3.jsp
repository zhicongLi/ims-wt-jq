<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>打印预览</title>
<!-- 引用工作票的js逻辑 -->
<script src="${ctxStatic}/static/js/workTicketNew.js?_v=<%=System.currentTimeMillis() %>" type="text/javascript"></script>
<!-- 引用工作票公共CSS样式  -->	
<link rel="stylesheet" href="${ctxStatic}/static/wo/wt/css/operationOrderNew.css?_v=<%=System.currentTimeMillis() %>" type="text/css">
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
 
    .work07 input{
        width: 400px;
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
	<!-- 危险点预控措施 -->
	<%@ include file="/WEB-INF/views/modules/wo/woWtDangerPrint.jsp"%>
	<div class="pageFooter"></div>
	<div class="pageBreak"></div>
	<div class="pageHeader"></div>
	
	<div class="print-content">		
		<header class="host header">	    	
	    	<h1>国家能源集团泰州发电有限公司</h1>
	        <h1 style="font-size:35px;">热控工作票&nbsp;</h1>
	        <h2 >编号:<span>${WoWt.wtCode}</span></h2>      
		</header>
		<table id="wowtFirstTable"> 
		    <tr style="height: 20px;"></tr>
			<tr >				
				<td  colspan="3"><span class="ident-number1">1.</span>部门：
					<input  readonly="true" value="${WoWt.orgName}"/>
					班组：<input  readonly="true" value="${WoWt.maintOrgName}"/>					
				</td>
			</tr>		
			<tr>
				<td colspan="3"><span class="ident-number1">2.</span>工作负责人（监护人）：
					<input size="10" readonly="true" value="${WoWt.workLeaderName }"/>	
					电话：<input  readonly="true" value="${WoWt.mobile}"/>				
				</td>
			</tr>
			<c:if test="${fn:length(classPersons) == 1}">
			<tr >
				<td colspan="3"><span class="ident-number1">3.</span>工作班成员：
					<input id="workperson0" class="classPersons1_4" readonly="true" value="${classPersons[0]}"/>
					<span>共
				    	<input readonly="true" style="text-align: center;width:30px;" value="${WoWt.personNum }"/>人<span style="margin-left:20px;"></span>      			 
				    </span>
				</td>
			</tr>
		</c:if>
		<c:if test="${fn:length(classPersons) > 1}">
			<tr >
				<td colspan="3"><span class="ident-number1">3.</span>工作班成员：
					<input id="workperson0" class="classPersons2" readonly="true" value="${classPersons[0]}"/>
				</td>
			</tr>
			<c:forEach begin="1" end="${fn:length(classPersons)-1}" var="i">
				<c:if test="${fn:length(classPersons) > i+1}">
					<tr class="ident1 work02">
						<td colspan="3">
							<input id="workperson${i}" readonly="true" value="${classPersons[i]}"/>
						</td>
					</tr>
				</c:if>
				<c:if test="${fn:length(classPersons) == i+1}">
					<tr>
						<td colspan="3">
							<input id="workperson${i }" class="classPersons3_4" readonly="true" value="${classPersons[i]}"/>
							<span>共
						    	<input size="3" readonly="true" style="text-align: center;" value="${WoWt.personNum }"/>人<span style="margin-left:20px;"></span>      			 
						    </span>
						</td>
					</tr>
				</c:if>		
			</c:forEach>
		   </c:if>		
			<tr class="work01">
				<td id="content"  class="widthValue" colspan="3" >				 	
               		 <span class="ident-number1">4.</span>工作地点：<input readonly="true" id='location1' value="${fn:escapeXml(location[0])}"/>
				</td>
			</tr>
							 			
			<c:forEach begin="1" end="${fn:length(location)-1}" var="i">
					<tr class="ident1 work02">
						<td colspan="3">
							<input  readonly="true" value="${fn:escapeXml(location[i])}"/>
						</td>
					</tr>					
			</c:forEach>
			
			<tr class="work01">
				<td id="content"  class="widthValue" colspan="3" style="position:relative;">				 	
               		<span class="ident-number1">5.</span>工作内容：<input readonly="true" id="content1" value="${fn:escapeXml(content[0])}"/>
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
			<c:forEach begin="1" end="${fn:length(content)-1}" var="i">
					<tr class="ident1 work02">
						<td colspan="3">
							<input  readonly="true" value="${fn:escapeXml(content[i])}"/>
						</td>
					</tr>					
			</c:forEach>
			
			<tr class="date01">
				<td colspan="3"><span class="ident-number1">6.</span>计划工作时间：自
				 <input style="width:40px;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
		         <input  readonly="true" placeholder="<fmt:parseDate value='${WoWt.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
		         <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
		         <input  readonly="true" placeholder="<fmt:parseDate value='${WoWt.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
		         <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
			          至
			     <input style="width:40px;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.planEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
		         <input  readonly="true" placeholder="<fmt:parseDate value='${WoWt.planEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
		         <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.planEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
		         <input  readonly="true" placeholder="<fmt:parseDate value='${WoWt.planEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
		         <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.planEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
				</td>
			</tr>
			<tr class="work07">
			   <td colspan="3" class="widthValue">
				 <span class="ident-number1">7.</span>需要退出热工保护或自动装置名称：<input id="deviceName" readonly="true" value="${fn:escapeXml(deviceName[0])}"/>
			   </td>
			</tr>	 
			<c:forEach begin="1" end="${fn:length(deviceName)-1}" var="i">
					<tr class="ident1 work02">
						<td colspan="3">
							<input  readonly="true" value="${fn:escapeXml(deviceName[i])}"/>
						</td>
					</tr>					
			</c:forEach>
		</table>
		
		<table border="1" cellspacing="0" cellpadding="0" class="table01">
		    <tr>
				<td id="bxSm"  class="widthValue" colspan="2">8.安全措施</td>
				<td id="bxQk"  class="widthValue" style="text-align: left;width: 25%;word-break:keep-all;white-space:nowrap; ">9.执行情况</td>
			</tr>
			<tr>
				<td  class="widthValue" colspan="2">由运行人员执行的有：</td>
				<td  class="widthValue" >已执行（√）</td>
			</tr>
			<c:forEach items="${yxMap}" var="i" varStatus="status">
				<tr >					
					<td colspan="2">
						${ status.index + 1}.${i.value[0]}
					</td>
					<td>√</td>
				</tr>
			</c:forEach>
			<%-- <c:if test="${4>fn:length(yxMap)}">
				<c:forEach begin="1" end="${5- fn:length(yxMap)}" varStatus="status">
					<tr>
						<td  colspan="2" style="position: relative;">							
							<c:choose>
								<c:when test="${fn:length(yxMap)==0}">
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
						<td>							
							<c:choose>
								<c:when test="${fn:length(yxMap)==0}">
									<c:if test="${status.first}">
										无
									</c:if>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</td>						
					</tr>
				</c:forEach>
			</c:if> --%>
			<c:if test="${0 == fn:length(yxMap)}">
			<tr>
				<td class="table03-l" colspan="2" >
				  1.无
				</td>
				<td class="table03-s" >√</td>
			</tr>
		</c:if>
									
			<tr >
				<td class="widthValue" colspan="2">运行值班人员补充的安全措施（工作许可人填写）：</td>
				<td class="widthValue" style="text-align: left;width: 25%;word-break:keep-all;white-space:nowrap; ">已执行（√）</td>
			</tr>
			<c:forEach items="${bxSmMap}" var="i" varStatus="status">
				<tr >					
					<td colspan="2">
						${ status.index + 1}.${i.value[0]}
					</td>
					<td>√</td>
				</tr>
			</c:forEach>
			<%-- <c:if test="${4>fn:length(bxSmMap)}">
				<c:forEach begin="1" end="${5- fn:length(bxSmMap)}" varStatus="status">
					<tr>
						<td  colspan="2" style="position: relative;">							
							<c:choose>
								<c:when test="${fn:length(bxSmMap)==0}">
									<c:if test="${status.first}">
										无补充
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
						<td>							
							<c:choose>
								<c:when test="${fn:length(bxSmMap)==0}">
									<c:if test="${status.first}">
										无
									</c:if>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</td>						
					</tr>
				</c:forEach>
			</c:if> --%>
			<c:if test="${0 == fn:length(bxSmMap)}">
				<tr>
					<td class="table03-l" colspan="2" >
					  1.无
					</td>
					<td class="table03-s" >√</td>
				</tr>
			</c:if>
		
			<tr>
				<td  class="widthValue" colspan="2">由工作负责人执行的有：</td>
				<td  class="widthValue" >已执行（√）</td>
			</tr>
			<c:forEach items="${yxSmMap}" var="i" varStatus="status">
				<tr >
					<td colspan="2">
						${ status.index + 1}.${i.value[0]}
					</td>
					<td>√</td>
				</tr>
			</c:forEach>
			<%-- <c:if test="${4>fn:length(yxSmMap)}">
				<c:forEach begin="1" end="${5- fn:length(yxSmMap)}" varStatus="status">
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
						<td>							
							<c:choose>
								<c:when test="${fn:length(yxSmMap)==0}">
									<c:if test="${status.first}">
										无
									</c:if>
								</c:when>
								<c:otherwise>
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
					<td class="table03-s" >√</td>
				</tr>
			</c:if>	
		</table>
		<table>
			<tr>
		        <td><span class="ident-number2">10.</span>工作票签发</td>
		    </tr>
			<tr >
				<td>工作票签发人：
					<input size="10" readonly="true" value="${WoWt.wtSignerName}"/>
				</td>
				<td class="ident2">					   
				   <input  style="width: 40px;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
		           <input  readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
		           <input  readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
		           <input  readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
		           <input  readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
				</td>
			</tr>
			<tr>
				<td >				    
					工作票接收人：
					<input size="10" readonly="true" value="${WoWt.wtReceiveName}"/>
				</td>
				<td class="ident2">					   
				   <input  style="width: 40px;" readonly="true"  placeholder="<fmt:parseDate value='${WoWt.wtReceiveTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
	               <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWt.wtReceiveTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
	               <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWt.wtReceiveTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
	               <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWt.wtReceiveTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
	               <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWt.wtReceiveTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分				
				</td>
			</tr>
			<tr class="date02">
				<td colspan="3" ><span class="ident-number2">11.</span>批准工作时间：自<input style="width:40px;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.appStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
		           <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.appStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
		           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
		           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
		           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分至
		           <input style="width:40px;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.appEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
		           <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.appEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
		           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
		           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
		           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.appEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
				</td>
			</tr>
	         <tr>
	        	 <td >
	        	            值长(或单元长)：<input size="10" readonly="true" value="${WoWt.appDutyLeaderName }"/>	        	    	        	     	        	    
	        	 </td>	        		        	 
	        </tr>	       
	    	<tr class="date03" style="white-space: nowrap;">
	        	<td colspan="3" ><span class="ident-number2">12.</span>由运行人员负责的安全措施已全部执行，核对无误。自
        	        <!-- <input readonly="true" />年
					<input readonly="true" />月
					<input readonly="true" />日
					<input readonly="true"  />时
					<input readonly="true"  />分  -->       		   
		           <input style="width:40px;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.permitStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
		           <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.permitStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
		           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.permitStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
		           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.permitStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
		           <input readonly="true" placeholder="<fmt:parseDate value='${WoWt.permitStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
	        	</td>
	        </tr>
	        <tr>
	            <td style="border-left:0pt;">运行值班负责人：	        		
	        		<input size="10" readonly="true" value="${WoWt.appDutyPrincipalName}"/>
	        	</td>
	            <td  style="border-left:0pt;">
	                              工作许可人：<input size="10" readonly="true" value='${WoWt.permitByName}'/> 	        		
	                              工作负责人：<input size="10" readonly="true" value='${WoWt.workLeaderSignName}'/>     		      	           
	        	</td>        	
	        </tr>	      
	        <tr class="date01">
				<td colspan="2" style="line-height: 30px;"><span class="ident-number2">13.</span>工作负责人变更：自
				   <%-- <input style="width:40px;" readonly="true"  placeholder="<fmt:parseDate value='${WoWt.changeTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
		           <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.changeTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
		           <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.changeTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
		           <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.changeTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
		           <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.changeTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分 --%>
				   <input style="width: 40px;"  readonly="true"  placeholder="<fmt:parseDate value='${leaderChangeList[0].changeTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
	               <input readonly="true"  placeholder="<fmt:parseDate value='${leaderChangeList[0].changeTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
	               <input readonly="true"  placeholder="<fmt:parseDate value='${leaderChangeList[0].changeTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
	               <input readonly="true"  placeholder="<fmt:parseDate value='${leaderChangeList[0].changeTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
	               <input readonly="true"  placeholder="<fmt:parseDate value='${leaderChangeList[0].changeTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分 
				     原工作负责人离去，现变更为
			       <input style=" width:50px;" size="20" readonly="true" value="${leaderChangeList[0].nowWorkLeaderName }" />
					担任工作负责人。
				</td>
			</tr>
	        <tr>
	        <td >
                               工作票签发人：<c:forEach items="${leaderChangeList}" var="item" varStatus="i">
		         <c:if test="${i.last }">  
        	      <input size="9" readonly="true" value="${item.wtSignerName }" />
			</td>
			<td >        	
				   运行值班负责人：<input size="10" readonly="true" value="${item.permitByName }" />
	            			</c:if>
						</c:forEach>      			
				</td>
	        </tr> 	        			
	        <tr class="date01">
	        	<td colspan="2" ><span class="ident-number2">14.</span>工作票延期：有效期延期到
				   <input style="width: 40px;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
	               <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
	               <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
	               <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
	               <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分		
				</td>	
	        </tr>
	         <tr>
	           <td >	                                    
	                            值长(或单元长)：<input size="7" readonly="true"  value="${woWtDelayList[0].dutyLeaderName }"/> 
	            </td>
	            <td class="ident2">
				   <input  style="width: 40px;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].dutyLeaderTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
	               <input  readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].dutyLeaderTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
	               <input  readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].dutyLeaderTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
	               <input  readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].dutyLeaderTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
	               <input  readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].dutyLeaderTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
				</td>
	            <td >	
	        </tr> 
	        <tr>
	            <td >	                                    
	                          运行值班负责人：<input size="5" readonly="true" value="${woWtDelayList[0].permitByName }"/> 
	            </td>
	            <td class="ident2">
				   <input style="width:40px;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].permitByTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
			       <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].permitByTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
			       <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].permitByTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
			       <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].permitByTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
			       <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].permitByTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分    			
				</td>
	            	
	        </tr>
	        <tr>
	            <td >	                                    
	                            工作负责人：<input size="10" readonly="true" value="${woWtDelayList[0].workLeaderName }"/>
	            </td>
	             <td class="ident2">
				   <input style="width: 40px;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
	               <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
	               <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
	               <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
	               <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分		
				</td>								                   
	        </tr>	       
	        <tr class="ident5"></tr>
	     </table>
	     <!-- 新增  -->
	     <table>
			<tr>
				<td><p><span class="ident-number2">15.</span>检修设备需试运（工作票交回，所列安全措施已拆除，可以试运）</p></td>
			</tr>
		</table>
	     <table border="1" cellspacing="0" cellpadding="0" class="table01 date02" style="margin-top: 8px;">			
			<tr>
				<td style="width: 40%;text-align: center;">允许试运时间</td>
				<td style="width: 30%;text-align: center;">工作许可人</td>
				<td style="width: 30%;text-align: center;">工作负责人</td>
			</tr>			
			<c:forEach begin="0" end="2" var="i" varStatus="vs">
			<tr style="border-top: 0pt; text-align: center;">
						<td style="width: 40%;text-align: center;">
				           <input readonly="true"  placeholder="<fmt:parseDate value='${beforeWorkList[i].tryWorkTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
				           <input readonly="true"  placeholder="<fmt:parseDate value='${beforeWorkList[i].tryWorkTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
				           <input readonly="true"  placeholder="<fmt:parseDate value='${beforeWorkList[i].tryWorkTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
				           <input readonly="true"  placeholder="<fmt:parseDate value='${beforeWorkList[i].tryWorkTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
						</td>
						<td style="text-align: center;">${beforeWorkList[i].permitByName }</td>
						<td style="text-align: center;">${beforeWorkList[i].workLeaderName }</td>						
			</tr>
			</c:forEach>
		 </table>
		 
	     <!-- 新增结束 -->
	     <table>
			<tr>
				<td><p><span class="ident-number2">16.</span>检修设备试运后，工作票所列安全措施已全部执行，可以重新工作</p></td>
			</tr>
		</table>
	     <table border="1" cellspacing="0" cellpadding="0" class="table01 date02" style="margin-top: 8px;">
			
			<tr>
				<td style="width: 40%;text-align: center;">允许恢复工作时间</td>
				<td style="width: 30%;text-align: center;">值班负责人</td>
				<td style="width: 30%;text-align: center;">工作负责人</td>
			</tr>
			
			<c:forEach begin="0" end="2" var="i" varStatus="vs">
			<tr style="border-top: 0pt; text-align: center;">
						<td style="width: 40%;text-align: center;">
				           <input readonly="true"  placeholder="<fmt:parseDate value='${afterWorkList[i].recoverWorkTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
				           <input readonly="true"  placeholder="<fmt:parseDate value='${afterWorkList[i].recoverWorkTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
				           <input readonly="true"  placeholder="<fmt:parseDate value='${afterWorkList[i].recoverWorkTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
				           <input readonly="true"  placeholder="<fmt:parseDate value='${afterWorkList[i].recoverWorkTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
						</td>
						<td style="text-align: center;">${afterWorkList[i].permitByName }</td>
						<td style="text-align: center;">${afterWorkList[i].workLeaderName }</td>						
					</c:forEach>
			</tr>			
		</table>
	    <table cellspacing="0" cellpadding="0">
	        <tr>
	        	<td colspan="3" ><span class="ident-number2">17.</span>工作终结：</td>
	        </tr>
	        <tr>
				<td colspan="3"  class="date01">全部工作于
					   <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
			           <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
			           <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
			           <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
			           <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
				       结束，工作人员已全部撤离，现场已清理完毕
				</td>
			</tr>
			<tr>
				 <td >工作负责人：
					<input size="10" readonly="true" value="${WoWt.endWorkLeaderName }"/>
				</td>
				<td >工作许可人：
					<input size="10" readonly="true" value="${WoWt.endPermitByName }"/>
				</td>
			</tr>
			<tr class="ident5"></tr>
		</table>		
		<%-- <table class="table09">		
		<tr>
			<td id="remark"  class="widthValue" colspan="3"><span class="ident-number2">18.</span>备注：
			<input id="remark1"  class="table09-put" readonly="true" value="${fn:escapeXml(remarks[0])}" />
			</td>
		</tr>
		<c:forEach begin="1" end="${fn:length(remarks)-1}" var="i">
			<tr class="ident1 work02">
				<td colspan="3"><input readonly="true"
					value="${fn:escapeXml(remarks[i])}" /></td>
			</tr>
		</c:forEach>
		</table> --%>
		<table class="table09">		
		<tr>
			<td id="remark"  class="widthValue" colspan="3"><span class="ident-number2">18.</span>备注：</td>
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
<!--打印区域-->
<input type="hidden" id="wtCode"  value="${WoWt.wtCode}">
</body>
<script type="text/javascript">
//const A4 = 1100;
const A4 = 953 ;//+ 94
window.onload = function(){
   	setRow1Content("content1","工作内容:占");
   	setRow1Content("location1","工作地点:占");
   	setRow1Content("dangerContent1","工作内容:占");
   	setRow1Content("dangerLocation1","工作地点:占");	    	
   	setRow1Content("remark1","备注:占");
   	setRow1Content("workperson0","工作班人员:占");
   	setRow1Content("deviceName","需要退出热工保护或自动装置名称:占");
   		    	
   loadDangerInfo();		    
} 
</script>
</html>