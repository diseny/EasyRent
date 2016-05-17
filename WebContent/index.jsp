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
	<div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-6 col-xs-offset-3 welcomeSearch" >
		<div class="col-md-4">
		  <select class="form-control " id="sel1">
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
		  <select class="form-control " id="sel1">
		    <option>Castellón</option>
		    <option>Burriana</option>
		    <option>Villareal</option>
		    <option>Almazora</option>
		  </select>
		</div>
		<div class="col-md-2">
			<button class="btn btn-success">OK</button>
		</div>
	
	</div>
</div>


</jsp:body>

</t:paginabasica>
</div>