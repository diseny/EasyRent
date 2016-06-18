<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<t:paginabasica title="EasyRent">
<jsp:body>
	</div></div>
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
	</div>
	<div class="col-md-12">
	<div class="col-md-6 " style="margin-top:30px">
		<div class="col-md-12">
		<h4>Selecciona servicios:</h4>
		<c:forEach items="${allServices}" var="service" varStatus="loopServices">
			<div class="selecter col-md-4">
			<input type="checkbox" name="${service.name}" id="${service.name}" onclick="actualizaPorServicios('${service.name}')">
			<label >  ${service.name}</label> 
			</div>
		</c:forEach>
		<br>
			
			
		</div>
		<div class="col-md-12" id="mapaTit">
		<h4>Busca en el mapa:</h4>
		</div >
		  <div class="col-md-12" id="map"></div>
			</div>
	
	<div class="col-md-6" style="height:800px;overflow: scroll;   border-left: 5px;border-style: solid;border-bottom: 0px;border-right: 0px;border-top: 0px;
	">
	<div class="col-md-12" style="min-height:70px;">
	<h4 class="col-md-4">Ordenar por :</h4>
	<select class="col-md-8 selecter-options" style="margin-top: 17px;"onchange="post()" id="orderSelect">
		<option value="${pageContext.request.contextPath}/property/listOrderTitleDown.html" class="selecter-item">Titulo ascendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderTitleUp.html" class="selecter-item">Titulo descendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderCapacityDown.html" class="selecter-item">Capacidad ascendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderCapacityUP.html" class="selecter-item">Capacidad descendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderRoomsDown.html" class="selecter-item">Habitaciones ascendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderRoomsUp.html" class="selecter-item">Habitaciones descendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderBathroomsDown.html" class="selecter-item">Baños ascendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderBathroomsUp.html" class="selecter-item">Baños descendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderBedsDown.html" class="selecter-item">Camas ascendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderBedsUp.html" class="selecter-item">Camas descendente</option>
		
		<option value="${pageContext.request.contextPath}/property/listOrderMetersDown.html" class="selecter-item">Tamaño ascendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderMetersUp.html" class="selecter-item">Tamaño descendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderStreetDown.html" class="selecter-item">Calle ascendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderStreetUp.html" class="selecter-item">Calle descendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderCityDown.html" class="selecter-item">Ciudad ascendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderCityUp.html" class="selecter-item">Ciudad descendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderPriceDown.html" class="selecter-item">Precio ascendente</option>
		<option value="${pageContext.request.contextPath}/property/listOrderPriceUp.html" class="selecter-item">Precio descendente</option>
	
	
	</select>
	
	</div>
	<c:forEach items="${properties}" var="property" varStatus="loop">
		<div class="col-md-6 propertyResult prop${loop.index}
		<c:forEach items="${services}" var="service" varStatus="loopServices">
			<c:if test="${property.id == service.propertyId}" >
	   			<c:out value="${service.serviceName}"/>
			</c:if>
		</c:forEach>
		">
			<div class="propData">
			<div class="col-md-7 tit">
				<h5 class="col-md-12 title"><a href="info/${property.id}.html">${property.title}</a></h5>
				
				<p class="col-md-12 subtit"> ${property.city} </p>
				<div class="col-md-12">
					<div class="col-md-4">
					<img src="${pageContext.request.contextPath}/images/habitaciones.png" style="height:25px;width:25px">
			<h4>${property.numRooms}</h4>
					</div>
					<div class="col-md-4">
					<img src="${pageContext.request.contextPath}/images/personas.png" style="height:25px;width:25px">
			<h4>${property.capacity}</h4>
					</div>
					<div class="col-md-4">
					<img src="${pageContext.request.contextPath}/images/cama.png" style="height:25px;width:25px">
			<h4>${property.numBeds}</h4>
					</div>
				</div>
			</div>
				<h4 class="col-md-5 price">${property.dailyPrice} e</h4>
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
</div>
</jsp:body>
</t:paginabasica>
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
		  
    <script type="text/javascript">
    var geocoder;
    var map;
  
		var map;
		var pos = new google.maps.LatLng(37.774807, -3.795573);
		 
		var marker = new google.maps.Marker({
		      position: pos,
		      map: map,
		      title:"Esto es un marcador",
		      animation: google.maps.Animation.DROP
		  });

		function initMap() {
			 geocoder = new google.maps.Geocoder();
			 var mapOptions = {
			          center: new google.maps.LatLng(39.9874581, -0.0655726,14),
			          zoom: 11,
			          mapTypeId: google.maps.MapTypeId.ROADMAP
			        };
			        var map = new google.maps.Map(document.getElementById("map"),
			            mapOptions);
			 
			        var pos = new google.maps.LatLng(39.9874581, -0.0655726,14);
			      
			      
			     	
			     	<c:forEach items="${properties}" var="property" varStatus="loop">
			        	
			        	 if (geocoder) {
					            geocoder.geocode({
					              'address': "<c:out value="${property.street}"/>".concat(",").concat("<c:out value="${property.city}"/>")
					            }, function(results, status) {
					              if (status == google.maps.GeocoderStatus.OK) {
					                if (status != google.maps.GeocoderStatus.ZERO_RESULTS) {
					                  map.setCenter(results[0].geometry.location);

					                  var infowindow = new google.maps.InfoWindow({
					                    content: '<b>' + "<c:out value="${property.street}"/>" + '</b>',
					                    size: new google.maps.Size(150, 50)
					                  });

					                  var marker = new google.maps.Marker({
					                    position: results[0].geometry.location,
					                    map: map,
					                    title: "<c:out value="${property.street}"/>"
					                  });
					                  google.maps.event.addListener(marker, 'click', function() {
					                    infowindow.open(map, marker);
					                  });

					                } else {
					                  alert("No results found");
					                }
					              } else {
					                alert("Geocode was not successful for the following reason: " + status);
					              }
					            });
					          }
			        	
			        	  </c:forEach>
			       
		}

    </script>
    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDjoiZmMqIjBa3tXXXbTf4Lyu0PDxqHxuQ&callback=initMap">
    </script>
		

	<script>
	
		
		
		$(document).ready(function() {
			var hoy = new Date();
			$('#datePickerInit').datepicker({
				autoclose : true,
				format : 'dd/mm/yyyy',
				startDate : hoy,
				
			})	;
			$('#datePickerInit').on('changeDate', function(e) {
				// Revalidate the date field
				dateInit = new Date($('#datePickerInit').datepicker("getDate"));
				$('#datePickerEnd input').prop('disabled', false);
				$('#datePickerEnd').datepicker({
					autoclose : true,
					format : 'dd/mm/yyyy',
					startDate: dateInit,
				})
			});
			
			
			
			$("select").dropdown();
			  $('input').iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			  });
				
			<c:forEach items="${allServices}" var="property" varStatus="loop">
       		var id= '#'.concat('<c:out value="${property.name}"/>');
       		$(id).on("ifChanged", function(){
       			actualizaPorServicios('<c:out value="${property.name}"/>')
			 	});
       	  </c:forEach>
					
		});
		var servicios=[]
		function actualizaPorServicios(servicio){
			
			id='#'.concat(servicio);
			if($.inArray(servicio, servicios)&& $(id).is(':checked')){
				servicios.push(servicio)
			}else{
				var elem = servicios.indexOf(servicio);
				
				if(elem != -1) {
					servicios.splice(elem, 1);
				}
			}
			<c:forEach items="${properties}" var="property" varStatus="loop">
				mostrar = true;
				for(i=0;servicios.length>i;i++){
					if(!$('.prop<c:out value="${loop.index}"/>').hasClass(servicios[i])){
						$('.prop<c:out value="${loop.index}"/>').css('display','none');
						mostrar=false;
					}
				}
				if(mostrar){
					$('.prop<c:out value="${loop.index}"/>').css('display','block');
				}
				
			</c:forEach>
			
			
			
		}	
	
	
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
		
		function post(){
			 var selectBox = document.getElementById("orderSelect");
			 var path = selectBox.options[selectBox.selectedIndex].value;
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
		
		
		