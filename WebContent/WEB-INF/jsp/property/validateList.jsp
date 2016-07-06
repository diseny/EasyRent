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
	        <div class="col-lg-12 col-sm-6">
	        	<h3 style="color:#00BFFF;">Todas las propiedades</h3>
				<div class="row">
					<div class="table-responsive" style="height:370px;overflow:auto;">
					<table class="table navProperty" style="text-align:center;">
	        			<tr> 
							<th>#</th>
							<th>Título</th>
							<th>m<sup>2</sup></th>
							<th>Calle</th>
							<th>Ciudad</th>
							<th>Precio(<img src="${pageContext.request.contextPath}/images/euro.png" style="width:10px;height:10px;">/día)</th>
							<th>Validada</th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
						<c:forEach items="${properties}" var="property" varStatus="loop">
							<tr class="fons">
								<td>${loop.index + 1}</td>
								<td>${property.title}</td>
								<td>${property.squareMeters}</td>
								<td>${property.street}</td>
								<td>${property.city}</td>
								<td>${property.dailyPrice}</td>
								<td>${property.validated}</td>
								<c:choose>
									<c:when test='${property.validated == "pending"}'>
										<td><a href="${pageContext.request.contextPath}/property/validate/${property.id}.html" class="btn btn-info">Validar</a></td>
										<td><a href="${pageContext.request.contextPath}/property/reject/${property.id}.html" class="btn btn-danger">Rechazar</a></td>
									</c:when>
									<c:otherwise>
										<td></td>
										<td></td>
									</c:otherwise>
								</c:choose>
								<td><a href="${pageContext.request.contextPath}/property/info/${property.id}.html" class="btn btn-info">Info</a>
							</tr>
						</c:forEach> 
					</table>
					</div>
				</div>
	        </div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal" role="dialog">
  	  <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">${message.title}</h4>
	        </div>
	        <div class="modal-body">
	          <p>${message.message}</p>
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
	var message = '${message.message}';
	if (message!=''){
		$('#myModal').modal('show');
		console.log(message);
	}
</script>