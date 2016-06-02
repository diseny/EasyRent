<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<div class="carousel-imagenes">
	<!-- Vamos a hacer un slider de prueba , pero tiene que coger las imagenes de la base de datos -->
	<div id="carousel" class="carousel slide prevcarousel" data-ride="carousel">
		<div class="carousel-inner" >
		 	<div class="item active slider" style="height:100%; background-image: url('http://www.construyehogar.com/wp-content/uploads/2015/06/Dise%C3%B1o-de-casa-moderna-de-dos-plantas.jpg');background-size: 50%;background-position: 50%; background-repeat: no-repeat;">
				 <img  id="close-icon" onclick="closeSlider()" src='${pageContext.request.contextPath}/images/closeIcon.png'/>
			 </div>
			 <div class="item" style="height:100%; background-image: url('http://decoracao.com/wp-content/uploads/2013/02/330.jpg');background-size: 50%;background-position: 50%;background-repeat: no-repeat;">	
				<img id="close-icon" onclick="closeSlider()" src='${pageContext.request.contextPath}/images/closeIcon.png'/>
			</div>
			 <div class="item" style="height:100%; background-image: url('http://inmobiliaria56.com/wp-content/uploads/2014/01/Casa-modelo-1.jpg');background-size: 50%;background-position: 50%;background-repeat: no-repeat;">	
				<img id="close-icon" onclick="closeSlider()" src='${pageContext.request.contextPath}/images/closeIcon.png'/>
			</div>
			 <div class="item" style="height:100%; background-image: url('http://www.casas--prefabricadas.es/wp-content/uploads/2014/11/Haus-Casas-Pref.jpg');background-size: 50%;background-position: 50%;background-repeat: no-repeat;">	
				<img id="close-icon" onclick="closeSlider()" src='${pageContext.request.contextPath}/images/closeIcon.png'/>
			</div>
		</div>
	<a id="slider-left" class="left carousel-control" href="#carousel" data-slide="prev">
         <i class="material-icons"></i>
     </a>
     <a id="slider-right" class="right carousel-control" href="#carousel" data-slide="next">
         <i class="material-icons"></i>
     </a>
    </div>
   
	<div id="thumbcarousel" class=" carousel slide thumbscarousel" data-interval="false">
	    <div class="carousel-inner">
		    <div class="item active row">
		   		 <div data-target="#carousel" data-slide-to="0"  class="thumb col-md-1 col-md-offset-4" style="height:100px;background-image: url('http://www.construyehogar.com/wp-content/uploads/2015/06/Dise%C3%B1o-de-casa-moderna-de-dos-plantas.jpg');background-size: cover;background-position: 100%; background-repeat: no-repeat;">
		   	 	</div>
			   	 <div data-target="#carousel" data-slide-to="1" class="thumb col-md-1"  style="margin-left:15px;height:100px;background-image: url('http://decoracao.com/wp-content/uploads/2013/02/330.jpg');background-size: cover;background-position: 100%; background-repeat: no-repeat;">
				</div>
				<div data-target="#carousel" data-slide-to="2"  class="thumb col-md-1 " style="margin-left:15px;height:100px;background-image: url('http://inmobiliaria56.com/wp-content/uploads/2014/01/Casa-modelo-1.jpg');background-size: cover;background-position: 100%; background-repeat: no-repeat;">
		   	 	</div>
		   	 	<div data-target="#carousel" data-slide-to="3" class="thumb col-md-1"  style="margin-left:15px;height:100px;background-image: url('http://www.casas--prefabricadas.es/wp-content/uploads/2014/11/Haus-Casas-Pref.jpg');background-size: cover;background-position: 100%; background-repeat: no-repeat;">
				</div>
		 	</div>
	  <!-- 
	  Si hay mas de cuatro imagenes: 
	  <a id="slider-left" class="left carousel-control" href="#thumbcarousel" data-slide="prev">
                        <i class="material-icons"></i>
      </a>
      <a id="slider-right" class="right carousel-control" href="#thumbcarousel" data-slide="next">
          <i class="material-icons"></i>
      </a>	 -->		
      	</div>	
    </div>
</div>
<!-- AHORA LA PÁGINA -->
<t:paginabasica title="EasyRent">
<jsp:body>
</div></div>
	<br><br><br>
	<div class="row">
	<div class="col-md-12" style="min-height:230px;background-color: rgba(0, 0, 0, 0.498039);">
		AQUI VA LA DESCRIPION
	</div>
	
	<div class="col-md-4 fotosInfo" style="height:300px ;background-image: url('http://www.construyehogar.com/wp-content/uploads/2015/06/Dise%C3%B1o-de-casa-moderna-de-dos-plantas.jpg');background-size: cover;background-position: 100%; background-repeat: no-repeat;">
		<h1>FOTOS</h1>
	</div>
	</div>
	
	<script>
		$('.fotosInfo').click(function(){
			jQuery('.carousel-imagenes').addClass("show");
		});
		
		function closeSlider(){
			jQuery('.carousel-imagenes').removeClass("show");
		}
			
		
	</script>
	      <div class="col-md-8"></div>
      
	<h2>${property.id}</h2>
</jsp:body>
</t:paginabasica>
