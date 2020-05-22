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

#hr {
	margin-top: 0px;
	margin-bottom: 30px;
}

/* 맴버리스트 테이블 */
table.memberMg tr td {
	text-align: center;
	padding: 10px 0;
}

table.memberMg tr th {
	text-align: center;
	padding: 10px 0 10px 0;
}

table.memberMg tr td {
	border-top: 1px solid lightgray;
}

table.memberMg {
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

/* 검색창 */
#search {
	width: 100%;
}

#search tr td {
	padding: 5px 0;
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
	width: 100%;
}

#search_date {
	display: none;
	width: 100%;
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
	<h2 id="titeltwo">Member Manager</h2>
	<hr id="hr">
	<div class="container-fluid" style="margin-bottom: 30px;">
		<div class="row">
		<div class="col-md-6"></div>
		<div class="col-md-6" style="text-align: right">
			<table id="search">
				<colgroup>
					<col width="30%">
					<col width="auto">
				</colgroup>
				<tr>
					<td>
					<i class="fas fa-search"></i>
					<select name="search_Type"
						style="padding: 3px; margin-left: 10px" id="search_Type">
							<option value="id">아이디</option>
							<option value="name">이름</option>
							<option value="email">이메일</option>
							<option value="phone">전화번호</option>
							<option value="addr">주소</option>
					</select>
					</td>
					<td style="text-align:left;padding-left:10px">
						<div id="search_id">
							<form action="${path }/admin/searchMember" method="get">
								<input type="hidden" name="numPerPage"
									value="${numPerPage }" /> <input type="hidden"
									name="searchType" value="userid"> <input type="text"
									name="keyword" placeholder="아이디를 입력해주세요" style="width: 80%">
								<button type="submit" class="btn-black">검색</button>
							</form>
						</div>
						<div id="search_name">
							<form action="${path }/admin/searchMember" method="post">
								<input type="hidden" name="numPerPage"
									value="${numPerPage }" /> <input type="hidden"
									name="searchType" value="username"> <input type="text"
									name="keyword" placeholder="이름을 입력해주세요" style="width: 80%">
								<button type="submit" class="btn-black">검색</button>
							</form>
						</div>
						<div id="search_email">
							<form action="${path }/admin/searchMember" method="post">
								<input type="hidden" name="numPerPage"
									value="${numPerPage }" /> <input type="hidden"
									name="searchType" value="email"> <input type="text"
									name="keyword" placeholder="이메일을 입력해주세요" style="width: 80%">
								<button type="submit" class="btn-black">검색</button>
							</form>
						</div>
						<div id="search_phone">
							<form action="${path }/admin/searchMember" method="post">
								<input type="hidden" name="numPerPage"
									value="${numPerPage }" /> <input type="hidden"
									name="searchType" value="phone"> <input type="text"
									name="keyword" placeholder="전화번호를 입력해주세요" style="width: 80%">
								<button type="submit" class="btn-black">검색</button>
							</form>
						</div>
						<div id="search_addr">
							<form action="#" method="post">
								<input type="hidden" name="numPerPage"
									value="${param.numPerPage }" /> <input type="hidden"
									name="searchType" value="address1"> <input type="text"
									name="keyword" placeholder="주소를 입력해주세요" style="width: 80%">
								<button type="submit" class="btn-black">검색</button>
							</form>
						</div>
						</td>
						</tr>
			</table>
		</div>
		</div>
	</div>

	<div class="container-fluid">
		<div style="text-align: right;padding-right:20px;">
		<form action='${path }/admin/${searchType!=null?"searchMember":"memberManager"}' method="post" id="frmNum">
			<input type="hidden" name="cPage" value="${cPage }"/>
			<input type="hidden" name="searchType" value="${searchType }"/>
			<input type="hidden" name="keyword" value="${keyword }"/>
			<select name="numPerPage" style="font-size: 16px;" id="numPer">
				<option value="10" ${numPerPage!=10?"":"selected" }>10개씩보기</option>
				<option value="20" ${numPerPage!=20?"":"selected" }>20개씩보기</option>
				<option value="30" ${numPerPage!=30?"":"selected" }>30개씩보기</option>
			</select>
		</form>
		</div>
		<div class="col-md-12" style="height: auto;">
			<form action="#" method="post" id="frmMember">
				<div class="row">
					<div class="col-md-8" style="padding-bottom:10px;">
						<button class="btn-black" type="button" onclick="checkDelete();">선택삭제</button>
					</div>
				</div>
				<table class="memberMg checking">
					<colgroup>
						<col width="5%">
						<col width="10%">
						<col width="10%">
						<col width="20%">
						<col width="auto">
						<col width="auto">
						<col width="15%">
					</colgroup>
					<tr>
						<th scope="col"><input type="checkbox" id="allck"><label
							for="allck"></label></th>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">전화번호</th>
						<th scope="col">주소</th>
						<th scope="col">이메일</th>
						<th scope="col">삭제</th>
					</tr>
					<c:forEach items="${list }" var="m" varStatus="vs">
						<tr>
							<td><input type="checkbox" class="memberck" name="memberCk"
								id="member${vs.count }" value="${m.userId }"><label
								for="member${vs.count }"></label></td>
							<td><c:out value="${m.userId }" /></td>
							<td><c:out value="${m.userName}" /></td>
							<td><c:out value="${m.phone}" /></td>
							<td><c:out value="${m.address1}" /></td>
							<td><c:out value="${m.email }" /></td>
							<td>
								<button class="btn-black deleteMember" type="button"
									value="${m.userId  }">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</form>
			${pageBar }
		</div>
	</div>
</div>
<script>
	//검색타입 결정
	$(function() {
		$("#search_Type").change(function() {
			let val = $("#search_Type").val();
			let id = $("#search_id");
			let name = $("#search_name");
			let email = $("#search_email");
			let phone = $("#search_phone");
			let addr = $("#search_addr");
			let date = $("#search_date");
			id.hide();
			name.hide();
			email.hide();
			phone.hide();
			addr.hide();
			date.hide();
			$("#search_" + val).css("display", "inline-block");
		})
	})
	//전체선택 전체해제
	$(function() {
		$("#allck").click(function() {
			if ($("#allck").prop("checked")) {
				$(".memberck").prop("checked", true);
			} else {
				$(".memberck").prop("checked", false);
			}
		})
	})

	//멤버 스테이터스 0->1
	$(function() {
		$(".deleteMember").click(function() {
			let val = $(this).val();
			location.replace("${path}/admin/deleteMember?id=" + val);
		})
	})
	//선택삭제
	function checkDelete() {
		$("#frmMember").attr("action", "${path}/admin/checkdeleteMember");
		$("#frmMember").submit();
	}
	//numPerPage변경
	$("#numPer").change(function() {
		$("#frmNum").submit();
	})
</script>


</body>

</html>