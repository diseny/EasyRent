<%@page contentType="text/html; charset=iso-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>EasyRent - Crear nuevos credenciales</title>
</head>
<body>
	<h2>Nuevos credenciales</h2>
	<form:form method="post" modelAttribute="credentials">
		<table>
			<tr>
				<td><form:label path="username">Usuario</form:label></td>
				<td><form:input path="username" /></td>
				<td><form:errors path="username"/></td>
			</tr>
			<tr>
				<td><form:label path="password">Contraseña</form:label></td>
				<td><form:input type="password" path="password" /></td>
				<td><form:errors path="password"/></td>
			</tr>
			<tr>
				<td><form:label path="role">Rol</form:label></td>
				<td><form:input path="role" /></td>
				<td><form:errors path="role"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Añade credenciales" />
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>