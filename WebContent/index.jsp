<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
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
		<div class="col-md-4">
		 <input id="pac-input" name="" class="form-control" type="text" placeholder="Enter a location" autocomplete="on">
		</div>
		<div class="col-md-3">
		  <select class="form-control" name="" id="sel1">
		    <option>Castellón</option>
		    <option>Burriana</option>
		    <option>Villareal</option>
		    <option>Almazora</option>
		  </select>
		</div>
		<div class="col-md-3">
		  <select class="form-control " id="sel1">
		    <option>Castellón</option>
		    <option>Burriana</option>
		    <option>Villareal</option>
		    <option>Almazora</option>
		  </select>
		</div>
		<div class="col-md-2 busquedaAvanzadaIcon show">
			<img src="${pageContext.request.contextPath}/images/plusIcon.png" onclick="busqAvanzada()" style="cursor:pointer">
		</div>
		<div class="col-md-2 busquedaNormalIcon">
			<img src="${pageContext.request.contextPath}/images/minusIcon.png" onclick="closeBusqueda()" style="cursor:pointer">
		</div>
		</div>
		<div class="row busquedaAvanzada" >
			<div class="col-md-3">
		  <select class="form-control" name="" id="sel1">
		    <option>Castellón</option>
		    <option>Burriana</option>
		    <option>Villareal</option>
		    <option>Almazora</option>
		  </select>
		</div>
		<div class="col-md-3">
		  <select class="form-control " id="sel1">
		    <option>Castellón</option>
		    <option>Burriana</option>
		    <option>Villareal</option>
		    <option>Almazora</option>
		  </select>
		</div>
		<div class="col-md-3">
		  <select class="form-control" name="" id="sel1">
		    <option>Castellón</option>
		    <option>Burriana</option>
		    <option>Villareal</option>
		    <option>Almazora</option>
		  </select>
		</div>
		<div class="col-md-3">
		  <select class="form-control " id="sel1">
		    <option>Castellón</option>
		    <option>Burriana</option>
		    <option>Villareal</option>
		    <option>Almazora</option>
		  </select>
		</div>
		</div>
		
		<div ><button class=" col-md-4 col-md-offset-4 btn btn-success">OK</button></div>
		
	</div>
	</form>
</div>
<script>
	function busqAvanzada(){
		jQuery('.welcomeSearch').css('height','175');
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