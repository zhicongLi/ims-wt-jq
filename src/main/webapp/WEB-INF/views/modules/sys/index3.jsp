<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<head>
<meta charset="utf-8">
 <title>${fns:getConfig('productName')}</title>
 <script src="${ctxStatic}/jquery/jquery-1.12.4.min.js"></script>
 <script src="${ctxStatic}/common/treps.js" type="text/javascript"></script>
 <link rel="stylesheet" href="${ctxStatic}/daping2/index.css"/>
</head>
<body>
	<div class="container">
			<div id="navigation" class="nav nav-bar">
				<div class="logo-area"></div>
				<div class="weather-area"><span id="ymd">2019年03月08日</span><span id="week">星期五</span><span><!-- 天气 --></span></div>
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
									<span class="param-name" >#01机</span>
									<span class="param-value" id="tag1">191.49</span>
									<span class="param-unit">MW</span>
								</li>
								<li class="param-option">
									<span class="param-name">#02机</span>
									<span class="param-value" id="tag2"></span>
									<span class="param-unit">MW</span>
								</li>
							</ul>
						</div>
						<div class="parameter-list param-environmental">
							<h3>主要环保参数</h3>
							<ul class="param-table">
								<li class="param-option">
									<span class="param-name">烟尘：</span>
									<div class="param-value">
										<span id="tag3">#1:&nbsp;&nbsp;3.2911</span>
										<span id="tag4">#2:&nbsp;&nbsp;1.51</span>
									</div>
								</li>
								<li class="param-option">
									<span class="param-name">SO2：</span>
									<div class="param-value">
										<span id="tag5">#1:&nbsp;&nbsp;3.2911</span>
										<span id="tag6">#2:&nbsp;&nbsp;1.51</span>
									</div>
								</li>
								<li class="param-option">
									<span class="param-name">NOx：</span>
									<div class="param-value">
										<span id="tag7">#1:&nbsp;&nbsp;3.2911</span>
										<span id="tag8">#2:&nbsp;&nbsp;1.51</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="parameter-list param-safety">
							<h3>安全生产天数</h3>
							<div class="safety_days">
								<span id="day5">0</span><span id="day4">0</span><span id="day3">0</span><span id="day2">0</span><span id="day1">0</span>&nbsp;&nbsp;<span>天</span>
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
		setInterval(setData,1000*60*5); //5分钟
		setInterval(currentTime,1000*60*10);
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
			  str+=d.getDate()+'日';
			  //str+=d.getHours()+'时';
			//  str+=d.getMinutes()+'分';
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
			
	</script>
</body>
</html>