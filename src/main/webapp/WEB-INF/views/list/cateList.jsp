<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>cateList</title>
	<!-- App favicon -->
    <link rel="shortcut icon" href="../resources/static/assets/images/favicon.ico">

	<!-- App css -->
	<link href="../resources/static/assets/css/modern/app-modern.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />
</head>
<style>
img {
	width: 250px;
	height: 250px;
	display: inline-block;
	margin: 30px;
}

div.content-page {
	margin-left : 0;
}

</style>
<body>
    <div class="content-page">
        <div class="content">
            <!-- Start Content--> <!-- 1, 5, 10 마다 " style="margin-left: 105px;" -->
            <div class="container-fluid">
                <h3 style="text-align: center; color: #3DB7CC;">WEEKLY BEST</h3>
	                <div class="row">
                		<c:forEach var="items" items="${items}">
		                    <div class="col-sm-2">
		                        <div class="card product-box">
		                            <div class="product-img">
		                                <div class="p-3">
		                                	<a href="/items/detail?item_no=${items.item_No}" class="move">
		                                    <img src="../resources/images/items/${items.item_Image }" class="img-fluid" style=""/></a>
		                                </div>
		                                <!-- 관리자 페이지만 보이게 하기
		                                <div class="product-action">
		                                    <div class="d-flex">
		                                        <a href="javascript: void(0);" class="btn btn-white d-block w-100 action-btn m-2"><i class="ri-edit-2-fill align-middle"></i> Edit</a>
		                                        <a href="javascript: void(0);" class="btn btn-white d-block w-100 action-btn m-2"><i class="ri-delete-bin-fill align-middle"></i> Delete</a>
		                                    </div>
		                                </div>
		                                -->
		                            </div> 
		                            <div class="product-info border-top p-3">
	                                <div>
	                                    <h5 class="font-16 mt-0 mb-1">
	                                   		<a href="/items/detail?item_no=${items.item_No}" class="move" style="margin-left: 27px; color: black;">${items.item_Name}</a> 
	                                    </h5>
	                                    <h4 class="m-0" style="margin-left: 27px;"> <span class="text-muted" > Price : <fmt:formatNumber value="${items.item_Price}" pattern="###,###,###"/></span></h4>
	                                </div>
	                            </div> <!-- end product info-->
		                        </div>
		                    </div>
                		</c:forEach>
	                </div>
	            <!-- 페이징 시작 -->    
                <div class="row">
                    <div class="col-12">
                       <c:if test ="${paging.startPage != 1 }">
                       		<a href="/list/cateList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
                       </c:if>
                       <c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="p">
                       		<c:choose>
                       			<c:when test="${p == paging.nowPage }">
                       				<b>${p }</b>
                       			</c:when>
                       			<c:when test="${p != paging.nowPage }">
									<a href="/list/cateList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
                       			</c:when>
                       		</c:choose>
                       </c:forEach>
                       <c:if test="${paging.endPage != paging.lastPage }">
                       		<a href="/list/cateList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
                       </c:if>
                    </div> 
                </div> 
                <!-- end row-->
                
            </div> <!-- container -->

        </div> <!-- content -->
		
    </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->
<script>

</script>
    
</body>
</html>