<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<t:paginabasica title="Eliminar perfil">
<jsp:body>
	<h2 style="text-align:center;">Eliminar usuario</h2>
	<p style="text-align:center;">Se van a eliminar todos los datos del usuario ¿Estás seguro de que quieres realizar esta acción?</p>
	<form:form method="post" modelAttribute="user"
		action="${pageContext.request.contextPath}/user/delete.html">
		<div class="form-group">
		<p style="text-align:center;"><input type="submit" class="btn btn-danger" value="Eliminar usuario" /><br></p>
		<p style="text-align:center;"><a href="${pageContext.request.contextPath}/user/profile.html">Volver a mi perfil</a></p>
		</div>
	</form:form>
</jsp:body>
</t:paginabasica>
