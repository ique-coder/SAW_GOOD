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

        #hr {
            margin-top: 0px;
            margin-bottom: 30px;
        }
        /* 멤버현황 */
        .status-Wrapper{
            width:100%;
            height:400px;
            border:1px solid black;
            box-sizing: content-box;
        }
        .status-head{
            width:100%;
            height:60px;
            padding:16px 13px 10px 13px;
            border:1px solid black;
            border-bottom:white;
            font-size: 20px;
            font-weight: bolder;
        }
        #status-tbl{
            width:100%;
        }
        #status-tbl tr td{
            height:100px;
            border:1px solid black;
            padding:10px 13px;
            text-align: right;
            font-size: 15px;
        }
        #status-tbl tr td>span{
            font-size:25px;
            color:blue;
            margin-right:5px;
            border-bottom:1px solid blue;
        }
        #status-tbl tr th{
            height:30px;
            font-size:15px;
            border:1px solid black;
            padding:10px 13px;
        }   

        /* 맴버리스트 테이블 */
        table.memberMg tr td {
            text-align: center;
            padding: 10px 0;
        }

        table.memberMg tr th {
            text-align: center;
            padding: 10px 0 10px 0;
        }

        table.memberMg tr td {
            border-top: 1px solid lightgray;
        }

        table.memberMg {
            border-radius: 20px;
            height: 100%;
            width: 100%;
            border-bottom: 1px solid black;
            border-top: 1px solid black;
        }
</style>

<div id="content" class="p-4 p-md-5 pt-5">
            <h2 id="titeltwo">Member Manager</h2>
            <hr id="hr">
            <div class="container-fluid">
                <div clas="status-Wrapper" style="padding:0 15px;">
                    <div class="status-head">
                        회원현황
                    </div>
                    <table id="status-tbl">
                        <colgroup>
                            <col width="33%">
                            <col width="33%">
                            <col width="33%">
                        </colgroup>
                        <tr>
                            <th>신규회원(today)</th>
                            <th>방문회원(today)</th>
                            <th>탈퇴회원</th>
                        </tr>
                        <tr>
                            <td><span>0</span>명</td>
                            <td><span>0</span>명</td>
                            <td><span>0</span>명</td>
                        </tr>
                    </table>
                    
                </div>
                <div style="margin-top:50px; padding:15px;">
                    <h4>최근 가입현황</h4>
                    <table class="memberMg checking">
                        <colgroup>
                            <col width="15%">
                            <col width="15%">
                            <col width="20%">
                            <col width="auto">
                            <col width="auto">
                            <col width="15%">
                        </colgroup>

                        <tr>
                            <th scope="col">아이디</th>
                            <th scope="col">이름</th>
                            <th scope="col">전화번호</th>
                            <th scope="col">주소</th>
                            <th scope="col">이메일</th>
                            <th scope="col">가입일</th>
                        </tr>
                        <tr>
                            <td>chdaud33</td>
                            <td>정총명</td>
                            <td>01050115614</td>
                            <td>강서구 화곡동 899-23</td>
                            <td>sunmi1926@naver.com</td>
                            <td>2020-05-04</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>

                        </tr>
                        <tr>
                            <td>3</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    </div>



</body>

</html>