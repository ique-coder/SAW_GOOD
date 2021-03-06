<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set value="<%=new java.util.Date()%>" var="now" />
<fmt:parseNumber value="${now.time / (1000*60*60*24)}"
	integerOnly="true" var="today"></fmt:parseNumber>
<jsp:include page="/WEB-INF/views/admin/common/headerAndfooter.jsp" />

<style>
/* 섹션(본문) */
#titeltwo {
	padding-bottom: 30px;
	margin: 0;
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

/* 검색창  disagree*/
#searchDisAg {
	width: 100%;
}

#searchDisAg_userid {
	width: 100%;
	display: inline-block;
}

#searchDisAg_title {
	display: none;
	width: 100%;
}
#searchDisAg_designer{
	display: none;
	width: 100%;
}

#searchDisAg_enrollDate {
	display: none;
	width: 100%;
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
/* 버튼 */
.btn-white {
	width:70px;
	line-height: 30px;
	font-size: 15px;
	color: skyblue;
	text-align: center;
	background-color: white;
	border: 1px solid skyblue;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px; 
	border-bottom-left-radius: 5px;

}
.btn-white:hover {
	width:70px;
	line-height: 30px;
	font-size: 15px;
	color: white;
	text-align: center;
	background-color: skyblue;
	border: 1px solid skyblue;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px; 
	border-bottom-left-radius: 5px;
}
.upbtn{
	margin-bottom:10px;
}
.productimg{
	width:100px;
	height:100px;
}
</style>

<!-- Page Content  -->
<div id="content" class="p-4 p-md-5 pt-5">
	<h2 id="titeltwo">Funding Manager</h2>
	<div class="container-fluid" style="padding-bottom: 40px" id="category">
		<div class="row">
			<div class="col-sm-6 subcategory">
				<input type="radio" name="category" value="disagree"  id="disagree" checked/> <label
					for="category">승인대기</label>
			</div>
			<div class="col-sm-6 subcategory">
				<input type="radio" name="category" id="agree" value="agree"/> <label
					for="category">승인완료</label>
			</div>
		</div>
	</div>
	<div id="fundingDisAgree">
	<div class="container-fluid" style="margin-bottom: 30px;">
		<div class="row">
			<div class="col-md-6"></div>
			<div class="col-md-6">
				<table id="searchDisAg" style="text-align: right">
					<colgroup>
						<col width="30%">
						<col width="auto">
					</colgroup>
					<tr>
						<td><i class="fas fa-search"></i> <select name="searchDisAg_Type"
							style="padding: 3px; margin-left: 10px" id="searchDisAg_Type">
								<option value="userid">작성자</option>
								<option value="designer">디자이너</option>
								<option value="title">펀딩이름</option>
								<option value="enrollDate">등록일</option>
						</select></td>
						<td style="text-align: left; padding-left: 10px">
							<div id="searchDisAg_userid">
								<form action="${path }/admin/fundingDisAgreeSearch" method="post">
									<input type="hidden" name="numPerPage" value="${numPerPage }"/>
									<input type="hidden" name="searchType" value="userid"> <input
										type="text" name="keyword" placeholder="작성자를 입력해주세요"
										style="width: 80%">
									<button type="submit" class="btn-white">검색</button>
								</form>
							</div>
							<div id="searchDisAg_designer">
								<form action="${path }/admin/fundingDisAgreeSearch" method="post">
									<input type="hidden" name="numPerPage" value="${numPerPage }"/>
									<input type="hidden" name="searchType" value="designer"> <input
										type="text" name="keyword" placeholder="디자이너를 입력해주세요"
										style="width: 80%">
									<button type="submit" class="btn-white">검색</button>
								</form>
							</div>
							<div id="searchDisAg_title">
								<form action="${path }/admin/fundingDisAgreeSearch" method="post">
									<input type="hidden" name="numPerPage" value="${numPerPage }"/>
									<input type="hidden" name="searchType" value="title">
									<input type="text" name="keyword" placeholder="제목을 입력해주세요"
										style="width: 80%">
									<button type="submit" class="btn-white">검색</button>
								</form>
							</div>
							<div id="searchDisAg_enrollDate">
								<form action="${path }/admin/fundingDisAgreeSearch" method="post">
									<input type="hidden" name="numPerPage" value="${numPerPage }"/>
									<input type="hidden" name="searchType" value="enrollDate"> 
									<input type="date" name="keyword" style="width: 80%"/>
									<button type="submit" class="btn-white">검색</button>
								</form>
							</div>
						</td>
				</table>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div style="text-align: right; padding-right: 20px;">
		<form action='${path }/admin/${searchType!=null?"fundingDisAgreeSearch":"fundingDisAgreeList"}' method="post" id="numFrm">
			<input type="hidden" name="cPage" value="${cPage }"/>
			<input type="hidden" name="searchType" value="${searchType }"/>
			<input type="hidden" name="keyword" value="${keyword }"/>
			<select name="numPerPage" style="font-size: 16px;" id="numPer">
				<option value="10" ${numPerPage==10?"selected":"" }>10개씩보기</option>
				<option value="20" ${numPerPage==20?"selected":"" }>20개씩보기</option>
				<option value="30" ${numPerPage==30?"selected":"" }>30개씩보기</option>
			</select>
		</form>
		</div>
		<div class="col-md-12" style="height: auto;">
			<form action="#" method="post" id="disAgreeFrm">
				<div class="row">
					<div class="col-md-8" style="padding-bottom:10px;">
						<button class="btn-white" type="button" id="checkAgree">승인</button>
						<button class="btn-white" type="button" id="checkDisAgree">거부</button>
					</div>
				</div>
				<table class="fundingAg checking">
					<colgroup>
						<col width="5%">
						<col width="5%">
						<col width="15%">
						<col width="20%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>

					<tr>
						<th scope="col"><input type="checkbox"
							id="allck"><label for="allck"></label></th>
						<th scope="col">번호</th>
						<th scope="col"></th>
						<th scope="col">제목</th>
						<th scope="col">카테고리</th>
						<th scope="col">디자이너</th>
						<th scope="col">작성자</th>
						<th scope="col">등록일</th>
						<th scope="col">승인여부</th>
					</tr>
					<c:if test="${not empty fundingDisAgree }">
						<c:forEach items="${fundingDisAgree }" var="dag" varStatus="vs">
							<tr>
								<td><input type="checkbox" name="fundcheck" id="fund${vs.count }" class="fundcheck" value="${ dag['FDNO']}"><label
									for="fund${vs.count }"></label></td>
								<td>${ dag['FDNO']}</td>
								<td><img src="${path }/resources/images/funding/${dag['MAINIMG']}" class="productimg"/></td>
								<td><a href="${path }/admin/fundingView?fdno=${ dag['FDNO']}">${dag['TITLE']}</a></td>
								<td>${dag['CATEGORY']}</td>
								<td>${dag['DESIGNER']}</td>
								<td>${dag['USERID']}</td>
								<td><fmt:formatDate value="${dag['ENROLLDATE']}" pattern="yyyy-MM-dd"/></td>
								<td>
									<button class="btn-white agreeFd upbtn" type="button" value="${ dag['FDNO']}">승인</button>
									<button class="btn-white disAgreeFd" type="button" value="${ dag['FDNO']}">거부</button>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty fundingDisAgree }">
						<tr>
							<td colspan="9" style="height:300px;">승인 대기중인 펀딩이 없습니다.</td>
						</tr>
					</c:if>
				</table>
			</form>
			${disAgPageBar }
		</div>
	</div>
	</div>
</div>
<script>
	$(function() {
		$("#searchDisAg_Type").change(function() {
			let val = $("#searchDisAg_Type").val();
			let title = $("#searchDisAg_title");
			let userid = $("#searchDisAg_userid");
			let date = $("#searchDisAg_enrollDate");
			let designer=$("#searchDisAg_designer")
			title.hide();
			userid.hide();
			date.hide();
			designer.hide();
			$("#searchDisAg_" + val).css("display", "inline-block");
		})
	})
	
	//동의페이지
	$("#agree").click(function(){
		location.replace("${path}/admin/fundingAgreeList");
	})	
	//전체선택/해제
	$(function() {
		$("#allck").click(function() {
			if ($("#allck").prop("checked")) {
				$(".fundcheck").prop("checked", true);
			} else {
				$(".fundcheck").prop("checked", false);
			}
		})
	})
	//승인,거부
	$(".agreeFd").click(function(){
		var val=$(this).val();
		location.replace("${path}/admin/agreeFunding?fdno="+val);
	})
	
	$(".disAgreeFd").click(function(){
		var val=$(this).val();
		location.replace("${path}/admin/disAgreeFunding?fdno="+val);
	})
	//선택 승인 거부
	$("#checkAgree").click(function(){
		$("#disAgreeFrm").attr("action","${path}/admin/checkAgreeFunding");
		$("#disAgreeFrm").submit();
	})
	$("#checkDisAgree").click(function(){
		$("#disAgreeFrm").attr("action","${path}/admin/checkDisAgreeFunding");
		$("#disAgreeFrm").submit();
	})
	//numPerPage바꾸기
	$("#numPer").change(function(){
		$("#numFrm").submit();
	})
</script>


</body>

</html>