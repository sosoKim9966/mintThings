<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>boardDetail</title>
	<!-- App favicon -->
    <link rel="shortcut icon" href="../resources/static/assets/images/favicon.ico">

	<!-- App css -->
	<link href="../resources/static/assets/css/modern/app-modern.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<!-- include summernote css/js-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>

<style>
.title{
	min-height: 30px;
    margin: -70px 0 0 -300px;
    border-bottom: 0px solid #e8e8e8;
    text-align: center;
}

.title h2{
	font-size: 22px;
    font-weight: 400;
    font-family: 'Playfair Display',sans-serif,'Nanum Barun Gothic' !important;
    letter-spacing: 0.9px;
}

h2#boardTitle{
	margin: 15px auto;
    margin-bottom: 0;
    padding: 0 0 5px 0px;
    font-size: 22px;
    font-weight: 400;
    font-family: 'Playfair Display',sans-serif,'Nanum Barun Gothic' !important;
    letter-spacing: 0.9px;
    display: inline;
    zoom: 1;
    border-bottom: 3px double #E2E3E4;
    width: 600px;
}

.title p {
    margin: 10px 0px 10px 7px;
    padding: 0 0 0 0px;
    color: #939393;
    vertical-align: bottom;
}

font[Attributes Style] {
    color: rgb(85, 85, 85);
}

div.content-page1{
    margin-left: 240px;
    overflow: hidden;
    padding: 70px 15px 65px 15px;
    min-height: 80vh;
}

table{
	position: relative;
    margin: 20px 0 0 80px;
    border-top: 1px solid #dfdfdf;
    color: #fff;
    line-height: 1.5;
    width: 75%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}

colgroup {
    display: table-column-group;
}

col {
    display: table-column;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

.ec-base-table th:first-child {
    border-left: 0;
}

.ec-base-table td {
    padding: 11px 10px 10px;
    color: #353535;
    vertical-align: middle;
    border-bottom: 1px solid #ebebeb;
}

.ec-base-table tbody th {
    padding: 12px 0 10px 18px;
    color: #353535;
    border-bottom-width: 0;
    border: 1px solid #ebebeb;
    text-align: left;
    font-weight: normal;
    background-color: #fbfbfb;
}

.ec-base-table th {
    word-break: break-all;
    word-wrap: break-word;
}

.ec-base-table .etcArea {
    text-align: right;
}

.ec-base-table .etcArea li strong {
    font: 500 11px 'Roboto', sans-serif;
    margin-right: 10px;
    letter-spacing: 0.9px;
}

.ec-base-table .etcArea li {
    display: inline-block;
    margin: 0 0 9px;
    padding: 7px 20px 10px;
    vertical-align: top;
    line-height: 22px;
    color: #666;
}

.txtNum {
    display: inline-block;
    font-size: 11px;
    color: #939393;
    word-break: normal;
}

.ec-base-table .detail {
    padding: 30px 0px;
    border-top: 1px solid #eaeaea;
    margin: -9px 0 0;
    word-break: break-all;
    line-height: normal;
    line-height: 180%;
}

.ec-base-button .gLeft {
    float: left;
    text-align: left;
}

.fr-view {
    word-wrap: break-word;
}
</style>
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
	var noticeTitle = frm.noticeTitle.value;
	var noticeKind = frm.noticeKind.value;
	var noticeWriter = frm.noticeWriter.value;
	var noticeContent = frm.noticeContent.value;
	
	if (noticeWriter.trim() == ''){
		alert("작성자를 입력해주세요");
		return false;
	}
	if (noticeKind.trim() == ''){
		alert("분류를 입력해주세요");
		return false;
	}
	if (noticeTitle.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (noticeContent.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	
	frm.submit();
 
		
$("#frm").attr("action", "/board/insertOk").submit();
}

</script>
</head>
<body>
<div class="content-page1">
	<div class="content" style="margin-top: -20px;">
		<!-- Start Content--> 
		<div class="content-page" style="margin-left: 0px;">   
			<div class="content">
				<div class="title" >
					<h2 id="boardTitle">
						<font color="#555555" style="font-size: 24px;">&emsp;&emsp;&emsp;&emsp;REGISTER&emsp;&emsp;&emsp;&emsp;</font>
					</h2>
					<p>게시글 등록</p>
				</div>
			</div>
			<div class="ec-base-table">
				<form method="post" id="frm" enctype="multipart/form-data">
					<input type="hidden" name="noticeNo" value="${noticeNo}"/> 
					<table border="1">
						<colgroup>
							<col style="width:130px;">
							<col style="width:auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<th style="backgrond: #fff;"><input type="text" name="noticeTitle" value="${noticeTitle}" placeholder="글 제목 입력"></th>
							</tr>
							<tr>
								<th scope="row">분류</th>
								<th style="backgrond: #fff;"><input type="text" name="noticeKind" value="${noticeKind}" placeholder="글 분류 입력"></th>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<th style="backgrond: #fff;"><input type="text" name="noticeWriter" value="${noticeWriter}" placeholder="작성자 입력"></th>
							</tr>
							<tr>
								<td colspan="2">
									<div class="detail">
										<div class="fr-view fr-view-article">
											<div class="note-editable"> 
												<textarea rows="5" cols="60" id="summernote" class="summernote" value="${noticeContent}" name="noticeContent"></textarea>
											</div >
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="ec-base-button">
						<span class="gLeft">
							<a href="/board/notice" class="btn btn-primary" style="text-decoration: none; margin-left: 80px; margin-right: 980px; margin-top: 10px;">목록</a>
							<input type="button" class="btn btn-primary" style="float: right; margin-top: 10px;" onclick="aa();" value="글 작성" />
							<input type="reset" class="btn btn-info" style="float: right; margin-right: 13px; margin-top: 10px; " value="다시 작성"/>
						</span>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>