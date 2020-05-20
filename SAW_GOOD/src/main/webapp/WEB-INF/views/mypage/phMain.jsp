
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="" name="pageTitle" />
</jsp:include>


<style>

/* 리스트 */
.container {
margin-top: 20px;
}

.col-md-2 {
padding: 0;
padding-right: 5px;
}

.col-md-10 {
padding: 0;
padding-left: 5px;
}

#info {
text-align: center;
background-color: #51735D;
padding: 20px;
height: auto;
}

#info p {
color: white;
text-align: center;
margin-bottom: 7px;
}

#list {
border: solid 1px lightgrey;
margin-bottom: 20px;
}

#profileImg {
width: 80px;
border-radius: 100px;
margin-bottom: 10px;
border: solid white 2px;
}

#infoSub1 {
margin-bottom: 20px;
}

#infoSub1>p {
margin-bottom: 20px;
color: rgba(255, 255, 255, 0.7);
}

#infoSub2 {
margin-bottom: 20px;
}

#infoSub2>p:last-child {
font-size: 20px;
}

#infoSub1 {
margin-bottom: 20px;
}

.btn {
border: solid 1px white;
width: 100%;
background-color: #51735D;
color: white;
border-radius: 0;
}

#infoBottom {
background-color: lightgray;
height: auto;
}

.product {
margin: 20px 20px 0 20px;
padding-bottom: 20px;
border-bottom: solid 1px lightgrey;
}

.product:last-child {
margin: 20px 20px 0 20px;
padding-bottom: 20px;
border-bottom: 0;
}

.productImg>img {
width: 100%;
}

.inline {
display: inline-block;
/* border: solid 1px black; */
}

.center {
text-align: center;
}

.sendDate {
color: gray;
}

.pSpace p {
margin-bottom: 8px;
}

.spanSpace span {
margin-right: 15px;
}

.brand {
color: #51735D;
font-weight: 600;
font-size: 16px;
}

.productPrice {
font-size: 14px;
}

.productName {
font-size: 16px;
}

.sendCheck {
padding-bottom: 15px;
border-bottom: 1px solid lightgrey;
}

.titleInfo {
padding-bottom: 10px;
}

.priceDate {
padding-bottom: 10px;
}

.sendStep {
/* font-size: 12px; */

}

/* 배송상태 */
.sendStep1 {
color: rgba(0, 0, 0, 0.7);
border-bottom: solid 1px rgba(0, 0, 0, 0.5);
}

.sendStep2 {
color: rgba(0, 0, 0, 0.7);
border-bottom: solid 1px rgba(0, 0, 0, 0.5);
}

.sendStep3 {
color: rgba(81, 115, 93);
border-bottom: solid 1px rgba(81, 115, 93);
}

.sendStep4 {
color: rgba(81, 115, 93);
border-bottom: solid 1px rgba(81, 115, 93);
font-weight: 400;
}

.sendStep5 {
color: #A69B8D;
border-bottom: solid 1px #A69B8D;
}

.sendStepX {
color: rgba(255, 0, 0, 0.5);
border-bottom: solid 1px rgba(255, 0, 0, 0.5);
}

/* 버튼 상태 */
.statusBtn1 {
/* padding: 38px 0; */

}

.statusBtn2 {
padding: 38px 0;
}

.statusBtnX {
padding: 50px 0;
}

.confirmStatus span {
margin-bottom: 3px;
display: inline-block;
color: rgb(83, 83, 83);
font-size: 12px;
}

.confirmStatus span:last-child {
margin-bottom: 0;
}

.productBtn {
padding: 7px 0;
background-color: #F2E8DC;
margin: 3px 0;
/* color: white; */
border: solid 1px #A69B8D;
width: 100%;
border-radius: 0;
}

/* 이거 백그라운드에 써줘 */
#infoSubBack {
background-color: lightgray;
border: solid 1px black;
}

#infoCount {
padding: 20px 0;
background-color: rgba(81, 115, 93, 0.8);
}

#infoCount p:first-child {
font-size: 13px;
color: rgba(255, 255, 255, 0.8);
}

#infoCount p {
color: white;
margin-bottom: 5px;
}

#infoCount p span {
color: white;
font-size: 16px;
}

#useList {
border: solid 1px lightgray;
display: inline-block;
background-color: #F2E8DC;
padding: 10px;
}

#useList input[type="month"] {
height: 25px;
width: 150px;
}

#useList input[type="submit"] {
/* width: 100px; */

}

#useList input {
padding: 5px;
border: none;
background-color: white;
border: 1px solid lightgray;
}

#monthListBtn {
background-color: white;
border: 1px solid lightgray;
}

#monthListBtn span {
display: inline-block;
padding: 5px 10px;
border-right: solid 1px lightgray;
cursor: pointer;
/* background-color: #51735D; */
}

#monthListBtn span:last-child {
border: 0;
}

.list {
padding: 0;
}

#list2 input {
width: 140px;
}

#list3 select {
height: 25px;
}

#monthSearch div {
display: inline-block;
margin-right: 20px;
}

#monthSearch div:last-child {
margin-right: 0;
}

.checkStatusclass {
border: solid 1px black;
display: inline-block;
width: 300px;
}

#userCategory {
padding: 20px;
background-color: lightgray;
}

#userCategory p {
padding-bottom: 10px;
font-size: 14px;
cursor: pointer;
}

#userCategory p:last-child {
padding-bottom: 0;
}

/* 공통 리스트 소스 */
.listDiv {
	border: solid 1px black;
	padding: 20px;
	/* height: 300px; */
}
.divTitle {
	padding-bottom: 10px;
	border-bottom: 1px solid lightgray;
	margin-bottom: 20px;
}
.morePage {
	position: relative;
	float: right;
}
.imgSample {
	position: relative;
	float: left;
	margin: 0 20px 0 0;
}
</style>

	<div class="container">
	<div class="row">
		<div class="col-md-2">
			<div id="info">
				<div id="infoSub1">
					<img id="profileImg"
						src="../image/KakaoTalk_20200423_153013027.jpg" alt="">
					<p>desing_ique 님</p>
				</div>
				<div id="infoSub2">
					<p>쏘:굿 페이 포인트</p>
					<P>123,456원</P>
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
				<p>결재내역</p>
			</div>
		</div>


		<div class="col-md-10 ilnine">
			<div id="newProductList" class="col-md-12 inline listDiv">
				<p class="divTitle">
					<span>New Product</span>
					<span id="newAmount" class="amount">(0건)</span>
					<sapn class="morePage">더보기</sapn>
				</p>
				<!-- foreach 들어갈 부분 -->
				<div class="newProduct col-md-12">
					<img class="imgSample" src="${path}/resources/images/default-150x150.png" width="70px" alt="">
					<p>
						<span class="title">이름</span>
						<span class="date">날짜</span>
					</p>
					<p>
						<span class="content">내용내용내용내용내용</span>
					</p>
				</div>

				<!-- <table class="newProduct col-md-12" border="1px">
					<tr class="row">
						<td rowspan="2" class="col"></td>
						<td class="title col">이름</td>
						<td class="date col">날짜</td>
					</tr>
					<tr class="row">
						<td class="col"></td>
						<td class="content col">내용</td>
					</tr>
				</table> -->
			</div>

		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />