<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/product/productList.css"/>
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
                        <li><a href="#">bed</a></li>
                        <li><a href="#">sofa / chair</a></li>
                        <li><a href="#">light</a></li>
                        <li><a href="#">table / desk</a></li>
                        <li><a href="#">carpet / lug</a></li>
                        <li><a href="#">storage</a></li>
                        <li><a href="#">others</a></li>
                    </ul>
                    <!-- <!— 검색기능 —> -->
                    <span class="block-span">
                        <input type="text" id="search-text" name="searchText"/>
                        <button class="search-btn" id="search-btn">
                            <img src="${path }/resources/images/search-icon.png" width="20px" height="18px"/>
                        </button>
                    </span>
                </div>
                <div class="col-md-10">
                    <div class="row">
                    	<c:forEach items="${list }" var="p" varStatus="vs">
	                        <div class="col-auto">
	                            <div class="auctionProduct">
	                                <div class="productPoto">
	                                	<a href="${path }/product/productView?no=${p['PRODUCTNO']}">
	                                    	<img src="http://placehold.it/270x220" style="width:100%; height: 220px;">
	                                    </a>
	                                </div>
	                                <div class="proTitle">
	                                    <p style="width:270px; height:50px;">
	                                    	<a href="${path }/product/productView?no=${p['PRODUCTNO']}">${p['PRODUCTNAME'] }</a>
	                                    </p>
	                                </div>
	                                <div class="boderbottom-Red">
	                                    <p class="pCategory" >${p['CATEGORY'] }</p>
	                                </div>
	                                <div class="finalPriceSmall">
	                                    <span class="nowPriceSmall">현재금액 : </span>
	                                    <fmt:formatNumber value="${p['PRODUCTPRICE'] }" pattern="0,000"/>원        
	                                    <span class="rightSmall">
	                                        <img src="${path }/resources/images/quick.PNG">
	                                    </span>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                    </div>
                    <div id="pagebar">
                    	${pageBar }
                    </div>
                </div>
            </div>           
        </div>
    </section>	
    <script>
    $(function(){    	
    	$("#search-text").keypress(function(e){
    		if(e.originalEvent.key=='Enter'){
				if($("#search-text").val().trim()==""){
					alert("검색어를 입력해주세요");
					return false;
				}
				location.href="${path}/product/searchProduct?keyword="+$('#search-text').val();
    		}
    	})
    	$("#search-btn").click(function(){
    		if($("#search-text").val().trim()==""){
				alert("검색어를 입력해주세요");
				return false;
			}
    		location.href="${path}/product/searchProduct?keyword="+$('#search-text').val();
    	})
    })
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>