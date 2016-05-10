<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>EasyRent - Gestionar credenciales</title>
</head>
<body>
	<h1>Lista de credenciales</h1>
	<table>
		<tr>
			<th>Usuario</th>
			<th>Contraseña</th>
			<th>Rol</th>
		</tr>
		<c:forEach items="${credentials}" var="cred">
			<tr>
				<td>${cred.username}</td>
				<td>${cred.password}</td>
				<td>${cred.role}</td>
				<td><a href="update/${cred.username}.html">Edita</a>
				<td><a href="delete/${cred.username}.html">Borra</a>
			</tr>
		</c:forEach>
	</table>
	<a href="add.html">Añade credenciales</a>
</body>
</html>