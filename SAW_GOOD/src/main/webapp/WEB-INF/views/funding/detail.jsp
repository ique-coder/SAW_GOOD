<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/funding/detail.css"/>
	
	<div class="container-fluid col-md-12" id="detail-header">
    	<div class="bg-image" style="background-image: url(${path}/resources/images/signup2.jpg);"></div>
        <i>
        	<c:out value="${f.category }"/>
        </i>
        <h1><c:out value="${f.subContent }"/></h1>
    </div>
    <section>
         <div class="container">
            <div class="col-md-12">
                <section class="row first-row">
                    <div class="col-md-7 img-container" style="height: 700px;">
                        <img src="${path }/resources/images/leftphoto.png" class="arrow" style="left: 20px;">
                        <img src="${path }/resources/images/${f.mainImg}" class="images"> 
                        <img src="${path }/resources/images/rightphoto.png" class="arrow" style="right: 20px;">
                    </div>
                    <div id="p-table" class="col-md-5" style="height: 700px;">
                        <caption>
                            <h5>
                            	<c:set value="<%=new java.util.Date() %>" var="now"/>
								<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today"/>
								<fmt:parseNumber value="${f.endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/>
											${endDate-today} 일 남음
								
                            </h5>
                        </caption>
                        <table>
                            <thead>
                                <tr>
                                    <th colspan="2">DESIGNER &nbsp;&nbsp;&nbsp; ${f.designer }</th>
                                </tr>
                            </thead>
                            <tbody id="main-info">
                                <tr>
                                    <td>목표금액</td>
                                    <td>
	                                    <p>
	                                    	<fmt:formatNumber value="${f.targetPrice }" type="number" />
	                                    </p><i>원</i>
	                                  </td>
                                </tr>
                               <tr>
                                   <td>참여인원</td>
                                    <td><p><c:out value="${map.COUNT }"/></p><i>명 참여</i></td>
                                </tr>
                                <tr>
                                    <td>후원된 금액</td> 
                                    <td><p><fmt:formatNumber value="${map.SUM }" type="number"/></p><i>원</i></td> 
                                </tr>
                                <tr>
                                    <td>참여율</td>
                                    <td><p>
                                    		<fmt:formatNumber value="${map.SUM/f.targetPrice *100}" />
                                    	</p><i>% 달성</i></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <svg width="100%" height="3px" xmlns="http://w3.org/2000/svg" version="1.1" class="bar-container">
                                            <rect x="0" y="0" width="${map.SUM/f.targetPrice *100}%" height="3px" class="bar"/>
                                        </svg>
                                    </td>
                                </tr>
                                
                            </tbody>
                            <tbody id="sub-info">
                                <tr>
                                    <td>0000원 이상</td> 
                                    <td><p>의자 1개</p><i></i></td> 
                                </tr>
                                <tr>
                                    <td>00000원 이상</td> 
                                    <td><p>의자+테이블</p><i></i></td> 
                                </tr>
                                <tr>
                                    <!-- <td>구매 수량</td> 
                                    <td>
                                        <button type="button">-</button>
                                        <input type="text" value="1">
                                        <button type="button">+</button>
                                    </td> -->
                                    <td></td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="2">
                                        <button id="buy-btn">프로젝트 밀어주기</button>
                                    </td>
                                   
                                </tr>
                            </tfoot>
                        </table>

                    </div>
                </section>
                <ul class="row">
                    <li class="col-md-4"><span class="underline" onclick="select(1);">프로젝트 소개</span></li>
                    <li class="col-md-4"><span onclick="select(2);">참여내역</span></li>
                    <li class="col-md-4"><span onclick="select(3);">후기</span></li>
                </ul>
                <section>
                    
                    <div class="detail-select" id="project">
                        <p>
							${f.detail }
                            
                        </p>
                    </div>
                    <div class="detail-select" id="purchase">
                        <p class="tx_total">총 <strong class="num">280</strong>개의 참여내역과 응원메시지가 있습니다.</p>
                            <ul class="lst_sponser">
                                <li>
                                    <span class="img_thm">
                                        <img src="" width="50" height="50" alt="wwiiw_img">
                                    </span>
                                    <div class="sponser_info">
                                        <p>
                                            <span class="wordBreak">이 프로젝트의 성공을 응원합니다.</span>
                                        </p>
                                        <span class="date">2020.05.10 20:31</span>
                                    <div>                    
                                        <span class="nick"><a style="text-decoration:none">wwiiw님</a></span>
                                        <span class="price"><strong class="num">45,000</strong>원 참여</span>
                                    </div>
                                </li>
                            </ul>
                    </div>
                    <div class="detail-select" id="review">
                        <ul class="lst_sponser">
                            <li>
                                <span class="img_thm">
                                    <img src="" width="50" height="50" alt="wwiiw_img">
                                </span>
                                <div class="sponser_info">
                                    <p>
                                        <span class="wordBreak">상품 후기</span>
                                    </p>
                                    <span class="date">2020.05.10 20:31</span>
                                <div>                    
                                    <span class="nick"><a style="text-decoration:none">wwiiw님</a></span>
                                    <span class="price"><strong class="num">****</strong>별점</span>
                                </div>
                            </li>
                        </ul>
                    </div>

                </section>
            </div>
            
            
        
            
        </div>

    </section> 
    <script>
        function select(menu){

            var project = $("#project");
            var purchase = $("#purchase");
            var review = $("#review");
            $(event.target).parent().siblings("li").children("span").removeClass("underline");
            $(event.target).addClass("underline");
            project.css("display","none");
            purchase.css("display","none");
            review.css("display","none");
            switch(menu){
                case 1: project.css("display","block");
                        break;
                case 2: purchase.css("display","block");
                        break;
                case 3: review.css("display","block");
                        break;
            }
        }

    
    </script>
		
		

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>