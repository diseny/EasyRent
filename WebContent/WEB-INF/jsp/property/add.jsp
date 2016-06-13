<%@page contentType="text/html; charset=iso-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<c:set var="user" scope="request" value='${session.getAttribute("user")}'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>EasyRent - Crear nueva propiedad</title>
</head>

<t:paginabasica title="EasyRent">
<jsp:body>
	</div></div>
	<br><br><br>
	<div class="row">
	<div class="col-md-12" style="min-height:230px;background-color: rgba(0, 0, 0, 0.098039);">
		<div class="col-md-10 col-md-offset-1">
		<h1>Añadir Propiedad</h1>
		

		
		</div>
		</div>
		
	</div>
	<div class="col-md-12" style="min-height:230px;">
		<div class="col-md-10 col-md-offset-1">
		
		<h3>Detalles básicos</h3>

		
		</div>
		</div>
		
	</div>
	<div class="col-md-12" style="min-height:230px;background-color: rgba(0, 255, 253, 0.048039);">
		<div class="col-md-10 col-md-offset-1">
		
		

		
		</div>
		</div>
		
	</div>
	<div class="col-md-12" style="min-height:230px;background-color: rgba(0, 0, 0, 0.098039);">
		<div class="col-md-10 col-md-offset-1">
		
		

		
		</div>
		</div>
		
	</div>
	<div class="col-md-12" style="min-height:230px">
		<div class="col-md-10 col-md-offset-1">
		
		

		
		</div>
		</div>
		
	</div>
	
	<h2>Nueva propiedad</h2>

	<form:form method="post" modelAttribute="property">
		<table>

			
			<form:input type="hidden" path="id" value="${numProp}" />
			<form:input type="hidden"  path="ownerUsername" value="${user.username}"/>
		
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
				<td><form:input min="0" type="number" path="capacity" /></td>
				<td><form:errors path="capacity"/></td>
			</tr>
			<tr>
				<td><form:label path="numRooms">Habitaciones</form:label></td>
				<td><form:input min="0" type="number" path="numRooms" /></td>
				<td><form:errors path="numRooms"/></td>
			</tr>
			<tr>
				<td><form:label path="numBathrooms">Baños</form:label></td>
				<td><form:input min="0" type="number" path="numBathrooms" /></td>
				<td><form:errors path="numBathrooms"/></td>
			</tr>
			<tr>
				<td><form:label path="numBeds">Camas</form:label></td>
				<td><form:input min="0" type="number" path="numBeds" /></td>
				<td><form:errors path="numBeds"/></td>
			</tr>
			<tr>
				<td><form:label path="squareMeters">Metros cuadrados</form:label></td>
				<td><form:input min="0" type="number" path="squareMeters" /></td>
				<td><form:errors path="squareMeters"/></td>
			</tr>
			<tr>
				<td><form:label path="street">Calle</form:label></td>
				<td><form:input type="street" path="street" /></td>
				<td><form:errors path="street"/></td>
			</tr>
			<tr>
				<td><form:label path="number">Número</form:label></td>
				<td><form:input min="0" type="number" path="number" /></td>
				<td><form:errors path="number"/></td>
			</tr>
			<tr>
				<td><form:label path="floor">Piso</form:label></td>
				<td><form:input min="0" type="number" path="floor" /></td>
				<td><form:errors path="floor"/></td>
			</tr>
			<tr>
				<td><form:label path="city">Ciudad</form:label></td>
				<td><form:input type="city" path="city" /></td>
				<td><form:errors path="city"/></td>
			</tr>
			<tr>
				<td><form:label path="dailyPrice">Precio/día</form:label></td>
				<td><form:input min="0" type="number" path="dailyPrice" /></td>
				<td><form:errors path="dailyPrice"/></td>
			</tr>
			<tr>
			
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Añade propiedad" />
				</td>
			</tr>
		</table>
	</form:form>
	</div>
</jsp:body>
</t:paginabasica>
</html>