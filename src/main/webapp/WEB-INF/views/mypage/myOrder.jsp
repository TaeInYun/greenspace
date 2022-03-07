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
			alert(dateText);
			$("#lastDate").datepicker("option", "minDate", dateText)
		}
		option_last.onSelect= function(dateText) {
			alert(dateText);
			$("#firstDate").datepicker("option", "maxDate", dateText)
		}
		
		$("#firstDate").datepicker(option_first);
		$("#lastDate").datepicker(option_last);
		
		$(".event_date").datepicker('setDate', 'today');
		
		$("#search").click(
			function() {
				let firstDate = $("#firstDate").val();
				let lastDate = $("#lastDate").val();
			}
			
		);
	});
</script>
</head>
<body>
<div>
	<div>
		<input type="text" class="event_date" id="firstDate" readonly="readonly"> 
		~ 
		<input type="text" class="event_date" id="lastDate" readonly="readonly">
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
</body>
</html>