<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<link rel="stylesheet" href="${path }/resources/css/funding/detail.css"/>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container-fluid col-md-12" id="detail-header">
    	<div class="bg-image" style="background-image: url(${path}/resources/images/signup2.jpg);"></div>
        <i>Couch / chiar</i>
        <h1>FANTASTIC FURNITURE YOU SHOULD HAVE</h1>
    </div>
    <section>
         <div class="container">
            <div class="col-md-12">
                <section class="row first-row">
                    <div class="col-md-7 img-container" style="height: 700px;">
                        <img src="${path }/resources/images/leftphoto.png" class="arrow" style="left: 20px;">
                        <img src="${path }/resources/images/signup.jpg" class="images"> 
                        <img src="${path }/resources/images/rightphoto.png" class="arrow" style="right: 20px;">
                    </div>
                    <div id="p-table" class="col-md-5" style="height: 700px;">
                        <caption>
                            <h5>16일 남음</h5>
                        </caption>
                        <table>
                            <thead>
                                <tr>
                                    <th colspan="2">DESIGNER &nbsp;&nbsp;&nbsp; MARK TETO</th>
                                </tr>
                            </thead>
                            <tbody id="main-info">
                                <tr>
                                    <td>목표금액</td>
                                    <td><p>30,000,000</p><i>원</i></td>
                                </tr>
                               <tr>
                                   <td>참여인원</td>
                                    <td><p>00</p><i>명 참여</i></td>
                                </tr>
                                <tr>
                                    <td>PRICE</td> 
                                    <td><p>500,000</p><i>원</i></td> 
                                </tr>
                                <tr>
                                    <td>참여율</td>
                                    <td><p>50</p><i>% 달성</i></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <svg width="100%" height="3px" xmlns="http://w3.org/2000/svg" version="1.1" class="bar-container">
                                            <rect x="0" y="0" width="50%" height="3px" class="bar"/>
                                        </svg>
                                    </td>
                                </tr>
                                
                            </tbody>
                            <tbody id="sub-info">
                                <tr>
                                    <td>0000원 이상</td> 
                                    <td><p>의자 1개</p><i></i></td> 
                                </tr>
                                <tr>
                                    <td>00000원 이상</td> 
                                    <td><p>의자+테이블</p><i></i></td> 
                                </tr>
                                <tr>
                                    <!-- <td>구매 수량</td> 
                                    <td>
                                        <button type="button">-</button>
                                        <input type="text" value="1">
                                        <button type="button">+</button>
                                    </td> -->
                                    <td></td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="2">
                                        <button id="buy-btn">프로젝트 밀어주기</button>
                                    </td>
                                   
                                </tr>
                            </tfoot>
                        </table>

                    </div>
                </section>
                <ul class="row">
                    <li class="col-md-4"><span class="underline" onclick="select(1);">프로젝트 소개</span></li>
                    <li class="col-md-4"><span onclick="select(2);">참여내역</span></li>
                    <li class="col-md-4"><span onclick="select(3);">후기</span></li>
                </ul>
                <section>
                    
                    <div class="detail-select" id="project">
                        <p>

                            The standard Lorem Ipsum passage, used since the 1500s
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

                            Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC
                            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"

                            1914 translation by H. Rackham
                            "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"

                            Section 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC
                            "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."

                            1914 translation by H. Rackham
                            "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains."
                            The standard Lorem Ipsum passage, used since the 1500s
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

                            Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC
                            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"

                            1914 translation by H. Rackham
                            "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"

                            Section 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC
                            "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."

                            1914 translation by H. Rackham
                            "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains."
                        </p>
                    </div>
                    <div class="detail-select" id="purchase">
                        <p class="tx_total">총 <strong class="num">280</strong>개의 참여내역과 응원메시지가 있습니다.</p>
                            <ul class="lst_sponser">
                                <li>
                                    <span class="img_thm">
                                        <img src="" width="50" height="50" alt="wwiiw_img">
                                    </span>
                                    <div class="sponser_info">
                                        <p>
                                            <span class="wordBreak">이 프로젝트의 성공을 응원합니다.</span>
                                        </p>
                                        <span class="date">2020.05.10 20:31</span>
                                    <div>                    
                                        <span class="nick"><a style="text-decoration:none">wwiiw님</a></span>
                                        <span class="price"><strong class="num">45,000</strong>원 참여</span>
                                    </div>
                                </li>
                            </ul>
                    </div>
                    <div class="detail-select" id="review">
                        <ul class="lst_sponser">
                            <li>
                                <span class="img_thm">
                                    <img src="" width="50" height="50" alt="wwiiw_img">
                                </span>
                                <div class="sponser_info">
                                    <p>
                                        <span class="wordBreak">상품 후기</span>
                                    </p>
                                    <span class="date">2020.05.10 20:31</span>
                                <div>                    
                                    <span class="nick"><a style="text-decoration:none">wwiiw님</a></span>
                                    <span class="price"><strong class="num">****</strong>별점</span>
                                </div>
                            </li>
                        </ul>
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

    
    </script>
		
		

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>