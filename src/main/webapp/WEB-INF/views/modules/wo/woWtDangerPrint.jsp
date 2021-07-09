<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%> --%>
<%@ page contentType="text/html;charset=UTF-8"%>
<div class=dangerContent>
    <div class="invar">
        <header class="header">
            <!--大于2页display: block;小于两页display:none-->
            <p style="display: block;bottom: -25px;" class="prevDangerPage"></p>
            <h1>国家能源集团泰州发电有限公司<br/>作 业 安 全 措 施 票</h1>
            <h2 style="text-align:right;">工作票票号：<span>${WoWt.wtCode}</span></h2>           
        </header>
        <table class="table01"  >	
	   <tbody>	  
		<tr>
			<td colspan="3" class="department" ><span class="ident-number1">1.</span>工作部门：
				<input style="width:18%"  readonly="true" value="${WoWt.orgName }"/>
				班组：<input style="width:21%" readonly="true" value="${WoWt.maintOrgName }"/>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				2.工作负责人(监护人)：<input  readonly="true" value="${WoWt.workLeaderName }"/>
			</td>
		</tr>			
		<tr class="work01">
			<td colspan="3"><span class="ident-number1">3.</span>工作地点：
				<input id="dangerLocation1" readonly="true" value="${fn:escapeXml(location[0])}"/><!-- value="${location[0]}" -->
			</td>				
		</tr>
		<c:forEach begin="1" end="${fn:length(location)-1}" var="i">
			<tr class="ident1 work02">
				<td colspan="3">
					<input  readonly="true" value="${fn:escapeXml(location[i])}"/><!-- value="${location[i]}" -->
				</td>
			</tr>					
		</c:forEach>
		<tr  class="work01">
			<td  colspan="3" style="position:relative;"><span class="ident-number1">4.</span>工作任务：
				<input id="dangerContent1"  readonly="true" value="${fn:escapeXml(content[0])}"/><!-- value="${content[0]}" -->
				
			</td>
		</tr>
		<c:forEach begin="1" end="${fn:length(content)-1}" var="i">
			<tr class="ident1 work02">
				<td colspan="3">
					<input  readonly="true" value="${fn:escapeXml(content[i])}"/><!-- value="${content[i]}" -->
				</td>
			</tr>					
		</c:forEach>
		<tr>
			<td colspan="3" ><span class="ident-number1">5.</span>作业安全措施：</td>
		</tr>
	</tbody>
	</table>
	<table   class="table dangerTable tMerge">			
	   <thead>	
		<tr>
			<th style="width:70px;">工序</th>
			<th style="width:70px;">危险源</th>
			<th style="width:110px;">危害因素</th>
			<!-- <th style="width:45px;">危害<br/>后果</th>
			<th style="width:45px;">风险<br/>等级</th> -->
			<th style="width:398px;">作业安全措施</th>
		</tr>	
	   </thead>
	   <tr class="tfoot">
			<td colspan="6" style="border:none;"><span class="ident-number1">6.</span>作业安全措施交底：</td>
		</tr>
		<tr class="tfoot2">
        	<td colspan="6"  class="footer" style="height: 140px;padding:3px 1px 1px 5px;" valign="top">
        		${safeMeasureContent}
        	</td>
        </tr>
	</table>
   </div>
    <!--类名为pageBreak是强制换行，当数据条数大于27时，要添加-->
</div>
<input type="hidden" id="wtCode"  value="${WoWt.wtCode}">	
<script type="text/javascript">

var invar2 = '<div class="dangerContent"><div class="invar">'
                 +'<p style="display:block;bottom: -25px;text-align:left;font-size:16px;" class="prevDangerPage"></p>'
                 +'<table  class="table dangerTable tMerge">'
                 +'<thead><tr><th style="width:70px;">工序</th><th style="width:70px;">危险源</th><th style="width:110px;">危害因素</th><th style="width:398px;">作业安全措施</th></tr></thead><tr class="tfoot">'
                 +'<td colspan="6" style="border:none;"><span class="ident-number1">6.</span>作业安全措施交底：</td></tr>'
                 +'<tr  class="tfoot2">'
	             +'<td  colspan="6"  class="footer" style="height: 140px;padding:3px 1px 1px 5px;" valign="top">${safeMeasureContent}</td>'  		
                 +'</tr>  </table></div></div>';
//加载危险点预控措施
function loadDangerInfo()
{	
	var wtCode = "";
	 if(document.getElementById("wtCode").value!=null&&document.getElementById("wtCode").value!=""){
		 wtCode = document.getElementById("wtCode").value;
		 if(wtCode.replace(/(^\s*)|(\s*$)/g, "").length ==0){
			 wtCode = "";
		 }else{
			 wtCode = "NO:"+wtCode+" ";
		 }
 	}
	//setPageBreak($("#produceFistTable"),"produce");//安全文明生产交底    新工作票取消
	let invar = '<div class="dangerContent">' +$(".dangerContent").html()+'</div>';
	
	//invar = 
   	//let tfootHeight = $(".tfoot:last")[0].clientHeight;
   	//取危险点
   	$.ajax({
        url:"${ctx}/wo-wt/wo/woTaskSafeMeasure/allData?baseFilter=a.wt_id='${WoWt.id}'",    
       // async:true,
       type: "post",
        success: function (text) {         	
        	//$(".dangerContent:last").find(".tfoot:last").css("display","block");
        	//$(".dangerContent:last").find(".tfoot2:last").css("display","block");
        	let data = eval(text);
        	let pageNo = 1;
        	let onePage = '<div style="display: block" class="page one">'
        	   + '<p class="nextDangerPage"></p>'
               + '<p>第 <span class="pageNo">1</span>页/共 <span class="totalPage"></span>页</p>'              
               + '</div>';
            $(".dangerContent:last").find(".invar:last").append(onePage);
       		let str = "";
       		let pageHeight = A4;
           	for (let i = 0; i < data.length; i++) {
                str = '<tr id="d_'+i+'">';
                str += '<td>' + ((typeof(data[i].processName)!="undefined")?data[i].processName:"") + '</td>';
                str += '<td>' + ((typeof(data[i].dangerSourceName)!="undefined")?data[i].dangerSourceName:"") + '</td>';
                str += '<td>' + ((typeof(data[i].factorName)!="undefined")?data[i].factorName:"") + '</td>';
                /* str += '<td>' + ((typeof(data[i].consequenceName)!="undefined")?data[i].consequenceName:"") + '</td>';
                str += '<td>' + ((typeof(data[i].riskGradeName)!="undefined")?data[i].riskGradeName:"") + '</td>'; */
                str += '<td>' + ((typeof(data[i].measureName)!="undefined")?data[i].measureName:"") + '</td>';
                str += '</tr>';
                let height = $(".dangerContent:last")[0].clientHeight-171;
               
                //let pageHeight = A4 - 23;
                //alert(height+" :: " + pageHeight);
                if (height >= pageHeight) {               	
                	var removeIndex = i - 1;
                	//高度大于A4后，将最后一行删除，添加到下一页的第一行                   	
                	var prevTr = $("#d_"+removeIndex).prop("outerHTML");
                	//var prevTr = $("#d_"+removeIndex).html();
                	//var prevTr = '<tr id="d_'+removeIndex+'">'+prev+'</tr>';               	
                	$("#d_"+removeIndex).remove();
                	$(".dangerContent:last").find(".tfoot:last").remove();
                    $(".dangerContent:last").find(".tfoot2:last").remove();               	
                	               	
                	/* let newDIV=$('<div></div>');        //创建一个父div
                	newDIV.addClass('pageBreak');    //添加css样式 */
                	
                	$(".dangerContent:last").after($(invar2));                	               	
                	//$(".dangerContent:last").before(newDIV);
       				$(".dangerContent:last").before("<div class='pageFooter'></div><div class='pageBreak'></div><div class='pageHeader'></div>");
       				
       				//$(".table:last").find("tbody").append(str);
       				
       				$(".dangerContent:last").find(".tfoot:last").before(prevTr);
       				$(".dangerContent:last").find(".tfoot:last").before(str);
       				
       				//设置上承页
        	      	//$(".prevDangerPage:last").append(""+wtCode+"上承第"+pageNo+"页");
        	      	$(".prevDangerPage:last").append(""+wtCode+"上承第"+pageNo+"页");
        	        //设置上承页样式
        	      	//$(".prevDangerPage:last").css("bottom","-15px");
        	      	$(".prevDangerPage:last").css("bottom","-15px");
       				//页数加一
       				pageNo += 1;
       				let manyPage = '<div style="" class="page many">'
        	            	+ '<p class="nextDangerPage"></p>'
        	         		+ '<p >第 <span class="pageNo">'+pageNo+'</span>页/共 <span class="totalPage"></span>页</p>'
        	      			+ '</div>';
        	      	//先为上一个下接赋值
        	      	$(".nextDangerPage:last").append(""+wtCode+"下接第"+pageNo+"页");
        	      	$(".nextDangerPage").css("top","0px");
        	      	//为最后一个invar拼接页码行
       				$(".dangerContent:last").find(".invar:last").append(manyPage);
        	      	
                }
                else
                {
                	$(".dangerContent:last").find(".tfoot:last").before(str);                	
                }
            }
           	//设置共几页
           	$(".dangerContent").find(".totalPage").append(pageNo+"");
           	
           	//$(".table tbody").append(str);E:\01项目资料\2018\1804宿迁
           //let height = $(".dangerContent:last")[0].clientHeight;
           //blank = Math.ceil(height / A4) * A4-23;
           
           let height = $(".dangerContent:last").find(".invar:last")[0].clientHeight;
           let contHeight = ('#print-content')[0].clientHeight;
           blank = pageHeight;//A4-23;//pageNo * A4-23;
           if (height < blank) {       	  
               /**
                * 填充空白
                * */
               let html = '';
               let num = Math.floor((pageHeight - height-$(".dangerContent:last").prevAll(".pageHeader:first").height()) / $(".table01 tbody tr")[3].clientHeight);
               if(num > 0)
               {
            	   html += '<tr class="firstblanktr">';
                   html += '<td></td><td></td>';
                   html += '<td></td><td></td>';
                /*    html += '<td></td><td></td>'; */
                   html += '</tr>';
            	   $(".dangerContent:last").find(".tfoot:last").before(html);
            	   html = '';
            	   num = Math.floor((pageHeight - height-$(".dangerContent:last").prevAll(".pageHeader:first").height()) / $(".firstblanktr:last").height());
               }
               for (let i = 0; i < num; i++) {
                   html += '<tr>';
                   html += '<td></td>';
                   html += '<td></td>';
                   html += '<td></td>';
                   html += '<td></td>';
                  /*  html += '<td></td>';
                   html += '<td></td>'; */
                   html += '</tr>';
               }
               $(".dangerContent:last").find(".tfoot:last").before(html);   
               if(num > 0){//添加以下空白印章           	          
                   $(".dangerContent:last").find(".invar:last").append('<img id="#yxkb" src="${ctxStatic}/wo/icon/yxkb_yf.bmp" style="position: absolute;left:120px;margin:auto;top:' + (height-185)+ 'px">'); 
               }
               
           }
           //mergeRow(0,0,0,true);
           mergeRow();
   	       setPageBreak($("#wowtFirstTable"),"wowt");//主票面
       },
       error: function (jqXHR, textStatus, errorThrown) {
       }
   }); 
}
//合并行
  function mergeRow()
{	
	var removeTds = [];
	var mergeTds = [];
	var tables = $(".tMerge");
	for(var i = 0;i < tables.length;i++)
	{
		var  text = "000";
		var trs = $(tables[i]).find("tr");
		var tempText = "";
		var mergeTd;
		var td;
		var rowspan;
		for(var j = 0;j < trs.length;j++)
		{
			td = $(trs[j]).find("td:first");
			tempText = td.text();
			if(tempText && tempText == text)
			{
				if(!mergeTd._rowspan)
				{
					rowspan = 1;
					mergeTd._rowspan = 1;
				}
				else
				{
					rowspan = mergeTd._rowspan;
				}
				//rowspan = mergeTd.attr("rowspan");
				//if(!rowspan) rowspan = 1;
				removeTds.push(td);
				if(rowspan == 1)
				{
					mergeTds.push(mergeTd);
				}
				mergeTd._rowspan = mergeTd._rowspan+1;
			}
			else
			{
				text = tempText;
				mergeTd = td;
			}
		}
	}
	
	for(var i = 0;i < removeTds.length;i++)
	{ 
		removeTds[i].remove();
	}
	for(var i = 0;i < mergeTds.length;i++)
	{
		mergeTds[i].attr("rowspan",mergeTds[i]._rowspan);
	} 
	
} 
 //这种方法也行
 /**
  * 合并单元格(如果结束行传0代表合并所有行)
  * @param table1    表格的ID
  * @param startRow  起始行
  * @param endRow    结束行
  * @param col   合并的列号，对第几列进行合并(从0开始)。第一行从0开始
  */
  
  
/* function mergeRow(startRow, endRow, col, endCol, isInit){
	 var table = $(".tMerge")
	 for (var i = 0; i < table.length; i++) {
	   MergeCell(table[i],startRow, endRow, col, endCol, isInit)
	}
 }  */
///合并表格相同行的内容
///table：表格或者表格ID（最好是tbody，避免把表尾给合并了)
///startRow：起始行，没有标题就从0开始
///endRow：终止行，此参数是递归时检查的范围，一开始时会自动赋值为最后一行
///col：当前处理的列
///endCol:终止列
///isInit:是否初始调用，如果是则在终止行为0时自动取最后一行
/* function MergeCell(table,startRow, endRow, col, endCol, isInit) {
   debugger;
   if (col >= table.rows[0].cells.length || col > endCol) {
       return;
   }
   if (isInit == undefined) isInit = true;
   //当检查第0列时检查所有行
   if ((col == 0 || endRow == 0) && isInit) {
       endRow = table.rows.length - 1;
   }
   for (var i = startRow; i < endRow; i++) {
       //程序是自左向右合并
        console.log(table.rows[startRow].cells[col].innerHTML);
        console.log(table.rows[i + 1].cells[col].innerHTML);
       if (table.rows[startRow].cells[col].innerHTML == table.rows[i + 1].cells[col].innerHTML) {
           //如果相同则隐藏下一行的同列单元格
           table.rows[i+1].cells[col].style.display = 'none';
           //更新rowSpan属性
            console.log( table.rows[startRow].cells[col].rowSpan); 
           console.log((table.rows[startRow].cells[col].rowSpan | 0) + 1);
           table.rows[startRow].cells[col].rowSpan = (table.rows[startRow].cells[col].rowSpan | 0) + 1;
           //当循环到终止行前一行并且起始行和终止行不相同时递归(因为上面的代码已经检查了i+1行，所以此处只到endRow-1)
            //if (i == endRow - 1 && startRow != endRow) {
        	 //  MergeCell(table,startRow, endRow, col + 1, endCol, false);
           //} 
       } else {
           //起始行，终止行不变，检查下一列
          //MergeCell(table,startRow, i, col + 1, endCol, false);
           //增加起始行
           startRow = i + 1;
       }
   }
} */
 

</script>