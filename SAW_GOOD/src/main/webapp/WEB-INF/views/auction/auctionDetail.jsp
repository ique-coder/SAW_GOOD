<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet"
	href="${path }/resources/css/auction/auctionProductPage.css" />

<!-- 오늘 날짜 세팅 -->
<c:set value="<%=new java.util.Date()%>" var="now" />
<fmt:parseNumber value="${now.time / (1000*60*60*24)}"
	integerOnly="true" var="today"></fmt:parseNumber>
<!-- 가져온 날짜 세팅 -->
<fmt:parseNumber value="${a.acEndDate.time / (1000*60*60*24)}"
	integerOnly="true" var="acEndDate" />

<section>
	<!-- <div class="container-fluid" style="margin-top: 50px;"> -->
	<div class="container" style="margin-top: 50px;">
		<!--      <ul class="detail_top">
                <li><a href="#"><i class="fas fa-home" style="color: green;"></i></a></li>
                <li><i class="fas fa-chevron-right"></i> 가구</li>
            </ul>
 -->
		<div style="text-align: right; margin-bottom: 10px;">
			<img src="${path }/resources/images/auction/clock.png"
				style="width: 22px; height: 22px;"> &nbsp<span id="timeout">${acEndDate-today }일
				남음</span>
		</div>

		<div class="detailArea col-sm-12">
			<div class="row">
				<div class="col-sm-6">
					<div class="col-md-12" id="mainImg"
						style="height: 60%; margin-bottom: 10px;">
						<img class="images"
							src="${path }/resources/upload/auction/${a.acReMainImg }">
					</div>
					<div class="col-md-12 row" id="serveImg"
						style="height: 20%; margin: 0;">
						<c:if test="${!empty list}">
							<c:forEach items="${sumImg }" var="s">
						
							</c:forEach>
						</c:if>
						<c:if test="${empty list }">
							<img class="col-md-3 images"
							src="http://placehold.it/118x113" /> 
							<img
							class="col-md-3 images"
							src="http://placehold.it/118x113" /> 
							<img
							class="col-md-3 images"
							src="http://placehold.it/118x113" /> 
							<img
							class="col-md-3 images"
							src="http://placehold.it/118x113" /> 
						
						</c:if>
				
					</div>
				</div>
				<div class="col-sm-6">
					<div class="headingArea">
						<h2>${a.acTitle }</h2>
					</div>
					<div class="record_container">
						<div class="pro-name">${a.acProName }</div>
						<div class="row">
							<div class="record col-md-3">
								<span
									style="font-size: 12px; color: #cc0000; font-weight: bold;">시작가격</span>
								<span>최고입찰 가격</span> <span>즉시입찰 가격</span> <span>입찰건수</span> <span>카테고리</span>
								<span>상품상태(S~D)</span> <span>배송비</span> <span
									style="margin-bottom: 0;">종료일자</span>
							</div>
							<div class="record col-md-3" style="width: 750px;">
								<strong style="color: #cc0000; font-weight: bold;"> <fmt:formatNumber
										value="${a.acStartPrice }" pattern="#,###" /> P
								</strong> <strong> <fmt:formatNumber value="${a.acNowPrice }"
										pattern="#,###" /> P
								</strong> <strong> <fmt:formatNumber value="${a.acImdPrice }"
										pattern="#,###" /> P
								</strong> <strong>${bc }건</strong> <strong>${a.acCategory }</strong> <strong>${a.acStatusRank }</strong>
								<strong>10,000 원</strong> <strong style="margin-bottom: 0;">${a.acEndDate }</strong>
							</div>
						</div>



						<div id="productPrice" class="productPrice">
							<strong
								style="font-weight: bold; font-size: 15px; color: #353535;">최고
								입찰 금액( + 배송비 ) : </strong> <strong
								style="font-weight: bold; font-size: 25px; color: #cc0000;">
								<c:if test="${a.acNowPrice < a.acStartPrice }">
                                    		현재 입찰자 없음
                                    	</c:if> <c:if
									test="${a.acNowPrice >= a.acStartPrice }">
									<fmt:formatNumber value="${a.acNowPrice+10000 }"
										pattern="#,###" /> P
                                    	</c:if>
							</strong>
						</div>


						<div class="productAction">
							<div class="product-button">
							
								<c:if
									test="${acEndDate-today > 0 && loginMember != null && a.acStatus == 1 && loginMember.userId != a.userId}">
									<button type="button" class="buy-btn" data-toggle="modal"
										data-target="#bidModal">입찰하기</button>
									<button class="nowBuy-btn" id="nowBuy-btn" onclick="nowBuy();">즉시입찰</button>
								</c:if>
								<c:if test="${acEndDate-today < 0 || a.acStatus != 1}">
									<p style="margin-bottom:15px;">경매가 종료되었습니다.</p>
								</c:if>
								<c:if
									test="${(a.acStatus == 2 || acEndDate-today < 0)&& loginMember.userId eq 'admin' }">
									<button type="button" class="buy-btn" style="width: 300px;"
									onclick="salerPoint()">입찰확정</button>
									<form id="fSalerPoint" action="${path }/auction/salerPoint" method="post">
										<input type="hidden" name="acBoardNo" value="${a.acBoardNo }"> 
										<input type="hidden" name="acNowPrice" value="${a.acNowPrice }">
									</form>
								</c:if>
								<c:if test="${loginMember == null }">
									<button type="button" class="buy-btn" id="loginModal"
										style="width: 300px;">로그인</button>
								</c:if>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div id="detail">
			<div class="tab">
				<ul class="menu">
					<li class="selected"><a href="#detail">상품 정보</a></li>
					<li><a href="#buyerRank">구매자 순위</a></li>
					<li><a href="#inquiry">상품 문의</a></li>
				</ul>
			</div>
			<div class="row">
				<div class="col-md-6 pro-info-wrap">
					<h2>information</h2>
					<ul id="pro-info">

						<li>
							<div class="pro-info-title">치수(가로*세로*높이 mm)</div>
							<div class="pro-info-content">&nbsp&nbsp${a.acProSize }</div>
						</li>
						<li>
							<div class="pro-info-title">구매일</div>
							<div class="pro-info-content">&nbsp&nbsp${a.acBuyDate }</div>
						</li>
						<li>
							<div class="pro-info-title">브랜드</div>
							<div class="pro-info-content">&nbsp&nbsp${a.acBrand}</div>
						</li>
						<li>
							<div class="pro-info-title">새 상품 사이트</div>
							<div class="pro-info-content">&nbsp&nbsp${a.acProUrl}</div>
						</li>

					</ul>
					<h2>content</h2>
					<table style="margin-bottom: 40px;">
						<colgroup>
							<col style="width: 100px;">
							<col style="width: auto">
						</colgroup>
						<!-- <thead>
                                <tr>
                                    <th colspan="2" class="pro-">product content
                                    </th>
                                </tr>
                            </thead> -->
						<tbody>
							<tr>
								<td>제품명</td>
								<th>${a.acProName }</th>
							</tr>
							<tr>
								<th>제품설명</th>
								<td><c:if test="${a.acComent == null }">
                                    		내용 없음.
                                    	</c:if></td>
							</tr>
							<tr>
								<th>제품상태</th>
								<td>${a.acStatusRank }급</br>
								</br>※ 옆에 "상품 상태 기준 - 상태 순위 목록"을 확인하시기 바랍니다.
								</td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="col-md-6 pro-info-wrap">

					<h2 style="margin-top: 15px;">status rank</h2>
					<table>
						<colgroup>
							<col style="width: 100px;">
							<col style="width: auto">
						</colgroup>
						<!-- <thead>
                                <tr>
                                    <th colspan="2" >Product status</th>
                                </tr>
                            </thead> -->
						<tbody>
							<tr>
								<th>S급</th>
								<td>사용하지 않은 제품입니다. 상자, 케이스가없는 사용하지 않은 제품도 포함</td>
							</tr>
							<tr>
								<th>A급</th>
								<td>중고품 중에서도 사용감을 느낄 수없는 아주 깨끗한 제품입니다. 흠집, 오염이 거의없는 중고품이라고
									생각합니다.</td>
							</tr>
							<tr>
								<th>B급</th>
								<td>중고품 중에서도 깨끗한 상품입니다. 약간의 상처 나 얼룩이 있지만, 사용감이 적게 느껴지는
									제품입니다.</td>
							</tr>
							<tr>
								<th>C급</th>
								<td>상처, 얼룩이 조금 있고, 사용 흔적을 느낄 수 있지만 상태가 좋은 일반적인 중고품입니다.</td>
							</tr>
							<tr>
								<th>D급</th>
								<td>상처, 얼룩이 많지만, 사용에 문제가없는 중고품입니다.</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div id="buyerRank">
			<div class="tab">
				<ul class="menu">
					<li><a href="#detail">상품 정보</a></li>
					<li class="selected"><a href="#buyerRank">구매자 순위</a></li>
					<li><a href="#inquiry">상품 문의</a></li>
				</ul>
			</div>
			<div id="rank">
				<div class="col-md-12">
					<table class="buyer">
						<colgroup>
							<col style="width: 150px;">
							<col style="width: auto">
							<col style="width: 300px">
							<col style="width: 150px">
						</colgroup>
						<thead>
							<tr>
								<th class="con tit" style="font-weight: 600;">rank</th>
								<th class="con tit" style="font-weight: 600;">writer</th>
								<th class="con tit" style="font-weight: 600;">price</th>
								<th class="con tit" style="font-weight: 600;">date</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${am }" var="rank" varStatus="vs">
								<tr>
									<td class="con">${vs.index +1}</td>
									<td class="con">${rank['USERID'] }</td>
									<td class="con"><fmt:formatNumber
											value="${rank['BIDPRICE'] }" pattern="#,###" /> P</td>
									<td class="con"><fmt:formatDate
											value="${rank['BIDDATE'] }" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div id="inquiry">
			<div class="tab">
				<ul class="menu">
					<li><a href="#detail">상품 정보</a></li>
					<li><a href="#buyerRank">구매자 순위</a></li>
					<li class="selected"><a href="#inquiry">상품 문의</a></li>
				</ul>
			</div>
			<div>
				<div class="col-md-12">
					<table class="buyer">
						<colgroup>
							<col style="width: 150px;">
							<col style="width: auto">
							<col style="width: 150px">
							<col style="width: 150px">
						</colgroup>
						<thead>
							<tr>
								<th class="con tit" style="font-weight: 600;">no</th>
								<th class="con tit" style="font-weight: 600;">content</th>
								<th class="con tit" style="font-weight: 600;">writer</th>
								<th class="con tit" style="font-weight: 600;">date</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="con">1</td>
								<td class="con">쌸라쌸라쌸라~~??</td>
								<td class="con">이승*</td>
								<td class="con">00-00-00</td>
							</tr>
							<tr>
								<td class="con">1</td>
								<td class="con">쌸라쌸라쌸라~~??</td>
								<td class="con">이승*</td>
								<td class="con">00-00-00</td>
							</tr>
							<tr>
								<td class="con">1</td>
								<td class="con">쌸라쌸라쌸라~~??</td>
								<td class="con">이승*</td>
								<td class="con">00-00-00</td>
							</tr>
							<tr>
								<td class="con">1</td>
								<td class="con">쌸라쌸라쌸라~~??</td>
								<td class="con">이승*</td>
								<td class="con">00-00-00</td>
							</tr>

						</tbody>
					</table>
					<form method="post" onsubmit="return nosubmit();">
						<div class="col-md-12" id="comment-container">
							<div class="row">

								<div class="col-md-10">
									<span class="block-span"> <input type="text"
										name="commentContent" class="comment-content" id="comment-con" />
									</span>
								</div>
								<div class="col-md-2">
									<button type="submit" id="btn-insert" class="btn-insert">댓글등록</button>
								</div>

								<input type="hidden" name="noticeNo" value="" /> <input
									type="hidden" name="commentWriter" value="" /> <input
									type="hidden" name="commentLevel" value="1" /> <input
									type="hidden" name="commentNo" value="0" />

							</div>
						</div>
					</form>
				</div>
			</div>

		</div>



	</div>
	<div class="modal fade" id="bidModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="border: 0; padding-bottom: 0;">
					<h5 class="modal-title modifyTitle" id="exampleModalLabel">&nbsp
						${a.acProName } : 입찰금액</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form id="acMemberBid" action="${path}/auction/bidUpdate"
					method="post">
					<div class="modal-body" style="padding-bottom: 0;">
						<div>
							<input type="text" class="form-control" name="bidPrice"
								id="bidPrice" placeholder=" 최고입찰금액 이상" value="0"
								style="border-radius: 7px;" required> <span
								id="bidNowCk"></span>
						</div>
					</div>
					<input type="hidden" name="userId" value="${loginMember.userId }">
					<input type="hidden" name="acBoardNo" value="${a.acBoardNo }">
					<div class="modal-footer" style="border: 0;">
						<button type="button" class="bid-btn" onclick="bidUpdate();">입찰</button>
						<button type="button" class="cancel-btn" data-dismiss="modal">취소</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	<form id="nowBuyBid" action="${path }/auction/nowBuyBid" method="post">
		<input type="hidden" name="userId" value="${loginMember.userId }">
		<input type="hidden" name="acBoardNo" value="${a.acBoardNo }">
	</form>

</section>
<script>
	    function nowBuy(){
			if(${loginMember!=null?loginMember.point:0} < ${a.acImdPrice}){
				alert("포인트가 부족합니다. 충전후 이용해주세요.");
			}else{
					if (confirm("즉시 입찰됩니다. 동의하시겠습니까?") == true){    //확인
					    $("#nowBuyBid").submit();
					}else{   //취소
					 
					}
			}
		}
    	function bidUpdate(){
    		if (confirm("입찰하시겠습니까?") == true){    //확인
			    if(${a.acImdPrice}>$("#bidPrice").val()){
			    	$("#acMemberBid").submit();
			    }else{
			    	alert("즉시입찰금액보다 적게 입력해야합니다.");
			    }
    			
			}else{   //취소
			 
			}
    		
    	}
    	function salerPoint(){
    		console.log("엥?");
    		$("#fSalerPoint").submit();
    	}
    	$("#loginModal").click(function(){
            var v=document.getElementById("modal_container");
            v.style.transitionDelay="background-color 0.8s";
            $(".modal_container").css({
                right:"0",
                "z-index":"9998",
                backgroundColor:"rgba(0,0,0,0.5)"
            });
            $("section").removeAttr("style");
            $("#userId").focus();
            $(".modal_container").show(800);
        });
    
    </script>




<jsp:include page="/WEB-INF/views/common/footer.jsp" />