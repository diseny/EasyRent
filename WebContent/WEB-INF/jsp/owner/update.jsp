<%@page contentType="text/html; charset=iso-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>EasyRent - Actualizar propietario</title>
</head>
<body>
	<h2>${owner.username}</h2>
	<form:form method="post" modelAttribute="owner">
		<table>
			<tr>
				<td><form:input path="username" type="hidden" /></td>
			</tr>
			<tr>
				<td><form:input path="isActive" type="hidden" /></td>
			</tr>
			<tr>
				<td><form:label path="nationalId">DNI</form:label></td>
				<td><form:input type="nationalId" path="nationalId" /></td>
				<td><form:errors path="nationalId"/></td>
			</tr>
			<tr>
				<td><form:label path="name">Nombre</form:label></td>
				<td><form:input type="name" path="name" /></td>
				<td><form:errors path="name"/></td>
			</tr>
			<tr>
				<td><form:label path="surname">Apellido</form:label></td>
				<td><form:input type="surname" path="surname" /></td>
				<td><form:errors path="surname"/></td>
			</tr>
			<tr>
				<td><form:label path="email">Email</form:label></td>
				<td><form:input type="email" path="email" /></td>
				<td><form:errors path="email"/></td>
			</tr>
			<tr>
				<td><form:label path="postalAddress">Código postal</form:label></td>
				<td><form:input type="postalAddress" path="postalAddress" /></td>
				<td><form:errors path="postalAddress"/></td>
			</tr>
			<tr>
				<td><form:label path="registrationDate">Fecha de registro</form:label></td>
				<td><form:input type="registrationDate" path="registrationDate" /></td>
				<td><form:errors path="registrationDate"/></td>
			</tr>
			<tr>
				<td><form:label path="phoneNumber">Teléfono</form:label></td>
				<td><form:input type="phoneNumber" path="phoneNumber" /></td>
				<td><form:errors path="phoneNumber"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Modifica propietario" />
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>