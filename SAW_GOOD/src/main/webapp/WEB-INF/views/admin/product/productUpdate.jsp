<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/admin/common/headerAndfooter.jsp"/>

<style>
/* 섹션부분 */
        #titeltwo{
            padding-bottom:30px;
        }
        #product-tbl{
            border-top:1px solid black;
            width:100%;
        }
        #product-tbl tr td{
            border-bottom:1px solid black;
            padding: 15px 0;
        }
        #product-tbl tr th{
            border-bottom:1px solid black;
            padding: 15px 0;
        }
        #text{
            width:80%;
            height:100%;
            resize: none;
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
</style>
<!-- Page Content  -->
      <div id="content" class="p-4 p-md-5 pt-5">
        <h2 id="titeltwo">Product Update</h2>
        <div class="container-fluid">
            <table id="product-tbl" class="table-responsive-md">
                <colgroup>
                    <col width="20%">
                    <col width="80%">
                </colgroup>
                <tr>
                    <th>상품이름</th>
                    <td><input type="text" name="title" value="${product['PRODUCTNAME'] }"></td>
                </tr>
                <tr>
                    <th>상품가격</th>
                    <td><input type="number" name="price" value="${product['PRODUCTPRICE'] }"><span>원</span></td>
                </tr>
                <tr>
                    <th>상품정보</th>
                    <td><textarea id="text">${product['PRODUCTCONTENT'] }</textarea></td>
                </tr>
                <tr>
                    <th>가구별 카테고리</th>
                    <td>
                        <select id="furniture" style="width:100px">
                            <option value="bad" ${product['CATEGORY']=='bad'?"selected":""}>bad</option>
                            <option value="sofa" ${product['CATEGORY']=='sofa'?"selected":""}>sofa</option>
                            <option value="chair" ${product['CATEGORY']=='chair'?"selected":""}>chair</option>
                            <option value="table" ${product['CATEGORY']=='table'?"selected":""}>table</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>브랜드 카테고리</th>
                    <td>
                        <select id="brand" style="width:100px">
                            <option value="에이스" ${product['BRAND']=='에이스'?"selected":""}>에이스</option>
                            <option value="한샘" ${product['BRAND']=='한샘'?"selected":""}>한샘</option>
                            <option value="이케아" ${product['BRAND']=='이케아'?"selected":""}>이케아</option>
                            <option value="파로마" ${product['BRAND']=='파로마'?"selected":""}>파로마</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>썸네일</th>
                    <td>
                        <input type="file" name="upfile" multiple>
                        <div style="display: inline-block;">
                            <img src="${path }/resources/images/${product['PRODUCTIMG']}" attr="" width="100px" height="100px"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; padding:30px 30px 0 0; border:0;" colspan="2">
                        <button type="button" class="btn-black">등록</button>
                    </td>
                </tr>
            </table>
        </div>
	  </div>
	  </div>
	  </div>
	
		
    
  </body>
</html>