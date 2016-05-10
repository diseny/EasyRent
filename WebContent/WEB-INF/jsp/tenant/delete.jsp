<%@page contentType="text/html; charset=iso-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>EasyRent - Borrar inquilino</title>
</head>
<body>
	<h2>${tenant.username}</h2>
	<form:form method="post" modelAttribute="tenant">
		<table>
			<tr>
				<td><form:input path="username" type="hidden" /></td>
			</tr>
			<tr>
				<td><form:label path="nationalId">DNI:</form:label></td>
				<td><form:label path="nationalId" />${tenant.nationalId}</td>
			</tr>
			<tr>
				<td><form:label path="name">Nombre:</form:label></td>
				<td><form:label path="name" />${tenant.name}</td>
			</tr>
			<tr>
				<td><form:label path="surname">Apellido:</form:label></td>
				<td><form:label path="surname" />${tenant.surname}</td>
			</tr>
			<tr>
				<td><form:label path="email">Email:</form:label></td>
				<td><form:label path="email" />${tenant.email}</td>
			</tr>
			<tr>
				<td><form:label path="postalAddress">Código postal:</form:label></td>
				<td><form:label path="postalAddress" />${tenant.postalAddress}</td>
			</tr>
			<tr>
				<td><form:label path="registrationDate">Fecha de registro:</form:label></td>
				<td><form:label path="registrationDate" />${tenant.registrationDate}</td>
			</tr>
			<tr>
				<td><form:label path="phoneNumber">Teléfono:</form:label></td>
				<td><form:label path="phoneNumber" />${tenant.phoneNumber}</td>
			</tr>
			<tr>
				<td><form:label path="isActive">Está activo:</form:label></td>
				<td><form:label path="isActive" />${tenant.isActive}</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Borra inquilino" />
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>