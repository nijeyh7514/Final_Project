<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 메뉴부분 -->
<link rel="stylesheet" href="css/menu.css">
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
</head>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	
</script>
<body>
<form action="goodsSearchList" method="get">
	  <div class="container"> 
	  
	  <nav>
	    <div class="navbar-header">	    		
	    </div>
	    
	    <ul class="nav navbar-nav justify-content-center">
	     <li class="dropdown">
	        <a class="dropdown-toggle" data-toggle="dropdown" href="goodsList?gCategory=fruits">
	        	fruits
	        	<span class="caret"></span>
	        </a>
	        
	        <ul class="dropdown-menu">
	          <li><a href="goodsList?gCategory=fruits">과일전체</a></li>
	          <li><a href="goodsList?gCategory=fruits&gUCategory=domestic">국내산</a></li>
	          <li><a href="goodsList?gCategory=fruits&gUCategory=Imported">수입산</a></li>	         
	        </ul>
	      </li>
	      
	    <li class="dropdown">
	        <a class="dropdown-toggle" data-toggle="dropdown" href="goodsList?gCategory=seafood">
	        	seafood<span class="caret"></span>
	        </a>	        
	     <ul class="dropdown-menu">
	          <li><a href="goodsList?gCategory=seafood">해산물전체</a></li>
	          <li><a href="goodsList?gCategory=seafood&gUCategory=fish">생선류</a></li>
	          <li><a href="goodsList?gCategory=seafood&gUCategory=shellfish">조개류</a></li>
	         
	      </ul>
	    </li>
	      
	       <li class="dropdown">
	        <a class="dropdown-toggle" data-toggle="dropdown" href="goodsList?gCategory=meat">
	        	meat<span class="caret"></span>
	        </a>
	        <ul class="dropdown-menu">
	          <li><a href="goodsList?gCategory=meat">육류전체</a></li>
	          <li><a href="goodsList?gCategory=meat&gUCategory=chicken">닭고기</a></li>
	          <li><a href="goodsList?gCategory=meat&gUCategory=cowpig">돼지고기</a></li>	         
	        </ul>
	      </li>
	      
	       <li class="dropdown">
	        <a class="dropdown-toggle" data-toggle="dropdown" href="goodsList?gCategory=snack">
	        	snack<span class="caret"></span>
	        </a>
	        <ul class="dropdown-menu">
	          <li><a href="goodsList?gCategory=snack">간식전체</a></li>
	          <li><a href="goodsList?gCategory=snack&gUCategory=cookie">쿠키류</a></li>
	          <li><a href="goodsList?gCategory=snack&gUCategory=icecream">아이스크림</a></li>	         
	        </ul>
	      </li>
	      </ul>    
	    <br>
	    </nav>
	     </div>
	     	
	</form>	 

	
		<div class="search1">
			<select name="searchName">
				<option value="gName">상품명</option>
				<option value="gContent">상품내용</option>
			</select>
			<input type="text" name="searchValue" id="searchValue">
			<input type="submit" value="검색" class="searchBtn1">
		</div>
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>