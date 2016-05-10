<%@ tag description="Estructura d'una pàgina normal" pageEncoding="UTF-8"%>
<%@ attribute name="title" required="false"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${title}</title>

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css"
	rel="stylesheet">
<!-- Estils propis -->
<link
	href="${pageContext.request.contextPath}/css/easyrent.css"
	rel="stylesheet">
</head>
<body style="font-family:Verdana">
	<header class="container page-header">
		<img src="${pageContext.request.contextPath}/images/easyrent.jpg" alt="EasyRent logo" style="width:100px;height:70px;float:left">
		<c:if test='${not empty user.username}'>
			<a style="float:right" href="${pageContext.request.contextPath}/user/profile.html"><img src="${pageContext.request.contextPath}/images/user.png" alt="User image" style="width:70px;height:70px;float:left"></a>
		</c:if>
	</header>
	<t:navegacio />
	<div class="loggeduser"><t:logininfo /></div>
	<div class="container">
		<jsp:doBody />
	</div>
	<footer>
	<hr>
	<p class="text-muted" style="text-align:center">
		<img src="${pageContext.request.contextPath}/images/easyrentelegant.png" alt="EasyRent logo" style="width:170px;height:50px;float:center"><br>
		© 2016-2016, EasyRent.com, o afiliados. Todos los derechos reservados.
	</p>
	</footer>
</body>
</html>