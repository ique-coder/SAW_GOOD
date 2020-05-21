
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/mypage/ph.css?ver=0"/>

<style>
	#list {
		height: auto;
	}
	
</style>


<div class="container">
	<div class="row">
		<div class="col-md-2">
			<div id="info">
				<div id="infoSub1">
					<img id="profileImg"
						src="../image/KakaoTalk_20200423_153013027.jpg" alt="">
					<p>${member.userId } 님</p>
				</div>
				<div id="infoSub2">
					<p>쏘:굿 페이 포인트</p>
					<P>${member.point }원</P>
				</div>
				<div id="infoSub3">
					<button id="cashBtn" class="btn">충전</button>
				</div>
			</div>
			<div id="infoCount" class="center">
				<p>총 이용 내역</p>
				<p>
					<span id="useCount">6건</span> <span>&nbsp;l&nbsp;</span> <span
						id="usePrice">1,071,000원</span>
				</p>
			</div>
			<div id="userCategory" class="center">
				<p>회원정보</p>
				<p>장바구니</p>
				<p onclick="openSub()">결재내역</p>
				<div id="subNav" style="display: none;">
					<form id="subFormProduct" action="${path }/mypage/ph.do" method="post">
						<p id="productClick" name="product" class="click">new product</p>
					</form>
					<form id="subFormFunding" action="${path }/mypage/funding.do" method="post">
						<p id="fundingClick" name="funding" class="click">funding</p>
					</form>
					<form id="subFormAuction" action="${path }/mypage/auction.do" method="post">
						<p id="auctionClick" name="auction" class="click">auction</p>
					</form>
				</div>
			</div>
		</div>


		<div id="list" class="col-md-10 ilnine">
		
			<c:forEach var="f" items="${list }">
				<div class="product row">
					<div class="col-md-2 productImg">
						<img src="${path }/resources/images/funding/${f['MAINIMG']}" alt="">
					</div>
					<div class="col-md-10 pSpace spanSpace">
						<p class="titleInfo">
							<c:if test="${f['STATUS'] == 1 || f['STATUS'] == 2 }">
								<a href="${path }/funding/detail?fdNo=${f['FDNO']}">
									<span class="brand">${f['DESIGNER'] }</span> <span class="productName">${f['TITLE'] }</span>
								</a>
							</c:if>
							<c:if test="${f['STATUS'] == 3 }">
								<span class="brand">${f['DESIGNER'] }</span> <span class="productName">${f['TITLE'] }</span>
							</c:if>
							
						</p>
						<p class="priceDate">
							<span class="productPrice">${f['PARTPRICE'] } (<span class="reword">${f['REWORD'] }</span>)</span>
							
							 <span class="sendDate">${f['PARTDATE'] }</span>
						</p>
						<p class="sendCheck">
							<span class="sendStep1 sendStep">
								<c:if test="${f['STATUS'] == 0}">
								펀딩 실패(
									<c:if test="${f['PURSTATUS'] == 1 }">환불 진행중</c:if>
									<c:if test="${f['PURSTATUS'] == 2 }">환불 완료</c:if>
									<c:if test="${f['PURSTATUS'] == 3 }">환불 대기중</c:if>
								)
								</c:if>
								<c:if test="${f['STATUS'] == 1}">
								펀딩 진행중
								</c:if>
								<c:if test="${f['STATUS'] == 2}">
								펀딩 성공
								</c:if>
							</span>
						</p>
						<p class="confirmStatus">
							<span>소중한 펀딩 감사합니다.</span><br /> <span>고객님의 소중한 후원
								<strong>정직한 제품으로 보답하겠습니다.</strong>
							</span>
						</p>

					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script>
let userId = "${loginMember.userId}";

	function openSub() {
		if($("#subNav").css('display') == 'none') {
			$("#subNav").show();
		} else {
			$("#subNav").hide();
		}
	}

	$("#productClick").on("click", function() {
		$("#subFormProduct").submit();
	}) 
	
	$("#auctionClick").on("click", function() {
		$("#subFormAuction").submit();
	}) 
	$("#fundingClick").on("click", function() {
		$("#subFormFunding").submit();
	}) 

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />