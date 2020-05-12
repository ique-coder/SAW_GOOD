<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/auction/auctionPage.css"/>
<link rel="stylesheet" href="css/auctionPage.css" type = "text/css"/>
 <section>   
        <!-- 전체 컨테이너 div -->
        <div class="container" style="padding: 0; ">
            <!-- 경매(옥션) 메인 사진 -->
            <img src="image/auction main2.jpg" style="width: 1080px; height: 550px; margin-left: 30px; margin-top: 30px;"/>
            <!-- <div class="container" style="padding: 0; border-top:0; ">    -->
                <div class="row" style="margin:50px 30px 30px 30px">
                    <div class="col-md-2">
                        <!-- <!— 서브네비게이션 바 —> -->
                        <ul class="category">          
                            <li><a>bed</a></li>
                            <li><a>sofa / chair</a></li>
                            <li><a>light</a></li>
                            <li><a>table / desk</a></li>
                            <li><a>carpet / lug</a></li>
                            <li><a>storage</a></li>
                            <li><a>others</a></li>
                        </ul>
                        <!-- <!— 검색기능 —> -->
                        <span class="block-span">
                            <input type="text" />
                            <button>
                                <img src="image/search.png" width="20px" height="18px"/>
                            </button>
                        </span>
                    </div>
                    <div class="col-md-10">
                        <div class="row">
                            <div class="col-md-6"  style="height: auto;" >
                                <div>
                                    <div class="productPoto">
                                        <img src="http://placehold.it/540x440" style="width:100%; height: 440px;">
                                    </div>
                                    <div class="cash proTitle">
                                        <p>애드몬드(아사) 차렵이불 D</p>
                                    </div>
                                    <div class="boderbottom-Red">
                                        <p class="pCategory" style="font-size: 18px;">BED</p>
                                    </div>
                                    <div class="finalPrice finalDate">
                                        <span class="nowPrice">현재금액 : </span><span>96,000원</span>
                                        <span class="right">27일 남음</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="auctionProduct">
                                    <div class="productPoto">
                                        <img src="http://placehold.it/270x220" style="width:100%; height: 220px;">
                                    </div>
                                    <div class="proTitle">
                                        <p>909 3인소파/쿠션별매/인조가죽</p>
                                    </div>
                                    <div class="boderbottom-Red">
                                        <p class="pCategory" >SOFA</p>
                                    </div>
                                    <div class="finalPriceSmall">
                                        <span class="nowPriceSmall">현재금액 : </span>96,000원</span>
                                        <span class="rightSmall">27일 남음</span>
                                    </div>
                                </div>
                                <div class="auctionProduct">
                                    <div class="productPoto" style="margin-top:10px">
                                        <img src="http://placehold.it/270x220" style="width:100%; height: 220px;">
                                    </div>
                                    <div class="proTitle">
                                        <p>삼단(프레시울트라)요속 S</p>
                                    </div>
                                    <div class="boderbottom-Red">
                                        <p class="pCategory">DESK</p>
                                    </div>
                                    <div class="finalPriceSmall">
                                        <span class="nowPriceSmall">현재금액 : </span>96,000원</span>
                                        <span class="rightSmall">27일 남음</span>
                                    </div>
                                </div>
                            
                            </div>
                            <div class="col-md-3">
                                <div class="auctionProduct">
                                    <div class="productPoto">
                                        <img src="http://placehold.it/270x220" style="width:100%; height: 220px;">
                                    </div>
                                    <div class="proTitle">
                                        <p>OH-03 PU,스테인레스 스틸다리 빠의자</p>
                                    </div>
                                    <div class="boderbottom-Red">
                                        <p class="pCategory">CHAIR</p>
                                    </div>
                                    <div class="finalPriceSmall">
                                        <span class="nowPriceSmall">현재금액 : </span>96,000원</span>
                                        <span class="rightSmall">27일 남음</span>
                                    </div>
                                </div>
                                <div class="auctionProduct">
                                    <div class="productPoto" style="margin-top:10px">
                                        <img src="http://placehold.it/270x220" style="width:100%; height: 220px;">
                                    </div>
                                    <div class="proTitle">
                                        <p>나비 5단 서랍장(화이트)</p>
                                    </div>
                                    <div class="boderbottom-Red">
                                        <p class="pCategory">TABLE</p>
                                    </div>
                                    <div class="finalPriceSmall">
                                        <span class="nowPriceSmall">현재금액 : </span>96,000원</span>
                                        <span class="rightSmall">27일 남음</span>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            <!-- </div> -->
        </div>
        

    </section>	
	
		
		

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>