<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="" name=""/>
	</jsp:include>

<link rel="stylesheet" href="${path }/resources/css/member/myPage/myPageFundingList.css?ver=0"/>
<div class="container">
	<div class="row">
		<div class="col-md-2">
			<div id="info">
				<div id="infoSub1">
				<c:if test="${ not empty loginMember.profile }">
				
					<img id="profileImg"
						src="../image/KakaoTalk_20200423_153013027.jpg" alt="">
				</c:if>
				<c:if test="${ empty loginMember.profile }">
				
					<div id="alterImg">
					
					</div>
				</c:if>		
					<p><c:out value="${loginMember.userId}"/> 님</p>
					
				</div>
				<div id="infoSub2">
					<p>쏘:굿 페이 포인트</p>
					<P><fmt:formatNumber value="${loginMember.point }"/>원</P>
				</div>
				<div id="infoSub3">
					<button id="cashBtn" class="btn">충전</button>
				</div>
			</div>
			<div id="infoCount" class="center">
				<p>연간 이용 내역</p>
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
					<form id="subFormFunding" action="/good/mypage/moveSub" method="post">
						<p id="fundingClick" name="funding" class="click">funding</p>
					</form>
					<form id="subFormAuction" action="/good/mypage/moveSub" method="post">
						<p id="auctionClick" name="auction" class="click">action</p>
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
			
			<form action="" method="post">
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
							<option>승인전</option>
							<option>승인완료</option>
							<option>진행중</option>
							<option>달성완료</option>
							<option>달성실패</option>
						</select>
					</div>
					<div class="list" id="list4">
						<input type="submit" value="조회">
					</div>
				</div>
			</form>
			</div>


			<div id="list">
			<c:forEach var="item" items="${list }">
				<div class="product row">
					<div class="col-md-2 productImg">
						<img src="${ path}/resources/images/${item.mainImg}" alt="" >
					</div>
					<div class="col-md-8 pSpace spanSpace">
						<c:if test ="${item.appr==1 and item.status == 1 or item.status ==2 }">
							<a href="${path }/funding/detail?fdNo=${item.fdNo}">
							<p class="titleInfo">
								<span class="brand">${item.designer }</span> <span class="productName">${item.title }</span>
							</p>
							</a>
						</c:if>
						<c:if test = "${item.appr==0 or item.status == 0 or item.status ==3}">
							<p class="titleInfo">
								<span class="brand">${item.designer }</span> <span class="productName">${item.title }</span>
							</p>
						
						</c:if>
						<p class="priceDate">
							<span class="productPrice">목표 금액 : <fmt:formatNumber type="number" value="${item.targetPrice }"></fmt:formatNumber></span> 
							
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
							<span class="sendStep1 sendStep">
							<c:if test="${item.appr ==0 }">
								관리자 승인 전
							</c:if>
							<c:if test="${item.appr ==1 }">
								<c:if test="${empty item.status }">
									상세정보 입력 하시면 바로 노출됩니다.
								</c:if>
								<c:if test="${item.status == 0}">
									목표금액을 채우지못하고 종료되었습니다. 곧 환불이 이루어집니다.
								</c:if>
								<c:if test="${item.status == 1}">
									현재 진행중입니다.
								</c:if>
								<c:if test="${item.status == 2}">
									성공적으로 끝난 펀딩입니다.
								</c:if>
								<c:if test="${item.status == 3}">
									목표금액을 채우지못하고 종료되어 환불이 완료되었습니다.
								</c:if>
							</c:if>
							<c:if test="${item.appr ==2 }">
								승인거부
							</c:if>
							</span>
						</p>
						
						<p class="confirmStatus status1">
							<span class="sendDate">등록 날짜 : <fmt:formatDate type="date" dateStyle="medium" value="${item.enrollDate }" ></fmt:formatDate></span>
							<br/>
							<span class="sendDate">목표 날짜 : <fmt:formatDate type="date" dateStyle="medium" value="${item.endDate }" ></fmt:formatDate></span>
						</p>

					</div>
					<div class="col-md-2 center inline statusBtn1">
						<c:if test="${item.appr ==0 }">
								<button class="productBtn" onclick="location.href='${path}/funding/enroll/modify?fdNo=${item.fdNo}'">정보 수정하기</button>
						</c:if>
						<c:if test="${item.appr ==1 }">
								<c:if test="${empty item.status }" >
									<button class="productBtn" onclick="location.href='${path}/funding/enroll/step3?fdNo=${item.fdNo}'">상세정보 입력하기</button>
								</c:if>
								<c:if test="${item.status == 1}">
									<button class="productBtn" onclick="location.href='${path}/funding/detail?fdNo=${item.fdNo}'">게시글 보기</button>
								</c:if>
								<c:if test="${item.status == 2}">
									<button class="productBtn">신청회원 보기</button>
								</c:if>
							</c:if>
					</div>
				</div>
				</c:forEach>
				${pageBar }
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
		let input = $("<input>").attr({"type":"hidden", "value":userId, "name":"userId"});
		$(this).append(input);
		$("#subFormProduct").submit();
	})

</script>





	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>