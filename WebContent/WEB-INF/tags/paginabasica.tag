<%@ tag description="Estructura d'una pàgina normal" pageEncoding="UTF-8"%>
<%@ attribute name="title" required="false"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<title>${title}</title>
<!-- Estils propis , en la hoja de estilos easyrent.css se importan todos los que se usan-->
<link
	href="${pageContext.request.contextPath}/css/easyrent.css"
	rel="stylesheet">
	<!-- Bootflat -->

</head>

<body style="font-family:Verdana">
	<!-- <header class="container page-header">
		
		<c:if test='${not empty user.username}'>
			<a style="float:right" href="${pageContext.request.contextPath}/user/profile.html"><img src="${pageContext.request.contextPath}/images/user.png" alt="User image" style="width:70px;height:70px;float:left"></a>
		</c:if>
	</header> -->
	<t:navegacio />
	
	<div class="container">
	<div class="row">
		<jsp:doBody />
	</div>
	</div>
	<footer>
	<div class="col-md-12" style="background-color:#fff">
	
	<t:footer></t:footer>
	
	</footer>
	</div>
</body>
</html>