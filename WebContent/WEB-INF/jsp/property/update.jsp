<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<c:set var="user" scope="request" value='${session.getAttribute("user")}'/>

<t:paginabasica title="Modificar">
<jsp:body>
	<br><br><br>
	<div class="col-md-12">
		<a href="#" onclick="goBack()"><img style="width:15px;height:15px;" alt="GoBack" src="${pageContext.request.contextPath}/images/goback.png">Atrás</a>
	</div>
	<div class="row">
	<div class="col-md-12" >
		<div class="col-md-10 col-md-offset-1">
			<h1>Modificar Propiedad</h1>
			<hr>
		</div>
			
	<form:form method="post" modelAttribute="property" id="update" >
		<div class="col-md-12" style="min-height:230px;">
			<div class="col-md-10 col-md-offset-1">
			
			<h4><li>Detalles básicos</li></h4>
			<form:input type="hidden" path="id"/>
			<form:input type="hidden" path="ownerUsername"/>
			<form:input type="hidden" path="capacity"/>
			<form:input type="hidden" path="numRooms"/>
			<form:input type="hidden" path="numBathrooms"/>
			<form:input type="hidden" path="squareMeters"/>
			<form:input type="hidden" path="city"/>
			<form:input type="hidden" path="street"/>
			<form:input type="hidden" path="number"/>
			<form:input type="hidden" path="floor"/>
			<form:input type="hidden" path="isActive"/>
			<form:input type="hidden" path="validated" value="validated"/>
			<div class="col-md-12">
				<div class="col-md-6" style="margin-bottom:10px;padding-right: 30px">
					<form:label path="title">Título</form:label>
					<form:input class="form-control" type="text" path="title"  placeholder="Título" required="required"/>
					<form:errors cssClass="error" path="title"/>
				</div>
				<div class="col-md-12" style="padding:0">
					<div class="col-md-12" style="padding-left:0" >
						<form:label path="numBeds">Camas</form:label>
					</div>
					<div class="col-md-6"  style="margin-bottom:10px;padding-left:0">
						<form:input min="1" class="form-control" type="number" path="numBeds" />
					</div>
					<form:errors cssClass="error" path="numBeds"/>
				</div>
				<div class="col-md-6" style="padding:0">
					<div class="col-md-12" style="padding-left:0" >
						<form:label path="dailyPrice">Precio/día</form:label>
					</div>
					<div class="col-md-12"  style="margin-bottom:10px;padding-left:0">
						<form:input min="1" type="number"  class="form-control" path="dailyPrice" />
					</div>
					<form:errors cssClass="error" path="dailyPrice"/>
				</div>
			</div>
				<div class="col-md-6" style="margin-bottom:10px;padding-right: 30px">
					<form:label path="description">Description</form:label>
					<form:textarea class="form-control"  type="text" path="description" maxlength="300" autocomplete="true" placeholder="Descripción(máx. 300 carácteres)" style="min-height:100px;max-width:100%" required="required"></form:textarea>
					<form:errors cssClass="error" path="description"/>
				</div>
			</div>
			</div>
			
			<div class="col-md-12" style="min-height:230px;background-color: rgba(0, 255, 253, 0.048039);">
				<div class="col-md-10 col-md-offset-1">
				<h4><li>Servicios</li></h4>
				<c:forEach items="${allServices}" var="servicios" varStatus="loopServicios">
					<c:choose>
					    <c:when test="${servicios.propertyHas=='true'}">
					    	<div class=" serviciosInfo col-md-4" id="select-${loopServicios.index}">
								<input type="checkbox" name="${servicios.name}" id="${servicios.ID}" checked>
								<label>${servicios.name}</label> 
							</div>
					    </c:when>
					    <c:otherwise>
					    	<div class=" serviciosInfo col-md-4" id="select-${loopServicios.index}">
								<input type="checkbox" name="${servicios.name}" id="${servicios.ID}">
								<label>${servicios.name}</label> 
							</div>
					    </c:otherwise>
					</c:choose>
				</c:forEach>
				</div>
			</div> 
		
			<form:input type="hidden"  path="piscina" id="prop0"/>
			<form:input type="hidden"  path="jacuzzi" id="prop1"  />
			<form:input type="hidden"  path="gimnasio"  id="prop2" />
			<form:input type="hidden"  path="balcon" id="prop3" />
			<form:input type="hidden"  path="parque" id="prop4" />
			<form:input type="hidden"  path="jardin"  id="prop5" />
			<form:input type="hidden"  path="wifi" id="prop6" />
			<form:input type="hidden"  path="television"  id="prop7" />
			<form:input type="hidden"  path="cocina" id="prop8"  />

			<div class="col-md-12" style="text-align:center" >
				<button type="submit" onclick="submitForm()" class="btn btn-success" value="Modifica datos básicos" >Modifica datos básicos</button>
				<a href="${pageContext.request.contextPath}/property/periods/${property.id}.html" class="btn btn-warning">Administrar períodos</a>
				<a href="${pageContext.request.contextPath}/property/photosAdmin/${property.id}.html" class="btn btn-warning">Administrar fotos</a>
			</div>
		
	</form:form>
	</div>
	</div>
	
</jsp:body>
</t:paginabasica>

<script>
	
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
	  $('#update').submit();
	}
	
	$("select").dropdown();
	  $('input').iCheck({
	    checkboxClass: 'icheckbox_flat',
	    radioClass: 'iradio_flat'
	  });

  </script>

<script>
	function goBack() {
		window.history.back()
	}
</script>