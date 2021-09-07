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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

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

#talk{
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
<ul class="bxslider" style="border: none;">
	<li><img style="width: 1860px; height: 500px; margin: -16px 0 -10px 15px;" src="/image/01.png"/></li> 
	<li><img style="width: 1860px; height: 500px; margin: -16px 0 -10px 15px;" src="/image/02.png" /></li> 
	<li><img style="width: 1860px; height: 500px; margin: -16px 0 -10px 15px;" src="/image/03.png" /></li> 
</ul>
    <div class="content-page">
        <div class="content">
            <h3 style="text-align: center; color: #3DB7CC; margin-left: 13px; margin-top: -60px;">WEEKLY BEST</h3><br>
            <div class="container-fluid" style="margin-top: 30px;">
                <div class="row">
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
			                                   		<a href="/items/detail?itemNo=${items.itemNo}" class="move" id="talk" >${items.itemName}</a> 
			                                    </h5>
			                                    <h4 class="m-0" style="margin-left: 35px;"> <span class="text-muted" > Price : <fmt:formatNumber value="${items.itemPrice}" pattern="###,###,###"/></span></h4>
			                                </div>
		                           		</div> <!-- end product info-->
			                        </div>
			                    </div>
							</c:otherwise>
						</c:choose>
               		</c:forEach>
                </div>
           	</div> <!-- container -->
           	<div> <!-- 페이징 -->
	           	<ul class="btn-group pagination" style="margin-left: 920px;">
				    <c:if test="${pageMaker.prev}">
					    <li>
					        <a href='<c:url value="/main?page=${startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
					    </li>
				    </c:if>
				    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
					    <li>
					        <a href='<c:url value="/main?page=${pageNum}"/>'><i class="fa">${pageNum }</i></a>
					    </li>
				    </c:forEach>
				    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					    <li>
					        <a href='<c:url value="/main?page=${pageMaker.endPage+1}"/>'><i class="fa fa-chevron-right"></i></a>
					    </li>
			   	 	</c:if>
				</ul>
           	</div>
        </div> <!-- content -->
    </div>	

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->
<script>
//<![CDATA[ 
	$(document).ready(function(){ 
		$('.bxslider').bxSlider({
			auto: true, 
			speed: 500,
			pause: 4000, 
			mode:'horizontal' 
		});
	});	
//]]> 

</script>    
<script>

$(function(){
	//searchType select 박스 설정
	setSearchTypeSelect();
	
	//prev 버튼 활성화, 비활성화 처리
	var canPrev = '${pageMaker.prev}';
	if(canPrev !== 'true'){
		$('#page-prev').addClass('disabled');
	}
	
	//next 버튼 활성화, 비활성화 처리
	var canNext = '${pageMaker.next}';
	if(canNext !== 'true'){
		$('#page-next').addClass('disabled');
	}
	
	//현재 페이지 파란색으로 활성화
	var thisPage = '${pageMaker.cri.page}';
	//매번 refresh 되므로 다른 페이지 removeClass 할 필요는 없음->Ajax 이용시엔 해야함
	$('#page'+thisPage).addClass('active');
})

function setSearchTypeSelect(){
	var $searchTypeSel = $('"all"');
	var $keyword = $('#keyword');
	
	$searchTypeSel.val('${pageMaker.cri.searchType}').prop("selected",true);
	//검색 버튼이 눌리면
	$('#searchBtn').on('click',function(){
		var searchTypeVal = $searchTypeSel.val();
		var keywordVal = $keyword.val();
		
		if(!keywordVal){
			alert("검색어를 입력하세요!");
			$('#keyword').focus();
			return;
		}
		var url = "main?page=1"
			+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"
			+ "&searchType=" + searchTypeVal
			+ "&keyword=" + encodeURIComponent(keywordVal);
		window.location.href = url;
	});
};
</script>
</body>
</html>