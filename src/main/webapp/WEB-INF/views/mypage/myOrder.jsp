<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>녹지공간 - 나의 주문내역</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<script src="https://kit.fontawesome.com/5b334c6c49.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/searchDate.js"></script>
<link rel="stylesheet" href="/js/jquery-ui/jquery-ui.css">
<link rel="stylesheet" href="/css/style.css">
<style type="text/css">

/* .mypage_aside {
    width: 5%; 
    margin: 20px 0;
    border-right: 1px solid #eee;
    padding-right: 34px;
} */
.mypage_aside {
    width: 12%; 
    margin: 5px;
    border-right: 1px solid #eee;
    padding-right: 5px;
}

</style>
<script type="text/javascript">
	$(function() {
		$("#link_orderList").attr("style","color:white; background: #00913A;")
		$( $(".nav-btn")[0] ).attr("style", "background: #00913A;");
			$( $(".nav-btn .nav-btn__text")[0] ).attr("style", "color:white");
		
		$(".myShopping").attr("style","background: #00913A; font-weight:800; color: white; padding: 5px 15px; border-radius: 20px;");
		
		let option = {
				 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					dayNamesMin:['일','월','화','수','목','금','토'],
					closeText: '닫기',
					minDate: "-2Y", 
					maxDate: "+0D",
					yearSuffix: "년",
					currentText: "오늘",
					showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜 표시
					changeYear: true,
					showButtonPanel: true,
					dateFormat:"yy/mm/dd", //input Display Format 변경
					showMonthAfterYear: true, //년도먼저, 뒤에 월
					buttonImage: "/css/img/calender.png",
					buttonImageOnly: true,
					buttonText: "선택",
					showOn: "both"	 
		} 
		
		let option_first = option;
		let option_last = option;
		
		option_first.onSelect= function(dateText) {
			$("#lastDate").datepicker("option", "minDate", dateText);
		}
		option_last.onSelect= function(dateText) {
			$("#firstDate").datepicker("option", "maxDate", dateText)
		}
		
		$("#firstDate").datepicker(option_first);
		$("#lastDate").datepicker(option_last);
		
		
		$("#search").click(function(){
			let firstDate = $("#firstDate").val();
			let lastDate = $("#lastDate").val();
			
			let data={
					fristDate: firstDate,
					lastDate: lastDate,
					period: "search"
			}

			searchByDate(data);
			$(".search__btns button").attr("style", "");
			$(this).attr("style","background: #008040;color: white;");
		});
		
		$("#week").click(function(){
			let data={
					day : 7,
					period: "week"
			}
			
			searchByDate(data);
			$(".search__btns button").attr("style", "");
			$(this).attr("style","background: #008040;color: white;");
			
		});
		
		$("#oneMonth").click(function(){
			let data={
					month : 1,
					period: "oneMonth"
			}

			searchByDate(data);
			$("#paging > a").attr("id", ${period});
			$(".search__btns button").attr("style", "");
			$(this).attr("style","background: #008040;color: white;");
		});
		$("#threeMonth").click(function(){
			let data={
					month : 3,
					period: "threeMonth"
			}
			searchByDate(data);
			$(".search__btns button").attr("style", "");
			$(this).attr("style","background: #008040;color: white;");
			
		});
		$("#allDay").click(function(){
			location.href="/mypage/myOrder";
		});
		
		
		//페이지 클릭시 
		$(document).on("click","#paging li> a", function(){
			let start = $(this).text();
			let period = $(this).attr("id");

			if(period == "allDay"){
				let data = {
						start: start,
						period: period
				}
				searchByDate(data);
			}else if(period == "week"){
				let data = {
						start: start,
						period: period,
						data: 7
				}
				searchByDate(data);
			}else if(period == "oneMonth"){
				let data = {
						start: start,
						period: period,
						month:1
				}
				searchByDate(data);
			}else if(period == "threeMonth"){
				let data = {
						start: start,
						period: period,
						month: 3
				}
				searchByDate(data);
			}else{
				let firstDate = $("#firstDate").val();
				let lastDate = $("#lastDate").val();
				
				let data = {
						start: start,
						period: period,
						fristDate: firstDate,
						lastDate :lastDate
				}
				searchByDate(data);
			}
			
			$(this).attr("style","background: #008040;color: white;");
		});
		
		 $("#insertReview").find(".modal-content").load("/shop/insertReview?pro_no=${p.no}");  //리뷰작성하기
		 
	});
</script>
</head>
<body>	
	<div id="root">
		<jsp:include page="../header.jsp"></jsp:include>
		<div class="section mypage">
			<jsp:include page="../mypage/myAside.jsp"></jsp:include>
			<main class="mypage-main">
				<jsp:include page="./myShoppingHeader.jsp"></jsp:include>
				<div class="search">
					<div class="search__btns">
						<button type="button" id="week" value="7">1주일</button>
						<button type="button" id="oneMonth" value="1">1개월</button>
						<button type="button" id="threeMonth" value="3">3개월</button>
						<button type="button" id="allDay" value="3">전체</button>
					</div>
					<div class="search__calender">
						<input type="text" id="firstDate" readonly="readonly" placeholder="시작 날짜" value="${fristDate}"> 
						<span>&nbsp;&nbsp;</span>
						<input type="text" id="lastDate" readonly="readonly" placeholder="종료 날짜" value="${lastDate}">
						<input type="button" id="search" value="조회" >
					</div>
				</div>
				<table class="product_table">
					<thead>
						<tr>
							<th>상품 정보</th>
							<th>주문 일자</th>
							<th>주문 번호</th>
							<th>주문 금액(수량)</th>
							<th>주문 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${list }">
							<tr>
								<td>
									<div class="product_table-productInfo">
										<a href="/shop/detailProduct?no=${c.pro_no }">
											<img  src="/upload/${c.pro_thumbnail }" width="200" height="200">
										</a>
										<div>
											<div>
												<a href="/shop/detailProduct?no=${c.pro_no }">
													${c.pro_name }
												</a>
											</div>
											<c:if test="${c.option_name != null }">
												<div class="table-col__option">
													(${c.option_name })${c.option_detail}
												</div>
											</c:if>
										</div>
									</div>
								</td>
								<td>
									${c.day }
								</td>
								<td>
									<a href="/shop/detailOrderList?id=${c.id }&&day=${c.day}" >
										${c.id }
									</a>
								</td>
								<td>
									${c.pro_price }원 (${c.pro_qty }개)
								</td>
								<td>
									${c.status }
									<!-- <input type="button" value="후기 작성"> -->
									<a id="insertReview" data-toggle="modal" data-target="#reviewModal" role="button" href="/shop/insertReview?pro_no=${c.pro_no}"><button>리뷰작성</button></a>
									<div id="reviewModal" class="modal fade" tabindex="-1" role="dialog"> 
			  			 				<div class="modal-dialog"> 
			  			 					<div class="modal-content"> 
			  			 					</div> 
			  			 				</div> 
			  			 		    </div>																	
								</td>								
							</tr>
							
						</c:forEach>						
					</tbody>
					
				</table>				
				<div id="paging">
					<ul>
					<c:forEach begin="1" end="${ totalPage}" var="i">
						<li><a href="#" id= "${period }">${i }</a></li>
					</c:forEach>
					</ul>
				</div>
			</main>
		</div>
		
	</div>
</body>
</html>