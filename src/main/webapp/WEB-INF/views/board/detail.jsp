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
<script type="text/javascript">
$(document).ready(function(){
	$(#btnDelete).click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action = "/board/delete";
			document.form1.submit();
		}

	});
});

</script>
</head>
<body>
<div class="content-page1">
	<div class="content" style="margin-top: -20px;">
		<!-- Start Content--> 
		<div class="content-page" style="margin-left: 0px;">   
			<form name="form1" method="post">
				<div class="content">
					<div class="title" >
						<h2 id="boardTitle">
							<font color="#555555" style="font-size: 24px;">&emsp;&emsp;&emsp;&emsp;NOTICE&emsp;&emsp;&emsp;&emsp;</font>
						</h2>
						<p>공지사항입니다.</p>
					</div>
				</div>
				<div class="ec-base-table">
					<table border="1">
						<colgroup>
							<col style="width:130px;">
							<col style="width:auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<th style="backgrond: #fff;">${list.noticeTitle}</th>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<th>${list.noticeWriter}</th>
							</tr>
							<tr>
								<td colspan="2">
									<ul class="etcArea">
										<li>
											<strong>date</strong>
											<span class="txtNum"><fmt:formatDate value="${list.noticeRegdate}" pattern="yyyy-MM-dd"/></span>
										</li>
										<li>
											<strong>hit</strong>
											<span class="txtNum">${list.noticeViewCnt}</span>
										</li>
									</ul>
									<div class="detail">
										<div class="fr-view fr-view-article">
											<p style="text-align: center;">
												<span style="color: rgb(229, 115, 174);">
													<span style="color: rgb(0, 0, 0);">
														<span style="font-family: Comic Sans MS;">
															${list.noticeContent }
														</span>
													</span>
												</span>
											</p>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="ec-base-button">
					<span class="gLeft">
						<a href="/board/notice" class="btn btn-primary" style="text-decoration: none; margin-left: 90px; margin-top: 100px;">목록</a>
					</span>
				</div>
				<div class="ec-base-button">
					<span class="gRight">
						<a href="/board/update/${list.noticeNo}" class="btn btn-info" style="text-decoration: none; margin-left: 1020px; margin-top: 100px;">수정</a>
					</span>
					<span class="gRight">
						<a href="/board/delete/${list.noticeNo}" id="btnDelete"class="btn btn-danger" style="text-decoration: none; margin-left: 10px; margin-top: 100px;">삭제</a>
					</span>
				</div>
			</form>	
		</div>
	</div>
</div>
</body>
</html>