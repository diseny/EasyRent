<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:paginabasica title="Àrea privada">
<jsp:body>
	<h1>Llista d’usuaris del sistema</h1>
	<table class="table table-striped"> 
		<tr> 
			<th>#</th> 
			<th>Nom d’usuari</th> 
		</tr>
		<c:forEach items="${users}" var="user" varStatus="loop">
			<tr class="fons">
				<td>${loop.index + 1}</td>
				<td>${user.username}</td> 
			</tr>
		</c:forEach> 
	</table> 
</jsp:body>
</t:paginabasica>