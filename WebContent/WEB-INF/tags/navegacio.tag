<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ tag pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<c:set var="user" scope="request" value='${session.getAttribute("user")}'/>
<div class="col-md-12 headerNav">
<div class="col-md-1 logo-header">
<img src="${pageContext.request.contextPath}/images/easyrent.jpg" alt="EasyRent logo" onclick="window.location.href='${pageContext.request.contextPath}/index.jsp'"style="">
</div>
<div class="col-md-11">
<!--  comentario de prueba -->
<nav class="navbar navbar-default navbar-custom" role="navigation">
                  <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                      </button>
                     
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                      <ul class="nav navbar-nav navbar-right">
                      	<li> <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                      
                       
            			<li><a href="${pageContext.request.contextPath}/property/list.html">Últimas propiedades</a></li>
                     
                      <c:choose>
							<c:when test='${user.role == "Administrator"}'>
							<li><a href="${pageContext.request.contextPath}/credentials/list.html">Gestión de credentials</a></li>
	                      </c:when>
	                  </c:choose>
                  		<c:choose>
							<c:when test='${user == null}'>
		               			 <button class="btn btn-primary register" onclick="showRegister()">Iniciar sesión</button>
                      		</c:when>
                      		<c:otherwise>
                      			<li>
                      				<p><a  href="${pageContext.request.contextPath}/user/profile.html"><img src="${pageContext.request.contextPath}/images/user.png"></a><br>
                      				<a style="" href="${pageContext.request.contextPath}/logout.html">Cerrar sesión</a> ${user.username}</p>
	                      		</li>
	                      	</c:otherwise>
                      	</c:choose>
                      </ul>
              	    	<div >
                	  </div>
                    
                  </div><!-- /.container-fluid -->
                </nav>
                <div >
               
                </div>

</div>
</div>
<div class="registerPop">
	<div class="registerForm">
		<img src="${pageContext.request.contextPath}/images/closeIcon.png" onclick="closeRegister()">
		<div class="row">
		<form method="post"  action="${pageContext.request.contextPath}/login.html">
		<div class="form-group">
			<div class="col-md-12 campos">
			<div class="col-md-2 col-sm-2 col-xs-12">
			<label >Usuario:</label>
			</div>
			<div class="col-md-10 col-sm-10 col-xs-12">
				<input class="form-control col-md-9"  placeholder="Introduce tu usuario" name="username" required="required"/>
			</div>
			</div>
			<div class="col-md-12 campos">
				<div class="col-md-2 col-sm-2 col-xs-12">
					<label>Contraseña:</label>
				</div>
				<div class="col-md-10 col-sm-10 col-xs-12">
					<input type="password" class="form-control"  placeholder="Contraseña" name="password" required="required"/>
				</div>
			</div>
			<div class="col-md-12 campos" >
				<input type="submit" class="btn btn-info col-md-8 col-md-offset-2 " value="Registrarse" />
			</div>
			<div class="col-md-12 campos">
				<p>¿Aún no tienes cuenta?<a href="${pageContext.request.contextPath}/user/checkin.html"> Regístrate</a></p>
				<a href="${pageContext.request.contextPath}/user/checkin.html">¿Has olvidado tu contraseña?</a>
			</div>
		</div>
		</form>
		</div>
	</div>
</div>
<script>
function showRegister(){
	$('.registerPop').addClass('show');
	
}
function closeRegister(){
	$('.registerPop').removeClass('show');
}
</script>
