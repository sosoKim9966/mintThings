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
<title>Insert title here</title>
</head>
<body>
    <div class="content-page">
        <div class="content">
            <div class="admin_content_main">
               	<form action="/admin/goodsEnroll" method="post" id="enrollForm">
               		<div class="form_section">
               			<div class="form_section_title">
               				<label>아이템 카테고리</label>
               			</div>
               			<div class="form_section_content">
               				<input name="item_Category">
               			</div>
               		</div>
               		<div class="form_section">
               			<div class="form_section_title">
               				<label>아이템 </label>
               			</div>
               			<div class="form_section_content">
               				<input name="bookName">
               			</div>
               		</div>
               		<div class="form_section">
               			<div class="form_section_title">
               				<label>작가</label>
               			</div>
               			<div class="form_section_content">
               				<input name="authorId" value="0">
               			</div>
               		</div>            
               		<div class="form_section">
               			<div class="form_section_title">
               				<label>출판일</label>
               			</div>
               			<div class="form_section_content">
               				<input name="publeYear">
               			</div>
               		</div>            
               		<div class="form_section">
               			<div class="form_section_title">
               				<label>출판사</label>
               			</div>
               			<div class="form_section_content">
               				<input name="publisher">
               			</div>
               		</div>             
               		<div class="form_section">
               			<div class="form_section_title">
               				<label>책 카테고리</label>
               			</div>
               			<div class="form_section_content">
               				<input name="cateCode">
               			</div>
               		</div>          
               		<div class="form_section">
               			<div class="form_section_title">
               				<label>상품 가격</label>
               			</div>
               			<div class="form_section_content">
               				<input name="bookPrice" value="0">
               			</div>
               		</div>               
               		<div class="form_section">
               			<div class="form_section_title">
               				<label>상품 재고</label>
               			</div>
               			<div class="form_section_content">
               				<input name="bookStock" value="0">
               			</div>
               		</div>          
               		<div class="form_section">
               			<div class="form_section_title">
               				<label>상품 할인율</label>
               			</div>
               			<div class="form_section_content">
               				<input name="bookDiscount" value="0">
               			</div>
               		</div>          		
               		<div class="form_section">
               			<div class="form_section_title">
               				<label>책 소개</label>
               			</div>
               			<div class="form_section_content">
               				<input name="bookIntro">
               			</div>
               		</div>        		
               		<div class="form_section">
               			<div class="form_section_title">
               				<label>책 목차</label>
               			</div>
               			<div class="form_section_content">
               				<input name="bookContents">
               			</div>
               		</div>
              	</form>
	       		<div class="btn_section">
	       			<button id="cancelBtn" class="btn">취 소</button>
	         		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
	         	</div> 
          </div>  
		</div>
    </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->
<script>

</script>
    
</body>
</html>