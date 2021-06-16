<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  

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
		                                <form id="form1" name="form1" enctype="multipart/form-data" method="post">
			                                <div class="product-action">
			                                    <div class="d-flex" style="margin-bottom: -5px; margin-left: 18px;">
			                                        <a href="/items/update/${items.item_No}" class="btn btn-white d-block w-100 action-btn m-2">Edit</a>
			                                        <a href="/items/delete/${items.item_No}" id="deleteBtn" class="btn btn-white d-block w-100 action-btn m-2">Delete</a>
			                                    </div>
			                                </div>
		                                </form>
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
	                <h3 style="text-align: center; color: #3DB7CC;">SALE</h3>
		                <div class="row">
	                		<c:forEach var="items" items="${items}">
			                    <div class="col-sm-2">
			                        <div class="card product-box">
			                            <div class="product-img">
			                                <div class="p-3">
			                                	<a href="/items/detail?item_no=${items.item_No}" class="move">
			                                    <img src="../resources/images/items/${items.item_Image }" class="img-fluid" style=""/></a>
			                                </div>
			                                <div class="product-action">
			                                    <div class="d-flex" style="margin-bottom: -5px; margin-left: 18px;">
			                                        <a href="/items/update/${items.item_No}" class="btn btn-white d-block w-100 action-btn m-2">Edit</a>
			                                    	<a href="/items/delete/${items.item_No}" id="deleteBtn" class="btn btn-white d-block w-100 action-btn m-2">Delete</a>
			                                    </div>
			                                </div>
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