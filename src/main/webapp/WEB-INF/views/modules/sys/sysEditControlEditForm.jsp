<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	 <title>编辑权限配置</title>
	 <meta name="decorator" content="default"/>
	 <%@ include file="/WEB-INF/views/include/head.jsp"%>
	 <link href="${ctxStatic}/common/trepsui-ext.css" type="text/css" rel="stylesheet" />
	 <style type="text/css">
	 	*{ margin: 0; padding: 0; }
	#_control_menu{
	    width: 110px;
	    background: #fff;
	    position: absolute;
	    display: none;
	}
	#_control_menu ul{
	    width: 100%;
	    list-style: none;
	    border: 1px solid #666;
	    
	}
	#_control_menu ul li{
	    height: 25px;
	    font-size: 16px;
	    color: #333;
	    line-height: 25px;
	    text-align: left;
/* 	    border-bottom: 1px solid #666; */
	    padding:2px;
	}
	#_control_menu ul li:hover
	{
		background: #00FFFF;
	}
	 </style>
</head>
<body>
<table>
	<tr>
		<td>
			<a class="mini-button"  iconCls="icon-save" style="color:green;" accessKey="s" onclick="saveInfo()" plain="true" tooltip="保存">保存</a>
		</td>
	</tr>
</table>
<div class="mini-fit">
<div class="mini-tabs" id="tabs" showHeader="false" style="width:100%;height:100%;" ontabload="ontabload">
	<div title="" url="">
	
	</div>
</div>
</div>
<div id="_control_menu">
    <ul>
    	<c:choose>
    		<c:when test="${nodeType == 'edge'}">
    			<li onclick="formCellSelect('_act_flowEdit')"><span class="_act_flowEdit" >&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;提交必填</li>
<!--     			<li onclick="formCellSelect('_act_clearData')"><span class="_act_clearData" >&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;清除内容</li> -->
    			<li onclick="formCellSelect('cancel')"><span class="" >&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;取消设置</li>
    		</c:when>
    		<c:otherwise>
    			<li onclick="formCellSelect('_act_allowEdit')"><span class="_act_allowEdit" >&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;保存必填</li>
		        <li onclick="formCellSelect('_act_flowEdit')"><span class="_act_flowEdit" >&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;提交必填</li>
		        <li onclick="formCellSelect('_act_readOnly')"><span class="_act_readOnly" >&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;只读</li>
		        <li onclick="formCellSelect('_act_allowBlank')"><span class="_act_allowBlank" >&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;可空</li>
		        <li onclick="formCellSelect('_act_invisible')"><span class="_act_invisible" >&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;不可见</li>
		        <li onclick="formCellSelect('cancel')"><span class="" >&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;取消设置</li>
    		</c:otherwise>
    	</c:choose>
        
    </ul>
</div>


<script type="text/javascript">
	initBase(
			{}
	       );
   	loadWindow("noload");
   	
   	
   	var classNames = ['mini-button','mini-checkbox','mini-listbox','mini-checkboxlist','mini-radiobuttonlist','mini-calendar','mini-buttonedit','mini-popupedit','mini-textbox','mini-password','mini-textarea','mini-textboxlist','mini-combobox','mini-datepicker','mini-spinner','mini-timespinner','mini-treeselect','mini-lookup','mini-htmlfile','mini-fileupload'];
   	
   	var menu=document.getElementById("_control_menu");
   var curElement = null;
   var map = {};//存ID
   var editMap={};
   var columnMap = {};
   var editGridColumnMap={};
   var editControlId = '${param.editControlId}';
   var tabs = mini.get("tabs");
   var nodeType = "";
   var readOnlyCls = '_act_readOnly';
   var formCtrls = '';
   var gridCtrls = '';
   var buttonCtrls = '';
   
   
   function setData(data)
   {
	   
	   tabs.loadTab("${ctx}"+data.iUrl,tabs.getActiveTab());
	   nodeType = data.type;
   }
   
   function ontabload()
   {
	   
	   var iframe = tabs.getTabIFrameEl(tabs.getActiveTab ());//取tab对应iframe
	   window.iWin = iframe.contentWindow;
	   window.iDoc = iWin.document;
	   //mini = iWin.mini;
	   
	   //点击空白处，关闭菜单
		iDoc.onclick=function(e)
		{
			hideMenu();
		}
	    
		//绑定右键事件
	   iDoc.oncontextmenu = function(e){
			debugger;
	   		event = e||event;
	   		event.preventDefault();
	 		var element = event.srcElement;
	 		var className = element.className;
	 		var elementId = element.id;
	 		var flag = false;
	 		while(className && className.indexOf("mini-") != -1 ){
	 			if(elementId && elementId.indexOf("$") == -1)
	 			{
	 				//是否包含在指定类中，用于排除面板等控件             是否是mini随机生成的id属性
	 				if(isConfigurable(className,classNames) == -1 || isNumber(elementId.replace("mini-","")))
	 				{
	 					flag = false;
		 				break;
	 				}
	 				flag = true;
	 				break;
	 			}
	 			else
	 			{
	 				element = element.parentElement;
	 				className = element.className;
	 				elementId = element.id;
	 			}
	 		}
	 		if(flag == true)
	 		{
	 			//排除列表
	 			if(!hasClass(element, "mini-datagrid"))
	 			{
	 				var cell = iWin.mini.get(elementId);
		 			if(cell)
		 			{
		 				//显示右键菜单
		 				showMenu(event);
		 				curElement = element;
		 				if(!map[elementId])
		 				{
		 					map[elementId] = "";
		 				}
		 				
		 			}
	 			}
	 		}
	 	    event.returnValue = false;
	 	}
		var grids = iDoc.getElementsByClassName("mini-datagrid");
		
		for(var i = grids.length;i--;)
		{
			var miniGrid = iWin.mini.get(grids[i].id);
			
			if(objIsNotNull(miniGrid))
			{
				new defColumnsMenu(miniGrid);
			}
		}
		loadLimit();//加载权限
   }
 //选择权限
	function formCellSelect(cls)
	{
	 	var alertMessage = "";
		var element = curElement;
		
	//	$(element).attr("title","");
		addLimitInfo(element,cls);
		hideMenu();
  	}
 	function addLimitInfo(element,cls)//alertMessage
 	{
 		debugger;
 		var key = element.id;
		if(cls == "cancel")
		{
			if(editMap[key]){
				delete editMap[key];
			}
			if(map[key])
			{
				var limit = map[key].styleName;
				if(delete map[key])
				{
					
					removeClassAndChild(element,limit);
					hideMenu();
					return;
				}
				else
				{
					return;
				}
			}
		}
		if(map[key])
		{
			removeClassAndChild(element,map[key].styleName);
		}
		
		var obj = {};
		obj.fieldName = key;
		obj.styleName = cls;//EDIT_LIMIT
		obj.type = "1";
		//obj.message = alertMessage;
		//obj.formId = this.grid.getId();
		
		debugger;
		
		var forms = $(element).closest(".form");
		if(forms&&forms.length>0){
			obj.formId = forms[0].id;
		}
		if(hasClass(element,'mini-button')){//按钮
			var text =  $(element).text();
			text = text.replace(/[\r\n\s]/g,"");
			if(text==''){
				text = element.title;	
			}
			text = text.replace(/[\r\n\s]/g,"");
			obj.fieldDesc=text;
			obj.formId ="";
		}else{
			var currTd = $(element).closest("td");
			if(currTd){
				var text = currTd.text();
				text = text.replace(/[\r\n\s]/g,"");
				if(text==''){
					var preTd = currTd.prev();
					if(preTd){
						text = preTd.text();
						text = text.replace(/[\r\n\s]/g,"");
					}
				}
				obj.fieldDesc=text;
			}
		}
		
		
		map[key] = obj;
		editMap[key]=obj;
		
		addClassAndChild(element,cls);
 	}
   //自定义列表右键
   function defColumnsMenu(grid)
   {
		grid.set({showColumnsMenu:false});
		this.grid = grid;
		this.menu = this.createMenu();
		//this.menu.on("beforeopen",this.beforeopen,this);
		this.menu.currColumn = null;
		grid.setHeaderContextMenu(this.menu);
   }
   defColumnsMenu.prototype = {
	   createMenu : function()
	   {
		   var myMenu = mini.create({ type: "menu", hideOnClick: true });
		   var menuItems = [];
		   if(nodeType == "edge")
		   {
				menuItems[0] = {id:"_act_flowEdit",text:"提交必填",cls:"_act_flowEdit"};
				//menuItems[1] = {id:"_act_clearData",text:"清除内容",cls:"_act_clearData"};
				menuItems[1] = {id:"cancel",text:"取消设置",cls:""};
		   }
		   else
		   {
				menuItems[0] = {id:"_act_allowEdit",text:"保存必填",cls:"_act_allowEdit"};
				menuItems[1] = {id:"_act_flowEdit",text:"提交必填",cls:"_act_flowEdit"};
				menuItems[2] = {id:"_act_readOnly",text:"只读",cls:"_act_readOnly"};
				menuItems[3] = {id:"_act_allowBlank",text:"可空",cls:"_act_allowBlank"};
				menuItems[4] = {id:"_act_invisible",text:"不可见",cls:"_act_invisible"};
				menuItems[5] = {id:"cancel",text:"取消设置",cls:""};
			}
			myMenu.setItems(menuItems);
			myMenu.on("itemclick", this.menuItemClick, this);
			myMenu.on("beforeopen",this.beforeopen,this);
			return myMenu;
	   },
	   menuItemClick : function(e)
	   {
		   debugger;
			var item = e.item
			var currColumn = this.menu.currColumn;
			var td = this.grid.getHeaderCellEl(currColumn);
			var gridId = this.grid.getId();
			if(!currColumn.name)
				return ;
			var key = gridId + "." + currColumn.name;
			//处理显示样式 开始
			var element = td;
			if(columnMap[key])
			{
				var info = columnMap[key];
				removeClassAndChild(element,info.styleName);
				/* removeClass(element,info.styleName);
				var children = element.getElementsByTagName("*");
				for(var i = children.length;i--;)
				{
					removeClass(children[i],info.styleName);
				} */
			}else{
				removeClassAndChild(element,readOnlyCls);
			}
			var cls = item.id;
			
			if(cls == "cancel")
			{
				if(columnMap[key])
				{
					delete columnMap[key];
					return;
				}
			}
			
			addClassAndChild(element,cls);
			//处理显示样式 结束
			
			var obj = {};
			obj.fieldName = currColumn.name;
			var header = currColumn.header;
			header = header.replace(/[\r\n\s]/g,"");
			obj.fieldDesc = header;
			obj.styleName = cls;//EDIT_LIMIT
			obj.type = "2";
			obj.formId = this.grid.getId();
			columnMap[key] = obj;
			
			return true;
	   },
	   beforeopen : function(e){
	        this.menu.currColumn = this.grid.getColumnByEvent(e.htmlEvent);
	   }
   }

 
 //显示右键菜单
   function showMenu(event)
   {
	   var scrollTop = document.documentElement.scrollTop||document.body.scrollTop;
		menu.style.display = "block";
		
		var clienWidth = document.documentElement.clientHeight ||document.body.clientHeight;
		var eX = event.clientX;
		var menuWidth = menu.offsetWidth;
		var left  = eX + 1;
		if(eX + menuWidth >= clienWidth)
		{
			left = eX - menuWidth - 1;
		}
		menu.style.left = left + "px";
		
		var clienHeight = document.documentElement.clientHeight ||document.body.clientHeight;
		
		var eY = event.clientY;
		var top = eY + scrollTop;
		var menuHeight = menu.offsetHeight;
		if(eY + menuHeight > clienHeight)
		{
			top = eY + scrollTop - menuHeight;
		}
		menu.style.top = top + "px";
   }
	//关闭菜单
	function hideMenu(){
		if(menu.style.display == "block")
		{
			menu.style.display = "none";
		}
	}
	
   
	//
	function addClassAndChild(element,cls)
	{
		$(element).addClass(cls);
		$(element).find("*").addClass(cls);
		
		/* addClass(element,cls);
		var children = element.getElementsByTagName("*");
		for(var i = children.length;i--;)
		{
			addClass(children[i],cls);
		} */
	}
	
	function setReadOnly(){
		
		var j = window.iWin.jQuery
		var iMini = iWin.mini;
 		var forms = j(".form");
 		var gridforms = j(".mini-datagrid");
 		var buttons = j(".mini-button");
 		var tempButtonsArr = {};
 		
 		
 		
 		
 		var formsArr = new Array();
 		for(var i=0;i<forms.length;i++){
 			var formId = forms[i].id;
 			if(!formId){
 				continue;
 			}
 			if("editformWFMyTask"==formId ){
 				continue;
 			}
 			if("_docAttachForm"==formId ){
 				continue;
 			}
 			if(formId.startsWith("noControlForm")){
 				continue;
 			}
 			
 			if(formCtrls==''){
 				formCtrls = formId;
 			}else{
 				formCtrls += ","+formId;
 			}
 			formsArr.push(formId);
 		}
 		loadReadOnlyInfo(formsArr);
 		debugger;
 		for(var i=0;i<gridforms.length;i++){
 			
 			var gridId = gridforms[i].id;
 			tempButtonsArr['_tb'+gridId+'_add'] = '_tb'+gridId+'_add';
 			tempButtonsArr['_tb'+gridId+'_clone'] = '_tb'+gridId+'_clone';
 			tempButtonsArr['_tb'+gridId+'_remove'] = '_tb'+gridId+'_remove';
 			tempButtonsArr['_tb'+gridId+'_refresh'] = '_tb'+gridId+'_refresh';
 			tempButtonsArr['_tb'+gridId+'_op'] = '_tb'+gridId+'_op';
 			tempButtonsArr['_tb'+gridId+'_export'] = '_tb'+gridId+'_export';
 			
 			
 			var grid = iMini.get(gridId);
 			if(!grid){
 				continue;
 			}
 			if(gridCtrls==''){
 				gridCtrls = gridId;
 			}else{
 				gridCtrls += ","+gridId;
 			}
 			var columns = grid.getColumns();
			if(columns){
				for(var j=0;j<columns.length;j++){
					var column = columns[j];
		 			var ele =grid.getHeaderCellEl(column);
					if(objIsNotNull(ele)){
						addClassAndChild(ele,"_act_readOnly");
					}
				}
			}
 		}
 		
 		
 		
 		for(var i=0;i<buttons.length;i++){
 			var buttonId = buttons[i].id;
 			if(isNumber(buttonId.replace("mini-",""))){//miniui 生成的按钮
					//如果是数字
					continue;
			}
 			if(!tempButtonsArr[buttonId]){
 				if(buttonCtrls==''){
 	 				buttonCtrls = buttonId;
 	 			}else{
 	 				buttonCtrls += ","+buttonId;
 	 			}
 			}
 			$(buttons[i]).addClass("_act_readOnly");
 			console.log("button:",buttons[i].id);
 		}
	}
	
 	//为指定的dom元素添加样式
 	/* function addClass(ele, cls) {
 	    if (!hasClass(ele, cls)) ele.className += " " + cls;
 	} */
 	//删除元件及后代的样式
 	function removeClassAndChild(ele,cls)
 	{
 		$(ele).removeClass(cls);
 		$(ele).find("*").removeClass(cls);
 		/* removeClass(ele,cls);
		var children = ele.getElementsByTagName("*");
		for(var i = children.length;i--;)
		{
			removeClass(ele,cls);
		} */
 	}
 	//删除指定dom元素的样式
 	/* function removeClass(ele, cls) {
 	    if (hasClass(ele, cls)) {	
 	        var reg = new RegExp("(\\s|^)" + cls + "(\\s|$)");//正则表达式，需要补血
 	        ele.className = ele.className.replace(reg, " ");
 	    }
 	} */
 	function hasClass(ele, cls) {
 		return $(ele).hasClass(cls);
 	    //return ele.className.match(new RegExp("(\\s|^)" + cls + "(\\s|$)"));
 	}
 	//保存
 	function saveInfo()
 	{
 		debugger;
 		var formArr = new Array();
 		
 		var gridColArr = new Array();
 		
 		for(var key in editMap){
 			formArr.push(editMap[key]);
 		}
 		for(var key in columnMap){
 			gridColArr.push(columnMap[key]);
 		}
 		
 		//var cellData = mini.clone(editMap);
 		//var columnData = mini.clone(columnMap);
 		var cellData = mini.encode(formArr);
 		var columnData = mini.encode(gridColArr);
 		showMessageBox(null,"正在保存，请稍后......","loading");
 		$.ajax({
			url : "${ctx}/ims-ext/sys/sysEditControl/saveEditList",
			type : "post",
			data:{
				'formData':cellData,
				'gridData':columnData,
				'formCtrls':formCtrls,
				'gridCtrls':gridCtrls,
				'buttonCtrls':buttonCtrls,
				'id':editControlId
			},
			success : function(text) {
				hideMessageBox();
				var data = mini.decode(text);
				if(data.type == "I")
				{
					showTipM("info","提示",data.message);
					tabs.reloadTab(tabs.getActiveTab());
					//ontabload();
				}
				else if(data.type=="E"){
                    showMessageBox("错误",data.message,"error");
                    return;
				}
			},
			error:function(jqXHR, textStatus, errorThrown){
				hideMessageBox();
				mini.showMessageBox({
					title: "保存失败",    
					message: "保存失败",
					buttons: ["确定", "详细"],    
					iconCls: "mini-messagebox-question",
					html: "",
					width:250,
					callback: function(action){
						if(action=='详细')  alert(jqXHR.responseText);
					}
        	   });
			}
		});
 	}
 	//加载权限数据
 	function loadLimit(){
 		setReadOnly();
//  		showMessageBox(null,"正在加载权限信息，请稍后......","loading");
 		$.ajax({
			url : "${ctx}/ims-ext/sys/sysEditControlLine/allData",
			type : "post",
			data:{editControlId:editControlId},
			success : function(text) {
				debugger;
				//hideMessageBox();
				var list = mini.decode(text);
				if(objIsNotNull(list) && list.length > 0)
				{
					var iMini = iWin.mini;
					for(var i = list.length;i--;)
					{
						var data = list[i];
						if(data.type == "1")
						{
							if(!data.fieldName)
							{
								continue;
							}
							var ele = iDoc.getElementById(data.fieldName);
							if(objIsNotNull(ele))
							{
								
								delete data["id"];
								var readOnlyData = map[data.fieldName];
								if(readOnlyData){
									removeClassAndChild(ele,readOnlyData.styleName);
								}
								map[data.fieldName] = data;
								editMap[data.fieldName] = data;
								addClassAndChild(ele,data.styleName);
								if("_act_flowEdit" == data.styleName && objIsNotNull(data.message))
								{
									$(ele).attr("title",data.message);
								}
							}
						}
						else if(data.type == "2")
						{
							var grid = iMini.get(data.formId);
							if(objIsNotNull(grid))
							{
								if(!data.fieldName)
								{
									continue;
								}
								
								try{
									var ele =grid.getHeaderCellEl(data.fieldName);
									if(objIsNotNull(ele))
									{
										removeClassAndChild(ele,readOnlyCls);
										addClassAndChild(ele,data.styleName);
										delete data["id"];
										columnMap[data.formId+"."+data.fieldName] = data;
									}
								}
								catch(e)
								{
									continue;
								}
							}
							
						}
					}
				}
			},
			error:function(jqXHR, textStatus, errorThrown){
				var callback=function (action) {
	                if(action=='详细')  viewErrorDetail(jqXHR.responseText);
	            }
	            var buttonsTemp=["ok","详细"];
	            showMessageBox("错误","加载失败","error",null,callback,buttonsTemp);
				/* hideMessageBox();
				mini.showMessageBox({
					title: "保存失败",    
					message: "保存户失败",
					buttons: ["确定", "详细"],    
					iconCls: "mini-messagebox-question",
					html: "",
					width:250,
					callback: function(action){
						if(action=='详细')  alert(jqXHR.responseText);
					}
        	   }); */
			}
		});
 	}
 	
 	//加载只读信息
 	function loadReadOnlyInfo(forms)
 	{
 		debugger;
 		//添加了工作票的附票内容控制
 		//var forms = ["editform","_tbForm","formWoWtProduceMain","_tbgridWoDangerTask"];
 		var j = window.iWin.jQuery;
 		for(var i = 0;i < forms.length;i++)
 		{
 			var form = j("#"+forms[i]);
 			if(form)
 			{
 				setReadOnlyByForm(form);
 			}
 		}
 			
 		/* var form = iWin.$("#editform");
 		setReadOnlyByForm(form);
 		//明细按钮
 		form = iWin.$("#_tbForm");
 		setReadOnlyByForm(form);
 		//危险点和预控措施
 		form = iWin.$("#formWoWtProduceMain");
 		setReadOnlyByForm(form); */
 	}
 	function setReadOnlyByForm(form)
 	{
 		for(var i = 0;i < classNames.length;i++)
 		{
 			var cells = form.find("."+classNames[i]);
 			for(var j = cells.length;j--;)
 			{
 				var id = iWin.$(cells[j]).attr("id");
 				//var name = iWin.$(cells[i]).attr("name");
 				if(objIsNotNull(id) && id != "_tbForm_startFlow")
 				{
 				
 					if(isNumber(id.replace("mini-","")))
 					{
 						//如果是数字
 						continue;
 					}
 					
 					var obj = {};
 					var cls = "_act_readOnly";
 	 				obj.fieldName = id;
 	 				obj.styleName = cls;//EDIT_LIMIT
 	 				obj.type = "1";
 	 				addClassAndChild(cells[j],cls);
 	 				map[id] = obj;
 				}
 			}
 		}
 	}
 	//是否是数字
 	function isNumber(arg)
 	{
 		var reg = /^[0-9]*$/;
 		if(reg.test(arg))
 		{
 			return true;
 		}
 		return false;
 	}
 	function isConfigurable(className,array)
 	{
 		for(var i = 0;i < array.length;i++)
 		{
 			if(className.indexOf(array[i]) != -1)
 			{
 				return className.indexOf(array[i]);
 			}
 		}
 		return -1;
 	}
 	
 	
 	function loadIframe(){
 		var url = '${ctxRoot}${param.formUrl}';
 		if(url.indexOf('?')==-1){
 			url+='?'
 		}else{
 			url+='&';
 		}
 		url+="showList=0&action=view";
 		tabs.loadTab(url,tabs.getActiveTab());
 	}
 	loadIframe();
 	
 	
 	//loadReadOnlyInfo();
</script>
</body>
</html>