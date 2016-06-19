<%@page contentType="text/html; charset=iso-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
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
	<c:choose>
	<c:when test='${user.role == "Owner"}'>
	
			
<form:form method="post" modelAttribute="property" id="basic" enctype="multipart/form-data">
	<div class="row">
	<div class="col-md-12" >
		<div class="col-md-10 col-md-offset-1">
		<h1>Añadir Propiedad</h1>
		<hr>
	</div>
	<!--  DETALLES BÁSICOS -->
	<div class="col-md-12" style="min-height:230px;">
		<div class="col-md-10 col-md-offset-1">
		
		<h4><li>Detalles básicos</li></h4>
		
		
		
		<!-- Aqui empieza el form:form -->
		
		
<form:input type="hidden"  path="id" value="${numProp}" />
			<form:input type="hidden"  path="ownerUsername" value="${user.username}"/>
		
				
			<div class="col-md-6">
				<div class="col-md-12" style="margin-bottom:10px;padding-right: 30px">
				
					<form:label path="title">Título</form:label>
					<form:input class="form-control" type="text" path="title"  placeholder="Título"/>
					<form:errors path="title"/>
				</div>
				<div class="col-md-12" style="margin-bottom:10px;padding-right: 30px">
					<form:label path="description">Description</form:label>
					<form:textarea class="form-control"  type="text" path="description" maxlength="300" autocomplete="true" placeholder="Descripción(máx. 300 carácteres)" style="min-height:100px;max-width:100%" ></form:textarea>
					<form:errors path="description"/>
				</div>
				<div class="col-md-12" style="text-align :left">
					<div class="col-md-4" style="padding:0">
						<div class="col-md-12" style="padding:0" >
							<form:label path="capacity">Capacidad</form:label>
						</div>
						<div class="col-md-12"  style="margin-bottom:10px;padding-left:0">
							<form:input class="form-control" min="0" type="number" path="capacity"/>
							<form:errors path="capacity"/>
						</div>
					</div>
					<div class="col-md-4" style="padding:0">
						<div class="col-md-12" style="padding:0">
							<form:label path="numRooms">Habitaciones</form:label>
						</div>
						<div class="col-md-12"  style="margin-bottom:10px;padding-left:0">
							<form:input min="0"  class="form-control" type="number" path="numRooms" />
							<form:errors path="numRooms"/>
						</div>
					</div>
					<div class="col-md-4" style="padding:0">
						<div class="col-md-12" style="padding-left:0" >
							<form:label path="numBathrooms">Baños</form:label>
						</div>
						<div class="col-md-12"  style="margin-bottom:10px;padding-left:0">
							<form:input min="0" class="form-control"  type="number" path="numBathrooms" />
							<form:errors path="numBathrooms"/>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				
				<div class="col-md-12" style="text-align :left">
				
					<div class="col-md-4" style="padding:0">
						<div class="col-md-12" style="padding-left:0" >
							<form:label path="numBeds">Camas</form:label>
						</div>
						<div class="col-md-12"  style="margin-bottom:10px;padding-left:0">
							<form:input min="0" class="form-control" type="number" path="numBeds" />
							<form:errors path="numBeds"/>
						</div>
					</div>
					<div class="col-md-4" style="padding:0">
						<div class="col-md-12" style="padding-left:0" >
							<form:label path="squareMeters">Metros<sup>2</sup></form:label>
						</div>
						<div class="col-md-12"  style="margin-bottom:10px;padding-left:0">
							<form:input min="0" type="number" class="form-control"  path="squareMeters" />
							<form:errors path="squareMeters"/>
						</div>
					</div>
					<div class="col-md-4" style="padding:0">
						<div class="col-md-12" style="padding-left:0" >
							<form:label path="dailyPrice">Precio/día</form:label>
						</div>
						<div class="col-md-12"  style="margin-bottom:10px;padding-left:0">
							<form:input min="0" type="number"  class="form-control" path="dailyPrice" />
							<form:errors path="dailyPrice"/>
						</div>
					</div>
				</div>
				<div class="col-md-12" style="margin-bottom:10px;padding-right: 30px">
					<form:label path="city">Ciudad</form:label>
					<form:input class="form-control" type="text" path="city" placeholder="Ciudad"  list="municipios"/>
					<form:errors path="city"/>
				</div>
				<div class="col-md-12" style="margin-bottom:10px;padding-right:30px;">
					<form:label path="street">Calle</form:label>
					<form:input class="form-control" type="text" path="street" placeholder="Calle"/>
					<form:errors path="street"/>
				</div>
				<div class="col-md-12" style="text-align :left">
					
					<div class="col-md-6" style="padding:0">
						<div class="col-md-12" style="padding-left:0" >
							<form:label path="number">Número</form:label>
						</div>
						<div class="col-md-12"  style="margin-bottom:10px;padding-left:0">
							<form:input min="0" type="number" path="number"  class="form-control"/>
							<form:errors path="number"/>
						</div>
					</div>
					<div class="col-md-6" style="padding:0">
						<div class="col-md-12" style="padding-left:0" >
							<form:label path="floor">Piso</form:label>
						</div>
						<div class="col-md-12"  style="margin-bottom:10px;padding-left:0">
							<form:input min="0" type="number"  class="form-control" path="floor" />
							<form:errors path="floor"/>
						</div>
					</div>
				</div>
				
			</div>
				
		
		
	
		</div>
		
		
		
	<!-- Aqui finaliza el form:form -->
		</div>
		
		</div>
	</div>
	
	
		
		</div>
		
	</div>
		<div class="col-md-12" style="min-height:230px;background-color: rgba(0, 255, 253, 0.048039);">
			<div class="col-md-10 col-md-offset-1">
			<h4><li>Servicios</li></h4>
			<c:forEach items="${allServices}" var="servicios" varStatus="loopServicios">
				
					<div class=" serviciosInfo col-md-4" id="select-${loopServicios.index}">
						<input type="checkbox" name="${servicios.name}" id="${servicios.name}" >
						<label >  ${servicios.name}</label> 
					</div>
				
			</c:forEach>
	
			
			</div>
		</div> 
	
		

		
	
	<div class="col-md-12" style="min-height:230px;background-color: rgba(0, 0, 0, 0.098039);">
		<div class="col-md-10 col-md-offset-1">
		<!--  Está lo visual, falta añadir  -->
		<h4><li>Fecha Disponible</li></h4>
		<div class="col-md-12 ">
		<div class="fechDis">
		<div class="col-md-5 addDate">
			<div class="col-md-5 ">
			<p>Inicio:</p> 
			
			<div class="input-group input-append date" id="datePickerInit">
				<input class="form-control" type="text"  ></input>
			    <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
           	</div>
			</div>
			<div class="col-md-5">
			<p>
			Fin: </p>
			<div class="input-group input-append date" id="datePickerEnd">
			 	<input class="form-control" type="text" ></input>
			    <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
           	</div>
           	</div>
           	<a class="col-md-2 btn btn-success" onclick="anyadeFecha()" id="okButton" disabled style="margin-top:30px" >OK</a>
		</div>
		</div>
		<div class="col-md-5 col-md-offset-2" id="listaFechas">
			<ul style="padding: 0;margin-left: -40px;">Fecha guardada: </ul>
		</div>
		
		
		<script>
			var i=0;
			function anyadeFecha(){
				
				var fechaIni= $('#datePickerInit').datepicker("getDate");
				var dateIni= new Date(fechaIni);
				var mesIni =  dateIni.getMonth()+1;
				var diaIni =  dateIni.getDate();
				var anyoIni = dateIni.getFullYear();
				var startDate= anyoIni.toString().concat('-').concat(mesIni.toString()).concat('-').concat(diaIni.toString());
				$('#startDate').val(startDate);
				var fechaFin= $('#datePickerEnd').datepicker("getDate");
				var dateFin= new Date(fechaFin);
				var mesFin =  dateFin.getMonth()+1;
				var diaFin =  dateFin.getDate();
				var anyoFin = dateFin.getFullYear();
				$('#finishDate').val(anyoFin.toString().concat('-').concat(mesFin.toString()).concat('-').concat(diaFin.toString()));
				$('#showDates').remove();
				$('#listaFechas').append("<li style='margin-left:-40px' id='showDates'> Fecha Inicio : " + diaIni + "/" + mesIni +"/" + anyoIni +"--- Fecha Fin : " + diaFin + "/" + mesFin +"/" + anyoFin + '<a onclick="editarFecha()" style="cursor:pointer"> Editar </a><a onclick="borraFecha()" style="color:red;cursor:pointer">  Borrar</a>');
				
				$('#listaFechas').append("</li>");
				$('.addDate').remove();
				$('.fechDis').append('<div class="col-md-5 addDate"><div class="col-md-5 ">'+
				'<p>Inicio:</p>'+ 
				
				'<div class="input-group input-append date" id="datePickerInit">'+
				'	<input class="form-control" type="text"  ></input>'+
				'    <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>'+
	           '	</div>'+
				'</div>'+
				'<div class="col-md-5">'+
				'<p>'+
				'Fin: </p>'+
				'<div class="input-group input-append date" id="datePickerEnd">'+
				' 	<input class="form-control" type="text" ></input>'+
				'    <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>'+
	           '	</div>'+
	           '	</div>'+
	           '	<a class="col-md-2 btn btn-success" onclick="anyadeFecha()" id="okButton" disabled style="margin-top:30px" >OK</a>'+
	           '</div>');
				
				datePick();
				
			}
			
			function editarFecha(){
				$('#datePickerInit .form-control').focus();
			}
			function borraFecha(){
				var id= '#showDates'.concat();
				$('#startDate').val(" ");
				$('#finishDate').val(" ");
				$(id).remove();
			}
			
			
			
			  function submitForm (){
				  for(var i =0; i<9;i++){
						 var id= '#select-'.concat(i).concat(' .icheckbox_flat');
						if($(id).hasClass('checked')){
							var inputID= "#prop".concat(i);
							$(inputID).val(1);
						}if(!$(id).hasClass('checked')){
							var inputID= "#prop".concat(i);
							$(inputID).val(0);
						}
					}
					
				  
				  $('#basic').submit();
				
				  }

		</script>
		
		
		</div>
		
		</div>
		<div class="col-md-10 col-md-offset-1" style="min-height:116px";>
			<p style="position: absolute;top: 85px;">*En la página de editar la propiedad podrá cambiar está fecha y añadir más</p>
		</div>
		

	</div>
	<div class="col-md-12" style="min-height:230px">
		<div class="col-md-10 col-md-offset-1">
		<h4><li>Añadir imagen destacada</li></h4>
			<div class="col-md-6">
		<form:form method="post" modelAttribute="addProperty" id="basic2">
					<form:input type="hidden" path="propertyId" value="${numProp }" />
			 		<form:input type="hidden" path="periodId" value="0"/>
			 		<form:input type="hidden" path="start" id="startDate" value="" />
			 		<form:input type="hidden" path="finish" id="finishDate" value=""  />
				 	<form:input type="hidden"  path="piscina" id="prop0"/>
					<form:input type="hidden"  path="jacuzzi" id="prop1"  />
					<form:input type="hidden"  path="gimnasio"  id="prop2" />
					<form:input type="hidden"  path="balcon" id="prop3" />
					<form:input type="hidden"  path="parque" id="prop4" />
					<form:input type="hidden"  path="jardin"  id="prop5" />
					<form:input type="hidden"  path="wifi" id="prop6" />
					<form:input type="hidden"  path="television"  id="prop7" />
					<form:input type="hidden"  path="cocina" id="prop8"  />
					<form:input type="file" accept="image/*" path="fichero" onchange="loadFile(event)" />
					<form:input type="text" class="form-control" path="caption" placeholder="Titulo"/>
				</form:form>
	
		
		</div>
		<div class="col-md-6"><img style="margin-bottom:30px"id="output"/></div>
			<script>
			  var loadFile = function(event) {
			    var output = document.getElementById('output');
			    output.src = URL.createObjectURL(event.target.files[0]);
			    $('#output').css('height','250');
			    
			  };
			</script>
	
   	
		</div>
		
		
	</div>
	
	

	
	
	<div class="col-md-12" style="text-align:center" >
	<input onclick="submitForm()" class="btn btn-success" value="Añade propiedad" />
	</div>
			
	
	<script>
	function datePick(){
		$("select").dropdown();
		  $('input').iCheck({
		    checkboxClass: 'icheckbox_flat',
		    radioClass: 'iradio_flat'
		  });
			var hoy = new Date();
		  $('#datePickerInit').datepicker({
				autoclose : true,
				format : 'dd/mm/yyyy',
				startDate : hoy,
				
			});	
			
			$('#datePickerInit').on('changeDate', function(e) {	
				dateInit = new Date($('#datePickerInit').datepicker("getDate"));
				$('#datePickerEnd input').prop('disabled', false);
				$('#datePickerEnd').datepicker({
					autoclose : true,
					format : 'dd/mm/yyyy',
					startDate: dateInit,
				})
			});
			$('#datePickerEnd').on('changeDate', function(e) {	
				$('#okButton').removeAttr("disabled");
			});
	}
	$("select").dropdown();
	  $('input').iCheck({
	    checkboxClass: 'icheckbox_flat',
	    radioClass: 'iradio_flat'
	  });
		var hoy = new Date();
	  $('#datePickerInit').datepicker({
			autoclose : true,
			format : 'dd/mm/yyyy',
			startDate : hoy,
			
		});	
		
		$('#datePickerInit').on('changeDate', function(e) {	
			dateInit = new Date($('#datePickerInit').datepicker("getDate"));
			$('#datePickerEnd input').prop('disabled', false);
			$('#datePickerEnd').datepicker({
				autoclose : true,
				format : 'dd/mm/yyyy',
				startDate: dateInit,
			})
		});
		$('#datePickerEnd').on('changeDate', function(e) {	
			$('#okButton').removeAttr("disabled");
		});
	
	  
	  </script>
	  	</form:form>
	</c:when>
	<c:otherwise>
	<h1>NO TIENE PERMISO PARA ESTAR AQUí</h1>
	</c:otherwise>
	</c:choose>
	
</jsp:body>
</t:paginabasica>
</html>

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
		