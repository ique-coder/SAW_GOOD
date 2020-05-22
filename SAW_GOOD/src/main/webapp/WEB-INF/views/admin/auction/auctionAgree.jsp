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
table.auctionAg tr td {
	text-align: center;
	padding: 10px 0;
}

table.auctionAg tr th {
	text-align: center;
	padding: 10px 0 10px 0;
}

table.auctionAg tr td {
	border-top: 1px solid lightgray;
}

table.auctionAg {
	border-radius: 20px;
	height: 100%;
	width: 100%;
	border-bottom: 1px solid black;
	border-top: 1px solid black;
}

/* 버튼 */
.btn-black {
	width:100px;
	line-height: 30px;
	font-size: 15px;
	color: #fff;
	text-align: center;
	background-color: #303030;
	border: 1px solid #303030;
}



/* 옥션승인 카테고리 */
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
#searchTbl{
	width:100%;
}
#searchTbl tr td {
	border: 1px solid black;
	padding: 10px;
}

#searchTbl tr th {
	border: 1px solid black;
	padding: 10px;
}
#search_userid {
	width: 100%;
	display: inline;
}

#search_actitle {
	display: none;
	width: 100%;
}
#search_designer{
	display: none;
	width: 100%;
}

#search_enrollDate {
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
	<h2 id="titeltwo">Auction Manager</h2>
	<div class="container-fluid" style="padding-bottom: 40px" id="category">
		<div class="row">
			<div class="col-sm-6 subcategory">
				<input type="radio" name="subcategory" id="disagree" /> <label
					for="subcategory">승인대기</label>
			</div>
			<div class="col-sm-6 subcategory">
				<input type="radio" name="subcategory" id="agree" checked/> <label
					for="subcategory">승인완료</label>
			</div>
		</div>
	</div>
	<div class="container-fluid" style="margin-bottom: 30px;">
		<div class="col-sm-12">
				<form id="searchFrm" action="${path }/admin/auctionAgreeSearch" method="get">
				<table id="searchTbl" class="checking">
					<colgroup>
						<col width="15%">
						<col width="60%">
					</colgroup>
					<tr>
						<th>통합검색</th>
						<td colspan="2" id="removeType">
							<select name="search_Type"
							style="padding: 3px;" id="search_Type">
								<option value="userid">작성자</option>
								<option value="actitle">제목</option>
							</select>
							<div id="search_userid">
									<input type="hidden" name="searchType" value="userid"> <input
										type="text" name="keyword" placeholder="작성자를 입력해주세요"
										style="width: 30%">
							</div>
							<div id="search_actitle">
									<input type="hidden" name="searchType" value="actitle">
									<input type="text" name="keyword" placeholder="제목을 입력해주세요"
										style="width: 30%">
							</div>
						</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td><input type="date" name="enrollDate"/></td>
					</tr>
					<tr>
						<th>상품상태</th>
						<td>
							<input type="radio" name="rank" value="S" id="rankS"/><label for="rankS">S</label>
							<input type="radio" name="rank" value="A" id="rankA"/><label for="rankA">A</label>
							<input type="radio" name="rank" value="B" id="rankB"/><label for="rankB">B</label>
							<input type="radio" name="rank" value="C" id="rankC"/><label for="rankC">C</label>
							<input type="radio" name="rank" value="D" id="rankD"/><label for="rankD">D</label>
						</td>
					</tr>
					<tr>
						<th>경매상태</th>
						<td>
							<input type="radio" name="howStatus" value="Ing" id="ingAuc"/><label for="ingAuc">진행중</label>
							<input type="radio" name="howStatus" value="finish" id="finishAuc"/><label for="finishAuc">완료</label>
						</td>
					</tr>
					<tr>
						<th>브랜드</th>
						<td class="checking"><input type="checkbox" name="brand"
							value="에이스" id="br1"><label for="br1">에이스</label> <input
							type="checkbox" name="brand" value="알레르망" id="br2"><label
							for="br2">알레르망</label> <input type="checkbox" name="brand"
							value="쇼팽" id="br3"><label for="br3">쇼팽</label> <input
							type="checkbox" name="brand" value="모차르트" id="br4"><label
							for="br4">모차르트</label> <input type="checkbox" name="brand"
							value="베토벤" id="br5"><label for="br5">베토벤</label></td>
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
						<td colspan="2" style="text-align: right; border: none;">
							<button type="button" class="btn-black" id="submitSearch">검색</button>
						</td>
					</tr>
				</table>
			</form>
			</div>
	</div>
	<div class="container-fluid">
		<div style="text-align: right; padding-right: 20px;">
			<form action='${path }/admin/${keyword!=null?"auctionAgreeSearch":"auctionAgreeList"}' method="post" id="numFrm">
				<input type="hidden" name="cPage" value="${cPage }"/>
				<input type="hidden" name="searchType" value="${searchType }"/>
				<input type="hidden" name="keyword" value="${keyword }"/>
				<input type="hidden" name="enrollDate" value="${enrollDate }"/>
				<input type="hidden" name="rank" value="${rank }"/>
				<input type="hidden" name="howStatus" value="${howStatus }"/>
				<c:if test="${category !=null }">
						<c:forEach items="${category }" var="c">
							<input type="hidden" name="category" value="${c }"/>
						</c:forEach>
				</c:if>
					<c:if test="${brand !=null }">
						<c:forEach items="${brand }" var="c">
							<input type="hidden" name="brand" value="${b }"/>
						</c:forEach>
				</c:if>
				
					<select name="numPerPage" style="font-size: 16px;">
						<option value="10" ${numPerPage==10?"selected":"" }>10개씩보기</option>
						<option value="20" ${numPerPage==20?"selected":"" }>20개씩보기</option>
						<option value="30" ${numPerPage==30?"selected":"" }>30개씩보기</option>
					</select>
			</form>
		</div>
		<div class="col-md-12" style="height: auto;">
			<form action="#" method="post" id="auctionFrm">
				<div class="row">
					<div class="col-md-8" style="padding-bottom:10px;">
						<button class="btn-black" type="button" id="deleteAuc">삭제</button>
						<button class="btn-black" type="button" id="imediatley">즉시입찰</button>
					</div>
				</div>
				<table class="auctionAg checking">
					<colgroup>
						<col width="5%">
						<col width="5%">
						<col width="15%">
						<col width="auto">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>

					<tr>
						<th scope="col"><input type="checkbox"
							id="auctionAll"><label for="auctionAll"></label></th>
						<th scope="col">번호</th>
						<th scope="col"></th>
						<th scope="col">상품정보</th>
						<th scope="col">카테고리</th>
						<th scope="col">브랜드</th>
						<th scope="col">작성자</th>
						<th scope="col">등록일</th>
						<th scope="col">만료일</th>
						<th scope="col">승인여부</th>
					</tr>
					<c:if test="${not empty auclist }">
					<c:forEach items="${auclist }" var="ac" varStatus="vs">
						<fmt:parseNumber value="${ac['ACENDDATE'] }" integerOnly="true" var="EndDate"/>
						<tr>
							<td><input type="checkbox" name="aucCheck" id="aucDisAg${vs.count }" value="${ac['ACBOARDNO']}" class="aucCheck"><label
								for="aucDisAg${vs.count }"></label></td>
							<td>${ac['ACBOARDNO']}</td>
							<td><img src="${path }/resources/upload/auction/${ac['ACMAINIMG']}" /></td>
							<td>
								<a href="${path }/auction/detail?acBoardNo=${ac['ACBOARDNO']}">
								${ac['ACTITLE']} (${ac['ACSTATUSRANK']}) <fmt:formatNumber value="${ac['ACSTARTPRICE']}"/>원
								</a>
							<%-- 	<a href="${path }/admin/auctionView?acno=${ac['ACBOARDNO']}">
								${ac['ACTITLE']} (${ac['ACSTATUSRANK']}) <fmt:formatNumber value="${ac['ACSTARTPRICE']}"/>원 --%>
							</td>
							<td>${ac['ACCATEGORY']}</td>
							<td>${ac['ACBRAND']}</td>
							<td>${ac['USERID']}</td>
							<td><fmt:formatDate value="${ac['ACSTART_DATE']}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${ac['ACENDDATE']}" pattern="yyyy-MM-dd"/></td>
							<c:if test="${ac['ACSTATUS'] == 3 }" >
								<td>
									<button class="btn-black" type="button" disabled>완료</button>
									<button class="btn-black fnDelete" type="button" value="${ac['ACBOARDNO']}" >삭제</button>
								</td>
							</c:if>
							<c:if test="${ac['ACSTATUS'] == 2 }" >
								<td>
									<button class="btn-black" type="button" value="${ac['ACBOARDNO']}">즉시입찰</button>
									<button class="btn-black fnDelete" type="button" value="${ac['ACBOARDNO']}" >삭제</button>
								</td>
							</c:if>
							<c:if test="${ac['ACSTATUS'] == 1 }" >
								<td>
									<button class="btn-black" type="button" disabled>진행중</button>
									<button class="btn-black ingDelete" type="button" value="${ac['ACBOARDNO']}" >삭제</button>
								</td>
							</c:if>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty auclist }">
						<td colspan="10" style="height:300px;">승인대기중인 경매가 없습니다.</td>
					</c:if>
				</table>
			</form>
			${pageBar }	
		</div>
		</div>
	</div>
<script>
	$(function() {
		$("#search_Type").change(function() {
			let val = $("#search_Type").val();
			let title = $("#search_actitle");
			let userid = $("#search_userid");
			title.hide();
			userid.hide();
			$("#search_" + val).css("display", "inline");
		})
	})
	
	//비동의페이지 이동
	$("#disagree").click(function(){
		location.replace("${path}/admin/auctionDisAgreeList");
	})	

	//펀딩 검색기능
	$("#submitSearch").click(function(){
		var type=$("#search_Type").val();
		$("#removeType").find($("#search_"+type)).siblings($("#search_"+type)).not($("select[id=search_Type]")).remove();
		$("#searchFrm").submit();
	})
	//완료 삭체
	$(".fnDelete").click(function(){
		var val=$(this).val();
		location.replace("${path}/admin/deleteFnOneAgAuction?acno="+val);
	})
	//진행중 삭제
	$(".ingDelete").click(function(){
		console.log("111111")
		var val=$(this).val();
		location.replace("${path}/admin/deleteIngOneAgAuction?acno="+val);
	})
	
	//더블클릭 방지
	var click=false;
       
    function doubleClickNo(){
       	if(click){
        	return click;
        }else{
        	click = true;
        	return false;
        }
    }
    //배열 contains함수 생성
    Array.prototype.contains = function(element) {
		for (var i = 0; i < this.length; i++) {
			if (this[i] == element) {
				return true;
			}
		}
		return false;
	}
    
    //전체선택 전체해제
    	$(function() {
		$("#auctionAll").click(function() {
			if ($("#auctionAll").prop("checked")) {
				$(".aucCheck").prop("checked", true);
			} else {
				$(".aucCheck").prop("checked", false);
			}
		})
	})
    //넘퍼페이지 변경
    $("#numFrm").change(function(){
    	 $("#numFrm").submit();
    })
    //체크된 펀딩 삭제
     $("#deleteAuc").click(function(){
    	var arrText=[];
    	$(".aucCheck:checked").each(function(index,item){
    		arrText[index]=$(item).parent().next().next().next().next().next().next().next().next().next().find("button:disabled").text();
    	})
    	if($(".aucCheck:checked").length==0){
    		alert("삭제할 경매를 선택해주세요")
    	}else if(arrText.contains("진행중")==true && arrText.contains("완료")==true){
    		alert("진행중 경매와 옥션 경매 를 따로 선택해주세요");
    	}else if(arrText.contains("진행중")==true && arrText.contains("완료")==false){
    		$("#auctionFrm").attr("action","${path}/admin/deleteIngCkAuction");
    		$("#auctionFrm").submit();
    	}else if(arrText.contains("진행중")==false && arrText.contains("완료")==true){
    		$("#auctionFrm").attr("action","${path}/admin/deleteFnCkAuction");
    		$("#auctionFrm").submit();
    	}
     })
</script>


</body>

</html>