<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="输入框名称"%>
<%@ attribute name="value" type="java.lang.String" required="false" description="输入框值"%>
<i id="${id}Icon" class="icon-${not empty value?value:' hide'}"></i>&nbsp;<label id="${id}IconLabel">${not empty value?value:'无'}</label>&nbsp;
<input id="${id}" name="${name}" class="mini-hidden" type="hidden" value="${value}"/>
<a id="${id}Button" href="javascript:" class="btn">选择</a>&nbsp;&nbsp;
<script type="text/javascript">
    mini.parse();
	$("#${id}Button").click(function(){
		mini.open({
         //   url: "${ctxRoot}/form?view=sys/iconselect?value="+$("#${id}").val(),
            url: "${ctxRoot}/form?view=sys/tagIconselect&value="+$("#${id}").val(),
            title:"选择图标",
            width:700,
            height: 600,
            showMaxButton: true,
            showModal: true,
            showCloseButton: true,
            buttons:["ok", "close"],
        ondestroy: function(action) {  //弹出页面关闭前
            if (action == "ok") {
                var iframe = this.getIFrameEl();//如果点击“确定”
                var icon = iframe.contentWindow.$("#icon").val();
                $("#${id}Icon").attr("class",  icon);
                $("#${id}IconLabel").text(icon);
                //$("#${id}").val(icon);
                var iconCtrl=mini.get("${id}");
                iconCtrl.setValue(icon);
            }else if (action=="close"){
                $("#${id}Icon").attr("class", "icon- hide");
                $("#${id}IconLabel").text("无");
                //$("#${id}").val("");
                var iconCtrl=mini.get("${id}");
                iconCtrl.setValue("");
            }
        },
             onload:function(h){
                $(".jbox-content", top.document).css("overflow-y","hidden");
            }
        });
	});
    function iconPreview() {
        var iconCtrl=mini.get("${id}");
        var iconValue=iconCtrl.getValue();
        if (objIsNotNull(iconValue)){
            //var icon = h.find("iframe")[0].contentWindow.$("#icon").val();
            $("#${id}Icon").attr("class", iconValue);
            $("#${id}IconLabel").text(iconValue);

        }else {
            $("#${id}Icon").attr("class", "icon- hide");
            $("#${id}IconLabel").text("无");

        }
    }
</script>