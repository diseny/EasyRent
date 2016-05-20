<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<t:paginabasica title="EasyRent">
<jsp:body>
	<br><br><br>
	<h2>Propiedades registradas</h2><br>
	<form:form method="post" modelAttribute="property">
		<table style="width:350px">
			<tr>
				<td><form:label path="capacity">Capacidad:</form:label></td>
				<td><form:input type="number" path="capacity" placeholder="Capacidad"/></td>
			</tr>
			<tr>
				<td><form:label path="numRooms">Habitaciones:</form:label></td>
				<td><form:input type="number" path="numRooms" placeholder="Habitaciones"/></td>
			</tr>
			<tr>
			<tr>
				<td><form:label path="numBathrooms">Baños:</form:label></td>
				<td><form:input type="number" path="numBathrooms" placeholder="Baños"/></td>
			</tr>
			<tr>
				<td><form:label path="numBeds">Camas:</form:label></td>
				<td><form:input type="number" path="numBeds" placeholder="Camas"/></td>
			</tr>
			<tr>
				<td><form:label path="squareMeters">m<sup>2</sup>:</form:label></td>
				<td><form:input type="number" path="squareMeters" placeholder="m2"/></td>
			</tr>
			<tr>
				<td><form:label path="street">Calle:</form:label></td>
				<td><form:input type="street" path="street" placeholder="Calle"/></td>
			</tr>
			<tr>
				<td><form:label path="city">Ciudad:</form:label></td>
				<td><form:input type="city" path="city" placeholder="Ciudad"/></td>
			</tr>
			<tr>
				<td><form:label path="dailyPrice">Precio(<img src="${pageContext.request.contextPath}/images/euro.png" style="width:10px;height:10px;">/día):</form:label></td>
				<td><form:input type="number" path="dailyPrice" placeholder="Precio por día"/></td>
			</tr>
		</table>
		<input type="submit" value="Buscar" />
	</form:form>
	<table class="table table-striped navProperty" style="text-align:center;"> 
		<tr> 
			<th></th>
			<th></th>
			<th><a href="${pageContext.request.contextPath}/property/listOrderOwnerDown.html"><img src="${pageContext.request.contextPath}/images/sortDown.png" style="text-align:center;width:20px;height:20px;"></a><a href="${pageContext.request.contextPath}/property/listOrderOwnerUp.html"><img src="${pageContext.request.contextPath}/images/sortUp.png" style="width:20px;height:20px;"></a></th>
			<th><a href="${pageContext.request.contextPath}/property/listOrderTitleDown.html"><img src="${pageContext.request.contextPath}/images/sortDown.png" style="text-align:center;width:20px;height:20px;"></a><a href="${pageContext.request.contextPath}/property/listOrderTitleUp.html"><img src="${pageContext.request.contextPath}/images/sortUp.png" style="width:20px;height:20px;"></a></th>
			<th><a href="${pageContext.request.contextPath}/property/listOrderCapacityDown.html"><img src="${pageContext.request.contextPath}/images/sortDown.png" style="text-align:center;width:20px;height:20px;"></a><a href="${pageContext.request.contextPath}/property/listOrderCapacityUp.html"><img src="${pageContext.request.contextPath}/images/sortUp.png" style="width:20px;height:20px;"></a></th>
			<th><a href="${pageContext.request.contextPath}/property/listOrderRoomsDown.html"><img src="${pageContext.request.contextPath}/images/sortDown.png" style="text-align:center;width:20px;height:20px;"></a><a href="${pageContext.request.contextPath}/property/listOrderRoomsUp.html"><img src="${pageContext.request.contextPath}/images/sortUp.png" style="width:20px;height:20px;"></a></th>
			<th><a href="${pageContext.request.contextPath}/property/listOrderBathroomsDown.html"><img src="${pageContext.request.contextPath}/images/sortDown.png" style="text-align:center;width:20px;height:20px;"></a><a href="${pageContext.request.contextPath}/property/listOrderBathroomsUp.html"><img src="${pageContext.request.contextPath}/images/sortUp.png" style="width:20px;height:20px;"></a></th>
			<th><a href="${pageContext.request.contextPath}/property/listOrderBedsDown.html"><img src="${pageContext.request.contextPath}/images/sortDown.png" style="text-align:center;width:20px;height:20px;"></a><a href="${pageContext.request.contextPath}/property/listOrderBedsUp.html"><img src="${pageContext.request.contextPath}/images/sortUp.png" style="width:20px;height:20px;"></a></th>
			<th style="width:70px"><a href="${pageContext.request.contextPath}/property/listOrderMetersDown.html"><img src="${pageContext.request.contextPath}/images/sortDown.png" style="text-align:center;width:20px;height:20px;"></a><a href="${pageContext.request.contextPath}/property/listOrderMetersUp.html"><img src="${pageContext.request.contextPath}/images/sortUp.png" style="width:20px;height:20px;"></a></th>
			<th><a href="${pageContext.request.contextPath}/property/listOrderStreetDown.html"><img src="${pageContext.request.contextPath}/images/sortDown.png" style="text-align:center;width:20px;height:20px;"></a><a href="${pageContext.request.contextPath}/property/listOrderStreetUp.html"><img src="${pageContext.request.contextPath}/images/sortUp.png" style="width:20px;height:20px;"></a></th>
			<th><a href="${pageContext.request.contextPath}/property/listOrderCityDown.html"><img src="${pageContext.request.contextPath}/images/sortDown.png" style="text-align:center;width:20px;height:20px;"></a><a href="${pageContext.request.contextPath}/property/listOrderCityUp.html"><img src="${pageContext.request.contextPath}/images/sortUp.png" style="width:20px;height:20px;"></a></th>
			<th style="width:125px"><a href="${pageContext.request.contextPath}/property/listOrderPriceDown.html"><img src="${pageContext.request.contextPath}/images/sortDown.png" style="text-align:center;width:20px;height:20px;"></a><a href="${pageContext.request.contextPath}/property/listOrderPriceUp.html"><img src="${pageContext.request.contextPath}/images/sortUp.png" style="width:20px;height:20px;"></a></th>			
			<th></th>
		</tr>
		<tr> 
			<th>#</th>
			<th>Imagen</th>
			<th>Propietario</th>
			<th>Título</th>
			<th>Capacidad</th>
			<th>Habitaciones</th>
			<th>Baños</th>
			<th>Camas</th>
			<th>m<sup>2</sup></th>
			<th>Calle</th>
			<th>Ciudad</th>
			<th>Precio(<img src="${pageContext.request.contextPath}/images/euro.png" style="width:10px;height:10px;">/día)</th>
			<th></th>
		</tr>
		<c:forEach items="${properties}" var="property" varStatus="loop">
			<tr class="fons">
				<td>${loop.index + 1}</td>
				<c:forEach items="${images}" var="image" varStatus="loopImages">
					<c:if test="${property.id == image.ID}" >
   						<td><img src="${image.href}" alt="Propiedad ${image.ID}" style="width:100px;height:100px;"></td>
					</c:if>
				</c:forEach>
				<td>${property.ownerUsername}</td>
				<td>${property.title}</td>
				<td>${property.capacity}</td>
				<td>${property.numRooms}</td>
				<td>${property.numBathrooms}</td>
				<td>${property.numBeds}</td>
				<td>${property.squareMeters}</td>
				<td>${property.street}</td>
				<td>${property.city}</td>
				<td>${property.dailyPrice}</td>
				<td><a href="info/${property.id}.html" class="btn btn-info">Ver más</a>
			</tr>
		</c:forEach> 
	</table>
</jsp:body>
</t:paginabasica>