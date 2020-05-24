<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="" name=""/>
	</jsp:include>
<style>
section.container{
	height:500px;
	margin-top:200px;
}
.container>h2{
	font-size:28px;
	margin: 10px 0;
}
.info-container{
 	border: 3px solid  rgba(242,242,242,0.7);
    height: 194px;
    text-align:center;
}
.info-container p{
	margin: 30px 0;
}
.info-container input{
    position:relative;
    height:36px;
    border: none;
    left:23%;
    margin:0;
    background-color: rgb(242,242,242);
    font-size: 16px;
    color: rgb(142,142,142);
    outline: none;
    vertical-align: middle;
    font-weight: lighter;
    
}
.info-container button{
   position:relative;
    height: 36px;
    outline: none;
    border: none;
    background-color: black;
    color: white;
   left:23%;
    font-size: 16px;
    
}
.info-style{
	/* padding:0 25%; */
	text-align: center;
	position:relative;
}
</style>

	<section class="container">
        
        
        <h2>비밀번호 확인</h2>
        <div class="col-md-12 info-container">
            <p>회원님의 안전한 개인정보 보호를 위해 비밀번호를 다시 한번 확인합니다.</p>
            <form action="${path }/member/deleteAccount.do" >
            	<div class="row info-style">
                <input type="password" placeholder="비밀번호를 입력해주세요." class="col-md-5" name="password">
                <button class="col-md-2" type="submit">확인</button>
                </div>
            </form>
        </div>

    </section>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>