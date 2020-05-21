<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/product/detail.css"/>
<section>
    <div class="container-fluid" style="margin-top: 50px;">
        <div class="container">
            <ul class="detail_top">
                <li><a href="#"><i class="fas fa-home" style="color: green;"></i></a></li>
                <li><i class="fas fa-chevron-right"></i> 가구</li>
            </ul>
            <div class="detailArea">
                <div class="info">
                    <div class="headingArea">
                        <h2>${product.productName }</h2>
                    </div>
                    <div class="record_container">
                        
                        <div class="pro-name" style="font-weight: 400;">
                            <div class="starRev">
                            	<c:set var="sum" value="0"/>
		                        <c:forEach items="${review }" var="r">
		                        	<c:set var="sum" value="${sum+r.star }"/>
		                        </c:forEach>
		                        <fmt:parseNumber var= "tStar" integerOnly= "true" value= "${(sum/totalReview)-((sum/totalReview)%1) }" />
		                        <c:forEach begin="1" end="${tStar }" step="1">
		                    		<i class="fas fa-star" style="color: orange; font-size: 14px;"></i>
		                    	</c:forEach>
				                   <c:if test="${tStar != 5 }">
					                   <c:forEach begin="1" end="${5-tStar }" step="1">
					                    <i class="fas fa-star" style="color: lightgray; font-size: 14px;"></i>
					               	   </c:forEach>
				                   </c:if>
				                    <%-- ${ (sum/totalReview)-((sum/totalReview)%1)} --%>
                            </div>
                        </div>
                        <div class="record">
                            <span style="font-size:12px;color:#cc0000;font-weight:bold;">판매가</span>
                        </div>
                        <div class="record" style="width: 455px;">
                            <strong style="font-size:12px;color:#cc0000;font-weight:bold;">
                            	<fmt:formatNumber value="${product.productPrice}" pattern="0,000"/>원
                            </strong>
                        </div>
                        <div class="record">
                            <span style="font-size:12px;color:#555555;">브랜드</span>
                        </div>
                        <div class="record" style="width: 455px;">
                            <strong style="font-size:12px;color:#555555;">${product.brand }</strong>
                        </div>
                        <div class="record">
                            <span style="font-size:12px;color:#555555;">배송비</span>
                        </div>
                        <div class="record" style="width: 455px;">
                            <strong style="font-size:12px;color:#555555;">무료</strong>
                        </div>
                        <div class="quantity">
                            <label for="amount" style="margin-top: 21px;">수량</label>
                            <div class="amount-area">
                                <button class="pro-btn">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <input type="number" value="1" min="1" max="999" class="pro-cnt" id="amount" required/>
                                <button class="pro-btn"> 
                                    <i class="fas fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <div id="productPrice" class="productPrice">
                            <strong style="font-weight: bold; font-size: 12px; color: #353535;">총 상품 금액</strong>
                            <span style="font-size: 12px;">(수량) : </span>
                            <strong style="font-weight: bold; font-size: 21px;">
                            	<fmt:formatNumber value="${product.productPrice}" pattern="0,000"/>원
                            </strong>
                            (<span style="font-size: 12px;">1</span>개)
                        </div>
                        <div class="productAction">
                            <div class="product-button">
                                <button class="buy-btn">바로구매</button>
                                <button class="cart-btn">장바구니</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="imgArea">
                    <img src="${path }/resources/upload/newproduct/${product.renamedProductImg }" class="bigImg">
                    <div class="addImg">
                        <ul>
                            <li class="img-record">
                                <img src="http://placehold.it/600x500" class="subImg">
                            </li>
                            <li class="img-record">
                                <img src="http://placehold.it/600x500" class="subImg">
                            </li>
                            <li class="img-record">
                                <img src="http://placehold.it/600x500" class="subImg">
                            </li>
                            <li class="img-record">
                                <img src="http://placehold.it/600x500" class="subImg">
                            </li>
                            <li class="img-record">
                                <img src="http://placehold.it/600x500" class="subImg">
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="detail">
                <div class="tab">
                    <ul class="menu">
                        <li class="selected"><a href="#detail">DETAIL</a></li>
                        <li><a href="#information">INFORMATION</a></li>
                        <li><a href="#review">REVIEW</a></li>
                        <li><a href="#qna">Q&A</a></li>
                    </ul>
                </div>
                <div class="test">
                    1
                </div>
            </div>
            <div id="information">
                <div class="tab">
                    <ul class="menu">
                        <li><a href="#detail">DETAIL</a></li>
                        <li class="selected"><a href="#information">INFORMATION</a></li>
                        <li><a href="#review">REVIEW</a></li>
                        <li><a href="#qna">Q&A</a></li>
                    </ul>
                </div>
                <div class="test">
                    2
                </div>
            </div>
            <div id="review">
                <div class="tab">
                    <ul class="menu">
                        <li><a href="#detail">DETAIL</a></li>
                        <li><a href="#information">INFORMATION</a></li>
                        <li class="selected"><a href="#review">REVIEW</a></li>
                        <li><a href="#qna">Q&A</a></li>
                    </ul>
                </div>
				<input type="file" name="file" id="file" accept="image/*" style="display:none"/>
                <form id="review-message" method="post" action="${path }/review/reviewEnd" enctype="multipart/form-data" onsubmit="return valiwrite();">
                	<input type="hidden" name="rename" id="rename"/>
                	<input type="hidden" name="original" id="original"/>
                	<input type="hidden" name="no" value="${product.productNo }"/>
                	<input type="hidden" name="userId" value="${loginMember.userId }"/>
                <div class="review-container">
                    <div>
                            <textarea class="review-message" name="reContent" id="reContent" placeholder="고객님의 소중한 제품 리뷰를 남겨주세요"></textarea>
                    </div>
                    <div class="review-photo" >
                        <ul class="ul-photo">
                            
                        </ul>
                    </div>
                </div>
                <div class="review-submit">
                    <div class="review-camara" style="cursor: pointer;" onclick="file.click();">
                        <span class="review-img">
                            <i class="fas fa-camera"></i>
                            <div class="review-txt"> + 사진추가</div>
                        </span>
                    </div>
                    <div style="margin: 0 300px 0 213px;">
                        <div class="review-score">
                            <select name="star" id="star">
                                <option value="5" selected>
                                    ★★★★★ 아주 좋아요
                                </option>
                                <option value="4">
                                    ★★★★ 맘에 들어요
                                </option>
                                <option value="3">
                                    ★★★ 보통이에요
                                </option>
                                <option value="2">
                                    ★★ 그냥 그래요
                                </option>
                                <option value="1">
                                    ★ 별로에요
                                </option>
                            </select>
                        </div>
                    </div>
                    <button class="review-btn" type="submit">
                        <i class="far fa-check-circle" style="color: white; font-size: 26px; padding-right: 10px;"></i>
                        <span style="color: white; font-size: 20px;">리뷰 등록하기</span>
                    </button>
                </div>
                </form>
                <div class="review-summary">
                    <div class="avg-score">
                        <div class="summary-score">
                        	<fmt:formatNumber value="${sum/totalReview }" pattern="0.0"/>
                        </div>
                        <div class="review-count">
                            <c:out value="${totalReview }"/>개 리뷰 평점
                        </div>
                    </div>
                    <ul class="avg-bar">
                        <li>
                            <div style="font-size: 12px;">
                                <div class="avg-title">
                                    5 stars
                                </div>
                                <div class="avg-status">
                                    (<c:out value="${fiveStar }"/>)
                                </div>
                                <div class="star-guage">
                                    <div class="persent" style="width: ${fiveStar/totalReview*100}%;"></div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div style="font-size: 12px;">
                                <div class="avg-title">
                                    4 stars
                                </div>
                                <div class="avg-status">
                                    (<c:out value="${fourStar }"/>)
                                </div>
                                <div class="star-guage">
                                    <div class="persent" style="width: ${fourStar/totalReview*100}%;"></div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div style="font-size: 12px;">
                                <div class="avg-title">
                                    3 stars
                                </div>
                                <div class="avg-status">
                                    (<c:out value="${threeStar }"/>)
                                </div>
                                <div class="star-guage">
                                    <div class="persent" style="width: ${threeStar/totalReview*100}%;"></div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div style="font-size: 12px;">
                                <div class="avg-title">
                                    2 stars
                                </div>
                                <div class="avg-status">
                                    (<c:out value="${twoStar }"/>)
                                </div>
                                <div class="star-guage">
                                    <div class="persent" style="width: ${twoStar/totalReview*100}%;"></div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div style="font-size: 12px;">
                                <div class="avg-title">
                                    1 stars
                                </div>
                                <div class="avg-status">
                                    (<c:out value="${oneStar }"/>)
                                </div>
                                <div class="star-guage">
                                    <div class="persent" style="width: ${oneStar/totalReview*100}%;"></div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="review-container2">
                    <span style="color: #333333; font-size: 16px;">
                        <strong style="font-weight: bold;">최신순</strong>
                        <span style="color: #333333;font-size: 16px;">
                            리뷰 (<c:out value="${totalReview }"/>)
                        </span>
                    </span>
                </div>
                <c:if test="${not empty review }">
                	<c:forEach items="${review }" var="r">
                		<div class="review-container3">
		                    <div class="info-container">
		                        <ul>
		                            <li>
		                                <div class="info-title">
		                                    	작성자
		                                </div>
		                                <div class="info-value">
		                                    	<c:out value="${r.userId }"/>
		                                </div>
		                            </li>
		                            <li>
		                                <div class="info-title">
		                                    	작성일
		                                </div>
		                                <div class="info-value">
		                                    <fmt:formatDate value="${r.writeDate }" pattern="yyyy.MM.dd"/>
		                                </div>
		                            </li>
		                        </ul>
		                    </div>           
		                    <c:forEach begin="1" end="${r.star }" step="1">
		                    	<i class="fas fa-star" style="color: orange; font-size: 14px;"></i>
		                    </c:forEach>
		                    <c:if test="${r.star != 5 }">
			                    <c:forEach begin="1" end="${5-r.star }" step="1">
			                    	<i class="fas fa-star" style="color: lightgray; font-size: 14px;"></i>
			                    </c:forEach>
		                    </c:if>
		                    <span style="margin-left: 9px; font-size: 14px; color: gray;">- 아주 좋아요</span>
		                    <div class="review-content">
		                        <p><c:out value="${r.content }"/></p>
		                    </div>
		                    <c:if test="${not empty r.reviewImg }">
		                    	<c:if test="${fn:contains(r.renameImg, ',') }">
		                    		<c:set var="reImg" value="${fn:split(r.renameImg, ',') }"/>
				                    <div>
				                        <ul class="review-content-img">
				                        	<c:forEach items="${reImg }" var="re">
					                            <li>
					                                <img class="review-size" src="${path }/resources/upload/review/${re}">
					                            </li>
				                            </c:forEach>
				                        </ul>
				                    </div>
				            	</c:if>
				            	<c:if test="${not fn:contains(r.renameImg, ',') }">
					            	<div>
					                    <ul class="review-content-img">
						                    <li>
						                        <img class="review-size" src="${path }/resources/upload/review/${r.renameImg}">
						                    </li>
					                    </ul>
					                </div>
				            	</c:if>
			            	</c:if>     
                		</div>
		        	</c:forEach>
                </c:if>
                <div style="clear:both;">
                    ${repageBar }
                </div>
            </div>
            <div id="qna">
                <div class="tab">
                    <ul class="menu">
                        <li><a href="#detail">DETAIL</a></li>
                        <li><a href="#information">INFORMATION</a></li>
                        <li><a href="#review">REVIEW</a></li>
                        <li class="selected"><a href="#qna">Q&A</a></li>
                    </ul>
                </div>
                <div class="test review" style="line-height: 18px;">
                    <h3>Q&A</h3>
                    <p class="desc">상품에 대해 궁금한 점을 해결해 드립니다.</p>
                    <table class="table" style="margin-top: 10px; font-size: 12px; text-align:center;">
                        <colgroup>
                            <col style="width:70px;">
                            <col style="width:auto">
                            <col style="width:100px;">
                            <col style="width:100px;">
                            <col style="width:80px;">
                        </colgroup>
                        <thead>
                            <tr>
                              <th>번호</th>
                              <th>제목</th>
                              <th>작성자</th>
                              <th>작성일</th>
                              <th>조회</th>
                            </tr>
                          </thead>
                          <tbody>
                          <c:if test="${not empty qna }">
	                          <c:forEach items="${qna }" var="q" varStatus="vs">
	                          	<tr class="nbg">
	                              <td><c:out value="${q.qnaNo }"/></td>
	                              <c:if test="${q.replyLevel == 0 }">
		                              <td style="text-align:left;">
		                              	<a href="javascript:void(0)">
		                              		<i class="fas fa-lock"></i> <c:out value="${q.title }"/>
		                              	</a>
		                              </td>
	                              </c:if>
	                              <c:if test="${q.replyLevel == 1 }">
	                              	<td style="text-align:left;">
		                              	<a href="javascript:void(0)">
		                              		<img src="${path }/resources/images/reply.PNG"/>
		                              		<i class="fas fa-lock"></i> <c:out value="${q.title }"/>
		                              	</a>
		                              </td>
	                              </c:if>
	                              <td><c:out value="${q.userId }"/></td>
	                              <td><c:out value="${q.writeDate }"/></td>
	                              <td><c:out value="${q.readCount }"/></td>
	                            </tr>
	                            <tr class="box_cnt" id="qna_block${vs.count }">
	                            	<td colspan="5">
	                            		<div style="text-align:left;">
	                            			<div class="qna-reply-container">
	                            				<div style="padding: 15px 15px 15px 80px;line-height: 20px;width: 250px;">
	                            					<span style="color: red;">비공개 글 입니다.</span>
	                            					<br>
	                            						글 작성시 입력한 비밀번호를 입력해주세요.
	                            					<br>
	                            				</div>
	                            				<input type="password" size="15" id="qna_check" name="qna_check" class="qna_check">
	                            				<input type="button" value="확인" class="check_btn" onclick="qna_rock(${q.qnaNo},'${q.content }');"/>
	                            				<c:if test="${loginMember.status == 3 and q.replyLevel == 0}">
		                            				<div style="float:right;">
		                            					<input type="button" value="답변하기" onclick="location.href='${path}/qna/qnaReply?no=${product.productNo}&qna=${q.qnaNo }&title=${q.title }'">
		                            				</div>
	                            				</c:if>
	                            			</div>
	                            			<div class="reply-box">
	                            				 
	                            			</div>
	                            		</div>
	                            	</td>
	                            </tr>
	          				  </c:forEach>
          				  </c:if>
          				  <c:if test="${empty qna }">
          				  	<tr>
          				  		<td colspan="5" style="text-align:center;">등록된 게시물이 존재하지 않습니다.</td>
          				  	</tr>
          				  </c:if>
                          </tbody>
                    </table>
                    <p class="base-btn">
                        <a href="${path }/qna/qnaForm?no=${product.productNo}" class="write-btn">글쓰기</a>
                    </p>
                    <div id="pagebar" style="clear:both;">
                    	${pageBar }
                    </div>
                </div>
            </div>
            <a href="#" class="gotop" style="text-align: center;">
                <i class="fas fa-chevron-up" style="display: block; color: white; padding-bottom: 7px;"></i>
                TOP
            </a>
        </div>
    </div>
</section>
    <script>
        $(function(){
    		$(window).scroll(function(){
                var height = $(document).scrollTop();
                if(height>=600){
                    $(".gotop").css({
                        display:"block",
                        opacity:1
                    })
                }else{
                    $(".gotop").css({
                        display:"none",
                        opacity:0,
                        transition:"opacity 1s"
                    })
                }
    		});
            $(".amount-area>input").focus(function(){
                $(".amount-area").css({
                    border:"2px solid #0058a3",
                    "border-radius":"4px"
                });
            })
            $(".amount-area>input").blur(function(){
                $(".amount-area").removeAttr("style");
            })
            if($(".amount-area>input").attr("value")==1){
                $(".fa-minus").css("opacity", "0.4");
            }
            $(".fa-plus").parent().click(function(){
                var cnt=$(".amount-area>input").attr("value");
                $(".amount-area>input").attr("value",parseInt(cnt)+1);
                if($(".amount-area>input").attr("value")>1){
                    $(".fa-minus").removeAttr("style");
                }
                var price=$("#productPrice strong").eq(1).html();
                var temp=parseInt(price.replace(/\,/g,''));
                var total=temp+${product.productPrice};
                
                $("#productPrice strong").eq(1).html(total.toLocaleString()+"원");
                $("#productPrice span:last").html(parseInt(cnt)+1);
            })
            $(".fa-minus").parent().click(function(e){
                var cnt=$(".amount-area>input").attr("value");
                if(cnt==1){
                    e.preventDefault();
                    $(".fa-minus").css("opacity", "0.4");
                }else{
                    cnt--;
                    if(cnt==1){
                        e.preventDefault();
                        $(".fa-minus").css("opacity", "0.4");
                    }
                    $(".amount-area>input").attr("value",cnt);
                    var price=$("#productPrice strong").eq(1).html();
                    var temp=parseInt(price.replace(/\,/g,''));
                    var total=temp-${product.productPrice};
                    
                    $("#productPrice strong").eq(1).html(total.toLocaleString()+"원");
                    $("#productPrice span:last").html(cnt);
                }
            });
            var img=1;
            var preview;
            function rename(){
            	var formData = new FormData();
				//첫번째 파일태그
				formData.append("uploadfile",$("input[id=file]")[0].files[0]);
				//console.log($("input[id=file]")[0].files[0]);
             	var title;
             	var alt;
                // ajax
                $.ajax({
                    type:'POST',
                    url:'${path}/review/reviewImg',
                    data:formData,
                    processData: false,
                    contentType: false,
                    async: false,
                    success : function(data, textStatus, xhr) {
                    	//console.log(data.renamed);
                        title=data.renamed;
                        alt=data.original;
                        
                    },
                    error : function(request,status,error) {  
                       alert("code:"+request.status+"\n"+"error:"+error);
                    }
                });
                return [title, alt];
            }
            /* function original(){
            	var formData = new FormData();
				//첫번째 파일태그
				formData.append("uploadfile",$("input[id=file]")[0].files[0]);
				//console.log($("input[id=file]")[0].files[0]);
             	var alt;
                // ajax
                $.ajax({
                    type:'POST',
                    url:'${path}/review/reviewImg',
                    data:formData,
                    processData: false,
                    contentType: false,
                    async: false,
                    success : function(data, textStatus, xhr) {
                    	//console.log(data.renamed);
                        alt=data.original;
                        
                    },
                    error : function(request,status,error) {  
                       alert("code:"+request.status+"\n"+"error:"+error);
                    }
                });
                return alt;
            } */
            $(".review-photo").hide();
            $("#file").change({param_img : img},function(event){ 
            	$(".review-photo").show();
            	
                
            	var get_file = event.target.files;
                var image = document.createElement('img');
                var renames = rename();
                image.title=renames[0];
                image.alt=renames[1];
                console.log(get_file[0].name);
            
                /* FileReader 객체 생성 */
                var reader = new FileReader();
         
                /* reader 시작시 함수 구현 */
                reader.onload = (function (aImg) {
                    return function (event) {
                        /* base64 인코딩 된 스트링 데이터 */
                        aImg.src = event.target.result;
                        $(aImg).addClass("img-size");
                    }
                })(image)
                if(get_file){
                    /* 
                        get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
                        onload 에 설정했던 return 으로 넘어간다.
                                                이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
                    */
                    reader.readAsDataURL(get_file[0]);
                }
                
            	if(!$(".ul-photo").children().is("li")){
	            	var div = $(".ul-photo").append($("<li>").append("<div class='img-wrap'>"));
	            	var img = $(div).children().children(".img-wrap");
	            	//$(img).append($("<input type='file' name='file[]' id='files' style='display:none;'>"));
            		$(img).append(image).after("<div class='img-remove' onclick='delete_img();'>삭제");
            	}else if($(".ul-photo").children().is("li")){
                	var div = $(".ul-photo").append($("<li>").append("<div class='img-wrap'>"));
                	var img = $(div).children().children(".img-wrap");
            		$(img).last().append(image).after("<div class='img-remove' onclick='delete_img();'>삭제");
            	}
            	
            })
            $("#reContent").click(function(){
            	if(${loginMember eq null or loginMember == ""}){            		
            		var result = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
            		if(result){            			
            			$("#header ol li:last a#login").click();
            		}
            		$("#reContent").blur();
            	}
            })
            
            $("#file").click(function(){
            	if($(".ul-photo").children("li").length == 4){
            		alert("리뷰 사진은 최대 4장까지 첨부가능합니다.");
            		return false;
            	}
            })
            $(".nbg").click(function(){
            	//console.log($(event.target).parent().parent().next().find('.qna-reply-container').html());
            	$(event.target).parent().parent().next().slideDown(500);
            	$(".box_cnt").not($(event.target).parent().parent().next()).slideUp(
	                  500);
            });
            
        	$(".check_btn").click(function(){
    		if($(this).prev().val().trim()==""){
				alert("비밀번호를 입력해주세요");
				return false;
			}
    	})
     });
        function qna_rock(no, content){
        	var div = $(event.target).parent().parent().children().eq(0);
    		var temp = $(div).html();
        	
        	$.ajax({
        		url:"${path}/qna/qnaRock",
        		type:"POST",
    			data:{"pass":$(event.target).prev().val(),
    				  "no":no,
    				  "content":content},
    			success:function(data){
    				console.log(data);
    				if(!data.flag && data.pass != ""){
    					alert("비밀번호가 일치하지 않습니다.");
    				}else{
    					$(div).html(data.content);
    				}
    				
    			},
    			error : function(request, status) {
					
					if (request.status == 404)
						//$("#content").append(request.status);
						alert("페이지를 찾을 수 없습니다.");
				}
    			
    		});
      		
        }
        function delete_img(){
        	$(event.target).parent().remove();
        	if(!$(".ul-photo").children().is("li")){
        		$(".review-photo").css("display","none");
        	}
        	var rename = $(event.target).parent().children(".img-wrap").children().attr("title");
        	console.log(rename);
        	// ajax
            $.ajax({
                type:'POST',
                url:'${path}/review/deleteImg',
                data:{"rename":rename},
                success : function(data, textStatus, xhr) {
                    console.log(data);
                },
                error : function(request,status,error) {  
                   alert("code:"+request.status+"\n"+"error:"+error);
                }
            });
        }
        $("#review-message").submit(function(){
        	var rename = new Array();
        	var original = new Array();
        	
        	$(".img-wrap img").each(function(index,item){
        		rename.push(item.title);
        		rename.join(",");
        		original.push(item.alt);
        		original.join(",");
        	})
        	$("#rename").val(rename);
        	$("#original").val(original);
        })
        function valiwrite(){
        	if(${loginMember eq null or loginMember == ""}){            		
        		var result = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
        		if(result){            			
        			$("#header ol li:last a#login").click();
        		}
        		return false;
        	}else if($("#reContent").val().trim()==""){
        		alert("리뷰 내용을 작성해주세요");
        		return false;
        	}
        }
        
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />