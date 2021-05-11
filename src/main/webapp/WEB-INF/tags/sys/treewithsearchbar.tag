<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="idSuffix" type="java.lang.String" required="false" description="id后缀"%>
<%@ attribute name="dataUrl" type="java.lang.String" required="true" description="数据URL"%>
<%@ attribute name="idField" type="java.lang.String" required="true" description="树节点id字段"%>
<%@ attribute name="valueField" type="java.lang.String" required="true" description="树节点值字段"%>
<%@ attribute name="textField" type="java.lang.String" required="true" description="树节点文本字段"%>
<%@ attribute name="textFieldLabel" type="java.lang.String" required="true" description="树节点文本字段标签"%>
<%@ attribute name="parentField" type="java.lang.String" required="true" description="树节点parent字段"%>
<%@ attribute name="autoLoad" type="java.lang.String" required="false" description="是否自动加载"%>
<%@ attribute name="expandOnLoad" type="java.lang.String" required="false" description="自动扩展层级"%>
<%@ attribute name="initParentId" type="java.lang.String" required="false" description="初始化时父节点id"%>
<%@ attribute name="dynamicLoad" type="java.lang.String" required="false" description="是否动态加载"%>

<input class="mini-hidden" name="initParentId${idSuffix}" id="initParentId${idSuffix}" value="${ initParentId}"/>
<input class="mini-hidden" name="dynamicLoad${idSuffix}" id="dynamicLoad${idSuffix}" value="${ dynamicLoad}"/>

<div id="_tbTreeMain${idSuffix}" class="mini-toolbar" style="padding:2px;border-top:0;border-left:0;border-right:0;">
	<span style="padding-left:5px;">${textFieldLabel}:</span>
	<input class="mini-textbox" id="_keyTree${idSuffix}" style="width:100px;" onenter="searchTree('${dataUrl}','${textField}')"/>
	<a class="mini-button" iconCls="" onclick="searchTree('${dataUrl}','${textField}','${idSuffix}')" plain="true"><i class="fa fa-search"></i> 查找</a>
</div>


<ul id="treeMain${idSuffix}" style="height:95%;width:100%;" class="mini-tree"   url="${dataUrl}"  idField="${idField}"  valueField="${valueField}" textField="${textField}" parentField="${parentField}"
	showTreeIcon="true" autoLoad="${autoLoad}"  resultAsTree="false" expandOnLoad="${expandOnLoad}" onbeforeLoad="onBeforeTreeLoad">
</ul>

<script type="text/javascript">
	function onBeforeTreeLoad(e){
		var tree = e.sender;    //树控件
	    var node = e.node;      //当前节点
	    var params = e.params;  //参数对象
	    var dynamicLoad = mini.get("dynamicLoad${idSuffix}");
	    var dynamicLoadValue=0;
	    if(dynamicLoad){
	    	dynamicLoadValue = dynamicLoad.getValue();
	    }
	    params.dynamicLoad=dynamicLoadValue;
	    if(dynamicLoadValue=='1'){
	    	if(node.id){
	 	 	   params.parentId=node.id;
	 	    }else{
	 	       var initParentId = mini.get("initParentId${idSuffix}").getValue();
	 	       if(initParentId!=""){
	 	    	   params.parentId=initParentId;
	 	       }
	 	    }
	    }
	}
</script>