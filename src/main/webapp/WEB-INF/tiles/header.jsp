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
  <div class="collapse navbar-collapse" id="navbarsExample03">
  	<ul class="navbar-nav mr-auto" style="list-style: none; margin-left: 325px; font-size: 12px;">
      <li class="nav-item">
        <a class="nav-link" href="#" style="color: black; margin-right: 20px;">회원가입</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" style="color: black; margin-right: 20px;">로그인</a>
      </li>
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
        <a class="nav-link" href="#" style="color: black;">게시판</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-md-0">
      <i class="fa fa-search" aria-hidden="true" style="color: black; margin-left: 500px;"></i>
      <input class="form-control" type="text" placeholder="Search" style="font-size: 12px;">
    </form>
  </div>
</nav> <br><br><br>

<div>
	<h1 align="center" style="font: bold; font-size: 45px; margin-left: -30px;"><a href="/main" style="color:#B2EBF4; text-decoration: none ;">mintThings.</a></h1><br><br><hr> 
	<div class="container">
		<div class="row">
        <div>
          <ul>
            <li style="display: inline-block; margin-left: 100px; margin-right: 130px; "><a href="/cateList/Best10" style="color: black;">Best10</a></li>
            <li style="display: inline-block; margin-right: 130px;"><a href="#" style="color: black;">apple watch</a></li>
            <li style="display: inline-block; margin-right: 130px;"><a href="#" style="color: black;">iphone case</a></li>
            <li style="display: inline-block; margin-right: 130px;"><a href="#" style="color: black;">airpods case</a></li>
            <li style="display: inline-block; margin-right: 130px;"><a href="/cateList/all" style="color: black;">all</a></li>
          </ul>
        </div>
      </div>
    </div>
</div>
</body>
</html>