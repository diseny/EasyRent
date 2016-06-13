<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="user" scope="request" value='${session.getAttribute("user")}'/>

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
					<div class="row">
						<div class="table-responsive" style="height:370px;overflow:auto;">
						<table class="table table-striped navProperty" style="text-align:center;">
		        			<tr> 
								<th>#</th>
								<th>Título</th>
								<th>m<sup>2</sup></th>
								<th>Calle</th>
								<th>Ciudad</th>
								<th>Precio(<img src="${pageContext.request.contextPath}/images/euro.png" style="width:10px;height:10px;">/día)</th>
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
									<td><a href="${pageContext.request.contextPath}/property/info/${propertyOwner.id}.html" class="btn btn-info">Ir a la propiedad</a>
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
		        <div class="col-lg-9 col-sm-6">
		            <div class="row">
						<div class="table-responsive" style="height:370px;overflow:auto;">
						<table class="table table-striped navProperty" style="text-align:center;">
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
							</tr>
							<c:forEach items="${reservations}" var="res" varStatus="loop">
								<tr class="fons">
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
									<td><a href="info/${res.trackingNumber}.html" class="btn btn-info">Ver más</a>
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
</jsp:body>
</t:paginabasica>