<%@page contentType="text/html; charset=iso-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>EasyRent - Borrar propietario</title>
</head>
<body>
	<h2>${owner.username}</h2>
	<form:form method="post" modelAttribute="owner">
		<table>
			<tr>
				<td><form:input path="username" type="hidden" /></td>
			</tr>
			<tr>
				<td><form:label path="nationalId">DNI:</form:label></td>
				<td><form:label path="nationalId" />${owner.nationalId}</td>
			</tr>
			<tr>
				<td><form:label path="name">Nombre:</form:label></td>
				<td><form:label path="name" />${owner.name}</td>
			</tr>
			<tr>
				<td><form:label path="surname">Apellido:</form:label></td>
				<td><form:label path="surname" />${owner.surname}</td>
			</tr>
			<tr>
				<td><form:label path="email">Email:</form:label></td>
				<td><form:label path="email" />${owner.email}</td>
			</tr>
			<tr>
				<td><form:label path="postalAddress">Código postal:</form:label></td>
				<td><form:label path="postalAddress" />${owner.postalAddress}</td>
			</tr>
			<tr>
				<td><form:label path="registrationDate">Fecha de registro:</form:label></td>
				<td><form:label path="registrationDate" />${owner.registrationDate}</td>
			</tr>
			<tr>
				<td><form:label path="phoneNumber">Teléfono:</form:label></td>
				<td><form:label path="phoneNumber" />${owner.phoneNumber}</td>
			</tr>
			<tr>
				<td><form:label path="isActive">Está activo:</form:label></td>
				<td><form:label path="isActive" />${owner.isActive}</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Borra propietario" />
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>