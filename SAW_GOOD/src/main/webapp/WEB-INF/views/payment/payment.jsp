<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet"
	href="${path }/resources/css/payment/paymentPage.css" />

<!-- iamport.payment.js 결제 js-->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 다음 주소 api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<section>
	<!-- 전체 컨테이너 div -->
	<div class="container" style="padding: 0;">
		<!-- <div class="container" style="padding: 0; border-top:0; ">    -->
		<div id="subtitle">
			<h1>ORDER PAYMENT</h1>
		</div>
		<div class="shoppingbag">
			<ul class="step">
				<li>쇼핑백</li>
				<li class="active">주문결제</li>
				<li>주문완료</li>
			</ul>
			<div class="row">
				<div class="col-md-9">
					<div style="padding: 0 0 0 30px">
						<p
							style="font-size: 16px; font-weight: bold; margin-bottom: 30px;">구매상품</p>
						<table class="productList checking">
							<colgroup>

								<col width="30%" />
								<col width="10%" />
								<col width="auto" />
								<col width="10%" />
								<col width="15%" />
							</colgroup>

							<tr>

								<th>이미지</th>
								<th>브랜드</th>
								<th>상품정보</th>
								<th>수량</th>
								<th>가격</th>

							</tr>
							<tr>
								<td><img class="img-responsive imgheight"
									src="http://placehold.it/600x500" width="100%" /></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>


						</table>
					</div>

					<div class="bottomInform" style="display: block;">
						<!-- 주문자 -->
						<table>
							<colgroup>
								<!-- 주문자정보 테이블 헤더/바디 크기 -->
								<col style="width: 148px;">
								<col style="width: 576px;">
							</colgroup>
							<thead>
								<tr>
									<!-- 주문자 타이틀문구 -->
									<th colspan="2">주문자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<!-- 이름 헤더 -->
									<th style="padding-top: 10px;">주문자 이름<span>*</span></th>
									<!-- 이름 바디 입력창 -->
									<td class="input-box-medium">
										<div style="padding-top: 9px;">
											<input class="pilsu" name="userName" id="userName"
												placeholder="이름을 입력해주세요.">
										</div>
									</td>
								</tr>
								<tr>
									<!-- 연락처 헤더 -->
									<th>주문자 연락처<span>*</span></th>
									<td>
										<!-- 연락처 바디 입력창 -->
										<ul class="phone-numbers">
											<!-- 연락처 첫번째 칸 -->
											<li>
												<div class="input-box-medium">
													<input class="pilsu" name="userPhone" id="userPhone"
														maxlength="12" placeholder="전화번호 입력 '-'생략">
												</div>
											</li>
										</ul>
									</td>
								</tr>

								<tr>
									<!-- 이메일 헤더 -->
									<th>주문자 이메일<span>*</span></th>
									<!-- 이메일 입력창 -->
									<td>
										<div class="input-box-large">
											<input type="email" class="pilsu" name="userEmail"
												id="userEmail" placeholder="이메일 입력">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- 배송지정보 테이블 마진 40px-->
						<table style="margin-top: 40px;">
							<colgroup>
								<!-- 배송자정보 테이블 헤더/바디 크기 -->
								<col style="width: 148px;">
								<col style="width: 576px;">
							</colgroup>
							<thead>
								<tr>
									<!-- 배송자정보 타이틀문구 -->
									<th>배송지 정보</th>
									<!-- 주문자 정보와 동일버튼 오른쪽 정렬 -->
									<td style="float: right;">
										<button type="button" class="btn-white" id="cb1"
											onclick="Copy();">주문자 정보와 동일</button>
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<!-- 받으시는분 헤더 -->
									<th style="padding-top: 10px;">받으시는 분<span>*</span></th>
									<!-- 받으시는 분 바디 입력창 -->
									<td class="input-box-medium">
										<div style="padding-top: 9px;">
											<input class="pilsu" name="userName2" id="userName2"
												placeholder="이름을 입력해주세요.">
										</div>
									</td>
								</tr>
								<tr>
									<!-- 연락처 헤더 -->
									<th>연락처<span>*</span></th>
									<td>
										<!-- 연락처 바디 입력창 -->
										<ul class="phone-numbers">
											<!-- 연락처 첫번째 칸 -->
											<li>
												<div class="input-box-medium">
													<input class="pilsu" name="userPhone2" id="userPhone2"
														maxlength="12" placeholder="전화번호 입력 '-'생략">
												</div>
											</li>

										</ul>
									</td>
								</tr>
								<tr>
									<!-- 주소 헤더 -->
									<th>주소<span>*</span></th>
									<!-- 주소 바디 -->
									<td class="addr">
										<div class="input-box-medium">
											<!-- 우편번호 입력란 (입력되면 안됨) -->

											<input class="pilsu" name="userPost" id="postcode"
												placeholder="우편번호" value />
											<!--readonly-->

										</div> <!-- 우편번호 버튼 -->
										<button type="button" class="btn-white" id="postFind"
											onclick="Postcode()"
											style="margin-left: 5px; vertical-align: top;">우편번호
											조회</button> <!-- 주소 1 -->
										<div class="addrBox">
											<div>
												<input class="pilsu" name="userAddr" id="address"
													placeholder="기본 주소를 검색해주세요.(우편번호 조회)" />
												<!--readonly-->
											</div>
										</div> <!-- 주소 상세입력(동,호수) -->
										<div class="addrBox">
											<div>
												<input class="pilsu" name="detailAddress" id="detailAddress"
													placeholder="상세주소를 입력해주세요.">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<!-- 배송방법 헤더 -->
									<th>배송방법<span>*</span></th>
									<!-- 배송방법 바디 -->
									<td class="method">
										<div class="radio">
											<!-- 택배 라디오 버튼 -->
											<input type="radio" name="delivery" value="011005" checked>
											<!-- 택배 라벨 -->
											<label for="delivery">택배</label>
										</div>
									</td>
								</tr>
								<tr>
									<!-- 배송메세지 헤더 -->
									<th>배송 메세지<span>*</span></th>
									<td>
										<!-- 배송 메세지 바디 패딩 인라인으로 0넣음 -->
										<div class="addrBox" style="padding: 0;">
											<!-- 배송메세지 입력창 -->
											<div>
												<input name="userAddr" class=""
													placeholder="배송메세지를 입력해 주세요.">
											</div>
										</div>
									</td>
								</tr>
									<tr>
									<!-- 결제방법 -->
									<th>결제방법<span>*</span></th>
									<td>
										<!-- 결제방법 div -->
										<select id="payChoice" name="payChoice" class="categoryStyle">
											<option value="card">신용카드</option>
											<option value="phone">휴대폰 결제</option>
											<option value="trans">실시간 계좌이체</option>
											<option value="vrbank">가상계좌</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- 다음버튼 -->
						<span
							style="display: inline-block; width: 100%; margin: 50px 0 0px;">
						</span>
					</div>

				</div>
				<div class="col-md-3 payment">
					<div class="bx_total">
						<h3>결제금액</h3>
						<ul>
							<li><strong>총 상품 금액</strong>
								<p>
									<em id="counterTotal">152,000</em>원
								</p></li>
							<li><strong>배송비</strong>
								<p>
									<span>+</span><em id="counterTotdeliveryamt">0</em>원
								</p></li>
							<li class="total"><strong>총 결제금액</strong>
								<p>
									<em id="counterTotalAmt">152,000</em>원
								</p></li>
							<li class="point"><strong>포인트 적립</strong>
								<p>
									<em id="counterTotalcybermoney">1,520</em>p
								</p></li>
						</ul>
						<!-- 약관동의-->
						<div class="agree">
							<!-- 약관동의 span 스타일설정,내용 및 약관보기 클릭 -->
							<span class="agree-content"> 주문할 상품의 상품명,상품가격, 배송정보를
								확인하였으며,<br> 구매에 동의하시겠습니까?
								<button type="button">
									<p style="text-decoration: underline;"
										onclick="openPayPolicy()">약관보기</p>
								</button> <br> <!-- 동의합니다 체크박스 클릭 -->
								<div id="poliyce-ckbox">
									<label style="vertical-align: middle;"> <input
										type="checkbox" name="agreeWon" id="agreeWon"
										style="width: 15px; height: 15px; vertical-align: middle;">
										동의합니다.
									</label>
								</div>
							</span>
							<button type="button" name="button" onclick="paymentBt()"
								id="paymentBt" class="btn_order">결제하기</button>
						</div>
					</div>

				</div>

			</div>

		</div>
	</div>
</section>
<script>
	var inputPilsu = $('input.pilsu');//요거 유효성검사 상태정보 input 변수
	var emailRule = /(?=^\w+@[a-zA-Z]+[.][a-zA-Z.]+$).{5,}/i;//이메일 유효성
	var agreeWon = $('input#agreeWon');//요거 유혀성검사 약관동의하기 input 변수
	var pyFlag = false;
	inputPilsu.blur(function() {
		if ($(inputPilsu[0]).val() == "" || $(inputPilsu[1]).val() == ""
				|| $(inputPilsu[2]).val() == "" || $(inputPilsu[3]).val() == ""
				|| $(inputPilsu[4]).val() == "" || $(inputPilsu[5]).val() == ""
				|| $(inputPilsu[6]).val() == "" || $(inputPilsu[7]).val() == ""
				|| agreeWon[0].checked == false) {
			//필수 클릭후 다른데 클릭했을때 이벤트 발생
			$(this).removeClass('error');
			//input에 클래스 에러(있을때) 삭제
			$(this).siblings('span').remove();
			//input밑에 span경고창(있을때) 삭제

			console.log(agreeWon[0].checked);
			if ($("#userEmail").val() == ""
					&& $(this).attr('name') == 'userEmail') {
				//유저 메일값이 비어있고 클릭한 녀석이 유저 이메일일 경우
				if (!emailRule.test($("#userEmail").val())) { //이메일 유효성 검사하고 결과 이상하면
					$("#userEmail").removeClass('error');//input error 클래스 삭젠
					$("#userEmail").siblings('span').remove();//input의 형제인 span 태그 삭제
					$("#userEmail").addClass('error'); //input에 error 클래스 추가하고
					$("#userEmail").after(
							$('<span>').html('유효하지 않은 이메일입니다.').addClass(
									'error')); //span태그 추가해서 유효하지 않다고 표시

				} else { //유효성 오케이이면
					$("#userEmail").removeClass('error');//input error 클래스 삭젠
					$("#userEmail").siblings('span').remove();//input의 형제인 span 태그 삭제
				}

			} else if ($("#userEmail").val() != ""
					&& $(this).attr('name') == 'userEmail') {
				//유저 메일값이 널이아니고 클릭한 녀석이 유저 메일일 경우
				if (!emailRule.test($("#userEmail").val())) { //이메일 유효성 검사하고 결과 이상하면

					$("#userEmail").removeClass('error');//input error 클래스 삭젠
					$("#userEmail").siblings('span').remove();//input의 형제인 span 태그 삭제
					$("#userEmail").addClass('error'); //input에 error 클래스 추가하고
					$("#userEmail").after(
							$('<span>').html('유효하지 않은 이메일입니다.').addClass(
									'error')); //span태그 추가해서 유효하지 않다고 표시
				} else { //유효성 오케이이면

					$("#userEmail").removeClass('error');//input error 클래스 삭젠
					$("#userEmail").siblings('span').remove();//input의 형제인 span 태그 삭제
				}

			}

			if ($(this).val() == "") {
				// input에 값이 없을때 if 들어감
				if ($(this).siblings('span.error').length == 0) {
					// input안에 span이 없을때 if 들어감
					$(this).addClass('error');
					// input안에 error클래스 추가 해줌
					$(this).after(
							$('<span>').html("필수 항목입니다.").addClass('error'));
					// input다음에 span을 넣어줌 html(내용).addclass는(css)
					$("#paymentBt").css("color", "#eee");
					$("#paymentBt").css("background", "#fafafa;");
					$("#paymentBt").css("border-top",
							"1px solid rgb(220, 220, 220)");
				}
			}
			$("#paymentBt").css("color", "#eee");
			$("#paymentBt").css("background", "#fafafa;");
			$("#paymentBt").css("border-top", "1px solid rgb(220, 220, 220)");
		} else {
			//---------------------------------------------------------------------------

			$(this).removeClass('error');
			//input에 클래스 에러(있을때) 삭제
			$(this).siblings('span').remove();
			if (!emailRule.test($("#userEmail").val())
					&& $(this).attr('name') == "userEmail") {
				//이메일 유효성 검사하고 결과 이상하면   	  

				$("#userEmail").removeClass('error');//input error 클래스 삭젠
				$("#userEmail").siblings('span').remove();//input의 형제인 span 태그 삭제
				$("#userEmail").addClass('error'); //input에 error 클래스 추가하고
				$("#userEmail").after(
						$('<span>').html('유효하지 않은 이메일입니다.').addClass('error')); //span태그 추가해서 유효하지 않다고 표시
				$("#paymentBt").css("color", "#eee");
				$("#paymentBt").css("background", "#fafafa;");
				$("#paymentBt").css("border-top",
						"1px solid rgb(220, 220, 220)");
			} else {
				$(this).removeClass('error');
				//input에 클래스 에러(있을때) 삭제
				$(this).siblings('span').remove();
				//input밑에 span경고창(있을때) 삭제

			}
			if (emailRule.test($("#userEmail").val())) {
				console.log("여기맞을텐데");
				$("#paymentBt").css("color", "white");
				$("#paymentBt").css("background-color", "#ff6160");
				$("#paymentBt").css("border-top", "1px solid #ff6160;");
			}

		}
	});

	$("#agreeWon")
			.change(
					function() {
						if ($(inputPilsu[0]).val() == ""
								|| $(inputPilsu[1]).val() == ""
								|| $(inputPilsu[2]).val() == ""
								|| $(inputPilsu[3]).val() == ""
								|| $(inputPilsu[4]).val() == ""
								|| $(inputPilsu[5]).val() == ""
								|| $(inputPilsu[6]).val() == ""
								|| $(inputPilsu[7]).val() == ""
								|| agreeWon[0].checked == false) {

							if (!emailRule.test($("#userEmail").val())) {
								$("#paymentBt").css("color", "#eee");
								$("#paymentBt").css("background", "#fafafa;");
								$("#paymentBt").css("border-top",
										"1px solid rgb(220, 220, 220)");
							}

							if ($(agreeWon[0]).parent().parent().siblings(
									'span.error').length != 0) {
								//input밑에 span.error가 있을때 != 0 니깐 if 들어감
								$(agreeWon[0]).parent().parent().removeClass(
										'error');
								//input에 에러클래스 지워줌
								$(agreeWon[0]).parent().parent().siblings(
										'span').remove();
								//input에 span 지워줌
							}
							if (agreeWon[0].checked == false) {
								//위에서 있던 에러 다 지워주고 (중복안되게) 다시 에러 생성
								$(agreeWon).parent().parent().siblings('span')
										.remove();
								$(agreeWon[0]).parent().parent().addClass(
										'error'); //error클래스 추가하고
								$(agreeWon[0])
										.parent()
										.parent()
										.after(
												$('<span>')
														.html(
																'이용약관을 확인하시고 체크박스에 체크하시기 바랍니다.')
														.addClass('error')); //span태그 추가하긔

								//에러를 다시 생성해줌
								$("#paymentBt").css("color", "#eee");
								$("#paymentBt").css("background", "#fafafa;");
								$("#paymentBt").css("border-top",
										"1px solid rgb(220, 220, 220)");
								//필수항목들을 전부다 하지 않았으므로 다시 결제하기 버튼 글자 컬러 원래 색으로 (#eee)변경
							}
						} else {
							if (!emailRule.test($("#userEmail").val())) {
								$(agreeWon[0]).parent().parent().removeClass(
										'error');
								//input에 에러클래스 지워줌
								$(agreeWon[0]).parent().parent().siblings(
										'span').remove();
								$("#paymentBt").css("color", "#eee");
								$("#paymentBt").css("background", "#fafafa;");
								$("#paymentBt").css("border-top",
										"1px solid rgb(220, 220, 220)");
							} else if ($(agreeWon[0]).parent().parent()
									.siblings('span.error').length != 0) {
								//input밑에 span.error가 있을때 != 0 니깐 if 들어감
								$(agreeWon[0]).parent().parent().removeClass(
										'error');
								//input에 에러클래스 지워줌
								$(agreeWon[0]).parent().parent().siblings(
										'span').remove();
								$("#paymentBt").css("color", "white");
								$("#paymentBt").css("background", "#ff6160");
								$("#paymentBt").css("border-top",
										"1px solid #ff6160;");

								//input에 span 지워줌
							} else {
								$("#paymentBt").css("color", "white");
								$("#paymentBt").css("background", "#ff6160");
								$("#paymentBt").css("border-top",
										"1px solid #ff6160;");

							}

						}

					});
	//주문자와 동일버튼 
	function Copy() {
		//onclick Copy() 를 클릭하면 밑에 실행됨
		document.getElementById("userName2").value = document
				.getElementById("userName").value;
		//id가 userName에 입력한 값을 id가 userName2에 value값을 넣어줌
		document.getElementById("userPhone2").value = document
				.getElementById("userPhone").value;
		//id가 userPhone[0]에 입력한 value값을 id가 userPhone2[0]에 value값을 넣어줌

		/*  $('.pilsu').change(function () { */
		//필수 keyup(키보드 손뗏을때) 펑션시작
		for (let i = 0; i < inputPilsu.length; i++) {
			if ($(inputPilsu[i]).val() != "") {
				//input에 값이 있을때 if 들어감
				if ($(inputPilsu[i]).siblings('span.error').length != 0) {
					//input밑에 span.error가 있을때 != 0 니깐 if 들어감
					$(inputPilsu[i]).removeClass('error');
					//input에 에러클래스 지워줌
					$(inputPilsu[i]).siblings('span').remove();
					//input에 span 지워줌
				}
			}
		}
		/*   }) */
		if ($(inputPilsu[0]).val() == "" || $(inputPilsu[1]).val() == ""
				|| $(inputPilsu[2]).val() == "" || $(inputPilsu[3]).val() == ""
				|| $(inputPilsu[4]).val() == "" || $(inputPilsu[5]).val() == ""
				|| $(inputPilsu[6]).val() == "" || $(inputPilsu[7]).val() == ""
				|| agreeWon[0].checked == false) {

		} else {

			$("#paymentBt").css("color", "white");
			$("#paymentBt").css("background", "#ff6160");
			$("#paymentBt").css("border-top", "1px solid #ff6160;");
		}

		if ($("#userEmail").val() == "") {
			if (!emailRule.test($("#userEmail").val())) { //이메일 유효성 검사하고 결과 이상하면
				$("#userEmail").removeClass('error');//input error 클래스 삭젠
				$("#userEmail").siblings('span').remove();//input의 형제인 span 태그 삭제
				$("#userEmail").addClass('error'); //input에 error 클래스 추가하고
				$("#userEmail").after(
						$('<span>').html('유효하지 않은 이메일입니다.').addClass('error')); //span태그 추가해서 유효하지 않다고 표시
				$("#paymentBt").css("color", "#eee");
				$("#paymentBt").css("background", "#fafafa;");
				$("#paymentBt").css("border-top",
						"1px solid rgb(220, 220, 220)");
			} else { //유효성 오케이이면
				$("#userEmail").removeClass('error');//input error 클래스 삭젠
				$("#userEmail").siblings('span').remove();//input의 형제인 span 태그 삭제
			}

		} else {

			if (!emailRule.test($("#userEmail").val())) { //이메일 유효성 검사하고 결과 이상하면
				$("#userEmail").removeClass('error');//input error 클래스 삭젠
				$("#userEmail").siblings('span').remove();//input의 형제인 span 태그 삭제
				$("#userEmail").addClass('error'); //input에 error 클래스 추가하고
				$("#userEmail").after(
						$('<span>').html('유효하지 않은 이메일입니다.').addClass('error')); //span태그 추가해서 유효하지 않다고 표시
				$("#paymentBt").css("color", "#eee");
				$("#paymentBt").css("background", "#fafafa;");
				$("#paymentBt").css("border-top",
						"1px solid rgb(220, 220, 220)");
			} else { //유효성 오케이이면

				$("#userEmail").removeClass('error');//input error 클래스 삭젠
				$("#userEmail").siblings('span').remove();//input의 형제인 span 태그 삭제
			}

		}

	}

	function Postcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("detailAddress").value = extraAddr;

						} else {
							document.getElementById("detailAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("detailAddress").focus();
						for (let i = 0; i < inputPilsu.length; i++) {
							if ($(inputPilsu[i]).val() != "") {
								//input에 값이 있을때 if 들어감
								if ($(inputPilsu[i]).siblings('span.error').length != 0) {
									//input밑에 span.error가 있을때 != 0 니깐 if 들어감
									$(inputPilsu[i]).removeClass('error');
									//input에 에러클래스 지워줌
									$(inputPilsu[i]).siblings('span').remove();
									//input에 span 지워줌
								}
							}
						}
						if ($(inputPilsu[0]).val() == ""
								|| $(inputPilsu[1]).val() == ""
								|| $(inputPilsu[2]).val() == ""
								|| $(inputPilsu[3]).val() == ""
								|| $(inputPilsu[4]).val() == ""
								|| $(inputPilsu[5]).val() == ""
								|| $(inputPilsu[6]).val() == ""
								|| $(inputPilsu[7]).val() == ""
								|| agreeWon[0].checked == false) {

						} else { //유효성 오케이이면
							if (emailRule.test($("#userEmail").val())) {
								$("#paymentBt").css("color", "white");
								$("#paymentBt").css("background", "#ff6160");
								$("#paymentBt").css("border-top",
										"1px solid #ff6160;");
							}
						}

					}

				}).open();
	}
	//결제창 스크롤이벤트
	$(function() {
		console.log(agreeWon);
		const oriheight = $(".bx_total").height();
		const offleft = $(".payment").offset().left + 30;
		$(window).scroll(function() {
			var height = $(document).scrollTop();
			const oriwidth = $(".payment").width();
			const offleft = $(".bx_total").offset().left;

			if (height > 417) {
				$(".bx_total").addClass("fixed")
				$(".fixed").css({
					"width" : oriwidth,
					"height" : oriheight,
					"left" : offleft
				});
			} else {
				$(".bx_total").removeClass("fixed");
				$(".bx_total").removeAttr("style");
			}
		})
	})
	//결제 스크립트
	function paymentBt() {
		if ($(inputPilsu[0]).val() == "" || $(inputPilsu[1]).val() == ""
				|| $(inputPilsu[2]).val() == "" || $(inputPilsu[3]).val() == ""
				|| $(inputPilsu[4]).val() == "" || $(inputPilsu[5]).val() == ""
				|| $(inputPilsu[6]).val() == "" || $(inputPilsu[7]).val() == ""
				|| agreeWon[0].checked == false) {
			if ($("#userEmail").val() != "") {
				if (!emailRule.test($("#userEmail").val())) { //이메일 유효성 검사하고 결과 이상하면

					$("#userEmail").removeClass('error');//input error 클래스 삭젠
					$("#userEmail").siblings('span').remove();//input의 형제인 span 태그 삭제
					$("#userEmail").addClass('error'); //input에 error 클래스 추가하고
					$("#userEmail").after(
							$('<span>').html('유효하지 않은 이메일입니다.').addClass(
									'error')); //span태그 추가해서 유효하지 않다고 표시
				} else { //유효성 오케이이면
					$("#userEmail").removeClass('error');//input error 클래스 삭젠
					$("#userEmail").siblings('span').remove();//input의 형제인 span 태그 삭제
				}
			}

			for (let i = 0; i < inputPilsu.length; i++) { //일단 입력창갯수 만큼 for문 돌리긔
				if ($(inputPilsu[i]).val() == "") { //입력창에 입력된거 없으면
					if ($(inputPilsu[i]).siblings().length == 0) { //근데 없는데 형제로 span이라던지 뭐 없어 그러면
						$(inputPilsu[i]).siblings('span').remove(); //그러면 어 그 span이 있을수도 있고 내가 몰랐을수 있으니까 지워주고
						$(inputPilsu[i]).addClass('error'); //error클래스 추가하고
						$(inputPilsu[i])
								.after(
										$('<span>').html('필수 항목입니다.').addClass(
												'error')); //span태그 추가하긔
						$(inputPilsu[i]).siblings('span').attr('style',
								'display:block;'); //span음 왜 그랬지?

					}
				}
			}
			if (agreeWon[0].checked == false) {
				//    $(agreeWon[0]).parent().siblings('span').remove(); //그러면 어 그 span이 있을수도 있고 내가 몰랐을수 있으니까 지워주고
				//  $(agreeWon[0]).parent().addClass('error'); //error클래스 추가하고
				//  $(agreeWon[0]).parent().after($('<span>').html('필수 항목입니다').addClass('error')); //span태그 추가하긔
				$(agreeWon).parent().parent().siblings('span').remove();
				$(agreeWon[0]).parent().parent().addClass('error'); //error클래스 추가하고
				$(agreeWon[0]).parent().parent().after(
						$('<span>').html('이용약관을 확인하시고 체크박스에 체크하시기 바랍니다.')
								.addClass('error')); //span태그 추가하긔
			}
		} else {
			if (!emailRule.test($("#userEmail").val())) { //이메일 유효성 검사하고 결과 이상하면

				$("#userEmail").removeClass('error');//input error 클래스 삭젠
				$("#userEmail").siblings('span').remove();//input의 형제인 span 태그 삭제
				$("#userEmail").addClass('error'); //input에 error 클래스 추가하고
				$("#userEmail").after(
						$('<span>').html('유효하지 않은 이메일입니다.').addClass('error')); //span태그 추가해서 유효하지 않다고 표시
			} else { //유효성 오케이이면
				$("#userEmail").removeClass('error');//input error 클래스 삭젠
				$("#userEmail").siblings('span').remove();//input의 형제인 span 태그 삭제

				var IMP = window.IMP; // 생략가능
				var payChoice = "card"; //선태된 결제방법의 값
				var payAmount = 10000;//가격
				var userName = $("#userName").val();//이름
				var userEmail = $("#userEmail").val();//이메일
				var userAddr = $("#address").val() + ' '
						+ $("#detailAddress").val();//주소
				var postcode = $("#postcode").val();//우편번호
				var userPhone = $(inputPilsu[1]).val() + '-'
						+ $(inputPilsu[2]).val() + '-' + $(inputPilsu[3]).val();
				IMP.init('imp39029830');
				IMP
						.request_pay(
								{
									pg : 'inicis', // version 1.1.0부터 지원.
									pay_method : payChoice,
									merchant_uid : 'merchant_'
											+ new Date().getTime(),
									name : '주문명: sawgood 결제',
									amount : payAmount,
									buyer_email : userEmail,
									buyer_name : userName,
									buyer_tel : userPhone,
									buyer_addr : userAddr,
									buyer_postcode : postcode,
									m_redirect_url : 'https://www.yourdomain.com/payments/complete'
								}, function(rsp) {
									if (rsp.success) {
										$("#paymentOrder").submit();
										var msg = '결제가 완료되었습니다.';
										msg += '고유ID : ' + rsp.imp_uid;
										msg += '상점 거래ID : ' + rsp.merchant_uid;
										msg += '결제 금액 : ' + rsp.paid_amount;
										msg += '카드 승인번호 : ' + rsp.apply_num;
									} else {
										var msg = '결제에 실패하였습니다.';
										msg += '에러내용 : ' + rsp.error_msg;
									}

								});
			}

		}

	}
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />