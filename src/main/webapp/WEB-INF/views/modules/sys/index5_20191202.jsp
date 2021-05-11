<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<head>
<meta charset="utf-8">
 <title>${fns:getConfig('productName')}</title>
 <script src="${ctxStatic}/jquery/jquery-1.12.4.min.js"></script>
 <script src="${ctxStatic}/common/treps.js" type="text/javascript"></script>
 <link rel="stylesheet" href="${ctxStatic}/daping3/index.css"/>
</head>
<body>
<div id="fileInput">
<input type="file" id="file" onchange="setVideoSrc()">
</div>

	<div class="container">
			<div id="navigation" class="nav nav-bar">
				<div class="logo-area"><img src="${ctxStatic}/daping3/img/logo.png" alt=""></div>
				<!-- <div class="weather-area"><span id="ymd">2019年03月08日</span><span id="week">星期五</span><span id="weather">  </span><span id="temp">  </span></div> 
					天气和空气质量分开获取
				-->
				 <div class="weather-area"><span id="ymd">2019年03月08日</span><span id="week">星期五</span><span id="weather">  </span><span id="temp">  </span></div>
			</div>
			<div id="main" class="main main-section">
				<section class="video-area">
					<video id="video-control" width="100%" height="100%" autoplay="autoplay" loop="loop">
						<source src="http://10.70.11.245:8181/treps/userfiles/daping/4.mp4" type="video/mp4" />
					</video>
				</section>
				<aside class="parameter-area">
					<div class="parameter-wrap">
						<div class="parameter-list param-machine">
							<h3>机组负荷</h3>
							<ul class="param-table">
								<li class="param-option">
									<span class="param-name" >#1机</span>
									<span class="param-value" id="tag1">191.49</span>
									<span class="param-unit">MW</span>
								</li>
								<li class="param-option">
									<span class="param-name">#2机</span>
									<span class="param-value" id="tag2"></span>
									<span class="param-unit">MW</span>
								</li>
							</ul>
						</div>
						<div class="parameter-list param-environmental">
							<h3>主要环保参数</h3>
							<ul class="param-table">
							
							
							<li class="param-option">
									<span class="param-item">烟尘：</span>
									<div class="param-wrap">
										<p>
											<span class="param-name">#1：</span>
											<span class="param-value" id="tag3">191.49</span>
											<span class="param-unit">mg/Nm<sup>3</sup></span>
										</p>
										<p>
											<span class="param-name">#2：</span>
											<span class="param-value" id="tag4">191.49999</span>
											<span class="param-unit">mg/Nm<sup>3</sup></span>
										</p>
									</div>
							</li>
							<li class="param-option">
									<span class="param-item">SO<sub>2</sub>：</span>
									<div class="param-wrap">
										<p>
											<span class="param-name">#1：</span>
											<span class="param-value" id="tag5">191.49</span>
											<span class="param-unit">mg/Nm<sup>3</sup></span>
										</p>
										<p>
											<span class="param-name">#2：</span>
											<span class="param-value" id="tag6">191.49999</span>
											<span class="param-unit">mg/Nm<sup>3</sup></span>
										</p>
									</div>
							</li>
							<li class="param-option">
									<span class="param-item">NOx：</span>
									<div class="param-wrap">
										<p>
											<span class="param-name">#1：</span>
											<span class="param-value" id="tag7">191.49</span>
											<span class="param-unit">mg/Nm<sup>3</sup></span>
										</p>
										<p>
											<span class="param-name">#2：</span>
											<span class="param-value" id="tag8">191.49999</span>
											<span class="param-unit">mg/Nm<sup>3</sup></span>
										</p>
									</div>
							</li>
							</ul>
						</div>
						<div class="parameter-list param-safety">
							<h3>安全生产天数</h3>
							<div class="safety_days">
								<span id="day5"></span><span id="day4">0</span><span id="day3">0</span><span id="day2">0</span><span id="day1">0</span>&nbsp;&nbsp;<span>天</span>
							</div>
						</div>
					</div>
				</aside>
			</div>
		</div>
	
		
	<script type="text/javascript">
		function setData(){
			try{
				$.ajax({
		            url: "${ctx}/sys/sysPublic/tagData",
		         	data : {startDay:'${param.startDay}'},
		            type: "post",
		            dataType:'json',
		            success: function (data) {
		            	//var d = mini.decode(data);
		            	var d = data;
		           // 	alert(typeof d);
		            	if(d.type=='I'){
		            		var tagDatas = d.data;
		            		for(var i=0;i<tagDatas.length;i++){
		            			var tagData = tagDatas[i];
		            			if($("#"+tagData.code)){
		            				$("#"+tagData.code).html(tagData.value);
		            			}
		            			
		            		}
		            	}
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		               // alert("错误");
		            }
		        });
			}catch(e){
				console.log(e.name + ": " + e.message);
			}
			
			
		}	
		
		setData();
		currentTime();
		weather();
		aqi();
		setInterval(setData,1000*60*5); //5分钟
		setInterval(currentTime,1000*1);//5秒刷一次时间
		setInterval(weather,1000*60*60*4);//天气 4个小时更新
		setInterval(aqi,1000*60*60*4);//空气质量 4个小时更新
		
		function remove(){
			var c=$("#ClCache");
			if(c){
				c.hide();
			}
		}
		
		function currentTime(){
			  var d=new Date(),str='';
			  str+=d.getFullYear()+'年';
			  str+=d.getMonth() + 1+'月';
			  str+=d.getDate()+'日&nbsp;&nbsp;';
			  var h = d.getHours();
			  if(h<10){
				 str+='0'+h+':';
			  }else{
				   str+=h+':';
			  }
			 var m = d.getMinutes();
			 if(m<10){
				str+='0'+m+'';
			 }else{
				str+=m+'';
			 }
			  
			//  str+= d.getSeconds()+'秒';
			  
			  $('#ymd').html(str);
			  var week = getWeek();
			  $('#week').html(week);
			  getWeek();
		}
		function getWeek(){
			var str = "";  
			var week = new Date().getDay();  
			if (week == 0) {  
			        str = "星期日";  
			} else if (week == 1) {  
			        str = "星期一";  
			} else if (week == 2) {  
			        str = "星期二";  
			} else if (week == 3) {  
			        str = "星期三";  
			} else if (week == 4) {  
			        str = "星期四";  
			} else if (week == 5) {  
			        str = "星期五";  
			} else if (week == 6) {  
			        str = "星期六";  
			}  
			return str;
			
		}
		function setVideoSrc() {
			   var file = document.getElementById('file').files[0];
			   console.log("file:",file);
			   var url = URL.createObjectURL(file);
			   console.log(url);
			   document.getElementById("video-control").src = url;
			   $("#fileInput").hide();
		}
		
		
		function weather(){
			$.ajax({
		        type: 'GET',
		      //  url: 'https://www.tianqiapi.com/api/',
		        url: 'http://wthrcdn.etouch.cn/weather_mini?citykey=101091001',
		      //  data: 'version=v1&cityid=101091001',
		        dataType: 'JSON',
		        error: function () {
		        	$("#weather").html("天气：由于网络故障获取失败");
		        },
		        success: function (res) {
		        	//AppKey:5j1znBVAsnSf5xQyNQyq
		        	//alert(1);
		       /*      $('#box').append('<li>City: ' + res.city + '</li>');
		            $('#box').append('<li>Weather: ' + res.data[0].wea + '</li>');
		            $('#box').append('<li>Tips: ' + res.data[0].air_tips + '</li>');
		            // 遍历数组
		            for (var i = 0; i < res.data[0].hours.length; i++) {
		                $('#hours').append('<li>' + (i + 1) + ': 时间: ' + res.data[0].hours[i].day + ' 气温: ' + res.data[0].hours[i].tem + ' </li >');
		            } */
		            console.log(res);
		            
		           /*  var data = res.data;
		            if(data&&data.length&&data.length>0){
		            	var wea = data[0];
		            	var str = "天气:"+wea.wea+" 空气质量:"+wea.air+" "+wea.air_level;
		            	var temp = "温度:"+wea.tem2+"/"+wea.tem1;
		            	$("#weather").html(str);
		            	$("#temp").html(temp);
		            } */
		            var data = res.data;
		            if(data){
		            	var forecast = data.forecast;
		            	if(forecast&&forecast.length&&forecast.length){
		            		var wea = forecast[0];
			            	var str = "天气:"+wea.type+" 空气质量:";
			            	var temp = "温度:"+wea.low+"/"+wea.high;
			            	$("#weather").html(str);
			            	$("#temp").html(temp);
		            	}
		            }
		            
		        }
		    });
		}
		/**
		获取空气质量
		*/
		function aqi(){
			$.ajax({
		        type: 'GET',
		        url: 'http://api.help.bj.cn/apis/weather/?id=101091001',
		      //  data: 'version=v1&cityid=101091001',
		        dataType: 'JSON',
		        error: function () {
		        	$("#weather").html("天气：由于网络故障获取失败");
		        },
		        success: function (res) {
		        	debugger;
		            console.log(res);
		           
		            if(res&&res.status=='0'){
		            	var wea = res;
		            	var aqi = wea.aqi;
		            	 var str = "天气:"+wea.weather;
		            	if(aqi){
		            		var aqiNum  = parseInt(aqi);
		            		var zl = "";
		            		if(aqiNum>=0&&aqiNum<=50){
		            			zl="优";
		            		}else if(aqiNum>=51&&aqiNum<=100){
		            			zl="良";
		            		}else if(aqiNum>=101&&aqiNum<=150){
		            			zl="轻度污染";
		            		}else if(aqiNum>=151&&aqiNum<=200){
		            			zl="中度污染";
		            		}else if(aqiNum>=201&&aqiNum<=300){
		            			zl="重度污染";
		            		}else if(aqiNum>300){
		            			zl="严重污染";
		            		}else {
		            			zl="数据错误";
		            		}
		            		str+=" 空气质量:"+aqi+" "+ zl;
		            	}
		            	$("#weather").html(str);
		            	
		            }else{
		            	$("#weather").html("天气：暂无数据");
		            }
		            
		        }
		    });
		}
	</script>
</body>
</html>