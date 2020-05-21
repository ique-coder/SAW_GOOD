<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet"
	href="${path }/resources/css/auction/auctionWrite.css" />

<!-- 오늘 날짜 세팅 -->
<c:set value="<%=new java.util.Date()%>" var="now" />
<fmt:parseNumber value="${now.time / (1000*60*60*24)}"
	integerOnly="true" var="today"></fmt:parseNumber>
<!-- 가져온 날짜 세팅 -->
<section>
		
        <!-- <div class="container-fluid" style="margin-top: 50px;"> -->
        <div class="container" style="margin-top: 50px;">
         <form id="fAcWriter" action="${path }/auction/auctionWriterEnd" method="post" enctype="multipart/form-data">
            <div style="margin-bottom: 30px;">
                <h2 style="text-align: center; font-size: 20px;">상품 정보입력</h2>
            </div>

            <div class="detailArea">
                <div class="row">
                    <div class="col-md-6">
                    	<div class="col-md-12" id="mainImg" style="height: 80%; margin-bottom:10px;">
                    		<img src="" class="images col-md-12" /> 
                    	</div>

                         <div class="col-md-12 row" id="serveImg" style="height:20%; margin:0;">
                         	<img class="col-md-3 images" src=""/>
                         	<img class="col-md-3 images" src=""/>
                         	<img class="col-md-3 images" src=""/>
                         	<img class="col-md-3 images" src=""/>
                         </div>
                    </div>
                    <div class="col-md-6">
                        <div class="headingArea row">
                            <div class="col-md-3" style="padding : 0; padding-top: 5px;">
                                <h2>경매 제목</h2>
                            </div>
                            <div class="col-md-9">
                                <input type="text" id="acTitle" class="pilsu" style="width:80%;"
                                        name="acTitle" placeholder="제목 입력" value=""/>

                            </div>
                        </div>
                        <div class="record_container">
                            <div class="row">
                                <div class="record col-md-3">
                                    <span>상품명</span>
                                    <span>시작가격</span>
                                    <span>즉시낙찰가격</span>
                                    <span>카테고리</span>
                                    <span>상품상태(S~D)</span>
                                    <span style="margin-bottom: 15px;">종료일자</span>
                                </div>
                                <div class="record col-md-3" style="width: 750px;">
                                    <strong>
                                        <input type="text" id="acProName" class="pilsu"
                                        name="acProName" placeholder="상품명 입력" value="">
                                    </strong>
                                    <strong>
                                        <input type="text" id="acStartPrice" class="pilsu"
                                        name="asp" placeholder="시작가격 입력" value="">
                                        
                                    </strong>
                                    <strong>
                                 
                                        <input type="text" id="acImdPrice" class="pilsu"
                                        name="aip" placeholder="즉시낙찰가격" value="">
                                    </strong>
                                    <strong>
                                        <select id="acCategory" name="acCategory" class="selectStyle">
                                            <option value="">category</option>
                                            <option value="bed">bed</option>
                                            <option value="sofa">sofa</option>
                                            <option value="chair">chair</option>
                                            <option value="table">table</option>
                                            <option value="desk">desk</option>
                                            <option value="carpet">carpet</option>
                                            <option value="lug">lug</option>
                                            <option value="storage">storage</option>
                                            <option value="others">others</option>
                                        </select> 
                                    </strong>
                                    <strong style="width: 300px;">
                                   
                                         <select id="acStatusRank" name="acStatusRank" class="selectStyle">
                                            <option value="">상태선택</option>
                                            <option value="S">S급</option>
                                            <option value="A">A급</option>
                                            <option value="B">B급</option>
                                            <option value="C">C급</option>
                                            <option value="D">D급</option>
                                        </select> 
                                    </strong>
                                    <strong style="margin-bottom: 0; width: 300px;">
                                     
                                       <select id="acEndDate" name="aEDN" class="selectStyle">
                                            <option value="10">10일</option>
                                            <option value="20">20일</option>
                                            <option value="30">30일</option>
                                        </select> 
                                    </strong>
                                </div>
                            </div>
                    
                            <div class="productAction">
                                <div class="product-button">
                                    <!-- <button class="main-poto-btn">메인사진 등록</button> -->
                                    <div class="filebox">
                                    	<label for="main_file">메인사진 등록</label>
                                    	<input type="file" name="acMainImg" id="main_file" value="">
                                    	<label for="serve_file" style="background:rgb(238, 152, 124);">서브사진 등록</label>
                                    	<input type="file" name="acServeImg"id="serve_file" value="" multiple required>
                                    </div>
                                    <!-- <button class="serve-poto-btn">서브사진 등록</button> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>

            <div id="detail">
                <div class="tab">
                    <h2 style="text-align: center; font-size: 20px;">상품상세 정보입력</h2>
                </div>
                <div class="row">
                    <div class="col-md-6 pro-info-wrap">
                        <h2>information</h2>
                        <ul id="pro-info">
                            <li>
                                <div class="pro-info-title">치수(가로*세로*높이(mm))</div>
                                <div class="pro-info-content">
                                  &nbsp&nbsp<input type="text" id="acProSize" class="pilsu"
                                    name="acProSize" placeholder="예) 200*200*200" 
                                    value="">
                       
                                </div>
                            </li>
                            <li>
                                <div class="pro-info-title">브랜드</div>
                                <div class="pro-info-content">
                                    &nbsp&nbsp<input type="text" id="acBrand" class="pilsu"
                                    name="acBrand" placeholder="예) 이케아" 
                                    value="">
                                </div>
                            </li>
                            <li>
                                <div class="pro-info-title">구매일</div>
                                <div class="pro-info-content">
                                    &nbsp&nbsp<input type="text" name="acBuyDate" 
                                    placeholder="예) 2020년도" value="">
                                </div>
                            </li>
                            <li>
                                <div class="pro-info-title">새 상품 사이트</div>
                                <div class="pro-info-content">
                                    &nbsp&nbsp<input type="text" id="pro-url" class="pilsu"
                                    name="acProUrl" placeholder="새 새상품 사이트 입력" value="">
                                </div>
                            </li>


                        </ul>
                        <h2>content</h2>
                        <table style="margin-bottom: 40px;">
                            <colgroup>
                                <col style="width:100px;">
                                <col style="width:auto">
                            </colgroup>
                            <!-- <thead>
                                <tr>
                                    <th colspan="2" class="pro-">product content
                                    </th>
                                </tr>
                            </thead> -->
                            <tbody>
                                <tr>
                                    <td>제품명</td>
                                    <th>※ 위에 상품정보 상품명 입력</th>
                                </tr>
                                <tr>
                                    <th style="vertical-align: middle;">제품설명</th>
                                    <td>
                                        <p><textarea cols="70" rows="3" name="acComent"></textarea></p>
                                    </td>
                                </tr>
                                <tr>
                                    <th>제품상태</th>
                                    <td>※ 위에 상품정보 체크
                                    </br></br>※ 아래의 "STATUS RANK 목록"을 확인하시기 바랍니다.
                                    </td>
                                </tr>
                          
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-6 pro-info-wrap" style="margin-top: 70px;">
                        <h2 style="margin-top: 15px;">status rank
                        </h2>
                        <table>
                            <colgroup>
                                <col style="width:100px;">
                                <col style="width:auto">
                            </colgroup>
                            <!-- <thead>
                                <tr>
                                    <th colspan="2" >Product status</th>
                                </tr>
                            </thead> -->
                            <tbody>
                                <tr>
                                    <th>S급</th>
                                    <td>
                                        사용하지 않은 제품입니다. 상자,
                                        케이스가없는 사용하지 않은 제품도 포함
                                    </td>
                                </tr>
                                <tr>
                                    <th>A급</th>
                                    <td>
                                        중고품 중에서도 사용감을 느낄 수없는 아주 깨끗한 제품입니다.
                                         흠집, 오염이 거의없는 중고품이라고 생각합니다.
                                    </td>
                                </tr>
                                <tr>
                                    <th>B급</th>
                                    <td>
                                        중고품 중에서도 깨끗한 상품입니다.
                                        약간의 상처 나 얼룩이 있지만, 사용감이 적게 느껴지는 제품입니다.
                                    </td>
                                </tr>
                                <tr>
                                    <th>C급</th>
                                    <td>
                                        상처, 얼룩이 조금 있고,
                                        사용 흔적을 느낄 수 있지만 상태가 좋은 일반적인 중고품입니다.
                                    </td>
                                </tr>
                                <tr>
                                    <th>D급</th>
                                    <td>
                                        상처, 얼룩이 많지만, 사용에 문제가없는 중고품입니다.
                                    </td>
                                </tr>
                          
                            </tbody>
                        </table>
                        <div class="textWriter">
                            <div class="product-button">
                                <button type="button" id="acWriter" class="writer-btn">글 작성</button>
                                <button class="cancel-btn">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </div>


    </section>
    <script>
    
   
    
    var viewImg;
    $(function(){
    	
		$("#main_file").on("change",mainImg);
		$("#serve_file").on("change",serveImg)
	})
	function mainImg(e){
			var files=e.target.files;
			var fileArr=Array.prototype.slice.call(files);
			$("#mainImg").find($("img")).remove();
			fileArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("이미지 파일만 등록해주세요!");
					$("#main_file").val("");
					$("#mainImg").find($("img")).remove();
					return;
				}
				viewImg=f;
				var reader=new FileReader();
				reader.onload=function(e){
					console.log(e.target);
					$("#mainImg").append($("<img>").attr({"src":e.target.result,
						"class":"images"}));
				}
				reader.readAsDataURL(f);
			});
		}
    var multiView=[];
	function serveImg(e){
		var files=e.target.files;
		var fileArr=Array.prototype.slice.call(files);
		$("#serveImg").find($("img")).remove();
		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 파일만 등록해주세요!");
				$("#serve_file").val("");
				$("#serveImg").find($("img")).remove();
				return;
			}
			multiView.push(f);
			
			var reader=new FileReader();
			reader.onload=function(e){
				console.log(e);
				$("#serveImg").append($("<img>").attr({"src":e.target.result,
					"class":"images col-md-3"}));
			}
			reader.readAsDataURL(f);
		});
	}
	
	 $("#acWriter").click(function(){
	    	var regex= /[^0-9]/g;
	    	console.log(viewImg==null);
	    	console.log(multiView.length);
	    
	    	if($("#acTitle").val()==""){
	    		alert("글 제목을 입력해주세요.");
	    	} else if($("#acProName").val()==""){
	    		alert("상품명을 입력해주세요.");
	    	}else if($("#acStartPrice").val()==""){
	    		alert("시작금액을 입력해주세요.");
	    	}else if(regex.test($("#acStartPrice").val())){
	    		alert("시작금액은 숫자만 가능합니다.");
	    	}if($("#acImdPrice").val()==""){
	    		alert("즉시입찰금액을 입력해주세요.");
	    	}else if(regex.test($("#acImdPrice").val())){
	    		alert("즉시입찰금액은 숫자만 가능합니다.");
	    	}else if($("#acProName").val()==""){
	    		alert("상품명을 입력해주세요.");
	    	}else if($("#acCategory").val()==""){
	    		alert("카테고리를 선택해주세요.");
	    	}else if($("#acStatusRank").val()==""){
	    		alert("상태등급을 선택해주세요.")
	    	}else if($("#acStatusRank").val()==""){
	    		alert("상태등급을 선택해주세요.")
	    	}else if($("#acProSize").val()==""){
	    		alert("상품 사이즈를 입력해주세요.")
	    	}else if($("#acBuyDate").val()==""){
	    		alert("구매날짜를 입력해주세요.")
	    	}else if(viewImg==null){
	    		alert("메인이미지를 넣어주세요.")
	    	}else if(multiView.length<2){
	    		alert("2개 이상의 서브이미지를 넣어주세요.")
	    	} else{
	    		$("#fAcWriter").submit();
				alert("정상처리 되었습니다. 관리자 승인을 기다려주세요. 경매승인내역에서 진행상황 확인 가능합니다.");
	    	}
	    })
	    
	    
	    
	    
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />