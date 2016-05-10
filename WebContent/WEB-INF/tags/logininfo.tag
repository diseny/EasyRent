<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ tag pageEncoding="UTF-8"%>

<!-- La sessió està disponible automàticament en l’objecte "session" -->
<c:set var="user" scope="request" value='${session.getAttribute("user")}'/>
<p class="loggeduser">
<c:choose>
<c:when test='${user == null}'>
<a href="${pageContext.request.contextPath}/login.html"><button class="logInButton" style="float:right"><img src="${pageContext.request.contextPath}/images/login.png" alt="" style="width:15px;height:15px;vertical-align:middle"> Iniciar sesión</button></a><br><br> 
<p style="float:right;font-size:small;color:grey">¿Aún no tienes cuenta?<a href="${pageContext.request.contextPath}/user/checkin.html"> Registrarse</a></p>
</c:when>
<c:otherwise>
Autenticado como ${user.username}: ${user.role} <br> 
<a href="${pageContext.request.contextPath}/logout.html">Cerrar sesión</a> </c:otherwise>
</c:choose>
</p>		