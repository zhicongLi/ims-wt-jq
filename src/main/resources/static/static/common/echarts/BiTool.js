var A = function() {
	 this.div_prefix = "treps_bi_chart_div_";
};

A.prototype.loadData = loadData;
A.prototype.loadGrid = loadGrid;
A.prototype.replaceAll = function(str,str1,str2){
	
	var regExp = new RegExp(str1, "g");
    return str.replace(regExp, str2);

	
};
A.prototype.chartResize =function (domId){
	var myChart=this.getChart(domId);
	myChart.resize();
};
A.prototype.clear =function (domId){
	var myChart=this.getChart(domId);
	this.setDivOption(domId,{});
	myChart.clear();
};

A.prototype.objIsNotNull =function objIsNotNull(obj ) {
    if( obj!="null" && obj!=null && obj!=undefined && obj!=''){
        return true;
    }else
        return false;
}
A.prototype.loadLegend = function loadLegend(params){
	var domId= params.domId;
	var option = params.option;
	var setOrNot = params.setOrNot;//是否要setOption
	var noDataShow = params.noDataShow;//如果没有数据时，是否显示图例
	
	if(!domId){
		showMessageBox("错误","加载图例时domId 不能为空","error");
		return option;
	}
	var myChart = this.getChart(domId);
	if(!myChart){
		showMessageBox("错误","根据domId不能获取myChart","error");
		return option;
	}
	if(!option){
		option = this.getDivOption();
	}
	
	if(!this.objIsNotNull(setOrNot)){
		setOrNot=false;
	}
	if(!this.objIsNotNull(noDataShow)){
		noDataShow=false;
	}
	var legend=[];
	var series=option.series;
	if(!series){
		return option;
	}
	if(!series.length){
		return option;
	}
	for(var i=0;i<series.length;i++){
		var ss = series[i];
		if(ss.type=='pie'){
			if(ss.data.length){
				for(var i=0;i<ss.data.length;i++){
					var d = ss.data[i];
					if(d.name){
						legend.push(d.name);
					}
				}
			}
		}else if(ss.type=='line'||ss.type=='bar'||ss.type=='scatter'||ss.type=='map'){
			if(!ss.name){
				continue;
			}
			if(ss.data.length){
				if(ss.data.length==0){
					if(noDataShow){
						legend.push(ss.name);
					}
				}else{
					legend.push(ss.name);
				}
			}else{
				if(noDataShow){
					legend.push(ss.name);
				}
			}
		}else if(ss.type=='radar'){
			var dd =ss.data;
			if(!dd){
				continue;
			}
			if(!dd.length){
				continue;
			}
			for(var i=0;i<dd.length;i++){
				var d = dd[i];
				if(!d.name){
					continue;
				}
				if(d.value&&d.value.length&&value.length>0){
					legend.push(d.name);
				}else{
					if(noDataShow){
						legend.push(d.name);
					}
				}
			}
		}
	}
	option.legend.data=legend;
	if(setOrNot){
		myChart.setOption(option);
	}
	return option;
};
A.prototype.getDivOption = function(domId){
	var divId = this.getDivId(domId);
	return $('body').data(divId);
};
A.prototype.setDivOption = function(domId,option){
	
//	var optionStr = option;
/*	if(typeof option =='object'){
		//optionStr = mini.encode(option);
		optionStr = JSON.stringify(option);
	}*/
	var divId = this.getDivId(domId);
	$('body').data(divId,option);
//    var a = $('body').data('j');
//	if($("#"+divId).length>0){
//		$("#"+divId).html(optionStr);
//	}else{
//		$("body:eq(0)").append("<div id='"+divId+"'>"+optionStr+"</div>");
//	}
	
};
A.prototype.getDivId = function(domId){
	return this.div_prefix+domId;
};
A.prototype.isFunction=function (functionStr){
	if (functionStr != null && functionStr != ''
		&& typeof functionStr == 'function'){
		return true;
	}
	return false;
}

A.prototype.loadChart = function (params){
	var chartId = params.chartId;
	var domId = params.domId;
	var requestData = params.requestData;
	var async = params.async;
	var notMerge = params.notMerge;
	var lazyUpdate = params.lazyUpdate;
	var theme = params.theme;
	var successBeginFunction = params.successBeginFunction;
	var successEndFunction = params.successEndFunction;
	var errorFunction = params.errorFunction;
/*	if(!this.objIsNotNull(async)&&async!=false){
		async=true;
	}*/
	if(async==''||async===undefined || async==null){
		async = false;
	}
	if(!this.objIsNotNull(notMerge)&&notMerge!=false){
		notMerge = false;
	}
	if(!this.objIsNotNull(lazyUpdate)&&lazyUpdate!=false){
		lazyUpdate = false;
	}
    var data={};
    if(this.objIsNotNull(requestData)){
        data= requestData;
    }
    if(this.objIsNotNull(chartId)){
    	data['id']=chartId;
    }
    var myChart = this.getChart(domId,theme);
	myChart.showLoading();
	
	var _this=this;
	var picBase64Info;
    $.ajax({
        type: "POST",
        url:baseUrl+"/bi/biChart/chart",
        data: data,
        async:async,
        success: function(chartData){
        	if (_this.isFunction(successBeginFunction)) {
				successBeginFunction(chartData);
			}
            if(chartData.init){
                eval(chartData.init);
            }
            option = eval("(" + chartData.option + ")");
        //    var divId = this.getDivId(domId);
            _this.setDivOption(domId,option);
            myChart.setOption(option,notMerge,lazyUpdate);
            myChart.hideLoading();
            if(chartData.event){
                var eventObj = eval('(' + chartData.event + ')');

                for(var i=0;i<eventObj.length;i++){
                    myChart.on(eventObj[i].name, eval('(' + eventObj[i].value + ')'));
                }
            }
             picBase64Info = myChart.getDataURL();
            if(chartData.destory){
                eval(chartData.destory);
            }
            if (_this.isFunction(successEndFunction)) {
            	successEndFunction(chartData);
			}
        } ,
        error: function (jqXHR, textStatus, errorThrown) {
            var callback=function (action) {
            	viewErrorDetail(jqXHR.responseText);
            }
            if (_this.isFunction(errorFunction)) {
            	errorFunction(chartData);
			}
            myChart.hideLoading();
            var buttonsTemp=["ok","详细"];
            showMessageBox("错误","BI图表加载错误","error",null,callback,buttonsTemp);

        }
    });
    return picBase64Info;
}
A.prototype.loadBIChart = function (chartId,domId,params,async,notMerge,lazyUpdate,theme){
	var picBase64Info = this.loadChart({
			chartId:chartId,
			domId:domId,
			requestData:params,
			async:async,
			notMerge:notMerge,
			lazyUpdate:lazyUpdate,
			theme:theme
		}
	);
	return picBase64Info;
//	var dom = document.getElementById(domId);
//	var myChart = echarts.getInstanceByDom(dom);
/*	if(!objIsNotNull(async)){
		async=true;
	}
	var myChart = this.getChart(domId,theme);
	myChart.showLoading();
	if(!objIsNotNull(notMerge)){
		notMerge = false;
	}
	if(!objIsNotNull(lazyUpdate)){
		lazyUpdate = false;
	}
    var data={};
    if(objIsNotNull(params)){
        data= params;
    }
    if(objIsNotNull(charId)){
    	data['id']=charId;
    }
  //  this.setDivOption(domId,'ss');
    var _this=this;
    $.ajax({
        type: "POST",
        url:baseUrl+"/bi/biChart/chart",
        data: data,
        async:async,
        success: function(chartData){

            if(chartData.init){
                eval(chartData.init);
            }
            option = eval("(" + chartData.option + ")");
        //    var divId = this.getDivId(domId);
            _this.setDivOption(domId,option);
            myChart.setOption(option,notMerge,lazyUpdate);
            myChart.hideLoading();
            if(chartData.event){
                var eventObj = eval('(' + chartData.event + ')');

                for(var i=0;i<eventObj.length;i++){
                    myChart.on(eventObj[i].name, eval('(' + eventObj[i].value + ')'));
                }
            }
            if(chartData.destory){
                eval(chartData.destory);
            }

        } ,
        error: function (jqXHR, textStatus, errorThrown) {
            var callback=function (action) {
            	viewErrorDetail(jqXHR.responseText);
            }
            myChart.hideLoading();
            var buttonsTemp=["ok","详细"];
            showMessageBox("错误","BI图表加载错误","error",null,callback,buttonsTemp);

        }
    });
    */
} 


A.prototype.getChart = function (domId,theme){
	var dom = document.getElementById(domId);
	var myChart = echarts.getInstanceByDom(dom);
	if(!myChart||myChart.isDisposed()){
		if(!theme){
			theme=echartTheme;
		}
		myChart = echarts.init(dom,theme);
		
	}
	return myChart;
};
A.prototype.setDate=function(name,id,option){
	var dateid = "treps_"+id;
	$("#"+dateid).replaceWith('<input name="treps_"'+name+' id="'+dateid+'"  readonly="true"  style="width:150px"/>');
	$("#"+dateid).jeDate(option);
}
A.prototype.setDateOptionItem=function(id,item,value){
	treps_date_arr[id][item]=value;
}
A.prototype.clearDate=function(id){
	var dateid = "treps_"+id;
	$("#"+dateid).val("");
	mini.get(id).setValue("");
}
function loadData(params) {
	var domId= params.domId;
	var url = params.url;
	var requestData = params.requestData;
	var type = params.type;
	var successFunction = params.successFunction;
	var resultMap = params.resultMap;
	var successBeginFunction = params.successBeginFunction;
	var successEndFunction = params.successEndFunction;
	var refreshLegend=params.refreshLegend;
	var errorFunction = params.errorFunction;
	 if(!this.objIsNotNull(refreshLegend)){
		 refreshLegend=false;
	 }
	//var dom = document.getElementById(domId);
//	var myChart = echarts.getInstanceByDom(dom);
	//var myChart = getChart(domId);
	var myChart = this.getChart(domId);
	var xAxisMap=params.xAxisMap;
	myChart.showLoading();
	var _this=this;
	$.ajax({
		url : url,
		data : requestData,
		type : "post",
		dataType:"json",
		success : function(data) {
			if(typeof data =="string"){
				data =  eval('(' + data + ')'); 
			}
			
			var option = _this.getDivOption(domId);
			if (data.type == 'E') {
				showMessageBox("错误", data.message, "error");
				if (errorFunction != null && errorFunction != ''
					&& typeof errorFunction == 'function') {
					
					
					var r = errorFunction(data, option);
					if(r){
						option = r;
						_this.setDivOption(domId,option);
						
						myChart.setOption(option);
					}
					
				}
				myChart.hideLoading();
				return;
			}
			//var option = myChart.getOption();
			//var divId = this.div_prefix+domId;
			
		//	option=JSON.parse(option);
			if (successBeginFunction != null && successBeginFunction != ''
					&& typeof successBeginFunction == 'function') {
				var rr=successBeginFunction(data, option);
				if(rr){
					option = rr;
				}
				
			}
			if (successFunction != null && successFunction != ''
					&& typeof successFunction == 'function') {
				var rr = successFunction(data, option);
				if(rr){
					option = rr;
				}
			} else {
				var rData = data.data;
				if(!rData){
					rData=new Array();
				}
				if (type == 'add') {
					if (rData) {
						if (rData.length) {
							for (var i = 0; i < rData.length; i++) {
								option.series.push(rData[i]);
							}
						} else {
							option.series.push(rData);
						}
					}

				} else {
					if(xAxisMap){
						for(var key in xAxisMap){
							var value = xAxisMap[key];
							if(key==''){
								if(value==''){
									if(rData){
										option.xAxis.data=rData;
									}else{
										option.xAxis.data=new Array();
									}
									
								}else{
									if(rData&&rData[value]){
										option.xAxis.data=rData[value];
									}else{
										option.xAxis.data=new Array();
									}
									
								}
								
							}else{
								option.xAxis[key].data=rData[value];
							}
						}
					}
					for ( var key in resultMap) {
						var value = resultMap[key];
						if (key >= option.series.length) {
							showMessageBox("错误", "加载失败", "error");
							myChart.hideLoading();
							return;
						}
						if (value == '') {
							if(rData){
								option.series[key].data = rData;
							}else{
								option.series[key].data = new Array();
							}
							
						} else {
							if(rData&&rData[value]){
								option.series[key].data = rData[value];
							}else{
								option.series[key].data = new Array();
							}
							
						}
					}
				}
			}

			if (successEndFunction != null && successEndFunction != ''
					&& typeof successEndFunction == 'function') {
				var rr = successEndFunction(data, option);
				if(rr){
					option = rr;
				}
			}
			
		//	myChart.dispose();
			myChart = _this.getChart(domId);
			if(refreshLegend){
				option=_this.loadLegend({
					domId:domId,
					option:option,
					setOrNot:false,
					noDataShow:false
				});
			}
			_this.setDivOption(domId,option);
			
			myChart.setOption(option);
			myChart.hideLoading();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			var callback = function(action) {
				viewErrorDetail(jqXHR.responseText);
			}
			myChart.hideLoading();
			var buttonsTemp = [ "ok", "详细" ];
			showMessageBox("错误", "加载失败", "error", null, callback, buttonsTemp);
		}
	});
}
function loadGrid(params) {
	//mini.parse();
	var gridId = params.gridId;
	var url = params.url;
	var param = params.requestData;
	var successFunction=params.successFunction;
	var errorFunction = params.errorFunction;
	var type = params.type;
	if(!this.objIsNotNull(type)){
		type='json';
	}
	var grid = mini.get(gridId);
	$.ajax({
		url : url,
		data : param,
		type : "post",
		success : function(data) {
			if(type=='string'){
				data = mini.decode ( data, true );
			}
			if (data.type == 'E') {
				showMessageBox("错误", data.message, "error");
				if (errorFunction != null && errorFunction != ''
					&& typeof errorFunction == 'function') {
					errorFunction(data);
				}
				hideMessageBox( );
				return;
			}
			if (successFunction != null && successFunction != ''
				&& typeof successFunction == 'function') {
				successFunction(data);
				hideMessageBox( );
			}else{
				//if(type=='json'){
					grid.set({
						data : data.data,
						totalCount:data.total,
						pageIndex:data.pageIndex,
						pageSize:data.pageSize
					});
					if(typeof hideMessageBox=="function"){
						hideMessageBox();
					}
					
				//}else{
					//var ee=mini.decode ( data, true );
					//grid.set({
					//	data : ee.data
				//	});
				//}
				
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			var callback = function(action) {
				viewErrorDetail(jqXHR.responseText);
			}
			var buttonsTemp = [ "ok", "详细" ];
			showMessageBox("错误", "加载失败", "error", null, callback,
					buttonsTemp);
		}
	});

}
var BiTool = new A();
