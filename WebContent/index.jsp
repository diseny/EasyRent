
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
		 <input id="city" name="city" class="form-control" type="text" placeholder="Enter a location" autocomplete="on" list="municipios">
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
	
	if(!jQuery('#capacity').val()){ jQuery('#capacity').attr('value',"0")}
	if(!jQuery('#numRooms').val()){ jQuery('#numRooms').attr('value',"0")}
	if(!jQuery('#numBathrooms').val()){ jQuery('#numBathrooms').attr('value',"0")}
	if(!jQuery('#numBeds').val()){ jQuery('#numBeds').attr('value',"0")}
	if(!jQuery('#squareMeters').val()){ jQuery('#squareMeters').attr('value',"0")}
	
	
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
<datalist id="municipios">
		<option value="AIN">
		<option value="ALBOCASSER">
		<option value="ALCALA DE XIVERT">
		<option value="L'ALCORA">
		<option value="ALCOSSEBRE">
		<option value="ALCUDIA DE VEO">
		<option value="ALFONDEGUILLA">
		<option value="ALGIMIA DE ALMONACID">
		<option value="ALMASSORA">
		<option value="ALMEDIJAR">
		<option value="ALMENARA">
	  	<option value="ALQUERIAS DEL NIÑO PERDIDO">
		 <option value="ALTURA">
		 <option value="ARAÑUEL">
		 <option value="ARES DEL MAESTRE">
		 <option value="ARGELITA">
		 <option value="ARTANA">
		 <option value="ATZENETA DEL MAESTRAT">
		 <option value="AYODAR">
		 <option value="AZUEBAR">
		 <option value="BARRACAS">
		 <option value="BEJIS">
		 <option value="BENAFER">
		 <option value="BENAFIGOS">
		 <option value="BENASAL">
		 <option value="BENICARLO">
		 <option value="BENICASSIM">
		 <option value="BENLLOCH">
		 <option value="BETXI">
		 <option value="BORRIOL">
		 <option value="BURRIANA">
		 <option value="CABANES">
		 <option value="CALIG">
		 <option value="CANET LO ROIG">
		 <option value="CASTELL DE CABRES">
		 <option value="CASTELLFORT">
		 <option value="CASTELLNOVO">
		 <option value="CASTELLÓN DE LA PLANA">
		 <option value="CASTILLO DE VILLAMALEFA">
		 <option value="CATI">
		 <option value="CAUDIEL">
		 <option value="CERVERA DEL MAESTRE">
		 <option value="XERT">
		 <option value="CHILCHES">
		 <option value="XODOS">
		 <option value="CHOVAR">
		 <option value="CINCTORRES">
		 <option value="CIRAT">
		 <option value="CORTES DE ARENOSO">
		 <option value="COSTUR">
		 <option value="LES COVES DE VINROMA">
		 <option value="CULLA">
		 <option value="ESLIDA">
		 <option value="ESPADILLA">
		 <option value="FANZARA">
		 <option value="FIGUEROLES">
		 <option value="FORCALL">
		 <option value="FUENTE LA REINA">
		 <option value="FUENTES DE AYODAR">
		 <option value="GAIBIEL">
		 <option value="GELDO">
		 <option value="HERBES">
		 <option value="HIGUERAS">
		 <option value="LA JANA">
		 <option value="JERICA">
		 <option value="LA LLOSA">
		 <option value="LA POBLA TORNESA">
		 <option value="LUCENA DEL CID">
		 <option value="LUDIENTE">
		 <option value="LA MATA DE MORELLA">
		 <option value="MATET">
		 <option value="MONCOFA">
		 <option value="MONTAN">
		 <option value="MONTANEJOS">
		 <option value="MORELLA">
		 <option value="NAVAJAS">
		 <option value="NULES">
		 <option value="OLOCAU DEL REY">
		 <option value="ONDA">
		 <option value="ORPESA">
		 <option value="PALANQUES">
		 <option value="PAVIAS">
		 <option value="PEÑISCOLA">
		 <option value="PINA DE MONTALGRAO">
		 <option value="POBLA DE BENIFASSA">
		 <option value="PORTELL DE MORELLA">
		 <option value="PUEBLA DE ARENOSO">
		 <option value="RIBESALBES">
		 <option value="ROSELL">
		 <option value="SACAÑET">
		 <option value="SALZADELLA">
		 <option value="SAN JORGE">
		 <option value="SAN JUAN DE MORÓ">
		 <option value="SAN RAFAEL DEL RIO">
		 <option value="SANT MATEU">
		 <option value="SANTA MAGDALENA DE PULPIS">
		 <option value="SARRATELLA">
		 <option value="SEGORBE">
		 <option value="SIERRA ENGARCERAN">
		 <option value="SONEJA">
		 <option value="SOT DE FERRER">
		 <option value="SUERAS">
		 <option value="TALES">
		 <option value="TERESA">
		 <option value="TIRIG">
		 <option value="TODOLELLA">
		 <option value="TOGA">
		 <option value="TORAS">
		 <option value="EL TORO">
		 <option value="TORRALBA DEL PINAR">
		 <option value="LA TORRE D'EN BESORA">
		 <option value="TORRE ENDOMENECH">
		 <option value="TORREBLANCA">
		 <option value="TORRECHIVA">
		 <option value="TRAIGUERA">
		 <option value="LES USERES">
		 <option value="VALL D'ALBA">
		 <option value="LA VALL D'UIXO">
		 <option value="VALL DE ALMONACID">
		 <option value="VALLAT">
		 <option value="VALLIBONA">
		 <option value="VILA-REAL">
		 <option value="VILAFAMES">
		 <option value="VILANOVA D'ALCOLEA">
		 <option value="VILAR DE CANES">
		 <option value="VILAFRANCA">
		 <option value="VILLAHERMOSA">
		 <option value="VILLAMALUR">
		 <option value="VILLANUEVA DE VIVER">
		 <option value="VILLAVIEJA">
		 <option value="VILLORES">
		 <option value="VINAROS">
		 <option value="VISTABELLA DEL MAESTRAZGO">
		 <option value="VIVER">
		 <option value="ZORITA DEL MAESTRAZGO">
		 <option value="ZUCAINA">
		 <option value="MANCOMUNIDAD ESPADAN-MIJARES">
		  
		</datalist>
</jsp:body>

</t:paginabasica>
</div>