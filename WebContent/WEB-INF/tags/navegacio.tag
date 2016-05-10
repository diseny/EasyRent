<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ tag pageEncoding="UTF-8"%>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/index.jsp">Página principal</a></li>
				<li><a href="${pageContext.request.contextPath}/property/list.html">Últimas propiedades</a></li>
				<li><a href="${pageContext.request.contextPath}/owner/list.html">Gestión de propietarios</a></li>
				<li><a href="${pageContext.request.contextPath}/tenant/list.html">Gestión de clientes</a></li>
				<li><a href="${pageContext.request.contextPath}/credentials/list.html">Gestión de credentials</a></li>
			</ul>
		</div>
	</div>
</nav>
