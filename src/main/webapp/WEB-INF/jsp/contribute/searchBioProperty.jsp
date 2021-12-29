<!DOCTYPE HTML>
<html lang="en">

<%@ include file = "./../header.jsp" %>

<body>

<div class="container">
	<div id="topbar"> <%@ include file = "./../top_bar.jsp" %></div>
	<div id="menubar"> <%@ include file = "./../menu_bar.jsp" %></div>
	
			
	<h3 class="text-info">Search Bio Property</h3>
	<h5 class="text-danger">${bioMaterialSearchForm.message}</h5>
	<p>&nbsp;</p>
<h4 class="text-info" id="response"></h4>


	<form:form  action="showBioProperty"  method="post"  modelAttribute="showBioDiscreetDataForm" >
	    <div class="form-group  row">
	    	<div class= "col-sm-10">
		      <form:input class="form-control"  path="dataSetName"   placeholder="Enter dataset names Or Y-variable name "/>
		      <form:errors  class="text-danger"  path="dataSetName" />
		    </div>
		    <div class ="col-sm-2">
		      <button type="submit" class="btn btn-info">Search</button>
		    </div>
		 </div> 		
	 </form:form>	
	
	
<c:choose>
  <c:when test="${!empty bioDiscreetData}">
  <hr/>
	<h4 class="text-info">DataSet's containing text : ${showBioDiscreetDataForm.dataSetName} </h4>
	<table class="table table-hover table-striped">
	    <thead>
	      <tr>
	        <th>DataSet Name</th>
	        <th>&nbsp;</th>
	        <th>&nbsp;</th>
	        <th>&nbsp;</th>
	        <th>&nbsp;</th>
	      </tr>
	    </thead>
	    <tbody>
			<c:forEach var="bioDiscreetData" items="${bioDiscreetData}">
				<tr class="listing" id = "deleteGrp${bioDiscreetData.id}">
   					<td>${bioDiscreetData.yBioVariable.name}</td>
   					 <td>&nbsp;</td>
	                 <td>&nbsp;</td>
	                 <td>&nbsp;</td>
	                 <td>&nbsp;</td>
   					<td>
			     		
			     		<button type="button" class="btn btn-default clickedOpenPopup" id="clickedOpenPopup">
		      				<span class="glyphicon glyphicon-search"></span> Details
		    			</button>&nbsp;&nbsp;&nbsp;<input type="hidden" value="${bioDiscreetData.id}" name="groupId" id="groupId"/>
		    			<%-- <a href="javascript:void(0);" onclick="getReport(&quot;${bioGroup.id}&quot;); return false;" role="button" class="btn btn-default "> --%>
			     		<a href="addDiscreetData?groupId=${bioDiscreetData.id}" role="button" class="btn btn-default ">
			    	  		<span class="glyphicon glyphicon-edit"></span> Edit
			     		</a>&nbsp;&nbsp;&nbsp;
			     		<a href="deleteGroupUsingGroupId?groupId=${bioDiscreetData.id}&groupName=${showBioDiscreetDataForm.dataSetName}" role="button" class="btn btn-info">
			    	  		Delete
			     		</a>
		     		</td>
   					
  				</tr>	
			</c:forEach>
		</tbody>
	</table>
	<div id="load_more">Load More Group</div>
	</c:when>	
	</c:choose>
	  	<!-- DETAILS POPUP START -->
	
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg" role="document" >
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Bio-Material Group Details</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <table class="table table-striped" id="dynamicMaterialName">
				</Table>
				<div >
				<p id="errorMsg"></p>
				<table class="table table-striped">
				<thead>
				<tr class="abc">
				<th><button id="btn1" type="button" class="buttonInactive">
                &#65291;&nbsp;&nbsp;&nbsp;&nbsp;</button>Materials</th>
				</tr>
				</thead>
				<tbody id="materialName">
				
				</tbody>
				</table>
				</div>
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
	    </div>
	<!-- DETAILS POPUP END -->
	
	
	
	
	
	
	
	
	
	<div id="footerbar"> <p>&nbsp;</p> <%@ include file = "./../footer_bar.jsp" %></div>	
</div>  
</body> 
