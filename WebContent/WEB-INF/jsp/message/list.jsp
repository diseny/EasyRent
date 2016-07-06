<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="user" scope="request" value='${session.getAttribute("user")}'/>
<c:set var="message" scope="request" value='${session.getAttribute("message")}'/>

<t:paginabasica title="Mensajes">
<jsp:body>
	<div class="container">
		<div class="row">
	        <div class="col-lg-12 col-sm-6">
	        	<br>
	        	<a href="${pageContext.request.contextPath}/message/create.html" class="btn" style="float:right;background-color:#00BFFF;"><img style="width:30px;height:30px;" src="${pageContext.request.contextPath}/images/mail.png">Redactar nuevo mensaje</a>
	        	<h3 style="color:#00BFFF;">Recibidos</h3>
				<div class="row">
					<c:choose>
						<c:when test='${fn:length(received)==0}'>
							<div class="col-lg-12 col-sm-6">No has recibido ningún mensaje.</div>
						</c:when>
						<c:otherwise>
							Tienes ${notRead} mensaje(s) sin contestar.
							<div class="table-responsive" style="height:370px;overflow:auto;">
							<table class="table navProperty" style="text-align:center;">
		        			<tr> 
								<th>#</th>
								<th>Emisor</th>
								<th style="width:600px;">Mensaje</th>
								<th>Contestado</th>
								<th></th>
								<th></th>
							</tr>
							<c:forEach items="${received}" var="message" varStatus="loop">
								<tr class="fons">
									<td>${loop.index + 1}</td>
									<td>${message.transmitter}</td>
									<td>${message.message}</td>
									<c:choose>
										<c:when test='${message.answered == "true"}'>
											<td>Contestado</td>
										</c:when>
										<c:otherwise>
											<td>Sin contestar</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test='${message.answered == "true"}'>
											<td></td>
											<td></td>
										</c:when>
										<c:otherwise>
											<td><a href="${pageContext.request.contextPath}/message/answer/${message.id}.html" class="btn btn-info">Contestar</a></td>
											<td><a href="${pageContext.request.contextPath}/message/read/${message.id}.html" class="btn btn-warning">Marcar como leído</a></td>
										</c:otherwise>
									</c:choose>
								</tr>
								</c:forEach> 
							</table>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
				<div class="col-lg-12 col-sm-6">
	        	<h3 style="color:#00BFFF;">Enviados</h3>
				<div class="row">
					<c:choose>
						<c:when test='${fn:length(sent)==0}'>
							<div class="col-lg-12 col-sm-6">No has recibido ningún mensaje.</div>
						</c:when>
						<c:otherwise>
							<div class="table-responsive" style="height:370px;overflow:auto;">
							<table class="table navProperty" style="text-align:center;">
			        			<tr> 
									<th>#</th>
									<th>Receptor</th>
									<th style="width:600px;">Mensaje</th>
									<th>Contestado</th>
								</tr>
								<c:forEach items="${sent}" var="message" varStatus="loop">
									<tr class="fons">
										<td>${loop.index + 1}</td>
										<td>${message.receiver}</td>
										<td>${message.message}</td>
										<c:choose>
											<c:when test='${messsage.answered == "true"}'>
												<td>Contestado</td>
											</c:when>
											<c:otherwise>
												<td>Sin contestar</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach> 
							</table>
							</div>
						</c:otherwise>
					</c:choose>
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
	          <h4 class="modal-title">${popUp.title}</h4>
	        </div>
	        <div class="modal-body">
	          <p>${popUp.message}</p>
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
	var message = '${popUp.message}';
	if (message!=''){
		$('#myModal').modal('show');
	}
</script>