<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<t:paginabasica title="EasyRent">
<jsp:body>
	<br><br><br>
	<header class="clearfix">
      <div id="logo" style="text-align:left;">
        <img src="${pageContext.request.contextPath}/images/easyrent.jpg">
        <div style="text-align:right;">
		    <c:choose>
				<c:when test='${average == null}'>
					(Sin puntuaciones)
				</c:when>
				<c:otherwise>
					Puntuacion media ${average}		  
				</c:otherwise>
		  	</c:choose>
	  	</div>
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
      <c:choose>
			<c:when test='${user.role == "Tenant"}'>
		  		<form:form method="post" modelAttribute="punctuation" action="${pageContext.request.contextPath}/invoice/info/${reservation.trackingNumber}.html">
			  		<form:input path="propertyId" type="hidden" value="${property.id}"/>
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
						<form:textarea rows="5" cols="60" class="form-control"  placeholder="Comentarios" path="comments" required="required"/>
					</div>
					<div class="col-md-12">
					</div>
					<div class="col-md-6" style="text-align:right;">
						<form:input type="submit" path="" class="btn btn-info" value="Puntuar"/>
					</div>
				</form:form>
			</c:when>
		</c:choose>
    </main>
	 	  
</jsp:body>
</t:paginabasica>
