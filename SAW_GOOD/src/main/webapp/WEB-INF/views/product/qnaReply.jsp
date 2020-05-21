<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/product/qnaWrite.css"/>
<script type="text/javascript" src="${path }/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<section>
    <div class="container-fluid">
        <div class="container">
            <h3 class="qna_title">Q & A 게시판</h3>
            <div>
                <dl class="prd-qnainfo">
                    <dt>
                        <a href="#">
                            <img src="${path}/resources/upload/newproduct/${product.renamedProductImg}" style="width: 100%; height:100%">
                        </a>
                    </dt>
                    <dd style="width: 100%;">
                        <ul style="font-size: 12px; line-height: 1.25; color: #333; letter-spacing: 0.4px;">
                            <li>
                                <span class="tit">상 품 명 : </span>
                                <span>${product.productName } </span>
                            </li>
                            <li>
                                <span class="tit">상품가격 : </span>
                                <strong style="font-weight: bold;">
									<fmt:formatNumber value="${product.productPrice}" pattern="0,000"/>원
								</strong>
                            </li>
                        </ul>
                    </dd>
                </dl>
            </div>
            <div style="margin-top: 10px;">
            	<form id="boardWriteForm" action="${path }/qna/qnaReplyEnd" method="post" enctype="multipart/form-data">
            		<input type="hidden" name="productNo" value="${product.productNo }"/>
            		<input type="hidden" name="qnaNo" value="${qnaNo }"/>
            		<input type="hidden" name="title" value="${title }"/>
	                <table class="head" style="width: 100%;">
	                    <tbody style="background-color: #f7f7f7; border: 1px #e0e0e0 solid;">
	                        <tr>
	                            <th>
	                                <div style="width: 100px; text-align: center;">SUBJECT</div>
	                            </th>
	                            <td>
	                                <div class="title">
	                                    <select name="subhead" id="subhead" onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;'>
	                                        <option value="">제목을 선택하세요</option>
	                                        <option value="상품 문의" <c:if test="${title eq '상품 문의' }">selected</c:if>>상품 문의</option>
	                                        <option value="배송 문의" <c:if test="${title eq '배송 문의' }">selected</c:if>>배송 문의</option>
	                                        <option value="교환/반품/취소 문의" <c:if test="${title eq '교환/반품/취소 문의' }">selected</c:if>>교환/반품/취소 문의</option>
	                                        <option value="주문/입금확인 문의" <c:if test="${title eq '주문/입금확인 문의' }">selected</c:if>>주문/입금확인 문의</option>
	                                        <option value="기타 문의" <c:if test="${title eq '기타 문의' }">selected</c:if>>기타 문의</option>
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
                                                    <th style="width:22.3%; border-left:none;">보유기간</th>
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
                                            		<td style="width:22.3%; border-top:none;">
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
                                            		<td style="width:22.3%; border-top:none;">
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
</section>
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
				$("#subhead").focus();
				return false; 
			}
			if(writer==null||writer==""){
				alert("작성자명을 입력해주세요.")
				$("#writer").focus();
				return false;
			}
			var passRule = /^[A-Za-z0-9]{4,12}$/g;//숫자와 문자 포함 형태의 4~12자리 이내의 암호 정규식
			if(pass==null||pass==""){
				alert("비밀번호를 입력해주세요.")
				$("#pass").focus();
				return false;
			}else if(!passRule.test(pass)) {
			    alert("비밀번호는 문자나 숫자를 포함한 4글자이상 12자리이하 입력해주세요.");
			    $("#pass").focus();
			    return false;
			}

			if(content == "" || content == null || content == '&nbsp;' ||
				content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
				alert("본문을 작성해주세요."); 
				oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱 
				return false; 
			} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다. 
			
			if($("input[name='agree']:checked").val()=="N"){
				alert("개인정보 수집·이용에 동의하신 후에 글을 작성 하실 수 있습니다.");
				return false;
			}
			var result = confirm("작성 하시겠습니까?"); 
			if(result){ 
				$("#boardWriteForm").submit(); 
				}else{
					return false; 
				} 
			}); 
		})
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>