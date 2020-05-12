<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/product/detail.css"/>
<section>
    <div class="container-fluid" style="margin-top: 50px;">
        <div class="container">
            <ul class="detail_top">
                <li><a href="#"><i class="fas fa-home" style="color: green;"></i></a></li>
                <li><i class="fas fa-chevron-right"></i> 가구</li>
            </ul>
            <div class="detailArea">
                <div class="info">
                    <div class="headingArea">
                        <h2>상품 제목입니다.</h2>
                    </div>
                    <div class="record_container">
                        <div class="pro-name">
                            상품명 입니다.
                        </div>
                        <div class="pro-name" style="font-weight: 400;">
                            <div class="starRev">
                                <span class="starR1 on">별1_왼쪽</span>
                                <span class="starR2">별1_오른쪽</span>
                                <span class="starR1">별2_왼쪽</span>
                                <span class="starR2">별2_오른쪽</span>
                                <span class="starR1">별3_왼쪽</span>
                                <span class="starR2">별3_오른쪽</span>
                                <span class="starR1">별4_왼쪽</span>
                                <span class="starR2">별4_오른쪽</span>
                                <span class="starR1">별5_왼쪽</span>
                                <span class="starR2">별5_오른쪽</span>
                              </div>
                        </div>
                        <div class="record">
                            <span style="font-size:12px;color:#cc0000;font-weight:bold;">판매가</span>
                        </div>
                        <div class="record" style="width: 455px;">
                            <strong style="font-size:12px;color:#cc0000;font-weight:bold;">3,700,500원</strong>
                        </div>
                        <div class="record">
                            <span style="font-size:12px;color:#555555;">브랜드</span>
                        </div>
                        <div class="record" style="width: 455px;">
                            <strong style="font-size:12px;color:#555555;">브랜드명</strong>
                        </div>
                        <div class="record">
                            <span style="font-size:12px;color:#555555;">배송비</span>
                        </div>
                        <div class="record" style="width: 455px;">
                            <strong style="font-size:12px;color:#555555;">무료</strong>
                        </div>
                        <div class="quantity">
                            <label for="amount" style="margin-top: 21px;">수량</label>
                            <div class="amount-area">
                                <button class="pro-btn">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <input type="number" value="1" min="1" max="999" class="pro-cnt" id="amount" required/>
                                <button class="pro-btn"> 
                                    <i class="fas fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <div id="productPrice" class="productPrice">
                            <strong style="font-weight: bold; font-size: 12px; color: #353535;">총 상품 금액</strong>
                            <span style="font-size: 12px;">(수량) : </span>
                            <strong style="font-weight: bold; font-size: 21px;">3,700,500원</strong>
                            <span style="font-size: 12px;">(1개)</span>
                        </div>
                        <div class="productAction">
                            <div class="product-button">
                                <button class="buy-btn">바로구매</button>
                                <button class="cart-btn">장바구니</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="imgArea">
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
            </div>
            <div id="detail">
                <div class="tab">
                    <ul class="menu">
                        <li class="selected"><a href="#detail">DETAIL</a></li>
                        <li><a href="#information">INFORMATION</a></li>
                        <li><a href="#review">REVIEW</a></li>
                        <li><a href="#qna">Q&A</a></li>
                    </ul>
                </div>
                <div class="test">
                    1
                </div>
            </div>
            <div id="information">
                <div class="tab">
                    <ul class="menu">
                        <li><a href="#detail">DETAIL</a></li>
                        <li class="selected"><a href="#information">INFORMATION</a></li>
                        <li><a href="#review">REVIEW</a></li>
                        <li><a href="#qna">Q&A</a></li>
                    </ul>
                </div>
                <div class="test">
                    2
                </div>
            </div>
            <div id="review">
                <div class="tab">
                    <ul class="menu">
                        <li><a href="#detail">DETAIL</a></li>
                        <li><a href="#information">INFORMATION</a></li>
                        <li class="selected"><a href="#review">REVIEW</a></li>
                        <li><a href="#qna">Q&A</a></li>
                    </ul>
                </div>
                <form id="review-message" method="post" action="${path }/review/reviewEnd">
                <div class="review-container">
                    <div>
                            <textarea class="review-message">1</textarea>
                    </div>
                    <div class="review-photo" >
                        <ul class="ul-photo">
                            <li>
                                <div class="img-wrap">
                                    <img class="img-size" src="http://placehold.it/600x500">
                                    <div class="img-remove">
                                        삭제
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="img-wrap">
                                    <img class="img-size" src="http://placehold.it/600x500">
                                    <div class="img-remove">
                                        삭제
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="img-wrap">
                                    <img class="img-size" src="http://placehold.it/600x500">
                                    <div class="img-remove">
                                        삭제
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="img-wrap">
                                    <img class="img-size" src="http://placehold.it/600x500">
                                    <div class="img-remove">
                                        삭제
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="review-submit">
                    <div class="review-camara" style="cursor: pointer;">
                        <span class="review-img">
                            <i class="fas fa-camera"></i>
                            <div class="review-txt"> + 사진추가</div>
                        </span>
                    </div>
                    <div style="margin: 0 300px 0 213px;">
                        <div class="review-score">
                            <select name="star" id="star">
                                <option value="5">
                                    ★★★★★ 아주 좋아요
                                </option>
                                <option value="4">
                                    ★★★★ 맘에 들어요
                                </option>
                            </select>
                        </div>
                    </div>
                    <button class="review-btn" type="submit">
                        <i class="far fa-check-circle" style="color: white; font-size: 26px; padding-right: 10px;"></i>
                        <span style="color: white; font-size: 20px;">리뷰 등록하기</span>
                    </button>
                </div>
                </form>
                <div class="review-summary">
                    <div class="avg-score">
                        <div class="summary-score">
                            4.8
                        </div>
                        <div class="review-count">
                            3,911개 리뷰 평점
                        </div>
                    </div>
                    <ul class="avg-bar">
                        <li>
                            <div style="font-size: 12px;">
                                <div class="avg-title">
                                    5 stars
                                </div>
                                <div class="avg-status">
                                    (1,000)
                                </div>
                                <div class="star-guage">
                                    <div class="persent" style="width: 80%;"></div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div style="font-size: 12px;">
                                <div class="avg-title">
                                    4 stars
                                </div>
                                <div class="avg-status">
                                    (1,000)
                                </div>
                                <div class="star-guage">
                                    <div class="persent" style="width: 80%;"></div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div style="font-size: 12px;">
                                <div class="avg-title">
                                    3 stars
                                </div>
                                <div class="avg-status">
                                    (1,000)
                                </div>
                                <div class="star-guage">
                                    <div class="persent" style="width: 80%;"></div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div style="font-size: 12px;">
                                <div class="avg-title">
                                    2 stars
                                </div>
                                <div class="avg-status">
                                    (1,000)
                                </div>
                                <div class="star-guage">
                                    <div class="persent" style="width: 80%;"></div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div style="font-size: 12px;">
                                <div class="avg-title">
                                    1 stars
                                </div>
                                <div class="avg-status">
                                    (1,000)
                                </div>
                                <div class="star-guage">
                                    <div class="persent" style="width: 20%;"></div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="review-container2">
                    <span style="color: #333333; font-size: 16px;">
                        <strong style="font-weight: bold;">최신순</strong>
                        <span style="color: #333333;font-size: 16px;">
                            리뷰 (3,000)
                        </span>
                    </span>
                </div>
                <div class="review-container3">
                    <div class="info-container">
                        <ul>
                            <li>
                                <div class="info-title">
                                    작성자
                                </div>
                                <div class="info-value">
                                    결제자이름
                                </div>
                            </li>
                            <li>
                                <div class="info-title">
                                    작성일
                                </div>
                                <div class="info-value">
                                    2010.00.00
                                </div>
                            </li>
                        </ul>
                    </div>
                    <i class="fas fa-star" style="color: orange; font-size: 14px;"></i>
                    <i class="fas fa-star" style="color: lightgray; font-size: 14px;"></i>
                    <span style="margin-left: 9px; font-size: 14px; color: gray;">- 아주 좋아요</span>
                    <div class="review-content">
                        <p>내용</p>
                    </div>
                    <div>
                        <ul class="review-content-img">
                            <li>
                                <img class="img-size" src="http://placehold.it/600x500">
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="qna">
                <div class="tab">
                    <ul class="menu">
                        <li><a href="#detail">DETAIL</a></li>
                        <li><a href="#information">INFORMATION</a></li>
                        <li><a href="#review">REVIEW</a></li>
                        <li class="selected"><a href="#qna">Q&A</a></li>
                    </ul>
                </div>
                <div class="test review" style="line-height: 18px;">
                    <h3>Q&A</h3>
                    <p class="desc">상품에 대해 궁금한 점을 해결해 드립니다.</p>
                    <table class="table" style="margin-top: 10px;">
                        <colgroup>
                            <col style="width:70px;">
                            <col style="width:auto">
                            <col style="width:100px;">
                            <col style="width:100px;">
                            <col style="width:80px;">
                        </colgroup>
                        <thead>
                            <tr>
                              <th>번호</th>
                              <th>제목</th>
                              <th>작성자</th>
                              <th>작성일</th>
                              <th>조회</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>John</td>
                              <td>Doe</td>
                              <td>john@example.com</td>
                            </tr>
                            <tr>
                              <td>Mary</td>
                              <td>Moe</td>
                              <td>mary@example.com</td>
                            </tr>
                            <tr>
                              <td>July</td>
                              <td>Dooley</td>
                              <td>july@example.com</td>
                            </tr>
                          </tbody>
                    </table>
                    <p class="base-btn">
                        <a href="#" class="write-btn">글쓰기</a>
                    </p>
                </div>
            </div>
            <a href="#" class="gotop" style="text-align: center;">
                <i class="fas fa-chevron-up" style="display: block; color: white; padding-bottom: 7px;"></i>
                TOP
            </a>
        </div>
    </div>
</section>
    <script>
        $(function(){
    		$(window).scroll(function(){
                var height = $(document).scrollTop();
                if(height>=600){
                    $(".gotop").css({
                        display:"block",
                        opacity:1
                    })
                }else{
                    $(".gotop").css({
                        display:"none",
                        opacity:0,
                        transition:"opacity 1s"
                    })
                }
    		});
            $(".amount-area>input").focus(function(){
                $(".amount-area").css({
                    border:"2px solid #0058a3",
                    "border-radius":"4px"
                });
            })
            $(".amount-area>input").blur(function(){
                $(".amount-area").removeAttr("style");
            })
            if($(".amount-area>input").attr("value")==1){
                $(".fa-minus").css("opacity", "0.4");
            }
            $(".fa-plus").parent().click(function(){
                var cnt=$(".amount-area>input").attr("value");
                $(".amount-area>input").attr("value",parseInt(cnt)+1);
                if($(".amount-area>input").attr("value")>1){
                    $(".fa-minus").removeAttr("style");
                }
            })
            $(".fa-minus").parent().click(function(e){
                var cnt=$(".amount-area>input").attr("value");
                if(cnt==1){
                    e.preventDefault();
                    $(".fa-minus").css("opacity", "0.4");
                }else{
                    cnt--;
                    if(cnt==1){
                        e.preventDefault();
                        $(".fa-minus").css("opacity", "0.4");
                    }
                    $(".amount-area>input").attr("value",cnt);
                }
            });
        });
    </script>
</body>
</html>