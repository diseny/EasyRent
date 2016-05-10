<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>EasyRent - Gestionar propietario</title>
</head>
<body>
	<h1>Lista de propietarios</h1>
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
		<c:forEach items="${owners}" var="owner">
			<tr>
				<td>${owner.username}</td>
				<td>${owner.nationalId}</td>
				<td>${owner.name}</td>
				<td>${owner.surname}</td>
				<td>${owner.email}</td>
				<td>${owner.postalAddress}</td>
				<td>${owner.registrationDate}</td>
				<td>${owner.phoneNumber}</td>
				<td>${owner.isActive}</td>
				<td><a href="update/${owner.username}.html">Edita</a>
				<td><a href="delete/${owner.username}.html">Borra</a>
			</tr>
		</c:forEach>
	</table>
	<a href="add.html">Añade propietario</a>
</body>
</html>