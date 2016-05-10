<%@page contentType="text/html; charset=iso-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>EasyRent - Actualizar propiedad</title>
</head>
<body>
	<h2>${property.id}</h2>
	<form:form method="post" modelAttribute="property">
		<table>
			<tr>
				<td><form:input path="id" type="hidden" /></td>
			</tr>
			<tr>
				<td><form:input path="ownerUsername" type="hidden" /></td>
			</tr>
			<tr>
				<td><form:label path="title">Título</form:label></td>
				<td><form:input type="title" path="title" /></td>
				<td><form:errors path="title"/></td>
			</tr>
			<tr>
				<td><form:label path="description">Description</form:label></td>
				<td><form:input type="description" path="description" /></td>
				<td><form:errors path="description"/></td>
			</tr>
			<tr>
				<td><form:label path="capacity">Capacidad</form:label></td>
				<td><form:input type="capacity" path="capacity" /></td>
				<td><form:errors path="capacity"/></td>
			</tr>
			<tr>
				<td><form:label path="numRooms">Habitaciones</form:label></td>
				<td><form:input type="numRooms" path="numRooms" /></td>
				<td><form:errors path="numRooms"/></td>
			</tr>
			<tr>
				<td><form:label path="numBathrooms">Baños</form:label></td>
				<td><form:input type="numBathrooms" path="numBathrooms" /></td>
				<td><form:errors path="numBathrooms"/></td>
			</tr>
			<tr>
				<td><form:label path="numBeds">Camas</form:label></td>
				<td><form:input type="numBeds" path="numBeds" /></td>
				<td><form:errors path="numBeds"/></td>
			</tr>
			<tr>
				<td><form:label path="squareMeters">Metros cuadrados</form:label></td>
				<td><form:input type="squareMeters" path="squareMeters" /></td>
				<td><form:errors path="squareMeters"/></td>
			</tr>
			<tr>
				<td><form:label path="street">Calle</form:label></td>
				<td><form:input type="street" path="street" /></td>
				<td><form:errors path="street"/></td>
			</tr>
			<tr>
				<td><form:label path="number">Número</form:label></td>
				<td><form:input type="number" path="number" /></td>
				<td><form:errors path="number"/></td>
			</tr>
			<tr>
				<td><form:label path="floor">Piso</form:label></td>
				<td><form:input type="floor" path="floor" /></td>
				<td><form:errors path="floor"/></td>
			</tr>
			<tr>
				<td><form:label path="city">Ciudad</form:label></td>
				<td><form:input type="city" path="city" /></td>
				<td><form:errors path="city"/></td>
			</tr>
			<tr>
				<td><form:label path="dailyPrice">Precio/día</form:label></td>
				<td><form:input type="dailyPrice" path="dailyPrice" /></td>
				<td><form:errors path="dailyPrice"/></td>
			</tr>
			<tr>
				<td><form:label path="isActive">Está activa</form:label></td>
				<td><form:checkbox path="isActive" value="isActive" /></td>
				<td><form:errors path="isActive"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Modifica propiedad" />
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>