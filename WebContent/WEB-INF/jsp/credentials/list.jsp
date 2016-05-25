<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

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
					</c:when>
					<c:otherwise>
						<td>No</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach> 
	</table>
</jsp:body>
</t:paginabasica>