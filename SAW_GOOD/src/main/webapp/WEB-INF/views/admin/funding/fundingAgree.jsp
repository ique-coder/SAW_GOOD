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

/* 검색창 Agree */
#searchAgTbl{
	width:100%;
}
#searchAgTbl tr td {
	border: 1px solid black;
	padding: 10px;
}

#searchAgTbl tr th {
	border: 1px solid black;
	padding: 10px;
}
#searchAg_userid {
	width: 100%;
	display: inline;
}

#searchAg_title {
	display: none;
	width: 100%;
}
#searchAg_designer{
	display: none;
	width: 100%;
}

#searchAg_enrollDate {
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
<div id="content" class="p-4 p-md-5 pt-5">
	<h2 id="titeltwo">Funding Manager</h2>
	<div class="container-fluid" style="padding-bottom: 40px" id="category">
		<div class="row">
			<div class="col-sm-6 subcategory">
				<input type="radio" name="category" value="disagree"  id="disagree"/> <label
					for="category">승인대기</label>
			</div>
			<div class="col-sm-6 subcategory">
				<input type="radio" name="category" id="agree" value="agree" checked/> <label
					for="category">승인완료</label>
			</div>
		</div>
	</div>
	<!-- 펀딩승인완료 -->
	<div id="fundingAgree">
	<div class="container-fluid" style="margin-bottom: 30px;">
		<div class="col-sm-12">
				<form id="searchAgFrm" action="${path }/admin/fundingAgreeSearch" method="get">
				<table id="searchAgTbl" class="checking">
					<colgroup>
						<col width="15%">
						<col width="60%">
					</colgroup>
					<tr>
						<th>통합검색</th>
						<td colspan="2" id="removeType">
							<select name="searchAg_Type"
							style="padding: 3px;" id="searchAg_Type">
								<option value="userid">작성자</option>
								<option value="designer">디자이너</option>
								<option value="title">펀딩이름</option>
							</select>
							<div id="searchAg_userid">
									<input type="hidden" name="searchType" value="userid"> <input
										type="text" name="keyword" placeholder="작성자를 입력해주세요"
										style="width: 30%">
							</div>
							<div id="searchAg_designer">
									<input type="hidden" name="searchType" value="designer"> <input
										type="text" name="keyword" placeholder="디자이너를 입력해주세요"
										style="width: 30%">
							</div>
							<div id="searchAg_title">
									<input type="hidden" name="searchType" value="title">
									<input type="text" name="keyword" placeholder="제목을 입력해주세요"
										style="width: 30%">
							</div>
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<input
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
					</tr>
					<tr>
						<th>등록일</th>
						<td><input type="date" name="enrollDate"/></td>
					<tr>
						<th>만료일</th>
						<td>
							<input type="radio" name="hasexpired" value="y" id="expire"><label for="expire">expried</label>
							<input type="radio" name="hasexpired" value="n" id="nonexpire"><label for="nonexpire">not expried</label>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: right; border: none;">
							<button type="button" class="btn-black" id="submitSearchAg">검색</button>
						</td>
					</tr>
				</table>
			</form>
			</div>
	</div>
	<div class="container-fluid">
		<div class="col-md-12" style="height: auto;">
			<form action="#" method="post" onsubmit="">
				<div class="row">
					<div class="col-md-8">
						<button class="btn-black" type="button">환불</button>
					</div>
					<div class="col-md-4"
						style="text-align: right; padding-bottom: 20px;">
						<select name="agreement" style="font-size: 14px;">
							<option value="10">10개씩보기</option>
							<option value="20">20개씩보기</option>
							<option value="30">30개씩보기</option>
						</select>
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
						<col width="15%">
					</colgroup>

					<tr>
						<th scope="col"><input type="checkbox" name="fundcheck"
							id="fundingAgAll"><label for="fundingAgAll"></label></th>
						<th scope="col">번호</th>
						<th scope="col"></th>
						<th scope="col">제목</th>
						<th scope="col">디자이너</th>
						<th scope="col">작성자</th>
						<th scope="col">등록일</th>
						<th scope="col">만료일</th>
						<th scope="col">상태</th>
					</tr>
					<c:forEach items="${fundingAgree }" var="fag" varStatus="vs">
					<fmt:parseNumber value="${fag['ENDDATE'].time / (1000*60*60*24)}" integerOnly="true" var="EndDate"/>
					<tr>
						<td><input type="checkbox" name="fundcheck" id="fundAg${vs.count }"><label
							for="fundAg${vs.count }"></label></td>
						<td>${fag['FDNO'] }</td>
						<td><img src="${path }/resources/upload/${dag['MAINIMG']}" /></td>
						<td><a href="${path }/admin/fundingView?fdno=${fag['FDNO'] }">${fag['TITLE']}</a></td>
						<td>${fag['DESIGNER'] }</td>
						<td>${fag['USERID'] }</td>
						<td><fmt:formatDate value="${fag['ENROLLDATE']}" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${fag['ENDDATE']}" pattern="yyyy-MM-dd"/>
						</td>
						<c:if test="${EndDate-today >= 0 }">
							<td>
								<button class="btn-black" type="button" value="${fag['FDNO'] }" disabled>진행중</button>
							</td>
						</c:if>
						<c:forEach items="${targetPrice }" var="tp">
								<c:if test="${tp['FDNO'] eq fag['FDNO'] and EndDate-today <0 and tp['PARTPRICE']<fag['TARGETPRICE']}">
									<td>
										<button class="btn-black" type="button" value="${fag['FDNO'] }">환불</button>
									</td>
								</c:if>
								<c:if test="${tp['FDNO'] eq fag['FDNO'] and EndDate-today <0 and tp['PARTPRICE']>=fag['TARGETPRICE']}">
									<td>
										<button class="btn-black" type="button" value="${fag['FDNO'] }" disabled>완료</button>
									</td>
								</c:if>
						</c:forEach>
					</tr>
					</c:forEach>
				</table>
			</form>
			${agPageBar }
		</div>
		</div>
	</div>
</div>
<script>
	$(function() {
		$("#searchAg_Type").change(function() {
			let val = $("#searchAg_Type").val();
			let title = $("#searchAg_title");
			let userid = $("#searchAg_userid");
			let designer=$("#searchAg_designer")
			title.hide();
			userid.hide();
			designer.hide();
			$("#searchAg_" + val).css("display", "inline");
		})
	})
	
	//승인된 펀딩 검색기능
	$("#submitSearchAg").click(function(){
		var type=$("#searchAg_Type").val();
		$("#removeType").find($("#searchAg_"+type)).siblings($("#searchAg_"+type)).not($("select[id=searchAg_Type]")).remove();
		$("#searchAgFrm").submit();
	})
	
	//비동의 페이지
	$("#disagree").click(function(){
		location.replace("${path}/admin/fundingDisAgreeList");
	})
	var click=false;
        
    function doubleClickNo(){
       	if(click){
        	return click;
        }else{
        	click = true;
        	return false;
        }
    }
</script>


</body>

</html>