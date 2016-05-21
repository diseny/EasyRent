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
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,800,700,400italic,600italic,700italic,800italic,300italic" rel="stylesheet" type="text/css">
    <!-- <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'> -->
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/css/bootflat/js/site.min.js"></script>
</head>

<body style="font-family:Verdana">
	
	<t:navegacio />
	
	<div class="container">
	<div class="row" style="margin-top:83px">
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