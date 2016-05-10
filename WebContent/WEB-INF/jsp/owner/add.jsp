<%@page contentType="text/html; charset=iso-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>EasyRent - Crear nuevo propietario</title>
</head>
<body>
	<h2>Nuevo propietario</h2>
	<form:form method="post" modelAttribute="owner">
		<table>
			<tr>
				<td><form:label path="username">Usuario</form:label></td>
				<td><form:input path="username" /></td>
				<td><form:errors path="username"/></td>
			</tr>
			<tr>
				<td><form:label path="nationalId">DNI</form:label></td>
				<td><form:input path="nationalId" /></td>
				<td><form:errors path="nationalId"/></td>
			</tr>
			<tr>
				<td><form:label path="name">Nombre</form:label></td>
				<td><form:input path="name" /></td>
				<td><form:errors path="name"/></td>
			</tr>
			<tr>
				<td><form:label path="surname">Apellido</form:label></td>
				<td><form:input path="surname" /></td>
				<td><form:errors path="surname"/></td>
			</tr>
			<tr>
				<td><form:label path="email">Email</form:label></td>
				<td><form:input type="email" path="email" /></td>
				<td><form:errors path="email"/></td>
			</tr>
			<tr>
				<td><form:label path="postalAddress">Código postal</form:label></td>
				<td><form:input path="postalAddress" /></td>
				<td><form:errors path="postalAddress"/></td>
			</tr>
			<tr>
				<td><form:label path="registrationDate">Fecha de registro</form:label></td>
				<td><form:input path="registrationDate" /></td>
				<td><form:errors path="registrationDate"/></td>
			</tr>
			<tr>
				<td><form:label path="phoneNumber">Teléfono</form:label></td>
				<td><form:input path="phoneNumber" /></td>
				<td><form:errors path="phoneNumber"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Añade propietario" />
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>