<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<c:set var="message" scope="request" value='${session.getAttribute("message")}'/>

<t:paginabasica title="Lista de credenciales">
<jsp:body>
	<br><br><br>
	<h2>Credenciales de los usuarios</h2>
	<table class="table table-striped"> 
		<tr> 
			<th>#</th>
			<th>Usuario</th>
			<th>Rol</th>
			<th>DNI</th>
			<th>Nombre</th>
			<th>Apellidos</th>
			<th>Email</th>
			<th>CP</th>
			<th>Registro</th>
			<th>Teléfono</th>
			<th>Activo</th>
			<th></th>
		</tr>
		<c:forEach items="${credentials}" var="cred" varStatus="loop">
			<tr class="fons">
				<td>${loop.index + 1}</td>
				<td>${cred.username}</td>
				<td>${cred.role}</td>
				<td>${cred.nationalId}</td>
				<td>${cred.name}</td>
				<td>${cred.surname}</td>
				<td>${cred.email}</td>
				<td>${cred.postalAddress}</td>
				<td>${cred.registrationDate}</td>
				<td>${cred.phoneNumber}</td>
				<c:choose>
					<c:when test="${cred.isActive == 'true'}">
						<td>Sí</td>
						<td><a href="${pageContext.request.contextPath}/user/administratordeletes/${cred.username}.html" class="btn btn-danger">Desactivar</a></td>
					</c:when>
					<c:otherwise>
						<td>No</td>
						<td><a href="${pageContext.request.contextPath}/user/administratoractivates/${cred.username}.html" class="btn btn-info">Reactivar</a></td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach> 
	</table>
	
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
	
</jsp:body>
</t:paginabasica>

<script>
	var message = '${message.message}';
	if (message!=''){
		$('#myModal').modal('show');
		console.log(message);
	}
</script>