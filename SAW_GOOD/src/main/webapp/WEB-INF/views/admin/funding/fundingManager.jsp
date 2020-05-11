<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/admin/common/headerAndfooter.jsp"/>

<style>
	/* 섹션(본문) */
		#titeltwo {
			padding-bottom: 30px;
			margin: 0;
		}

		/* 펀딩동의 테이블 */
		table.fundingAg tr td {
			text-align: center;
			padding: 10px 0;
		}

		table.fundingAg tr th {
			text-align: center;
			padding: 10px 0 10px 0;
		}

		table.fundingAg tr td {
			border-top: 1px solid lightgray;
		}

		table.fundingAg {
			border-radius: 20px;
			height: 100%;
			width: 100%;
			border-bottom: 1px solid black;
			border-top: 1px solid black;
		}

		/* 버튼 */
		.btn-black {
			padding: 0 20px;
			line-height: 30px;
			font-size: 15px;
			color: #fff;
			text-align: center;
			background-color: #303030;
			border: 1px solid #303030;

		}

		/* 펀딩승인 카테고리 */
		div.subcategory:hover {
			cursor: pointer;
		}

		div.subcategory {
			position: relative;
			display: table;
			width: 100%;
			height: 100%;
			margin: 0;
			padding: 0;
			outline: 0;
			pointer-events: none;
		}

		div.subcategory>input {
			position: absolute;
			width: 100%;
			height: 100%;
			opacity: 0;
			cursor: pointer;
			pointer-events: all;

		}

		div.subcategory>input+label {
			text-align: center;
			font-weight: bolder;
			width: 100%;
			height: 100%;
			padding: 15px 0;
			margin: 0;
			border: 1px solid #eee;
			border-bottom-color: #191919;
		}

		div.subcategory>input:checked+label {
			text-align: center;
			font-weight: bolder;
			width: 100%;
			height: 100%;
			padding: 15px 0;
			margin: 0;
			border: 1px solid #191919;
			border-bottom-color: #eee;
		}

		/* 검색창 */
		#search {
			width: 100%;
		}

		#search tr td {
			border: 1px solid black;
			padding: 5px 0;
		}

		#search tr th {
			border: 1px solid black;
			padding: 10px;
		}

		#search_title {
			width: 80%;
			display:inline-block;
		}

		#search_writer {
			display: none;
			width: 80%;
		}

		#search_date {
			display: none;
			width: 80%;
		}

		div[id^="search"]>input[type="text"] {
			padding: 2px 0;
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
            border: 1px solid green;
        }


        form ul {
            list-style: none;
        }

        label {
            cursor: pointer;
            display: inline-block;
        }
</style>

<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
			<h2 id="titeltwo">Funding Manager</h2>
			<div class="container-fluid" style="padding-bottom:40px" id="category">
				<div class="row">
					<div class="col-sm-6 subcategory">
						<input type="radio" name="category" value="disagree" checked />
						<label for="category">승인대기</label>
					</div>
					<div class="col-sm-6 subcategory">
						<input type="radio" name="category" value="disagree" />
						<label for="category">승인완료</label>
					</div>
				</div>
			</div>
			<div class="container-fluid" style="margin-bottom: 30px;">
				<div class="col-md-8">
						<table id="search">
							<colgroup>
								<col width="20%">
								<col width="auto">
							</colgroup>
							<tr>
								<th>통합검색</th>
								<td>
									<select name="search_Type" style="padding:3px;margin-left:10px" id="search_Type">
										<option value="title">제목</option>
										<option value="writer">작성자</option>
										<option value="date">작성일</option>
									</select>
									<div id="search_title">
										<form action="#" method="get">
											<input type="hidden" name="searchType" value="title">
											<input type="text" name="keyword" placeholder="제목을 입력해주세요"
												style="width:60%">
											<button type="submit" class="btn-black">검색</button>
										</form>
									</div>
									<div id="search_writer">
										<form action="#" method="post">
											<input type="hidden" name="searchType" value="writer">
											<input type="text" name="keyword" placeholder="작성자 입력해주세요"
												style="width:60%">
											<button type="submit" class="btn-black">검색</button>
										</form>
									</div>
									<div id="search_date">
										<form action="#" method="post">
											<input type="hidden" name="searchType" value="date">
											<input type="text" name="keyword" placeholder="날짜를 입력해주세요"
												style="width:60%">
											<button type="submit" class="btn-black">검색</button>
										</form>
									</div>
								</td>
						</table>
				</div>
			</div>
			<script>
				$(function () {
					$("#search_Type").change(function () {
						let val = $("#search_Type").val();
						let title= $("#search_title");
						let writer=$("#search_writer");
						let date=$("#search_date");
						title.hide();
						writer.hide();
						date.hide();
						$("#search_" + val).css("display", "inline-block");
					})
				})
			</script>
			<div class="container-fluid">
				<div class="col-md-12" style="height:auto;">
					<form action="#" method="post" onsubmit="">
						<div class="row">
							<div class="col-md-8">
								<button class="btn-black" type="button">승인</button>
								<button class="btn-black" type="button">거부</button>
							</div>
							<div class="col-md-4" style="text-align: right;padding-bottom: 20px;">
								<select name="agreement" style="font-size: 14px;">
									<option value="10">10개씩보기</option>
									<option value="20">20개씩보기</option>
									<option value="30">30개씩보기</option>
								</select>
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
								<th scope="col">
									<input type="checkbox" name="fundcheck" id="allck"><label for="allck"></label>
								</th>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">첨부파일</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">승인여부</th>
							</tr>
							<tr>
								<td><input type="checkbox" name="fundcheck" id="fund1"><label for="fund1"></label></td>
								<td>1</td>
								<td><img src="${path }/resources/images/chair.jpg"/>
									<a href="${path }/admin/fundingView">안녕</a>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<button class="btn-black" type="button">승인</button>
									<button class="btn-black" type="button">거부</button>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="fundcheck" id="fund2"><label for="fund2"></label></td>
								<td>2</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<button class="btn-black" type="button">승인</button>
									<button class="btn-black" type="button">거부</button>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="fundcheck" id="fund3"><label for="fund3"></label></td>
								<td>3</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<button class="btn-black" type="button">승인</button>
									<button class="btn-black" type="button">거부</button>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="fundcheck" id="fund4"><label for="fund4"></label></td>
								<td>4</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<button class="btn-black" type="button">승인</button>
									<button class="btn-black" type="button">거부</button>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="fundcheck" id="fund5"><label for="fund5"></label></td>
								<td>5</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<button class="btn-black" type="button">승인</button>
									<button class="btn-black" type="button">거부</button>
								</td>
							</tr>
						</table>
				</div>
				</form>
			</div>
		</div>
	</div>
	</div>



</body>

</html>