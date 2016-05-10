<%@page contentType="text/html; charset=iso-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>EasyRent - Borrar credenciales</title>
</head>
<body>
	<h2>${credentials.username}</h2>
	<form:form method="post" modelAttribute="credentials">
		<table>
			<tr>
				<td><form:input path="username" type="hidden" /></td>
			</tr>
			<tr>
				<td><form:label path="password">Contraseña:</form:label></td>
				<td><form:label path="password" />${credentials.password}</td>
			</tr>
			<tr>
				<td><form:label path="role">Rol:</form:label></td>
				<td><form:label path="role"/>${credentials.role}</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Borra credenciales" />
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>