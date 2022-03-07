<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
	.ui-datepicker-trigger{cursor: pointer;}
	/*datepicer input 롤오버 시 손가락 모양 표시*/
	.hasDatepicker{cursor: pointer;}
	.ui-datepicker-trigger{
		width: 4%;
		height: 4%;
	}
</style>

<meta charset="UTF-8">
<link rel="stylesheet" href="/js/jquery-ui/jquery-ui.css">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/5b334c6c49.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/searchDate.js"></script>
<script type="text/javascript" src="/js/paging.js"></script>
<script type="text/javascript">
	$(function() {

		let option = {
				 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					dayNamesMin:['월','화','수','목','금','토','일'],
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
		});
		
		$("#week").click(function(){
			let data={
					day : 7,
					period: "week"
			}
			
			searchByDate(data);
			
		});
		
		$("#oneMonth").click(function(){
			let data={
					month : 1,
					period: "oneMonth"
			}

			searchByDate(data);
			$("#paging > a").attr("id", ${period});
		});
		$("#threeMonth").click(function(){
			let data={
					month : 3,
					period: "threeMonth"
			}
			searchByDate(data);
		});
		$("#allDay").click(function(){
			location.href="/mypage/myOrder";
		});
		
		$(document).on("click","#paging > a", function(){
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
						firstDate:firstDate,
						lastDate :lastDate
				}
				searchByDate(data);
			}
			
		});
		
	});
</script>
</head>
<body>
	<div>
		<div>
			<button type="button" id="week" value="7">1주일</button>
			<button type="button" id="oneMonth" value="1">1개월</button>
			<button type="button" id="threeMonth" value="3">3개월</button>
			<button type="button" id="allDay" value="3">전체 시기</button>
		</div>
		<div>
			<input type="text" id="firstDate" readonly="readonly" placeholder="조회할 날짜를 선택해주세요"> 
			~ 
			<input type="text" id="lastDate" readonly="readonly" placeholder="조회할 날짜를 선택해주세요">
			<input type="button" id="search" value="조회">
		</div>
	</div>
	<table border="1", width="800px">
		<thead>
			<tr>
				<td>상품 정보</td>
				<td>주문 일자</td>
				<td>주문 번호</td>
				<td>주문 금액(수량)</td>
				<td>주문 상태</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${list }">
				<tr>
					<td>
						<div>
							<a href="/shop/detailProduct?no=${c.pro_no }">
								<img  src="/upload/${c.pro_thumbnail }" width="200" height="200">
							</a>
							<ul>
								<li>
									<a href="/shop/detailProduct?no=${c.pro_no }">
										${c.pro_name }
									</a>
								</li>
								<c:if test="${c.option_name != null }">
									<li>
										(${c.option_name })${c.option_detail}
									</li>
								</c:if>
							</ul>
						</div>
					</td>
					<td>
						${c.day }
					</td>
					<td>
						<a href="/shop/detailOrderList?id=${c.id }&&day=${c.day}">
							${c.id }
						</a>
					</td>
					<td>
						${c.pro_price }원<br>
						(${c.pro_qty }개)
					</td>
					<td>
						${c.status }
						<input type="button" value="후기 작성">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="paging">
		<c:forEach begin="1" end="${ totalPage}" var="i">
			<a href="#" id= "${period }">${i }</a>&nbsp;&nbsp;
		</c:forEach>
	</div>
</body>
</html>