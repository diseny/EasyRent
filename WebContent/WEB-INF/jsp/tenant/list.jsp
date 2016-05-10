<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>EasyRent - Gestionar inquilinos</title>
</head>
<body>
	<h1>Lista de inquilinos</h1>
	<table>
		<tr>
			<th>Usuario</th>
			<th>DNI</th>
			<th>Nombre</th>
			<th>Apellido</th>
			<th>Email</th>
			<th>Código postal</th>
			<th>Fecha de registro</th>
			<th>Teléfono</th>
			<th>Está activo</th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach items="${tenants}" var="tenant">
			<tr>
				<td>${tenant.username}</td>
				<td>${tenant.nationalId}</td>
				<td>${tenant.name}</td>
				<td>${tenant.surname}</td>
				<td>${tenant.email}</td>
				<td>${tenant.postalAddress}</td>
				<td>${tenant.registrationDate}</td>
				<td>${tenant.phoneNumber}</td>
				<td>${tenant.isActive}</td>
				<td><a href="update/${tenant.username}.html">Edita</a>
				<td><a href="delete/${tenant.username}.html">Borra</a>
			</tr>
		</c:forEach>
	</table>
	<a href="add.html">Añade inquilino</a>
</body>
</html>