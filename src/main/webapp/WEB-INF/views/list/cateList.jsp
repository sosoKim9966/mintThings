<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
 
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

.navbar{
    margin-bottom: 0px;
}

.nav-find a::before {
    content:'|';
    color: #333;
    padding-right: 5px;
}

#talk {
 	overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
    display: block;
    margin-left: 27px; 
    color: black; 
    padding:0 5px;
}

</style>
<body>
    <div class="content-page">
        <div class="content">
            <!-- Start Content--> 
            <c:choose> 
            	<c:when test="${Best10 eq 'Best10'}">
					<h3 style="text-align: center; color: #3DB7CC; margin-left: -40px;">BEST 10</h3><br>
				</c:when>
				<c:when test="${itemCategoryName eq 'airpods'}">
					<h3 style="text-align: center; color: #3DB7CC; margin-left: -40px;">AIRPODS CASE</h3><br>
				</c:when>
				<c:when test="${itemCategoryName eq 'iphone'}">
					<h3 style="text-align: center; color: #3DB7CC; margin-left: -40px;">IPHONE CASE</h3><br>
				</c:when>
				<c:when test="${itemCategoryName eq 'strap'}">
					<h3 style="text-align: center; color: #3DB7CC; margin-left: -40px;">APPLE WATCH</h3><br>
				</c:when>  
				<c:otherwise>
					<h3 style="text-align: center; color: #3DB7CC; margin-left: -40px;">ALL ITEMS</h3><br>
				</c:otherwise> 
			</c:choose> 
			<nav class="navbar navbar-expand-sm">
				<div class="collapse navbar-collapse" id="navbarsExample03">
					<ul class="navbar-nav mr-auto" style="list-style: none;  margin-right: 320px; float: right; font-size: 12px;">
						<li class="nav-fin">
							<a class="nav-lnk" href="#" style="color: #333; margin-right: 5px;">낮은가격순</a>
						</li>
						<li class="nav-find">
							<a class="nav-link" href="#" style="color: #333; margin-right: 5px;">누적판매순</a>
						</li>
						<li class="nav-find">
							<a class="nav-link" href="#" style="color: #333; margin-right: 5px;">인기도순</a>
						</li>
						<li class="nav-find">
							<a class="nav-link" href="#" style="color: #333; margin-right: 5px;">최신등록순</a>
						</li>
						<li class="nav-find"> 
							<a class="nav-link" href="#" style="color: #333; margin-right: 5px;">리뷰많은순</a>
						</li> 
						<li class="nav-find">
							<a class="nav-link" href="#" style="color: #333; margin-right: 5px;">평점높은순</a>
						</li>
					</ul>
				</div>
			</nav> <br>
            <div class="container-fluid" style="margin-top: -50px;">
                <div class="row" style="margin-left: -70px;">
               		<c:forEach var="items" items="${items}" varStatus="status">
                		<c:choose>
	                        <c:when test="${status.index % 4 == 0}">
	                		    <div class="col-sm-2" style="margin-left: 320px;">
			                        <div class="card product-box">
			                            <div class="product-img">
		                                	<div class="p-3">
			                                	<a href="/items/detail?itemNo=${items.itemNo}" class="move">
			                                    	<img src="<spring:url value='/getImage/${items.saveName}'/>" class="img-fluid"/>
			                                	</a>
			                                </div> 
			                                <div class="product-action">
			                                    <div class="d-flex" style="margin-bottom: -5px; margin-left: 18px;">
			                                         <a href="/items/update/${items.itemNo}" class="btn btn-white d-block w-100 action-btn m-2">Edit</a>
			                                    	<a href="/items/delete/${items.itemNo}" id="deleteBtn" class="btn btn-white d-block w-100 action-btn m-2">Delete</a>
			                                    </div>
			                                </div>
			                            </div> 
			                            <div class="product-info border-top p-3">
			                                <div>
			                                    <h5 class="font-16 mt-0 mb-1">
			                                   		<a href="/items/detail?itemNo=${items.itemNo}" class="move" id="talk">${items.itemName}</a> 
			                                    </h5>
			                                    <h4 class="m-0" style="margin-left: 27px;"> <span class="text-muted" > Price : <fmt:formatNumber value="${items.itemPrice}" pattern="###,###,###"/></span></h4>
			                                </div>
		                           		</div> <!-- end product info-->
			                        </div>
			                    </div>
	           				</c:when>
							<c:otherwise>
							    <div class="col-sm-2">
			                        <div class="card product-box">
			                            <div class="product-img">
		                                	<div class="p-3">
			                                	<a href="/items/detail?itemNo=${items.itemNo}" class="move">
			                                    	<img src="<spring:url value='/getImage/${items.saveName}'/>" class="img-fluid"/>
			                                	</a>
			                                </div> 
			                                <div class="product-action">
			                                    <div class="d-flex" style="margin-bottom: -5px; margin-left: 18px;">
			                                         <a href="/items/update/${items.itemNo}" class="btn btn-white d-block w-100 action-btn m-2">Edit</a>
			                                    	<a href="/items/delete/${items.itemNo}" id="deleteBtn" class="btn btn-white d-block w-100 action-btn m-2">Delete</a>
			                                    </div>
			                                </div>
			                            </div> 
			                            <div class="product-info border-top p-3">
			                                <div>
			                                    <h5 class="font-16 mt-0 mb-1">
			                                   		<a href="/items/detail?itemNo=${items.itemNo}" id="talk" class="move">${items.itemName}</a> 
			                                    </h5>
			                                    <h4 class="m-0" style="margin-left: 27px;"> <span class="text-muted" > Price : <fmt:formatNumber value="${items.itemPrice}" pattern="###,###,###"/></span></h4>
			                                </div>
		                           		</div> <!-- end product info-->
			                        </div>
			                    </div>
							</c:otherwise>
						</c:choose>
               		</c:forEach>
                </div>                
            </div> <!-- container -->
        </div> <!-- content -->
    </div>
    <c:choose> 
        <%-- <c:when test="${itemCategoryName eq itemCategoryName}">
			<ul class="btn-group pagination" style="margin-left: 580px;">
			    <c:if test="${pageMaker.prev}">
				    <li>
				        <a href='<c:url value="/cateList/${itemCategoryName}?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
				    </li>
				    </c:if>
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="pageNum">
				    <li>
				        <a href='<c:url value="/cateList/${itemCategoryName}?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
				    </li>
				    </c:forEach>
				    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				    <li>
				        <a href='<c:url value="/cateList/${itemCategoryName}?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
				    </li>
			    </c:if>
			</ul>
        </c:when> --%>
        <c:when test="${all eq 'all'}">
			<ul class="btn-group pagination" style="margin-left: 890px;">
			    <c:if test="${pageMaker.prev}">
				    <li>
				        <a href='<c:url value="/cateList/all?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
				    </li>
				    </c:if>
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="pageNum">
				    <li>
				        <a href='<c:url value="/cateList/all?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
				    </li>
				    </c:forEach>
				    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				    <li>
				        <a href='<c:url value="/cateList/all?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
				    </li>
			    </c:if>
			</ul>
        </c:when>
	</c:choose>
    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->
<script type="text/javascript">
</script>
    
</body>
</html>