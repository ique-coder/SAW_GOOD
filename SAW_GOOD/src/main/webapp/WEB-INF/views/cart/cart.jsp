<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
    
<style>
/* .container{
        padding: 0;
    } */
        section>.container {
            /* padding: 20px; */
            border: 70px solid #F2E8DC;
            box-sizing: content-box;
        }

        /* 서브타이틀 */
        #subtitle {
            text-align: center;
            margin-top: 50px;
        }

        #subtitle>h1 {
            font-size: 40px;
            padding-bottom: 30px;
            font-weight: lighter;
        }

        /* 단계 */
        .shoppingbag {
            margin-top: 40px;
        }

        .shoppingbag .step {
            width: 305px;
            margin: -48px auto 80px auto;
            text-align: center;
        }

        .shoppingbag .step li {
            display: inline;
            font-size: 14px;
            color: #a1a1a1;
            position: relative;
        }

        .shoppingbag .step li+li:before {
            content: '';
            width: 7px;
            height: 7px;
            border-top: 1px solid #a1a1a1;
            border-right: 1px solid #a1a1a1;
            display: inline-block;
            -webkit-transform: rotate(45deg);
            -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            -o-transform: rotate(45deg);
            /* transform: rotate(45deg); */
            position: absolute;
            top: 0;
            left: 10px;
            bottom: 0;
            margin: auto;
        }

        .shoppingbag .step li+li {
            padding-left: 37px;
        }

        .shoppingbag .step li.active {
            color: #000;
            font-weight: bolder;
        }

        /* 장바구니 테이블 */
        .productList {
            width: 100%;
            margin-bottom: 10px;
            border-top: 2px solid black;
            border-bottom: 2px solid black;
        }

        .productList tr td {
            border-bottom: 1px solid #eee;
            padding: 20px;
            text-align: center;
            vertical-align: middle;
            font-weight: bolder;
        }

        .productList tr th {
            border-bottom: 1px solid #b5b5b5;
            padding: 20px;
            text-align: center;
            font-weight: bolder;
        }
        /* 사진크기 */
        .imgheight{
            max-width:50%;height:auto;
        }
        /* 체크박스 */
        .checking input[type="checkbox"],
        .checking input[type="radio"] {
            border: 0;
            clip: rect(0 0 0 0);
            height: 1px;
            margin: -1px;
            overflow: hidden;
            padding: 0;
            position: absolute;
            width: 1px;
        }

        .checking input[type="checkbox"]:focus+label:before,
        .checking input[type="checkbox"]:hover+label:before,
        .checking input[type="radio"]:focus+label:before,
        .checking input[type="radio"]:hover+label:before {
            border-color: black;
        }

        .checking input[type="checkbox"]:active+label:before,
        .checking input[type="radio"]:active+label:before {
            -webkit-transition-duration: 0;
            transition-duration: 0;
            -webkit-filter: brightness(0.2);
            filter: brightness(0.2);
        }

        .checking input[type="checkbox"]+label,
        .checking input[type="radio"]+label {
            position: relative;
            padding: 10px;
            padding-left: 1.5em;
            vertical-align: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        .checking input[type="checkbox"]+label:before,
        .checking input[type="radio"]+label:before {
            box-sizing: content-box;
            content: '';
            color: #900;
            position: absolute;
            top: 50%;
            left: 0;
            width: 14px;
            height: 14px;
            margin-top: -9px;
            border: 2px solid grey;
            text-align: center;
        }

        .checking input[type="checkbox"]+label:after,
        .checking input[type="radio"]+label:after {
            box-sizing: content-box;
            content: '';
            background-color: #900;
            position: absolute;
            top: 50%;
            left: 4px;
            width: 10px;
            height: 10px;
            margin-top: -5px;
            -webkit-transform: scale(0);
            transform: scale(0);
            -webkit-transform-origin: 50%;
            transform-origin: 50%;
            -webkit-transition: -webkit-transform 200ms ease-out;
            transition: -webkit-transform 200ms ease-out;
            transition: transform 200ms ease-out;
            transition: transform 200ms ease-out, -webkit-transform 200ms ease-out;
        }

        .checking input[type="checkbox"]+label:after {
            background-color: transparent;
            top: 50%;
            left: 4px;
            width: 8px;
            height: 3px;
            margin-top: -4px;
            border-style: solid;
            border-color: #900;
            border-width: 0 0 3px 3px;
            -webkit-border-image: none;
            -o-border-image: none;
            border-image: none;
            -webkit-transform: rotate(-45deg) scale(0);
            transform: rotate(-45deg) scale(0);
            -webkit-transition: none;
            transition: none;
        }

        .checking input[type="checkbox"]:checked+label:after {
            content: '';
            -webkit-transform: rotate(-45deg) scale(1);
            transform: rotate(-45deg) scale(1);
            -webkit-transition: -webkit-transform 200ms ease-out;
            transition: -webkit-transform 200ms ease-out;
            transition: transform 200ms ease-out;
            transition: transform 200ms ease-out, -webkit-transform 200ms ease-out;
        }

        .checking input[type="radio"]:checked+label:before {
            -webkit-animation: borderscale 300ms ease-in;
            animation: borderscale 300ms ease-in;
            background-color: white;
        }

        .checking input[type="radio"]:checked+label:after {
            -webkit-transform: scale(1);
            transform: scale(1);
        }

        .checking input[type="radio"]+label:before,
        .checking input[type="radio"]+label:after {
            border-radius: 50%;
        }

        .checking input[type="checkbox"]:checked+label:before {
            -webkit-animation: borderscale 200ms ease-in;
            animation: borderscale 200ms ease-in;
        }

        .checking input[type="checkbox"]:checked+label:after {
            -webkit-transform: rotate(-45deg) scale(1);
            transform: rotate(-45deg) scale(1);
        }

        @-webkit-keyframes borderscale {
            50% {
                box-shadow: 0 0 0 2px #900;
            }
        }

        @keyframes borderscale {
            50% {
                box-shadow: 0 0 0 2px #900;
            }
        }

        .error-msg {
            display: block;
            color: red;
            max-height: 0;
            overflow: hidden;
            -webkit-transition: max-height 500ms ease-out;
            transition: max-height 500ms ease-out;
            will-change: max-height;
        }

        :required:not(:focus)~.error-msg,
        :invalid:required~.error-msg {
            max-height: 9em;
        }

        .checking input:focus {
            border: 1px solid black;
        }

        .checking input:not(:focus):invalid {
            border: 1px solid red;
            outline: none;
        }

        .checking input:not(:focus):valid {
          
        }


        form ul {
            list-style: none;
        }

        label {
            cursor: pointer;
            display: inline-block;
        }

        /* 삭제버튼 */
        .btn-black {
            padding: 0 30px;
            line-height: 50px;
            font-size: 15px;
            color: #fff;
            text-align: center;
            background-color: #303030;
            border: 1px solid #303030;
        }

        /* 왼쪽 결제창 */
        .bx_total {
            -webkit-font-smoothing: antialiased;
            font-family: "ProximaNova-Light", "yg740";
            font-size: 12px;
            box-sizing: border-box;
            outline: none;
            font-weight: normal;
            font-style: normal;
        }

        .shoppingbag .bx_total h3 {
            -webkit-font-smoothing: antialiased;
            box-sizing: border-box;
            outline: none;
            font-style: normal;
            margin: 0;
            font-weight: normal;
            background-color: white;
            height: 70px;
            padding-top: 27px;
            border:1px solid black;
            border-bottom: 1px solid #ababab;
            font-family: "yg750";
            font-size: 18px;
            text-align: center;
        }

        .shoppingbag .bx_total ul {
            -webkit-font-smoothing: antialiased;
            font-family: "ProximaNova-Light", "yg740";
            font-size: 12px;
            box-sizing: border-box;
            outline: none;
            font-weight: normal;
            font-style: normal;
            margin: 0;
            border:1px solid black;
            border-top:white;
            border-bottom:white;
            background-color: white;
            padding: 23px 0;
        }

        .shoppingbag .bx_total li {
            margin: 8px 20px 0 20px;
            color: #333;
            overflow: hidden;
        }

        .shoppingbag .bx_total li.total {
            margin-top: 20px;
            padding-top: 18px;
            border-top: 1px solid #d9d9d9;
        }

        .shoppingbag .bx_total li.point {
            margin-top: 10px;
            color: #666;
            overflow: visible;
        }

        .shoppingbag .btn_order {
            width: 100%;
            height: 70px;
            background-color: #ff6160;
            font-family: "yg750";
            font-size: 18px;
            line-height: 70px;
            color: #fff;
            overflow: hidden;
            outline: none;
        }

        button {
            width: auto;
            border: 0;
            padding: 0;
            background: none;
            font-weight: normal;
        }

        .shoppingbag .bx_total li.point:after {
            display: block;
            clear: both;
            content: '';
        }

        .shoppingbag .bx_total li strong {
            float: left;
            font-size: 14px;
        }

        .shoppingbag .bx_total li strong,
        .shoppingbag .bx_total li p {
            display: inline-block;
        }

        .shoppingbag .bx_total li p {
            width: 114px;
            text-align: right;
            font-family: "ProximaNova-Regular";
            font-size: 14px;
            float: right;
        }

        .shoppingbag .bx_total li.total em {
            font-size: 20px;
            color: #ff6160;
        }

        .shoppingbag .bx_total li p em {
            margin-right: 5px;
            font-size: 18px;
        }

        /* 스크롤 이벤트 */
        .payment {
            padding: 30px;
        }

        .fixed {
            position: fixed;
            top: 0;
            left: 0;
        }
        
/* 장바구니 수량  */
.inputquantity {
	position: relative;
}

.inputquantity2 {
	display: table;
	width: 72px;
	height: 34px;
	outline:1px solid black;
	pointer-events: all;
}

.inputquantity2:hover {
	outline: 1px solid black;
}

.minus {
	width: 22px;
	height: 34px;
	font-size: 20px;
}

div.inputquantity2>div {
	width: 24px;
}

div.inputquantity2>input {
	width: 24px;
	padding: 0;
	margin: 0;
	background: transparent;
	border: 0;
	text-align: center;
}

button {
	border: 0 none;
	background-color: transparent;
	cursor: pointer;
}

.plus {
	width: 22px;
	height: 34px;
	font-size: 15px;
}
/* 위아래 수량버튼 지우기 */

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>
<section>
        <!-- 전체 컨테이너 div -->
        <div class="container" style="padding: 0;min-height:900px; ">
            <!-- <div class="container" style="padding: 0; border-top:0; ">    -->
            <div id="subtitle">
                <h1>SHOPPING BAG</h1>
            </div>
            <div class="shoppingbag">
                <ul class="step">
                    <li class="active">쇼핑백</li>
                    <li>주문결제</li>
                    <li>주문완료</li>
                </ul>
                <div class="row">
                <form action="${path }/payment/paymentView">
                    <div class="col-md-9">
                        <div  style="padding:0 0 0 30px">
                        <p style="font-size: 20px; margin-bottom: 10px;">기본상품 <span>(0)</span></p>
                        <table class="productList checking">
                            <colgroup>
                                <col width="10%" />
                                <col width="20%" />
                                <col width="18%" />
                                <col width="auto" />
                                <col width="10%" />
                                <col width="15%" />
                            </colgroup>
                            <tr>
                                <th><input type="checkbox" name="productNo" id="allpro"><label for="allpro"></label>
                                </th>
                                <th>이미지</th>
                                <th>브랜드</th>
                                <th>상품정보</th>
                                <th>수량</th>
                                <th>가격</th>
                            </tr>
                             <c:choose>
                            	<c:when test="${not empty list }">
                            	<c:forEach items="${list }" var="c" varStatus="vs">
	                            <tr>
	                                <td><input type="checkbox" name="productNo" class="productNo" id="pro${vs.count }" value="${c['PRODUCTNO'] }"><label for="pro${vs.count }"></label></td>
	                                <td><img class="img-responsive imgheight" src="${paht }/resources/upload/newproduct/${c['RENAMEDPRODUCTIMG']}" width="100%"/></td>
	                                <td>${c['BRAND'] }</td>
	                                <td>${c['PRODUCTNAME'] }</td>
	                                <td class="quantity">
										<div class="inputquantity">
											<div class="inputquantity2">
												<input type="hidden" id="realprice" value="${c['CARTTOTALPRICE'] }"/>
												<button type="button" class="minus"
													style="display: table-cell;">-</button>
												<input type="number" class="pdQuantity" name="pdQuantity"
													value="${c['CARTCOUNT'] }" maxlength="3" readonly>				
												<button type="button" class="plus"
													style="display: table-cell;">+</button>
												<input type="hidden" name="cartTotalPrice" value=""/>
											</div>
										</div>	
									</td>
	                                <td class="format-Price">
	                                ${c['CARTTOTALPRICE'] }</td>
	                            </tr>
	                           
	                            </c:forEach>
	                            </c:when>
	                            <c:otherwise>
	                            	<td style="height:300px;font-weight:bolder" colspan="6">장바구니에 담긴 상품이 없습니다.</td>
	                       		</c:otherwise>
                            </c:choose>
                        </table>
                        <div style="padding-bottom:20px;">
                            <button type="button" class="btn-black">선택상품 삭제</button>
                        </div>
                    </div>
               		</div>
                    <div class="col-md-3 payment">
                        <div class="bx_total">
                            <h3>주문금액</h3>
                            <ul>
                                <li>
                                    <strong>총상품 금액</strong>
                                    <p><em id="counterTotal" class="format-Price">152000</em></p>
                                </li>
                                <li>
                                    <strong>배송비</strong>
                                    <p><span>+</span><em id="counterTotdeliveryamt" class="format-Price">10000</em></p>
                                </li>
                                <li class="total">
                                    <strong>총 결제금액</strong>
                                    <p><em id="counterTotalAmt" class="format-Price">162000</em></p>
                                </li>
                            </ul>
                            <button type="submit" name="button" onclick="" class="btn_order">선택상품 주문하기</button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <script>
        $(function(){
            const oriheight=$(".bx_total").height();
            const offleft=$(".payment").offset().left+30;
        $(window).scroll(function () {
            var height = $(document).scrollTop();
            const oriwidth=$(".payment").width();
            const offleft=$(".bx_total").offset().left;
            console.log(offleft);
            if (height > 370) {
                $(".bx_total").addClass("fixed")
                $(".fixed").css({"width":oriwidth,"height":oriheight,"left":offleft});
            } else {
                $(".bx_total").removeClass("fixed");
                $(".bx_total").removeAttr("style");
            }
        })
    })
   //페이지 로딩시 바로 펑션 시작쓰
      $(function() {
         //숫자 타입에서 쓸 수 있도록 format() 함수 추가
         Number.prototype.format = function() {
            if (this == 0)
               return 0;
            var reg = /(^[+-]?\d+)(\d{3})/;
            var n = (this + '');
            while (reg.test(n))
               n = n.replace(reg, '$1' + ',' + '$2');
            return n;
         };

         // 문자열 타입에서 쓸 수 있도록 format() 함수 추가
         String.prototype.format = function() {
            var num = parseFloat(this);
            if (isNaN(num))
               return "0";
            return num.format();
         };
         $(".format-Price").text(function() {
            $(this).text($(this).text().format()+"원");
         });

      })
      //전체선택/해체 할때 가격넘기기
  		$("#allpro").click(function() {
  			if ($("#allpro").prop("checked")) {
	  				let totalPrice=0;
	  				$(".productNo:not(:checked)").each(function(index,item){
	  					totalPrice+=parseInt($(item).parent().next().next().next().next().next().text().replace(/\,/gi,""));
	  				})
	  				$(".productNo:not(:checked)").prop("checked", true);
	  				let cktotal = parseInt($("#counterTotal").text().replace(/\,/gi,""))+totalPrice;
	  				let ckAlltotal = parseInt($("#counterTotalAmt").text().replace(/\,/gi,""))+totalPrice;
	  				let stckTotal = cktotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  				let stckAlltotal = ckAlltotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  				$("#counterTotal").text(stckTotal+"원");
	  				$("#counterTotalAmt").text(stckAlltotal+"원");
  			} else {
  				
  				let totalPrice=0;
  				$(".productNo:checked").each(function(index,item){
  					totalPrice+=parseInt($(item).parent().next().next().next().next().next().text().replace(/\,/gi,""));
  				})
  				$(".productNo:checked").prop("checked", false);
  				let cktotal = parseInt($("#counterTotal").text().replace(/\,/gi,""))-totalPrice;
  				let ckAlltotal = parseInt($("#counterTotalAmt").text().replace(/\,/gi,""))-totalPrice;
  				let stckTotal = cktotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  				let stckAlltotal = ckAlltotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  				$("#counterTotal").text(stckTotal+"원");
  				$("#counterTotalAmt").text(stckAlltotal+"원");
  			}
  		})
	
		 //장바구니 +버튼클릭시 가격증가 그리고 체크된 상태에서는 값을 총결제에 넘기기
   		$(".plus").click(function(){
				let val=$(this).prev().val();
				let price=$(this).prev().prev().prev().val();
				let sc=parseInt(val);
				val++; 
				$(this).prev().val(val);
				let totalprice=val*price;
				let stringtotal=totalprice.toString().replace(
						/\B(?=(\d{3})+(?!\d))/g, ",");
				$(this).parent().parent().parent().next().text(stringtotal+"원");
				
				if($(this).parent().parent().parent().prev().prev().prev().prev().find("input").prop("checked")){
					let cktotal=parseInt($("#counterTotal").text().replace(/\,/gi,""))+parseInt(price);
					let ckAlltotal=parseInt($("#counterTotalAmt").text().replace(/\,/gi,""))+parseInt(price);
					let stringckt=cktotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					let stringckat=ckAlltotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$("#counterTotal").text(stringckt+"원");
					$("#counterTotalAmt").text(stringckat+"원");
				}
   		})
   	//장바구니 -버튼
   		$(".minus").click(function(){
   			let val=$(this).next().val();
   			let price=$(this).prev().val();
   			val--;
   			if(val>0){
   				$(this).next().val(val);
   				let totalprice=val*price;
   				let stringtotal=totalprice.toString().replace(
							/\B(?=(\d{3})+(?!\d))/g, ",");
   				$(this).parent().parent().parent().next().text(stringtotal+"원");
   				if($(this).parent().parent().parent().prev().prev().prev().prev().find("input").prop("checked")){
   					let cktotal=parseInt($("#counterTotal").text().replace(/\,/gi,""))-price;
					let ckAlltotal=parseInt($("#counterTotalAmt").text().replace(/\,/gi,""))-price;
					let stringckt=cktotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					let stringckat=ckAlltotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$("#counterTotal").text(stringckt+"원");
					$("#counterTotalAmt").text(stringckat+"원");
				} 
   			}
   			$(this).parent().parent().parent().next().text();
   		})
   	//체크박스 클릭시 값 합치기
   		$(".productNo").click(function(){
   			if($(this).prop("checked")){
   				let totalP=parseInt($(this).parent().next().next().next().next().next().text().replace(/\,/gi,""));
   				
   				let countTotal=parseInt($("#counterTotal").text().replace(/\,/gi,""));
   				let delevery=parseInt($("#counterTotdeliveryamt").text().replace(/\,/gi,""));
   				let stringtotal=(countTotal+totalP).toString().replace(
						/\B(?=(\d{3})+(?!\d))/g, ",");
   				let stringAlltotal=(countTotal+totalP+delevery).toString().replace(
						/\B(?=(\d{3})+(?!\d))/g, ",");
   				$("#counterTotal").text(stringtotal+"원");
   				$("#counterTotalAmt").text(stringAlltotal+"원");
   				
   			}else{
   				let totalP=parseInt($(this).parent().next().next().next().next().next().text().replace(/\,/gi,""));
   				let countTotal=parseInt($("#counterTotal").text().replace(/\,/gi,""));
   				let delevery=parseInt($("#counterTotdeliveryamt").text().replace(/\,/gi,""));
   				let stringtotal=(countTotal-totalP).toString().replace(
						/\B(?=(\d{3})+(?!\d))/g, ",");
   				let stringAlltotal=(countTotal-totalP+delevery).toString().replace(
						/\B(?=(\d{3})+(?!\d))/g, ",");
   				$("#counterTotal").text(stringtotal+"원");
   				$("#counterTotalAmt").text(stringAlltotal+"원");
   			}
   		})
   		
   		//포커스가 떠난후에 값
   		/* $(".pdQuantity").blur(function(){
   			let val=parseInt($(this).val());
   			let price = parseInt($(this).prev().prev().val());
   			var totalPrice = val*price;
   			let stTotalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   			$(this).parent().parent().parent().next().text(stTotalPrice+"원");
   			if($(this).parent().parent().parent().next().next().next().next().find("input").prop("checked")){
   				console.log(totalPrice);
   				let ckval=parseInt($(this).val());
   				let ckprice = parseInt($(this).prev().prev().val());
   				let totalP=parseInt($("#counterTotal").text().replace(/\,/gi,""))+totalPrice;
   				let AlltotalP=parseInt($("#counterTotdeliveryamt").text().replace(/\,/gi,""))+totalPrice;
   				let stTotalP=totalP.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   				let stAlltotalP=AlltotalP.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   				$("#counterTotal").text(stTotalP);
   				$("#counterTotdeliveryamt").text(stAlltotalP);
   			}
   		}) */
   		
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />