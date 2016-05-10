<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="user" scope="request" value='${session.getAttribute("user")}'/>

<t:paginabasica title="Perfil">
<jsp:body>

	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-sm-6" style="float: none;margin: 0 auto;">
	            <div class="card hovercard">
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
	                    <a class="btn btnCircle btn-primary btn-twitter btn-sm" href="https://twitter.com/webmaniac">
	                        <i class="fa fa-twitter"></i>
	                    </a>
	                    <a class="btn btnCircle btn-danger btn-sm" rel="publisher"
	                       href="https://plus.google.com/+ahmshahnuralam">
	                        <i class="fa fa-google-plus"></i>
	                    </a>
	                    <a class="btn btnCircle btn-primary btn-sm" rel="publisher"
	                       href="https://plus.google.com/shahnuralam">
	                        <i class="fa fa-facebook"></i>
	                    </a>
	                    <a class="btn btnCircle btn-warning btn-sm" rel="publisher" href="https://plus.google.com/shahnuralam">
	                        <i class="fa fa-behance"></i>
	                    </a>
	                </div>
	            </div>
	        </div>
		</div>
	</div>
</jsp:body>
</t:paginabasica>