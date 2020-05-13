
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>

<!-- 부트스트랩 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<!-- rotatable, draggable -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<!-- <script src="http://code.jquery.com/jquery-1.11.3.js"></script> -->
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script src="${path }/resources/canvas/jquery.ui.rotatable.js"></script>
<link rel="stylesheet"
	href="${path }/resources/canvas/jquery.ui.rotatable.css">


<style>
.center {
	text-align: center;
}

.inline {
	display: inline-block;
	border: solid 1px blakc;
}

#canvas {
	border: solid 1px black;
	background-color: lightgrey;
	width: 100%;
	overflow: auto;
	margin: 20px 0;
	display: none;
}

#furnitureCategory {
	/* border: solid 1px red; */
	/* background-color: lightsalmon; */
	margin: 20px 0 0 0;
}

#interiorSize {
	background-color: white;
	border: solid 10px rgb(65, 26, 0);
	margin: auto auto;
	box-sizing: content-box;
}

.interior {
	position: relative;
	/* z-index: 0; */
}

/* 상단 카테고리 */
.categoryNameList>label {
	font-size: 0.9375rem;
	letter-spacing: 0.1em;
	text-transform: uppercase;
	line-height: 1.8;
	color: rgb(90, 90, 90);
	border: solid 1px black;
}

div.categoryNameList:hover {
	cursor: pointer;
}

div.categoryNameList {
	position: relative;
	display: table;
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	outline: 0;
	pointer-events: none;
}

div.categoryNameList>input {
	position: absolute;
	width: 100%;
	height: 100%;
	opacity: 0;
	cursor: pointer;
	pointer-events: all;
}

div.categoryNameList>input+label {
	text-align: center;
	font-weight: bolder;
	width: 100%;
	height: 100%;
	padding: 15px 0;
	margin: 0;
	border: 1px solid #eee;
	border-bottom-color: #191919;
}

div.categoryNameList>input:checked+label {
	text-align: center;
	font-weight: bolder;
	width: 100%;
	height: 100%;
	padding: 15px 0;
	margin: 0;
	border: 1px solid #191919;
	border-bottom-color: #eee;
}

/*       */
.padding {
	padding: 0;
}

/* 상품리스트 */
#furnitureSelect {
	border: solid 1px #191919;
	border-top: 0;
	padding: 20px 15px 15px 20px;
	margin: 0;
}

.product {
	border: solid 1px lightgray;
	margin: 0 5px 5px 0;
	display: inline-block;
	padding: 10px;
	cursor: pointer;
	width: 209.6px;
}

.product:hover {
	background-color: #F2E8DC;
	border: solid 1px #51735D;
}

.productImg {
	width: 187.6px;
	height: 187.6px;
}

.product p {
	margin: 5px 0;
}

.product p:last-child {
	margin: 5px 0 0 0;
}

.productName {
	color: #51735D;
	font-weight: 600;
}

.productBrand {
	color: gray;
	float: right;
}
/*          */

/* 페이지바 */
#pageBar {
	width: 100%;
	margin: 20px 0 0 0;
	text-align: center;
}

#pageBar>a, #pageBar>span {
	width: 40px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	border: 1px solid #d5d5d5;
	color: #999;
	background-color: #fff;
	margin: 0 2px;
	position: relative;
	font-size: 13px;
	font-family: "YoonGothicPro760";
	display: inline-block;
	vertical-align: top;
}

#pageBar>span.cPage {
	border: 1px solid #191919;
	color: #191919;
}

/* 페이지바 cpage span */
#selectListTag {
	position: relative;
	float: left;
	border-right: solid 10px #51735D;
	height: 700px;
	cursor: pointer;
	left: -400px;
	transition: 1s;
	z-index: 100;
}

#selectListTag img {
	position: relative;
	padding-left: 15px;
	left: -410px;
	top: 300px;
	visibility: hidden;
	z-index: 1;
	width: 40px;
	cursor: pointer;
	display: inline-block;
}

#selectListTag h3 {
	margin: 20px 0;
}

.rotation1 {
	/* transform : rotate(0deg); */
	transform: scaleX(1);
	/* filter : FlipH; */
}

.rotation2 {
	/* transform : rotate(0deg); */
	transform: scaleX(-1);
	/* filter : FlipH; */
}
</style>

<style>
#selectList {
	position: relative;
	/* top: -12px; */
	/* 	float: left; */
	width: 400px;
	height: 700px;
	background-color: rgb(223, 230, 221);
	text-align: center;
	opacity: 0.9;
	/* display: none; */
	display: inline-block;
}

#listTable {
	width: 100%;
	text-align: center;
}
.emptyDiv {
	width: 187.6px;
}
#insertRoomSize {
	position: relative;
	padding: 20px;
	border: solid 1px #191919;
	margin-top: 20px;
	text-align: center;
}
#insertRoomSize p {
	margin: 10px 0;
	border-bottom: 0;
}
#insertRoomSize p:first-child {
	font-size: 25px;
	padding-bottom: 15px;
	margin: 0 0 20px 0;
	border-bottom: solid 1px lightgray;
}
#insertRoomSize p:last-child {
	position: relative;
	right: 0px;
	margin: 0;
	text-align: right;
	border-bottom: 0;
}
#insertRoomSize button{
	border: 0;
	background-color: #51735D;
	color: white;
	padding: 5px 10px;
	width: 100px;
	/* cursor: */
}

#selectList p:last-child {
	padding: 20px 0;
	border-top: solid 1px lightgray;
}
#closeList {
	background-color: #F2E8DC;
	color: black;
	border: 0;
	padding: 5px 10px;
	width: 100px;
}
#orderList {
	background-color: #51735D;
	color: white;
	border: 0;
	padding: 5px 10px;
	width: 100px;
}

</style>
<script type="text/javascript">
	function roAndDr() {
		$(document).ready(function() {
			// $('#GoCoderImg1').resizable();        
			$('.interior').rotatable();
			$('.interior').draggable()
		});

	}
</script>
<div class="container">
	<div class="col-md-12 padding">
		<!-- 상단 카테고리 -->
		<div id="furnitureCategory" class="row">
			<!-- 카테고리 블럭들 (단순 선택하는 놈들) -->
			<div id="categoryBed" class="categoryNameList col">
				<input type="radio" name="category" value="bed" checked /> <label
					for="category">bed</label>
			</div>
			<div id="categorySofa" class="categoryNameList col">
				<input type="radio" name="category" value="sofa,chair" /> <label
					for="category">sofa / chair</label>
			</div>
			<div id="categoryLight" class="categoryNameList col">
				<input type="radio" name="category" value="light" /> <label
					for="category">light</label>
			</div>
			<div id="categoryTable" class="categoryNameList col">
				<input type="radio" name="category" value="table,desk" /> <label
					for="category">table / desk</label>
			</div>
			<div id="categoryCarpet" class="categoryNameList col">
				<input type="radio" name="category" value="carpet,lug" /> <label
					for="category">carpet / lug</label>
			</div>
			<div id="categoryStorage" class="categoryNameList col">
				<input type="radio" name="category" value="storage" /> <label
					for="category">storage</label>
			</div>
			<div id="categoryOthers" class="categoryNameList col">
				<input type="radio" name="category" value="others" /> <label
					for="category">others</label>
			</div>
		</div>

		<!-- 가구 리스트 -->
		<div id="furnitureSelect" class="row">
		</div>

		<div id="insertRoomSize" class="col-md-12">
			<p>Please Enter My Room Size Here</p>
			<p class="row">
				<span class="col">가로(cm) <input id="roomWidth" type="text"></span>
				<span class="col">세로(cm) <input id="roomHeight" type="text"></span>
			</p>
			<p><button id="createRoomBtn">입력</button></p>
			
		</div>

		<div class="col-md-12 padding">

			<div id="canvas" class="inline">
				<div id="selectListTag">
					<div id="selectList" class="modal-content">
						<h3>ㅣ Furniture List ㅣ</h3>
						<table id="listTable">
						</table>
						<p>
							<span><button id="closeList">닫기</button></span>
							<span><button id="orderList">주문하기</button></span>
						</p>
					</div>
				</div>
				
				<div id="interiorSize">
				</div>
			</div>
		</div>

	</div>

	<script>
		// 클릭하면 z-index +1 증가, 나머지는 min만큼 -
		function frontPop() {
			// $(".interior").off("click").on("click", function() {
			// 	let max = 0;
			// 	let min = $(this).css('z-index');

			// 	$(".interior").each(function() {
			// 		if (min > $(this).css('z-index')) {
			// 			min = $(this).css('z-index');
			// 		}
			// 	})
			// 	console.log("min : " + min);
			// 	$(".interior").each(function() {
			// 		$(this).css('z-index', $(this).css('z-index') - min);
			// 		if (max < $(this).css('z-index')) {
			// 			max = $(this).css('z-index');
			// 		}
			// 	})

			// 	$(this).css('z-index', ++max);
			// 	console.log($(this).css('z-index'));
			// })
		}

		// 더블클릭하면 방향 전환
		function de180() {
			$(".interior").dblclick(function() {
				if ($(this).css('transform').indexOf('-1') != -1) {
					// $(this).addClass('rotation1');
					$(this).css({
						'transform' : 'rotate(0deg)',
						'transform' : 'scaleX(1)',
						'filter' : 'FlipH'
					});
				} else {
					// $(this).addClass('rotation2');
					$(this).css({
						'transform' : 'rotate(0deg)',
						'transform' : 'scaleX(-1)',
						'filter' : 'FlipH'
					});
				}
				roAndDr();
			})
		}

		// 번호 생성하는 변수
		var countProduct = 1;

		// 카테고리 클릭-> 캔버스에 생성
		function productClick() {
			$(".product").click(
					function() {
						// DB의 해당 name을 가진 img경로를 불러오기
						let src1 = $(this).children().get(3).value;
						let src = "${path}/resources/upload/newproduct/" + src1;
						let img = $("<img>").attr({
							'src' : src,
							'name' : countProduct,
							'position' : 'relative',
							'top' : '0px',
							'left' : '0px'
						}).css({'z-index' : countProduct}).addClass("interior");
						$("#interiorSize").append(img);

						roAndDr();
						de180();
						frontPop();

						// for문으로 처리
						let td1 = $("<td>").html(countProduct);
						let name = $("<td>").html(
								$(this).children('p').eq(0).children('span').eq(1)
										.html());
						let brand = $("<td>").html(
								$(this).children('p').eq(0).children('span').eq(0)
										.html());
						let td2 = name;
						let td3 = $("<button>").html("확인").addClass("listCheck")
								.attr('name', countProduct);
						let td4 = $("<button>").html("위로").addClass("listUp").attr(
								'name', countProduct);
						let td5 = $("<button>").html("아래로").addClass("listDown")
								.attr('name', countProduct);
						let td6 = $("<button>").html("삭제").addClass("listDelete")
								.attr('name', countProduct);
						let tr = $("<tr>");

						$("#listTable").prepend(
								$("<tr>").append(td1).append(td2).append(td3)
										.append(td4).append(td5).append(td6));
						countProduct++;

						furnitureListButtons();
					})
		}

		// listTag
		$("#selectListTag").click(function() {
			if ($(this).css('left') == '0px') {
				// $(this).css({'left':'-400px'});
			} else {
				$(this).css({
					'left' : '0px',
					"cursor" : "default"
				});
			}
		})

		// furnitureList buttons
		function furnitureListButtons() {
			$(".listCheck").off("click").on(
					"click",
					function() {
						// 같은 name값을 가지고 있는 img를 선택하여 깜빡이는 효과를 줌
						$("[name=" + $(this).attr('name') + "]").eq(4).fadeOut(
								300).fadeIn(300);
					})
			$(".listUp").off("click").on(
					"click",
					function() {
						if ($(this).parent().index() != 0) {
							// 리스트 변화
							$(this).parent().prev().before($(this).parent());
							$(this).parent().children().eq(0).html(
									($(this).parent().index() + 1));
							$(this).parent().next().children().eq(0).html(
									($(this).parent().index() + 2));

							// 이미지 z-index 변화
							let indexUp = $(this).attr('name');
							let indexDown = $(this).parent().next().children().eq(2).attr('name');
							let changeUp = $("[name=" + indexUp + "]").eq(4);
							let changeDown = $("[name=" + indexDown + "]").eq(4);
							indexUp = $("[name=" + indexUp + "]").eq(4).css('z-index');
							indexDown = $("[name=" + indexDown + "]").eq(4).css('z-index');
							indexUp++;
							indexDown--;
							changeUp.css("z-index",indexUp);
							changeDown.css("z-index",indexDown);
						}
					})
			$(".listDown").off("click").on(
					"click",
					function() {
						if ($(this).parent().index() != $(".listDown").length) {
							// 리스트 변화
							$(this).parent().next().after($(this).parent());
							$(this).parent().children().eq(0).html(
									($(this).parent().index() + 1));
							$(this).parent().prev().children().eq(0).html(
									($(this).parent().index()));

							// 이미지 z-index 변화
							let indexDown = $(this).attr('name');
							let indexUp = $(this).parent().prev().children().eq(2).attr('name');
							let changeUp = $("[name=" + indexUp + "]").eq(4);
							let changeDown = $("[name=" + indexDown + "]").eq(4);
							indexUp = $("[name=" + indexUp + "]").eq(4).css('z-index');
							indexDown = $("[name=" + indexDown + "]").eq(4).css('z-index');
							indexUp++;
							indexDown--;
							changeUp.css("z-index",indexUp);
							changeDown.css("z-index",indexDown);
						}
					})
			// 클릭시 삭제
			$(".listDelete").off("click").on("click", function() {
				console.log($("[name=" + $(this).attr('name') + "]").eq(4));
				let index = $(this).attr('name');
				index--;
				$(".interior").eq(index).css({
					'position' : 'absolute',
					'top' : '0px',
					'left' : '0px',
					'visibility' : 'hidden'
				});
				$(this).parent().remove();
			})
		}
		// 카테고리 선택시 해당 input의 value값을 parameter로 보내기
		// ajax처리
		let categoryName = 'bed';

		$(".categoryNameList").click(function() {
			categoryName = $(this).children('input[type=radio]').val();
			console.log(categoryName);
			$("#furnitureSelect").html("");
			categotyAjax();
		})

		function categotyAjax() {
			$.ajax({
				url : "${path}/furniture/category.do",
				type : "POST",
				data : {categoryName:categoryName},
				// contentType : "application/json; charset=utf-8;",
				dataType : "json",
				success : function(data) {
					
					let checkNum = data.productList.length % 5;
					
					for(i=0; i<data.productList.length; i++) {
						let product = data.productList[i];
						let div = $("<div>").addClass("product col");

						// img tag
						let src = "${path}/resources/upload/newproduct/" + product.productImg;
						div.append($("<img>").addClass("productImg").attr({"src":src}));
						// 1 p tag
						div.append($("<p>").append($("<span>").addClass("productBrand").html(product.brand))
								.append($("<span>").addClass("productName").html(product.productName)));
						// 2 p tag
						div.append($("<p>").append($("<span>").addClass("productPrice format-Price").html(product.productPrice)));
						div.append($("<input>").attr({"type":"hidden", "name":"top"}).val(product.topImg));
						
						// input type=hidden 이것은 필요하면 추가하기.
						
						$("#furnitureSelect").append(div);
					}
					// 5개씩 list를 하기 위해서 부족한 경우에 더 채워주는 더미를 만들어준다.
					if(checkNum =! 0) {
						let repeatNum = 5 - checkNum;
						for(let i=0; i<repeatNum; i++) {
							let div = $("<div>").addClass("col emptyDiv");
							$("#furnitureSelect").append(div);
						}
					}
					$("#furnitureSelect").append(data.pages);

					productClick();

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
						$('.format-Price').text(function() {
							$(this).text($(this).text().format()+"원");
						});

					})
				},
			});
		}
		categotyAjax();

		$("#createRoomBtn").click(function() {
			let width = $("#roomWidth").val();
			let height = $("#roomHeight").val();
			let left = width * -1;
			let marginTop = (700-height)/2 + "px";

			if((width != 0 && width != null && width != '') && (height != 0 && height != null && height != '')) {
				$("#canvas").show();

				if(height > 700) {
					$("#interiorSize").css({"width":width, "height":height, "margin":"auto"});
					height = height -20 + 40;
					$("#selectListTag").css("height",height);
					$("#selectList").css("height",height);
				} else {
					height = height -20;
					$("#interiorSize").css({"width":width, "height":height, "margin": marginTop + " auto"});
				}
				$("#insertRoomSize").hide();
			}
		})

		// list Close
		$("#closeList").click(function() {
			$("#selectListTag").css({"left":"-400px", "cursor" : "pointer"});
		})
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />