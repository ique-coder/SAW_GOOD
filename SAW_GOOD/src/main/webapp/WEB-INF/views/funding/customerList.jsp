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
		td{
			width:100px;
			height:30px;
			
		}
	
	</style>
	
	
	<div class="container">
		<table >
			<thead>
				<tr>
					<td>제품번호</td>
					<td>참여날짜</td>
					<td>이름</td>
					<td>참여가격</td>
					<td>리워드</td>
					<td style="width:200px;">전화번호</td>
					
					<td>우편번호</td>
					<td style="width:200px;">주소</td>
					<td style="width:200px;">상세주소</td>
				</tr>
			
			</thead>
			<tbody>
				<c:forEach items ="${list }" var ="i">
					<tr>
						<td>${i.FDNO }</td>
						<td><fmt:formatDate type="date" dateStyle="medium" value="${i.PARTDATE}"/></td>
						<td>${i.USERNAME }</td>
						<td><fmt:formatNumber type="number" value="${i.PARTPRICE}"/></td>
						<td>${i.REWORD}</td>
						<td style="width:200px;">${i.PHONE}</td>
						
						<td>${i.POSTCODE}</td>
						<td style="width:200px;">${i.ADDRESS1 }</td>
						<td style="width:200px;">${i.ADDRESS2 }</td>
					</tr>
				</c:forEach>
			</tbody>
		
			
		
		</table>
	
	</div>


	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>