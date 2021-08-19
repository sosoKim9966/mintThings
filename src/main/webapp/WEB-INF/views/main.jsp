<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mainPage</title>
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

</style>
<body>
    <div class="content-page">
        <div class="content">
            <h3 style="text-align: center; color: #3DB7CC; margin-left: -40px;">WEEKLY BEST</h3><br>
            <div class="container-fluid" style="margin-top: 30px;">
                <div class="row" style="margin-left: -70px;">
               		<c:forEach var="items" items="${items}" varStatus="status">
	                    <c:choose>
                        	<c:when test="${status.index % 4 == 0}" >
			                    <div class="col-sm-2" style="margin-left: 320px;">
			                        <div class="card product-box">
			                            <div class="product-img">
			                                <div class="p-3">
			                                	<a href="/items/detail?itemNo=${items.itemNo}" class="move">
			                                    	<img src="<spring:url value='/getImage/${items.saveName}'/>" class="img-fluid"/>
			                                	</a>
			                                </div>
			                                <form id="form1" name="form1" enctype="multipart/form-data" method="post">
				                                <div class="product-action">
				                                    <div class="d-flex" style="margin-bottom: -5px; margin-left: 18px;">
				                                        <a href="/items/update/${items.itemNo}" class="btn btn-white d-block w-100 action-btn m-2">Edit</a>
				                                        <a href="/items/delete/${items.itemNo}" id="deleteBtn" class="btn btn-white d-block w-100 action-btn m-2">Delete</a>
				                                    </div>
				                                </div>
			                                </form>
			                            </div> 
			                            <div class="product-info border-top p-3">
			                                <div>
			                                    <h5 class="font-16 mt-0 mb-1">
			                                   		<a href="/items/detail?itemNo=${items.itemNo}" class="move" style="margin-left: 27px; color: black;">${items.itemName}</a> 
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
			                                   		<a href="/items/detail?itemNo=${items.itemNo}" class="move" style="margin-left: 27px; color: black;">${items.itemName}</a> 
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
                <!--  
                <h3 style="text-align: center; color: #3DB7CC; margin-left: -45px;">SALE</h3>
	                <div class="row">
                		<c:forEach var="items" items="${items}">
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
		                                   		<a href="/items/detail?itemNo=${items.itemNo}" class="move" style="margin-left: 27px; color: black;">${items.itemName}</a> 
		                                    </h5>
		                                    <h4 class="m-0" style="margin-left: 27px;"> <span class="text-muted" > Price : <fmt:formatNumber value="${items.itemPrice}" pattern="###,###,###"/></span></h4>
		                                </div>
	                            	</div> 
		                        </div>
		                    </div>
                		</c:forEach>
	                </div>
	                -->
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