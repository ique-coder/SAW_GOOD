<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/admin/common/headerAndfooter.jsp"/>
<!-- Page Content  -->
        <div id="content" class="p-4 p-md-5 pt-5">
            <!-- Content Wrapper. Contains page content -->
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0 text-dark">Dashboard v3</h1>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">Dashboard v3</li>
                                </ol>
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <div class="d-flex justify-content-between">
                                            <h3 class="card-title">Visitors</h3>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        
                                        <div class="position-relative mb-4" style="width:100%;height:auto;">
                                            <canvas id="visitor-ch"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card -->

                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">Best Seller</h3>
                                    </div>
                                    <div class="card-body table-responsive p-0">
                                        <table class="table table-striped table-valign-middle">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Price</th>
                                                    <th>Sales</th>
                                                    <th>More</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${topfive}" var="t">
                                                <tr>
                                                    <td>
                                                        <img src="${path }/resources/upload/newproduct/${t['RENAMEDPRODUCTIMG']}"
                                                            class="img-circle img-size-32 mr-2">
                                                        ${t['PRODUCTNAME'] }
                                                    </td>
                                                    <td>
                                                    	<fmt:formatNumber value="${t['PRODUCTPRICE'] }"/>원
                                                    </td>
                                                    <td>
                                                        <small class="text-success mr-1">
                                                            <i class="fas fa-arrow-up"></i>
                                                        </small>
                                                        ${t['TOP'] }
                                                    </td>
                                                    <td>
                                                        <a href="${path }/product/productView?no= ${t['PRODUCTNO'] }" class="text-muted">
                                                            <i class="fas fa-search"></i>
                                                        </a>
                                                    </td>
                                                </tr>    
                                                </c:forEach>                                        
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col-md-6 -->
                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-header border-0">
                                        <div class="d-flex justify-content-between">
                                            <h3 class="card-title">Sales</h3>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="position-relative mb-4" style="width:100%;height:auto;">
                                            <canvas id="line-chart"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card -->

                                <div class="card">
                                    <div class="card-header border-0">
                                        <h3 class="card-title">Online Store Overview</h3>
                                    </div>
                                    <div class="card-body">
                                        <div
                                            class="d-flex justify-content-between align-items-center border-bottom mb-3">
                                            <p class="text-success text-xl">
                                                <i class="ion ion-ios-refresh-empty"></i>
                                            </p>
                                            <p class="d-flex flex-column text-right">
                                                <span class="font-weight-bold">
                                                    <i class="ion ion-android-arrow-up text-success"></i> 12%
                                                </span>
                                                <span class="text-muted">CONVERSION RATE</span>
                                            </p>
                                        </div>
                                        <!-- /.d-flex -->
                                        <div
                                            class="d-flex justify-content-between align-items-center border-bottom mb-3">
                                            <p class="text-warning text-xl">
                                                <i class="ion ion-ios-cart-outline"></i>
                                            </p>
                                            <p class="d-flex flex-column text-right">
                                                <span class="font-weight-bold">
                                                    <i class="ion ion-android-arrow-up text-warning"></i> 0.8%
                                                </span>
                                                <span class="text-muted">SALES RATE</span>
                                            </p>
                                        </div>
                                        <!-- /.d-flex -->
                                        <div class="d-flex justify-content-between align-items-center mb-0">
                                            <p class="text-danger text-xl">
                                                <i class="ion ion-ios-people-outline"></i>
                                            </p>
                                            <p class="d-flex flex-column text-right">
                                                <span class="font-weight-bold">
                                                    <i class="ion ion-android-arrow-down text-danger"></i> 1%
                                                </span>
                                                <span class="text-muted">REGISTRATION RATE</span>
                                            </p>
                                        </div>
                                        <!-- /.d-flex -->
                                    </div>
                                </div>
                            </div>
                            <!-- /.col-md-6 -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /.content -->
            </div>
            <div>
            	<c:forEach items="${weekvisit }" var="w" varStatus="vs">
            		<input type="hidden" value="${w }" id="week${vs.count }" />
            	</c:forEach>
            	<c:forEach items="${totalPrice }" var="t" varStatus="vs">
            		<input type="hidden" value="${t }" id="total${vs.count }" />
            	</c:forEach>
            </div>
            <!-- /.content-wrapper -->

<script>
//판매량 차트
let arr = [];
for(let i=1; i<8; i++) {
    let date = new Date();
    date.setDate(date.getDate() - i)
    arr.unshift(date.toLocaleString().substring(5,11));
}



new Chart(document.getElementById("visitor-ch"), {
    type: 'line',
    data: {
        labels: arr,
        datasets: [{
            label: 'Visitors',
            data:[$("#week7").val(),$("#week6").val(),$("#week5").val(),$("#week4").val(),$("#week3").val(),$("#week2").val(),$("#week1").val()],
            borderColor: "rgb(40,161,130)",
            backgroundColor: 'rgb(40,161,130,0)',
            fill: true,
            lineTension: 0
        }]
    },
    options: {
        responsive: true,
        title: {
            display: true,
            text: 'Visitors'
        },
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: '날짜'
                }
            }],
            yAxes: [{
                display: true,
                ticks: {
                    suggestedMin: 0,
                },
                scaleLabel: {
                    display: true,
                    labelString: '방문자수'
                }
            }]
        }
    }
});
// 방문객 차트
new Chart(document.getElementById("line-chart"), {
    type: 'bar',
    data: {
        labels: arr,
        datasets: [{
            label: 'Sales',
            data: [
                $("#total7").val(), $("#total6").val(), $("#total5").val(),
                $("#total4").val(),$("#total3").val(), $("#total2").val(), $("#total1").val(),
            ],
            borderColor: "rgb(206,29,22)",
            backgroundColor: "rgba(206,29,22,0.5)",
            hoverBackgroundColor:
            "rgb(200,0,0)",
            fill: true,
            lineTension: 0
        }]
    },
    options: {
        responsive: true,
        title: {
            display: true,
            text: 'Sales'
        },
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: '날짜'
                }
            }],
            yAxes: [{
                display: true,
                ticks: {
                    suggestedMin: 0,
                },
                scaleLabel: {
                    display: true,
                    labelString: '판매금액'
                }
            }]
        }
    }
});




   
</script>

</body>

</html>