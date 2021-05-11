<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/headt2.jsp"%>
<head>
 <title>${fns:getConfig('productName')}</title>
</head>
<body>
	<video src="http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4" autoplay="autoplay" loop="loop" controls="controls" ></video>
	<table >
		<tr>
			<td colspan="5" align="center">
				机组负荷
			</td>
		</tr>
		<tr>
			<td>#01机</td>
			<td colspan="4"><span id="tag1">111</span></td>
		</tr>
		<tr>
			<td>#02机</td>
			<td colspan="4"><span id="tag2">111</span></td>
		</tr>
		<tr>
			<td colspan="5" align="center">
				主要环保参数
			</td>
		</tr>
		<tr>
			<td width="80">烟尘</td>
			<td width="80">#1</td>
			<td width="80"><span id="tag3">111</span></td>
			<td width="80">#2</td>
			<td width="80"><span id="tag4">111</span></td>
		</tr>
		<tr>
			<td>SO2</td>
			<td>#1</td>
			<td><span id="tag5">111</span></td>
			<td>#2</td>
			<td><span id="tag6">111</span></td>
		</tr>
		<tr>
			<td>NOx</td>
			<td>#1</td>
			<td><span id="tag7">111</span></td>
			<td>#2</td>
			<td><span id="tag8">111</span></td>
		</tr>
		<tr>
			<td colspan="5" align="center">
				安全生产天数
			</td>
		</tr>
		<tr>
			<td colspan="5">
				<span id="tag9">111</span>
			</td>
		</tr>
		时间：<span id="time"></span>
	</table>
	<script type="text/javascript">
		function setData(){
			try{
				$.ajax({
		            url: "${ctx}/sys/sysPublic/tagData",
		         	data : {},
		            type: "post",
		            success: function (data) {
		            	var d = mini.decode(data);
		            	if(d.type=='I'){
		            		var tagDatas = d.data;
		            		
		            		for(var i=0;i<tagDatas.length;i++){
		            			var tagData = tagDatas[i];
		            			$("#"+tagData.code).html(tagData.value);
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
		setInterval(setData,2000); 
		function currentTime(){
			  var d=new Date(),str='';
			  str+=d.getFullYear()+'年';
			  str+=d.getMonth() + 1+'月';
			  str+=d.getDate()+'日';
			  str+=d.getHours()+'时';
			  str+=d.getMinutes()+'分';
			  str+= d.getSeconds()+'秒';
			  return str;
			}
			setInterval(function(){$('#time').html(currentTime)},1000);
	</script>
</body>
</html>