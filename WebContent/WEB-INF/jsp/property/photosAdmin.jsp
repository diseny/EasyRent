<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="user" scope="request" value='${session.getAttribute("user")}'/>
<c:set var="message" scope="request" value='${session.getAttribute("message")}'/>

<t:paginabasica title="Perfil">
<jsp:body>
	
	<h1>Imágenes de la propiedad ${property.title}</h1>
	<div class="container">
		<div class="row">
			<c:forEach items="${images}" var="image" varStatus="loop">
				<div class="col-md-2">
					<img src="${pageContext.request.contextPath}/images/propiedades/${property.id}/${image.href}" style="width:180px;height:180px;">
					<a href="${pageContext.request.contextPath}/property/deletePhoto/${property.id}/${image.caption}.html" style="color:red;text-align:center;">Borrar foto</a>
				</div>
			</c:forEach> 
		</div>
		</div>

		<div class="modal fade" id="myModal" role="dialog">
  	  <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">${message.title}</h4>
	        </div>
	        <div class="modal-body">
	          <p>${message.message}</p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
	        </div>
	      </div>
	    </div>
	 </div>
	<form:form method="post" modelAttribute="property" id="basic" enctype="multipart/form-data" action="${pageContext.request.contextPath}/property/uploadPhoto.html">
	<div class="col-md-12" style="min-height:230px">
		<h4><li>Añadir imagen</li></h4>
		<div class="col-md-6">
			<form:input type="hidden" path="id"/>
			<form:input type="hidden" path="title"/>
			<form:input type="file" accept="image/*" path="fichero" onchange="loadFile(event)" />
			<form:input type="text" class="form-control" path="caption" placeholder="Titulo"/>
			<input type="submit" class="btn btn-success" value="Añade foto"/>
		</div>
	</form:form>
	
</jsp:body>
</t:paginabasica>

<script>
  var loadFile = function(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
    $('#output').css('height','250');
    
  };
</script>

<script>
	var message = '${message.message}';
	if (message!=''){
		$('#myModal').modal('show');
		console.log(message);
	}
</script>