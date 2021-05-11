<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!-- 
skinCell:"jedateblue",                //日期风格样式，默认蓝色
format:"YYYY-MM-DD hh:mm:ss",         //日期格式
minDate:"1900-01-01 00:00:00",        //最小日期
maxDate:"2099-12-31 23:59:59",        //最大日期
insTrigger:true,                      //是否为内部触发事件，默认为内部触发事件
startMin:"",                          //清除日期后返回到预设的最小日期
startMax:"",                          //清除日期后返回到预设的最大日期
isinitVal:false,                      //是否初始化时间，默认不初始化时间
initAddVal:[0],                       //初始化时间，加减 天 时 分
isTime:true,                          //是否开启时间选择
ishmsLimit:false,                     //时分秒限制
ishmsVal:true,                        //是否限制时分秒输入框输入，默认可以直接输入时间
isClear:true,                         //是否显示清空
isToday:true,                         //是否显示今天或本月
clearRestore:true,                    //清空输入框，返回预设日期，输入框非空的情况下有效
festival:false,                       //是否显示农历节日
fixed:true,                           //是否静止定位，为true时定位在输入框，为false时居中定位
zIndex:2099,                          //弹出层的层级高度
marks:null,                           //给日期做标注
choosefun:function(elem, val) {},     //选中日期后的回调, elem当前输入框ID, val当前选择的值
clearfun:function(elem, val) {},      //清除日期后的回调, elem当前输入框ID, val当前选择的值
okfun:function(elem, val) {},         //点击确定后的回调, elem当前输入框ID, val当前选择的值
success:function(elem) {},            //层弹出后的成功回调方法, elem当前输入框ID

 -->

<%@ attribute name="name" type="java.lang.String" required="true" description="input的name"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="input的id"%>
<%@ attribute name="format" type="java.lang.String" required="false" description="日期格式"%>
<%@ attribute name="type" type="java.lang.String" required="false" description="日期格式"%><!-- type 为1时为季度，空或0为 日期 -->
<%@ attribute name="inputStr" type="java.lang.String" required="false" description="input的其他内容"%>
<%@ attribute name="minDate" type="java.lang.String" required="false" description="最小日期"%>
<%@ attribute name="maxDate" type="java.lang.String" required="false" description="最大日期"%>
<%@ attribute name="choosefun" type="java.lang.String" required="false" description="选择后触发"%>
<%@ attribute name="isinitVal" type="java.lang.Boolean" required="false" description="是否初始化"%>
<%@ attribute name="initStr" type="java.lang.String" required="false" description="初始化显示日期"%>
<%@ attribute name="festival" type="java.lang.Boolean" required="false" description="是否显示农历"%>
<%@ attribute name="ishmsVal" type="java.lang.Boolean" required="false" description="是否显示时间"%>
<%@ attribute name="isToday" type="java.lang.Boolean" required="false" description="是否显示本月，本日"%>


<c:if test="${type=='1' }">
<input id="${id }" name="${name }" class="mini-combobox"  textField="text" valueField="id" emptyText="请选择..."
       allowInput="false" showNullItem="true" nullItemText="请选择..." data="[{id:'01',text:'一季度'},{id:'02',text:'二季度'},{id:'03',text:'三季度'},{id:'04',text:'四季度'}]" />
<script type="text/javascript">
$(function(){
	var initStr="${initStr!=null ? initStr : ''}";
	if(initStr!=''){
		mini.get("${id }").setValue(initStr);
	}
});
</script>

</c:if>
<c:if test="${type==null ||type=='' ||type=='0' }">
	<input name="${name }" id="${id }" class="mini-hidden" value="${initStr }" />
	<input name="treps_${name }" id="treps_${id }" value="${initStr }" ${inputStr } readonly="true"  style="width:150px" />
	
	<script type="text/javascript">
	  if (typeof treps_date_arr == "undefined") {
		var treps_date_arr = { };
		}
	
	$(function(){
		var chooseFun="${choosefun!=null ? choosefun : ''}";
		var id="${id }";
		var isinitVal=${isinitVal!=null ? isinitVal : false};
		var festival=${festival!=null ? festival : false};
		var ishmsVal=${ishmsVal!=null ? ishmsVal : false};
		var minDate="${minDate!=null ? minDate : ''}";
		var maxDate="${maxDate!=null ? maxDate : ''}";
		var format="${format!=null ? format : 'YYYYMMDD'}";
		var isToday = ${isToday!=null ? isToday : true};
		if(maxDate=='now'){
			maxDate=$.nowDate(0);
		}
		if(minDate=='now'){
			minDate=$.nowDate(0);
		}
		format=BiTool.replaceAll(format,"y","Y");
		//format=BiTool.replaceAll(format,"m","M");
		format=BiTool.replaceAll(format,"d","D");
		treps_date_arr[id]={
			    isinitVal:isinitVal,
			    festival:festival,
			    ishmsVal:ishmsVal,
			    minDate:minDate,
			    maxDate: maxDate,
			    format:format,
			    zIndex:3000,
			    isToday:isToday,
			    choosefun:function(elem,val){
			    	$("#"+id).val(val);
			    	mini.get(id).setValue(val);
			    //	console.log('id',id);
			    //	console.log('$("#"+id)',$("#"+id));
			    	if(chooseFun!=null&&chooseFun!=''){
			    		var ac = "("+chooseFun+")('"+id+"','"+val+"')";
			    		eval(ac);
			    	}
			    },clearfun:function(elem, val) {
			    	mini.get(id).setValue("");
			    }
			};
		$("#treps_"+id).jeDate(treps_date_arr[id]);
	//	$("#treps_"+id).jeDate(treps_date_arr[id]);
	/*	$("#treps_"+id).click(function(elem){
		//	alert(1);
		//	$("#treps_"+id).jeDate(treps_date_arr[id]);
			alert(aaaa);
			if(aaaa%2==0){
				return;
			}
			
			$.jeDate("#treps_"+id,treps_date_arr[id]);
		});
		*/
	});
	
	</script>
</c:if>
