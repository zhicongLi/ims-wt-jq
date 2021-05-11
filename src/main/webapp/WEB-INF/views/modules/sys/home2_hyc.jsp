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
                <div class="col-md-12">
                    <!-- TABLE: 待办任务 -->
                    <div class="box box-info">
                        <div class="box-header with-border">
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
									<act:todoTask tbodyId="ticket" title="两票待办" isToDo="1"  procDefKey="elecWorkTicket1,elecWorkTicket2,rlWorkTicket,reKongTicket,dhWorkTicket1,dhWorkTicket2,chuChenTicket,urgentRepairTicket,worktaskTicket,confinedSpaceTicket" url="${ctx}/wo/woWt/ticketTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="hideDanger" title="隐患待办" isToDo="1"  procDefKey="SmHideDanger" url="${ctx}/sm/smHideDanger/safeTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="reward" title="奖励待办" isToDo="1"  procDefKey="SmRewardApply" url="${ctx}/sm/smRewardApply/rewardTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="smIllegalManage" title="考核待办" isToDo="1"  procDefKey="smIllegalManage" url="${ctx}/sm/smIllegalManage/task" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="checkQuestion" title="问题整改待办" isToDo="1"  procDefKey="SmCheckQuestion" url="${ctx}/sm/smCheckQuestion/checkTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
<%-- 									<act:todoTask tbodyId="logicNotice" title="程控设备逻辑修改通知单" isToDo="1"  procDefKey="omDcsLogicNotice" url="${ctx}/om/omDcsLogicNotice/todoTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
 --%>									<act:todoTask tbodyId="expireScaffolding" title="即将过期脚手架待办" isToDo="1"  procDefKey="SmScaffolding" url="${ctx}/sm/smScaffolding/expire" needVar="0" pageSize="-1" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="scaffolding" title="脚手架待办" isToDo="1"  procDefKey="SmScaffolding" url="${ctx}/sm/smScaffolding/scaffoldingTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="woDefectExemptCheck" title="缺陷免考核申请待办" isToDo="1"  procDefKey="wo_defect_exempt_check_flow" url="${ctx}/wo/woDefectExemptCheck/todoTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="woDefectMonthAnalysis" title="缺陷月度分析待办" isToDo="1"  procDefKey="wodefect_analysis" url="${ctx}/wo/woDefectMonthAnalysis/todoTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									
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
									<act:todoTask tbodyId="ticketTask" title="两票已办" isToDo="0"  procDefKey="elecWorkTicket1,elecWorkTicket2,rlWorkTicket,reKongTicket,dhWorkTicket1,dhWorkTicket2,chuChenTicket,urgentRepairTicket,worktaskTicket,confinedSpaceTicket" url="${ctx}/wo/woWt/hisTicketTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="hisHideDanger" title="隐患已办" isToDo="0"  procDefKey="SmHideDanger" url="${ctx}/sm/smHideDanger/hisSafeTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="hisReward" title="奖励已办" isToDo="0"  procDefKey="SmRewardApply" url="${ctx}/sm/smRewardApply/hisRewardTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="hisSmIllegalManage" title="违章已办" isToDo="0"  procDefKey="smIllegalManage" url="${ctx}/sm/smIllegalManage/hisTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="hisCheckQuestion" title="问题整改已办" isToDo="0"  procDefKey="SmCheckQuestion" url="${ctx}/sm/smCheckQuestion/hisCheckTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<%-- <act:todoTask tbodyId="hisLogicNotice" title="程控设备逻辑修改通知单" isToDo="0"  procDefKey="omDcsLogicNotice" url="${ctx}/om/omDcsLogicNotice/historicTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask> --%>
									<act:todoTask tbodyId="hisScaffolding" title="脚手架已办" isToDo="0"  procDefKey="SmScaffolding" url="${ctx}/sm/smScaffolding/hisScaffoldingTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									<act:todoTask tbodyId="hisWoDefectExemptCheck" title="缺陷免考核申请已办" isToDo="0"  procDefKey="wo_defect_exempt_check_flow" url="${ctx}/wo/woDefectExemptCheck/historicTask" needVar="0" pageSize="5" func="loadPageData"></act:todoTask>
									
									
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
                <!-- /.col -->
                <!-- /.col -->
            </div>
            <!-- /.row -->
            <!-- Main row -->
            <div class="row">
                <!-- Left col -->
                <div class="col-md-6">
                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title">缺陷消缺率</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-wrench"></i></button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">刷新</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">配置</a></li>
                                    </ul>
                                </div>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div id="main1" style=" height:300px;"></div>
                                <!-- /.col -->
                                <div id="main1Desc" style=" height:20px;padding-left: 10px;">
                              备注：本月发现的缺陷且在本月消除的缺陷数 ÷本月发现的所有缺陷数<br/>
          &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;横线为总消缺率,某专业缺陷数为0，消缺率也为100% 
                
                                </div>
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.box-body -->

                        <!-- /.footer -->
                    </div>
                </div>
                <!-- /.col -->
                
                <!-- Right col -->
                <div class="col-md-6">

                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title">缺陷统计</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-wrench"></i></button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">刷新</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">配置</a></li>
                                    </ul>
                                </div>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div id="main2" style=" height:300px;"></div>
                                <!-- /.col -->
                                <div id="main2Desc" style=" height:20px;padding-left: 10px;">
                                备注：缺陷发现时间在本月的所有缺陷，按检修专业统计
                                </div>
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.box-body -->

                        <!-- /.footer -->
                    </div>
                </div>
                <!-- /.col -->
</div>
<div class="row">
                <!-- Left col -->
                <div class="col-md-6">
                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title">遗留缺陷统计</h3>
                             <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-wrench"></i></button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">刷新</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">配置</a></li>
                                    </ul>
                                </div>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div id="main3" style=" height:300px;"></div>
                                <!-- /.col -->
                                <div id="main3Desc" style=" height:20px;padding-left: 10px;">
                              备注：遗留缺陷是当前未被验收的缺陷
                                </div>
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.box-body -->

                        <!-- /.footer -->
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-md-6">

                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title">遗留隐患统计</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-wrench"></i></button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">刷新</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">配置</a></li>
                                    </ul>
                                </div>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                            <div id="main4" style=" height:300px;"></div>
                                <!-- /.col -->
                                <div id="main4Desc" style=" height:20px;padding-left: 10px;">
                              	备注：遗留隐患是截止当前所有未验收的隐患
                                </div>
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.box-body -->

                        <!-- /.footer -->
                    </div>
                </div>
                
</div>
<!-- Main row -->
            <div class="row">
                <!-- Left col -->
                <div class="col-md-6">
                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title">程控设备逻辑修改统计</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-wrench"></i></button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">刷新</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">配置</a></li>
                                    </ul>
                                </div>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div id="main5" style=" height:375px;"></div>
                                <!-- /.col -->
                                <div id="main5Desc" style=" height:20px;padding-left: 10px;">
                           			备注：未发起流程及已作废数据未统计在内
                                </div>
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.box-body -->

                        <!-- /.footer -->
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-md-6">

                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title">未完成整改统计</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-wrench"></i></button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">刷新</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">配置</a></li>
                                    </ul>
                                </div>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                            	<div id="datagridMain2" class="mini-datagrid" style="width:99%;margin-left: 5px;"
										 url="${ctx}/sm/smCheckQuestion/data?baseFilter=a.status!='5'" idField="id"
										 allowResize="false" pageSize="10"
										 allowCellSelect="true" multiSelect="false" autoLoad="true"
										 editNextOnEnterKey="true"  editNextRowCell="true"	onrowdblclick="cqdbclick"
										 allowAlternating="true" showFilterRow="false"  showColumnsMenu="false"
									>
										<div property="columns">
											
												<div name="id"  field="id" vtype="required"  headerAlign="center" allowSort="true" width="64" hideable="true" visible="false">编号
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
												</div>
												
												<div name="title"  field="title" vtype=""  headerAlign="center" allowSort="true" width="255" >检查类目<br/>&nbsp;
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
												</div>
												<div name="descr"  field="descr" vtype=""  headerAlign="center" allowSort="true" width="250" >问题及表象<br/>&nbsp;
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
												</div>
												
												
												<div name="responDeptName"  field="responDeptName" vtype=""  headerAlign="center" allowSort="true" width="135" >责任部门<br/>&nbsp;
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
												</div>
									</div>
								</div>
								<div id="" style=" height:20px;padding-left: 10px;margin-top: 10px;">
                              		备注：双击可查看明细
                            	</div>
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.box-body -->

                        <!-- /.footer -->
                    </div>
                </div>
</div>

<div class="row">
                <!-- Left col -->
                <div class="col-md-6">
                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title">违章统计</h3>
                             <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-wrench"></i></button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">刷新</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">配置</a></li>
                                    </ul>
                                </div>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div id="datagridMain1" class="mini-datagrid" style="width:99%;"
										 url="${ctx}/sm/smIllegalManage/data" idField="id"
										 allowResize="false" pageSize="10" autoLoad="true"
										 allowCellEdit="false" allowCellSelect="true" multiSelect="true"
										 editNextOnEnterKey="true"  editNextRowCell="true"  onrowdblclick="simdbclick"
										 allowAlternating="true" showFilterRow="false"  showColumnsMenu="false"
									>
										<div property="columns">
											<div type="indexcolumn"></div>
												<div name="id" field="id" vtype="required" readOnly="true"  headerAlign="center"  visible="false" allowSort="true" width="64" >编号
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
												</div>
												
												<div name="name"  field="name" vtype=""  headerAlign="center" allowSort="true" width="100" >违章单位
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
												</div>
												<div name="illegalOrgName"  field="illegalOrgName" vtype=""  headerAlign="center" allowSort="true" width="100" >违章部门
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
												</div>
												<div name="penaltyAmount"  field="penaltyAmount" vtype=""  headerAlign="center" allowSort="true" width="80" >处罚金额<br/>(责任部门)
													<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
												</div>
												<div name="penaltyAmountOut"  field="penaltyAmountOut" vtype=""  headerAlign="center" allowSort="true" width="80" >处罚金额<br/>(外委部门)
													<input property="editor" class="mini-spinner" allowLimitValue="false" style="width:100%;"  />
												</div>
												<div name="happenPlace"  field="happenPlace" vtype=""  headerAlign="center" allowSort="true" width="200" >违章事由
													<input property="editor" class="mini-textbox"  style="width:100%;"  />
												</div>
												
							        </div>
							    </div>
							    <div id="" style=" height:20px;padding-left: 10px;margin-top: 10px;">
                              		备注：双击可查看明细
                            	</div>
                            </div>
                            
                            <!-- /.row -->
                        </div>
                        <!-- /.box-body -->

                        <!-- /.footer -->
                    </div>
                </div>
                <!-- /.col -->
               <!-- Right col -->
                
                <!-- /.col -->
                
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
            	defect();//加载缺陷图
            	onDaiBan();//加载待办任务
            	loadGrid();//加载整改通知
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
            	notice();//加载知会
            	toLoadTask("daiban","${ctx}/wo/woDefect/todoTask",{procDefKey:'flow',pageSize:'5',needVar:"0"},'1');
            	toLoadTask("task","${ctx}/oa/oaWorkTask/workTask",{procDefKey:'worktask',pageSize:'5',needVar:"0"},'1');
            	toLoadTask("ticket","${ctx}/wo/woWt/ticketTask",{procDefKey:'elecWorkTicket1,elecWorkTicket2,rlWorkTicket,reKongTicket,dhWorkTicket1,dhWorkTicket2,chuChenTicket,urgentRepairTicket,worktaskTicket,confinedSpaceTicket',pageSize:'5',needVar:"0"},'1');
            	toLoadTask("hideDanger","${ctx}/sm/smHideDanger/safeTask",{procDefKey:'SmHideDanger',pageSize:'5',needVar:"0"},'1');
            	toLoadTask("reward","${ctx}/sm/smRewardApply/rewardTask",{procDefKey:'SmRewardApply',pageSize:'5',needVar:"0"},'1');
            	toLoadTask("smIllegalManage","${ctx}/sm/smIllegalManage/task",{procDefKey:'smIllegalManage',pageSize:'5',needVar:"0"},'1');
            	toLoadTask("checkQuestion","${ctx}/sm/smCheckQuestion/checkTask",{procDefKey:'SmCheckQuestion',pageSize:'5',needVar:"0"},'1');
            	/* toLoadTask("logicNotice","${ctx}/om/omDcsLogicNotice/todoTask",{procDefKey:'omDcsLogicNotice',pageSize:'5',needVar:"0"},'1'); */
            	toLoadTask("scaffolding","${ctx}/sm/smScaffolding/scaffoldingTask",{procDefKey:'SmScaffolding',pageSize:'5',needVar:"0"},'1');
            	toLoadTask("expireScaffolding","${ctx}/sm/smScaffolding/expire",{procDefKey:'SmScaffolding',pageSize:'-1',needVar:"0"},'1');
            	toLoadTask("woDefectExemptCheck","${ctx}/wo/woDefectExemptCheck/todoTask",{procDefKey:'wo_defect_exempt_check_flow',pageSize:'5',needVar:"0"},'1');
            	toLoadTask("woDefectMonthAnalysis","${ctx}/wo/woDefectMonthAnalysis/todoTask",{procDefKey:'wodefect_analysis',pageSize:'5',needVar:"0"},'1');
            }
				
            function onYiBan(){//点击已办时
            	toLoadTask("yiban","${ctx}/wo/woDefect/historicTask",{procDefKey:'flow',pageSize:'5',needVar:"0"},'0');
            	toLoadTask("hisTask","${ctx}/oa/oaWorkTask/hisWorkTask",{procDefKey:'worktask',pageSize:'5',needVar:"0"},'0');
            	toLoadTask("ticketTask","${ctx}/wo/woWt/hisTicketTask",{procDefKey:'elecWorkTicket1,elecWorkTicket2,rlWorkTicket,reKongTicket,dhWorkTicket1,dhWorkTicket2,chuChenTicket,urgentRepairTicket,worktaskTicket,confinedSpaceTicket',pageSize:'5',needVar:"0"},'0');
            	toLoadTask("hisHideDanger","${ctx}/sm/smHideDanger/hisSafeTask",{procDefKey:'SmHideDanger',pageSize:'5',needVar:"0"},'0');
            	toLoadTask("hisReward","${ctx}/sm/smRewardApply/hisRewardTask",{procDefKey:'SmRewardApply',pageSize:'5',needVar:"0"},'0');
            	toLoadTask("hisSmIllegalManage","${ctx}/sm/smIllegalManage/hisTask",{procDefKey:'smIllegalManage',pageSize:'5',needVar:"0"},'0');
            	toLoadTask("hisCheckQuestion","${ctx}/sm/smCheckQuestion/hisCheckTask",{procDefKey:'SmCheckQuestion',pageSize:'5',needVar:"0"},'0');
            	/* toLoadTask("hisLogicNotice","${ctx}/om/omDcsLogicNotice/historicTask",{procDefKey:'omDcsLogicNotice',pageSize:'5',needVar:"0"},'0'); */
            	toLoadTask("hisScaffolding","${ctx}/sm/smScaffolding/hisScaffoldingTask",{procDefKey:'SmScaffolding',pageSize:'5',needVar:"0"},'0');
            	toLoadTask("hisWoDefectExemptCheck","${ctx}/wo/woDefectExemptCheck/historicTask",{procDefKey:'wo_defect_exempt_check_flow',pageSize:'5',needVar:"1"},'0');
            	toLoadTask("hisWoDefectMonthAnalysis","${ctx}/wo/woDefectMonthAnalysis/historicTask",{procDefKey:'wodefect_analysis',pageSize:'5',needVar:"1"},'0');
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
            	 var procDefKey = d.procDefKey;
            	 if('smAccidentAnalysis'==procDefKey){//事故分析不是用流程
            		 
            	 	var url = "${ctx}/sm/smAccidentAnalysis/form?action=view&showList=0&id="+d.id;
            		 newTabPage('事故分析',url,true);
            	 }else{
            		 var title="详细信息";
                	 if(d.title==null){
                		 d.title="待办";
                	 }
                	 newTabPage(title,"${ctx}/act/task/form?taskId="+d.taskId+"&taskName="+d.taskName+"&taskDefKey="+d.taskDefKey+"&procInsId="+d.procInsId+"&procDefId="+d.procDefId+"&status="+d.status,true);
            	 }
            	 
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
            	 BiTool.loadBIChart(53, "main2",{title_text:'按检修专业统计('+ym+')',successEndFunction:loadBar2});
            	// BiTool.loadBIChart(54, "main3",{color:'#DA3A35',title_text:'遗留缺陷统计  总计：',successEndFunction:loadBar3});
            	 BiTool.loadBIChart(58, "main3",{title_text:'遗留缺陷统计  总计：',successEndFunction:loadBar3});
            	 BiTool.loadBIChart(57, "main4",{color:'#DA3A35',title_text:'遗留隐患统计  总计：',successEndFunction:loadBar4});
            	 BiTool.loadBIChart(57, "main5",{color:'#DA3A35',title_text:'程控设备逻辑修改  总计：',successEndFunction:loadBar5});
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
            	 var url = "${ctx}/wo/woDefect/showBar2?specQuery=77";
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
            	 
            	 var data={specQuery:77,divId:'main3'};
      			BiTool.loadData({
    				domId:'main3',
    				url : url,
    				requestData : data,
    				resultMap : {
    				/*	0 :'allqx',
    					1:'yxcqx',
    					2:'ylqx'
    					*/
    					
    					0:'ylqx',
    					1:'gqqx'
    						/*
    					0:'fjz1List',
    					1:'fjz2List',
    					2:'fjz3List',
    					3:'gqqx'*/
    				},
    				xAxisMap:{
    					0 : 'xAxisData'
    				},
    				successEndFunction:setTitle4,
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
      			var data={ny:ny,specQuery:77,divId:'main1'};
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
             function loadBar5() {
            	 var url = "${ctx}/om/omDcsLogicNotice/showBar";
            	 var data={divId:'main5'};
      			BiTool.loadData({
    				domId:'main5',
    				url : url,
    				requestData : data,
    				resultMap : {
    					0 : 'tj'
    				},
    				xAxisMap:{
    					0 : 'xAxisData'
    				},
    				type:'update',
    				successEndFunction:setTitle5
    			});
      			
      			
      		} 
             function setTitle5(data, option){
               	var sum = data.data.sum;
               	var title = option.title.text;
               	
            		var str = sum;
               	if(title){
               		title+=str;
               	}else{
               		title=str;
               	}
              	 option.title.text=title;
              	 return option;
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
             function setTitle4(data, option){
             	var title = option.title.text;
             	var str = data.data.ylSum+",其中,挂起总计:"+data.data.gqSum;
             	if(title){
             		title+=str;
             	}else{
             		title="总计："+str;
             	}
            	 option.title.text=title;
            	 
            	 var xAxisData = data.data.xAxisData;
            	 var j1=data.data.fjz1List;
            	 var j2 =data.data.fjz2List;
            	 var j3 = data.data.fjz3List;
            	 
            	 if(xAxisData&&xAxisData.length){
            		 for(var i=0;i<xAxisData.length;i++){
            			 
            		 	var v1=0;
            		 	var v2 = 0;
            		 	var v3=0;
            			 if(j1&&j1.length&&j1.length>i){
            				 v1 = j1[i].value;
            			 }
            			 if(j2&&j2.length&&j2.length>i){
            				 v2 = j2[i].value;
            			 }
            			 if(j3&&j3.length&&j3.length>i){
            				 v3 = j3[i].value;
            			 }
            			 xAxisData[i]=xAxisData[i]+"\n("+v1+"/"+v2+"/"+v3+")";
            		 }
            	 }
            	 option.xAxisData = xAxisData;
            	/*  option.tooltip.formatter=function(datas){
            		 if(datas.length==0){
                         return '';
                     }
                     var res=datas[0].axisValueLabel+'<br/>';
                     
                     var sum=datas[0].value+datas[1].value+datas[2].value;
                     res+='遗留缺陷总计:'+sum;
                     for(var i=0;i<datas.length;i++){
                         res+='<br/>'+datas[i].marker+datas[i].seriesName + ':' + datas[i].value; 
                     }
                     
                   ///  return  res;
            	 } */
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
            	 debugger;
            	 var specId=data.data.specId;
     		     var startDate=format(getCurrentMonthFirst(),"yyyy-MM-dd");
     		    // var endDate =getCurrentMonthLast();
     		     var endDate=format(getCurrentMonthLast(),"yyyy-MM-dd");
     		    startDate=startDate+" 00:00:00";
         			endDate=endDate + " 23:59:59";
         			var pin="";
         			if(data.data.divId=='main1'){
         				
         				 if(specId){
         					 pin="${ctx}/wo/woDefect/form?startDay="+startDate+"&endDay="+endDate+"&baseFilter=(pci.spec_id='"+specId+"')";
         				 }else{//再次联系
         					pin="${ctx}/wo/woDefect/form?startDay="+startDate+"&endDay="+endDate+"&baseFilter=(pci.spec_id is null')";
         				 }
         			}else if(data.data.divId=='main2'){
         				if(specId){
         					pin="${ctx}/wo/woDefect/form?startDay="+startDate+"&endDay="+endDate+"&baseFilter=(pci.spec_id='"+specId+"')";
         				}else{
         					pin="${ctx}/wo/woDefect/form?startDay="+startDate+"&endDay="+endDate+"&baseFilter=(pci.spec_id is null')";
         				}
         			
         				
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
            		// var countByDept=data.data.orgId;
            		// var plantUnit=data.data.plantUnit;
            		var specId = data.data.specId
            		var plantUnit = "";
            		 var url="";
            		 if(specId){
            		//	 url="${ctx}/wo/woDefect/form?plantUnit="+plantUnit+"&finalWc.receiveDept="+countByDept +"&dataFilter=a.status!='12'";
            			 url="${ctx}/wo/woDefect/form?plantUnit="+plantUnit+"&baseFilter=(a.status!='12' and pci.spec_id='"+specId+"')";
            		 }else{
            			 url="${ctx}/wo/woDefect/form?plantUnit="+plantUnit+"&baseFilter=(a.status!=12 and pci.spec_id is null)";
            		 }
            		 if(seriesIndex==1){//挂起
            			url+="&status=8";
            		 }
            		 var titleStr = data.name;
            		 if(seriesIndex==1){//挂起
            			 titleStr+="挂起"
            		 }
            		 titleStr+="缺陷"
            		 titleStr=titleStr.replace(/\(.*?\)/,"");
            		 
            		 newTabPage(titleStr,url,true); 
            	 }else if(divId=='main4'){
            		 
            		 var orgId=data.data.orgId; 
            		 var url="";
	            	 if(orgId&&orgId!=''){
	            		 url="${ctx}/sm/smHideDanger/form?chargeDept="+orgId +"&dataFilter=a.status!='6'";
	            	 }else{
	            		 url="${ctx}/sm/smHideDanger/form?dataFilter=(a.status!='6' and a.charge_dept is  null)";
	            	 }
            		 newTabPage("隐患明细",url,true); 
            	 }else if(divId=='main5'){
            		 var status_key = data.data.status_key;
            		 var title ="";
            		 var url="";
            		 if(status_key=='4'){
            			 title="完成";
            			 url="${ctx}/om/omDcsLogicNotice/form?dataFilter=(a.status='8')";
            		 }else if(status_key=='3'){
            			 title="验收中";
            			 url="${ctx}/om/omDcsLogicNotice/form?dataFilter=(a.status='11')";
            		 }else if(status_key=='2'){
            			 title="执行中";
            			 url="${ctx}/om/omDcsLogicNotice/form?dataFilter=(a.status='7')";
            		 }else{
            			 title="审批中";
            			 url="${ctx}/om/omDcsLogicNotice/form?dataFilter=(a.status not in ('1','7','8','11','12'))";
            		 }
            		 newTabPage(title,url,true); 
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
            	    });
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
			BiTool.chartResize("main4");
			BiTool.chartResize("main5");
		}
		function cqdbclick(e){
			
			var row = e.record;
			newTabPage('整改通知明细',"${ctx}/sm/smCheckQuestion/form?&action=view&showList=0&id="+row.id,true);
		
		}
		function simdbclick(e){
			
			var row = e.record;
			newTabPage('违章明细',"${ctx}/sm/smIllegalManage/form?&action=view&showList=0&id="+row.id,true);
		
		}
		
		
		function onDrawCell_defect_check(e){
			var record = e.record,
       		column = e.column,
        	field = e.field,	//单元格name
        	
        	value = e.value;	//单元格value
	        var orgId='1';
        	var clickEnable = record.clickEnable;
        	var name = record.name;
        	var id = record.id;
        	if(field=='item'&clickEnable=='1'){
        		e.cellHtml = "<a href='#'  onclick='toDefectCheckNewTab(\""+id+"\",\""+name+"\")''>"+value+"</a>";
        	}
		}
		function toDefectCheckNewTab(id,name) {
		   	var url = '${ctx}/wo/woDefect/form?queryType=4&itemId='+id;
		   	newTabPage(name,url,true);
		}
		function clickview1(){
			var url='${ctx}/wo/woDefect/form?formView=wo/woDefectCheckTj'
			newTabPage('查看考核规则',url,true); 
			}
		
</script>
</body>
<script type="text/javascript">
    /* $('tbody tr:even').css('background-color','#58B4D0');
    $('tbody tr:odd').css('background-color','#FFFF00'); */
</script>
<script src="${ctxStatic}/common/pageTool.js"></script>
</html>