<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<t:paginabasica title="Redactar">
<jsp:body>
	<div class="container">
		<div class="row">
	        <div class="col-lg-12 col-sm-6">
	        	<h3 style="color:#00BFFF;">Crear mensaje</h3>
					<form:form method="post" modelAttribute="message" action="${pageContext.request.contextPath}/message/create.html">
						<form:input type="hidden" path="id"/>
						<form:input type="hidden" path="transmitter"/>
						<form:input style="height:100%;" id="receiver" class="form-control" type="text" path="receiver" list="users" placeholder="Receptor"  required="required"></form:input>
						<br>
						<form:textarea class="form-control" type="text" path="message" maxlength="1000" autocomplete="true" placeholder="Mensaje(máx. 1000 carácteres)" style="min-height:200px;max-width:100%" required="required"></form:textarea>
						<br>
						<input type="submit" class="btn btn-info" value="Enviar" />
					</form:form>
	        </div>
		</div>
	</div>
	
</jsp:body>
</t:paginabasica>

<datalist id="users">
	<c:forEach items="${usernames}" var="user" varStatus="loop">
		<option value="${user}">
	</c:forEach>
</datalist>
