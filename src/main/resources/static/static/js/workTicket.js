//工作票的逻辑
function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
} 
function printWoOt() {
		var currentBtn = document.getElementById("printWoOt");
		currentBtn.style.display = "none";
		window.print();
		currentBtn.style.display = "block";
}
	
$(document).ready(function(){
	 
	    //循环遍历
	    $(".spantime").each(function()
	    { 
	    //判断span标签是否存在值,没有给它固定样式
	       if($(this).text()==""){	    	  
	           $(this).addClass("current");
	        }

	      })
})

//处理需要换行的内容
function setRow1Content(id, prefix){
		var isContain = $("#"+id).val();
		if(isContain)
		{
			isContain = isContain.indexOf(prefix);
			var value=$("#"+id).val();
			if(value!=null&&isContain!=-1){
				var trueValue=$("#"+id).val().slice(prefix.length);
				$("#"+id).attr("value", trueValue);
			}
		}
}

//设置分页
function setPageBreak(firstTable,sign)
{	var wtCode = "";
//		var pageBreakFlag = false;
	 if(document.getElementById("wtCode").value!=null&&document.getElementById("wtCode").value!=""){
		 wtCode = document.getElementById("wtCode").value;
		 if(wtCode.replace(/(^\s*)|(\s*$)/g, "").length ==0){
			 wtCode = "";
		 }else{
			 wtCode = "NO:"+wtCode+" ";
		 }
	 }
	var table = firstTable;//$(".print-content").find("table:first");
	var flag = true;//是否循环
	var pageNo = 1;
	var pageHeight = A4-25;//内容高度，要减去页面所占高度
	var breakFlag = false;//记录是否进行了break
	
	var getNextTable = true;
	while(flag)
	{
		getNextTable = true;
		breakFlag = false;
		flag = false;
		var trs = table.find("tr");
		var trTop = 0;
		var blockTop = 0;//块或者前一个pageBreak距离上端的位置
//			if(pageBreakFlag == false)
//			{
//				blockTop = table.parent().offset().top;//$($(".print-content:last")[0]).offset().top;
//			}
//			else
//			{
			 let breakPage = table.prevAll(".pageBreak:first");//因为是向上找同级，所以取first   $(".pageBreak:last").offset().top;
			 if(breakPage.length == 0)
			{
				 breakPage = table.parent().prevAll(".pageBreak:first");
			}
			 if(breakPage.length == 0)
			{
				 blockTop = table.parent().offset().top;
			}
			 else
			{
				 blockTop = breakPage.offset().top;
			}
//			}
		var merge = false;//拆分行是否为合并单元格
		
		for(var i = 0;i < trs.length;i++)
		{
			trTop = $(trs[i]).offset().top;
			if((trTop - blockTop) > pageHeight)
			{
				var row;
				//如果是第一行，则应该将上一个table的最后一行添加到新的一页
				if(i == 0)
				{
					table = $(table).prev();
					trs = table.find("tr");
					i = trs.length - 1;
					row = trs[i];
				}
				else
				{
					row = trs[i-1];
				}
				//需要处理合并单元格的情况
				var mergeFlag = $(row).attr("mergeFlag");
				if(mergeFlag)
				{
					var prevRows = $(row).prevAll("[mergeFlag="+mergeFlag+"]");
					var prevRowsLen = prevRows.length;
					if(prevRowsLen < 3)
					{
						//将该合并行拼接到下一个table
						row = trs[i - 1 - prevRowsLen];
					}
					else
					{
						merge = true;
					}
				}
				
				/* var table = $(row).parent();
				var tagName = table[0].tagName;
				if(tagName != "TABLE")
				{
					table = table.parent();
					tagName = table[0].tagName;
				} */
				//border="0" cellspacing="0" cellpadding="0" class="table02"
				//设置换行
				//$(trs[i-1]).before(html);
				var border = table.attr("border");
				var cellspacing = table.attr("cellspacing");
				var cellpadding = table.attr("cellpadding");
				var className = table.attr("class");
				border = (border==undefined)?" ":("border='"+border+"' ");
				cellspacing = (cellspacing==undefined)?" ":("cellspacing='"+cellspacing+"' ");
				cellpadding = (cellpadding==undefined)?" ":("cellpadding='"+cellpadding+"' ");
				className = (className==undefined)?" ":("class='"+className+"' ");
				
				if($(row).prev().length == 0)
				{
					//该行是table下的第一行
					if(pageNo > 1)
					{
						$(".nextPage:last").append(""+wtCode+"下接第" + pageNo + "页");
					}
					//添加页码
					table.before(getPageInfo(pageNo,sign));
					
					table.before("<div class='pageBreak'></div>");
					table.before("<p style='display: block;text-align:left;' >"+wtCode+"上承第"+pageNo+"页</p>");
					pageNo++;
					breakFlag = true;
					break;
				}
				//将需要分到下一页的行从当前table删除，并放到一个新的table
				var nextAllRow = $(row).nextAll();
				
				var newTable = "<table " + border + cellspacing + cellpadding + className+">";
				var tds = row.children;
				for(var i = 0;i < tds.length;i++)
				{
					$(tds[i]).css("width",$(tds[i]).width());
					//$(tds[i]).width($(tds[i]).width());
				}
				
				//处理合并行，只处理第一列是合并行的情况  合并行的地方需要是单独一个table，否则兼容性有问题
				if(merge == true)
				{
					var mergeFlag = $(row).attr("mergeFlag");
					var prevRows = $(row).prevAll("[mergeFlag="+mergeFlag+"]");
					var firstRow = prevRows[prevRows.length - 1];
					$(firstRow).attr("rowspan",""+prevRows.length);
					var firstTd = $(firstRow).find("td:first-child");//取第一个td的内容
					$(row).prepend(firstTd[0].outerHTML);//插入合并的单元格
					var curNextAllRow = $(row).nextAll("[mergeFlag="+mergeFlag+"]");
					$(row).find("td:first-child").attr("rowspan",""+(curNextAllRow.length+1));//设置合并行属性

					//$(row).find("td:first-child").attr("rowspan",""+(nextAllRow.length+1));//设置合并行属性
					//$(row).find("td:first-child").css("width",""+firstTd.width());//设置合并行属性
					$(row).find("td:first-child").width(firstTd.width());
				}
				
				newTable += row.outerHTML;
				$(row).remove();
				for(var i = 0; i < nextAllRow.length;i++)
				{
					//拼接到新table
					newTable += nextAllRow[i].outerHTML;
					//删除行
					$(nextAllRow[i]).remove();
				}
				newTable += "</table>";
//					pageBreakFlag = true;
				if(pageNo > 1)
				{
					$(".nextPage:last").append(""+wtCode+"下接第" + pageNo + "页");
				}
				table.after(newTable);
				table.after("<p style='display: block;bottom: -25px;text-align:left;' >"+wtCode+"上承第"+pageNo+"页</p>");
				table.after("<div class='pageBreak'></div>");
				table.after(getPageInfo(pageNo,sign));
				pageNo++;
				//after加了四个所以next四次
				table = table.next().next().next().next();
				flag = true;
				breakFlag = true;
				getNextTable = false;
				break;
			}
		}
		//table = table.next();
		if(table.next().length == 0)
		{
			if(breakFlag == true)
			{
				continue;
			}
			flag = false;
			if(pageNo > 1)
			{
				$(".nextPage:last").append(""+wtCode+"下接第" + pageNo + "页");
			}
			let pageInfo ='<div style="" class="page many lastPage">'
	        	+ '<p>第 <span class="pageNo">'+pageNo+'</span>页/共 <span class="totalPage'+sign+'"></span>页</p>'
	     		+ '<p class="nextPage"></p>'
	  			+ '</div>'
			table.after(pageInfo);
	  		var lastPage = $(".lastPage:last");
			//var top = pageNo * A4 - $("#lastMainPage").offset().top;

			var top = A4 - (lastPage.offset().top - blockTop);
				lastPage.css("margin-top",top);
				
				$(".totalPage"+sign).append(pageNo);
		}
		else if(getNextTable == true)
		{
			table = table.next();
			flag = true;
		}
	}
	return pageNo;
}
//获取页码信息
function getPageInfo(pageNo,sign)
{
	var pageInfo = "";
	if(pageNo == 1)
	{
		pageInfo = '<div style="display: block" class="page one">'
            + '<p>第 <span class="pageNo">1</span>页/共 <span class="totalPage'+sign+'"></span>页</p>'
            + '<p class="nextPage"></p>'
            + '</div>';
	}
	else
	{
		pageInfo ='<div style="" class="page many">'
    	+ '<p>第 <span class="pageNo">'+pageNo+'</span>页/共 <span class="totalPage'+sign+'"></span>页</p>'
 		+ '<p class="nextPage"></p>'
			+ '</div>'
	}
	return pageInfo;
}
//设置作废章位置
//function setDescribe()
//{
//	content1
//}
