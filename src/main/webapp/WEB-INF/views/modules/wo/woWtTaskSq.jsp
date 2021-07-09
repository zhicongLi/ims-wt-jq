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
<script src="${ctxStatic}/static/js/workTicket.js" type="text/javascript"></script>
<!-- 引用工作票公共CSS样式  -->
<%-- <link rel="stylesheet" href="${ctxStatic}/static/wo/wt/css/operationOrder.css">
<link rel="stylesheet" href="${ctxStatic}/static/wo/wt/css/workTicketNew.css" type="text/css" />
<link rel="stylesheet" href="${ctxStatic}/static/wo/wt/css/heatPower.css" type="text/css" />
 --%>
<link rel="stylesheet" href="${ctxStatic}/static/wo/wt/css/operationOrderNew.css?_v=<%=System.currentTimeMillis() %>" type="text/css">
<link rel="stylesheet" href="${ctxStatic}/static/wo/wt/css/workTicketNewNew.css?_v=<%=System.currentTimeMillis() %>" type="text/css" />
<link rel="stylesheet" href="${ctxStatic}/static/wo/wt/css/electricNew1.css?_v=<%=System.currentTimeMillis() %>" type="text/css" />
 
<style type="text/css">
	body {
       /*  width: 210mm; */
        width: 649px;
        text-align: center;
        /*font-size: 14px; */
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
    }
    
    #describe{
	   width: 100px;
	   height: 44px;
	   position: absolute;
	   right: 0;
	   top:150px;
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

<div class="pageHeader"></div>
<!-- 危险点预控措施 -->
<%@ include file="/WEB-INF/views/modules/wo/woWtDangerPrint.jsp"%>
<div class="pageFooter"></div>
<div class="pageBreak"></div>
<div class="pageHeader"></div>

<div class="print-content">
	<header class="host header">
	    <h1>国家能源集团发电泰州发电有限公司</h1>
	    <h1 style="font-size:35px;">工作任务单&nbsp;</h1>
	    <h2 >编号:<span>${WoWtTask.wtCode}</span></h2> 	   
	</header>
	<table class="table01" id="wowtFirstTable">	
	   <tbody>	  
		<tr>
			<td><span class="ident-number1">1.</span>
			      部门：<input style="width:18%"  readonly="true" value="${WoWtTask.orgName}"/>
			      班组：<input style="width:12%" readonly="true" value="${WoWtTask.maintOrgName}"/>				
			</td>
		</tr>
		<tr>
		   <td><span class="ident-number1">2.</span>工作负责人：
			  <input size="10" readonly="true" value="${WoWtTask.workLeaderName}"/>					
		   </td>
		</tr>			
		
	    <c:if test="${fn:length(classPersons) == 1}">
			<tr >
				<td  colspan="3"><span class="ident-number1">3.</span>工作班人员：
					<input id="workperson0" class="classPersons1" readonly="true" value="${classPersons[0]}"/>
					<span style="margin-left:15pt;">共
				    	<input readonly="true" style="text-align: center;width:30px;" value="${WoWtTask.personNum }"/>人
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
						    	<input size="3" readonly="true" style="text-align: center;" value="${WoWtTask.personNum }"/>人
						    </span>
						</td>
					</tr>
				</c:if>		
			</c:forEach>
		</c:if> 
		<tr class="work01">
			<td><span class="ident-number1">4.</span>工作地点：
				<input id="location1" readonly="true" value="${WoWtTask.location}"/>
			</td>				
		</tr>		
		<tr  class="work01">
			<td  colspan="3" style="position:relative;"><span class="ident-number1">5.</span>工作内容：
				<input id="content1"  readonly="true" value="${content[0]}"/>				
			</td>
		</tr>
		<c:forEach begin="1" end="${fn:length(content)-1}" var="i">
			<tr class="ident1 work02">
				<td colspan="3">
					<input  readonly="true" value="${content[i]}"/>
				</td>
			</tr>					
		</c:forEach>
		<tr class="date01">
			<td><span class="ident-number1">6.</span>计划工作时间：
			     自
			     <input  readonly="true" placeholder="<fmt:parseDate  value='${WoWtTask.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
		         <input  readonly="true" placeholder="<fmt:parseDate  value='${WoWtTask.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
		         <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWtTask.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
		         <input  readonly="true" placeholder="<fmt:parseDate  value='${WoWtTask.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
		         <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWtTask.planStartTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
			     至
			     <input  readonly="true" placeholder="<fmt:parseDate  value='${WoWtTask.planEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
		         <input  readonly="true" placeholder="<fmt:parseDate  value='${WoWtTask.planEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
		         <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWtTask.planEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
		         <input  readonly="true" placeholder="<fmt:parseDate  value='${WoWtTask.planEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
		         <input  readonly="true"  placeholder="<fmt:parseDate value='${WoWtTask.planEndTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
			</td>
		</tr>					
    </table>
    <table border="1" cellspacing="0" cellpadding="0" class="table01">
	    <tr>
		    <td>7．应注意的事项及采取的作业安全措施：</td>		    
	    </tr>
	    <tr style="min-height:200px!important; height:200px;vertical-align:top">
		    <td >${WoWtTask.descr}</td> 	
		        
	    </tr>	   
	    <tr>
		    <td>交底人：<input size="10" readonly="true" value=""/></td>		    
	    </tr>
	    <tr>
		    <td>工作班成员签名：</td>		    
	    </tr>	   
	    <tr style="min-height:150px!important; height:150px;vertical-align:top">
		    <td ></td>		    
	    </tr>
    </table>	
    <table cellspacing="0" cellpadding="0" class="table07">
        <tr>
		    <td>8.告知运行：</td>		    
	    </tr>
	    <tr class="date01">
			<td >运行值班人员：
				<input size="10" readonly="true" value="${WoWtTask.appDutyPrincipalName}"/>
			</td>			
		    <td>
				<input readonly="true" placeholder="<fmt:parseDate value='${WoWtTask.appDutyPrincipalTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
			    <input readonly="true" placeholder="<fmt:parseDate value='${WoWtTask.appDutyPrincipalTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
			    <input readonly="true" placeholder="<fmt:parseDate value='${WoWtTask.appDutyPrincipalTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
			    <input readonly="true" placeholder="<fmt:parseDate value='${WoWtTask.appDutyPrincipalTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
			    <input readonly="true" placeholder="<fmt:parseDate value='${WoWtTask.appDutyPrincipalTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分
			</td> 
		</tr>		
		<tr>
		    <td colspan="2" >9.工作结束：</td>		    
	    </tr>
	    <tr class="date01">
		    <td colspan="2" >全部工作于 
                <input readonly="true" placeholder="<fmt:parseDate value='${WoWtTask.endDutyPrincipalTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='yyyy'  type='date'/>"/>年
			    <input readonly="true" placeholder="<fmt:parseDate value='${WoWtTask.endDutyPrincipalTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='MM'  type='date'/>"/>月
			    <input readonly="true" placeholder="<fmt:parseDate value='${WoWtTask.endDutyPrincipalTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='dd'  type='date'/>"/>日
			    <input readonly="true" placeholder="<fmt:parseDate value='${WoWtTask.endDutyPrincipalTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='HH'  type='date'/>"/>时
			    <input readonly="true" placeholder="<fmt:parseDate value='${WoWtTask.endDutyPrincipalTime}' var='date' pattern='yyyy-MM-dd HH:mm' type='date'/><fmt:formatDate value='${date}' pattern='mm'  type='date'/>"/>分结束，工作班人员已全部撤离，现场已清理完毕。
			</td>		    
	    </tr>
	    <tr class="date01">
			<td >工作监护人（工作负责人）：
				<input size="10" readonly="true" value="${WoWtTask.endWorkLeaderName}"/>
			</td>
			<td >运行值班人员：
				<input size="10" readonly="true" value="${WoWtTask.endDutyPrincipalName}"/>
			</td>		    
		</tr>
    </table>		
</div>
<input type="hidden" id="wtCode"  value="${WoWtTask.wtCode}">
</body>
 <script type="text/javascript">
 /* const A4 = 1100; */
 const A4 = 953;
 window.onload = function(){
 	setRow1Content("content1","工作内容:占");
 	setRow1Content("location1","工作地点:占");
	setRow1Content("dangerContent1","工作内容:占");
 	setRow1Content("dangerLocation1","工作地点:占");	 
 	setRow1Content("workperson0","工作班人员:占");
 	setRow1Content("remark1","备注:占");
 		
 } 
 loadDangerInfo();	
   </script>
</html>