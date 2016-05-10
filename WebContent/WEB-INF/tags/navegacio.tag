<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ tag pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<c:set var="user" scope="request" value='${session.getAttribute("user")}'/>
<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/index.jsp">Página principal</a></li>
				<li><a href="${pageContext.request.contextPath}/property/list.html">Últimas propiedades</a></li>
				<c:choose>
				<c:when test='${user != null}'>
					<c:choose>
					<c:when test="${user.role == 'Administrator'}">
						<li><a href="${pageContext.request.contextPath}/credentials/list.html">Credenciales de los usuarios</a></li>
					</c:when>
					</c:choose> 
				</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
