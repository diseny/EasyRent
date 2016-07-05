<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="user" scope="request" value='${session.getAttribute("user")}'/>
<c:set var="message" scope="request" value='${session.getAttribute("message")}'/>

<t:paginabasica title="Perfil">
<jsp:body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<a href="#" onclick="goBack()"><img style="width:15px;height:15px;" alt="GoBack" src="${pageContext.request.contextPath}/images/goback.png">Atrás</a>
			</div>
			<h1>Períodos de la propiedad ${property.title}</h1>
			<table class="table table-striped navProperty" style="text-align:center;">
				<th>#</th>
				<th>Inicio</th>
				<th>Fin</th>
				<th></th>
				<c:forEach items="${periods}" var="period" varStatus="loop">
					<tr class="fons">
						<td>${loop.index + 1}</td>
						<td>${period.start}</td>
						<td>${period.finish}</td>
						<td><a href="${pageContext.request.contextPath}/property/deleteperiod/${property.id}/${period.periodId}.html" class="btn btn-danger">Eliminar periodo</a></td>
					</tr>
				</c:forEach> 
			</table>
		</div>
		</div>
		<div class="col-md-12" style="min-height:230px;background-color: rgba(135, 206, 250, 0.5);">
		<div class="col-md-10 col-md-offset-1">
		<!--  Está lo visual, falta añadir  -->
		
		<form:form method="post" modelAttribute="period" action="${pageContext.request.contextPath}/property/addPeriod.html">
			<form:input type="hidden" path="periodId"/>
			<form:input type="hidden" path="propertyId"/>
		
		<div class="col-md-12">
        	<label>Fecha Inicio</label>
        </div>
        <div class="col-md-1">
	        <div class="form-group">
	       		<div class="date">
	           		<div class="input-group input-append date" id="datePickerInit">
	            	    <form:input class="form-control" type="text" path="start"  style="width:120px" />
	                	<span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
	            	</div>
	       	 	</div>
	        </div>
	    </div>
		<div class="col-md-12">
        	<label>Fecha Final</label>
        </div>
        <div class="col-md-1">
	        <div class="form-group">
	       		<div class="date">
	           		<div class="input-group input-append date" id="datePickerEnd">
	            	    <form:input class="form-control" type="text" path="finish" style="width:120px" disabled="true" />
	                	<span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
	            	</div>
	       	 	</div>
	        </div>
	    </div>
	    <div class="col-md-12">
        	<input type="submit" class="btn btn-info" value="Añadir" />
        </div>
		</form:form>
	
	
</jsp:body>
</t:paginabasica>

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
		  
    <script type="text/javascript">

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
					
		</script>

<script>
	function goBack() {
		window.history.back()
	}
</script>