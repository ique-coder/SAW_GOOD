<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/admin/common/headerAndfooter.jsp" />

<style>

/* 섹션(본문) */
#titeltwo {
	padding-bottom: 30px;
	margin: 0;
}
hr{
	margin-bottom:45px;
}

/* 펀딩동의 테이블 */
table.fundingAg tr td {
	text-align: center;
	padding: 10px 0;
}

table.fundingAg tr th {
	text-align: center;
	padding: 10px 0 10px 0;
}

table.fundingAg tr td {
	border-top: 1px solid lightgray;
}

table.fundingAg {
	border-radius: 20px;
	height: 100%;
	width: 100%;
	border-bottom: 1px solid black;
	border-top: 1px solid black;
}

/* 버튼 */
.btn-black {
	padding: 0 20px;
	line-height: 30px;
	font-size: 15px;
	color: #fff;
	text-align: center;
	background-color: #303030;
	border: 1px solid #303030;
}

/* 펀딩승인 카테고리 */
div.subcategory:hover {
	cursor: pointer;
}

div.subcategory {
	position: relative;
	display: table;
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	outline: 0;
	pointer-events: none;
}

div.subcategory>input {
	position: absolute;
	width: 100%;
	height: 100%;
	opacity: 0;
	cursor: pointer;
	pointer-events: all;
}

div.subcategory>input+label {
	text-align: center;
	font-weight: bolder;
	width: 100%;
	height: 100%;
	padding: 15px 0;
	margin: 0;
	border: 1px solid #eee;
	border-bottom-color: #191919;
}

div.subcategory>input:checked+label {
	text-align: center;
	font-weight: bolder;
	width: 100%;
	height: 100%;
	padding: 15px 0;
	margin: 0;
	border: 1px solid #191919;
	border-bottom-color: #eee;
}

/* 검색창 */
#search {
	width: 100%;
}

.newPro #search tr td {
	border: 1px solid black;
	padding: 10px 0px;
	padding-left: 10px;
}

.aucPro #search tr td {
	padding: 10px 0;
}

#search tr th {
	border: 1px solid black;
	padding: 10px;
}

#search_id {
	width: 100%;
	display: inline-block;
}

#search_name {
	display: none;
	width: 100%;
}

#search_email {
	display: none;
	width: 100%;
}

#search_phone {
	display: none;
	width: 100%;
}

#search_addr {
	display: none;
	width:100%;
}

#search_date {
	display: none;
	width:100%;
}

div[id^="search"]>input[type="text"] {
	padding: 2px 0;
}

/* 체크박스 */
.checking input[type="checkbox"], .checking input[type="radio"] {
	border: 0;
	clip: rect(0, 0, 0, 0);
	height: 1px;
	margin: -1px;
	overflow: hidden;
	padding: 0;
	position: absolute;
	width: 1px;
}

.checking input[type="checkbox"]:focus+label:before, .checking input[type="checkbox"]:hover+label:before,
	.checking input[type="radio"]:focus+label:before, .checking input[type="radio"]:hover+label:before
	{
	border-color: black;
}

.checking input[type="checkbox"]:active+label:before, .checking input[type="radio"]:active+label:before
	{
	-webkit-transition-duration: 0;
	transition-duration: 0;
	-webkit-filter: brightness(0.2);
	filter: brightness(0.2);
}

.checking input[type="checkbox"]+label, .checking input[type="radio"]+label
	{
	position: relative;
	padding: 10px;
	padding-left: 1.5em;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.checking input[type="checkbox"]+label:before, .checking input[type="radio"]+label:before
	{
	box-sizing: content-box;
	content: '';
	color: #900;
	position: absolute;
	top: 50%;
	left: 0;
	width: 14px;
	height: 14px;
	margin-top: -9px;
	border: 2px solid grey;
	text-align: center;
}

.checking input[type="checkbox"]+label:after, .checking input[type="radio"]+label:after
	{
	box-sizing: content-box;
	content: '';
	background-color: #900;
	position: absolute;
	top: 50%;
	left: 4px;
	width: 10px;
	height: 10px;
	margin-top: -5px;
	-webkit-transform: scale(0);
	transform: scale(0);
	-webkit-transform-origin: 50%;
	transform-origin: 50%;
	-webkit-transition: -webkit-transform 200ms ease-out;
	transition: -webkit-transform 200ms ease-out;
	transition: transform 200ms ease-out;
	transition: transform 200ms ease-out, -webkit-transform 200ms ease-out;
}

.checking input[type="checkbox"]+label:after {
	background-color: transparent;
	top: 50%;
	left: 4px;
	width: 8px;
	height: 3px;
	margin-top: -4px;
	border-style: solid;
	border-color: #900;
	border-width: 0 0 3px 3px;
	-webkit-border-image: none;
	-o-border-image: none;
	border-image: none;
	-webkit-transform: rotate(-45deg) scale(0);
	transform: rotate(-45deg) scale(0);
	-webkit-transition: none;
	transition: none;
}

.checking input[type="checkbox"]:checked+label:after {
	content: '';
	-webkit-transform: rotate(-45deg) scale(1);
	transform: rotate(-45deg) scale(1);
	-webkit-transition: -webkit-transform 200ms ease-out;
	transition: -webkit-transform 200ms ease-out;
	transition: transform 200ms ease-out;
	transition: transform 200ms ease-out, -webkit-transform 200ms ease-out;
}

.checking input[type="radio"]:checked+label:before {
	-webkit-animation: borderscale 300ms ease-in;
	animation: borderscale 300ms ease-in;
	background-color: white;
}

.checking input[type="radio"]:checked+label:after {
	-webkit-transform: scale(1);
	transform: scale(1);
}

.checking input[type="radio"]+label:before, .checking input[type="radio"]+label:after
	{
	border-radius: 50%;
}

.checking input[type="checkbox"]:checked+label:before {
	-webkit-animation: borderscale 200ms ease-in;
	animation: borderscale 200ms ease-in;
}

.checking input[type="checkbox"]:checked+label:after {
	-webkit-transform: rotate(-45deg) scale(1);
	transform: rotate(-45deg) scale(1);
}

@
-webkit-keyframes borderscale { 50% {
	box-shadow: 0 0 0 2px #900;
}

}
@
keyframes borderscale { 50% {
	box-shadow: 0 0 0 2px #900;
}

}
.error-msg {
	display: block;
	color: red;
	max-height: 0;
	overflow: hidden;
	-webkit-transition: max-height 500ms ease-out;
	transition: max-height 500ms ease-out;
	will-change: max-height;
}

:required:not (:focus )~.error-msg, :invalid:required ~.error-msg {
	max-height: 9em;
}

.checking input:focus {
	border: 1px solid black;
}

.checking input:not (:focus ):invalid {
	border: 1px solid red;
	outline: none;
}

.checking input:not (:focus ):valid {
	border: 1px solid green;
}

form ul {
	list-style: none;
}

label {
	cursor: pointer;
	display: inline-block;
}

/* 상품이미지 */
.productimg{
	width:100px;
	height:100px;
}
/* 페이지바 */
#pageBar {
	width: 100%;
	margin: 40px 0 40px 0;
	text-align: center;
}

#pageBar>a, #pageBar>span {
	width: 40px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	border: 1px solid #d5d5d5;
	color: #999;
	background-color: #fff;
	margin: 0 2px;
	position: relative;
	font-size: 13px;
	font-family: "YoonGothicPro760";
	display: inline-block;
	vertical-align: top;
	padding: 0;
}
/* 페이지바 cpage span */
#pageBar>span.cPage {
	border: 1px solid #191919;
	color: #191919;
}
</style>

<!-- Page Content  -->
<div id="content" class="p-4 p-md-5 pt-5">
	<h2 id="titeltwo">Product Manager</h2>
	<hr>
	
	<div class="container-fluid newPro" style="margin-bottom: 30px;">
		<div class="col-md">
			<form id="searchFrm" action="${path }/admin/searchProduct" method="get">
				<table id="search">
					<colgroup>
						<col width="20%">
						<col width="60%">
						<col width="20%">
					</colgroup>
					<tr>
						<th>가구이름</th>
						<td colspan="2"><input type="text" name="productname"></td>
					</tr>
					<tr>
						<th>브랜드</th>
						<td class="checking" style="border-right:white"><input type="checkbox" name="brand"
							value="에이스" id="br1"><label for="br1">에이스</label> <input
							type="checkbox" name="brand" value="알레르망" id="br2"><label
							for="br2">알레르망</label> <input type="checkbox" name="brand"
							value="쇼팽" id="br3"><label for="br3">쇼팽</label> <input
							type="checkbox" name="brand" value="모차르트" id="br4"><label
							for="br4">모차르트</label> <input type="checkbox" name="brand"
							value="베토벤" id="br5"><label for="br5">베토벤</label></td>
							<td style="border-left:white;text-align:right;padding-right:10px">
								<button type="button" class="addtotal">+</button>
								<span style="display:none;" class="spanview"><input type="text"><button type="button" class="regist">등록</button></span>
							</td>
					</tr>
					<tr>
						<th>가구종류</th>
						<td class="checking" style="position: relative;border-right:white"><input
							type="checkbox" name="category" value="bed" id="ca1"><label
							for="ca1">bed</label> <input type="checkbox" name="category"
							value="sofa" id="ca2"><label for="ca2">sofa</label> <input
							type="checkbox" name="category" value="chair" id="ca3"><label
							for="ca3">chair</label> <input type="checkbox" name="category" value="light"
							id="ca4"><label for="ca4">light</label> <input
							type="checkbox" name="category" value="table" id="ca5"><label
							for="ca5">table</label>
							<input
							type="checkbox" name="category" value="desk" id="ca6"><label
							for="ca6">desk</label><input
							type="checkbox" name="category" value="carpet" id="ca7"><label
							for="ca7">carpet</label><input
							type="checkbox" name="category" value="lug" id="ca8"><label
							for="ca8">lug</label> <input
							type="checkbox" name="category" value="storage" id="ca9"><label
							for="ca9">storage</label> <input
							type="checkbox" name="category" value="others" id="ca10"><label
							for="ca10">others</label> 
							</td>
							<td style="border-left:white;text-align:right;padding-right:10px">
								<button type="button" class="addtotal">+</button>
								<span  style="display:none;" class="spanview"><input type="text"><button type="button" class="regist">등록</button></span>
							</td>
							</tr>
					<tr>
						<th>가격</th>
						<td colspan="2" class="checking" style="position: relative;"><input
							type="radio" name="productprice" value="100000" id="pri1"><label
							for="pri1">~100,000원</label> <input type="radio" name="productprice"
							value="200000" id="pri2"><label for="pri2">100,000원~200,000원</label>
							<input type="radio" name="productprice" value="300000" id="pri3"><label
							for="pri3">200,000~300,000원</label> <input type="radio"
							name="productprice" value="400000" id="pri4"><label for="pri4">300,000원~400,000원</label>
						</td>
					</tr>

					<tr>
						<td colspan="3" style="text-align: right; border: none;">
							<button type="submit" class="btn-black">검색</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="container-fluid newPro">
		<div style="text-align: right; padding-right: 20px;">
			<form
				action='${path }/admin/${productname!=null?"searchProduct":"productManager"}'
				method="post" id="frmNum">
				<input type="hidden" name="cPage" value="${cPage }" />
				<input type="hidden" name="produtname" value="${produtname }" /> 
				<input type="hidden" name="productprice" value="${productprice }" />
				<c:if test="${brand !=null }">
					<c:forEach items="${brand }" var="b">
						<input type="hidden" name="brand" value="${b }"/>
					</c:forEach>
				</c:if>	
				<c:if test="${category !=null }">
					<c:forEach items="${category }" var="c">
						<input type="hidden" name="category" value="${c }"/>
					</c:forEach>
				</c:if>	
					<select name="numPerPage" style="font-size: 16px;" id="numPer">
					<option value="10" ${numPerPage!=10?"":"selected" }>10개씩보기</option>
					<option value="20" ${numPerPage!=20?"":"selected" }>20개씩보기</option>
					<option value="30" ${numPerPage!=30?"":"selected" }>30개씩보기</option>
				</select>
			</form>
		</div>
		<div class="col-md-12" style="height: auto;">
			<form action="#" method="post" id="proFrm">
				<div class="row">
					<div class="col-md-8" style="padding-bottom: 10px;">
						<button class="btn-black checkDelete" type="button">선택삭제</button>
					</div>
				</div>
				<table class="fundingAg checking">
					<colgroup>
						<col width="5%">
						<col width="5%">
						<col width="10%">
						<col width="auto">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="15%">
					</colgroup>

					<tr>
						<th scope="col"><input type="checkbox"
							id="allck"><label for="allck"></label></th>
						<th scope="col">번호</th>
						<th scope="col"></th>
						<th scope="col">상품정보</th>
						<th scope="col">가구종류</th>
						<th scope="col">브랜드</th>
						<th scope="col">평점</th>
						<th scope="col">관리</th>
					</tr>
					<c:forEach items="${list }" var="p" varStatus="vs">
					<tr>
						<td><input type="checkbox" name="procheck" class="procheck" value="${p['PRODUCTNO']}"  id="pro${vs.count }"><label
							for="pro${vs.count }"></label></td>
						<td>${p['PRODUCTNO'] }</td>
						<td>
							<img class="img-responsive productimg"
							src="${path }/resources/upload/newproduct/${p['RENAMEDPRODUCTIMG'] }"/>
						</td>
						<td>
							<p style="font-weight:bolder;font-size:18px;">${p['PRODUCTNAME'] }</p>
							<p style="display:inline-block">${p['PRODUCTPRICE'] }원</p>
						</td>
						<td>${p['CATEGORY'] }</td>
						<td>${p['BRAND'] }</td>
						<td>${p['STAR'] }</td>
						<td>
							<button class="btn-black deletePro" type="button" value="${p['PRODUCTNO']}">삭제</button>
							<button class="btn-black updatePro" type="button" value="${p['PRODUCTNO']}">수정</button>
						</td>
					</tr>
					</c:forEach>
				</table>
			</form>
			${pageBar }
		</div>
</div>
</div>
</body>
<script>
	//카테고리 클릭시 화면변경
	$("input[name=category]").click(function() {
		if ($("#newP").prop("checked")) {
			$(".newPro").css("display", "block");
			$(".aucPro").css("display", "none");
		}
		if ($("#aucP").prop("checked")) {
			$(".newPro").css("display", "none");
			$(".aucPro").css("display", "block");
		}
	})
	//전체선택 전체해체
	$(function() {
		$("#allck").click(function() {
			if ($("#allck").prop("checked")) {
				$(".procheck").prop("checked", true);
			} else {
				$(".procheck").prop("checked", false);
			}
		})
	})
	//수정페이지 이동
	$(".updatePro").click(function(){
		var value=$(this).val();
		location.replace("${path}/admin/productUpdate?productno="+value);
	})
	
	//삭제페이지 이동
	$(".deletePro").click(function(){
		var value=$(this).val();
		location.replace("${path}/admin/productDelete?productno="+value);
	})
	//선택삭제
	$(".checkDelete").click(function(){
		if($(".procheck:checked").length>0){
			$("#proFrm").attr("action","${path}/admin/checkDelete");
			$("#proFrm").submit(); 
		}else{
			alert("삭제 할 항목을 선택해주세요!");
		}
	})
	$(".addtotal").click(function(){
		$(".spanview").css("display","inline-block");
	})
	//넘버페이지 변경
	$("#numPer").change(function() {
		$("#frmNum").submit();
	})
</script>
</html>