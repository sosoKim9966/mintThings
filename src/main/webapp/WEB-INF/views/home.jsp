<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <c:if test="${userId eq null}">
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=a7b881f1cc5df88a60eddea8e7424190&redirect_uri=http://localhost:8090/wtf&response_type=code">
            <img style="margin: 10px 0 400px 840px;" src="/image/kakao_login_medium_narrow.png">
        </a>
    </c:if>
    <c:if test="${userId ne null}">
        <h1>로그인 성공입니다</h1>
        <a href="/wtf/logout" class="btn btn-danger">
            로그아웃
        </a>
    </c:if>
</body>
</html>
