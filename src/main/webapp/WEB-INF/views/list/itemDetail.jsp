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
<style>
img {
	width: 500px;
	height: 500px;
	margin: 50px 10px 50px 400px; 
	display: inline-block;
	position: relative;
}

div.col-lg-5 {
	width: 500px;
	display: inline-block;	
	position: relative;
	float: right;
	margin-top: -570px;
	margin-right: 450px;
}
</style>
<body>

<div class="content-page">
	<div class="content">
 	<!-- Start Content-->
		<div class="container-fluid">
			<div class="row">
				<div class="row justify-content-center">
					<div id="product-carousel" class="carousel slide product-detail-carousel" data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<div>
									<img src="../resources/images/items/${items.item_Image }" alt="product-img" class="img-fluid">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-5"> 
				<h3 class="mb-1">
					<c:out value="${items.item_Name}"/>
				</h3>
				<h5>
					<c:out value="${items.item_Content}"/>
				</h5>
				<hr/>
				<div class="mt-3">
					<h5>판매가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="text-muted me-2"><del><fmt:formatNumber value="${items.item_Price}"/>원</del></span><br><br>
					<b> 할인 판매가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${items.item_Sale_Price}"/>원 (<fmt:formatNumber value="${items.item_Price-items.item_Sale_Price}"/>원 할인)</b></h5>
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
					</div><hr/>
				<label class="my-1 me-2" for="sizeinput">색상</label>
				<div class="me-sm-3">
							<select class="form-select my-1" id="sizeinput">
								<%-- <c:forEach var="itemOp" items="itemOp">
									<option value="${itemOp.item_Color_Ip}">${itemOp.item_Color_Ip}</option>
								</c:forEach> --%>
							</select>
				</div><hr/>
				<label class="my-1 me-2" for="sizeinput">수량</label>
				<div class="me-sm-3">
					<input type="number" class="numBox" min="1" max="${items.item_Stock}" value="1" readonly="readonly"/>
					<button type="button" class="plus">+</button>
					<button type="button" class="minus">-</button>
				</div><hr/>
				<div class="mt-3">
					<b>총 상품 금액&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${items.item_Price}"/>원</b>
				</div>		
				
			</form>
			<br>
			<div style="margin-top: 10px;">
				<button type="button" class="btn btn-link" style="width: 230px; border: solid 1px #BDBDBD; color: black; text-decoration: none ;">
					<span class="btn-label"><i class="mdi mdi-cart"></i></span>ADD TO CART
				</button>
				<button type="button" class="btn btn-link" style="width: 230px; border: solid 1px #BDBDBD; color: black; text-decoration: none ;">
					<span class="btn-label"><i class="mdi mdi-cart"></i></span>WISH LIST
				</button>
				<br>
				<button type="button" class="btn btn-link" style="width: 465px; margin-top: 10px; border: solid 1px #5CD1E5; color: black; text-decoration: none ;">
					<span class="btn-label"><i class="mdi mdi-cart"></i></span>BUY IT NOW
				</button>
			</div>
		</div>
	</div>
</div>
</div>
</div> <!-- container -->
</div> <!-- content -->

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<script>
  $(".plus").click(function(){
   var num = $(".numBox").val();
   var plusNum = Number(num) + 1;
   
   if(plusNum >= ${items.item_Stock}) {
    $(".numBox").val(num);
   } else {
    $(".numBox").val(plusNum);          
   }
  });
  
  $(".minus").click(function(){
   var num = $(".numBox").val();
   var minusNum = Number(num) - 1;
   
   if(minusNum <= 0) {
    $(".numBox").val(num);
   } else {
    $(".numBox").val(minusNum);          
   }
  });
 </script>

</body>
</html>