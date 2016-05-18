<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<t:paginabasica title="Check in">
<jsp:body>
	<br><br><br>
	<h2>Registro</h2>
	<form:form method="post" modelAttribute="user"
		action="${pageContext.request.contextPath}/user/checkin.html">
		<div class="form-group">
		<p>
			<form:label path="username">Nombre de usuario:</form:label>
		</p>
		<p>
			<form:input class="form-control"  placeholder="Introduce tu usuario" path="username" required="required"/>
			<form:errors path="username" cssClass="error" />
		</p>
		<p>
			<form:label path="password">Contraseña:</form:label>
		</p>
		<p>
			<form:password class="form-control"  placeholder="Contraseña" path="password" required="required"/>
			<form:errors path="password" cssClass="error" />
		</p>
		<p>
			<form:label path="role">Rol:</form:label>
		</p>
		<p>
			<form:radiobutton path="role" value="Owner" checked="checked"/> Propietario
			<form:radiobutton path="role" value="Tenant"/> Inquilino
			<!--<form:radiobutton path="role" value="Administrator"/> Administrador-->
		</p>
		<p>
			<form:label path="nationalId">DNI:</form:label>
		</p>
		<p>
			<form:input class="form-control"  placeholder="Documento nacional de identidad" path="nationalId" required="required"/>
			<form:errors path="nationalId" cssClass="error" />
		</p>
		<p>
			<form:label path="name">Nombre:</form:label>
		</p>
		<p>
			<form:input class="form-control"  placeholder="Nombre" path="name" required="required"/>
			<form:errors path="name" cssClass="error" />
		</p>
		<p>
			<form:label path="surname">Apellidos:</form:label>
		</p>
		<p>
			<form:input class="form-control"  placeholder="Apellidos" path="surname" required="required"/>
			<form:errors path="surname" cssClass="error" />
		</p>
		<p>
			<form:label path="email">Email:</form:label>
		</p>
		<p>
			<form:input class="form-control" type="email" placeholder="Correo electrónico" path="email" required="required"/>
			<form:errors path="email" cssClass="error" />
		</p>
		<p>
			<form:label path="postalAddress">Código postal:</form:label>
		</p>
		<p>
			<form:input class="form-control"  placeholder="CP" path="postalAddress" required="required"/>
			<form:errors path="name" cssClass="error" />
		</p>
		<p>
			<form:label path="phoneNumber">Teléfono:</form:label>
		</p>
		<p>
			<form:input class="form-control"  placeholder="Número de teléfono (fijo o móvil)" path="phoneNumber" required="required"/>
			<form:errors path="phoneNumber" cssClass="error" />
		</p>
		<input type="submit" class="btn btn-info" value="Registrarse" />
		</div>
	</form:form>
</jsp:body>
</t:paginabasica>
