<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="" name=""/>
	</jsp:include>

<link rel="stylesheet" href="${path }/resources/css/funding/lastEnroll.css?ver=6"/>
<div class="container-fluid col-md-12" id="detail-header">
	<c:if test="${empty img }">
    <div class="bg-image" style="background-image: url(${path}/resources/images/signup2.jpg);"></div>
    </c:if>
    <c:if test="${not empty img }">
    <div class="bg-image" style="background-image:  url(${path}/resources/images/funding/${img[0].subImg });"></div>
   
    </c:if>
    
    <i>
        <c:out value="${f.category }"/>
    </i>
    <h1>${f.title }</h1> 
</div>

	<form action="${path }/funding/enroll/displayEnd" method="post" enctype="multipart/form-data" id="enroll"> 
	<input type="hidden" name="fdNo" value="${f.fdNo }"/>
    <input type="hidden" name="userId" value="${f.userId }"/>
	<section>
         <div class="container">
            <div class="col-md-12">
                <section class="row first-row">
                    <div class="col-md-7 img-container" style="height:100%;">
                    	
                        <img src="${path }/resources/images/funding/${f.mainImg}"
                         class="images col-md-12" style="height: 700px;" id="main"/> 
                        
                         <div class="col-md-12 row" style="height:100px; margin:0;">
                          <c:if test="${not empty img }">
                         	<c:forEach items="${img }" varStatus='status' var="item">
	                         	<img class="col-md-3 images" src="${path }/resources/images/funding/${item.subImg}"
	                         	id="sub${status.index}"/>
	                         	<input type="hidden" name="sub" value="${item.subImg }"/>
                         	</c:forEach>
                          </c:if>
                         
                         
                         <c:if test ='${empty img }'>
                         	<img class="col-md-3 images" src="" 
                         	id="sub0"/>
                         	<img class="col-md-3 images"src=""
                         	id="sub1" />
                         	<img class="col-md-3 images"src="" 
                         	id="sub2"/>
                         	<img class="col-md-3 images"src="" id="sub3"/>
                         	</c:if>
                         
                         </div>
                    </div>
                    <div id="p-table" class="col-md-5" style="height: 100%;">
                        <caption>
                            <h5>
	                        	등록하시면 바로 노출됩니다.
                            </h5>
                        </caption>
                        <table id= "item-info">
                         
                            <thead>
                                <tr>
                                    <th>DESIGNER / BRAND</th>
                                    <th>${f.designer }</th>
                                </tr>
                            </thead>
                            <tbody id="main-info">
                            	
                                <tr>
                                    <td>목표금액<i>(단위: 원)</i></td>
                                    <td>
	                                    <p>
	                                    	<fmt:formatNumber type="number" value="${f.targetPrice }"/>
	                                    </p>
	                                  </td>
                                </tr>
                               <tr>
                                   <td id="style">상품 설명</td>
                                    <td>${f.subContent }</td>
                                </tr>
                                <tr>
                                   
                                </tr>
                                
                                 <tr>
                                 	<td>종료일자 </td>
                                 	<td>
                                 		<fmt:formatDate type="date" value="${ f.endDate}"/>
                                 	</td>
                                 	
                                </tr>
                            
                            </tbody>
                             <tbody id="reword-container">
                           		 <tr>
                           			 <th>
                                    	리워드
                                    </th>
                                    <th>
                                       참여가격
                                    </th>
                                    
                                </tr>
                                <tr>
                                	 <th>
                                    	ex)테이블1
                                    </th>
                                    <th>
                                       ex)200000
                                    </th>
                                    
                                </tr>
                            	 <tr>
                                    <td>
                                        <input type="text" class="inputStyle" name="reword">
                                    </td>
                                    <td>
                                    	<input type="text" class="inputStyle" name="partPrice">
                                    </td>
                                    
                                </tr>
                               
	                        </tbody>
	                         <tfoot>
                          		<tr>
                          			<td colspan="2">
                          				<button type="button" onclick="addRow()">reword추가하기</button>
                          				<button type="button" onclick="removeRow()">reword삭제하기</button>
                          			</td>
                          		<tr>
                            
                              
                            </tfoot> 
                          
                        </table>

                    </div>
                </section>
                <ul class="detail row">
                    <li class="col-md-12"><span class="underline" >상세정보 입력</span></li>
                    
                </ul>
                <div id="item-detail-info"class="row">
                	<div class="col-md-6">
                	
                	<table>
                		<thead>
	                		<tr>
	                			<td colspan="2" >치수 입력하기</td>
	                			
	                		</tr>
                		</thead>
                		<tbody id="size-container">
	                		<tr>
	                			<th>제품</th>
	                			<td>가로 x 세로 x 높이 (cm)</td>
	                		</tr>
	                		<tr>
	                			<th>ex)테이블</th>
	                			<td>120 x 60 x 100</td>
	                		</tr>
	                		 <tr>
	                			<th><input type="text" name="item"></th>
	                			<td><input type="text" class="size" name="size"></td>
	                		</tr>
	                		
                		</tbody>
                		<tfoot>
                			<tr>
                				<th colspan="2">
                					<button type="button" onclick="addSize()">추가하기</button>
                					<button type="button" onclick="removeSize()">삭제하기</button>
                				</th>
                			</tr>
                		</tfoot> 
                	</table>
                	</div>
                	<div class="col-md-6">
                	<table >
                		<tr>
                			<td> 디테일 정보</td>
                			
                		</tr>
                		<tr>
                			<td>
                				<p><pre>${f.detail }</pre></p>
                			</td>
                		</tr>
                		
                	</table>
                	</div>
                </div>
            
            
        	</div>
        	<div class="col-md-12 end">
        		<button type="button" class="col-md-3" onclick="enroll()">
        			등록하기
        		</button>
        	</div>
		</div>
    </section> 
    </form>
    <script>
function addRow(){
	
	let reword = $("<td>").append($("<input>").addClass("inputStyle").attr({type:"text",name:"reword"}));
	let partPrice = $("<td>").append($("<input>").addClass("inputStyle").attr({type:"text",name:"partPrice"}));
	
	$("#reword-container").append($("<tr>").addClass("addRow").append(reword).append(partPrice));
	
	
}
function addSize(){
	
	let item = $("<th>").append($("<input>").attr({type:"text",name:"item"}));
	let size = $("<td>").append($("<input>").attr({type:"text",name:"size"}));
	
	$("#size-container").append($("<tr>").addClass("addSize").append(item).append(size));

}
function removeRow(){
	$("#reword-container").children("tr[class='addRow']").last().remove();
}

function removeSize(){
	$("#size-container").find("tr[class='addSize']").last().remove();
}



function enroll(){
	
	var reword = $("input[name='reword']");
	var partPrice = $("input[name='partPrice']");
	var item = $("input[name='item']");
	var size = $("input[name='size']");
	
	//분기처리를 위한 변수 
	var checkCount = 0;
	
	//forEach돌려서 input에 있는 값 들어있는지 확인해 주기
		//
		//리워드확인하기
		$.each(reword,function(){
			 if($(this).val() == null || $(this).val() == ''){
				
				checkCount ++;
			 }
		})
		var rCheck = checkCount==0?true:false;
		checkCount = 0;
		
		
		//상품 가격 확인하기
		$.each(partPrice,function(){
			var reg = /^[1-9]+[0-9]{0,11}/;
			//숫자만 허용하는 정규표현식
			 if($(this).val() == null || $(this).val() == ''){
				 checkCount++;
			}else if(!reg.test($(this).val())){
				checkCount++;
			}
			
		})
		
		var pCheck = checkCount == 0? true:false;
		checkCount = 0;
	
		//아이템
		$.each(item,function(){
			 if($(this).val() == null || $(this).val() == ''){
				checkCount++;
			}
		})
		
		var iCheck = checkCount == 0? true:false;
		checkCount = 0;
	
		//사이즈
		$.each(size,function(){
			var reg =/[0-9xX\s]/g;
			if($(this).val() == null || $(this).val() == ''){
				 checkCount++;
			}else if(!reg.test($(this).val())){
				checkCount++;				
			}
		})
		
		sCheck = checkCount == 0? true:false;
		checkCount = 0;
		
		if(!rCheck)alert("리워드를 정확히 입력해주세요");
		else if(!pCheck)alert("가격를 정확히 입력해주세요");
		else if(!iCheck)alert("제품을 정확히 입력해주세요");
		else if(!sCheck)alert("사이즈를 정확히 입력해주세요");
		else {
			if(confirm('제출하시면 바로 펀딩 목록에 노출되고 내용은 수정할 수 없습니다.\n등록하시겠습니까? ')){
				$("#enroll").submit();
			}
		}
	
}
    
    </script>
  	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>