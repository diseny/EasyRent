
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
		 <input id="pac-input" name="city" class="form-control" type="text" placeholder="Enter a location" autocomplete="on">
		</div>
		<div class="col-md-3  nm">
			<div class="col-md-12">
				<label>Capacidad</label>
			</div>		 
			<div class="col-md-12">
		  	 <input type="number" min="0" id="pac-input" name="capacity" class="form-control" type="text" placeholder="" autocomplete="on">
		   </div>
		 </div>
		<div class="col-md-3 nm">
			<div class="col-md-12">
				<label>Habitaciones</label>
			</div>	
		  	<div class="col-md-12">
		   <input type="number" min="0" id="pac-input" name="numRooms" class="form-control" type="text" placeholder="" autocomplete="on">
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
		   			<input type="number"  min="0" id="pac-input" name="numBathrooms" class="form-control" type="text" placeholder="" autocomplete="on"> 
				</div>
			</div>		
			<div class="col-md-3 nm">
				<div class="col-md-12">
					<label>Camas</label>
				</div>
				<div class="col-md-12">
				  <input type="number"  min="0" id="pac-input" name="numBeds" class="form-control" type="text" placeholder="" autocomplete="on">
				</div>
			</div>
			<div class="col-md-3 nm">
				<div class="col-md-12">
					<label>m<sup>2</sup>: </label>
				</div>
				<div class="col-md-12">
				  <input type="number" min="0" id="pac-input" name="squareMeters" class="form-control" type="text" placeholder="" autocomplete="on">
				</div>
			</div>
			<div class="col-md-3 nm">
				<div class="col-md-12">
					<label>Calle</label>
				</div>
				<div class="col-md-12">
				   <input type="street" id="pac-input" name="street" class="form-control" type="text" placeholder="" autocomplete="on">
				</div>
			</div>
		</div>
		
		<div ><button class=" nm col-md-4 col-md-offset-4 btn btn-success">OK</button></div>
		
	</div>
	</form>
</div>
<script>
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