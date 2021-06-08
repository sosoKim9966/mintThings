<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
</head>
<body>
	<!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

<div class="content-page">
	<div class="content">
 	<!-- Start Content-->
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-5">
					<div class="row justify-content-center">
						<div class="col-xl-8">
							<div id="product-carousel" class="carousel slide product-detail-carousel" data-bs-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active">
										<div>
											<img src="../resources/images/items/${item.item_Image }" alt="product-img" class="img-fluid">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-7"> 
				<h4 class="mb-1">${items.item_Name}</h4>

				<div class="mt-3">
					<h4>판매가 : <span class="text-muted me-2"><del>${item.item_Price}</del></span><br>
					<b> 할인 판매가 : ${item.item_Sale_Price } (할인)</b></h4>
				</div>
				<hr/>

			<div>
			<form class="d-flex flex-wrap align-items-center mb-3">
				<label class="my-1 me-2" for="quantityinput">기종</label>
					<div class="me-sm-3">
						<select class="form-select my-1" id="quantityinput">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
						</select>
					</div>
				<label class="my-1 me-2" for="sizeinput">사이즈</label>
				<div class="me-sm-3">
					<select class="form-select my-1" id="sizeinput">
						<option selected>Small</option>
						<option value="1">Medium</option>
						<option value="2">Large</option>
						<option value="3">X-large</option>
					</select>
				</div>
				<label class="my-1 me-2" for="sizeinput">색상</label>
				<div class="me-sm-3">
					<select class="form-select my-1" id="sizeinput">
						<option selected>Small</option>
						<option value="1">화이트</option>
						<option value="2">블랙</option>
						<option value="3">레드</option>
					</select>
				</div>
				
			</form>
			<div>
				<button type="button" class="btn btn-success waves-effect waves-light">
					<span class="btn-label"><i class="mdi mdi-cart"></i></span>Add to cart
				</button>
			</div>
		</div>
	</div>
</div>
</div>
</div> <!-- container -->
</div> <!-- content -->





</body>
</html>