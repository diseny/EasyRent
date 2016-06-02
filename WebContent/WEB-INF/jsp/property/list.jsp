<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<t:paginabasica title="EasyRent">
<jsp:body>
	</div></div>
	
	<div class="col-md-12">
	<div class="col-md-6 ">
		<div class="col-md-12 camposBusqueda">
		<form:form id="searchList" method="post" modelAttribute="property">
			<div class="col-md-12">
				<div class="col-md-5 sm" >
				<form:input style=" height: 100%;" id="city" class="form-control" type="city" path="city" list="municipios" placeholder="Ciudad"/>
				</div>
				<div class="col-md-3 sm">
			        <div class="col-md-12">
			
				        <div class="form-group">
				       		<div class="date">
				           		<div class="input-group input-append date" id="datePickerInit">
				            	    <form:input class="form-control" type="text" path="startDate"  style="width:120px"/>
				                	<span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
				            	</div>
				       	 	</div>
				        </div>
				    </div>
				</div>
				<div class="col-md-3 sm">
					<div class="col-md-12">
		        <div class="form-group">
		       		<div class="date">
		           		<div class="input-group input-append date" id="datePickerEnd">
		            	    <form:input class="form-control" type="text" path="finishDate" style="width:120px" disabled="true" />
		                	<span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
		            	</div>
		       	 	</div>
		        </div>
		    </div>
	    </div>
	    <div class="showMore">
	    	<div class="col-md-6 sm "><p class="btn btn-primary" onclick="verMas()">Ver más</p></div>
	    	<div class="col-md-6 sm"><button class="btn btn-success" type="submit">Buscar</button></div>
	    	</div>
		</div>
		<div class="avanzado">
		<div class="col-md-12">
		
			<div class="col-md-4 sm ">
				<div class="col-md-12">
					<form:label path="capacity">Capacidad:</form:label>
				</div>
				<div class="col-md-12">
					<form:input class="form-control" id="capacity" type="number"  min="0"  path="capacity" placeholder="Capacidad"/>
				</div>
			</div>
			<div class="col-md-4 sm">
				<div class="col-md-12">
					<form:label path="numRooms">Habitaciones:</form:label>
				</div>
				<div class="col-md-12">
					<form:input class="form-control" id="numRooms" type="number"  min="0" path="numRooms" placeholder="Habitaciones"/>
				</div>
			</div>
			<div class="col-md-4 sm">
				<div class="col-md-12">
					<form:label path="numBathrooms">Baños:</form:label>
				</div>
				<div class="col-md-12">
					<form:input id="numBathrooms" class="form-control " type="number" min="0"  path="numBathrooms" placeholder="BaÃ±os"/>
				</div>
		</div>
		
		</div>
		<div class="col-md-12">
			<div class="col-md-4  sm">
				<div class="col-md-12">
					<form:label path="numBeds">Camas:</form:label>
				</div>
				<div class="col-md-12">
					<form:input id="numBeds" type="number"  min="0"  class="form-control " path="numBeds" placeholder="Camas"/>
				</div>
			</div>
			
			<div class="col-md-4 sm">
				<div class="col-md-12">
					<form:label path="squareMeters">m<sup>2</sup>:</form:label>
				</div>
				<div class="col-md-12">
					<form:input id="squareMeters" type="number" class="form-control " min="0" path="squareMeters" placeholder="m2"/>
				</div>
			</div>
			
			
			<div class="col-md-4 sm">
				<div class="col-md-12">
					<form:label path="dailyPrice">Precio(<img src="${pageContext.request.contextPath}/images/euroBlackBackground.png" style="width:10px;height:10px;">/día):</form:label>
				</div>
				<div class="col-md-12">
					<form:input id="dailyPrice" type="number" class="form-control" min="0" path="dailyPrice" placeholder="Precio por dÃ­a"/>
				</div>
			</div>
		</div>
		<div class="col-md-12 sm">
				<form:label path="street">Calle:</form:label>
				<form:input id="street" class="form-control" type="street" path="street" placeholder="Calle"/>
		</div>
			<div class="col-md-6 sm"><p onclick="verMenos()" class="btn btn-primary">Ver menos</p></div>
			<div class="col-md-6 sm"><button class="btn btn-success"type="submit">Buscar</button></div>
		</div>
	
		</form:form>
		</div>
		  <div class="col-md-12" id="map"></div>
    <script type="text/javascript">
		
		var map;
		function initMap() {
		  map = new google.maps.Map(document.getElementById('map'), {
		    center: {lat: -34.397, lng: 150.644},
		    zoom: 8
		  });
		}

    </script>
    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap">
    </script>
		
	</div>
	
	<div class="col-md-6">
	<c:forEach items="${properties}" var="property" varStatus="loop">
		<div class="col-md-6 propertyResult">
			<div class="propData">
				<h5 class="col-md-7 title"><a href="info/${property.id}.html">${property.title}</a></h5>
				<h5 class="col-md-5 price">${property.dailyPrice} e</h5>
			</div>
			<div id="carousel${loop.index }" class="carousel slide prevcarousel" data-ride="carousel">
				<div class="carousel-inner" >	
				<c:set var="i" value="${0}"></c:set>
				<c:forEach items="${images}" var="image" varStatus="loopImages">	
					<c:if test="${property.id == image.ID}" >
						<c:if test="${i!=0}">
							<div class="item" style=" background-image: url('${image.href}')">	
							</div>
						</c:if>
						<c:if test="${i==0}">
							<div class="item active slider" style="background-image: url('${image.href}')">
							</div>
						<c:set var="i" value="${1}"></c:set>
						
    					 
						</c:if>
						
					</c:if>
					 
				</c:forEach>
				
					
					<!-- <a id="slider-left" class="left carousel-control" href="#carousel" data-slide="prev">
       				  <i class="material-icons"></i>
    				 </a>
    				 <a id="slider-right" class="right carousel-control" href="#carousel" data-slide="next">
      			   <i class="material-icons"></i>
     				</a> -->
   				 </div>
   				 <a style="height:30px;width:30px;background-color:#000"id="slider-left" class="left carousel-control" href="#carousel${loop.index }" data-slide="prev">
       				<img id="flechaControl"src="${pageContext.request.contextPath}/images/arrowLeft.gif">
   				 </a>
   				<a style="height:30px;width:30px;background-color:#000" id="slider-right" class="right carousel-control" href="#carousel${loop.index }" data-slide="next">
      			   <img id="flechaControl" src="${pageContext.request.contextPath}/images/arrowRight.gif">
     			</a>
   			</div>
  		</div>
   		</c:forEach>
   		
			<!--<tr class="fons">
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
				
			</tr>-->
		 
	
		
		
	
	
	</div>
	</div>
	
	<div class="col-md-12 camposBusqueda" >
	<form:form id="searchList" method="post" modelAttribute="property">
		<div class="col-md-12 sm" style="height:50px">
			<div class="col-md-7 col-md-offset-1"  style=" height: 100%;margin-top:0px">
				<form:input style=" height: 100%;" id="city" class="form-control" type="city" path="city" list="municipios" placeholder="Ciudad"/>
			
			</div>
			<button type="submit" class="col-md-2 btn btn-primary" style="height:50px">Buscar</button>
		</div>
		<div class="col-md-11 col-md-offset-1">
		<div class="col-md-2  sm">
		<div class="col-md-12">
        	<label>Fecha Inicio</label>
        </div>
        <div class="col-md-12">

	        <div class="form-group">
	       		<div class="date">
	           		<div class="input-group input-append date" id="datePickerInit">
	            	    <form:input class="form-control" type="text" path="startDate"  style="width:120px" />
	                	<span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
	            	</div>
	       	 	</div>
	        </div>
	    </div>
		</div>
		<div class="col-md-2  sm">
		<div class="col-md-12">
        	<label>Fecha Final</label>

        </div>
        <div class="col-md-12">
	        <div class="form-group">
	       		<div class="date">
	           		<div class="input-group input-append date" id="datePickerEnd">
	            	    <form:input class="form-control" type="text" path="finishDate" style="width:120px" disabled="true" />
	                	<span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
	            	</div>
	       	 	</div>
	        </div>
	    </div>
		</div>
		<div class="col-md-2 sm ">
			<div class="col-md-12">
				<form:label path="capacity">Capacidad:</form:label>
			</div>
			<div class="col-md-12">
				<form:input class="form-control" id="capacity" type="number"  min="0"  path="capacity" placeholder="Capacidad"/>
			</div>
		</div>
		<div class="col-md-2 sm">
			<div class="col-md-12">
				<form:label path="numRooms">Habitaciones:</form:label>
			</div>
			<div class="col-md-12">
				<form:input class="form-control" id="numRooms" type="number"  min="0" path="numRooms" placeholder="Habitaciones"/>
			</div>
		</div>
		<div class="col-md-2 sm">
			<div class="col-md-12">
				<form:label path="numBathrooms">Baños:</form:label>
			</div>
			<div class="col-md-12">
				<form:input id="numBathrooms" class="form-control " type="number" min="0"  path="numBathrooms" placeholder="BaÃ±os"/>
			</div>
		</div>
		
		</div>
		<div class="col-md-10 col-md-offset-2">
		<div class="col-md-2  sm">
			<div class="col-md-12">
				<form:label path="numBeds">Camas:</form:label>
			</div>
			<div class="col-md-12">
				<form:input id="numBeds" type="number"  min="0"  class="form-control " path="numBeds" placeholder="Camas"/>
			</div>
		</div>
		
		<div class="col-md-2 sm">
			<div class="col-md-12">
				<form:label path="squareMeters">m<sup>2</sup>:</form:label>
			</div>
			<div class="col-md-12">
				<form:input id="squareMeters" type="number" class="form-control " min="0" path="squareMeters" placeholder="m2"/>
			</div>
		</div>
		<div class="col-md-2 sm">
			<form:label path="street">Calle:</form:label>
			<form:input id="street" class="form-control" type="street" path="street" placeholder="Calle"/>
		</div>
		
		<div class="col-md-2 sm">
			<div class="col-md-12">
				<form:label path="dailyPrice">Precio(<img src="${pageContext.request.contextPath}/images/euroBlackBackground.png" style="width:10px;height:10px;">/día):</form:label>
			</div>
			<div class="col-md-12">
				<form:input id="dailyPrice" type="number" class="form-control" min="0" path="dailyPrice" placeholder="Precio por dÃ­a"/>
			</div>
		</div>
		</div>
		
	</form:form>
	</div></div>
	<div class="container">
	<div class="row">
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
	<script>
	
		$(document).ready(function() { $('.propertyResult .carousel').carousel('pause');});
	
		
	
		function verMas(){
			$('.avanzado').addClass("show");
			$('.showMore').css('display','none');
		}
		function verMenos(){
			$('.avanzado').removeClass("show");
			$('.showMore').css('display','block');
			
		}
		$(document).ready(function() {
			
			var dateInit = new Date($('#datePickerInit').datepicker("getDate"));
			
			var today = new Date();
			hoy = new Date(today);
			//today = mm+'/'+dd+'/'+yyyy;
			console.log(today)
		    $('#datePickerInit')
		        .datepicker({
		        	  autoclose: false,    // It is false, by default
		        	  format: 'dd/mm/yyyy',
		        	  startDate: hoy, 
	                   
		        })
		        .on('changeDate', function(e) {
		            // Revalidate the date field
		        	 dateInit = new Date($('#datePickerInit').datepicker("getDate")); 
		            
		        	 $('#datePickerEnd input').prop('disabled', false);
		          $('#datePickerEnd').datepicker({
		 	            format: 'mm/dd/yyyy',
		 	            startDate: dateInit, 
		 	        })
					
		        });
		   console.log(dateInit)
		});
		
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
		
		
		