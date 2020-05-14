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

    <section>
        <!-- <div class="container-fluid" style="margin-top: 50px;"> -->
        <div class="container" style="margin-top: 50px;">
       <!--      <ul class="detail_top">
                <li><a href="#"><i class="fas fa-home" style="color: green;"></i></a></li>
                <li><i class="fas fa-chevron-right"></i> 가구</li>
            </ul>
 -->
            <div style="text-align: right; margin-bottom: 10px;">
                <img src="${path }/resources/images/auction/clock.png" style="width: 22px; height: 22px;">
                &nbsp<span id="timeout">30일 남음</span>
            </div>

            <div class="detailArea col-sm-12">
                <div class="row">
                    <div class="col-sm-6">
                        <img src="http://placehold.it/600x500" class="bigImg">
                        <div class="addImg">
                            <ul>
                                <li class="img-record">
                                    <img src="http://placehold.it/600x500" class="subImg">
                                </li>
                                <li class="img-record">
                                    <img src="http://placehold.it/600x500" class="subImg">
                                </li>
                                <li class="img-record">
                                    <img src="http://placehold.it/600x500" class="subImg">
                                </li>
                                <li class="img-record">
                                    <img src="http://placehold.it/600x500" class="subImg">
                                </li>
                                <li class="img-record">
                                    <img src="http://placehold.it/600x500" class="subImg">
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="headingArea">
                            <h2>상품 제목입니다.</h2>
                        </div>
                        <div class="record_container">
                            <div class="pro-name">
                                상품명 입니다.
                            </div>
                            <div class="row">
                                <div class="record col-md-3">
                                    <span style="font-size:12px;color:#cc0000;font-weight:bold;">시작가격/단위</span>
                                    <span>즉시낙찰가격</span>
                                    <span>입찰건수</span>
                                    <span>카테고리</span>
                                    <span>상품상태(S~D)</span>
                                    <span>배송비</span>
                                    <span style="margin-bottom: 0;">종료일자</span>
                                </div>
                                <div class="record col-md-3" style="width: 750px;">
                                    <strong style="color:#cc0000;font-weight:bold;">300,000원/10,000원</strong>
                                    <strong>000,000,000원</strong>
                                    <strong>26건</strong>
                                    <strong>chair</strong>
                                    <strong>A</strong>
                                    <strong>고객부담</strong>
                                    <strong style="margin-bottom: 0;">00월00일</strong>
                                </div>
                            </div>
                          


                            <div id="productPrice" class="productPrice">
                                <strong style="font-weight: bold; font-size: 15px; color: #353535;">최고 입찰 금액 : </strong>
                                <strong style="font-weight: bold; font-size: 25px; color: #cc0000;">000,000원</strong>
                            </div>


                            <div class="productAction">
                                <div class="product-button">
                                    <button class="buy-btn">입찰</button>
                                    <button class="cart-btn">즉시입찰</button>
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
                                <div class="pro-info-title">상품명</div>
                                <div class="pro-info-content">&nbsp&nbsp쌸러쌸러</div>
                            </li>
                            <li>
                                <div class="pro-info-title">치수(mm)</div>
                                <div class="pro-info-content">&nbsp&nbspS:1600X2100, D:1800x2200</div>
                            </li>
                            <li>
                                <div class="pro-info-title">구매일</div>
                                <div class="pro-info-content">&nbsp&nbsp00년00월00일</div>
                            </li>
                            <li>
                                <div class="pro-info-title">브랜드</div>
                                <div class="pro-info-content">&nbsp&nbsp(주)이브자리</div>
                            </li>
                            <li>
                                <div class="pro-info-title">새 상품 사이트</div>
                                <div class="pro-info-content">&nbsp&nbsphttps://brand.evezary.co.kr/shop/item.php?it_id=1568082021</div>
                            </li>

                        </ul>
                    </div>
                    <div class="col-md-6 pro-info-wrap">
                        <h2>content</h2>
                        <table style="margin-bottom: 40px;">
                            <colgroup>
                                <col style="width:100px;">
                                <col style="width:auto">
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
                                    <th>애드몬드(아사) 차렵이불 S,D</th>
                                </tr>
                                <tr>
                                    <th>제품설명</th>
                                    <td>사용감은 있습니다 만, 눈에 띄는 흠집 얼룩은 없습니다.
                                        스풀 가장자리에 상처도없이 동작도 문제 없습니다.
                                    
                                    </td>
                                </tr>
                                <tr>
                                    <th>제품상태</th>
                                    <td>A급
                                    </br></br>※ 아래의 "상품 상태 기준 - 상태 순위 목록"을 확인하시기 바랍니다.
                                    </td>
                                </tr>
                          
                            </tbody>
                        </table>
                        <h2 style="margin-top: 15px;">status rank
                        </h2>
                        <table>
                            <colgroup>
                                <col style="width:100px;">
                                <col style="width:auto">
                            </colgroup>
                            <!-- <thead>
                                <tr>
                                    <th colspan="2" >Product status</th>
                                </tr>
                            </thead> -->
                            <tbody>
                                <tr>
                                    <th>S급</th>
                                    <td>
                                        사용하지 않은 제품입니다. 상자,
                                        케이스가없는 사용하지 않은 제품도 포함
                                    </td>
                                </tr>
                                <tr>
                                    <th>A급</th>
                                    <td>
                                        중고품 중에서도 사용감을 느낄 수없는 아주 깨끗한 제품입니다.
                                         흠집, 오염이 거의없는 중고품이라고 생각합니다.
                                    </td>
                                </tr>
                                <tr>
                                    <th>B급</th>
                                    <td>
                                        중고품 중에서도 깨끗한 상품입니다.
                                        약간의 상처 나 얼룩이 있지만, 사용감이 적게 느껴지는 제품입니다.
                                    </td>
                                </tr>
                                <tr>
                                    <th>C급</th>
                                    <td>
                                        상처, 얼룩이 조금 있고,
                                        사용 흔적을 느낄 수 있지만 상태가 좋은 일반적인 중고품입니다.
                                    </td>
                                </tr>
                                <tr>
                                    <th>D급</th>
                                    <td>
                                        상처, 얼룩이 많지만, 사용에 문제가없는 중고품입니다.
                                    </td>
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
                                <col style="width:150px;">
                                <col style="width:auto">
                                <col style="width:300px">
                                <col style="width:150px">
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
                                <tr>
                                    <td class="con">1</td>
                                    <td class="con">s*****</td>
                                    <td class="con">320,000원</td>
                                    <td class="con">00-00-00</td>
                                </tr>
                                <tr>
                                    <td class="con">1</td>
                                    <td class="con">s*****</td>
                                    <td class="con">320,000원</td>
                                    <td class="con">00-00-00</td>
                                </tr>
                                <tr>
                                    <td class="con">1</td>
                                    <td class="con">s*****</td>
                                    <td class="con">320,000원</td>
                                    <td class="con">00-00-00</td>
                                </tr>
                                <tr>
                                    <td class="con">1</td>
                                    <td class="con">s*****</td>
                                    <td class="con">320,000원</td>
                                    <td class="con">00-00-00</td>
                                </tr>
                            
                      
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
                <div id="rank">
                    <div class="col-md-12">
                        <table class="buyer">
                            <colgroup>
                                <col style="width:150px;">
                                <col style="width:auto">
                                <col style="width:150px">
                                <col style="width:150px">
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
                                            <span class="block-span">
                                                <input type="text" name="commentContent" class="comment-content" id="comment-con" />
                                            </span> 
                                        </div>
                                        <div class="col-md-2">
                                            <button type="submit" id="btn-insert" class="btn-insert">댓글등록</button>
                                        </div>
                                        
                                        <input type="hidden" name="noticeNo" value=""/>
                                        <input type="hidden" name="commentWriter" value=""/>
                                        <input type="hidden" name="commentLevel" value="1"/>
                                        <input type="hidden" name="commentNo" value="0"/>
                            
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
              
            </div>



        </div>


    </section>




<jsp:include page="/WEB-INF/views/common/footer.jsp" />