<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>mintThings</title>
  
  
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
  <link rel="stylesheet" style="text/css" href="/resources/static/css/footer.css"/>
  <script type="text/javascript" src="/resources/js/jquery-3.6.0.min.js"></script>
  <!-- Ionicons 
  <link rel="stylesheet" href="<c:url value='/resources/bower_components/Ionicons/css/ionicons.min.css' />">-->
  <!-- Theme style 
  <link rel="stylesheet" href="<c:url value='/resources/dist/css/AdminLTE.min.css' />">
  -AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. 
  <link rel="stylesheet" href="<c:url value='/resources/dist/css/skins/skin-blue.min.css' />">-->

  <!-- Google Font
  <link rel="stylesheet"  href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic" /> -->
</head>
<body>
<!-- header -->
<div id="header">
	<tiles:insertAttribute name="header" ignore="true" />
</div>

<!-- content -->
<div id="content">
	<tiles:insertAttribute name="content" ignore="true" />
</div>

<!-- footer -->
<div id="footer">
	<tiles:insertAttribute name="footer" ignore="true" />
</div>
</body>
</html>