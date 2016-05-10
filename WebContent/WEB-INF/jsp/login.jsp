<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<t:paginabasica title="Login">
<jsp:body>
	<h2>Acceso</h2>
	<form:form method="post" modelAttribute="user"
		action="${pageContext.request.contextPath}/login.html">
		<div class="form-group">
		<p>
			<form:label path="username">Usuario:</form:label>
		</p>
		<p>
			<form:input class="form-control"  placeholder="Introduce tu usuario" path="username" />
			<form:errors path="username" cssClass="error" />
		</p>
		<p>
			<form:label path="password">Contraseña:</form:label>
		</p>
		<p>
			<form:password class="form-control"  placeholder="Contraseña" path="password" />
			<form:errors path="password" cssClass="error" />
		</p>		
		<input type="submit" class="btn btn-info" value="Acceder" />
		</div>
	</form:form>
</jsp:body>
</t:paginabasica>
