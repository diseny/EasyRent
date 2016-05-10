<%@page contentType="text/html; charset=iso-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>EasyRent - Borrar propiedad</title>
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
				<td><form:label path="title">Título:</form:label></td>
				<td><form:label path="title" />${property.title}</td>
			</tr>
			<tr>
				<td><form:label path="description">Description:</form:label></td>
				<td><form:label path="description" />${property.description}</td>
			</tr>
			<tr>
				<td><form:label path="capacity">Capacidad:</form:label></td>
				<td><form:label path="capacity" />${property.capacity}</td>
			</tr>
			<tr>
				<td><form:label path="numRooms">Habitaciones:</form:label></td>
				<td><form:label path="numRooms" />${property.numRooms}</td>
			</tr>
			<tr>
				<td><form:label path="numBathrooms">Baños:</form:label></td>
				<td><form:label path="numBathrooms" />${property.numBathrooms}</td>
			</tr>
			<tr>
				<td><form:label path="numBeds">Camas:</form:label></td>
				<td><form:label path="numBeds" />${property.numBeds}</td>
			</tr>
			<tr>
				<td><form:label path="squareMeters">Metros cuadrados:</form:label></td>
				<td><form:label path="squareMeters" />${property.squareMeters}</td>
			</tr>
			<tr>
				<td><form:label path="street">Calle:</form:label></td>
				<td><form:label path="street" />${property.street}</td>
			</tr>
			<tr>
				<td><form:label path="number">Número:</form:label></td>
				<td><form:label path="number" />${property.number}</td>
			</tr>
			<tr>
				<td><form:label path="floor">Piso:</form:label></td>
				<td><form:label path="floor" />${property.floor}</td>
			</tr>
			<tr>
				<td><form:label path="city">Ciudad:</form:label></td>
				<td><form:label path="city" />${property.city}</td>
			</tr>
			<tr>
				<td><form:label path="dailyPrice">Precio/día:</form:label></td>
				<td><form:label path="dailyPrice" />${property.dailyPrice}</td>
			</tr>
			<tr>
				<td><form:label path="isActive">Está activa:</form:label></td>
				<td><form:label path="isActive" />${property.isActive}</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Borra property" />
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>