<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script type="text/javascript" src="${path }/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<style>
    /* 초기화 */
    html, body, div, span, applet, object, iframe,
    h1, h2, h3, h4, h5, h6, p, blockquote, pre,
    a, abbr, acronym, address, big, cite, code,
    del, dfn, em, img, ins, kbd, q, s, samp,
    small, strike, strong, sub, sup, tt, var,
    b, u, i, center,
    dl, dt, dd, ol, ul, li,
    fieldset, form, label, legend,
    table, caption, tbody, tfoot, thead, tr, th, td,
    article, aside, canvas, details, embed, 
    figure, figcaption, footer, header, hgroup, 
    menu, nav, output, ruby, section, summary,
    time, mark, audio, video {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
        text-decoration: none;
        color: black;
        font-family: "Noto Sans";
    }
    /* HTML5 display-role reset for older browsers */
    article, aside, details, figcaption, figure, 
    footer, header, hgroup, menu, nav, section {
        display: block;
    }
    body {
        line-height: 1;
        /* width:1366px;
        height:auto;
        margin:0 auto; */
    }
    ol, ul {
        list-style: none;
        
    }
    blockquote, q {
        quotes: none;
    }
    blockquote:before, blockquote:after,
    q:before, q:after {
        content: '';
        content: none;
    }
    table {
        border-collapse: collapse;
        border-spacing: 0;
    }
    /* 초기화  */
    .qna_title{
        color: #222;
        font-size: 18px;
        font-weight: bold;
        line-height: 19px;
        padding: 83px 0 52px 0;
        text-align: center;
    }
    .prd-qnainfo{
        zoom: 1;
        overflow: hidden;
        padding: 10px 0 10px 80px;
        border: 3px solid #e0e0e0;
        margin-top: 20px;
    }
    .prd-qnainfo dt{
        left: -70px;
        margin-right: -70px;
        width: 60px;
        height: 60px;
    }
    .prd-qnainfo dd, .prd-qnainfo dt{
        position: relative;
        float: left;
    }
    .prd-qnainfo dd ul {
        padding: 15px 0 0 10px;
        min-height: 45px;
        height: 45px;
        border-left: 1px solid #e0e0e0;
    }
    *, ::after, ::before {
    box-sizing: content-box;
    }
    .prd-qnainfo dd ul li {
    padding: 1px 0;
    }
    .prd-qnainfo dd ul li .tit {
        display: inline-block;
        width: 58px;
    }
    table.head tbody th, table.head tbody td{
        padding-top: 6px;
        padding-bottom: 6px;
        line-height: 20px;
        color: #565553;
        border: 0 none;
        float: left;
    }
    table.head tbody th{
        width: 110px;
        display: inline-block;
    }
    .title{
        line-height: 25px;
    }
    .input-style{
        margin-right: 5px;
        padding: 2px 0 0 2px;
        line-height: 17px;
        border: 1px solid #dcdcdc;
        width: 180px;
    }
    .contract table.tbl{
	    background: #fff;
	    width: 80%;
	    border-collapse: collapse;
    }
    .contract table.tbl th{
	    height: auto;
	    padding: 5px 0 5px 5px;
	    line-height: 16px;
	    font-size: 11px;
	    font-weight: bold;
	    border: 1px #e0e0e0 solid;
	    background-color:#f0f0f0;
    }
    .contract table.tbl td{
    	height: auto;
	    padding: 5px 0 5px 5px;
	    line-height: 16px;
	    font-size: 11px;
	    text-align: center;
	    border: 1px #e0e0e0 solid;
    }
    .txt{
    	padding:0;
    }
    .btn-container{
    	padding-top:10px;
    	padding-bottom:80px;
    }
    .qna-write-btn, .qna-write-btn:focus{
    	display: inline-block;
	    width: 108px;
	    height: 44px;
	    line-height: 42px;
	    text-align: center;
	    font-family: 'Nanum GothicB';
	    font-size: 12px;
	    border: 1px #313131 solid;
	    background: #313131;
	    color: #fff;
	    font-weight:bold;
	    outline:none;
    }
</style>
</head>
<body>
    <div class="container-fluid">
        <div class="container">
            <h3 class="qna_title">Q & A 게시판</h3>
            <div>
                <dl class="prd-qnainfo">
                    <dt>
                        <a href="#">
                            <img src="http://placehold.it/150x70" style="width: 100%; height:100%">
                        </a>
                    </dt>
                    <dd style="width: 100%;">
                        <ul style="font-size: 12px; line-height: 1.25; color: #333; letter-spacing: 0.4px;">
                            <li>
                                <span class="tit">상 품 명 : </span>
                                <span>상품 이름 </span>
                            </li>
                            <li>
                                <span class="tit">상품가격 : </span>
                                <strong style="font-weight: bold;">42,700원</strong>
                            </li>
                        </ul>
                    </dd>
                </dl>
            </div>
            <div style="margin-top: 10px;">
            	<form id="boardWriteForm" action="${path }/qna/qnaBoardEnd" method="post" enctype="multipart/form-data">
	                <table class="head" style="width: 100%;">
	                    <tbody style="background-color: #f7f7f7; border: 1px #e0e0e0 solid;">
	                        <tr>
	                            <th>
	                                <div style="width: 100px; text-align: center;">SUBJECT</div>
	                            </th>
	                            <td>
	                                <div class="title">
	                                    <select name="subhead" id="subhead">
	                                        <option value="">제목을 선택하세요</option>
	                                        <option value="상품 문의">상품 문의</option>
	                                        <option value="배송 문의">배송 문의</option>
	                                        <option value="교환/반품/취소 문의">교환/반품/취소 문의</option>
	                                        <option value="주문/입금확인 문의">주문/입금확인 문의</option>
	                                        <option value="기타 문의">기타 문의</option>
	                                    </select>
	                                </div>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>
	                                <div style="width: 100px; text-align: center;">작성자</div>
	                            </th>
	                            <td>
	                                <div>
	                                    <input type="text" id="writer" name="writer" class="input-style">
	                                </div>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>
	                                <div style="width: 100px; text-align: center;">PASS</div>
	                            </th>
	                            <td>
	                                <div>
	                                    <input type="text" id="pass" name="pass" class="input-style">
	                                    <span style="color: red;">자동 잠금 기능</span>
	                                </div>
	                            </td>
	                        </tr>
	                        <tr style="background-color:#fff;">
	                        	<td colspan="2" style="clear:both; width:100%;">
	                        		<textarea name="content" id="smartEditor" style="width: 100%; height: 512px; padding:0;">
	                        			
	                        		</textarea>
	                        	</td>
	                        </tr>
	                        <tr style="display:flex;">
	                        	<th style="margin:auto 0;">
	                                <div style="width: 110px; text-align: center;">개인정보 수집</div>
	                            </th>
	                            <td style="width:100%;">
	                                <div class="contract">
	                                    <table class="tbl">
	                                    	<thead>
                                            	<tr style="text-align:center;">
                                            		<th style="width:30%;">목적</th>
                                                    <th style="width:47.69%; border-left:none;">항목</th>
                                                    <th style="width:20%; border-left:none;">보유기간</th>
                                            	</tr>
                                            </thead>
                                            <tbody>
                                            	<tr>
                                            		<td style="width:30%; border-top:none; border-right:none">
                                            			<div class="txt">게시판 서비스 제공</div>
                                            		</td>
                                            		<td style="width:47.69%; border-top:none; border-right:none">
                                            			<div class="txt">이름, 비밀번호, 작성내용, IP Address</div>
                                            		</td>
                                            		<td style="width:20%; border-top:none;">
                                            			<div class="txt">게시글 삭제 시</div>
                                            		</td>
                                            	</tr>
                                            	<tr>
                                            		<td style="width:30%; border-top:none; border-right:none">
                                            			<div class="txt">게시판 서비스 제공</div>
                                            		</td>
                                            		<td style="width:47.69%; border-top:none; border-right:none">
                                            			<div class="txt">연락처</div>
                                            		</td>
                                            		<td style="width:20%; border-top:none;">
                                            			<div class="txt">게시글 삭제 시</div>
                                            		</td>
                                            	</tr>
                                            </tbody>
	                                    </table>
	                                </div>
	                                <div style="margin-top: 5px; font-size:12px;">
	                                	* 동의하셔야 서비스를 이용하실 수 있습니다.
	                                </div>
	                                <div style="margin:10px 0; font-size:12px;">
                                            <label><input type="radio" name="agree" value="Y"> 정보수집에 동의합니다.</label>
                                            <label><input type="radio" name="agree" value="N" checked> 동의하지 않습니다.</label>
                                    </div>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
	                <div class="btn-container">
	                	<div style="float:right;">
	                		<input type="submit" value="글쓰기" class="qna-write-btn" id="savebutton">
	                	</div>
	                </div>
	        	</form>
            </div>
        </div>
    </div>
</body>
</html>
<script>
	var oEditors = []; 
	nhn.husky.EZCreator.createInIFrame({ 
		oAppRef : oEditors,
		elPlaceHolder : "smartEditor",//저는 textarea의 id와 똑같이 적어줬습니다. 
		sSkinURI : "${path}/resources/se2/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요! 
		fCreator : "createSEditor2", 
		htParams : { 
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseToolbar : true, 
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : false, 
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseModeChanger : false 
			} 
	}); 
	$(function() {
		$("#savebutton").click(function() {
			oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); 
			//textarea의 id를 적어줍니다. 
			var selcatd = $("#subhead > option:selected").val();
			var title = $("#title").val(); 
			var content = document.getElementById("smartEditor").value; 
			var writer = $("#writer").val().trim();
			var pass = $("#pass").val().trim();
			if (selcatd == "") {
				alert("제목을 선택해주세요."); 
				return false; 
			}
			if(writer==null||writer==""){
				alert("작성자명을 입력해주세요.")
				return false;
			}
			if(pass==null||pass==""){
				alert("비밀번호를 입력해주세요.")
				return false;
			}
			
			if($("input[name='agree']:checked").val()=="N"){
				alert("개인정보 수집·이용에 동의하신 후에 글을 작성 하실 수 있습니다.");
				return false;
			}
			if(content == "" || content == null || content == '&nbsp;' ||
				content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
				alert("본문을 작성해주세요."); 
				oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱 
				return false; 
			} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다. 
			var result = confirm("작성 하시겠습니까?"); 
			if(result){ 
				alert("작성 완료"); 
				$("#boardWriteForm").submit(); 
				}else{ 
					return false; 
				} 
			}); 
		})
</script>