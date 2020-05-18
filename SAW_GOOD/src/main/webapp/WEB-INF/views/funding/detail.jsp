<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet"
	href="${path }/resources/css/funding/detail.css?ver=3" />

<div class="container-fluid col-md-12" id="detail-header">
	<div class="bg-image"
		style="background-image: url(${path}/resources/images/signup2.jpg);"></div>
	<i> <c:out value="${f.category }" />
	</i>
	<h1>${f.subContent }</h1>
</div>
<section>
	<div class="container">
		<div class="col-md-12">
			<section class="row first-row">
				<div class="col-md-7 img-container" style="height: 700px;">
					<img src="${path }/resources/images/leftphoto.png" class="arrow"
						style="left: 20px;"> <img
						src="${path }/resources/images/${f.mainImg}" class="images">
					<img src="${path }/resources/images/rightphoto.png" class="arrow"
						style="right: 20px;">
				</div>
				<div id="p-table" class="col-md-5" style="height: 700px;">
					<caption>
						<h5>
							<c:set value="<%=new java.util.Date()%>" var="now" />
							<fmt:parseNumber value="${now.time / (1000*60*60*24)}"
								integerOnly="true" var="today" />
							<fmt:parseNumber value="${f.endDate.time / (1000*60*60*24)}"
								integerOnly="true" var="endDate" />
							${endDate-today} 일 남음

						</h5>
					</caption>
					<table>
						<thead>
							<tr>
								<th colspan="2">DESIGNER &nbsp;&nbsp;&nbsp; ${f.designer }</th>
							</tr>
						</thead>
						<tbody id="main-info">
							<tr>
								<td>목표금액</td>
								<td>
									<p>
										<fmt:formatNumber value="${f.targetPrice }" type="number" />
									</p> <i>원</i>
								</td>
							</tr>
							<tr>
								<td>참여인원</td>
								<td><p>
										<c:out value="${f.count }" />
									</p> <i>명 참여</i></td>
							</tr>
							<tr>
								<td>후원된 금액</td>
								<td><p>
										<fmt:formatNumber value="${f.sum }" type="number" />
									</p> <i>원</i></td>
							</tr>
							<tr>
								<td>참여율</td>
								<td><p>
										<fmt:formatNumber value="${f.sum/f.targetPrice *100}" />
									</p> <i>% 달성</i></td>
							</tr>
							<tr>
								<td colspan="2"><svg width="100%" height="3px"
										xmlns="http://w3.org/2000/svg" version="1.1"
										class="bar-container">
                                            <rect x="0" y="0"
											width="${f.sum/f.targetPrice *100}%" height="3px" class="bar" />
                                        </svg></td>
							</tr>

						</tbody>

						<tbody id="sub-info">


							<tr>

								<td><input type="radio" name="reword" value="none"
									id="none"> 리워드를 선택하지 않고 후원하기</td>
								<td><input type="text" name="partPrice" id="input-price"
									placeholder="숫자만 입력" disabled="true"></td>

							</tr>
							<c:forEach items="${reword }" var="r">
								<tr>
									<td><input type="radio" name="reword" value="${r.reword }">
										<fmt:formatNumber value="${r.minimum }" type="number" />원 <input
										type="hidden" name="partPrice" value="${r.minimum }"></td>
									<td><p>${r.reword }</p> <i></i></td>
								</tr>

							</c:forEach>
						</tbody>

						<tfoot>
							<tr>
								<td colspan="2">
									<button id="buy-btn" onclick="submin()">프로젝트 밀어주기</button>
								</td>

							</tr>
						</tfoot>

					</table>

				</div>
			</section>
			<ul class="row">
				<li class="col-md-4"><span class="underline"
					onclick="select(1);">프로젝트 소개</span></li>
				<li class="col-md-4"><span onclick="select(2);">참여내역</span></li>
				<li class="col-md-4"><span onclick="select(3);">후기</span></li>
			</ul>
			<section>

				<div class="detail-select" id="project">
					<p>
					<h1>${f.subContent }</h1>
					${f.detail }

					</p>
				</div>
				<div class="detail-select" id="purchase">
					<p class="tx_total">
						총 <strong class="num">280</strong>개의 참여내역과 응원메시지가 있습니다.
					</p>
					<ul class="lst_sponser">
						<li><span class="img_thm"> <img src="" width="50"
								height="50" alt="wwiiw_img">
						</span>
							<div class="sponser_info">
								<p>
									<span class="wordBreak">이 프로젝트의 성공을 응원합니다.</span>
								</p>
								<span class="date">2020.05.10 20:31</span>
								<div>
									<span class="nick"><a style="text-decoration: none">wwiiw님</a></span>
									<span class="price"><strong class="num">45,000</strong>원
										참여</span>
								</div></li>
					</ul>
				</div>
				<div class="detail-select" id="review">
					<div id="insertReview" class="col-md-12 row">
						<textarea name="" id="insertText" class="col-md-10" cols="30"
							rows="10"></textarea>
						<button id="insertTextBtn" class="col-md-2">등록</button>
						<div id="commentList" class="col-md-12">
							<c:forEach var="c" items="${commentList}">
								<c:choose>
									<c:when test="${c.status == '1'}">
										<div class="comment delete">
                                            <p>
                                                <span class="commentUserId">${c.userId}</span>
				                                <span class="commentTime">${c.commentDate }</span>
                                            </p>
				                           	<p>삭제된 댓글입니다.</p>
											<div class="reCommentInserDiv col-md-12 row" style="display:none">
												<textarea class="reInsertText col-md-10" rows="10" cols="30"></textarea>
												<button class="reInsertTextBtn col-md-2" name="${c.seq_fc_no }">등록</button>
											</div>
											<div class="reCommentList">
												<c:forEach var="cr" items="${reCommentList }">
													<c:if test="${c.seq_fc_no == cr.seq_fc_no }">
														<c:choose>
															<c:when test="${cr.status == 1}">
																<div class="rereComment delete">
                                                                    <p>
																		<span class="reCommentUserId">담당자</span>
																		<span class="reCommentTime">${cr.commentDate }</span>
																	</p>
																	<p>삭제된 댓글입니다.</p>
                                                                </div>
															</c:when>
															<c:otherwise>
																<div class="rereComment">
																	<p>
																		<span class="reCommentUserId">담당자</span>
																		<span class="reCommentTime">${cr.commentDate }</span>
																		<span class="reCommentDelete" name="${cr.seq_fcr_no }">삭제</span>
																		<span class="reCommentUpdate" name="${cr.seq_fcr_no }">수정</span>
																	</p>
																	<p>${cr.commentText }</p>
																</div>
															</c:otherwise>
														</c:choose>
													</c:if>
												</c:forEach>
											</div>
				                        </div>
									</c:when>
									<c:otherwise>
										<div class="comment">
				                            <p>
				                                <span class="commentUserId">${c.userId}</span>
				                                <span class="commentTime">${c.commentDate }</span>
				                                <span class="commentDelete" name="${c.seq_fc_no }">삭제</span>
				                                <span class="commentUpdate" name="${c.seq_fc_no }">수정</span>
				                                <span class="reComment">댓글</span>
				                            </p>
											<p>
												${c.commentText }
											</p>
											<div class="reCommentInserDiv col-md-12 row" style="display:none">
												<textarea class="reInsertText col-md-10" rows="10" cols="30"></textarea>
												<button class="reInsertTextBtn col-md-2" name="${c.seq_fc_no }">등록</button>
											</div>
											<div class="reCommentList">
												<c:forEach var="cr" items="${reCommentList }">
													<c:if test="${c.seq_fc_no == cr.seq_fc_no }">
														<c:choose>
															<c:when test="${cr.status == '1'}">
																<div class="rereComment delete">
                                                                    <p>
																		<span class="reCommentUserId">담당자</span>
																		<span class="reCommentTime">${cr.commentDate }</span>
																	</p>
																	<p>삭제된 댓글입니다.</p>
                                                                </div>
															</c:when>
															<c:otherwise>
																<div class="rereComment">
																	<p>
																		<span class="reCommentUserId">담당자</span>
																		<span class="reCommentTime">${cr.commentDate }</span>
																		<span class="reCommentDelete" name="${cr.seq_fcr_no }">삭제</span>
																		<span class="reCommentUpdate" name="${cr.seq_fcr_no }">수정</span>
																	</p>
																	<p>${cr.commentText }</p>
																</div>
															</c:otherwise>
														</c:choose>
													</c:if>
												</c:forEach>
											</div>
				                        </div>
									</c:otherwise>
								</c:choose>
	                    	</c:forEach>
						</div>
                    </div>
                    
				</div>

			</section>
		</div>




	</div>

</section>
<script>
        function select(menu){

            var project = $("#project");
            var purchase = $("#purchase");
            var review = $("#review");
            $(event.target).parent().siblings("li").children("span").removeClass("underline");
            $(event.target).addClass("underline");
            project.css("display","none");
            purchase.css("display","none");
            review.css("display","none");
            switch(menu){
                case 1: project.css("display","block");
                        break;
                case 2: purchase.css("display","block");
                        break;
                case 3: review.css("display","block");
                        break;
            }
        }


        // 리뷰
        // 로그인한 사람 아이디
        let loginId = "${loginMember.userId}";
        let fdNo = "${f.fdNo}";
        // 로그인 되어 있으면 클릭 가능, 아니면 안됨
        $(function() {
            if('${loginMember == null}'=='true') {
                $("#review").addClass("noLogin").html("로그인 후 이용하실 수 있습니다.");
            } else {
                $("#insertTextBtn").click(function() {
                    if($("#insertText").val() != null && $("#insertText").val() != '') {
                        let content = $("#insertText").val();
                        let status = "insert";
                        $.ajax({
                            url : "${path}/funding/commentInsert.do",
                            type : "POST",
                            data : {commentStatus:status, userId:loginId, fdNo:fdNo, commentText:content, seq_fc_no:1},
                            success(data) {
                                if(data.check) {
                                    let time = data.comment.commentDate;
                                    console.log(time);
                                    time = formatDate(time);
                                    // 아이디, 작성 시간, 수정, 삭제 => p1
                                    let p1 = $("<p>").append($("<span>").addClass("commentUserId")
                                        .html('${loginMember.userId}'))
                                        .append($("<span>").addClass("commentTime").html(time))
                                        .append($("<span>").addClass("commentDelete").attr("name","" +data.comment.seq_fc_no).html('삭제'))
                                        .append($("<span>").addClass("commentUpdate").attr("name","" +data.comment.seq_fc_no).html('수정'))
                                        .append($("<span>").addClass("reComment").html("댓글"));
                                    // 내용 => p2
                                    let p2 = $("<p>").html(data.comment.commentText);
                                    // 합친다.
                                    let div = $("<div>").addClass("comment").append(p1).append(p2);

                                    // textarea 생성
                                    let reTextarea = $("<textarea>").attr({"class":"reInsertText col-md-10","cols":"30","rows":"10"});
                                    let reBtn = $("<button>").attr({"class":"reInsertTextBtn col-md-2", "name":""+data.comment.seq_fc_no}).html("등록");
                                    let reDiv = $("<div>").attr({"class":"reCommentInsertDiv col-md-12 row"}).css("display","none");
                                    reDiv.append(reTextarea).append(reBtn);
                                    div.append(reDiv);

                                    // reCommentList 생성
                                    let rereCommentDiv = $("<div>").addClass("reCommentList");
                                    div.append(rereCommentDiv);

                                    $("#commentList").append(div);
                                    
                                    

                                    $(this).next().children().children().eq(2).hide()
                                    // $(this).next().children().children().eq(3).hide();
                                    $("#insertText").val('');

                                    // reCommentCheck(loginId);
                                    reCommentOk();
                                    reCommentInsert();
                                    commentBtnsFunction();
                                } else {
                                    alert("댓글 등록 실패");
                                }
                            }
                        });
                    } else {
                        alert("댓글을 입력해주세요.");
                    }
                    
                })
            }
        })

        // 시간 포멧팅
        function formatDate(date) {
            var year = (1900 + date.year)         //yyyy
            var month = (1 + date.month);          //M
            month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
            var day = date.day;                   //d
            day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
            return  year + '.' + month + '.' + day;
        }

        // 대댓글 id 체크
        // function reCommentCheck(id) {
        //     if(id != "${f.userId}") {
        //         $(".reComment").css("display","none");
        //     }
        // }
        // reCommentCheck(loginId);
        // 대댓글 달아주기
        function reCommentOk() {
            $(".reComment").off("click").on(
					"click",
					function() {
                        // 대댓글 입력창 띄우기
                        $(this).parent().next().next().show();
                    })
        }
        function reCommentInsert() {
            $(".reInsertTextBtn").off("click").on("click", function() {
                if($(this).prev().val() != null && $(this).prev().val() != '') {
                                    
                                    let parentNo = $(this).attr('name');
                                    let content = $(this).prev().val();
                                    let nowThis = $(this);

                                    $.ajax({
                                        url : "${path}/funding/reCommentInsert.do",
                                        type : "POST",
                                        data : {userId:loginId, fdNo:fdNo, commentText:content, seq_fc_no:parentNo},
                                        success(data) {
                                            let retime = data.comment.commentDate;
                                            retime = formatDate(retime);
                                            // 아이디, 작성 시간, 수정, 삭제 => p1
                                            let p1 = $("<p>").append($("<span>").addClass("reCommentUserId")
                                                .html("담당자"))
                                                .append($("<span>").addClass("reCommentTime").html(retime))
                                                .append($("<span>").addClass("reCommentDelete").html('삭제').attr('name',data.comment.seq_fcr_no))
                                                .append($("<span>").addClass("reCommentUpdate").html('수정').attr('name',data.comment.seq_fcr_no));
                                            // 내용 => p2
                                            let p2 = $("<p>").html(nowThis.prev().val());
                                            nowThis.parent().next().show();
                                            // 합친다.
                                            let reDiv = $("<div>").addClass("rereComment").append(p1).append(p2);
                                            nowThis.parent().next().append(reDiv);

                                            nowThis.prev().val('');
                                            nowThis.parent().hide();

                                            // 버튼 기능들
                                            $(".reCommentDelete").off("click").on("click",function() {
                                                
                                                let nowThis = $(this);
                                                let thisNo = $(this).attr('name');
                                                $.ajax({
                                                    url : "${path}/funding/reCommentDelete.do",
                                                    type : "POST",
                                                    data : {userId:loginId, fdNo:fdNo, seq_fcr_no:thisNo},
                                                    success(data) {
                                                        nowThis.parent().parent().addClass("deleteComment");
                                                        deleteCheck();
                                                    }
                                                })
                                            })
                                            $(".reCommentUpdate").off("click").on("click",function() {
                                                let nowThis = $(this);
                                                nowThis.parent().next().hide();
                                                let reUpdateTextbox = $("<textarea>").addClass("updateTextbox col-md-10").val(nowThis.parent().next().html());
                                                let reUpdateTextBtn = $("<button>").addClass("reUpdateTextBtn col-md-2").html("수정");
                                                let reUpdateDiv = $("<div>").addClass("updateDiv col-md-12 row").append(reUpdateTextbox).append(reUpdateTextBtn);
                                                nowThis.parent().append(reUpdateDiv);

                                                let thisNo = $(this).attr('name');

                                                $(".reUpdateTextBtn").off("click").on("click", function() {
                                                    let nowThis = $(this);
                                                    if(nowThis.prev().val() != null && nowThis.prev().val() != '') {
                                                        $.ajax({
                                                            url : "${path}/funding/reCommentUpdate.do",
                                                            type : "POST",
                                                            data : {userId:loginId, fdNo:fdNo, seq_fcr_no:thisNo, commentText:nowThis.prev().val()},
                                                            success(data) {
                                                                nowThis.parent().parent().next().show();
                                                                nowThis.parent().parent().next().html(data.comment.commentText);
                                                                nowThis.parent().remove();
                                                            }
                                                        })
                                                        
                                                    } else {
                                                        alert("수정 내용을 입력해주세요.");
                                                    }
                                                })
                                            })
                                        }
                                    })
                                } else {
                                    alert("댓글을 입력해주세요.");
                                }
                                
                            })
        }


        function commentBtnsFunction() {

            // 삭제
            $(".commentDelete").off("click").on("click",function() {
                let nowThis = $(this);
                let parentNo = $(this).attr('name');
                $.ajax({
                    url : "${path}/funding/commentDelete.do",
                    type : "POST",
                    data : {userId:loginId, fdNo:fdNo, seq_fc_no:parentNo},
                    success(data) {
                        nowThis.parent().parent().addClass("deleteComment");
                        deleteCheck();
                    }
                })
                
            })
            // 수정
            $(".commentUpdate").off("click").on("click",function() {
                $(this).parent().next().hide();
                let updateTextbox = $("<textarea>").addClass("updateTextbox col-md-10").val($(this).parent().next().html());
                let updateTextBtn = $("<button>").addClass("updateTextBtn col-md-2").attr('name',$(this).attr('name')).html("수정");
                let updateDiv = $("<div>").addClass("updateDiv col-md-12 row").append(updateTextbox).append(updateTextBtn);
                $(this).parent().append(updateDiv);

                $(".updateTextBtn").off("click").on("click", function() {
                    if($(this).prev().val() != null && $(this).prev().val() != '') {
                        let nowThis = $(this);
                        let parentNo = $(this).attr('name');
                        $.ajax({
                            url : "${path}/funding/commentUpdate.do",
                            type : "POST",
                            data : {userId:loginId, fdNo:fdNo, commentText:nowThis.prev().val(), seq_fc_no:parentNo},
                            success(data) {
                                nowThis.parent().parent().next().show();
                                nowThis.parent().parent().next().html(data.comment.commentText);
                                nowThis.parent().remove();
                            }
                        })

                    } else {
                        alert("수정 내용을 입력해주세요.");
                    }
                })
            })
        }

        function deleteCheck() {
            $(".deleteComment").html("삭제된 댓글입니다.");
        }

        deleteCheck();
        reCommentOk();
        reCommentInsert();
        commentBtnsFunction();

        $(".reCommentDelete").off("click").on("click",function() {
                                                
                                                let nowThis = $(this);
                                                let thisNo = $(this).attr('name');
                                                $.ajax({
                                                    url : "${path}/funding/reCommentDelete.do",
                                                    type : "POST",
                                                    data : {userId:loginId, fdNo:fdNo, seq_fcr_no:thisNo},
                                                    success(data) {
                                                        nowThis.parent().parent().addClass("deleteComment");
                                                        deleteCheck();
                                                    }
                                                })
                                            })
                                            $(".reCommentUpdate").off("click").on("click",function() {
                                                let nowThis = $(this);
                                                nowThis.parent().next().hide();
                                                let reUpdateTextbox = $("<textarea>").addClass("updateTextbox col-md-10").val(nowThis.parent().next().html());
                                                let reUpdateTextBtn = $("<button>").addClass("reUpdateTextBtn col-md-2").html("수정");
                                                let reUpdateDiv = $("<div>").addClass("updateDiv col-md-12 row").append(reUpdateTextbox).append(reUpdateTextBtn);
                                                nowThis.parent().append(reUpdateDiv);

                                                let thisNo = $(this).attr('name');

                                                $(".reUpdateTextBtn").off("click").on("click", function() {
                                                    let nowThis = $(this);
                                                    if(nowThis.prev().val() != null && nowThis.prev().val() != '') {
                                                        $.ajax({
                                                            url : "${path}/funding/reCommentUpdate.do",
                                                            type : "POST",
                                                            data : {userId:loginId, fdNo:fdNo, seq_fcr_no:thisNo, commentText:nowThis.prev().val()},
                                                            success(data) {
                                                                nowThis.parent().parent().next().show();
                                                                nowThis.parent().parent().next().html(data.comment.commentText);
                                                                nowThis.parent().remove();
                                                            }
                                                        })
                                                        
                                                    } else {
                                                        alert("수정 내용을 입력해주세요.");
                                                    }
                                                })
                                            })

        $("input[name='partPrice']").click(function(){
        	if($(this).val()=='none'){
        		$("#input-price").attr("disabled",false);
        	}else{
        		$("#input-price").attr("disabled",true);
        	}
        })
		function submin(){
        	var reword=$("input[name='reword']:checked").val();
        	var partPrice ;
        	
        	if(reword=='none'){
        		partPrice = $("#input-price").val();
        	}else{
        		partPrice = $("input[name='reword']:checked").next().val();
        	}
        	location.href="${path}/funding/patronage/step1?fdNo="+${f.fdNo}+"&reword="+reword+"&minimum="+partPrice;
		}
    </script>

<script src="${path }/resources/js/funding/detail.js?ver=1"></script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />