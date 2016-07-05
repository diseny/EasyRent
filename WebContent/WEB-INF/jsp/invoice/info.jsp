<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="messagePopUp" scope="request" value='${session.getAttribute("message")}'/>

<t:paginabasica title="EasyRent">
<jsp:body>
	<br><br><br>
	<div class="col-md-12">
		<a href="#" onclick="goBack()"><img style="width:15px;height:15px;" alt="GoBack" src="${pageContext.request.contextPath}/images/goback.png">Atrás</a>
	</div>
	<div class="col-md-12">
		<a href="${pageContext.request.contextPath}/property/info/${property.id}.html">Ver propiedad</a>
	</div>
	<header class="clearfix">
      <div id="logo" style="text-align:center;">
        <img src="${pageContext.request.contextPath}/images/easyrent.jpg">
      </div>
      <div id="bandaTitulo">ID FACTURA: ${invoice.invoiceNumber}
      </div>
      <div id="company" class="clearfix">
        <div>EasyRent</div>
        <div>Calle Mayor 88,<br /> CP 12001, ESP</div>
        <div>964 21 84 78</div>
        <div><a href="">easyrent@easyrent.es</a></div>
      </div>
      <div id="project">
        <div><span style="font-weight:bold;">PROPIETARIO</span><span></span><span></span><span></span><span></span><span style="font-weight:bold;">CLIENTE</span><span></span></div>
        <div><span>NOMBRE</span><span></span><span style="text-align:left;">${owner.name}</span><span></span><span></span><span>NOMBRE</span><span></span><span style="text-align:left;">${tenant.name}</span></div>
        <div><span>APELLIDOS</span><span></span><span style="text-align:left;">${owner.surname}</span><span></span><span></span><span>APELLIDOS</span><span></span><span style="text-align:left;">${tenant.surname}</span></div>
        <div><span style="text-align:left;">EMAIL</span><span></span><span style="text-align:left;">${owner.email}</span><span></span><span></span><span style="text-align:left;">EMAIL</span><span></span><span style="text-align:left;">${tenant.email}</span></div>
        <div><span>TELÉFONO</span><span></span><span style="text-align:left;">${owner.phoneNumber}</span><span></span><span></span><span>TELÉFONO</span><span></span><span style="text-align:left;">${tenant.phoneNumber}</span></div>
        <div><span>USUARIO</span><span></span><span style="text-align:left;">${owner.username}</span><span></span><span></span><span>USUARIO</span><span></span><span style="text-align:left;">${tenant.username}</span></div>
      </div>
    </header>
    <main>
      <table>
        <thead>
          <tr>
            <th>PROPIEDAD</th>
            <th>DIRECCIÓN</th>
            <th>ENTRADA</th>
            <th>SALIDA</th>
            <th>€/DÍA</th>
            <th>FECHA EMISIÓN</th>
            <th>TOTAL</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>${property.title}</td>
            <td>${property.street} ${property.number}, ${property.city}</td>
            <td>${reservation.startDate}</td>
            <td>${reservation.finishDate}</td>
            <td>${property.dailyPrice}</td>
            <td>${invoice.invoiceDate}</td>
            <td>${reservation.totalAmount} €</td>
          </tr>
          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>IVA ${invoice.vat}%</td>
            <td>${invoice.vatIncrease} €</td>
          </tr>
          <tr>
            <td colspan="6" class="grand total" style="text-align:right">TOTAL</td>
            <td class="grand total">${invoice.total} €</td>
          </tr>
        </tbody>
      </table>
      <div class="col-md-12">
      <c:choose>
			<c:when test='${average == null}'>
				(Aún no tiene puntuaciones)
			</c:when>
			<c:otherwise>
				Puntuación media ${average} (sobre 5)
			</c:otherwise>
		</c:choose>
		</div>
      	<c:choose>
			<c:when test='${message == "form"}'>
				<c:choose>
					<c:when test='${user.role == "Tenant"}'>
				  		<form:form method="post" modelAttribute="punctuation" action="${pageContext.request.contextPath}/punctuation/add/${reservation.trackingNumber}.html">
					  		<form:hidden path="propertyId" value="${property.id}"/>
							<div class="col-md-12">
								<form:label path="punctuation">Puntuación:</form:label>
							</div>
							<div class="col-md-1">
								<form:input class="form-control" type="number" value="1" min="1" max="5" placeholder="Puntuación" path="punctuation" required="required"/>
							</div>
							<div class="col-md-12">
								<form:label path="comments">Comentarios:</form:label>
							</div>
							<div class="col-md-6">	
								<form:textarea maxlength="300" rows="5" class="form-control"  placeholder="Comentarios" path="comments" required="required"/>
							</div>
							<div class="col-md-12">
							</div>
							<div class="col-md-6" style="text-align:right;">
								<button type="submit" class="btn btn-success">PUNTUAR</button>
							</div>
						</form:form>
					</c:when>
					<c:otherwise>
						<div class="col-md-12">
							El cliente aún no ha puntuado su estancia. 
						</div>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test='${user.role == "Tenant"}'>
				  		<div class="col-md-12">
							Tu puntuación es de ${punctuation.punctuation}. Comentaste: "${punctuation.comments}"
							<a href="${pageContext.request.contextPath}/punctuation/delete/${reservation.trackingNumber}/${property.id}.html" class="btn btn-danger">Eliminar</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="col-md-12">
							La puntuación del cliente es de  ${punctuation.punctuation}. Éste comentó: "${punctuation.comments}"
						</div>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
    </main>

	<div class="modal fade" id="myModal" role="dialog">
  	  <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">${messagePopUp.title}</h4>
	        </div>
	        <div class="modal-body">
	          <p>${messagePopUp.message}</p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
	        </div>
	      </div>
	    </div>
	 </div>
	 	  
</jsp:body>
</t:paginabasica>

<script>
	var message = '${messagePopUp.message}';
	if (message!=''){
		$('#myModal').modal('show');
		console.log(message);
	}
</script>

<script>
	function goBack() {
		window.history.back()
	}
</script>