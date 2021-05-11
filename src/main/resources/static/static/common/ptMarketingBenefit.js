/**
 * 
 */
function orgvaluechanged(e){
	 //获取组织机构
	 var orgId = mini.get("orgId").getValue();
	 var groupCbl= mini.get("groupCbl");
	 $.ajax({
		 url: orgChangedUrl+"?orgId="+orgId,
	     type: "post",
	     async: false,
	     success: function (data) {
	         data=mini.decode (data);
	         orgTypeM.setValue(data.data.orgType);
	         if(data.data.orgType=='2'){
	        	 groupCbl.loadData(data.data.plantList);
	        	 $("#unittd").text("电厂:");	            	
	         }else if(data.data.orgType=='3'){
	        	 for(var i=0;i<data.data.unitGroupList.length;i++){
	        		 data.data.unitGroupList[i].shortName=data.data.unitGroupList[i].name;
	        	 }
	        	 groupCbl.loadData(data.data.unitGroupList);
	        	 $("#unittd").text("机组单元:");
	         }
	     }
	 });
	 //groupCbl.enable();
	 var groupCount=groupCbl.getCount();
	 if(groupCount>0){
		 $("#unittd").css("display", "block");
	     groupCbl.selectAll();    
	 }else{
		 $("#unittd").css("display", "none");
	 }        
} 

function dataChanged(){
	 //日期维度调整
	 var date = mini.get("xdate").value;  
	 var startDate = mini.get("startDate");  
	 var endDate = mini.get("endDate");			 
	 if(date==0){
		 //月度
		 startDate.setFormat("yyyyMM");
		 endDate.setFormat("yyyyMM");			
	 }else if(date==1){
		 //年度
		 startDate.setFormat("yyyy");
		 endDate.setFormat("yyyy");
	 }
}

function addDateQuery() {
	var date = mini.get("xdate").value;  
	var startDateVal = mini.get("startDate").value;  
	var endDateVal = mini.get("endDate").value;	
	var dateData = new Object();
	if(date==0){
		 //月度
		 var startDate=mini.formatDate (startDateVal, "yyyyMM" );
	     var endDate=mini.formatDate (endDateVal, "yyyyMM" );
	     dateData.startDate=startDate;
	     dateData.endDate=endDate;			 
	 }else if(date==1){
		 //年度
		 var startDate=mini.formatDate (startDateVal, "yyyy" );
	     var endDate=mini.formatDate (endDateVal, "yyyy" );
	     if(startDate!=""){
	    	 startDate=startDate+"01";
	     }
	     if(endDate!=""){
	    	 endDate=endDate+"12";
	     }		     
	     dateData.startDate=startDate;
	     dateData.endDate=endDate;
	 }
	return dateData;
}
function orgvaluechangedNoUnitGroup(e){
	 //获取组织机构
	 var orgId = mini.get("orgId").getValue();
	 var groupCbl= mini.get("groupCbl");
	 $.ajax({
		 url: orgChangedUrl+"?orgId="+orgId,
	     type: "post",
	     async: false,
	     success: function (data) {
	         data=mini.decode (data);
	         orgTypeM.setValue(data.data.orgType);
	         if(data.data.orgType=='2'){
	        	 groupCbl.loadData(data.data.plantList);
	        	 $("#unittd").text("电厂:");	            	
	         }else if(data.data.orgType=='3'){		        	 
	        	 groupCbl.loadData([]);
	        	 $("#unittd").text("机组单元:");
	         }
	     }
	 });
	 //groupCbl.enable();
	 var groupCount=groupCbl.getCount();
	 if(groupCount>0){
		 $("#unittd").css("display", "block");
	     groupCbl.selectAll();    
	 }else{
		 $("#unittd").css("display", "none");
	 }        
}
