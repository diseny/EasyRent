
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="welcome-image"></div>
<div class="index">
<t:paginabasica title="EasyRent">
<jsp:body>

<div class="col-md-12 col-sm-12 col-xs-12 indexSearch">
	<h1>RESERVA TU ALOJAMIENTO ONLINE</h1>
	<h2>Rápido de reservar. 100% seguro</h2>
	<form  method="post"  action="${pageContext.request.contextPath}/property/list.html">	
	<div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-6 col-xs-offset-3 welcomeSearch" >
		<div class="row">
		<div class="col-md-4 nm">
			<label>Ciudad</label>
		 <input id="city" name="city" class="form-control" type="text" placeholder="Enter a location" autocomplete="on">
		</div>
		<div class="col-md-3  nm">
			<div class="col-md-12">
				<label>Capacidad</label>
			</div>		 
			<div class="col-md-12">
		  	 <input id="capacity" type="number" min="0"  name="capacity" class="form-control" type="text" placeholder="" autocomplete="on">
		   </div>
		 </div>
		<div class="col-md-3 nm">
			<div class="col-md-12">
				<label>Habitaciones</label>
			</div>	
		  	<div class="col-md-12">
		   <input id="numRooms" type="number" min="0"  name="numRooms" class="form-control" type="text" placeholder="" autocomplete="on">
			</div>
		</div>
		<div class="col-md-2 nm busquedaAvanzadaIcon show">
			
			<label>Ver más</label>
			<img src="${pageContext.request.contextPath}/images/plusIcon.png" onclick="busqAvanzada()" style="cursor:pointer">
		</div>
		<div class="col-md-2 nm busquedaNormalIcon">
			<label>Ver menos</label>
			<img src="${pageContext.request.contextPath}/images/minusIcon.png" onclick="closeBusqueda()" style="cursor:pointer">
		</div>
		</div>
		<div class="row busquedaAvanzada" >
			<div class="col-md-3 nm">
				<div class="col-md-12">
					<label>Baños</label>
				</div>
				<div class="col-md-12">
		   			<input id="numBathrooms" type="number"  min="0"  name="numBathrooms" class="form-control" type="text" placeholder="" autocomplete="on"> 
				</div>
			</div>		
			<div class="col-md-3 nm">
				<div class="col-md-12">
					<label>Camas</label>
				</div>
				<div class="col-md-12">
				  <input id="numBeds" type="number"  min="0"  name="numBeds" class="form-control" type="text" placeholder="" autocomplete="on">
				</div>
			</div>
			<div class="col-md-3 nm">
				<div class="col-md-12">
					<label>m<sup>2</sup>: </label>
				</div>
				<div class="col-md-12">
				  <input id ="squareMeters" type="number" min="0"  name="squareMeters" class="form-control" type="text" placeholder="" autocomplete="on">
				</div>
			</div>
			<div class="col-md-3 nm">
				<div class="col-md-12">
					<label>Calle</label>
				</div>
				<div class="col-md-12">
				   <input type="street" id="street" name="street" class="form-control" type="text" placeholder="" autocomplete="on">
				</div>
			</div>
		</div>
		
		<div ><button class=" nm col-md-4 col-md-offset-4 btn btn-success">OK</button></div>
		
	</div>
	</form>
</div>
<script>
	//if(!jQuery('#city').val()){ jQuery('#city').attr('value',"")}
	if(!jQuery('#capacity').val()){ jQuery('#capacity').attr('value',"0")}
	if(!jQuery('#numRooms').val()){ jQuery('#numRooms').attr('value',"0")}
	if(!jQuery('#numBathrooms').val()){ jQuery('#numBathrooms').attr('value',"0")}
	if(!jQuery('#numBeds').val()){ jQuery('#numBeds').attr('value',"0")}
	if(!jQuery('#squareMeters').val()){ jQuery('#squareMeters').attr('value',"0")}
	//if(!jQuery('#street').val()){ jQuery('#street').attr('value'," ")}
	
	function busqAvanzada(){
		jQuery('.welcomeSearch').css('height','235');
		jQuery('.busquedaAvanzada').addClass("show");
		jQuery('.busquedaAvanzadaIcon').removeClass("show");
		jQuery('.busquedaNormalIcon').addClass("show");
	}
	function closeBusqueda(){
		jQuery('.welcomeSearch').css('height','100');
		jQuery('.busquedaAvanzada').removeClass("show");
		jQuery('.busquedaAvanzadaIcon').addClass("show");
		jQuery('.busquedaNormalIcon').removeClass("show");
	
	}
</script>
</jsp:body>

</t:paginabasica>
</div>