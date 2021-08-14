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
<link rel="stylesheet" href="${ctxStatic}/static/wo/wt/css/electricNew2.css?_v=<%=System.currentTimeMillis() %>" type="text/css" />
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
    .table02 td{
    	border:1px solid black;
    }
	@media print {
        .fenye-a3{
            display:none;
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
    
	#describe{
    	width: 90px;
    	height: 44px;
    	position: absolute;
    	right: 0;
		top:140px;
	}
	
	.pageFooter{
		 height:76px;  
	}
</style>
</head>

<body >
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
	    <h1 >国家能源集团泰州发电有限公司</h1>	
	    <h1>电气第二种工作票</h1>
	    <h2 >编号:<span>${WoWt.wtCode}</span></h2>	  
	</header>
	<table class="table01" id="wowtFirstTable">	
	   <tbody>	  
		<tr>
			<td colspan="2" class="department"><span class="ident-number1">1.</span>部门：
				<c:choose>
					<c:when test="${not empty WoWt.safetyGuardian }">
						<input  readonly="true" value="${WoWt.orgName }"/>
						班组：<input  readonly="true" value="${WoWt.maintOrgName }"/>
						安全监护人：<input style="width:11%" readonly="true" value="${WoWt.safetyGuardian }"/>						
					</c:when>
					<c:otherwise>
						<input  readonly="true" value="${WoWt.orgName }"/>
						班组：<input  readonly="true" value="${WoWt.maintOrgName }"/>						
					</c:otherwise>
				</c:choose>
			</td>
			<td></td>
		</tr>
		<tr>
			<td>
				<span class="ident-number1">2.</span>工作负责人(监护人)：<input  readonly="true" value="${WoWt.workLeaderName }"/>
			       电话：<input  readonly="true" value="${WoWt.mobile}"/>
			</td>
		</tr>					
		<c:if test="${fn:length(classPersons) == 1}">
			<tr >
				<td  colspan="3"><span class="ident-number1">3.</span>工作班成员：
					<input id="workperson0" class="classPersons1" readonly="true" value="${classPersons[0]}"/>
					<span style="margin-left:15pt;">共
				    	<input readonly="true" style="text-align: center;width:30px;" value="${WoWt.personNum }"/>人
				    </span>
				</td>
			</tr>
		</c:if>
		<c:if test="${fn:length(classPersons) > 1}">
			<tr >
				<td colspan="3"><span class="ident-number1">3.</span>工作班人员：
					<input id="workperson0" class="classPersons2" readonly="true" value="${classPersons[0]}"/>
				</td>
			</tr>
			<c:forEach begin="1" end="${fn:length(classPersons)-1}" var="i">
				<c:if test="${fn:length(classPersons) > i+1}">
					<tr class="ident1 work02">
						<td colspan="3">
							<input id="workperson${i }" readonly="true" value="${classPersons[i]}"/>
						</td>
					</tr>
				</c:if>
				<c:if test="${fn:length(classPersons) == i+1}">
					<tr>
						<td colspan="3">
							<input id="workperson${i }" class="classPersons3" readonly="true" value="${classPersons[i]}"/>
							<span style="margin-left:15pt;">共
						    	<input size="3" readonly="true" style="text-align: center;" value="${WoWt.personNum }"/>人
						    </span>
						</td>
					</tr>
				</c:if>		
			</c:forEach>
		</c:if>
		<tr class="work01">
			<td colspan="3"><span class="ident-number1">4.</span>工作地点：
				<input id="location1" readonly="true" value="${fn:escapeXml(location[0])}"/>
			</td>				
		</tr>
		<c:forEach begin="1" end="${fn:length(location)-1}" var="i">
			<tr class="ident1 work02">
				<td colspan="3">
					<input  readonly="true" value="${fn:escapeXml(location[i])}"/>
				</td>
			</tr>					
		</c:forEach>
		<tr  class="work01">
			<td  colspan="3" style="position:relative;"><span class="ident-number1">5.</span>工作内容：
				<input id="content1"  readonly="true" value="${fn:escapeXml(content[0])}"/>
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
			<td colspan="3"><span class="ident-number1">6.</span>计划工作时间：			                   
			     自 <input style="width:40px;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
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
            <td id="condition"  class="widthValue" colspan="3">
                <span class="ident-number1">7.</span>
		                工作条件（停电或不停电，或邻近及保留带电设备名称）：
		     </td>
		</tr>
		<tr >
			<td  colspan="3">
			  <input readonly="true"  value="${WoWt.descr}" style="width:100%;"/>
			</td>
		</tr>
		<%-- <tr class="daozhadixian">
			<td id=""  class="widthValue" colspan="3">
			  <input readonly="true"  value="${fn:escapeXml(conditionSmList[0])}"/>
			</td>
		</tr>
		<c:forEach begin="2" end="${fn:length(conditionSmList)}" var="i">
			<tr class="daozhadixian">
				<td colspan="3">
					<input  readonly="true" value="${fn:escapeXml(conditionSmList[i-1])}"/>
				</td>
			</tr>
		</c:forEach> --%>
		<%-- <tr>
           	<td colspan="3"><span class="ident-number1">8.</span>安全措施（注意事项）：
                 <input  style="width:465px;float: right" id="zlSm1" readonly="true" value="${fn:escapeXml(zlSmList[0])}"/>
               </td>
		</tr>
		<c:forEach begin="2" end="${fn:length(zlSmList)}" var="i">
			<tr class="ident1 work02">
				<td colspan="3">
					<input  readonly="true" value="${fn:escapeXml(zlSmList[i-1])}"/>
				</td>
			</tr>
		</c:forEach> --%>
       
              
        <tr>
           	<td id="condition"  class="widthValue" colspan="3">
           	  <span class="ident-number1">8.</span>安全措施（注意事项）：                 
            </td>
		</tr>		
		    
		<c:forEach items="${aqMap}" var="i" varStatus="status">
			<tr >					
				<td colspan="3" style="border-bottom:1px solid #000">
					${ status.index + 1}.${i.value[0]}					
				</td>		
			</tr>
		</c:forEach>
		<c:if test="${0 == fn:length(aqMap)}">				
			<tr  >
				<td colspan="3" style="border-bottom:1px solid #000">1.无</td>
			</tr>				
		</c:if> 
			
	   </tbody>
       </table>	
       			
       			      					 										 
	   <table >
			<tr>
				<td colspan="2"><san class="ident-number1">9.</san>工作票签发：</td>
			</tr>
			<tr >
				<td colspan="2">工作票签发人：	
				<input size="10" readonly="true" value="${WoWt.wtSignerName}"/>		                   			    
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			     
			   <input style="width: 40px;text-align:center;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
		       <input style="width: 20px;text-align:center;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
		       <input style="width: 20px;text-align:center;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
		       <input style="width: 20px;text-align:center;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
		       <input style="width: 20px;text-align:center;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
	           </td>
           </tr>
           <tr >
			   <td colspan="2">工作票接收人：	
				<input size="10" readonly="true" value="${WoWt.wtReceiveName}"/>		                 				    
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	   
			   <input style="width: 40px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${WoWt.wtReceiveTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
	           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${WoWt.wtReceiveTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
	           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${WoWt.wtReceiveTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
	           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${WoWt.wtReceiveTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
	           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${WoWt.wtReceiveTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分				
	           </td>
           </tr>
           <tr>
            	<td colspan="2">
                <span class="ident-number2">10.</span>
                	补充安全措施（工作许可人填写）：
			</tr>						
			<%-- <c:if test="${fn:length(conditionBcList) > 0}">
				<c:forEach begin="0" end="${fn:length(conditionBcList)-1}" var="i" varStatus="status">
					<tr class="daozhadixian">
						<td><input  readonly="true" value="${fn:escapeXml(conditionBcList[i])}"/></td>
					</tr>
				</c:forEach> 
			</c:if> 			
			<c:if test="${2>fn:length(conditionBcList)}">
				<c:forEach begin="1" end="${3-fn:length(conditionBcList)}" varStatus="status">
					<tr class="daozhadixian">
						<td style="position: relative;">
							<c:choose>
								<c:when test="${fn:length(conditionBcList)==0}">
									<c:if test="${status.first}">
										<input  readonly="true" value="1.无"/>										
									</c:if>
								</c:when>								
							</c:choose>
						</td>						
					</tr>
				</c:forEach>
			</c:if> --%> 
			    
			<c:forEach items="${bcMap}" var="i" varStatus="status">
				<tr>					
					<td colspan="3" style="border-bottom:1px solid #000">
						${ status.index + 1}.${i.value[0]}					
					</td>		
				</tr>
			</c:forEach>
			<c:if test="${0 == fn:length(bcMap)}">				
				<tr >
					<td colspan="3" style="border-bottom:1px solid #000">1.无</td>
				</tr>				
			</c:if> 
											
			</table>
			<table>
			<tr class="date01">
				<td colspan="3"><san class="ident-number2">11.</san>确认本工作票上述各项内容， 许可开始工作时间：					   
		           	<!-- <input readonly="true" />年
					<input readonly="true" />月
					<input readonly="true" />日
					<input readonly="true"  />时
					<input readonly="true"  />分  -->
					<input style="width: 40px;"  readonly="true"  placeholder="<fmt:parseDate value='${WoWt.permitStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
	                <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.permitStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
	                <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.permitStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
	                <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.permitStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
	                <input readonly="true"  placeholder="<fmt:parseDate value='${WoWt.permitStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分				
				</td>
			</tr>
	         <tr>
	         	<!-- <td >工作负责人：
	        		<input size="10" readonly="true" />
	        	</td>
	        	<td >工作许可人：
	        		<input size="10" readonly="true" />
	        	</td> -->
	        	<td >工作许可人： <input size="10" readonly="true"  value="${WoWt.permitByName}"/></td>
			<td >工作负责人： <input size="10" readonly="true"  value="${WoWt.workLeaderSignName}"/></td>
	        </tr>
	       	<tr class="date01">
				<td colspan="2">
				<san class="ident-number2">12.</san>工作票延期，有效期延期到
					<input  style="width: 40px;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
	                <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
	                <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
	                <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
	                <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分		
				</td>
			</tr>
			<tr>
				<td >工作负责人：
		        	<input size="10" readonly="true" value="${woWtDelayList[0].workLeaderName }" />
				</td>
				<td>
		            <input style="width: 40px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].workLeaderTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
	                <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].workLeaderTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
	                <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].workLeaderTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
	                <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].workLeaderTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
	                <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].workLeaderTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
	           </td>        	
			</tr>
			<tr>
				<td >工作许可人：
				   <input size="10" readonly="true" value="${woWtDelayList[0].permitByName }" />
				</td>
				<td>
		           <input style="width: 40px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].permitByTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
		           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].permitByTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
		           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].permitByTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
		           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].permitByTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
		           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].permitByTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>分
	           </td>
			</tr>
			<tr>
			    <td colspan="2"><san class="ident-number2">13.</san>工作终结：</td>
			</tr>
	    	<tr >
	        	<td colspan="2" class="date01">全部工作于：
	        		<input  readonly="true"  placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
	                <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
	                <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
	                <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
	                <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分结束，工作班人员已全部撤离，现场已清理完毕。
	            </td>
	        </tr>
	         <tr>
	        	<td >工作负责人：
	        		<input size="10" readonly="true" value="${WoWt.endWorkLeaderName }"/>	        		
	        	</td>
	        	<td >工作许可人：
	        		<input size="10" readonly="true" value="${WoWt.endPermitByName }"/></td>	        	
			</tr>
			<%-- <tr id="remark"  class="widthValue remarks" >
				 <td colspan="3">
                <span >14.</span>
                	备注：<input id="remark1"  class="table09-put" readonly="true" value="${fn:escapeXml(remarks[0])}">
				</td>
			</tr>
			<c:forEach begin="1" end="${fn:length(remarks)-1 }" var="i">
				<tr class="ident1 work02">
					<td colspan="3">
						<input readonly="true" value="${fn:escapeXml(remarks[i])}">
					</td>
				</tr>
			</c:forEach> --%>
			<tr>
			<td id="remark"  class="widthValue" colspan="3"><span class="ident-number2">14.</span>备注：</td>
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
var A4 = 953 ;//+ 94
window.onload = function(){	
 	setRow1Content("content1","工作内容:占");
 	setRow1Content("location1","工作地点:占");
 	setRow1Content("dangerContent1","工作内容:占");
 	setRow1Content("dangerLocation1","工作地点:占");	    	
 	setRow1Content("remark1","备注:占");	    	
 	setRow1Content("zlSm1","注意事项（安全措施）:占");
 	setRow1Content("workperson0","工作班人员:占")
 	 	
    loadDangerInfo();	    
}
		
</script>
</html>