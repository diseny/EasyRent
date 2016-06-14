<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

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
	  	<div style="text-align:right;">
		  	<span class="rating">
		        <input type="radio" class="rating-input"
		    			id="rating-input-1-5" name="rating-input-1"/>
		        <label for="rating-input-1-5" class="rating-star"></label>
		        <input type="radio" class="rating-input"
		                id="rating-input-1-4" name="rating-input-1"/>
		        <label for="rating-input-1-4" class="rating-star"></label>
		        <input type="radio" class="rating-input"
		                id="rating-input-1-3" name="rating-input-1"/>
		        <label for="rating-input-1-3" class="rating-star"></label>
		        <input type="radio" class="rating-input"
		                id="rating-input-1-2" name="rating-input-1"/>
		        <label for="rating-input-1-2" class="rating-star"></label>
		        <input type="radio" class="rating-input"
		                id="rating-input-1-1" name="rating-input-1"/>
		        <label for="rating-input-1-1" class="rating-star"></label>
			</span>
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
    </main>
	 	  
</jsp:body>
</t:paginabasica>
