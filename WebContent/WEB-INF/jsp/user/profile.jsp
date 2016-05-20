<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="user" scope="request" value='${session.getAttribute("user")}'/>

<t:paginabasica title="Perfil">
<jsp:body>
	<br><br><br>
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
		        <div class="col-lg-5 col-sm-6">
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
		        <div class="col-lg-4 col-sm-6">
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
            </c:otherwise>
            </c:choose>
			
		</div>
	</div>
</jsp:body>
</t:paginabasica>