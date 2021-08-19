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
<title>아이템 등록</title>
<script>

$(document).ready(function() {

        var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ];

		$('#summernote').summernote({
	        minHeight: 500,             // 최소 높이
	        maxHeight: null,             // 최대 높이
	        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	        lang: "ko-KR",
	        toolbar : toolbar,					// 한글 설정
	        spellCheck: false,
	        callbacks: {	//이미지 첨부하는 부분
	           onImageUpload : function(files) {
	                uploadSummernoteImageFile(files[0],this);
            	}
        	}
    	});

        function uploadSummernoteImageFile(file, editor) {
            data = new FormData();
            data.append("file", file);
            $.ajax({
                data : data,
                type : "POST",
                url : "/uploadSummernoteImageFile",
                contentType : false,
                processData : false,
                 success : function(data) {
                    //항상 업로드된 파일의 url이 있어야 한다.
                    $(editor).summernote('insertImage', data.url);
                }
            });
        }

        $("div.note-editable").on('drop',function(e){
            for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
            	uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
            }
           e.preventDefault();
      })

});

function aa() {
		var itemCategoryName = frm.itemCategoryName.value;
		var itemName = frm.itemName.value;
		var itemPrice = frm.itemPrice.value;
		var itemSalePrice = frm.itemSalePrice.value;
		var itemStock = frm.itemStock.value;
		var itemRefundYn = frm.itemRefundYn.value;
		var itemContent = frm.itemContent.value;
		
		if (itemCategoryName.trim() == ''){
			alert("카테고리 이름을 입력해주세요");
			return false;
		}
		if (itemName.trim() == ''){
			alert("아이템 이름을 입력해주세요");
			return false;
		}
		if (itemPrice.trim() == ''){
			alert("아이템 가격을 입력해주세요");
			return false;
		}
		if (itemSalePrice.trim() == ''){
			alert("아이템 세일 가격을 입력해주세요");
			return false;
		}
		if (itemStock.trim() == ''){
			alert("아이템 재고를 입력해주세요");
			return false;
		}
		if (itemRefundYn.trim() == ''){
			alert("아이템 환불여부를 입력해주세요");
			return false;
		}
		if (itemContent.trim() == ''){
			alert("아이템 내용을 입력해주세요");
			return false;
		}
		
		frm.submit();
	 
			
	$("#frm").attr("action", "/items/updateOk").submit();
}

</script>
</head>
<body>
<h2 style="text-align: center;">아이템 등록</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form method="post" id="frm" name="frm" enctype="multipart/form-data" action="/items/updateOk" >
		<input type="hidden" id="itemNo" name="itemNo" value="${items.itemNo}" />
		<table>	
			<tr>
				<td><b>카테고리 이름 </b></td>
				<td><input type="text" name="itemCategoryName" style="margin-bottom: 5px;" value="${items.itemCategoryName}" /><br></td>
			</tr>
			<tr>
				<td><b>아이템 이름 </b></td>
				<td><input type="text" name="itemName" style="margin-bottom: 5px;" value="${items.itemName}"/></td>
			</tr>
			<tr>
				<td><b>아이템 가격</b></td>
				<td><input type="text" name="itemPrice" style="margin-bottom: 5px;" value="${items.itemPrice}"/></td>
			</tr>
			<tr>
				<td><b>아이템 세일 가격</b></td>
				<td><input type="text" name="itemSalePrice" style="margin-bottom: 5px;" value="${items.itemSalePrice}" /></td>
			</tr>
			<tr>
				<td><b>아이템 재고</b></td>
				<td><input type="text" name="itemStock" style="margin-bottom: 5px;" value="${items.itemStock}" /></td>
			</tr>
			<tr>
				<td><b>아이템 환불여부</b></td>
				<td><input type="text" name="itemRefundYn" style= "margin-bottom: 5px;"  value="${items.itemRefundYn}" placeholder="'N', 'Y'"/></td>
			</tr>
			<tr>
				<td><b>아이템 썸네일 등록</b></td>
				<td><input type="file" name="files" multiple="multiple" style= "margin-bottom: 5px;"  value="${items.originalName}" placeholder="'N', 'Y'"/></td>
			</tr>
		</table><br>
		<div class="note-editable"> 
			<textarea rows="5" cols="60" id="summernote" class="summernote" value="${items.itemContent }" name="itemContent"></textarea>
			<input type="button" class="btn btn-primary" value="글 작성" style="float: right; margin-top: 10px;" onclick="aa();"/>
			<input type="reset"  class="btn btn-info" style="float: right; margin-top: 10px; margin-right: 10px;" value="다시 작성"/>
			<input type="hidden" name="itemNo" value="${items.itemNo}" />
			<input type="hidden" name="originalName" value="${items.originalName}"/>
			<input type="hidden" name="itemIdx" value="${items.itemIdx}"/>
			<input type="hidden" name="originalName" value="${items.originalName}"/> 
		</div>
	</form>	
</div>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
    

    
</body>
</html>