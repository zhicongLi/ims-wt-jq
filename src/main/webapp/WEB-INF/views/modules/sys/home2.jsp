<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/headt2.jsp"%>
<html>
<head>
    <title>${fns:getConfig('productName')}</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<script src="${ctxStatic}/trepsui/scripts/boot.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/trepsui-ext.min.js"></script>
	<link rel="stylesheet" href="${ctxStatic}/bootstrap-datepicker/css/bootstrap-datepicker.min.css">
	<script src="${ctxStatic}/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

	
	<style type="text/css">
	.cut{
		 width:250px;
		 white-space:nowrap;
		 text-overflow:ellipsis; 
		 -o-text-overflow:ellipsis; 
		 overflow: hidden;
		 float:left;
	 	}
	 .products-list > .item {
		  border-radius: 3px;
		  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
		  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
		  padding:3px 0;
		  background: #fff;
	 }
	</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">




            <!-- Info boxes -->
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <span class="info-box-icon bg-aqua"><i class="ion ion-android-person"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">公司客户数</span>
                            <span class="info-box-number" id="custCount"></span>
                            <span class="info-box-text" name="hYear"></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <span class="info-box-icon bg-red"><i class="ion ion-social-buffer"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">合同数量</span>
                            <span class="info-box-number" id="conCount"></span>
                            <span class="info-box-text" name="hYear"></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->

                <!-- fix for small devices only -->
                <div class="clearfix visible-sm-block"></div>

                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <span class="info-box-icon bg-green"><i class="ion ion-ios-cart-outline"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">合同电量(亿千瓦时)</span>
                            <span class="info-box-number" id="qtyPlan"></span>
                            <span class="info-box-text" name="hYear"></span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box">
                        <span class="info-box-icon bg-yellow"><i class="ion ion-social-yen"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">合同金额(万元)</span>
                            <span class="info-box-number" id="conMoney"></span>
                            <span class="info-box-text" name="hYear"></span>
                            <span class="info-box-text" style="padding-left:60px;"><span class="info-box-text">年份:<a href="#"id="yearpicker" name="hYear"/></a></span></span>
                         </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->
            </div>
            <div class="row">
            	 <div class="col-md-5">
            	 
                    <!-- PRODUCT LIST -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><a style = "cursor: pointer;" onclick="javascript:newTabPage('政策文件','${ctx}/cms/cmsArticle/form',true)">政策文件</a></h3>

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
                            <ul id="cmsul" class="products-list product-list-in-box" style="overflow:scroll;height:320px;">
                              
                            </ul>
                        </div>

                        <!-- /.box-footer -->
                    </div>
                </div>
                <!-- /.col -->
            
                <div class="col-md-7">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title"><a style = "cursor: pointer;" onclick="javascript:newTabPage('客户分布图','${ctx}/pt/ptCustomerMap/view',true)">客户分布图</a></h3>

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
                			<iframe id="khfbt" src="${ctx}/pt/ptCustomerMap/view?noHeader=1" width="100%" height="320px"  scrolling="no" frameborder='0'></iframe>	
                        </div>
                        <!-- /.box-footer -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->

            </div>
            <!-- /.row -->

            <!-- Main row -->
             <div class="row">
             	
             					
                <div class="col-md-5">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><a style = "cursor: pointer;" onclick="javascript:newTabPage('待办任务','${ctx}/oa/oaWorkPlan/form',true)">待办任务</a></h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-wrench"></i></button>
                                    <ul class="dropdown-menu" role="menu" >
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
                            <ul id="oaul" class="products-list product-list-in-box" style="overflow:scroll;height:320px;">
                             
                            </ul>
                        </div>

                        <!-- /.box-footer -->
                    </div>


                    <!-- /.box -->

                    <!-- /.box -->
                </div>
                <!-- /.col -->
             	
                <div class="col-md-7">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title"><a style = "cursor: pointer;" onclick="javascript:newTabPage('供需预测','${ctx}/pt/ptMarketForecast/supplyDemandForecast?areaId=1699',true)">供需预测</a></h3>

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
                             <iframe id="khfbt" src="${ctx}/pt/ptMarketForecast/supplyDemandForecast?areaId=1699&noHeader=1" width="100%" height="320px"  scrolling="no" frameborder='0'></iframe>	
                         </div>
                    </div>
                </div>
                <!-- /.col -->
                
            </div>
              <div class="row">
                <div class="col-md-12">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title"><a style = "cursor: pointer;" onclick="javascript:newTabPage('各合同类型统计分析','${ctx}/pt/ptContractTypeAnalysis/view',true)">各合同类型统计分析</a></h3>

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
                            <iframe id="httjfx" src="${ctx}/pt/ptContractTypeAnalysis/view?noHeader=1" width="100%" height="640px"  scrolling="no" frameborder='0'></iframe>	
                        </div>
                    </div>
                </div>
                <!-- /.col -->
            </div>
   <script type="text/javascript">
   $(function(){ 
	   initData();
	   $('#yearpicker').datepicker({
		   language: 'zh-CN',//显示中文
		   format: 'yyyy',//显示格式
		   minView: "mouth",//设置只显示到月份
		   autoclose: true,//选中自动关闭
		   altForma:'yyyy',
	       startView: 2,  
	       maxViewMode: 2,
	       minViewMode:2,
	       forceParse: false, 
		  })
	 .on('changeDate',function(ev){
			var year = ev.date.getFullYear();
			showMessageBox(null,"操作中，请稍后......","loading");
			 initData(year);
		});
});
   		function initData(year){
   			var year = year;
   			if(!year){
   				var myDate = new Date();
   				year = myDate.getFullYear();
   			}
   			$.ajax({
                url: "${ctx}/sd/sdCust/initData?year="+year,
                success: function (text) {
                    var o = mini.decode(text);
                    if(objIsNotNull(o.type)){
                        //alert(text);
                        if(o.type=="E"){
                            showMessageBox("错误",o.message,"error");
                            return;
                        }else if(o.type=="W"){
                            showMessageBox("警告",o.message,"warning");
                        }else if(o.type=="I"){
                            //showTipM("info","提示",o.message);
                        }
                    }
                    hideMessageBox();
                    var data = o.data;
                    console.log(data);
                    var custCount = data.custCount;
                    var conCount = data.conCount;
                    var conMoney = data.conMoney;
                    var qtyPlan = data.qtyPlan;

                    $("#custCount").html(custCount);
                    $("#conCount").html(conCount);
                    $("#conMoney").html(conMoney);
                    $("#qtyPlan").html(qtyPlan);
                    $("[name ='hYear']").html(year+"年");
                    
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    var callback=function (action) {
                        viewErrorDetail(jqXHR.responseText);
                    }
                    var buttonsTemp=["ok","详细"];
                    showMessageBox("错误",o.message,"error",null,callback,buttonsTemp);
                }
            });
   		}
   		
   		fetchCmsArticle(true);
   		fetchOaWorkPlan(true);
      function fetchCmsArticle(async) {
           var res='';
           $.ajax({
               url: "${ctx}/cms/cmsArticle/data",
               async:async,
               data:{ pageSize:15 },
               success: function (text) {
                    var o = mini.decode(text);
                    var data = o.data;
                    //console.log(data);
                   //console.log(o);
                   for (var i = 0; i < data.length; i++) {
                	   var row=data[i];
                	   var title = row.title;
                	    if(row.categoryName=='国家政策'){ 
                      	 $('#cmsul').append("<li class='item'><div class='product-img'><span class='label label-danger'>"+row.categoryName+"</span>&nbsp;&nbsp;&nbsp;&nbsp;</div>"+
                     	  "<div class='product-info'><div><a href='javascript:void(0)' onclick=\"javascript:newTabPage('政策文件','${pageContext.request.contextPath}${fns:getFrontPath()}/view-"+row.categoryId+ "-" + row.id + "${fns:getUrlSuffix()}',true)\" class='product-title'><div class='cut'>"+title+"</div><span class='pull-right'>"+row.updateDate.format('MM-dd')+"["+row.publishName+"]</span></a></div></li>");
                	    }else{
                		   $('#cmsul').append("<li class='item'><div class='product-img'><span class='label label-success'>"+row.categoryName+"</span>&nbsp;&nbsp;&nbsp;&nbsp;</div>"+
                            "<div class='product-info'><a href='javascript:void(0)' onclick=\"javascript:newTabPage('政策文件','${pageContext.request.contextPath}${fns:getFrontPath()}/view-"+row.categoryId+ "-" + row.id + "${fns:getUrlSuffix()}',true)\" class='product-title'><div class='cut'>"+title+"</div><span class='pull-right'>"+row.updateDate.format('MM-dd')+"["+row.publishName+"]</span></a></div></li>"); 
                	   } 
                   }
               },
               error: function (jqXHR, textStatus, errorThrown) {
                   var callback=function (action) {
                       viewErrorDetail(jqXHR.responseText);
                   }
                   var buttonsTemp=["ok","详细"];
                   showMessageBox("错误","获取查询失败","error",null,callback,buttonsTemp);

               }
           });

       }
      
/*     <li class="item"><div class="product-img">定期切换</div><div class="product-info"><a href="javascript:void(0)" class="product-title">事故照明停、投试验 
       <span class="label label-warning pull-right">每月1号</span></a></div></li> */
    function fetchOaWorkPlan(async){
        var res='';
        $.ajax({
            url: "${ctx}/oa/oaWorkPlan/getDataByCondition",
            async:async,
            data:{
            	query:'home'
            },
            success: function (text) {
                var o = mini.decode(text);
                //console.log(text);
                //console.log(o);
                for (var i = 0; i < o.length; i++) {
                    var row=o[i];
                    var name = row.name;
                    var spancolor = 'label-success';
                    if(row.typeName=='集团任务'){
                    	spancolor = 'label-danger';
                    }else if(row.typeName=='长源任务'||row.typeName=='电厂任务'){
                    	spancolor = 'label-warning';
                    }
                    $('#oaul').append("<li class='item'><div class='product-img'><span class='label "+spancolor+"'>"+row.typeName+"</span>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='product-info'><a href='javascript:void(0)' onclick=\"javascript:newTabPage('待办任务','${ctx}/oa/oaWorkPlan/form?action=view&id="+row.id+"&showForm=1&showList=0')\" class='product-title'><div class='cut'>"+name+""+
                    	       "</div><span class='pull-right'>"+row.planStartDate.format('MM-dd')+"</span></a></div></li>");
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                var callback=function (action) {
                    viewErrorDetail(jqXHR.responseText);
                }
                var buttonsTemp=["ok","详细"];
                showMessageBox("错误","获取查询失败","error",null,callback,buttonsTemp);

            }
        });

    }
   </script>

</body>

</html>