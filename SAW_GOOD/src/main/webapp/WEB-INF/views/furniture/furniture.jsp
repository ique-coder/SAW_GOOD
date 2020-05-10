
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
	margin-top: 20px;
}

#furnitureCategory {
	/* border: solid 1px red; */
	/* background-color: lightsalmon; */
	margin: 20px 0 0 0;
}

#interiorSize {
	width: 1000px;
	height: 700px;
	background-color: white;
	border: solid 1px violet;
	margin: 0 auto;
}

.interior {
	position: relative;
	z-index: 0;
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
	width: 80%;
	margin: 40px 0 40px 0;
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
	border-left: solid 10px #51735D;
	height: 700px;
	cursor: pointer;
}
#selectListTag img {
	position: relative;
	margin-left: 5px;
	top: 48%;
	visibility: hidden;
}
</style>

<style>
#selectList {
	float: right;
	width: 400px;
	height: 100%;
	padding: 120px 50px;
	background-color: rgb(223, 230, 221);
	text-align: center;
	opacity: 0.9;
	display: none;
}

.modal_container {
	position: fixed;
	top: 0;
	padding: 0;
	right: -400px;
	z-index: -1;
	transition: right 0.8s ease-out;
	height: 100%;
	width: 2500px;
}
</style>
<script>
	$(".top_menu1 li:first").click(function() {
		var v = document.getElementById("modal_container");
		// v.style.transitionDelay="background-color 0.8s";
		$(".modal_container").css({
			right : "0",
			"z-index" : "9998",
			backgroundColor : "rgba(0,0,0,0.5)"
		});
		$("#userId").focus();
	})
	function closeLogin() {
		var v = document.getElementById("modal_container");
		v.style.right = '-400px';
		v.style.transition = "right 0.8s ease-out, z-index 0.8s";
		v.style.zIndex = "-1";
		$("#userId").val("");
		$("#password").val("");
		$("input[type='checkbox']").prop("checked", false);
		$(".modal_container").css("backgroundColor", "");
	}
</script>
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
				<input type="radio" name="category" value="sofa" /> <label
					for="category">sofa / chair</label>
			</div>
			<div id="categoryLight" class="categoryNameList col">
				<input type="radio" name="category" value="light" /> <label
					for="category">light</label>
			</div>
			<div id="categoryTable" class="categoryNameList col">
				<input type="radio" name="category" value="table" /> <label
					for="category">table / desk</label>
			</div>
			<div id="categoryCarpet" class="categoryNameList col">
				<input type="radio" name="category" value="carpet" /> <label
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
			<div class="product col">
				<img class="productImg"
					src="${path }/resources/images/1524445081477_iT6B.jpg">
				<p>
					<span class="productBrand">[이케아]</span><span class="productName">벙커침대</span>
				</p>
				<p>
					<span class="productPrice">132,000원</span>
				</p>
			</div>
			<div class="product col">
				<img class="productImg"
					src="${path }/resources/images/1524445081477_iT6B.jpg">
				<p>
					<span class="productName">벙커침대</span><span class="productBrand">이케아</span>
				</p>
				<p>
					<span class="productPrice">132,000원</span>
				</p>
			</div>
			<div class="product col">
				<img class="productImg"
					src="${path }/resources/images/1524445081477_iT6B.jpg">
				<p>
					<span class="productName">벙커침대</span><span class="productBrand">이케아</span>
				</p>
				<p>
					<span class="productPrice">132,000원</span>
				</p>
			</div>
			<div class="product col">
				<img class="productImg"
					src="${path }/resources/images/1524445081477_iT6B.jpg">
				<p>
					<span class="productName">벙커침대</span><span class="productBrand">이케아</span>
				</p>
				<p>
					<span class="productPrice">132,000원</span>
				</p>
			</div>
			<div class="product col">
				<img class="productImg"
					src="${path }/resources/images/1524445081477_iT6B.jpg">
				<p>
					<span class="productName">벙커침대</span><span class="productBrand">이케아</span>
				</p>
				<p>
					<span class="productPrice">132,000원</span>
				</p>
			</div>
			<div class="product col">
				<img class="productImg"
					src="${path }/resources/images/1524445081477_iT6B.jpg">
				<p>
					<span class="productName">벙커침대</span><span class="productBrand">이케아</span>
				</p>
				<p>
					<span class="productPrice">132,000원</span>
				</p>
			</div>
			<div class="product col">
				<img class="productImg"
					src="${path }/resources/images/1524445081477_iT6B.jpg">
				<p>
					<span class="productName">벙커침대</span><span class="productBrand">이케아</span>
				</p>
				<p>
					<span class="productPrice">132,000원</span>
				</p>
			</div>
			<div class="product col">
				<img class="productImg"
					src="${path }/resources/images/1524445081477_iT6B.jpg">
				<p>
					<span class="productName">벙커침대</span><span class="productBrand">이케아</span>
				</p>
				<p>
					<span class="productPrice">132,000원</span>
				</p>
			</div>
			<div class="product col">
				<img class="productImg"
					src="${path }/resources/images/1524445081477_iT6B.jpg">
				<p>
					<span class="productName">벙커침대</span><span class="productBrand">이케아</span>
				</p>
				<p>
					<span class="productPrice">132,000원</span>
				</p>
			</div>
			<div class="product col">
				<img class="productImg"
					src="${path }/resources/images/1524445081477_iT6B.jpg">
				<p>
					<span class="productName">벙커침대</span><span class="productBrand">이케아</span>
				</p>
				<p>
					<span class="productPrice">132,000원</span>
				</p>
			</div>
		</div>

	</div>

	<div class="col-md-12 padding">
		
		<div id="canvas" class="inline">
			<div id="selectListTag">
				<%-- <img src="${path }/resources/images/selectListTag.png" width="10px"> --%>
				<img id="selectListTagImg" src="${path }/resources/images/selectListTag2.png" width="20px">
			</div>
			<div id="selectList">
				<h5>로그인</h5>
				<p>로그인 하시려면 이메일과 비밀번호를 입력하세요</p>
				<span class="login_Xbutton" onclick="closeLogin();">x</span>
				<form id="login" onsubmit="return fn_login_validate();" method="post">
					<input id="userId" type="text" name="id" placeholder="id"> <input
						id="password" type="password" name="password"
						placeholder="password">
					<div style="margin-bottom: 16px;">
						<label class="saveId"><input type="checkbox" name="saveId"
							id="saveId" value="saveId">아이디저장</label> <label><input
							type="checkbox" name="autoLogin" id="autoLogin" value="autoLogin">자동로그인</label>
					</div>
					<div style="text-align: left;">
						<a href="#">아이디 / 비밀번호 찾기</a>
					</div>
					<button type="submit" id="buttonLogin">로그인</button>
				</form>
				<button type="button" id="buttonJoin">회원가입</button>
	
			</div>
			<div id="interiorSize">
				<img src="${path }/resources/images/pngwing.com.png" width="300px"
					class="interior" alt="">
			</div>
		</div>
	</div>

</div>

<script>
	// 클릭하면 z-index +1 증가, 나머지는 min만큼 -
	function frontPop() {
		$(".interior").click(function() {
			let max = 0;
			let min = $(this).css('z-index');

			$(".interior").each(function() {
				if (min > $(this).css('z-index')) {
					min = $(this).css('z-index');
				}
			})
			console.log("min : " + min);
			$(".interior").each(function() {
				$(this).css('z-index', $(this).css('z-index') - min);
				if (max < $(this).css('z-index')) {
					max = $(this).css('z-index');
				}
			})

			$(this).css('z-index', ++max);
			console.log($(this).css('z-index'));
		})
	}

	// 더블클릭하면 방향 전환
	function de180() {
		$(".interior").dblclick(function() {
			if ($(this).css('transform').indexOf('-1') != -1) {
				$(this).css({
					'transform' : 'rotate(0deg)',
					'transform' : 'scaleX(1)',
					'filter' : 'FlipH'
				});
			} else {
				$(this).css({
					'transform' : 'rotate(0deg)',
					'transform' : 'scaleX(-1)',
					'filter' : 'FlipH'
				});
			}
		})
	}

	// 카테고리 클릭-> 캔버스에 생성
	$(".product").click(
			function() {
				// DB의 해당 name을 가진 img경로를 불러오기
				let src = $(this).children('img').attr('src');
				let img = $("<img>").attr('src', src).css('width', '300px')
						.addClass("interior");
				$("#interiorSize").append(img);
				roAndDr();
				de180();
				frontPop();
			})
	$("#selectListTag").mouseenter(function() {
		$("#selectListTagImg").css('visibility', 'visible');
	})
	$("#selectListTag").mouseleave(function() {
		$("#selectListTagImg").css('visibility', 'hidden');
	})
	$("#selectListTag").click(function() {
		$("#selectList").css('display', 'inline-block');
	})
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />