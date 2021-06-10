<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<style type="text/css">
         
	 	 .formtable{
	 		 border-collapse:collapse;	 		
		  }
	 	.formtable{
	 		width:100%;
	 		/* margin-left: 5px; */
	 	}
	 	
	 	.formtable td{
	 		/* padding-left: 5px; */	 		
	 	}
</style>
	 <c:if test="${param.border!='0' }">
	 	<style type="text/css">
	 	.formtable td
		  {
		   border: 1px solid black; 		 
		   line-height:28px;
		  }
		   .sGrid .mini-grid-cell{
        	border-right:1px solid black;
        	border-bottom:1px solid black;
        }
	 	 .sGrid .mini-grid-table{
        	border-left:1px solid black;
        	border-top:1px solid black;
        }
	 	</style>
	 </c:if>
	  <style type="text/css">
	 	.searched{color:red;}
	 </style>