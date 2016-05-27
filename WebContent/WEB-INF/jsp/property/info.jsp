<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:paginabasica title="EasyRent">
<jsp:body>
	</div></div>
	<div class="carousel-imagenes col-md-4">
	<!-- Vamos a hacer un slider de prueba , pero tiene que coger las imagenes de la base de datos -->
	<div id="carousel" class="carousel slide prevcarousel" data-ride="carousel">
		 <div class="carousel-inner" style="height:300px ">
		 	<div class="item active slider" style="height:300px; background-image: url('http://www.construyehogar.com/wp-content/uploads/2015/06/Dise%C3%B1o-de-casa-moderna-de-dos-plantas.jpg');background-size: cover;background-position: 100%; background-repeat: no-repeat;">
			 </div>
			 <div class="item" style="height:300px; background-image: url('http://inmobiliaria56.com/wp-content/uploads/2014/01/Casa-modelo-1.jpg');background-size: cover;background-position: 100%;background-repeat: no-repeat;">	
			</div>
		</div>
	<a id="paradou-left" class="left carousel-control" href="#carousel" data-slide="prev">
         <i class="material-icons"></i>
     </a>
     <a id="paradou-rigth" class="right carousel-control" href="#carousel" data-slide="next">
         <i class="material-icons"></i>
     </a>
     </div>
   
	<div id="thumbcarousel" class=" carousel slide thumbscarousel" data-interval="false">
	    <div class="carousel-inner">
	    <div class="item active row">
	   	 <div data-target="#carousel" data-slide-to="0"  class="thumb col-md-3" style="height:100px;background-image: url('http://www.construyehogar.com/wp-content/uploads/2015/06/Dise%C3%B1o-de-casa-moderna-de-dos-plantas.jpg');background-size: cover;background-position: 100%; background-repeat: no-repeat;">
	   	 </div>
	   	 <div data-target="#carousel" data-slide-to="1" class="thumb col-md-3"  style="height:100px;background-image: url('http://inmobiliaria56.com/wp-content/uploads/2014/01/Casa-modelo-1.jpg');background-size: cover;background-position: 100%; background-repeat: no-repeat;">
		</div>
		</div>
	  <!-- <a id="paradou-left" class="left carousel-control" href="#thumbcarousel" data-slide="prev">
                        <i class="material-icons"></i>
      </a>
      <a id="paradou-rigth" class="right carousel-control" href="#thumbcarousel" data-slide="next">
          <i class="material-icons"></i>
      </a>	 -->		
      </div>	
      </div>
      <div class="col-md-8"></div>
	<h2>${property.id}</h2>
</jsp:body>
</t:paginabasica>