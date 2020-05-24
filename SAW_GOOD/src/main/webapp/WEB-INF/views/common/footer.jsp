<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="${path }/resources/css/common/footer.css"/>
<footer>
    <div class="container-fluid footerStyle" style="text-align: center;">
        <div class="foot-01">
            <div class="foot-wrap">
                <h2 class="logo">
                    <a href="#"></a>
                </h2>
                <div class="ft-info">
                    <strong style="color: coral; font-weight: bold;">CS Center  </strong><br>
                    02-928-6300<br>
                    평일 Monday - Friday 11am - 4pm <br>
                    점심시간 Lunch 12pm - 1pm <br>
                    주말&amp;휴일 휴무일로 문의 게시판을 이용해주세요<br>
                    <strong class="second">Banking account</strong>
                    
                    · 국민은행 036137-04-003048<br>
                    · 신한은행 100-031-162484<br>
                    &nbsp;&nbsp;예금주 : (주) 쏘:굿<br>
                </div>
                <div class="ft-office">
                    <strong style="color: coral; font-weight: bold;">Head Office</strong><br>
                    본사 :  서울특별시 성동구 성수이로 144 EM타워 6층<br>
                
                    Tel 02-928-6300,&nbsp;&nbsp;Fax 02-921-3806<br>
                    E-mail : leejy@maatila.co.kr(제휴/광고문의)<br>               
                    <strong class="second">Delivery address</strong><br>
                    · 빠른배송상품 반품주소지  : 대구시 달서구 갈산동 100-48<br>
                    
                    · 맞춤제작상품 반품주소지  : 서울특별시 성동구 성수이로 144 EM타워 6층 [물류센터]<br>
                    &nbsp;&nbsp;반품접수는 CJ택배를 이용해주세요<br>
                </div>
                <div class="ft-cs">
                    <strong style="color: coral; font-weight: bold;">Customer service</strong><br>
                    <li><a href="${path }/furniture/furniture.do?userId=${loginMember.userId!=null?loginMember.userId:''}">SHOW ROOM</a></li>
                    <li><a href="${path }/product/productList">NEW ARRIVAL</a></li>
                    <li><a href="${path }/funding/list">FUNDING</a></li>
                    <li><a href="${path }/auction/list">AUCTION</a></li>
                    
               <strong style="color: coral; font-weight: bold;">Company info. </strong><br>  
                (주) 쏘:굿<br>
                사업자 등록번호 266-88-00272<br>
                대표자명 : 장성준  개인정보 관리 책임자 : 이승원<br>
                통신판매업 신고번호 제 2019 - 서울성동 - 01471호 
                <br><br>
                
                <strong style="color: coral; font-weight: bold;">개인정보처리방침</strong>
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>