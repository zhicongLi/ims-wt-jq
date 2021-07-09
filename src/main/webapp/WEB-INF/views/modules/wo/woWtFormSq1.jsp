<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="/WEB-INF/views/include/head.jsp"%>
    <meta name="viewport"  content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>打印预览</title>
<!-- 引用工作票的js逻辑 --> 
<script src="${ctxStatic}/static/js/workTicketNew.js?_v=<%=System.currentTimeMillis() %>" type="text/javascript"></script>
<!-- 引用工作票公共CSS样式  -->
<link rel="stylesheet" href="${ctxStatic}/static/wo/wt/css/operationOrderNew.css?_v=<%=System.currentTimeMillis() %>" type="text/css">
<link rel="stylesheet" href="${ctxStatic}/static/wo/wt/css/workTicketNewNew.css?_v=<%=System.currentTimeMillis() %>" type="text/css" />
<link rel="stylesheet" href="${ctxStatic}/static/wo/wt/css/electricNew1.css?_v=<%=System.currentTimeMillis() %>" type="text/css" />

<style type="text/css">
	body {
        width: 649px;
        text-align: center;
/*         font-size: 14px; */
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
        /*.fenye-a4{*/
            /*display: none;*/
        /*}*/
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
	   width: 100px;
	   height: 44px;
	   position: absolute;
	   right: 0;
	   top:150px;
	}
	
	.pageFooter{
 		height:76px;  
	}
</style>

<body>
<div style="text-align:left;" id="printWoOt">
	<c:choose>
		<c:when test="${display==true}"></c:when>
		<c:otherwise>
			<button  onclick="javascript:printWoOt()">打印</button>
		</c:otherwise>
	</c:choose>
</div>
<%-- <div style="text-align:right;" id="printWoOt1">
	<c:choose>
		<c:when test="${display==true}"></c:when>
		<c:otherwise>
			<button  onclick="javascript:exitPreForm()">退出</button>
		</c:otherwise>
	</c:choose>
</div> --%>

<div class="pageHeader"></div>
<!-- 危险点预控措施 -->
<%@ include file="/WEB-INF/views/modules/wo/woWtDangerPrint.jsp"%>
<div class="pageFooter"></div>
<div class="pageBreak"></div>
<div class="pageHeader"></div>
<div class="print-content">
	<header class="host header">
	    <h1 >国家能源集团泰州发电有限公司</h1>	
	    <h1>电气第一种工作票</h1>
	    <h2 >编号:<span>${WoWt.wtCode}</span></h2>	  
	</header>
	<table class="table01" id="wowtFirstTable">	
	  <tbody>	  
		<tr>
			<td colspan="2" class="department"><span class="ident-number1">1.</span>部门：
				<input style="width:18%"  readonly="true" value="${WoWt.orgName }"/>
				班组：<input style="width:21%" readonly="true" value="${WoWt.maintOrgName }"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td colspan="3">
				<span class="ident-number1">2.</span>工作负责人(监护人)：<input  readonly="true" value="${WoWt.workLeaderName }"/>
				电话：<input  readonly="true" value="${WoWt.mobile}"/>
			</td>
		</tr>					
		<c:if test="${fn:length(classPersons) == 1}">
			<tr >
				<td colspan="3"><span class="ident-number1">3.</span>工作班成员：
					<input id="workperson0" class="classPersons1" readonly="true" value="${classPersons[0]}"/>
					<span style="margin-left:15pt;">共
				    	<input readonly="true" style="text-align: center;width:30px;" value="${WoWt.personNum }"/>人
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
				<c:if test="${WoWt.status =='10' }">
			        <img src="${ctxStatic}/static/wo/icon/yzj_yf.png" alt="" style="position: absolute;right:0px;margin:auto;top:0px">
			    </c:if>
			    <c:if test="${WoWt.status =='8' }">
			       <img src="${ctxStatic}/static/wo/icon/zf_yf.bmp" alt="" style="position: absolute;right:0px;margin:auto;top:0px">
			    </c:if>
			    <c:if test="${WoWt.status =='30' }">
			       <img src="${ctxStatic}/static/wo/icon/bhg.bmp" alt="" style="position: absolute;right:0px;margin:auto;top:0px">
			    </c:if>

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
			<td colspan="3" ><span class="ident-number1">7.</span>安全措施（必要时可附页绘图说明）：</td>
		</tr>		
	  </tbody>
    </table>

	<table  border="1" cellspacing="0" cellpadding="0" class="table02">			
	   <thead>	
	    <tr >
			<th>工作票负责人填写</th>
			<th>工作许可人填写</th>
		</tr>
		<tr>
			<td class="widthValue" id="kg" style="width:50%;">应拉断路器(开关)和隔离开关(刀闸)，包括填写前已拉断路器(开关)和隔离开关(刀闸)(注明编号) </td>
			<td style="width:50%;">已拉断路器(开关)和隔离开关(刀闸)(注明编号) </td>
		</tr>	
	   </thead>
	   <c:forEach items="${kgMap}" var="i" varStatus="status">
			<tr>
				<td class="table03-l" >
					${status.index + 1}.${i.value[0]} 
				</td>
				<td class="table03-l" style="width:50%">
					${status.index + 1}.${i.value[3]}
				</td>
			</tr>
		</c:forEach>
		<c:if test="${8>fn:length(kgMap)}">
			<c:forEach begin="1" end="${8- fn:length(kgMap)}"  varStatus="status">
				<tr>
					<td class="table03-l" style="position: relative;">
						<c:choose>
							<c:when test="${fn:length(kgMap)==0}">
								<c:if test="${status.first}">
									<img id="#yxkb" src="${ctxStatic}/static/wo/icon/nodata.bmp" style="position: absolute;left:0px;margin:auto;top:5px">
								</c:if>
								
							</c:when>
							<c:otherwise>
								<c:if test="${status.first}">
									<img id="#yxkb" src="${ctxStatic}/static/wo/icon/yxkb_yf.bmp" style="position: absolute;left:0px;margin:auto;top:5px">
								</c:if>
							</c:otherwise>
						</c:choose>
					</td>
					<td class="table03-s" style="position: relative;">
						<c:choose>
							<c:when test="${fn:length(kgMap)==0}">
								<c:if test="${status.first}">
									<img id="#yxkb" src="${ctxStatic}/static/wo/icon/nodata.bmp" style="position: absolute;left:0px;margin:auto;top:5px">
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
		</c:if>
		<c:if test="${7 == fn:length(kgMap)}">
			<tr>
				<td class="table03-l" >
				</td>
				<td class="table03-s" >
				</td>
			</tr>
		</c:if>
		<tr>
			<td id="dx1" class="table03-l widthValue">应装设接地线及应合上接地刀闸（注明装设地点）</td> 
			<td id="dx2" class="table03-l widthValue">已装设接地线及应合接地刀闸（注明编号和装设地点）</td>
		</tr>
		<c:forEach items="${dxMap}" var="i" varStatus="status">
			<tr>
				<td class="table03-l" >
					${status.index + 1}.${i.value[0]}
				</td>
				<td class="table03-l">
					${status.index + 1}.${i.value[3]}
				</td>
			</tr>
		</c:forEach>
		<c:if test="${4>fn:length(dxMap)}">
			<c:forEach begin="1" end="${4- fn:length(dxMap)}" varStatus="status">
				<tr>					
				<td class="table03-l" style="position: relative;">
						<c:choose>
							<c:when test="${fn:length(dxMap)==0}">
								<c:if test="${status.first}">
									<img id="#yxkb" src="${ctxStatic}/static/wo/icon/nodata.bmp" style="position: absolute;left:0px;margin:auto;top:5px">
								</c:if>
								
							</c:when>
							<c:otherwise>
								<c:if test="${status.first}">
									<img id="#yxkb" src="${ctxStatic}/static/wo/icon/yxkb_yf.bmp" style="position: absolute;left:0px;margin:auto;top:5px">
								</c:if>
							</c:otherwise>
						</c:choose>
				</td>
				<td class="table03-l" style="position: relative;">
					<c:choose>
							<c:when test="${fn:length(dxMap)==0}">
								<c:if test="${status.first}">
									<img id="#yxkb" src="${ctxStatic}/static/wo/icon/nodata.bmp" style="position: absolute;left:0px;margin:auto;top:5px">
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
		</c:if>
		<c:if test="${3 == fn:length(dxMap)}">
			<tr>
				<td class="table03-l" >
				</td>
				<td class="table03-s" >
				</td>
			</tr>
		</c:if>
		<tr>  
			<td class="widthValue" id="zl">应设遮栏、应挂标示牌</td>
			<td>已设遮栏、已挂标示牌（注明地点）</td>
		</tr>
		<c:forEach items="${zlMap}" var="i" varStatus="status">
			<tr>
				<td class="table03-l">
					${status.index + 1}.${i.value[0]}
				</td>
				<td class="table03-l">
					${status.index + 1}.${i.value[3]}
				</td>
			</tr>
		</c:forEach>
		<c:if test="${3>fn:length(zlMap)}" >
			<c:forEach begin="1" end="${3- fn:length(zlMap)}" varStatus="status">
				<tr>
					<td class="table03-l" style="position: relative;">
							<c:choose>
							<c:when test="${fn:length(zlMap)==0}">
								<c:if test="${status.first}">
									<img id="#yxkb" src="${ctxStatic}/static/wo/icon/nodata.bmp" style="position: absolute;left:0px;margin:auto;top:5px">
								</c:if>
								
							</c:when>
							<c:otherwise>
								<c:if test="${status.first}">
									<img id="#yxkb" src="${ctxStatic}/static/wo/icon/yxkb_yf.bmp" style="position: absolute;left:0px;margin:auto;top:5px">
								</c:if>
							</c:otherwise>	
						</c:choose>
					</td>
					<td class="table03-l" style="position: relative;">
						<c:choose>
							<c:when test="${fn:length(zlMap)==0}">
								<c:if test="${status.first}">
									<img id="#yxkb" src="${ctxStatic}/static/wo/icon/nodata.bmp" style="position: absolute;left:0px;margin:auto;top:5px">
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
		</c:if>
		<c:if test="${2 == fn:length(zlMap)}">
			<tr>
				<td class="table03-l" >
				</td>
				<td class="table03-s" >
				</td>
			</tr>
		</c:if>
		<tr> 
			<td class="widthValue" id="bcSm" colspan="2" >工作地点保留带电部分、注意事项或应补充安全措施（由值班负责人或值长填写）</td>
		</tr>
		<c:forEach items="${bcMap}" var="i" varStatus="status">
			<tr>
				<td colspan="4" class="table03-l">
					${status.index + 1}.${i.value[0]}
				</td>
			</tr>
		</c:forEach>
		<c:if test="${4>fn:length(bcMap)}">
			<c:forEach begin="1" end="${4- fn:length(bcMap)}" varStatus="status">
				<tr>
					<td colspan="4" class="table03-l" style="position: relative;">
						<c:choose>
							<c:when test="${fn:length(bcMap)==0}">
								<c:if test="${status.first}">
									<img id="#yxkb" src="${ctxStatic}/static/wo/icon/nodata.bmp" style="position: absolute;left:0px;margin:auto;top:5px">
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
		</c:if>	
		<c:if test="${3 == fn:length(bcMap)}">
			<tr>
				<td class="table03-l" >
				</td>
				<td class="table03-s" >
				</td>
			</tr>
		</c:if>		
	</table>	
	<table  class="table07">
		<tbody>
		<tr>
			<td ><san class="ident-number1">8.</san>工作票签发时间：	           
	           <input style="width: 40px;text-align:center;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
		       <input style="width: 20px;text-align:center;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
		       <input style="width: 20px;text-align:center;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
		       <input style="width: 20px;text-align:center;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
		       <input style="width: 20px;text-align:center;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.wtSignDate}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
		   </td>
		   <td class="middletd">工作票签发人：	
			<input size="10" readonly="true" value="${WoWt.wtSignerName}"/>	</td>
		</tr>		
		<tr class="date01">
			<td colspan="2"><span class="ident-number1">9.</span>收到工作票时间： 			   
			   <input style="width: 40px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${WoWt.wtReceiveTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
	           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${WoWt.wtReceiveTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
	           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${WoWt.wtReceiveTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
	           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${WoWt.wtReceiveTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
	           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${WoWt.wtReceiveTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分				
			</td>
		</tr>
		<tr>
			<td class="middletd">运行值班负责人： <input size="10" readonly="true" value="${WoWt.wtReceiveName}"/></td>
			<td class="middletd">工作负责人： <input size="10" readonly="true" value="${WoWt.receiveWorkLeaderName}"/></td>
		</tr>
		<tr class="date01">
			<td colspan="2" ><span class="ident-number2">10.</span>批准工作时间：自<input style="width:40px;" readonly="true" placeholder="<fmt:parseDate value='${WoWt.appStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
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
        	 <td class="middletd">
        	            值长(或单元长)：<input size="10" readonly="true" value="${WoWt.appDutyLeaderName }"/>	        	    	        	     	        	    
        	 </td>	        		        	 
        </tr>	  
		<tr class="date01">
			<td colspan="2"><span class="ident-number2">11.</span>确认本工作票上述各项内容，许可开始工作时间：
				<input readonly="true" />年
				<input readonly="true" />月
				<input readonly="true" />日
				<input readonly="true"  />时
				<input readonly="true"  />分 				
			</td>
		</tr>
		<tr>			
			<td class="middletd">工作许可人： <input size="10" readonly="true"  value=""/></td>
			<td class="middletd">工作负责人： <input size="10" readonly="true"  value=""/></td>
		</tr>
		<tr class="date01">
			<td colspan="2" style="line-height: 30px;"><san class="ident-number2">12.</san>工作负责人变更：自					  
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
			<td class="middletd">工作票签发人：
			<c:forEach
					items="${leaderChangeList}" var="item" varStatus="i">
					<c:if test="${i.last }">  							
			        	<input size="9" readonly="true" value="${item.wtSignerName }" />					       
			</td>
			<td class="middletd">        	                  
                                      运行值班负责人:<input size="9" readonly="true" value="${item.permitByName }" />
           			</c:if>
				</c:forEach>
			</td>
		</tr>
		<tr class="date01">
			<td colspan="2">
			<san class="ident-number2">13.</san>
				工作票延期，有效期延期到			  
	           <input  style="width: 40px;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
	           <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
	           <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
	           <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
	           <input readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].delayTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分		
			</td>
		</tr>
		<tr>
			<td class="middletd">工作负责人：
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
			<td class="middletd">值长（或运行值班负责人）：
			   <input size="10" readonly="true" value="${woWtDelayList[0].dutyLeaderName }" />
			</td>
			<td>	          
	           <input style="width: 40px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].dutyLeaderTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
	           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].dutyLeaderTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
	           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].dutyLeaderTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
	           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].dutyLeaderTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
	           <input style="width: 20px;text-align:center;" readonly="true"  placeholder="<fmt:parseDate value='${woWtDelayList[0].dutyLeaderTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
           </td>
		</tr>
		<tr>
			<td colspan="2"><span class="ident-number2">14.</span>工作终结：</td>
		</tr>		
		<tr class="date01">
			<td colspan="2" class="middletd">全部工作于
			   <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
	           <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
	           <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
	           <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
	           <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWt.actEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分结束，工作班人员已全部撤离，现场已清理完毕。				
			</td>
		</tr>
		<tr>	
			<td class="middletd">工作负责人： <input size="10" readonly="true"
				value="${WoWt.endWorkLeaderName }" />
			</td>
			<td class="middletd">工作许可人： <input size="10"
				readonly="true" value="${WoWt.endPermitByName }" />
			</td>
		</tr>
		<tr>
			<td colspan="2" class="middletd"> 
				 临时遮栏、标示牌、常设安全措施已恢复。
			</td>
		</tr>
		<tr>
			<td colspan="2" class="middletd hidden1"><!-- class="middletd hidden1" -->
				接地线共 <input size="3" readonly="true"
				value="${WoWt.endWireTotalNum=='0'?null:WoWt.endWireTotalNum}" /> 组，已拆除 <input size="3"
				readonly="true" value="${WoWt.endWireRemoveNum=='0'?null:WoWt.endWireRemoveNum}" /> 组，因另有工作保留
				<input
				size="3" readonly="true" value="${WoWt.endWireKeepNum=='0'?null:WoWt.endWireKeepNum}" />	组。
			</td>
		</tr>
		<tr>
			<td class="middletd" >保留接地线编号及位置：</td>
		</tr>
		<tr class="ident1 daozhadixian">
			<td id="endWireKeepInfo" class="middletd"  colspan="6"><input id="endWireKeepInfo1"  class=""
				readonly="true" value="${fn:escapeXml(endWireKeepInfo[0])}" />
			</td>
		</tr>
		<c:forEach begin="1" end="${fn:length(endWireKeepInfo)-1}" var="i">
			<tr class="ident1 daozhadixian">
				<td colspan="6"><input readonly="true"
					value="${fn:escapeXml(endWireKeepInfo[i])}" /></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="2" class="middletd hidden1">
				接地刀闸共 <input size="3" readonly="true"
				value="${WoWt.endGateTotalNum=='0'?null:WoWt.endGateTotalNum}" /> 组，已拆除 <input size="3"
				readonly="true" value="${WoWt.endGateRemoveNum=='0'?null:WoWt.endGateRemoveNum}" /> 组，因另有工作保留
				<input
				size="3" readonly="true" value="${WoWt.endGateKeepNum=='0'?null:WoWt.endGateKeepNum}" />	组。
			</td>
		</tr>
		<tr>
			<td class="middletd" >保留接地刀闸编号及位置：</td>
		</tr>
		<tr class="ident1 daozhadixian"><!--  class="ident1 daozhadixian" -->
			<td id="endGateKeepInfo"   colspan="6"><input id="endGateKeepInfo1"  class=""
				readonly="true" value="${fn:escapeXml(endGateKeepInfo[0])}" />
			</td>
		</tr>
		<c:forEach begin="1" end="${fn:length(endGateKeepInfo) -1}" var="i">
			<tr class="ident1 daozhadixian">
				<td colspan="6" ><input readonly="true"
					value="${fn:escapeXml(endGateKeepInfo[i])}" /></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="2" class="middletd" >值长（或运行值班负责人）: <input
				 size="10" readonly="true" value="${WoWt.endDutyPrincipalName}" /></td>
		</tr>		
	  </tbody>
	</table>
	<%-- <table class="table09">
		<tr>
			<td id="remark"  class="widthValue" colspan="6"><span class="ident-number2">15.</span>备注：<input id="remark1"  class="table09-put"
				readonly="true" value="${fn:escapeXml(remarks[0])}" />
			</td>
		</tr>
		<c:forEach begin="1" end="${fn:length(remarks)-1 }" var="i">
			<tr class="ident1 work02">
				<td colspan="6"><input readonly="true"
					value="${fn:escapeXml(remarks[i])}" /></td>
			</tr>
		</c:forEach>
	</table> --%>
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
		  <tr class="ident1 work02 daozhadixian">
				<td colspan="3"><input readonly="true" value="" /></td>
			</tr>
		</c:if>			  		
		<c:if test="${fn:length(remarks)>1}">
		  <c:forEach begin="1" end="${fn:length(remarks)-1}" var="i">
			<tr class="ident1 work02 daozhadixian">
				<td colspan="3"><input readonly="true"
					value="${fn:escapeXml(remarks[i])}" /></td>
			</tr>
		  </c:forEach>
		</c:if>
				
	</table>	 
</div>
<input type="hidden" id="wtCode"  value="${WoWt.wtCode}">
<!-- 危险点预控措施 -->
<%-- <%@ include file="/WEB-INF/views/modules/wo/woWtDangerPrint.jsp"%> 
<div class="pageFooter"></div>
<div class="pageBreak"></div> --%>
</body>
 <script type="text/javascript">
 //A4 = 794×1123;//采用96dpi
 /*
 	A4纸张的尺寸是210×297mm，按1英寸=25.41mm换算，即8.264×11.688英寸 
	所以，A4纸96dpi下的分辨率是794×1123，这就是我们在制作网页的时候需要的象素。
	上边距2.5厘米约等于94像素，下边距2厘米约76像素。总高度1123-170=953
 */
 var A4 = 953;// + 94
 window.onload = function(){
 	setRow1Content("content1","工作内容:占");
 	setRow1Content("location1","工作地点:占");
 	setRow1Content("dangerContent1","工作内容:占");
 	setRow1Content("dangerLocation1","工作地点:占");	    	
 	setRow1Content("remark1","备注:占");	    	
 	setRow1Content("workperson0","工作班人员:占");	
 	
 	/* var a=GetQueryString("a");	    	
 	var iamCode = iamCodeValue();    	
 	if(a=="1"){
 		var wtType=GetQueryString("wtType");
 		var  fields=$(".widthValue");
 		 for (var i = 0, l = fields.length; i < l; i++) {
 			var c = fields[i];
 	   		$.ajax({
 	   		        type: "POST",
 	   		        url: "${ctx}/wo-wt/wo/woWtChangeLineConf/saveWidth&iamCode="+iamCode,
 	   		        async: false,	    	   		       
 	   		        data:{
 	   		        	"name":c.id+"width1",
 	   		        	"fontSize":10,
 	   		        	"width":c.clientWidth,
 	   		        	"autoId":""+c.id,
 	   		        	"wtType":wtType
 		       		},
 	   		        success: function (text) {
 	   		        	var o=JSON.parse(text)
 	   		        	if(o.type == "I"){
 	   						console.log(o.message);
 	   		        	}if(o.type == "W"){
 	   		        		console.log(o.message);
 	   		        	}if(o.type == "E"){
 	   		        		console.log(o.message);
 	   		        	} 
 	   		        }
 	   		    }) 
  		} 
 	} */
 	loadDangerInfo();		    
 } 

</script>
</html>