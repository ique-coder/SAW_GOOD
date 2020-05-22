
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/mypage/ph.css?ver=0" />

<style>
	.noList {
		margin-top:50px;
	}
</style>

<div class="container">
	<div class="row">
		<div class="col-md-2">
			<div id="info">
				<div id="infoSub1">
					<img id="profileImg"
						src="../image/KakaoTalk_20200423_153013027.jpg" alt="">
					<p>${member.userId }님</p>
				</div>
				<div id="infoSub2">
					<p>쏘:굿 페이 포인트</p>
					<P><fmt:formatNumber type="number" value="${member.point }"/>원</P>
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
					<form id="subFormProduct" action="${path }/mypage/ph.do"
						method="post">
						<p id="productClick" name="product" class="click">new product</p>
					</form>
					<form id="subFormFunding" action="${path }/mypage/funding.do"
						method="post">
						<p id="fundingClick" name="funding" class="click">funding</p>
					</form>
					<form id="subFormAuction" action="${path }/mypage/auction.do"
						method="post">
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


			<c:if test="${list.size() == 0 }">
				<p class="noList center">결재내역이 없습니다.<p>
			</c:if>
			<c:if test="${list.size() != 0 }">
			
			<div id="list">

				<c:forEach var="p" items="${list }">
					<div class="product row">
						<div class="col-md-2 productImg">
							<img
								src="${path }/resources/upload/newproduct/${p['RENAMEDPRODUCTIMG']}"
								alt="">
						</div>
						<div class="col-md-8 pSpace spanSpace">
							<p class="titleInfo">
								<span class="brand">[${p['BRAND'] }]</span> <span
									class="productName">${p['PRODUCTNAME'] }</span>
							</p>
							
							<p class="priceDate">
								<span class="productPrice"><fmt:formatNumber type="number" value="${p['PROTOPTALPRICE'] }"/>원
									(${p['PRODUCTNUM'] }개)</span> <span class="sendDate">${p['BUYDATE'] }</span>
							</p>

							<!-- step1 : 상품준비중
		                        step2 : 상품 발송
		                        step3 : 배달중
		                        step4 : 배달완료
		                        step5 : 구매완료
		                        stepX : 교환/반품 완료  -->

							<p class="sendCheck">
							
								<c:if test="${p['STATUS'] == 1 }">
									<span class="sendStep1 sendStep">상품준비중</span>
								</c:if>
								<c:if test="${p['STATUS'] == 2 }">
									<span class="sendStep2 sendStep">상품 발송</span>
								</c:if>
								<c:if test="${p['STATUS'] == 3 }">
									<span class="sendStep3 sendStep">배달중</span>
								</c:if>
								<c:if test="${p['STATUS'] == 4 }">
									<span class="sendStep4 sendStep">배달완료</span>
								</c:if>
								<c:if test="${p['STATUS'] == 5 }">
									<span class="sendStep5 sendStep">구매완료</span>
								</c:if>
								<c:if test="${p['STATUS'] == 6 }">
									<span class="sendStepX sendStep">교환/반품 완료</span>
								</c:if>
							</p>

							<!-- status1 : 배송전
		                        status2 : 구매확정 전
		                        status3 : 구매확정 후
		                        statusX : 취소  -->

							<p class="confirmStatus status1">
								<c:if test="${p['BUYCHECK'] == 'no' }">
									<c:if test="${p['STATUS'] == 1 || p['STATUS'] == 2 }">
										<span>소중한 고객님의 상품을 주소지에 보내</span><br /> <span>조금만 기다려주시면
											<strong>곧 택배 접수 하여 보내드리겠습니다.</strong>
										</span>
									</c:if>
									<c:if test="${p['STATUS'] == 3 || p['STATUS'] == 4 }">
										<span>물품은 잘 받아보셨나요?</span><br /> 
										<span>마음에 드신다면 구매확정을 눌러주세요!</span>
									</c:if>
								</c:if>
								<c:if test="${p['BUYCHECK'] == 'yes' }">
									<span>구매가 완료되었습니다. 이용해주셔서 감사합니다.</span><br /> 
									<span>
										구매확정 이후 <strong>상품의 이용방법, 반품 등에 대한 문의는 판매자에게 문의해주세요.</strong>
									</span>
								</c:if>
								<c:if test="${p['BUYCHECK'] == 'cancle' }">
									<span class="sendStepX sendStep">교환/반품/취소 완료</span>
								</c:if>
							</p>

						</div>
						<div class="col-md-2 center inline statusBtn1">
							<form action="" method="post">
								<c:if test="${p['BUYCHECK'] == 'no' }">
									<input type="button" class="productBtn buyOk" value="구매확정">
									<input type="button" class="productBtn change" value="교환요청">
									<input type="button" class="productBtn refund" value="반품요청">
									<input type="button" class="productBtn extend" value="구매확정연장">						
								</c:if>
								<c:if test="${p['BUYCHECK'] == 'yes' }">
									<input type="button" class="productBtn review" value="리뷰쓰기">
									<input type="button" class="productBtn reBuy" value="재구매">
								</c:if>
								<c:if test="${p['BUYCHECK'] == 'cancle' }">
									 <input type="button" class="productBtn reBuy" value="재구매">
								</c:if>
								<input type="hidden" name="phno" value="${p['PHNO'] }">
								<input type="hidden" name="productNo" value="${p['PRODUCTNO'] }">
							</form>
						</div>
					</div>
				</c:forEach>
			</div>
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
	
	$(".buyOk").off("click").on("click", function() {
		$(this).parent().attr('action','${path}/mypage/buyOk');
		$(this).parent().submit();
	})
	
	$(".extend").off("click").on("click", function() {
		$(this).parent().attr('action','${path}/mypage/extend');
		$(this).parent().submit();
	})
	$(".review").off("click").on("click", function() {
		$(this).parent().attr('action','${path}/mypage/review');
		$(this).parent().submit();
	})
	$(".reBuy").off("click").on("click", function() {
		$(this).parent().attr('action','${path}/mypage/review');
		$(this).parent().submit();
	})
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />