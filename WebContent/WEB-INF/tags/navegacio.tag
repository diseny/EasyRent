<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ tag pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<c:set var="user" scope="request" value='${session.getAttribute("user")}'/>
<div class="col-md-12 headerNav">
<div class="col-md-1 logo-header">
<img src="${pageContext.request.contextPath}/images/easyrent.jpg" alt="EasyRent logo" style="width:100px;height:70px;float:left">
</div>
<div class="col-md-11">

<nav class="navbar navbar-default" role="navigation">
                  <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                      </button>
                      <a class="navbar-brand" href="#">Bootflat</a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                      <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Link</a></li>
                        <!-- <li class="disabled"><a href="#">Link</a></li> -->
                        <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                          <ul class="dropdown-menu" role="menu">
                            <li class="dropdown-header">Setting</li>
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li class="active"><a href="#">Separated link</a></li>
                            <li class="divider"></li>
                            <li class="disabled"><a href="#">One more separated link</a></li>
                          </ul>
                        </li>
                      </ul>
                      <div >
                      </div>
                      <form class="navbar-form navbar-right" role="search">
                        <div class="form-search search-only">
                          <i class="search-icon glyphicon glyphicon-search"></i>
                          <input type="text" class="form-control search-query">
                        </div>
                      </form>
                    </div><!-- /.navbar-collapse -->
                  </div><!-- /.container-fluid -->
                </nav>

</div>
</div>

