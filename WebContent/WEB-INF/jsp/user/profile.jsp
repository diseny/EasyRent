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
			<c:choose>
			<c:when test='${user.role == "Owner"}'>
				<div class="col-lg-3 col-sm-6">
		            <div class="card hovercard" style="background-color:#ccffff">
		                <div class="cardheader">
		                </div>
		                <div class="avatar">
		                    <img alt="" src="${pageContext.request.contextPath}/images/user.png">
		                </div>
		                <div class="info">
		                    <div class="title">
		                        ${user.name} ${user.surname}
		                    </div>
		                    <div>${user.username}</div>
		                    <div class="desc">${user.email}</div>
		                    <div class="desc">${user.role}</div>
		                    <div class="desc">DNI: ${user.nationalId}</div> 
		                    <div class="desc">${user.phoneNumber}</div>
		                </div>
		                <div class="bottom">
		                    <a class="btn btn-warning" href="${pageContext.request.contextPath}/user/update.html">Editar</a>
		                    <a class="btn btn-danger" href="${pageContext.request.contextPath}/user/delete.html">Eliminar</a>
		                </div>
		            </div>
		        </div>
		        <div class="col-lg-9 col-sm-6">
		        	<h3 style="color:#00BFFF;">Mis propiedades</h3>
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
								<th></th>
								<th></th>
								<th></th>
							</tr>
							<c:forEach items="${propertiesOwner}" var="propertyOwner" varStatus="loop">
								<tr class="fons">
									<td>${loop.index + 1}</td>
									<td>${propertyOwner.title}</td>
									<td>${propertyOwner.squareMeters}</td>
									<td>${propertyOwner.street}</td>
									<td>${propertyOwner.city}</td>
									<td>${propertyOwner.dailyPrice}</td>
									<td><a href="${pageContext.request.contextPath}/property/info/${propertyOwner.id}.html" class="btn btn-info">Info</a>
									<c:choose>
										<c:when test='${propertyOwner.isActive == "true"}'>
											<td><a href="${pageContext.request.contextPath}/property/update/${propertyOwner.id}.html" class="btn btn-info">Modificar</a></td>
											<td><a href="${pageContext.request.contextPath}/property/delete/${propertyOwner.id}.html" class="btn btn-danger">Desactivar</a></td>
										</c:when>
										<c:otherwise>
											<td></td>
											<td><a href="${pageContext.request.contextPath}/property/activate/${propertyOwner.id}.html" class="btn btn-info">Reactivar</a></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach> 
						</table>
						</div>
					</div>
		        </div>
		        <div class="col-lg-12 col-sm-6">
		        	<h3 style="color:#00BFFF;">Reservas</h3>
		        	<div class="row">
						<div class="table-responsive" style="height:370px;overflow:auto;">
						<table class="table navProperty" style="text-align:center;">
		        			<tr> 
								<th>#</th>
								<th>Propiedad</th>
								<th>Cliente</th>
								<th>Fecha de inicio</th>
								<th>Fecha de final</th>
								<th>Cantidad total</th>
								<th>Estado</th>
								<th></th>
								<th></th>
							</tr>
							<c:forEach items="${reservations}" var="reservation" varStatus="loop">
								<tr class="fons">
									<td>${loop.index + 1}</td>
									<td>${reservation.propertyTitle}</td>
									<td>${reservation.userNameTenant}</td>
									<td>${reservation.startDate}</td>
									<td>${reservation.finishDate}</td>
									<td>${reservation.totalAmount}</td>
									<td>${reservation.status}</td>
									<c:choose>
										<c:when test='${reservation.status == "pending"}'>
											<td><a href="${pageContext.request.contextPath}/reservation/accept/${reservation.trackingNumber}.html" class="btn btn-info">Aceptar</a></td>
											<td><a href="${pageContext.request.contextPath}/reservation/reject/${reservation.trackingNumber}.html" class="btn btn-danger">Rechazar</a></td>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test='${reservation.status == "accepted"}'>
													<td><a href="${pageContext.request.contextPath}/message/${reservation.userNameTenant}.html" class="btn btn-info">Contactar</a></td>
													<td><a href="${pageContext.request.contextPath}/invoice/info/${reservation.trackingNumber}.html" class="btn btn-info">Ver factura</a></td>
												</c:when>
												<c:otherwise>
													<td></td>
													<td></td>
												</c:otherwise>
											</c:choose>
											<td></td>
											<td></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach> 
						</table>
						</div>
					</div>
		        </div>
            </c:when>
            <c:otherwise>
            	<div class="col-lg-3 col-sm-6">
		            <div class="card hovercard" style="background-color:#ccffff">
		                <div class="cardheader">
		
		                </div>
		                <div class="avatar">
		                    <img alt="" src="${pageContext.request.contextPath}/images/user.png">
		                </div>
		                <div class="info">
		                    <div class="title">
		                        ${user.name} ${user.surname}
		                    </div>
		                    <div>${user.username}</div>
		                    <div class="desc">${user.email}</div>
		                    <div class="desc">${user.role}</div>
		                    <div class="desc">DNI: ${user.nationalId}</div> 
		                    <div class="desc">${user.phoneNumber}</div>
		                </div>
		                <div class="bottom">
		                    <a class="btn btn-warning" href="${pageContext.request.contextPath}/user/update.html">Editar</a>
		                    <a class="btn btn-danger" href="${pageContext.request.contextPath}/user/delete.html">Eliminar</a>
		                </div>
		            </div>
		        </div>
		        <h3 style="color:#00BFFF;">Reservas</h3>
		        <div class="col-lg-9 col-sm-6">
		            <div class="row">
						<div class="table" style="height:330px;overflow:auto;">
						<table class="table navProperty" style="text-align:center;">
		        			<tr> 
								<th>#</th>
								<c:choose>
								<c:when test="${user.role == 'Administrator'}">
									<th>Cliente</th>
								</c:when>
								</c:choose>
								<th>Propietario</th>
								<th>Propiedad</th>
								<th>Inicio</th>
								<th>Fin</th>
								<th>Precio total</th>
								<th>Estado</th>
								<th></th>
								<th></th>
							</tr>
							<c:forEach items="${reservations}" var="res" varStatus="loop">
								<c:choose>
									<c:when test="${res.status == 'rejected'}">
										<tr class="danger">
									</c:when>
									<c:otherwise>
										<tr class="fons">
									</c:otherwise>
								</c:choose>
								<td>${loop.index + 1}</td>
								<c:choose>
								<c:when test="${user.role == 'Administrator'}">
									<td>${res.userNameTenant}</td>
								</c:when>
								</c:choose>
								<td>${res.ownerUsername}</td>
								<td>${res.propertyTitle}</td>
								<td>${res.startDate}</td>
								<td>${res.finishDate}</td>
								<td>${res.totalAmount}</td>
								<td>${res.status}</td>
								<c:choose>
									<c:when test="${res.status == 'accepted'}">
										<c:choose>
											<c:when test="${user.role == 'Tenant'}">
												<td><a href="${pageContext.request.contextPath}/message/${res.ownerUsername}.html" class="btn btn-info">Contactar</a></td>
											</c:when>
											<c:otherwise>
												<td></td>
											</c:otherwise>
										</c:choose>
										<td><a href="${pageContext.request.contextPath}/invoice/info/${res.trackingNumber}.html" class="btn btn-info">Ver factura</a></td>
									</c:when>
									<c:otherwise>
										<td></td>
										<td></td>
									</c:otherwise>
								</c:choose>
								</tr>
							</c:forEach> 
						</table>
						</div>
					</div>
		        </div>
            </c:otherwise>
            </c:choose>
			
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