<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/headt2.jsp"%>
<html>
<head>
    <title>${fns:getConfig('productName')}</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <style type="text/css">
     /* caption{
        color:red; 
        font-size:26px;      
       } */	
      table thead {
        border-top:1px solid #ddd;
        margin-top:20px;
       } 
       
        caption b{
        border-bottom:1px solid #00A1E6;
        width:50%;
        display:block;
       }
       
       .time{
       		width:245px;
       }
       
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini" onresize="chartResize();" >
	<input type="hidden" id="ctx" value="${ctx}"/>
            <!-- Info boxes -->
            <div class="row">
            </div>
            <div class="row">
                <div class="col-md-8">
                    <!-- TABLE: 待办任务 -->
                    <div class="box box-info">
                        <div class="box-header with-border" style="width: 100%">
                            <!-- 选项卡菜单-->
							<ul id="daibanTabs" class="nav nav-tabs" role="tablist">
							    <li class="active"><a href="#bulletin" id="daibantab" role="tab" data-toggle="tab">我的待办</a></li>
							    <li><a href="#rule" role="tab" id="yibantab"  data-toggle="tab">已办任务</a></li>
							</ul>
							<!-- 选项卡面板 -->
							<div id="myTabContent" class="tab-content">
							    <div class="tab-pane fade in active" id="bulletin">
									<act:todoTask tbodyId="daiban" title="缺陷待办" isToDo="1" procDefKey="flow" url="${ctx}/wo/woDefect/todoTask" needVar="0" pageSize="5"  func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="task" title="任务待办" isToDo="1"  procDefKey="worktask" url="${ctx}/oa/oaWorkTask/workTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="ticket" title="两票待办" isToDo="1"  procDefKey="elecWorkTicket1,elecWorkTicket2,rlWorkTicket,reKongTicket,dhWorkTicket1,dhWorkTicket2,chuChenTicket" url="${ctx}/wo/woWt/ticketTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="hideDanger" title="隐患待办" isToDo="1"  procDefKey="SmHideDanger" url="${ctx}/sm/smHideDanger/safeTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="reward" title="奖励待办" isToDo="1"  procDefKey="SmRewardApply" url="${ctx}/sm/smRewardApply/rewardTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="checkQuestion" title="问题整改待办" isToDo="1"  procDefKey="SmCheckQuestion" url="${ctx}/sm/smCheckQuestion/checkTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="logicNotice" title="程控设备逻辑修改通知单" isToDo="1"  procDefKey="omDcsLogicNotice" url="${ctx}/om/omDcsLogicNotice/todoTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<div id="wztask_divId">
										<table class="table table-hover" style="table-layout: fixed">
								    	<caption><b>物资待办</b></caption>
								    	<!-- <caption class="cap"></caption> -->
										  <thead>
										    <tr>
										      <th width="32px"></th>
										      <th width="50%">任务</th>
										      <th>当前节点</th>
										      <th class="time">日期</th>
										    </tr>
										  </thead>
										  <tbody id="wztask">
	                                      </tbody>
										</table>
									</div>
									<div id="db_notice_divId">
										<table class="table table-hover" style="table-layout: fixed">
								    	<caption><b>知会</b></caption>
										  <thead>
										    <tr>
										      <th width="50%">标题</th>
										      <th>知会人</th>
										      <th class="time">时间</th>
										    </tr>
										  </thead>
										  <tbody id="db_notice">
										  </tbody>
										</table>
										<div id = "notifyPage" align="center">
											<sys:pageTool readFlag="0" div_id="notifyPage" isToDo="1" tb_id="db_notice" url="${ctx}/oa/oaNotify/data" pageSize="5" func="loadNotify"></sys:pageTool>
										</div>
									</div>
							    </div>
							    <div class="tab-pane fade" id="rule">
							    	<div class="tab-pane fade in active" id="bulletin">
							    	
							    	<act:todoTask tbodyId="yiban" title="缺陷已办" isToDo="0" procDefKey="flow" url="${ctx}/wo/woDefect/historicTask" needVar="0" pageSize="5"  func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="hisTask" title="任务已办办" isToDo="0"  procDefKey="worktask" url="${ctx}/oa/oaWorkTask/hisWorkTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="ticketTask" title="两票已办" isToDo="0"  procDefKey="elecWorkTicket1,elecWorkTicket2,rlWorkTicket,reKongTicket,dhWorkTicket1,dhWorkTicket2,chuChenTicket" url="${ctx}/wo/woWt/hisTicketTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="hisHideDanger" title="安全已办" isToDo="0"  procDefKey="SmHideDanger" url="${ctx}/sm/smHideDanger/hisSafeTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="hisReward" title="安全已办" isToDo="0"  procDefKey="SmRewardApply" url="${ctx}/sm/smRewardApply/hisRewardTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="hisCheckQuestion" title="安全已办" isToDo="0"  procDefKey="SmCheckQuestion" url="${ctx}/sm/smCheckQuestion/hisCheckTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="hisLogicNotice" title="程控设备逻辑修改通知单" isToDo="0"  procDefKey="omDcsLogicNotice" url="${ctx}/om/omDcsLogicNotice/historicTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									
									<div id="db_readNotice_div">
										<table class="table table-hover" style="table-layout: fixed">
								    	<caption><b>已读知会</b></caption>
										  <thead>
										    <tr>
										      <th width="50%">标题</th>
										      <th>知会人</th>
										      <th class="time">时间</th>
										    </tr>
										  </thead>
										  <tbody id="db_readNotice">
										  </tbody>
										</table>
										<div id = "readNotifyPage" align="center">
											<sys:pageTool readFlag="1" div_id="readNotifyPage" isToDo="0" tb_id="db_readNotice" url="${ctx}/oa/oaNotify/data" pageSize="5" func="loadNotify"></sys:pageTool>
										</div>
									</div>
								    </div>
							    </div>
							</div>
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
            <!-- /.row -->
            <!-- Main row -->
            <div class="row">
</div>
<div class="row">
</div>
<div class="row">
</div>

            <script type="text/javascript">
            var map = {};
            var wzUrl="${fns:getConfig('inter.mm.url')}";
            function getCurrUserInfo(async) {
                var res='';
                $.ajax({
                    url: baseUrl+"/sys/sysUser/currUserInfo",
                    async:async,
                    dataType:'json',
                    success: function (text) {
                        res= text;
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                    	//showMessageBox("错误","用户信息获取失败,请重新刷新","error");
                    	mini.alert("用户信息获取失败,请重新刷新","错误");
                    }
                });
                return res;
            }
           var currUser= getCurrUserInfo(false);
            $(function(){
            //	toDo();
            //	toWorkTask();
            	
            //	toTicketTask();
           // 	fetchCmsArticle(); //获取定期工作
            	//defect();//加载缺陷图
            	onDaiBan();//加载待办任务
            	//loadGrid();//加载整改通知
            });
            $("#daibanTabs a").click(function(e){
            	if(this.id=='daibantab'){				//我的待办标签页
            		onDaiBan();//加载待办任务
            	}else if(this.id=='yibantab'){			//已办任务标签页
            		onYiBan();
            	}
                e.preventDefault();
                $(this).tab("show");
            });
            function loadGrid(){
            	
            	var grid = mini.get("datagridMain2");
            	var url = "${ctx}/sm/smCheckQuestion/data?baseFilter=a.status!='5'";
            //	grid.load(url);
            }
            function onDaiBan(){//点击待办时
            	wzToDoTask();//加载物资待办
            	notice();//加载知会
            	toLoadTask("daiban","${ctx}/wo/woDefect/todoTask",{procDefKey:'flow',pageSize:'5',needVar:"0"},'1');
            	toLoadTask("task","${ctx}/oa/oaWorkTask/workTask",{procDefKey:'worktask',pageSize:'5',needVar:"0"},'1');
            	toLoadTask("ticket","${ctx}/wo/woWt/ticketTask",{procDefKey:'elecWorkTicket1,elecWorkTicket2,rlWorkTicket,reKongTicket,dhWorkTicket1,dhWorkTicket2,chuChenTicket',pageSize:'5',needVar:"0"},'1');
            	toLoadTask("hideDanger","${ctx}/sm/smHideDanger/safeTask",{procDefKey:'SmHideDanger',pageSize:'5',needVar:"0"},'1');
            	toLoadTask("reward","${ctx}/sm/smRewardApply/rewardTask",{procDefKey:'SmRewardApply',pageSize:'5',needVar:"0"},'1');
            	toLoadTask("checkQuestion","${ctx}/sm/smCheckQuestion/checkTask",{procDefKey:'SmCheckQuestion',pageSize:'5',needVar:"0"},'1');
            	toLoadTask("logicNotice","${ctx}/om/omDcsLogicNotice/todoTask",{procDefKey:'omDcsLogicNotice',pageSize:'5',needVar:"0"},'1');
            }
				
            function onYiBan(){//点击已办时
            	toLoadTask("yiban","${ctx}/wo/woDefect/historicTask",{procDefKey:'flow',pageSize:'5',needVar:"0"},'0');
            	toLoadTask("hisTask","${ctx}/oa/oaWorkTask/hisWorkTask",{procDefKey:'worktask',pageSize:'5',needVar:"0"},'0');
            	toLoadTask("ticketTask","${ctx}/wo/woWt/hisTicketTask",{procDefKey:'elecWorkTicket1,elecWorkTicket2,rlWorkTicket,reKongTicket,dhWorkTicket1,dhWorkTicket2,chuChenTicket',pageSize:'5',needVar:"0"},'0');
            	toLoadTask("hisHideDanger","${ctx}/sm/smHideDanger/hisSafeTask",{procDefKey:'SmHideDanger',pageSize:'5',needVar:"0"},'0');
            	toLoadTask("hisReward","${ctx}/sm/smRewardApply/hisRewardTask",{procDefKey:'SmRewardApply',pageSize:'5',needVar:"0"},'0');
            	toLoadTask("hisCheckQuestion","${ctx}/sm/smCheckQuestion/hisCheckTask",{procDefKey:'SmCheckQuestion',pageSize:'5',needVar:"0"},'0');
            	toLoadTask("hisLogicNotice","${ctx}/om/omDcsLogicNotice/historicTask",{procDefKey:'omDcsLogicNotice',pageSize:'5',needVar:"0"},'0');
            	readNotice();	//已读知会
            }
            function getzfh(){
            	$.ajax({
                    url: "${ctx}/sis/rtdbs/zfh",
                    data:{},
                    type:"post",
                    dataType:"json",
                    success: function (data) {
						var s ="";
                  	  	if(data&&data.type=='I'){
                  	  		s = data.data.value;
                  	  	}
                  	  	$("#zfh").html(s);
                    }
                   
                });

            }
             function fetchCmsArticle() {
                  $.ajax({
                      url: "${ctx}/om/omPeriodWorkReg/getUserData",
                      data:{},
                      type:"post",
                      success: function (data) {
                    	  var dataFilter;
                    	  var cmsUlHtml = "";
                    	  if(data&&data.data&&data.data.length){
                    		  for(var i =0;i<data.data.length;i++ ){
                        		  var d = data.data[i];
                        		  var dateTime = "";
                        		  if(d.execDate){
                        			  dateTime = d.execDate.substring(0,10);
                        		  }
                        		  var planEndDate = "";
                        		  if(d.planEndDate){
                        			  planEndDate = d.planEndDate.substring(0,10);
                        		  }
                        		//  var dateTime = d.execDate.substring(0,10); 
                        		//  var planEndDate = d.planEndDate.substring(0,10); 
                        		  cmsUlHtml += "<li class=\"\">";
                                  cmsUlHtml += "    <div class=\"product-img\">";     
                                  cmsUlHtml += "          <span class=\'label label-danger\'>" + d.periodDesc + "</span>";  
                                  cmsUlHtml += "     </div>";  
                        		  cmsUlHtml += "	<div class=\"product-info\">";
                        		  cmsUlHtml += '		<a href="javascript:editFormRowById(\'' + d.id + '\')">'+ d.descr +'';
                        		  cmsUlHtml += "			<span>" + '&nbsp;&nbsp;&nbsp;&nbsp;' + "</span>";
                        		  cmsUlHtml += "			<span>" + dateTime + "</span>";
                        		  cmsUlHtml += "			<span class=\"pull-right\">" + planEndDate + "</span>";
                        		  cmsUlHtml += "		</a>";
                        		  cmsUlHtml += "	</div>";
                        		  cmsUlHtml += "</li>";
                        	  }
                    	  }
                    	  
                    	  $('#cmsul').append(cmsUlHtml);
                      },
                      dataType:"json"
                  });

              }
             
             function editFormRowById(did){
            	  
           	     newTabPage('定期工作记录',"${ctx}/om/omPeriodWorkReg/form?action=view&id="+did+"&showList=0",true);
             }

                var colors = ['#5793f3', '#d14a61', '#675bba'];
                function jsonToStr(jsonObj){
                	
    				var jStr = "{";
    			    for(var item in jsonObj){
    			        jStr += "\""+item+"\":\""+jsonObj[item]+"\",";
    			    }
    			    if(jStr !="{"){
    			    	jStr = jStr.substring(0,jStr.length-1);
    			    }
    			    jStr += "}";
    			    return jStr;
    			}
              
             
           //2.通用获取待办已办
             function toLoadTask(tbodyId,url,data,isToDo) {
 				$('#'+tbodyId).empty();
 				var toDoPage = tbodyId+"Page";
 				$('#'+toDoPage+' #facebook').show();
 				
 				var PageCount = 0;
 				 $.ajax({
                      url: url,
                   	 data:data,
                      type:"post",
                      success: function (data) {
                    	  var cmsUlHtmls = "";
                    	  var divId ="_"+tbodyId+"_content_div";
                    		if(data&&data.data&&data.data.length){
                    			var key=tbodyId+"_db_";
                    			if(data.data.length==0){
                    				$("#"+divId).css("display","none");
                    			}else{
                    				$("#"+divId).css("display","block");
                    			}
    		                    for(var i =0;i<data.data.length;i++ ){
    		                    	var d = data.data[i];
    		                    	map[key+i]=d;
    		                    	var title = d.title+"";
    		                    	var fullTitle = replaceAll(title);
		 		                   	  cmsUlHtmls += "<tr>"; 
		 		                   	  if(isToDo=='1'){
		 		                   		if(d.readStatus=='0'){
			 		                		  cmsUlHtmls += '<td style="width:30px;" title="未读"><img height="20px" width="25px" src="${ctxStatic}/images/mail.png"></img></td>';
			 		                	  }else{
			 		                		  cmsUlHtmls += '<td style="width:30px;" title="已读"><img height="20px" width="25px" src="${ctxStatic}/images/openmail.png"></img></td>';
			 		                	  }
		 		                   	  }
		 		                   	  
		 		                      cmsUlHtmls += ' <td style="overflow: hidden;text-overflow: ellipsis;" title='+fullTitle+'><nobr><a href="javascript:newToDoPage(\''+key+i+'\')">'+d.title+'</a></nobr></td>';     
		 		                      cmsUlHtmls += " <td><span class=\"label label-danger\">"+d.taskName+"</span></td>";  
		 		            		  cmsUlHtmls += " <td>";
			 		            	   if(isToDo=="1"){
			 								cmsUlHtmls += "  <div class=\"sparkbar\" data-color=\"#00a65a\" data-height=\"20\">"+(d.taskCreateDate==undefined?"":d.taskCreateDate)+"</div>";
			 							}else{
			 								cmsUlHtmls += "  <div class=\"sparkbar\" data-color=\"#00a65a\" data-height=\"20\">"+(d.taskEndDate==undefined?"":d.taskEndDate)+"</div>";
			 							}
		 		            		  
		 		            		  cmsUlHtmls += " </td>";
		 		            		  cmsUlHtmls += "</tr>";
		 		                    }
                    		}else{
                    			$("#"+divId).css("display","none");
                    		}
 	                    cmsUlHtmls = cmsUlHtmls.replace("/\r\n/g","");
 	              	    $('#'+tbodyId).append(cmsUlHtmls);
 	              		pageCount = Math.ceil((data.total)/(data.pageSize))
 	              		pageNumDeal(toDoPage,pageCount);
                      },
                      dataType:"json"
                  });
 			} 
             
             
             //3.物资待办
             function wzToDoTask(){
            	 $('#wztask').empty();
  				var PageCount = 0;
  				 $.ajax({
                 		url: wzUrl+"/mis_api/get_task?uid="+currUser.loginName,
                    	data:{},
                    	dataType:"json",
                       	type:"post",
                       	success: function (data) {
                     	  var cmsUlHtmls = "";
                     	  var divId="wztask_divId";
                     		if(data&&data.length){
                     			var key="wz_db_";
                     			if(data.length==0){
                    				$("#"+divId).css("display","none");
                    			}else{
                    				$("#"+divId).css("display","block");
                    			}
     		                    for(var i =0;i<data.length;i++ ){
     		                    	var d = data[i];
     		                    	map[key+i]=d;
     		                    	var title = d.ctitle;
 		 		                   	  cmsUlHtmls += "<tr>"; 
 		 		                   	  if(d.cflag=='0'){
 		 		                		  cmsUlHtmls += '<td style="width:30px;" title="未读"><img height="20px" width="25px" src="${ctxStatic}/images/mail.png"></img></td>';
 		 		                	  }else{
 		 		                		  cmsUlHtmls += '<td style="width:30px;" title="已读"><img height="20px" width="25px" src="${ctxStatic}/images/openmail.png"></img></td>';
 		 		                	  }
 		 		                      cmsUlHtmls += ' <td style="overflow: hidden;text-overflow: ellipsis;" title='+title+'><nobr><a href="javascript:newWzToDoPage(\''+key+i+'\')">'+title+'</a></nobr></td>';     
 		 		                      cmsUlHtmls += " <td><span class=\"label label-danger\">"+d.cnode+"</span></td>";  
 		 		            		  cmsUlHtmls += " <td>";
 		 		            		  cmsUlHtmls += "  <div class=\"sparkbar\" data-color=\"#00a65a\" data-height=\"20\">"+(d.cdate_start)+"</div>";
 		 		            		  cmsUlHtmls += " </td>";
 		 		            		  cmsUlHtmls += "</tr>";
 		 		                    }
                     		}else{
                     			$("#"+divId).css("display","none");
                     		}
  	                    cmsUlHtmls = cmsUlHtmls.replace("/\r\n/g","");
  	              	    $('#wztask').append(cmsUlHtmls);
  	              		pageCount = Math.ceil((data.total)/(data.pageSize))
  	              	  /*   $("#taskPage :input[name='pageCount']").val(pageCount);
  	              	    $("#taskPage .count").text(pageCount);
  	              	    $("#taskPage #pageNo").val("1");
 					  	$("#taskPage #pageNoReal").val("1");
 					  	$('#taskPage #facebook').hide(); */
                       }
                   });
             }
             
             
             //4.知会
             function notice(){
     			$('#db_notice').empty();
     			$('#notifyPage #facebook').show();
     			var PageCount = 0;
     			 $.ajax({
                      url: "${ctx}/oa/oaNotify/data",
                   	 data:{isSelf:'1',pageSize:'5',readFlag:'0'},
                      type:"post",
                      dataType:"json",
                      success: function (data) {
                    	  var cmsUlHtmls = "";
                    	  var divId="db_notice_divId";
                    		if(data&&data.data&&data.data.length){
                    			if(data.data.length==0){
                    				$("#"+divId).css("display","none");
                    			}else{
                    				$("#"+divId).css("display","block");
                    			}
 		                      for(var i =0;i<data.data.length;i++ ){
 		                      var d = data.data[i];
 		                   	  cmsUlHtmls += "<tr >"; 
 		                      cmsUlHtmls += ' <td><a href="javascript:newNoticePage(\''+d.id+'\')">'+d.title+'</a></td>';     
 		            		  cmsUlHtmls += " <td>";
 		            		  cmsUlHtmls += "  <div class=\"sparkbar\" data-color=\"#00a65a\" data-height=\"20\">"+d.createByName+"</div>";
 		            		  cmsUlHtmls += " </td>";
 		            		  cmsUlHtmls += " <td>";
 		            		  cmsUlHtmls += "  <div class=\"sparkbar\" data-color=\"#00a65a\" data-height=\"20\">"+d.createDate+"</div>";
 		            		  cmsUlHtmls += " </td>";
 		            		  cmsUlHtmls += "</tr>";
 		                      }
                    	}else{
                    		$("#"+divId).css("display","none");
                    	}
 	                      cmsUlHtmls = cmsUlHtmls.replace("/\r\n/g","");
 	              	      $('#db_notice').append(cmsUlHtmls);
 		              	  pageCount = Math.ceil((data.total)/(data.pageSize));
 		                  pageNumDeal("notifyPage",pageCount);
                      }
                      
                  });
     		}
//****************************已办****************************             
             
             //4.已读知会
             function readNotice(){
     			$('#db_readNotice').empty();
     			$('#readNotifyPage #facebook').show();
     			var PageCount = 0;
     			 $.ajax({
                      url: "${ctx}/oa/oaNotify/data",
                   	 data:{isSelf:'1',pageSize:'5',readFlag:'1'},
                      type:"post",
                      dataType:"json",
                      success: function (data) {
                    	  var cmsUlHtmls = "";
                    	  var divId="db_readNotice_div";
                    		if(data&&data.data&&data.data.length){
                    			if(data.data.length==0){
                    				$("#"+divId).css("display","none");
                    			}else{
                    				$("#"+divId).css("display","block");
                    			}
 		                      for(var i =0;i<data.data.length;i++ ){
 		                      var d = data.data[i];
 		                   	  cmsUlHtmls += "<tr >"; 
 		                      cmsUlHtmls += ' <td><a href="javascript:newNoticePage(\''+d.id+'\')">'+d.title+'</a></td>';     
 		            		  cmsUlHtmls += " <td>";
 		            		  cmsUlHtmls += "  <div class=\"sparkbar\" data-color=\"#00a65a\" data-height=\"20\">"+d.createByName+"</div>";
 		            		  cmsUlHtmls += " </td>";
 		            		  cmsUlHtmls += " <td>";
 		            		  cmsUlHtmls += "  <div class=\"sparkbar\" data-color=\"#00a65a\" data-height=\"20\">"+d.createDate+"</div>";
 		            		  cmsUlHtmls += " </td>";
 		            		  cmsUlHtmls += "</tr>";
 		                      }
                    		}else{
                    			$("#"+divId).css("display","none");
                    		}
 	                      cmsUlHtmls = cmsUlHtmls.replace("/\r\n/g","");
 	              	      $('#db_readNotice').append(cmsUlHtmls);
 		              	  pageCount = Math.ceil((data.total)/(data.pageSize));
 		              	  pageNumDeal("readNotifyPage",pageCount);
                      }
                  });
     		}
			
             function newToDoPage(i) {
            	 var d = map[i];
            	 var title="详细信息";
            	 if(d.title==null){
            		 d.title="待办";
            	 }
            	 newTabPage(title,"${ctx}/act/task/form?taskId="+d.taskId+"&taskName="+d.taskName+"&taskDefKey="+d.taskDefKey+"&procInsId="+d.procInsId+"&procDefId="+d.procDefId+"&status="+d.status,true);
			}
             function newWzToDoPage(i) {
            	 var d = map[i];
            	 var title="详细信息";
            	 if(d.title==null){
            		 d.title="待办";
            	 }
            	 newTabPage(title,wzUrl+"/mis_api/do_task?uid="+currUser.loginName+"&cid="+d.cid,true);
			}
             function newNoticePage(id){
            	 newTabPage('知会',"${ctx}/oa/oaNotify/form?id="+id,true);
             }
             function defect(){
            	 var ym = getYearMonth();
            	 BiTool.loadBIChart(55, "main1",{title_text:'消缺率统计('+ym+')',successEndFunction:loadBar1});
            	// BiTool.loadBIChart(54, "main2",{color:'#426ab3',title_text:'按运行专业统计('+ym+') 总计：',successEndFunction:loadBar2});
            	 BiTool.loadBIChart(53, "main2",{title_text:'按接收部门统计('+ym+')',successEndFunction:loadBar2});
            	 BiTool.loadBIChart(54, "main3",{color:'#DA3A35',title_text:'遗留缺陷统计  总计：',successEndFunction:loadBar3});
            	 BiTool.loadBIChart(57, "main4",{color:'#DA3A35',title_text:'遗留隐患统计  总计：',successEndFunction:loadBar4});
             }
             function getYearMonth(strTime){
            	 var date = new Date();
            	 if(strTime){
            		 date = new Date(strTime);
            	 }
            	
      		    
      		    var month=date.getMonth()+1;
      		    
      		    return date.getFullYear()+'年'+month+'月';
             }
             function formatDate (strTime) {
     		    var date = new Date(strTime);
     		    var m;
     		    var d;
     		    month=date.getMonth()+1;
     		    day=date.getDate();
     		    if(month<10){
     		    	m="0"+(date.getMonth()+1);
     		    }else{
     		    	s=date.getMonth()+1;
    		    	m=""+s;
     		    }
     		    if(day<10){
     		    	d="0"+date.getDate();
     		    }else{
     		    	d=""+date.getDate();
     		    }
     		    return date.getFullYear()+m+d;
     		}
             //本月第一天
      		function getCurrentMonthFirst(){
      		 var date=new Date();
      		 date.setDate(1);
      		 return date;
      		}
      	    //本月最后一天
      		function getCurrentMonthLast(){
      		 var date=new Date();
      		 var currentMonth=date.getMonth();
      		 var nextMonth=++currentMonth;
      		 var nextMonthFirstDay=new Date(date.getFullYear(),nextMonth,1);
      		 var oneDay=1000*60*60*24;
      		 return new Date(nextMonthFirstDay-oneDay);
      		}
            function loadLegend(data,option) {
      			var legend = [];
      			var data = data.data;
      			if(!data){
      				return option;
      			}
      			for (var i = 0; i < data.length; i++) {
      				legend.push(data[i].name);
      			}
      			option.legend.data = legend;
      			return option;
      		}
            function loadPie(){
            	
            }
            function loadPie1() {
                
     			var url = "${ctx}/wo/woDefect/showPieByDept";
     			var startDate = formatDate(getCurrentMonthFirst());
     			var endDate = formatDate(getCurrentMonthLast());
     			var data={startDate:startDate,endDate:endDate,dateType:'1',divId:'main1'};
     			BiTool.loadData({
     				domId:'main1',
     				url : url,
     				requestData : data,
     				resultMap : {
     					0 : ''
     				},
     				type:'update',
     				successEndFunction:loadLegend
     			});
     		}   
            function loadBar(){//请勿删除
            	
            }
             function loadBar2() {
            	 var url = "${ctx}/wo/woDefect/showBar2?orgQuery=71";
      			var startDate = formatDate(getCurrentMonthFirst());
      			var endDate = formatDate(getCurrentMonthLast());
      			var data={startDate:startDate,endDate:endDate,divId:'main2'};
      			BiTool.loadData({
    				domId:'main2',
    				url : url,
    				requestData : data,
    				resultMap : {
    					0 : 'qx',
    					1:'xcqx'
    				},
    				xAxisMap:{
    					0 : 'xAxisData'
    				},
    				successEndFunction:setTitle,
    				type:'update'
    			});
      			
      			
      		} 
             function loadBar3() {
            	 var url = "${ctx}/wo/woDefect/showYlqxBar";
            	 
            	 var data={orgQuery:71,divId:'main3'};
      			BiTool.loadData({
    				domId:'main3',
    				url : url,
    				requestData : data,
    				resultMap : {
    				/*	0 :'allqx',
    					1:'yxcqx',
    					2:'ylqx'
    					*/
    					
    					0:'ylqx'
    					
    				},
    				xAxisMap:{
    					0 : 'xAxisData'
    				},
    				successEndFunction:setTitle2,
    				type:'update'
    			});
      			
      			
      		} 
             function loadBar4() {
            	 var url = "${ctx}/sm/smHideDanger/showYlBar";
            	 
            	 var data={divId:'main4'};
      			BiTool.loadData({
    				domId:'main4',
    				url : url,
    				requestData : data,
    				resultMap : {
    				/*	0 :'allqx',
    					1:'yxcqx',
    					2:'ylqx'
    					*/
    					
    					0:'ylyh'
    					
    				},
    				xAxisMap:{
    					0 : 'xAxisData'
    				},
    				successEndFunction:setTitle2,
    				type:'update'
    			});
      			
      			
      		} 
             function loadBar1() {
            	 var url = "${ctx}/wo/woDefect/showXqlBar";
      			var ny = format(getCurrentMonthFirst(),"yyyyMM");
      			var endDate = formatDate(getCurrentMonthLast());
      			var data={ny:ny,orgQuery:71,divId:'main1'};
      			BiTool.loadData({
    				domId:'main1',
    				url : url,
    				requestData : data,
    				resultMap : {
    					0 : 'xql'
    				},
    				xAxisMap:{
    					0 : 'xAxisData'
    				},
    				type:'update',
    				successEndFunction:setTitle3
    			});
      			
      			
      		} 
             function setTitle3(data, option){
            	 
             	 var length = option.series[0].data.length;
             	 var value=0;
             	 var d = data.data.xql;
             	 for(var i=0;i<d.length;i++){
             		 if(!d[i].orgId){
             			 value=d[i].value;
             		 }
             	 }
             	 var markLine = {
             			 data: [
             	                [
             	                    {coord: [0, value]},{coord: [length-1, value]}
             	                ]
             	            ]
             	 };
             	 option.series[0].markLine=markLine;
             	 return option;
              }
             function setTitle(data, option){
            	 
             	var title = option.title.text;
             	var str = "发现总计："+data.data.allSum+",消除总计:"+data.data.yxcSum;
             	if(title){
             		title+=str;
             	}else{
             		title="总计："+str;
             	}
            	 option.title.text=title;
            	 return option;
             }
             function setTitle2(data, option){
              	var allSum = data.data.allSum;
              	var yxcSum = data.data.yxcSum;
              	var ylSum = data.data.ylSum;
              	var title = option.title.text;
              	
           //   	var str = "所有缺陷总计："+allSum+",已消除缺陷总计："+yxcSum+",遗留缺陷总计："+ylSum;
           		var str = ylSum;
              	if(title){
              		title+=str;
              	}else{
              		title=str;
              	}
             	 option.title.text=title;
             	 return option;
              }
           //饼图
             function clickPie(data){
            	 openNewTab(data) ;
             }
             
             function openNewTab(data) {
            	 if(data.componentType=='markLine'){
  					return;
  				}
            	 var countByDept=data.data.orgId;
     		     var startDate=format(getCurrentMonthFirst(),"yyyy-MM-dd");
     		    // var endDate =getCurrentMonthLast();
     		     var endDate=format(getCurrentMonthLast(),"yyyy-MM-dd");
     		    startDate=startDate+" 00:00:00";
         			endDate=endDate + " 23:59:59";
         			var pin="";
         			if(data.data.divId=='main1'){
         				
         				 pin="${ctx}/wo/woDefect/form?finalWc.receiveDept="+countByDept+"&startDay="+startDate+"&endDay="+endDate;
         			}else if(data.data.divId=='main2'){
         				pin="${ctx}/wo/woDefect/form?finalWc.receiveDept="+countByDept+"&startDay="+startDate+"&endDay="+endDate;
         				var seriesIndex = data.seriesIndex;
         				if(seriesIndex==1){
         					pin+="&status=12";
         				}
         			}
     		      		
     		     newTabPage(data.name+"缺陷",pin,true); 
     		} 
             function clickBar(data){
            	 
             		
            	 var divId = data.data.divId;
            	 if(divId=='main3'){
            		 var seriesIndex = data.seriesIndex;
            		 var countByDept=data.data.orgId;
            		 var url="";
            		 if(countByDept){
            			 url="${ctx}/wo/woDefect/form?finalWc.receiveDept="+countByDept +"&dataFilter=a.status!='12'";
            		 }else{
            			 url="${ctx}/wo/woDefect/form?dataFilter=(a.status!=12 and final_wc.receive_dept is null)";
            		 }
            	//	 var url="${ctx}/wo/woDefect/form?finalWc.receiveDept="+countByDept +"&dataFilter=a.status!=12";
            		/* if(seriesIndex==0){//所有缺陷
            			
            		 }else if(seriesIndex==1){//已消除缺陷
            			 url+="&status=12";
            		 }else if(seriesIndex==2){//遗留缺陷
            			 url+="&dataFilter=a.status!=12";
            		 }*/
            		 newTabPage(data.name+"缺陷",url,true); 
            	 }else if(divId=='main4'){
            		 
            	 debugger;
            		 var orgId=data.data.orgId; 
            		 var url="";
	            	 if(orgId&&orgId!=''){
	            		 url="${ctx}/sm/smHideDanger/form?chargeDept="+orgId +"&dataFilter=a.status!='6'";
	            	 }else{
	            		 url="${ctx}/sm/smHideDanger/form?dataFilter=(a.status!='6' and a.charge_dept is  null)";
	            	 }
	            	 console.log(url);
            		 newTabPage("隐患明细",url,true); 
            	 }else{
            	 
            		 openNewTab(data) ;
            	 }
            	 
             }
             var format = function(time, format){
            	    var t = new Date(time);
            	    var tf = function(i){return (i < 10 ? '0' : '') + i};
            	    return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a){
            	        switch(a){
            	            case 'yyyy':
            	                return tf(t.getFullYear());
            	                break;
            	            case 'MM':
            	                return tf(t.getMonth() + 1);
            	                break;
            	            case 'mm':
            	                return tf(t.getMinutes());
            	                break;
            	            case 'dd':
            	                return tf(t.getDate());
            	                break;
            	            case 'HH':
            	                return tf(t.getHours());
            	                break;
            	            case 'ss':
            	                return tf(t.getSeconds());
            	                break;
            	        }
            	    })
            	}
             
             function loadNotify(data,cid){
            	 var cmsUlHtmls = "";
           		if(data&&data.data&&data.data.length){
     	            for(var i =0;i<data.data.length;i++ ){
						var d = data.data[i];
						cmsUlHtmls += "<tr >"; 
						cmsUlHtmls += ' <td><a href="javascript:newNoticePage(\''+d.id+'\')">'+d.title+'</a></td>';     
						cmsUlHtmls += " <td>";
						cmsUlHtmls += "  <div class=\"sparkbar\" data-color=\"#00a65a\" data-height=\"20\">"+d.createByName+"</div>";
						cmsUlHtmls += " </td>";
						cmsUlHtmls += " <td>";
						cmsUlHtmls += "  <div class=\"sparkbar\" data-color=\"#00a65a\" data-height=\"20\">"+d.createDate+"</div>";
						cmsUlHtmls += " </td>";
						cmsUlHtmls += "</tr>"; 
     	            }
           		} 
                cmsUlHtmls = cmsUlHtmls.replace("/\r\n/g","");
                $('#'+cid).empty();
              	$('#'+cid).append(cmsUlHtmls);
             }
             
		function loadPageData(data,cid,isToDo){
			var cmsUlHtmls = "";
			if(data&&data.data&&data.data.length){
				for(var i =0;i<data.data.length;i++ ){
					var d = data.data[i];
					map[i]=d;
					var title = d.title+"";
                	var fullTitle = replaceAll(title);
					cmsUlHtmls += "<tr >"; 
					if(isToDo=="1"){
						if(d.readStatus=='0'){
	                		cmsUlHtmls += '<td style="width:30px;" title="未读"><img height="20px" width="25px" src="${ctxStatic}/images/mail.png"></img></td>';
	                	}else{
	                		cmsUlHtmls += '<td style="width:30px;" title="已读"><img height="20px" width="25px" src="${ctxStatic}/images/openmail.png"></img></td>';
	                	}
					}
					cmsUlHtmls += ' <td style="overflow: hidden;text-overflow: ellipsis;" title='+fullTitle+'><nobr><a href="javascript:newToDoPage('+i+')">'+d.title+'</a></nobr></td>';     
					cmsUlHtmls += " <td><span class=\"label label-danger\">"+d.taskName+"</span></td>";  
					cmsUlHtmls += " <td>";
					if(isToDo=="1"){
						cmsUlHtmls += "  <div class=\"sparkbar\" data-color=\"#00a65a\" data-height=\"20\">"+(d.taskCreateDate==undefined?"":d.taskCreateDate)+"</div>";
					}else{
						cmsUlHtmls += "  <div class=\"sparkbar\" data-color=\"#00a65a\" data-height=\"20\">"+(d.taskEndDate==undefined?"":d.taskEndDate)+"</div>";
					}
					cmsUlHtmls += " </td>";
					cmsUlHtmls += "</tr>";
				}
			} 
			cmsUlHtmls = cmsUlHtmls.replace("/\r\n/g","");
			$('#'+cid).empty();
			$('#'+cid).append(cmsUlHtmls);
		} 
		function replaceAll(str){
			if(str!=null)
			str = str.replace(/<strong>/g,"")
			str = str.replace(/<\/strong>/g,"")
			return str;
		}
		//页码处理
		 function pageNumDeal(id,pageCount){
        	 $("#"+id+" :input[name='pageCount']").val(pageCount);
        	    $("#"+id+" .count").text(pageCount);
        	    $("#"+id+" #pageNo").val("1");
			  	$("#"+id+" #pageNoReal").val("1");
			  	$('#'+id+' #facebook').hide();
         }
		
		function ylMore(){
			newTabPage('缺陷概况',"${ctx}/wo/woDefect/showEchartsGk?orgQuery=71&action=view&showList=0",true);
		}
		function chartResize(){
			BiTool.chartResize("main1");
			BiTool.chartResize("main2");
			BiTool.chartResize("main3");
		}
		function cqdbclick(e){
			
			var row = e.record;
			newTabPage('整改通知明细',"${ctx}/sm/smCheckQuestion/form?&action=view&showList=0&id="+row.id,true);
		
		}
		function simdbclick(e){
			
			var row = e.record;
			newTabPage('违章明细',"${ctx}/sm/smIllegalManage/form?&action=view&showList=0&id="+row.id,true);
		
		}
</script>
</body>
<script type="text/javascript">
    /* $('tbody tr:even').css('background-color','#58B4D0');
    $('tbody tr:odd').css('background-color','#FFFF00'); */
</script>
<script src="${ctxStatic}/common/pageTool.js"></script>
</html>