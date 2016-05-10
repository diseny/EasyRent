<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<t:paginabasica title="Actualizar perfil">
<jsp:body>
	<h2>Actualización</h2>
	<form:form method="post" modelAttribute="user"
		action="${pageContext.request.contextPath}/user/update.html">
		<div class="form-group">
		<form:input path="username" type="hidden" />
		<form:input path="role" type="hidden" />
		<form:input path="registrationDate" type="hidden" />
		<form:input path="isActive" type="hidden" />
		<p>
			<form:label path="password">Contraseña:</form:label>
		</p>
		<p>
			<form:password class="form-control" path="password" required="required"/>
			<form:errors path="password" cssClass="error" />
		</p>
		<p>
			<form:label path="nationalId">DNI:</form:label>
		</p>
		<p>
			<form:input class="form-control" path="nationalId" required="required"/>
			<form:errors path="nationalId" cssClass="error" />
		</p>
		<p>
			<form:label path="name">Nombre:</form:label>
		</p>
		<p>
			<form:input class="form-control" path="name" required="required"/>
			<form:errors path="name" cssClass="error" />
		</p>
		<p>
			<form:label path="surname">Apellidos:</form:label>
		</p>
		<p>
			<form:input class="form-control" path="surname" required="required"/>
			<form:errors path="surname" cssClass="error" />
		</p>
		<p>
			<form:label path="email">Email:</form:label>
		</p>
		<p>
			<form:input class="form-control" type="email" path="email" required="required"/>
			<form:errors path="email" cssClass="error" />
		</p>
		<p>
			<form:label path="postalAddress">Código postal:</form:label>
		</p>
		<p>
			<form:input class="form-control" path="postalAddress" required="required"/>
			<form:errors path="name" cssClass="error" />
		</p>
		<p>
			<form:label path="phoneNumber">Teléfono:</form:label>
		</p>
		<p>
			<form:input class="form-control" path="phoneNumber" required="required"/>
			<form:errors path="phoneNumber" cssClass="error" />
		</p>
		<input type="submit" class="btn btn-info" value="Actualizar" />
		</div>
	</form:form>
</jsp:body>
</t:paginabasica>
