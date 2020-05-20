<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="" name=""/>
	</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/funding/enroll.css?ver=6"/>

	<form action="${path }/funding/enroll/step2" method="post" enctype="multipart/form-data"> 
	<section>
         <div class="container">
            <div class="col-md-12">
                <section class="row first-row">
                    <div class="col-md-7 img-container" style="height:100%;">
                        <img src="" class="images col-md-12" style="height: 700px;"/> 
                         
                         <div class="col-md-12 row" style="height:100px; margin:0;">
                         	<img class="col-md-3 images" src=""/>
                         	<img class="col-md-3 images"src=""/>
                         	<img class="col-md-3 images"src=""/>
                         	<img class="col-md-3 images"src=""/>
                         </div>
                    </div>
                    <div id="p-table" class="col-md-5" style="height: 100%;">
                        <caption>
                            <h5>
	                        	정보 입력
                            </h5>
                        </caption>
                        <table id= "item-info">
                         
                            <thead>
                                <tr>
                                    <th>TITLE</th>
                                    <th><input type="text" id="title" class="inputStyle"
                                        name="title" placeholder="제목 입력"></th>
                                </tr>
                            </thead>
                            <tbody id="main-info">
                            	<tr>
                                    <th>DESIGNER / BRAND</th>
                                    <th><input type="text" id="designer" class="inputStyle"
                                        name="designer" placeholder="디자이너 혹은 브랜드 입력"></th>
                                </tr>
                                <tr>
                                    <td>목표금액<i>(단위: 원)</i></td>
                                    <td>
	                                    <p>
	                                    	<input type="text" id="targetPrice" class="inputStyle"
                                        name="targetPrice" placeholder="숫자만 입력" value="">
	                                    </p>
	                                  </td>
                                </tr>
                               <tr>
                                   <td id="style">상품 설명</td>
                                    <td><textarea cols="20" rows="7" name="subContent" placeholder="130자 이내"></textarea></td>
                                </tr>
                                <tr>
                                    <td>CATEGORY</td> 
                                    <td><p><select name="category" class="inputStyle">
                                            <option value="bed">침대</option>
                                            <option value="sofa">소파</option>
                                            <option value="chair">의자</option>
                                            <option value="table">테이블</option>
                                            <option value="desk">책상</option>
                                            <option value="lug">카펫 / 러그</option>
                                            <option value="storage">서랍 / 수납함</option>
                                            <option value="others">기타</option>
                                        </select></p></td> 
                                </tr>
                                 <tr>
                                    <td>종료일자</td>
                                    <td><p>
                                    		<select name="day" class="inputStyle">
	                                            <option value="30">30일 후</option>
	                                            <option value="60">60일 후</option>
	                                            <option value="90">90일 후</option>
	                                            <option value="120">120일 </option>
                                            </select>
                                    	</p></td>
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
                                <tr>
                                    <td>
                                        <input type="text" class="inputStyle" name="reword">
                                    </td>
                                    <td>
                                    	<input type="text" class="inputStyle" name="partPrice">
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="inputStyle" name="reword">
                                    </td>
                                    <td>
                                    	<input type="text" class="inputStyle" name="partPrice">
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="inputStyle" name="reword">
                                    </td>
                                    <td>
                                    	<input type="text" class="inputStyle" name="partPrice">
                                    </td>
                                    
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
                				<td colspan="2" >사진 등록하기</td>
                			</tr>
                			 <tr>
                				<th>
                				메인 사진 추가하기 
                				</th>
                				<td>
                					<input  type="file"  name="mainPic">
                				</td>
                			
                			</tr> 
                			<tr>
                				<th>
                				제품 사진 추가하기 (4장)
                				</th>
                				<td>
                					<input  type="file" name="subPic" accept=".jpg,.jpeg,.png,.gif,.bmp" multiple>
                				</td>
                			</tr> 
                		</thead>
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
	                			<td><input type="text"  name="size" placeholder="형식에 맞게 적어주세요"></td>
	                			 
	                		</tr>
	                		<tr>
	                			<th><input type="text" name="item"></th>
	                			<td><input type="text"  name="size" placeholder="형식에 맞게 적어주세요"></td>
	                		</tr>
	                		<tr>
	                			<th><input type="text" name="item"></th>
	                			<td><input type="text"  name="size" placeholder="형식에 맞게 적어주세요"></td>
	                		</tr>
	                		<tr>
	                			<th><input type="text" name="item"></th>
	                			<td><input type="text"  name="size" placeholder="형식에 맞게 적어주세요"></td>
	                		</tr>
                		</tbody>
                		<!-- <tfoot>
                			<tr>
                				<td colspan="2"><button type="button" onclick="addSize()">추가하기</button></td>
                			</tr>
                		</tfoot> -->
                	</table>
                	</div>
                	<div class="col-md-6">
                	<table >
                		<tr>
                			<td> 디테일 정보</td>
                			
                		</tr>
                		<tr>
                			<td>
                				<p><textarea cols="60" rows="12" name="detail"></textarea></p>
                			</td>
                		</tr>
                		
                	</table>
                	</div>
                </div>
            
            
        	</div>
        	<div class="col-md-12 end">
        		<button class="col-md-3" onclick="enroll()">
        			등록하기
        		</button>
        	</div>
		</div>
    </section> 
    </form>
  	<script src="${path }/resources/js/funding/enroll.js"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>