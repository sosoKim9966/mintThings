<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<style type="text/css">
	</style>
</head>

<body>
<nav class="navbar navbar-expand-sm">
  <div class="collapse navbar-collapse" id="navbarsExample03" style="margin-top: 5px;">
  	<ul class="navbar-nav mr-auto" style="list-style: none; margin-left: 280px; font-size: 12px;">
      	<c:if test="${userId eq null}">
	      <li class="nav-item">
	        <a class="nav-link" href="#" style="color: black; margin-right: 20px;">회원가입</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/wtf" style="color: black; margin-right: 20px;">로그인</a>
	      </li>  
	    </c:if>
	    <c:if test="${userId ne null}">
	      	<p>반갑습니다. ${nickname}님</p>
	      	 <li class="nav-item">
		        <a class="nav-link" href="/wtf/logout" style="color: black; margin-right: 20px;">로그아웃</a>
		     </li>  
	    </c:if>
      <li class="nav-item">
        <a class="nav-link" href="#" style="color: black; margin-right: 20px;">주문조회</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" style="color: black; margin-right: 20px;">장바구니</a>
      </li>
      <li class="nav-item"> 
        <a class="nav-link" href="#" style="color: black; margin-right: 20px;">마이페이지</a>
      </li> 
      <li class="nav-item">
        <a class="nav-link" href="/board/notice" style="color: black; margin-right: 20px;">게시판</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/items/register" style="color: black;">상품등록</a>
      </li>
    </ul>
    
    <c:if test="${item eq 'item'}">
		<form class="form-inline my-2 my-md-0">
			<select id="searchTypeSel" name="searchType" style="margin-left: 350px; display: none;">
				<option value="t"></option> 
				<option value="c"></option>
				<option value="w"></option>
				<option value="tc"></option>
				<option value="all"></option>
			</select>
			<i class="fa fa-search" aria-hidden="true" style="color: black; margin-left: 575px;"></i>
			<input class="form-control" type="text" placeholder="Search" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" style="font-size: 12px;">
			<button id="searchBtn" class="btn btn-primary" style="display: none;"></button>
		</form>
    </c:if>
    <c:if test="${board eq 'board'}">
       <div class="form-inline my-2 my-md-0" >
		<select id="searchTypeSel" name="searchType" style="margin-left: 350px; display: none;">
			<option value="t"></option> 
			<option value="c"></option>
			<option value="w"></option>
			<option value="tc"></option>
			<option value="all"></option>
		</select>
		<i class="fa fa-search" aria-hidden="true" style="color: black; margin-left: 575px;"></i>
		<input class="form-control" type="text" placeholder="Search" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" style="font-size: 12px;">
		<button id="searchBtn" class="btn btn-primary" style="display: none;"></button>
	</div>
    </c:if>
  </div>
</nav> <br><br><br>
<div>
	<h1 align="center" style="font: bold; font-size: 45px; margin-left: -30px;"><a href="/main" style="color:#B2EBF4; text-decoration: none ;">mintThings.</a></h1><br><br><hr> 
	<div class="container">
		<div class="row">
        <div>
        <c:choose> 
            	<c:when test="${item eq 'item'}">
            		<ul>
			            <li style="display: inline-block; margin-left: 100px; margin-right: 130px; "><a href="/cateList/Best10" style="color: black;">Best10</a></li>
			            <li style="display: inline-block; margin-right: 130px;"><a href="/cateList/strap" style="color: black;">apple watch</a></li>
			            <li style="display: inline-block; margin-right: 130px;"><a href="/cateList/iphone" style="color: black;">iphone case</a></li>
			            <li style="display: inline-block; margin-right: 130px;"><a href="/cateList/airpods" style="color: black;">airpods case</a></li>
			            <li style="display: inline-block; margin-right: 130px;"><a href="/cateList/all" style="color: black;">all</a></li>
			        </ul>
            	</c:when>
            	<c:when test="${board eq 'board'}">
            		<ul>
			            <li style="display: inline-block; margin-left: 200px; margin-right: 150px; "><a href="/board/notice" style="color: black;">NOTICE</a></li>
			            <li style="display: inline-block; margin-right: 130px;"><a href="/board/qa" style="color: black;">Q&A</a></li>
			            <li style="display: inline-block; margin-right: 130px;"><a href="/board/reivew" style="color: black;">REVIEW</a></li>
			            <li style="display: inline-block; margin-right: 130px;"><a href="/board/photo" style="color: black;">PHOTO REVIEW</a></li>
			        </ul>
				</c:when>
        </c:choose>     	
        </div>
      </div>
    </div>
</div>
<script type="text/javascript">

</script>
</body>
</html>