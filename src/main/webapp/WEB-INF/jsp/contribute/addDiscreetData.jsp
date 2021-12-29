<!DOCTYPE HTML>
<html lang="en">

<%@ include file = "./../header.jsp" %>

 <script src="js/bioDiscreetData.dynamic.select.list.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
 <script src="js/biomaterial.dynamic.measurement.input.js"></script>
<body>


<div class="container">
	<div id="topbar"> <%@ include file = "./../top_bar.jsp" %></div>
	<div id="menubar"> <%@ include file = "./../menu_bar.jsp" %></div>
	
			
			<h2 class="text-info">Add Discreet Dataset</h2>
			<h5 class="text-success">${successMessage}</h5>
			
			<p>&nbsp;</p>
			
			<form:form  action="/addDiscreetData"  method="post" enctype="multipart/form-data" modelAttribute="bioDiscreetDataForm" >
			<form:hidden  value= "${bioDiscreetDataForm.id}" path="id"/>
			<c:choose>
				<c:when test="${empty successMessage}">
				<div class="form-group row">
					<div class="col-sm-2">
						<form:label  class="text-info" path="materialId" >Select Material: </form:label>
					</div>
					<div class="col-sm-2">
						<input type="checkbox" id="discreteMaterial" onchange="showDiscreteMaterialSearchBar()" checked><span>Material</span><br><br> 
						<input type="checkbox" id="discreteGroup" onchange="showDiscreteGroupSearchBar()"><span>Group</span>
					</div>
					<div class="col-sm-8">
						<div class="materialSearchBar">
							<form:input class="form-control" id="materialId" path="materialId" value ="${bioDiscreetDataForm.materialId}"   placeholder="Please enter bio-material name"/>
							<form:errors  class="text-danger"  path="materialId" />
						</div>
						<br>
						<div class="groupSearchBar" style="display: none">
							<form:input class="form-control" id="discreteGroupId" path="groupId" value ="${bioDiscreetDataForm.groupId}"   placeholder="Please enter bio-group name"/>
							<form:errors  class="text-danger"  path="groupId" />
						</div>
					</div>
				</div>	
				<div class="form-group row">
					<div class="col-sm-2">
						<form:label  class="text-info" path="authorName">Author Name: </form:label>
					</div>
					<div class="col-sm-10">
						<form:input class="form-control" id="authorName" path="authorName" value="${bioDiscreetDataForm.authorName}"  placeholder="Author Name"/>
						<form:errors  class="text-danger"  path="authorName" />
					</div>
				</div>	
				
				<div class="form-group row">
					<div class="col-sm-2">
						<form:label  class="text-info" path="year" >Publish Year: </form:label>
					</div>
					<div class="col-sm-10">
						<form:input class="form-control" id="year" path="year" value="${bioDiscreetDataForm.year}"  placeholder="Publish Year"/>
						<form:errors  class="text-danger"  path="year" />
					</div>
				</div>	
				<div class="form-group row">
					<div class="col-sm-2">
						<form:label  class="text-info" path="authorName">Name of the Dataset: </form:label>
					</div>
					<div class="col-sm-10">
						<form:input class="form-control" id="authorName" path="authorName" value="${bioDiscreetDataForm.authorName}"  placeholder="Enter the name of Dataset"/>
						<form:errors  class="text-danger"  path="authorName" />
					</div>
				</div>	
				<div class="form-group row">
					<div class="col-sm-2">
						<form:label  class="text-info" path="yVariableId" >Upload Dataset: </form:label>
					</div>
					<div class="col-sm-10">
						<form:select class="form-control" id="yVariableId" value="${bioDiscreetDataForm.yVariableId}" path="yVariableId"/>
						<form:errors  class="text-danger"  path="yVariableId" />
					</div>
				</div>	
				<div class="form-group row">
					<div class="col-sm-1">
						<form:label  class="text-info" path="yVariableId" >X-axis variable(1): </form:label>						
					</div>
					<div class="col-sm-1 variableName">
						<form:label  class="text-info" path="yVariableId" >Y-axis variable: </form:label>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-1">
						<form:select class="form-control" id="yVariableId" value="${bioDiscreetDataForm.yVariableId}" path="yVariableId"/>
						<form:errors  class="text-danger"  path="yVariableId" />					
					</div>
					<div class="col-sm-1 block">
						<form:select class="form-control" id="yVariableId" value="${bioDiscreetDataForm.yVariableId}" path="yVariableId"/>
						<form:errors  class="text-danger"  path="yVariableId" />
					</div>
					<div class="col-sm-1">
						<input type="hidden" id="number" value="1"/>
						<button type="button" style="font-size:x-large" class="text-info unstyled-button addVariable" id="addVariable" value="yes" title="click to add another column for x-axis">&#65291;</button>
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-3">
						<form:label for="file"  class="btn btn-info btn-default" path="yVariableId" type="button" value="Upload">Upload</form:label>
						<input type="file" value = "Choose File" name="file" id = "file" accept=".xls,.xlsx" value = "${bioDiscreetDataForm.file}" style="display:none; visibility:none;"/> 
					</div>
				</div>
				
				<div class="form-group row">
		  				<div class="col-sm-offset-5 col-sm-1">
		     				<button  type="submit" class="btn btn-success btn-lg">Save</button>
		   				</div>
		   				<div>
		     				<input class="btn btn-danger btn-lg" type="button" id="cancelUploadFile" name="cancelUploadFile" value="Cancel" />
		   				</div>
		    		</div>
		    		
		    	</c:when>
		   		<c:otherwise>
		    			
		    	</c:otherwise>
			</c:choose>
			</form:form>
			
		
	<p>&nbsp;</p>
	
	<div id="footerbar"> <p>&nbsp;</p> <%@ include file = "./../footer_bar.jsp" %></div>	
</div>  
 
<script>
$('#materialId').inputpicker({
    url: 'getMaterialsWithFormula',
    fields:['id','shortDesc'],
    fieldText : 'shortDesc',
    fieldValue : 'id',
    headShow: true,
    filterOpen: true,
    autoOpen: true
});

$('#discreteGroupId').inputpicker({
    url: 'getBioGroups',
    fields:['id','groupName'],
    fieldText : 'groupName',
    fieldValue : 'id',
    headShow: true,
    filterOpen: true,
    autoOpen: true
});


</script>

</body> 