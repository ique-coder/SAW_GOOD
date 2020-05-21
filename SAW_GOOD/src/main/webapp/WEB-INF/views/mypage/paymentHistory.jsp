
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
					<form id="subFormProduct" action="/good/mypage/ph.do" method="post">
						<p id="productClick" name="product" class="click">new product</p>
					</form>
					<form id="subFormFunding" action="/good/mypage/funding.do" method="post">
						<p id="fundingClick" name="funding" class="click">funding</p>
					</form>
					<form id="subFormAuction" action="/good/mypage/auction.do" method="post">
						<p id="auctionClick" name="auction" class="click">auction</p>
					</form>
				</div>
			</div>
		</div>


		<div class="col-md-10 ilnine">

			<div id="useList" class="col-md-12 center">
				<!-- 현재상태 보여주기 -->
				<!-- <div id="checkStatus">
                        <div id="statusDriving" class="checkStatusclass">
                            <p>배송중</p>
                        </div>
                        <div id="statusArrive" class="checkStatusclass">
                            <p>배송완료</p>
                        </div>
                        <div id="statusCancle" class="checkStatusclass">
                            <p>취소/환불</p>
                        </div>
                    </div> -->

				<!-- 달력검색 -->
				<div id="monthSearch">
					<div class="list" id="list1">
						<div id="monthListBtn" class="inline">
							<span>12월</span> <span>1월</span> <span>2월</span> <span>3월</span>
							<span>4월</span> <span>5월</span>
						</div>
					</div>
					<div class="list" id="list2">
						<input type="month" name="startMonth" id="startMonth"> - <input
							type="month" name="endMonth" id="endMonth">
					</div>
					<div class="list" id="list3">
						<select>
							<option>전체상태</option>
							<option>배송중</option>
							<option>배송완료</option>
							<option>구매완료</option>
							<option>교환/환불/취소</option>
						</select>
					</div>
					<div class="list" id="list4">
						<input type="submit" value="조회">
					</div>
				</div>
			</div>



			<div id="list">

				<div class="product row">
					<div class="col-md-2 productImg">
						<img src="../image/1524445081477_iT6B.jpg" alt="">
					</div>
					<div class="col-md-8 pSpace spanSpace">
						<p class="titleInfo">
							<span class="brand">[이케아]</span> <span class="productName">벙커침대</span>
						</p>
						<p class="priceDate">
							<span class="productPrice">134,000원</span> <span class="sendDate">2020년
								4월 23일</span>
						</p>
						<!-- 
                        step1 : 상품준비중
                        step2 : 상품 발송
                        step3 : 배달중
                        step4 : 배달완료
                        step5 : 구매완료
                        stepX : 교환/반품 완료 
                        -->
						<p class="sendCheck">
							<span class="sendStep1 sendStep">상품준비중</span>
						</p>
						<!-- 
                        status1 : 배송전
                        status2 : 구매확정 전
                        status3 : 구매확정 후
                        statusX : 취소 
                        -->
						<p class="confirmStatus status1">
							<span>소중한 고객님의 상품을 주소지에 보내</span><br /> <span>조금만 기다려주시면
								<strong>곧 택배 접수 하여 보내드리겠습니다.</strong>
							</span>
						</p>

					</div>
					<div class="col-md-2 center inline statusBtn1">
						<button class="productBtn">구매확정</button>
						<button class="productBtn">교환요청</button>
						<button class="productBtn">반품요청</button>
						<button class="productBtn">구매확정연장</button>
					</div>
				</div>

				<div class="product row">
					<div class="col-md-2 productImg">
						<img src="../image/1524445081477_iT6B.jpg" alt="">
					</div>
					<div class="col-md-8 pSpace spanSpace">
						<p class="titleInfo">
							<span class="brand">[이케아]</span> <span class="productName">벙커침대</span>
						</p>
						<p class="priceDate">
							<span class="productPrice">134,000원</span> <span class="sendDate">2020년
								4월 23일</span>
						</p>
						<!-- 
                        step1 : 상품준비중
                        step2 : 상품 발송
                        step3 : 배달중
                        step4 : 배달완료
                        step5 : 구매완료
                        stepX : 교환/반품 완료 
                        -->
						<p class="sendCheck">
							<span class="sendStep2 sendStep">상품 발송</span>
						</p>
						<!-- 
                        status1 : 배송전
                        status2 : 구매확정 전
                        status3 : 구매확정 후
                        statusX : 취소 
                        -->
						<p class="confirmStatus status1">
							<span>소중한 고객님의 상품을 주소지에 보내</span><br /> <span>조금만 기다려주시면
								<strong>곧 택배 접수 하여 보내드리겠습니다.</strong>
							</span>
						</p>

					</div>
					<div class="col-md-2 center inline statusBtn1">
						<button class="productBtn">구매확정</button>
						<button class="productBtn">교환요청</button>
						<button class="productBtn">반품요청</button>
						<button class="productBtn">구매확정연장</button>
					</div>
				</div>

				<div class="product row">
					<div class="col-md-2 productImg">
						<img src="../image/1524445081477_iT6B.jpg" alt="">
					</div>
					<div class="col-md-8 pSpace spanSpace">
						<p class="titleInfo">
							<span class="brand">[이케아]</span> <span class="productName">벙커침대</span>
						</p>
						<p class="priceDate">
							<span class="productPrice">134,000원</span> <span class="sendDate">2020년
								4월 23일</span>
						</p>
						<!-- 
                        step1 : 상품준비중
                        step2 : 상품 발송
                        step3 : 배달중
                        step4 : 배달완료
                        step5 : 구매완료
                        stepX : 교환/반품 완료 
                        -->
						<p class="sendCheck">
							<span class="sendStep3 sendStep">배달 중</span>
						</p>
						<!-- 
                        status1 : 배송전
                        status2 : 구매확정 전
                        status3 : 구매확정 후
                        statusX : 취소 
                        -->
						<p class="confirmStatus status2">
							<span>물품은 잘 받아보셨나요?</span><br /> <span>마음에 드신다면 구매확정을
								눌러주세요!</span>
						</p>

					</div>
					<div class="col-md-2 center inline statusBtn1">
						<button class="productBtn">구매확정</button>
						<button class="productBtn">교환요청</button>
						<button class="productBtn">반품요청</button>
						<button class="productBtn">구매확정연장</button>
					</div>
				</div>

				<div class="product row">
					<div class="col-md-2 productImg">
						<img src="../image/1524445081477_iT6B.jpg" alt="">
					</div>
					<div class="col-md-8 pSpace spanSpace">
						<p class="titleInfo">
							<span class="brand">[이케아]</span> <span class="productName">벙커침대</span>
						</p>
						<p class="priceDate">
							<span class="productPrice">134,000원</span> <span class="sendDate">2020년
								4월 23일</span>
						</p>
						<!-- 
                        step1 : 상품준비중
                        step2 : 상품 발송
                        step3 : 배달중
                        step4 : 배달완료
                        step5 : 구매완료
                        stepX : 교환/반품 완료 
                        -->
						<p class="sendCheck">
							<span class="sendStep4 sendStep">배달완료(5/2 구매확정 예정)</span>
						</p>
						<!-- 
                        status1 : 배송전
                        status2 : 구매확정 전
                        status3 : 구매확정 후
                        statusX : 취소 
                        -->
						<p class="confirmStatus status2">
							<span>물품은 잘 받아보셨나요?</span><br /> <span>마음에 드신다면 구매확정을
								눌러주세요!</span>
						</p>

					</div>
					<div class="col-md-2 center inline statusBtn1">
						<button class="productBtn">구매확정</button>
						<button class="productBtn">교환요청</button>
						<button class="productBtn">반품요청</button>
						<button class="productBtn">구매확정연장</button>
					</div>
				</div>

				<div class="product row">
					<div class="col-md-2 productImg">
						<img src="../image/1524445081477_iT6B.jpg" alt="">
					</div>
					<div class="col-md-8 pSpace spanSpace">
						<p class="titleInfo">
							<span class="brand">[이케아]</span> <span class="productName">벙커침대</span>
						</p>
						<p class="priceDate">
							<span class="productPrice">134,000원</span> <span class="sendDate">2020년
								4월 23일</span>
						</p>
						<!-- 
                        step1 : 상품준비중
                        step2 : 상품 발송
                        step3 : 배달중
                        step4 : 배달완료
                        step5 : 구매완료
                        stepX : 교환/반품 완료 
                        -->
						<p class="sendCheck">
							<span class="sendStep5 sendStep">구매확정</span>
						</p>
						<!-- 
                        status1 : 배송전
                        status2 : 구매확정 전
                        status3 : 구매확정 후
                        statusX : 취소 
                        -->
						<p class="confirmStatus status3">
							<span>구매가 완료되었습니다. 이용해주셔서 감사합니다.</span><br /> <span>구매확정
								이후 <strong>상품의 이용방법, 반품 등에 대한 문의는 판매자에게 문의해주세요.</strong>
							</span>
						</p>

					</div>
					<div class="col-md-2 center inline statusBtn2">
						<button class="productBtn">리뷰쓰기</button>
						<button class="productBtn">재구매</button>
					</div>
				</div>

				<div class="product row">
					<div class="col-md-2 productImg">
						<img src="../image/1524445081477_iT6B.jpg" alt="">
					</div>
					<div class="col-md-8 pSpace spanSpace">
						<p class="titleInfo">
							<span class="brand">[이케아]</span> <span class="productName">벙커침대</span>
						</p>
						<p class="priceDate">
							<span class="productPrice">134,000원</span> <span class="sendDate">2020년
								4월 23일</span>
						</p>
						<!-- 
                        step1 : 상품준비중
                        step2 : 상품 발송
                        step3 : 배달중
                        step4 : 배달완료
                        step5 : 구매완료
                        stepX : 교환/반품 완료 
                        -->
						<p class="sendCheck">
							<span class="sendStepX sendStep">교환/반품/취소 완료</span>
						</p>
						<!-- 
                        status1 : 배송전
                        status2 : 구매확정 전
                        status3 : 구매확정 후
                        statusX : 취소 
                        -->
						<p class="confirmStatus statusX">
							<span>교환/반품/취소 처리가 완료되었습니다. 이용해주셔서 감사합니다.</span><br /> <span>다음에는
								<strong>더 만족스러운 이용이 되도록 노력하는 쏘굿이 되겠습니다.</strong>
							</span>
						</p>

					</div>
					<div class="col-md-2 center inline statusBtnX">
						<button class="productBtn">재구매</button>
					</div>
				</div>


			</div>
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