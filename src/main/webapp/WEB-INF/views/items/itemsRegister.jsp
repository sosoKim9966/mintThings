<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>아이템 등록하기</title>
</head>
<body>
<h2 style="text-align: center;">아이템 등록</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form method="post" action="/items/register">
		<input type="text" name="item_Category_Name" style="width: 20%; margin-bottom: 5px;" placeholder="아이템 카테고리 이름"/><br>
		<input type="text" name="item_Name" style="width: 20%; margin-bottom: 5px;" placeholder="아이템 이름"/><br>
		<input type="text" name="item_Price" style="width: 20%; margin-bottom: 5px;" placeholder="아이템 가격"/><br>
		<input type="text" name="item_Sale_Price" style="width: 20%; margin-bottom: 5px;" placeholder="아이템 세일가격"/><br>
		<input type="text" name="item_Stock" style="width:  20%; margin-bottom: 5px;" placeholder="아이템 재고"/><br>
		<input type="text" name="item_RefundYn" style="width: 20%; margin-bottom: 5px;" placeholder="아이템 환불 여부('N', 'Y')"/><br>
		<br><br> 
		<textarea id="summernote" name="item_Content"></textarea>
		<input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>
	</form>
</div>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
    
<script>
function goWrite(frm) {
	var item_Category_Name = frm.item_Category_Name.value;
	var item_Name = frm.item_Name.value;
	var item_Price = frm.item_Price.value;
	var item_Sale_Price = frm.item_Sale_Price.value;
	var item_Stock = frm.item_Stock.value;
	var item_RefundYn = frm.item_RefundYn.value;
	var item_Content = frm.item_Content.value;
	
	if (item_Category_Name.trim() == ''){
		alert("카테고리 이름을 입력해주세요");
		return false;
	}
	if (item_Name.trim() == ''){
		alert("아이템 이름을 입력해주세요");
		return false;
	}
	if (item_Price.trim() == ''){
		alert("아이템 가격을 입력해주세요");
		return false;
	}
	if (item_Sale_Price.trim() == ''){
		alert("아이템 세일 가격을 입력해주세요");
		return false;
	}
	if (item_Stock.trim() == ''){
		alert("아이템 재고를 입력해주세요");
		return false;
	}
	if (item_RefundYn.trim() == ''){
		alert("아이템 환불여부를 입력해주세요");
		return false;
	}
	if (item_Content.trim() == ''){
		alert("아이템 내용을 입력해주세요");
		return false;
	}
	
	frm.submit();
}


$(document).ready(function() {
    $('#summernote').summernote({
        height: 300,
        callbacks: {
            onImageUpload: function(files) {
                sendFile(files[0]);
            }
        }
    });

    function sendFile(file) {
        data = new FormData();
        data.append("file", file);
        $.ajax({
            url: 'GetFile.aspx',
            data: data,
            cache: false,
            type: "POST",
            contentType: false,
            processData: false,
            success: function(url) {
                $('#summernote').summernote('insertImage', url);
            }
        });
    }
});

function funcMyHtml() {
    document.getElementById("HiddenField").value = $('#summernote').summernote('code');
}
</script>
    
</body>
</html>