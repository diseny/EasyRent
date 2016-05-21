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
				<td><form:input id="capacity" type="number"  min="0"  path="capacity" placeholder="Capacidad"/></td>
			</tr>
			<tr>
				<td><form:label path="numRooms">Habitaciones:</form:label></td>
				<td><form:input id="numRooms" type="number"  min="0" path="numRooms" placeholder="Habitaciones"/></td>
			</tr>
			<tr>
			<tr>
				<td><form:label path="numBathrooms">Baños:</form:label></td>
				<td><form:input id="numBathrooms" type="number" min="0"  path="numBathrooms" placeholder="Baños"/></td>
			</tr>
			<tr>
				<td><form:label path="numBeds">Camas:</form:label></td>
				<td><form:input id="numBeds" type="number"  min="0"  path="numBeds" placeholder="Camas"/></td>
			</tr>
			<tr>
				<td><form:label path="squareMeters">m<sup>2</sup>:</form:label></td>
				<td><form:input id="squareMeters" type="number"  min="0" path="squareMeters" placeholder="m2"/></td>

			</tr>
			<tr>
				<td><form:label path="street">Calle:</form:label></td>
				<td><form:input id="street" type="street" path="street" placeholder="Calle"/></td>
			</tr>
			<tr>
				<td><form:label path="city">Ciudad:</form:label></td>
				<td><form:input id="city" type="city" path="city" placeholder="Ciudad"/></td>
			</tr>
			<tr>
				<td><form:label path="dailyPrice">Precio(<img src="${pageContext.request.contextPath}/images/euro.png" style="width:10px;height:10px;">/día):</form:label></td>
				<td><form:input id="dailyPrice" type="number"  min="0" path="dailyPrice" placeholder="Precio por día"/></td>
			</tr>
		</table>
		<input type="submit" value="Buscar" />
	</form:form>
	<table class="table table-striped navProperty" style="text-align:center;"> 
		<tr> 
			<th></th>
			<th></th>
			<th>
				<img  onclick="post('${pageContext.request.contextPath}/property/listOrderOwnerDown.html')"src="${pageContext.request.contextPath}/images/sortDown.png" >
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderOwnerUp.html')" src="${pageContext.request.contextPath}/images/sortUp.png" >
			</th>
			<th>
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderTitleDown.html')" src="${pageContext.request.contextPath}/images/sortDown.png" >
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderTitleUp.html')"src="${pageContext.request.contextPath}/images/sortUp.png" >
			</th>
			<th>
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderCapacityDown.html')" src="${pageContext.request.contextPath}/images/sortDown.png" >
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderCapacityUp.html')" src="${pageContext.request.contextPath}/images/sortUp.png" >
			</th>
			<th>
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderRoomsDown.html')" src="${pageContext.request.contextPath}/images/sortDown.png" >
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderRoomsUp.html')" src="${pageContext.request.contextPath}/images/sortUp.png" >
			</th>
			<th>
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderBathroomsDown.html')"src="${pageContext.request.contextPath}/images/sortDown.png">
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderBathroomsUp.html')" src="${pageContext.request.contextPath}/images/sortUp.png" >
			</th>
			<th>
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderBedsDown.html')" src="${pageContext.request.contextPath}/images/sortDown.png" >
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderBedsUp.html')" src="${pageContext.request.contextPath}/images/sortUp.png" >
			</th>
			<th style="width:70px">
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderMetersDown.html')" src="${pageContext.request.contextPath}/images/sortDown.png" >
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderMetersUp.html')" src="${pageContext.request.contextPath}/images/sortUp.png" >
			</th>
			<th>
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderStreetDown.html')" src="${pageContext.request.contextPath}/images/sortDown.png" >
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderStreetUp.html')" src="${pageContext.request.contextPath}/images/sortUp.png" >
			</th>
			<th>
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderCityDown.html')" src="${pageContext.request.contextPath}/images/sortDown.png" >
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderCityUp.html')" src="${pageContext.request.contextPath}/images/sortUp.png" >
			</th>
			<th>
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderPriceDown.html')"src="${pageContext.request.contextPath}/images/sortDown.png" >
				<img onclick="post('${pageContext.request.contextPath}/property/listOrderPriceUp.html')" src="${pageContext.request.contextPath}/images/sortUp.png" >			
			</th>
			<th>
			</th>
		</tr>
		<script>
		function post(path){
			method="post";
			//pillo todos los valores de los input del formulario que busca 
			cap=jQuery("#capacity").val();
			nR=	jQuery("#numRooms").val()
			nBR=jQuery("#numBathrooms").val()
			nB=jQuery("#numBeds").val()
			sM=jQuery("#squareMeters").val()
			st=jQuery("#street").val()
			ct=jQuery("#city").val()
			dP=jQuery("#dailyPrice").val()
			var	params={capacity:cap,numRooms:nR,numBathrooms:nBR,numBeds:nB,squareMeters:sM,street:st,city:ct,dailyPrice:dP};
			//creo el formulario y le pongo todos los valores anteriores  y por ultimo le hago un submit
			var form = document.createElement("form");
			form.setAttribute("method",method);
			form.setAttribute("action",path);
			for(var key in params){
				if(  params.hasOwnProperty(key)){
					var hiddenField= document.createElement("input");
					hiddenField.setAttribute("type","hidden");
					hiddenField.setAttribute("name",key);
					hiddenField.setAttribute("value",params[key]);
					form.appendChild(hiddenField);	
				}
				
			}
			
			document.body.appendChild(form);
			form.submit();
		}
					
		</script>
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