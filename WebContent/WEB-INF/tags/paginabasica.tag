<%@ tag description="Estructura d'una pàgina normal" pageEncoding="UTF-8"%>
<%@ attribute name="title" required="false"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/logo2.png">
<link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/images/logo2.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/logo2.png">
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
    <script src="${pageContext.request.contextPath}/js/easyRent.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/css/bootflat/js/site.min.js"></script>
    
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
		 
		
    
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