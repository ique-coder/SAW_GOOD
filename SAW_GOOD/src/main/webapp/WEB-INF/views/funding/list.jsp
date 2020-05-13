<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${path }/resources/css/funding/list.css" />

<!-- 오늘 날짜 세팅 -->
<c:set value="<%=new java.util.Date() %>" var="now"/>
<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today"></fmt:parseNumber>

<section id="section">
	<div class="parallax-window" data-parallax="scroll"
		data-image-src="${path }/resources/images/sample1.jpg">
		<h3>CREATE YOUR ROOM</h3>
	</div>
	<div id="search-area" class="container">
		<form action="" method="post">
			<select id="category" name="category" class="selectStyle">
				<option value="0">category</option>
				<option value="1">bed</option>
				<option value="2">couch / chair</option>
				<option value="3">table / desk</option>
				<option value="4">carpet / lug</option>
				<option value="5">storage</option>
				<option value="6">others</option>
			</select> 
			<select id="terms" name="terms" class="selectStyle">
				<option value="0">기간</option>
				<option value="1">진행중인 프로젝트</option>
				<option value="2">성사된 프로젝트</option>
			</select> 
			<select id="goals" name="goals" class="selectStyle">
				<option value="0">목표율</option>
				<option value="1">75% 이하</option>
				<option value="2">75%~100%</option>
				<option value="3">100% 이상</option>
			</select>
			<select id="parti" name="parti" class="selectStyle">
				<option value="0">참여자순</option>
				<option value="1">높은 참여</option>
				<option value="2">낮은 참여</option>
			</select>
			<select id="price" name="price" class="selectStyle">
				<option value="0">참여 가격순</option>
				<option value="1">높은 금액</option>
				<option value="2">낮은 금액</option>
			</select>
			<button type="submit">검색하기</button>
		</form>
	</div>
	<div class="container padding">
		<div class="row">
			<div class="col-md-2">
				<!-- 서브네비게이션 바 -->
				<ul class="category">
					<li><a href="#">bed</a></li>
					<li><a href="#">couch / chair</a></li>
					<li><a href="#">light</a></li>
					<li><a href="#">table / desk</a></li>
					<li><a href="#">carpet / lug</a></li>
					<li><a href="#">storage</a></li>
					<li><a href="#">others</a></li>
				</ul>
				<!-- 검색기능 -->
				<span class="block-span"> <input type="text" />
					<button>
						<img src="${path }/resources/images/search-icon.png" width="20px"
							height="18px" />
					</button>
				</span>
			</div>

			<div class="col-md-10">
				<div class="row">
					<div class="col-md-6" id="main-container">
						<div id="main" class="main product-container">
							<a href="${path }/funding/detail?fdNo=${list[0].fdNo}">
							 <img src="${path }/resources/images/${list[0].mainImg}" class="images" />
								<h1 class="text-deco text-position">
									<c:out value="${list[0].title}" />
								</h1>
								<p class="sub">
									<c:out value="${list[0].designer}" />
								</p>
								<h5 class="text-position">
									<c:out value="${list[0].subContent }"/>
								</h5> 
								<svg width="80%" height="3px" xmlns="http://w3.org/2000/svg" version="1.1" class="bar-container">
                                     <rect x="0" y="0" width="50%" height="3px" class="bar" />
                                </svg>
								<div style="margin: 0 10%; height: 20px;">
									<i><img></i> 
									<span>
										<b>
											<fmt:parseNumber value="${list[0].endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
											${endDate-today}

										</b>일 남음
									</span> 
									<span><b>1,203,400</b>원</span>
									<span><b>200</b>%</span>
								</div>
							</a>
						</div>
					</div>
					
					<!-- 펀딩 서브 제품-->
					<div class="col-md-3 sub-container">
						<c:forEach items="${list }" var ="item" begin="1" step="2" varStatus="status">
							<div class="sub-item">
								<a href="${path }/funding/detail?fdNo=${item.fdNo}"> 
								<img src="${path }/resources/images/${item.mainImg}" class="images" />
									<table>
										<thead>
											<th colspan="2">
												<h1 class="text-deco text-position">
													<c:out value="${item.title }"/>
												</h1>
											</th>
											
										</thead>
										<tr>
											<th>${item.designer}</th>
											<td>
												<fmt:parseNumber value="${item.endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
												${endDate-today}
												일 남음
											
											</td>
										</tr>
										<tbody>
											<th colspan="2"><svg width="100%" height="3px"
													xmlns="http://w3.org/2000/svg" version="1.1"
													class="bar-container">
				                                        <rect x="0" y="0" width="50%"
														height="3px" class="bar" />
				                                    </svg></th>
										</tbody>
										<tfoot>
											<th>1,203,400원</th>
											<td>200%</td>
										</tfoot>
									</table>
								</a>
							</div>
						</c:forEach>
					</div>
					
					<!-- 메인 옆 서브 -->
					<div class="col-md-3 sub-container">
						<c:forEach items="${list }" var ="item" begin="2" step="2">
							<div class="sub-item">
								<a href="${path }/funding/detail?fdNo=${item.fdNo}">
								 <img src="${path }/resources/images/${item.mainImg}" class="images" />
									<table>
										<thead>
											<th colspan="2">
												<h1 class="text-deco text-position">
													<c:out value="${item.title }"/>
												</h1>
											</th>
											
										</thead>
										<tr>
											<th>${item.designer}</th>
											<td>
												<fmt:parseNumber value="${item.endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
												${endDate-today}
												일 남음
											
											</td>
										</tr>
										<tbody>
											<th colspan="2"><svg width="100%" height="3px"
													xmlns="http://w3.org/2000/svg" version="1.1"
													class="bar-container">
				                                        <rect x="0" y="0" width="50%"
														height="3px" class="bar" />
				                                    </svg></th>
										</tbody>
										<tfoot>
											<th>1,203,400원</th>
											<td>200%</td>
										</tfoot>
									</table>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="container-fluid" id="category-nav"> 
        <div class="row" >
            <img src="${path }/resources/images/funding/sofa.jpg" class ="col-md-6"/>
            <div class="col-md-6 text-container">
            	<p>
            		ISSUE THIRTY-FIVE
            	</p>
                <a href="#">
                	Change Issue
                </a>
                <h2>
                	Small steps, big dreams: Learn to leap into your own unknown
                </h2>
                <button type="button">SHOP NOW</button>
            </div>
        </div>

</section>
<section class="container">
	<c:forEach items="${list }" varStatus="status" step="4">
	
		<div class="row">
			<!-- 열 -->
			<c:forEach items="${list }" var="item" begin="${status.index }" end="${status.index+3}">
				<div class="col-md-3">
				 	<div class="sub-item">
								<a href="${path }/funding/detail?fdNo=${item.fdNo}"> 
								<img src="${path }/resources/images/${item.mainImg}" class="images" />
									<table>
										<thead>
											<th colspan="2">
												<h1 class="text-deco text-position">
													<c:out value="${item.title }"/>
												</h1>
											</th>
											
										</thead>
										<tr>
											<th>${item.designer}</th>
											<td>
												<fmt:parseNumber value="${item.endDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
												${endDate-today}
												일 남음
											
											</td>
										</tr>
										<tbody>
											<th colspan="2"><svg width="100%" height="3px"
													xmlns="http://w3.org/2000/svg" version="1.1"
													class="bar-container">
				                                        <rect x="0" y="0" width="50%"
														height="3px" class="bar" />
				                                    </svg></th>
										</tbody>
										<tfoot>
											<th>1,203,400원</th>
											<td>200%</td>
										</tfoot>
									</table>
								</a>
							</div>
				</div>
			</c:forEach>
		</div>
	</c:forEach>
</section>




<script src="${path }/resources/js/funding/list.js"></script>
<script>
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />