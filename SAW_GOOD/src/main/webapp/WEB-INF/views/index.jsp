<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="https://fonts.googleapis.com/css2?family=Karla:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${path }/resources/css/index.css"/>
<style>
	
	/* 펀딩 상품 css */
	#category-nav{
		padding: 0 50px;
		margin: 10% 0 15% 0;
		position:relative;
	}
	#category-nav>.row{
		height:400px;
	}
	#category-nav img{
		height:400px;
		object-fit:cover;
	}
	.text-container{
		text-align:center;
		position:relative;
		padding-top:80px;
		
	}
	.text-container p{
		text-transform: uppercase;
	    letter-spacing: 0.115em;
	    font-size: 0.9375rem;
	    margin-bottom: 20px;
	}
	.text-container a{
		font-size: 3.4375rem;
		letter-spacing: 0em;
		
	}
	.text-container h2{
		margin: 30px 0;
		line-height: 1.7;
		font-weight: 400;
	}
	.text-container button{
		text-decoration: none;
	    padding: 15px 70px;
	    border: 1px solid #808080;
	    display: inline-block;
	    text-transform: uppercase;
	    letter-spacing: 0.115em;
	    font-family: "Tw Cen W01 Light", sans-serif;
	    font-size: 14px;
	    font-size: 0.875rem;
	    transition: color ease 350ms, background ease 350ms;
	}
	.text-container button:hover{
		color: white;
		background: black;
	}
	/* 펀딩 끝 */

    /* 타이핑 텍스트 */
    .typing-txt {
        display: none;
        font-size: 17px;
        position: relative;
        /* top: 200px; */
        font-weight: bold;
    }
    
    .typing {
    	position: relative;
    	top: 50px;
    	text-align: center;
    }

    .typing>ul {
        list-style: none;
        text-align: center;
    }

    .typing ul li {
        display: block;
    }

    .typing ul li.on {
        display: inline-block;
        animation-name: cursor;
        animation-duration: 1s;
        animation-iteration-count: infinite;
    }

    @keyframes cursor {
        0% {
            border-right: 1px solid #fff;
        }

        50% {
            border-right: 1px solid #000;
        }

        100% {
            border-right: 1px solid #fff;
        }
    }

	.typing li:first-child {
		font-size: 20px;
		color: gray;
		margin-bottom: 10px;
		letter-spacing: 5px;
	}
	.typing li:last-child {
		font-size: 70px;
		font-weight: bolder;
		letter-spacing: 10px;
	}
	
	section {
		font-family: 'Karla', sans-serif;
	}

	/* oneStep */
	#one {
		margin-top: 15%;
		cursor: pointer;
	}
	.oneTitle {
		font-size: 50px;
		font-weight: bolder;
		color: gray;
	}
	.oneSub1 {
		font-size:35px;
		letter-spacing: 6px;
		font-weight: bolder;
		margin-left: 10px;
	}
	.topBorder {
		border-top: solid 4px gray;
	}
	.oneSub2 {
		margin-top: 10px;
		margin-left: 40px;
		color: gray;
		margin-bottom: 20px;
		letter-spacing: 1px;
	}
	
	#oneHide p{
		margin-left: 40px;
		letter-spacing: 1px;
		line-height: 20px;
		color: gray;
	}
	.hideP {
		display: none;
	}
	
	/* two */
	#two {
		margin-top: 15%;
		margin-bottom: 10%;
	}
	#two h2 {
		text-align: center;
		font-size: 32px;
		letter-spacing: 7px;
		font-weight: 400;
		margin-bottom: 5%;
	}

	/* three */
	#three h2 {
		/* margin: 0 auto; */
		text-align: center;
		letter-spacing: 5px;
		font-size: 25px;
		margin-bottom: 25px;
	}
	
	.objectImg {
		width: 100%;
	}
	
	.objectName {
		margin-top: 10px;
		text-align: center;
		font-weight: bolder;
	}
	.objectPrice {
		margin-top: 10px;
		text-align: center;
	}
	
	.rotate {

       -webkit-transform: rotate(90deg);
       -moz-transform: rotate(90deg);
       -ms-transform: rotate(90deg);
       -o-transform: rotate(90deg);
       transform: rotate(90deg);
	}
	
	#newCategory {
		text-align: center;
		margin-bottom: 50px;
	}
	
	
	#new {
		margin-bottom: 70px;
	}
	
	.categoryTag {
		color: gray;
		padding-bottom: 5px;
	}
	.selectTag {
		color: black;
		border-bottom: solid 1px gray;
	}
	
	.categoryTag:hover {
		color: black;
		border-bottom: solid 1px gray;
		cursor: pointer;
	}
	
/* 	#newCategory .categoryTag:first-child {
		color: black;
		border-bottom: solid 1px gray;
	} */
	
	#newFunding .object {
		display: none;
	}
	#newAuction .object {
		display: none;
	}
	.funding-item{
		position:relative;
	}
	
	
	
}
	
	

</style>

<section>

	<div class="container">

		<ul class="typing-txt">
			<li>[쏘:굿]</li>
			<li>SAW&nbsp;GOOD</li>
		</ul>

		<div class="typing">
			<ul>
				<li>&nbsp;</li>
				<li>&nbsp;</li>
			</ul>
		</div>

		<div id="one" class="col-md-12">
			<div class="row">
				<div id="one1" class="col-md-4">
					<p>
						<span class="oneTitle">P</span>
						<span class="oneSub1"><span class="topBorder">ro</span>duct</span>
					</p>
					<p class="oneSub2">Special furniture for you</p>
				</div>
				<div id="one2" class="col-md-4">
					<p>
						<span class="oneTitle">F</span>
						<span class="oneSub1"><span class="topBorder">un</span>ding</span>
					</p>
					<p class="oneSub2">Unique furniture for you</p>
				</div>
				<div id="one3" class="col-md-4">
					<p>
						<span class="oneTitle">A</span>
						<span class="oneSub1"><span class="topBorder">uc</span>tion</span>
					</p>
					<p class="oneSub2">Rare furniture for you</p>
				</div>
			</div>
			<div id="oneHide" class="row">
				<div class="hideP col-md-4">
					<p>
						A store where you can order<br/>
						products of multiple brands at<br/>
						once.
					</p>
				</div>
				<div class="hideP col-md-4">
					<p>
						Get furniture from craftsmanship<br/>
						that's nowhere to be found with<br/>
						sponsorship.
					</p>
				</div>
				<div class="hideP col-md-4">
					<p>
						You can get someone else's<br/>
						rare furniture through<br/>
						competition.
					</p>
				</div>
			</div>
		</div>
		
		<div id="two" class="col-md-12">
			<h2>INTRODUCE OUR WEB SITE</h2>
			<img src="${path }/resources/images/main.png" width="100%">
		</div>
		
	</div>
</section>


<section class="container-fluid" id="category-nav"> 
    <div class="mouse-cursor" >
        		<div class="left"></div>
        		<div class="right"></div>
     </div>
    <c:forEach items="${nF}" var ="f" varStatus="status">
        
        <div class="row funding-item" id="f-item${status.index }">
        
        	
            <img src="${path }/resources/images/funding/${f['MAINIMG']}" class ="col-md-6"/> 
            <div class="col-md-6 text-container">
            	<p>
            		${f['CATEGORY'] }
            	</p>
                <a href="${path }/funding/detail?fdNo=${f.FDNO}">
                	${f['TITLE'] }
                </a>
                <h2>
                	${f['SUBCONTENT'] }
                </h2>
                <button type="button" onclick="location.href='${path }/funding/detail?fdNo=${f['FDNO']}'">SHOP NOW</button>
            </div>
        </div>
	</c:forEach>
</section>

<section>
	<div class="container">
		<div id="three" class="col-md-12">
			<div id="new">
				<h2>NEW ARRIVAL</h2>
				<div id="newCategory">
					<p>
						<span class="categoryTag newProductTag">Product</span>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="categoryTag newProductTag">Funding</span>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="categoryTag newProductTag">Auction</span>
					</p>
				</div>
				<div id="newList">
					<div id="newProduct" class="row">
					</div>
					<div id="newFunding" class="row">
					</div>
					<div id="newAuction" class="row">
					</div>
				</div>
			</div>
			<div id="hot">
				<h2>HOT FURNITURE</h2>
			</div>
		</div>
		
	</div>
</section>



<script>
	var item= 0;
	
	let sc = 7000;
	let click = 0;

	$(function(){
		$(".funding-item").hide();
		$("#f-item"+item).show();
		
		
	 var showHide = setInterval(function (){
			
			item++;
			ani();
			
		}, 5000);		
		 
	
	
	
	$(".left").click(function(){
		
		if(item==0){
			item = 4;
			ani();
		}else{
			item--;
			ani();
		}
	})
	$(".right").click(function(){
		
		if(item==4){
			item = 0;
			ani();
		}else{
			item++;
			ani();
		}
	})
	
	function ani(){
		if(item == 5) item =0; 
		$(".funding-item").hide();
		$("#f-item"+item).fadeIn(1000);
			
	}
})

 	function typingRepeat() {
	 
 		$(".typing").children().children().eq(0).html('&nbsp;');
    	$(".typing").children().children().eq(1).html('&nbsp;');

    	 // 로고 밑에 타이핑 되는 테스트
	 	var typingBool = false;
	    var typingIdx = 0;
	    var liIndex = 0;
	    var liLength = $(".typing-txt>li").length;
	
	    // 타이핑될 텍스트를 가져온다 
	    var typingTxt = $(".typing-txt>li").eq(liIndex).text();
	    typingTxt = typingTxt.split(""); // 한글자씩 자른다. 
	    if (typingBool == false) { // 타이핑이 진행되지 않았다면 
	        typingBool = true;
	        var tyInt = setInterval(typing, 100); // 반복동작 
	    }
	
	    function typing() {
	        $(".typing ul li").removeClass("on");
	        $(".typing ul li").eq(liIndex).addClass("on");
	        if (typingIdx < typingTxt.length) { // 타이핑될 텍스트 길이만큼 반복 
	            $(".typing ul li").eq(liIndex).append(typingTxt[typingIdx]); // 한글자씩 이어준다. 
	            typingIdx++;
	        } else {
	            if (liIndex < liLength - 1) {
	                //다음문장으로  가기위해 인덱스를 1증가
	                liIndex++;
	                //다음문장을 타이핑하기위한 셋팅
	                typingIdx = 0;
	                typingBool = false;
	                typingTxt = $(".typing-txt>li").eq(liIndex).text();
	
	                //다음문장 타이핑전 1초 쉰다
	                clearInterval(tyInt);
	                //타이핑종료
	
	                setTimeout(function () {
	                    //1초후에 다시 타이핑 반복 시작
	                    tyInt = setInterval(typing, 500);
	                }, 1000);
	            } else if (liIndex == liLength - 1) {
	
	                //마지막 문장까지 써지면 반복종료
	                clearInterval(tyInt);
	            }
	        }
	    }
 	}
 	typingRepeat();
 	setInterval(typingRepeat, 10000);
 	
 	$("#one").click(function() {
 		$(".hideP").toggle("slow");
 		$(".oneTitle").addClass("rotate");
 	})
 	
 	$.ajax({
 		url: "${path}/index.do",
 		success: function(data) {
 			
 			// new
 			
 			// new product
 			let np = data.np;
 			
 			np.forEach(p => {
 				let price = parseInt(p['PRODUCTPRICE']);

				// 이미지
				let img = $("<img>").addClass('objectImg').attr({'src':'${path}/resources/upload/newproduct/' + p['RENAMEDPRODUCTIMG']})
				// [브랜드] 상품 이름
				let p1 = $("<p>").addClass('objectName').append(
								$("<span>").html(p['PRODUCTNAME'])
							);
				// 가격
				let p2 = $("<p>").addClass('objectPrice').html(price+'원');

				$("#newProduct").append(
					$("<div>").addClass("object col").append(img).append(p1).append(p2)
				);
				
				
			 });
 			
 			
 			// new Funding
			let nf = data.nf;
 			
 			nf.forEach(f => {
 				let price = parseInt(f['TARGETPRICE']);

				// 이미지
				let img = $("<img>").addClass('objectImg').attr({'src':'${path}/resources/images/funding/' + f['MAINIMG']})
				// [브랜드] 상품 이름
				let p1 = $("<p>").addClass('objectName').append(
								$("<span>").html(f['TITLE'])
							);
				// 가격
				let p2 = $("<p>").addClass('objectPrice').html(price+'원');

				$("#newFunding").append(
					$("<div>").addClass("object col").append(img).append(p1).append(p2)
				);
				
			 });
 			
 			
 			
 			// new Auction
			let na = data.na;
 			
 			na.forEach(a => {
 				let price = parseInt(a['ACNOWPRICE']);

				// 이미지
				let img = $("<img>").addClass('objectImg').attr({'src':'${path}/resources/upload/auction/' + a['MAINIMG']})
				// [브랜드] 상품 이름
				let p1 = $("<p>").addClass('objectName').append(
								$("<span>").html(a['ACTITLE'])
							);
				// 가격
				let p2 = $("<p>").addClass('objectPrice').html(price+'원');

				$("#newAuction").append(
					$("<div>").addClass("object col").append(img).append(p1).append(p2)
				);
				
			 });
 			
 			$("#newCategory").find(".categoryTag:first-child").addClass("selectTag");
 			
 			
 			
 			// hot
 			
 			// hot proudct
 			
 			
 		}
 	})
 	
 	$(".newProductTag").click(function() {
 		$("#newCategory").find(".categoryTag").removeClass("selectTag");
 		$(this).addClass("selectTag");
 		
 		let tagName = $(this).html();
 		
 		switch(tagName) {
 		case "Product" :
 			$("#newProduct").find(".object").show("slow");
 			$("#newFunding").find(".object").hide("slow");
 			$("#newAuction").find(".object").hide("slow");
 			break;
 		case "Funding" :
 			$("#newProduct").find(".object").hide("slow");
 			$("#newFunding").find(".object").show("slow");
 			$("#newAuction").find(".object").hide("slow");
 			break;
 		case "Auction" :
 			$("#newProduct").find(".object").hide("slow");
 			$("#newFunding").find(".object").hide("slow");
 			$("#newAuction").find(".object").show("slow");
 			break;
 		}
 	})
 	
    
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
