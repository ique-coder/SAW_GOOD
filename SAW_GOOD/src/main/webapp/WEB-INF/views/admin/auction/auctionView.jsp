<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/admin/common/headerAndfooter.jsp"/>

<style>
		/* 섹션(본문) */
		#titeltwo {
			padding-bottom: 30px;
			margin: 0;
			font-size: 45px;
			font-weight: bolder;
		}

		#hr {
			margin: 0;
		}

		/* 이미지부분 */
		.multiple_slider li img {
			width: 100%;
			height: 130px;
		}

		.multiple_slider li img:hover {
			border: 1px solid black;
			cursor: pointer;
		}

		.multiple_slider li {
			width: 100%;
			height: 100%;
		}

		.slideWrap {
			width: 100%;
			position: relative;
			margin-top: 30px;
		}

		.controls .bx-prev,
		
		.controls .bx-next {
			position: absolute;
			top: 50%;
			transform: translateY(-50%);
		}

		.controls .bx-prev {
			right: calc(100% + 10px);
		}

		.controls .bx-next {
			left: calc(100% + 10px);
		}

		/* 펀딩설명창 */
		.character {
			border-bottom: 1px solid #eee;
			margin-bottom: 20px;
		}

		.character>b {
			font-weight: bolder;
			font-size: 23px;
		}

		.character>p {
			font-size: 17px;
			color: #b2b2b2;
			margin: 0;
			padding: 5px 0 10px 10px;
		}

		.auction_tit {
			display: inline-block;
			width: 150px;
			font-size: 20px;
			margin-bottom:20px;
		}

		.auction_con {
			display: inline-block;
			width: 282px;
			color: black;
			font-size: 25px;
			margin-bottom:20px;
		}

		#button {
			text-align: right;
			margin-right: 20px;
			border-top:1px solid #eee;
			padding-top:20px;
		}

		.btn-agree {
			padding: 0 30px;
			line-height: 42px;
			font-size: 15px;
			color: #fff;
			text-align: center;
			background-color: #303030;
			border: 1px solid #303030;

		}
</style>

<div id="content" class="p-4 p-md-5 pt-5">
			<h2 id="titeltwo">Auction View</h2>
			<hr id="hr">
			<div class="container-fluid" style="margin-top: 30px;">
				<div class="row">
					<div class="col-xl-6">
						<div>
							<img class="img-reponsive img-thumbnail" id="mainImg" src="${path }/resources/upload/auction/${auc['ACMAINIMG']}" width="99%"
								style="height:600px;" />
						</div>
						<div class="slideWrap multipleWrap controls">
							<ul class="multiple_slider">
								<%-- <c:forEach items="${subImg }" var="i" varStatus="vs">
									<li><img src="${path }/resources/upload/funding/${i['SUBIMG']}" class="changeImg" /></li>
								</c:forEach> --%>
								<li><img src="${path }/resources/upload/newproduct/funding/bed.png" class="changeImg" /></li>
								<li><img src="${path }/resources/upload/newproduct/funding/sofa.jpg" class="changeImg" /></li>
								<li><img src="${path }/resources/upload/newproduct/funding/softchair.jpg" class="changeImg" /></li>
								<li><img src="${path }/resources/upload/newproduct/funding/teaTable.jpg" class="changeImg" /></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-6" style="padding:5px 0 0 20px;">
						<div id="auction-info">
							<div class="character">
								<b>펀딩특징</b>
								<p>이 펀딩은 쏘굿에서만 특별진행하는 펀딩입니다.</p>
							</div>
							<h4 style="font-size: 23px;">
								auction Info
								<span style="font-size: 17px; padding-left:10px;color:#b2b2b2">펀딩정보</span>
							</h4>
							<ul id="auction-all" style="padding:20px 0 0 0; height:450px;">
								<li>
									<p class="auction_tit"><span> - </span> 작성자 </p>
									<p class="auction_con">
										<strong> 1 </strong>
									</p>
								</li>
								<li>
									<p class="auction_tit"><span> - </span> 디자이너 </p>
									<p class="auction_con">
										<strong> 2 </strong>
									</p>
								</li>
								<li>
									<p class="auction_tit"><span> - </span> 펀딩제목 </p>
									<p class="auction_con">
										<strong> 3 </strong>
									</p>
								</li>
								<li>
									<p class="auction_tit"><span> - </span> 목표가격</p>
									<p class="auction_con">
										<strong>4</strong>
									</p>
								</li>
								<li>
									<p class="auction_tit"><span> - </span> 현재가격 </p>
									<p class="auction_con">
										<%-- <c:choose>
											<c:when test="${empty partPrice }">
												<strong>0원</strong>
											</c:when>
											<c:when test="${not empty partPrice }">
												<strong> <fmt:formatNumber value="${partPrice['PARTPRICE'] }"/>원 </strong>
											</c:when>
										</c:choose> --%>
									</p>
								</li>
								<li>
									<p class="auction_tit"><span> - </span> 등록날짜 </p>
									<p class="auction_con">
										<strong>5</strong>
									</p>
								</li>
								<li>
									<p class="auction_tit"><span> - </span> 만료날짜 </p>
									<p class="auction_con">
										<strong>6 </strong>
									</p>
								</li>
							</ul>
								<div id="button">
									<button type="button" class="btn-agree" id="fd-Ag" value="">승인</button>
									<button type="button" class="btn-agree" id="fd-disAg" value="">거부</button>
								</div>
						</div>
					</div>
				</div>
			</div>
</div>
	<script>
		$(function () {
			$(".multiple_slider").bxSlider({
				nextText: '<i class="fas fa-chevron-right"></i>',
				prevText: '<i class="fas fa-chevron-left"></i>',
				pager: false,
				minSlides: 2,
				maxSlides: 5,
				moveSlides: 1,
				slideWidth: 255,
				slideMargin: 30
			})

		})
	//이미지변경
	$(function(){
		$(".changeImg").click(function(){
				var subsrc=$(this).attr("src");
				var mainsrc=$(this).parents("div.controls").prev().find("#mainImg").attr("src");
				console.log(subsrc);
				console.log(mainsrc);
				$(this).parents("div.controls").prev().find("#mainImg").attr("src",subsrc);
				$(this).attr("src",mainsrc);
			})
	})
	//동의 거부
	$("#fd-Ag").click(function(){
		var val=$(this).val();
		location.replace("${path}/admin/agreeFunding?fdno="+val);
	})
	$("#fd-disAg").click(function(){
		var val=$(this).val();
		location.replace("${path}/admin/disAgreeFunding?fdno="+val);
		})
	</script>

</body>

</html>