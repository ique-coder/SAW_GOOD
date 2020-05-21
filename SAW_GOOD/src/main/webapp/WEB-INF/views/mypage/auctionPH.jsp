
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
	.noList {
		margin-top: 50px;
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
		
			<c:if test="${list.size() == 0 }">
				<p class="noList center">결재내역이 없습니다.<p>
			</c:if>
			<c:if test="${list.size() != 0 }">
				<c:forEach var="a" items="${list }">
					<div class="product row">
						<div class="col-md-2 productImg">
							<img src="../image/1524445081477_iT6B.jpg" alt="">
						</div>
						<div class="col-md-10 pSpace spanSpace">
							<p class="titleInfo">
								<span class="brand">${a['ACCATEGORY'] }</span> <span class="productName">${a['ACTITLE'] }</span>
							</p>
							<p class="priceDate">
								<span class="productPrice">${a['BIDPRICE'] }</span> <span class="sendDate">${a['BIDDATE'] }</span>
							</p>
							<p class="sendCheck">
								판매자 : <span class="sendStep1 sendStep"><fmt:formatNumber type="number" value="${a['USERID'] }"/>원</span>
							</p>
							<p class="confirmStatus">
								<span>소중한 입찰 감사합니다.</span><br /> <span>수많은 경쟁자 중
									<strong>고객님이 최종 낙찰 되셨습니다.</strong>
								</span>
							</p>
	
						</div>
					</div>
				</c:forEach>
			</c:if>
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