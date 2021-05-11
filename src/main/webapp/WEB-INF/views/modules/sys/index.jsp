<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<head>
<meta charset="utf-8">
 <title>${fns:getConfig('productName')}</title>
 <script src="${ctxStatic}/jquery/jquery-1.12.4.min.js"></script>
 <script src="${ctxStatic}/common/treps.js" type="text/javascript"></script>
 <link rel="stylesheet" href="${ctxStatic}/daping/index.css"/>
</head>
<body>
	<div class="container">
			<div id="navigation" class="nav nav-bar">
				<div class="logo-area"><img src="${ctxStatic}/daping/img/logo.png" alt=""></div>
				<div class="weather-area"><span>2019年03月08日</span><span>星期五</span></div>
			</div>
			<div id="main" class="main main-section">
				<section class="video-area">
					<video id="video-control" width="100%" height="100%" autoplay="autoplay" loop="loop">
						<source src="http://10.70.11.245:8181/treps/userfiles/daping/1.mp4" type="video/mp4" />
					</video>
				</section>
				<aside class="parameter-area">
					<div class="parameter-wrap">
						<div class="parameter-list param-machine">
							<h3>机组负荷</h3>
							<ul class="param-table">
								<li class="param-option">
									<span class="param-name">#01机</span>
									<span class="param-value" id="tag1">191.49</span>
									<span class="param-unit">mw</span>
								</li>
								<li class="param-option">
									<span class="param-name">#02机</span>
									<span class="param-value" id="tag2">191.49</span>
									<span class="param-unit">mw</span>
								</li>
							</ul>
						</div>
						<div class="parameter-list param-environmental">
							<h3>主要环保参数</h3>
							<ul class="param-table">
								<li class="param-option">
									<span class="param-name">烟尘：</span>
									<span id="tag3">#1</span>
									<span id="tag4">#2</span>
								</li>
								<li class="param-option">
									<span class="param-name">SO2：</span>
									<span id="tag5">#1</span>
									<span id="tag6">#2</span>
								</li>
								<li class="param-option">
									<span class="param-name">NOx：</span>
									<span id="tag7">#1</span>
									<span id="tag8">#2</span>
								</li>
							</ul>
						</div>
						<div class="parameter-list param-safety">
							<h3>安全生产天数</h3>
							<div class="safety_days" id="days2">
								<span>1</span><span>2</span><span>9</span><span>7</span>
							</div>
						</div>
					</div>
				</aside>
			</div>
			<div id="footer" class="fot-bar">
				
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
		setInterval(setData,1000*60*5); //5分钟
		function remove(){
			var c=$("#ClCache");
			if(c){
				c.hide();
			}
		}
	</script>
</body>
</html>