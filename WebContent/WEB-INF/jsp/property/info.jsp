<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="carousel-imagenes">
	<!-- Vamos a hacer un slider de prueba , pero tiene que coger las imagenes de la base de datos -->
	<div id="carousel" class="carousel slide prevcarousel" data-ride="carousel">
		<div class="carousel-inner" >
		<c:set var="i" value="${0}"></c:set>
				<c:forEach items="${images}" var="image" varStatus="loopImages">	
					<c:if test="${property.id == image.ID}" >
						<c:if test="${i!=0}">
							<div class="item" style=" background-image: url('${image.href}');height:100%;;background-size: 50%;background-position: 50%; background-repeat: no-repeat;">	
								<img  id="close-icon" onclick="closeSlider()" src='${pageContext.request.contextPath}/images/closeIcon.png'/>
							</div>
						</c:if>
						<c:if test="${i==0}">
							<div class="item active slider" style="background-image: url('${image.href}');height:100%;;background-size: 50%;background-position: 50%; background-repeat: no-repeat;">
							<img  id="close-icon" onclick="closeSlider()" src='${pageContext.request.contextPath}/images/closeIcon.png'/>
							</div>
						<c:set var="i" value="${1}"></c:set>
						
    					 
						</c:if>
						
					</c:if>
					 
				</c:forEach>
		 	
		</div>
	<a id="slider-left" class="left carousel-control" href="#carousel" data-slide="prev">
         <i class="material-icons"></i>
     </a>
     <a id="slider-right" class="right carousel-control" href="#carousel" data-slide="next">
         <i class="material-icons"></i>
     </a>
    </div>
   
	<div id="thumbcarousel" class=" carousel slide thumbscarousel" data-interval="false">
	    <div class="carousel-inner">
		    <div class="item active row">
		    	<c:forEach items="${images}" var="image" varStatus="loopImages">	
					<c:if test="${property.id == image.ID}" >
						<div data-target="#carousel" data-slide-to="${loopImages.index }"  class="thumb col-md-2 col-md-offset-2" style="height:100px;background-image: url('${image.href}');background-size: cover;background-position: 100%; background-repeat: no-repeat;">
							</div>
					</c:if>
					 
				</c:forEach>
		 	
		   		
		 	</div>
	  <!-- 
	  Si hay mas de cuatro imagenes: 
	  <a id="slider-left" class="left carousel-control" href="#thumbcarousel" data-slide="prev">
                        <i class="material-icons"></i>
      </a>
      <a id="slider-right" class="right carousel-control" href="#thumbcarousel" data-slide="next">
          <i class="material-icons"></i>
      </a>	 -->		
      	</div>	
    </div>
</div>
<!-- AHORA LA PÁGINA -->
<t:paginabasica title="EasyRent">
<jsp:body>
</div></div>
	<br><br><br>
	<c:choose>
		<c:when test='${user == null}'>
  		</c:when>
  		<c:otherwise>
	  		<c:choose>
				<c:when test='${user.role == "Tenant"}'>
					<div class="row">
					<form:form id="book" method="post" modelAttribute="property">
					<div class="menuAlquilar">
						<div class="col-md-12 " style="height:100px">
							<div class="col-md-3 col-md-offset-1"><h4>Precio: </h4></div>
							<div class="col-md-8" ><h4 style="text-align:right">${property.dailyPrice} €</h4></div>
						</div>
						<hr>
						<div class="col-md-12 " style="height:250px">
							<div class="col-md-4">
								<label>Personas:</label>
							</div>
							<div class="col-md-6 ">
								<form:input class="form-control" value="1" type="number" min="1" max="${property.capacity}" path="numPeople" placeholder="Nº personas"></form:input>
							</div>
							<div class="col-md-11 " style="margin-top:34px">
							<div class="col-md-4 ">
								<form:input type="hidden" path="dailyPrice"></form:input>
								<label>Inicio: </label>
								</div>
								<div class="col-md-6 ">
								<div class="input-group input-append date" id="datePickerInit">
				            	    <form:input class="form-control" type="text" path="startDate"  style="width:120px" ></form:input>
				                	<span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
				            	</div>
								</div>
								</div>
								<div class="col-md-11 " style="margin-top:35px">
								<div class="col-md-4 ">
								<label>Final: </label>
								</div>
								<div class="col-md-6">
								<div class="input-group input-append date" id="datePickerEnd">
					           	    <form:input class="form-control" type="text" path="finishDate" style="width:120px" disabled="true" ></form:input>
					               	<span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
						        </div>
								</div>
								</div>
								<div class="col-md-11 " style="margin-top:35px">
								</div>
						</div>
						<div class="col-md-12" style="height:100px;border-bottom:0">
							<button type="submit" style="margin-top: 19px;height: 62px;"class="btn btn-success col-md-10 col-md-offset-1"><h4>ALQUILAR</h4></button>
						</div>
					</div>
					</form:form>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
	   	</c:otherwise>
  	</c:choose>
	
	<div class="col-md-12" style="min-height:230px;background-color: rgba(0, 0, 0, 0.098039);">
		<div class="col-md-10 col-md-offset-1">
		<h1>${property.title }</h1>
		<h6 class="locStreetList col-md-12">
		  ${property.city} · ${property.street}, ${property.number} · 
		  <c:choose>
		  <c:when test='${average == null}'>
		  	(Sin puntuaciones)
		  </c:when>
		  <c:otherwise>
		  	<img style="width:100px;height:15px;" alt="" src="${pageContext.request.contextPath}/images/star${average}.png">		  
		  </c:otherwise>
		  </c:choose>
		</h6>  

		<div class="col-md-12">
			<div class="col-md-1" style="text-align:center">
			<img src="${pageContext.request.contextPath}/images/habitaciones.png" style="height:50px;width:50px">
			<h4>${property.numRooms}</h4>
			
			</div>
			<div class="col-md-1" style="text-align:center">
			<img src="${pageContext.request.contextPath}/images/personas.png" style="height:50px;width:50px">
			<h4>${property.capacity}</h4>
			
			</div>
			<div class="col-md-1" style="text-align:center">
			<img src="${pageContext.request.contextPath}/images/cama.png" style="height:50px;width:50px">
			<h4>${property.numBeds}</h4>
			
			</div>
			<h3>
				
				
				
				</h3>
		</div>
		</div>
		
	</div>

	<div class="col-md-12" style="min-height:250px;background-color:transparent">
	<div class="col-md-4 col-md-offset-1">
		<h4>Detalles</h4><hr>
		<ul>
		<li><h6>Capacidad: ${property.capacity} personas </h6></li>
		<li><h6>Habitaciones: ${property.numRooms} </h6></li>
		<li><h6>Camas: ${property.numBeds}</h6></li>
		<li><h6>Baños: ${property.numBathrooms}</h6></li>
		<li><h6>Tamaño: ${property.squareMeters} m<sup>2</sup></h6></li></ul>
		
	</div>

	<div class="col-md-4 fotosInfo" style="height:300px ;width:455px;background-image: url('${images[0].href}');background-size: cover;background-position: 100%; background-repeat: no-repeat;">
		<h1>FOTOS</h1>
	</div>
	</div>
	<div class="col-md-12" style="min-height:250px;background-color:rgba(0, 255, 253, 0.048039);">
		<div class="col-md-11 col-md-offset-1">
		<h4>Descripción </h4><hr>
		<h6>${property.description }</h6>
		</div>
	</div>
	<div class="col-md-12" style="min-height:250px">
		<div class="col-md-8 col-md-offset-1">
		<h4>Servicios </h4><hr>
		
		<c:forEach items="${allServices}" var="servicios" varStatus="loopServicios">
			<c:set var="i" value="${0}"></c:set>
			<c:forEach items="${services}" var="service" varStatus="loopServicios">
				<c:if test="${property.id == service.propertyId}" >
					<c:if test="${service.serviceName == servicios.name}" >
						<c:set var="i" value="${1}"></c:set>
					</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${i!=0}">
				<div class="serviciosInfo col-md-4">
					<input type="radio" name="${servicios.name}" id="${servicios.name}" checked><label >  ${servicios.name}</label> 
				</div>
			</c:if>
			<c:if test="${i==0}">
				<div class="serviciosInfo col-md-4">
					<input type="radio" name="${servicios.name}" id="${servicios.name}" disabled ><label >  ${servicios.name}</label> 
				</div>
			</c:if>
		</c:forEach>
		</div>
	</div>	
		
	<div class="col-md-12" style="min-height:100px">
	<div class="col-md-8 col-md-offset-1">
	<h4>Puntuaciones</h4>
		<c:choose>
		  <c:when test='${average == null}'>
		  	(Sin puntuaciones)
		  </c:when>
		  <c:otherwise>
			<table class="table table-striped navProperty" style="text-align:center;">
	      		<tr> 
					<th>#</th>
					<th>Puntuación</th>
					<th>Cliente</th>
					<th>Comentarios</th>
				</tr>
				<c:forEach items="${punctuations}" var="punctuation" varStatus="loop">
					<tr class="fons">
						<td>${loop.index + 1}</td>
						<td>${punctuation.punctuation}</td>
						<td>${punctuation.username}</td>
						<td style="text-align:justify">${punctuation.comments}</td>
					</tr>
				</c:forEach> 
			</table>
			</c:otherwise>
		</c:choose>
	</div>	
	</div>
		
	 <div class="col-md-12" style="background-color:rgba(0, 255, 253, 0.048039);">
	 	<div class="col-md-11 col-md-offset-1"><h4>Aquí está</h4><hr></div>
		<div class="col-md-7 col-md-offset-1" id="map">
		
		</div> 
	 </div>
	
	<script>

	
	$(document).ready(function(){
			var disabledDates=[];
			<c:forEach items="${reservas}" var="reserva" varStatus="loop">
				var dates=["<c:out value="${reserva.startDate}"/>","<c:out value="${reserva.finishDate}"/>"];
				disabledDates.push(dates);
			</c:forEach>
			var enabledDates=[];
			<c:forEach items="${periods}" var="period" varStatus="loop">
				var dates=["<c:out value="${period.start}"/>","<c:out value="${period.finish}"/>"];
				enabledDates.push(dates);
			</c:forEach>
		
		var hoy = new Date();
			
		
		function available(date) {
			var mes =  date.getMonth()+1;
			var dia =  date.getDate();
			if(mes<10){
				mes = '0'.concat(mes);
			}
			
			if(dia<10){
				dia = '0'.concat(dia);
			}
			var dmy =  date.getFullYear() + "-" + mes + "-" + dia;
			fechaHoy = new Date(dmy)
			clases =""
			for( var i=0;i<enabledDates.length;i++){
				fechaRangoInicio= new Date(enabledDates[i][0]); 
				fechaRangoFin= new Date(enabledDates[i][1]);
				if(fechaRangoInicio>fechaHoy || fechaRangoFin<fechaHoy){
					clases= clases.concat(' disabled reservado ');
					}
				
			}
			
			for( var i=0;i<disabledDates.length;i++){
				fechaRangoInicio= new Date(disabledDates[i][0]); 
				fechaRangoFin= new Date(disabledDates[i][1]);
			if(fechaRangoInicio<=fechaHoy && fechaRangoFin>=fechaHoy){
				clases= clases.concat(' disabled reservado ');
				}
			
			 }
			return {
	             classes: clases
	          }; 
			

				 
			
		}
		function available2(date) {
			
			var mes =  date.getMonth()+1;
			var dia =  date.getDate();
			if(mes<10){
				mes = '0'.concat(mes);
			}
			
			if(dia<10){
				dia = '0'.concat(dia);
			}
			var dmy =  date.getFullYear() + "-" + mes + "-" + dia;
			
			
			
			fechaHoy = new Date(dmy)
			clases =""
			for( var i=0;i<enabledDates.length;i++){
				
				fechaRangoInicio= new Date(enabledDates[i][0]); 
				fechaRangoFin= new Date(enabledDates[i][1]);
				if(fechaRangoInicio<fechaHoy && fechaRangoFin>fechaHoy){
					if(fechaRangoFin<fechaMinima){
						fechaMinima=fechaRangoFin;	
					}
				}
				
				
			}
			for( var i=0;i<disabledDates.length;i++){
				fechaIni=new Date(disabledDates[i][0])
				if(fechaMinima> fechaIni && dateInit<fechaIni){
					fechaMinima= fechaIni;
				}
			
				
			
			 }
			var mes =  fechaMinima.getMonth()+1;
			var dia =  fechaMinima.getDate()-1;
			if(mes<10){
				mes = '0'.concat(mes);
			}
			
			if(dia<10){
				dia = '0'.concat(dia);
			}
			
			var fin= fechaMinima.getFullYear()+ "-" + mes +"-" + dia;
			fechaMinima= new Date(fin);
			
			
			$('#datePickerEnd').datepicker({
				autoclose : true,
				format : 'dd/mm/yyyy',
				startDate : dateInit,
				endDate: fechaMinima,
			})
			return {
	        
	            	 
	          }; 
			

				 
			
		}

		
		$('#datePickerInit').datepicker({
		autoclose : true,
		
		format : 'dd/mm/yyyy',
		startDate : hoy,
		beforeShowDay: available,	
		
		
	})			
			
		
		
		var fechaMinima = new Date('2020-01-01');
	
		$('#datePickerInit').on('changeDate', function(e) {
			// Revalidate the date field
			dateInit = new Date($('#datePickerInit').datepicker("getDate"));
			$('#datePickerEnd').datepicker('setStartDate', dateInit).datepicker( "option", "beforeShowDay", available2 );
			//$('#datePickerEnd').datepicker( "option", "beforeShowDay", available2 );
			//console.log($('#datePickerEnd').datepicker('setStartDate', dateInit));
			$('#datePickerEnd input').prop('disabled', false);
			$('#datePickerEnd').datepicker({
				autoclose : true,
				format : 'dd/mm/yyyy',
				startDate: dateInit,
				beforeShowDay: available2,	
			})
			
			
		});
		

		$('input').iCheck({
			    checkboxClass: 'icheckbox_flat',
			    radioClass: 'iradio_flat'
			  });
			});
	
	
	
	
		$('.fotosInfo').click(function(){
			jQuery('.carousel-imagenes').addClass("show");
		});
		
		function closeSlider(){
			jQuery('.carousel-imagenes').removeClass("show");
		}
			
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
					        	
					        	 
					       
				}

				
				
				
	</script>
	 <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDjoiZmMqIjBa3tXXXbTf4Lyu0PDxqHxuQ&callback=initMap">
    </script>
	  
</jsp:body>
</t:paginabasica>
