 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>

<link rel="stylesheet" href="css/menu.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>


 <div class="container">
	  <div id="myCarousel" class="carousel slide" data-ride="carousel">
	    
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	    </ol>
	
	    <!--Wrapper for slides-->
	    <div class="carousel-inner">
	      <div class="item active">
	      	<a href="#">
	        <img src="images/Carousel1.png" alt="Carousel1">
	        <div class="carousel-caption">
	     	</a>
	        </div>
	      </div>
	
	      <div class="item">
	      	<a href="#">
	        <img src="images/Carousel2.png" alt="Carousel2">
	        <div class="carousel-caption">
	        </a>
	        </div>
	      </div>
	    
	      <div class="item">
	    	 <a href="#">	
	        <img src="images/Carousel3.png" alt="Carousel3">
	        <div class="carousel-caption">
	       	</a>
	        </div>
	      </div>
	  
	    </div>
	
	   
	    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right"></span>
	      <span class="sr-only">Next</span>
	    </a>
	  </div>  
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>