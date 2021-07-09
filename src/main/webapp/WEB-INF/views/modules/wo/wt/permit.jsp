<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%-- <script type="text/javascript" src="${ctxStatic}/common/editControl.js"></script>
<script type="text/javascript" src="${ctxStatic}/common/actNodeEdit.js?v=<%=System.currentTimeMillis() %>"></script> --%>
<script type="text/javascript">
	window.onload = function()
	{			
		//工作负责人变更时，判断负责人不能和签发人为同一人
		var newWorkLeaderCell = mini.get("woWtLC.nowWorkLeader");
		if(newWorkLeaderCell)
		{
            //mini.get("woWtLC.nowWorkLeader").un("valuechanged")
			mini.get("woWtLC.nowWorkLeader").on("valuechanged",function(e){
				var newWorkLeader = mini.get("woWtLC.nowWorkLeader").getValue();
				if(newWorkLeader)
				{
					var signerCell = mini.get("wtSigner");
					if(signerCell)
					{
						var signerValue = signerCell.getValue();
						if(newWorkLeader == signerValue)
						{
							showMessageBox("提醒","负责人不能和签发人是同一人！","warring");
							mini.get("woWtLC.nowWorkLeader").setValue("");
							mini.get("woWtLC.nowWorkLeader").setText("");
						}
					}
				}
			});
		}
		
		 /*  var wtType = ${param.wtType};//工作票类型
	      $.ajax({//获取新建权限
	             url: "${ctx}/wo-wt/wo/woWt/permit",
	             data:{wtType:wtType},
	             type:"post",
	             success: function (text) {  	             	
	            	 var data = mini.decode(text);
	            	 var addCan = data.addCan;
	            	 if(addCan=="1"){
	            		// setGridReadOnly("datagridMain","0",{			       
	       		       // addCan:"1"
	       			   // });	 
	            		mini.get("_tbGrid_add").setEnabled(true);
	            	 }else{           		
	            		mini.get("_tbGrid_add").setEnabled(false);
	            	 }
	             }
	         }); */
	}
	
	
   function controlEdit (isEdit,isEnabled){
	 	if(isEdit==''){
	 		return;
	 	}
		var isEditArr = isEdit.split(",");
		for(var i=0;i<isEditArr.length;i++){ 
			 var field=mini.get(isEditArr[i]);
			 if(field){
				 field.setEnabled(isEnabled);
			 }
		}
		 
	 }
	   
	function beforeInsert(){		
		var form = new mini.Form("#editform");
		form.reset();
	}
		  			 	  	
	 //更新作业安措排序
    function onBeforeSaveForm() {
	  //更新危险点与预防控制措施排序字段值
	  updDangerTaskSeqNo();			
	  return true;
    }
	function cancelRow() {
	  var form = new mini.Form("#editform2");
	  form.reset();
	  var editWindow = mini.get("editWindow");
      editWindow.hide();
	}
	
	//打印预览页面
	function wowtPrint(){		
		var wtType = mini.get("wtType").value;
	    var id = mini.get("id").value;
	    var iamCode = iamCodeValue();
	    if(id!=null&&id!=""){	    		
	    	//打印预览页面
	    	 window.open("${ctxRoot}/form2?view=wo/woWtFormSq"+wtType+"&id="+id+"&wtType="+wtType+"&iamCode="+iamCode); 
	     }
	}	
	
	//新增2020-03-16
	//结束时间验证（结束时间和开始时间差值小于3小时提示）
   function checkEndTime(startTime,endTime){		
	 //开始时间
	 var start = mini.get(startTime).getValue();
	 //结束时间
	 var end = mini.get(endTime).getValue();
	 if(start==null||start==""){
		 mini.get(endTime).setValue("");
		 mini.alert("请先填写开始时间！");
		 return;
	 }
	 //两个时间相差的毫秒数
	 var num = end - start ;
	 //计算剩余的小时数
	 var hours=Math.floor(num/(60*60*1000));	
	 if(hours<3){
		mini.alert("注意：工作时间小于3小时！"); 
	 }
   }
	
  
   
   //选择用户（分页多选）
   function popLovJson1(e) {           
       var param = {
           obj: null,
           title: "人员选择",
           multiSel: true,
           readOnly: true,
           url: "${ctxRoot}/form?view=/sys/misUserList",
           width: 800,
           height: 600,
           selFields: "id,name",
           refFields: "",
           refGridId: null,
           actionLovValid: null,
           actionLov: returnSelectData3,
           actionClose: null,
           gridId: "datagridSelected",
           allowDblclickSelect: true
       };
       popLov2(param);
   }
   
   
   function returnSelectData3(data) {
    if(!data||!data.length){
     return;
    }
       if (data.length == 0) {
          return;
       }
       var ids="";
       var names = "";
       
       for(var i=0;i<data.length;i++){
        if(i==0){
         ids=data[i].id;
         names=data[i].name;
        }else{
         ids+=","+data[i].id;
         names+=","+data[i].name;
        }
       }
       
       mini.get("workClassPersonIds").setValue(ids);   //人员id
       mini.get("workClassPersonIds").setText(names);   //人员
   }
   
   //页面编辑权限控制
    function onBeforeSaveCheck(o){
        editControl.beforeSave(o);
        return true;
    }
    
    function addNewReword(o){
    	editControl.afterLoad(o);//页面编辑权限控制
    }
	
    function onAfterLoadRecord(o) {	   
        wfAfterLoad(o);
        editControl.afterLoad(o);//页面编辑权限控制	     
    }
    
    //editControl.loadEditList('woWt');
</script>
