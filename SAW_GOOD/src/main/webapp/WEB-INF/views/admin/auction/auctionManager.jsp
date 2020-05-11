<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/admin/common/headerAndfooter.jsp" />
<div id="content" class="p-4 p-md-5 pt-5">
<div class="container-fluid aucPro" style="margin-bottom: 30px;">
		<div class="row">
			<div class="col-md-6"></div>
			<div class="col-md-6" style="text-align: right">
				<table id="search">
					<colgroup>
						<col width="30%">
						<col width="auto">
					</colgroup>
					<tr>
						<td><i class="fas fa-search"></i> <select name="search_Type"
							style="padding: 3px; margin-left: 10px" id="search_Type">
								<option value="id">아이디</option>
								<option value="name">이름</option>
								<option value="email">이메일</option>
								<option value="phone">전화번호</option>
								<option value="addr">주소</option>
						</select></td>
						<td style="text-align:left;padding-left:10px">
							<div id="search_id">
								<form action="${path }/admin/searchMember" method="get">
									<input type="hidden" name="numPerPage" value="${numPerPage }" />
									<input type="hidden" name="searchType" value="userid">
									<input type="text" name="keyword" placeholder="아이디를 입력해주세요"
										style="width: 80%">
									<button type="submit" class="btn-black">검색</button>
								</form>
							</div>
							<div id="search_name">
								<form action="${path }/admin/searchMember" method="post">
									<input type="hidden" name="numPerPage" value="${numPerPage }" />
									<input type="hidden" name="searchType" value="username">
									<input type="text" name="keyword" placeholder="이름을 입력해주세요"
										style="width: 80%">
									<button type="submit" class="btn-black">검색</button>
								</form>
							</div>
							<div id="search_email">
								<form action="${path }/admin/searchMember" method="post">
									<input type="hidden" name="numPerPage" value="${numPerPage }" />
									<input type="hidden" name="searchType" value="email"> <input
										type="text" name="keyword" placeholder="이메일을 입력해주세요"
										style="width: 80%">
									<button type="submit" class="btn-black">검색</button>
								</form>
							</div>
							<div id="search_phone">
								<form action="${path }/admin/searchMember" method="post">
									<input type="hidden" name="numPerPage" value="${numPerPage }" />
									<input type="hidden" name="searchType" value="phone"> <input
										type="text" name="keyword" placeholder="전화번호를 입력해주세요"
										style="width: 80%">
									<button type="submit" class="btn-black">검색</button>
								</form>
							</div>
							<div id="search_addr">
								<form action="#" method="post">
									<input type="hidden" name="numPerPage"
										value="${param.numPerPage }" /> <input type="hidden"
										name="searchType" value="address1"> <input type="text"
										name="keyword" placeholder="주소를 입력해주세요" style="width: 80%">
									<button type="submit" class="btn-black">검색</button>
								</form>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="container-fluid aucPro">
		<div style="text-align: right; padding-right: 20px;">
			<form
				action='${path }/admin/${searchType!=null?"searchMember":"memberManager"}'
				method="post" id="frmNum">
				<input type="hidden" name="cPage" value="${cPage }" /> <input
					type="hidden" name="searchType" value="${searchType }" /> <input
					type="hidden" name="keyword" value="${keyword }" /> <select
					name="numPerPage" style="font-size: 16px;" id="numPer">
					<option value="10" ${numPerPage!=10?"":"selected" }>10개씩보기</option>
					<option value="20" ${numPerPage!=20?"":"selected" }>20개씩보기</option>
					<option value="30" ${numPerPage!=30?"":"selected" }>30개씩보기</option>
				</select>
			</form>
		</div>
		<div class="col-md-12" style="height: auto;">
			<form action="#" method="post" onsubmit="">
				<div class="row">
					<div class="col-md-6" style="padding-bottom: 10px;">
						<button class="btn-black" type="button">삭제</button>
					</div>
				</div>
				<table class="fundingAg checking">
					<colgroup>
						<col width="5%">
						<col width="5%">
						<col width="45%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="15%">
					</colgroup>

					<tr>
						<th scope="col"><input type="checkbox" name="procheck"
							id="allauc"><label for="allauc"></label></th>
						<th scope="col">번호</th>
						<th scope="col">상품정보</th>
						<th scope="col">가구종류</th>
						<th scope="col">브랜드</th>
						<th scope="col">평점</th>
						<th scope="col">관리</th>
					</tr>
					<tr>
						<td><input type="checkbox" name="procheck" id="aucpro1"><label
							for="aucpro1"></label></td>
						<td>1</td>
						<td><img class="img-responsive"
							src="${path }/resources/images/chair.jpg" /></td>
						<td></td>
						<td></td>
						<td></td>
						<td>
							<button class="btn-black" type="button">삭제</button>
							<button class="btn-black" type="button">수정</button>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="procheck" id="aucpro2"><label
							for="aucpro2"></label></td>
						<td>2</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>
							<button class="btn-black" type="button">삭제</button>
							<button class="btn-black" type="button">수정</button>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="procheck" id="aucpro3"><label
							for="aucpro3"></label></td>
						<td>3</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>
							<button class="btn-black" type="button">삭제</button>
							<button class="btn-black" type="button">수정</button>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="procheck" id="aucpro4"><label
							for="aucpro4"></label></td>
						<td>4</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>
							<button class="btn-black" type="button">삭제</button>
							<button class="btn-black" type="button">수정</button>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="procheck" id="aucpro5"><label
							for="aucpro5"></label></td>
						<td>5</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>
							<button class="btn-black" type="button">삭제</button>
							<button class="btn-black" type="button">수정</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
          
</div>
</body>

</html>