<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WIMB</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>

<link href="<%=cp%>/css/calendar.css" rel="stylesheet" type="text/css" />


<script type="text/javascript">
// 모달 버튼에 이벤트를 건다.  
$('#modifyBtn').on('click', function()
{
	$('#infoModifyModal').modal('show');
});
// 모달 안의 취소 버튼에 이벤트를 건다.  
$('#closeModifyModalBtn').on('click', function()
{
	$('#infoModifyModal').modal('hide');
});

$(function()
{	
	$("#foodSearch").keyup(function()
	{
		var typingTimer;
		var doneTypingInterval = 200;  // 300 밀리초
		
		clearTimeout(typingTimer);
	    typingTimer = setTimeout(function() 
	    {
	        var name = $("#foodSearch").val();
			
			// 입력된 검색어가 한글 완성형일 경우에만 검색 키워드를 구성하여 전송할 수 있도록 처리
			// → 정규표현식 사용
			var regEx =  /^[가-힣]+$/;
			if (!regEx.test(name))
			{
				return;
			}
			
			$.ajax(
			{
				type: "POST"
	            ,url: "foodsearch.action"
	            ,data: {
	            	"name": name
	            	}
	            , dataType: "json"
	            ,success: function (data)
	            {
	            	if (data.list != null)
	            		recomList(data.list);
	            },
	            error: function (error) {
	                // Ajax 요청 실패 시 처리
	                console.error("Ajax Error: ", error);
	            }
	        });
	    }, doneTypingInterval);
	});
	
	$("#logoutBtn").click(function()
	{
		window.location.href = "logout.action";
	});
});

function recomList(recom)
{
	var recomArray = recom.slice(0, -1).split(',');
	
	document.getElementById("items").innerHTML= "";
	
	// 추천 검색어를 동적으로 리스트에 추가
	for (var i = 0; i < recomArray.length; i++)
	{
		document.getElementById("items").innerHTML
		+= "<div class='item'><button type='button' value='"+recomArray[i]+"' class='recomMenu'>"+recomArray[i]+"</button></div>";
	}
	
	document.getElementById("list").style.display = "inline";
}

</script>

</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary mb-2">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><img src="image/wimb_logo.png"
				style="max-width: 90px;"></a>
			<div class="d-flex">
				<div class="collapse navbar-collapse" id="navbarColor04">
					<form class="row d-flex justify-content-end">
						<div class="col-md-4 p-0">
							<div class="d-flex">
								${user_name }(${user_id })
							</div>
						</div>
						<div class="col-md-7 p-0 me-2">
							<div class="d-flex">
								<!-- 로그아웃 -->
								<button type="button" class="btn btn-primary my-0 my-sm-0" id="logoutBtn">LOGOUT</button>
								<!-- 정보수정 -->						
								<button type="button" class="btn btn-primary ms-1 my-2 my-sm-0"
									id="modifyBtn" data-bs-toggle="modal"
									data-bs-target="#modifyModal"><small>정보수정</small></button>
							</div>
						</div>
					</form>
					<div>
						<c:import url="info_modify_modal.jsp"></c:import>
					</div>
				</div>
			</div>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor04"
				aria-controls="navbarColor04" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
	</nav>
	
	<div class="container-fluid" style="height: 700px;">
		<div class="row">
			<div class="col-md-5 h-70 p-0">
				<div class="container-fluid">
					<div class="card mb-3" style="height: 700px;">
						<h3 class="card-header">${cal.month }월</h3>
						<div class="card-body card-info p-2 pb-0" style="height: 90px;">
							<h5 class="card-title">한달 하루 영양 달력</h5>
							<h6 class="card-subtitle text-muted">날짜를 클릭하여 하루를 채우고
								확인해보세요!</h6>
						</div>
						<div class="card-body p-0">
							<!-- 달력자리 -->
							<div class="calendar">
								<div class="day">일</div>
								<div class="day">월</div>
								<div class="day">화</div>
								<div class="day">수</div>
								<div class="day">목</div>
								<div class="day">금</div>
								<div class="day">토</div>
								<c:forEach var="day" begin="1" end="${cal.start_date }" step="1">
									<div class="day"></div>
								</c:forEach>
								<c:forEach var="tk" items="${tklist}" >
									<div class="day">
									<%-- <c:set var="select_day" value="${cal.select_day}"/> --%>
									<c:choose>
										<c:when test="${tk.day eq cal.select_day}">
												<button type="button" class="select">${tk.day}</button>
												<span class="kcal">${tk.kcal}kcal</span>
										</c:when>
										<c:otherwise>
												<button type="button" class="unselect">${tk.day}</button>
												<span class="kcal">${tk.kcal}kcal</span>
										</c:otherwise>
									</c:choose>
									</div>
								</c:forEach>
								<c:forEach var="day" begin="1" end="${cal.end_date }" step="1">
									<div class="day"></div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-7 p-0">
				<div class="container-fluid">
					<div class="card">
						<div class="card-body">
							<h3 class="card-title text-center text-decoration-underline">${cal.year }.${cal.month }.${cal.select_day}</h3>
							<br>
							<div class="row d-flex align-items-stretch justify-content-between">
								<div class="col-md-3 pe-1 ps-5">
									<b>식사종류</b>
									<div class="btn-group d-flex" role="group"
										aria-label="Basic radio toggle button group">
										<input type="radio" class="btn-check" name="breakfast"
											id="btnradio1" autocomplete="off">
										<label class="btn btn-outline-primary p-1" for="breakfast">아침</label>
										<input type="radio" class="btn-check" name="lunch"
											id="btnradio2" autocomplete="off"> <label
											class="btn btn-outline-primary p-1" for="lunch">점심</label>
										<input type="radio" class="btn-check" name="dinner"
											id="btnradio3" autocomplete="off"> <label
											class="btn btn-outline-primary p-1" for="dinner">저녁</label>
										<input type="radio" class="btn-check" name="snack"
											id="btnradio4" autocomplete="off"> <label
											class="btn btn-outline-primary p-1" for="snack">간식</label>
									</div>
								</div>
								<div class="col-md-4">
									<b>음식명</b>
									<div class="d-flex">
										<input class="form-control me-sm-2" type="text"
											placeholder="음식명 입력란" id="foodSearch">
										<button class="btn btn-primary my-2 my-sm-0" type="button">Search</button>
									</div>
									<div id="list">
										<div id="items">
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="d-flex">
										<div class="form-check form-switch">
											<input class="form-check-input" type="checkbox"
												id="flexSwitchCheckDefault">
										</div> &nbsp;
										<b>음식량</b><i>(선택사항)</i> 
									</div>
									<div class="d-flex">
										<input class="form-control me-sm-2" type="text"
											placeholder="음식량 입력란">
									</div>
								</div>
								<div class="col-md-2">
									<div>
										&nbsp;
									</div>
									<button class="btn btn-secondary my-2 my-sm-0" type="submit">저장하기</button>
								</div>
							</div>
							<br>
							<hr>
							<table class="table table-hover text-center">
								<thead>
									<tr>
										<th scope="col">끼니</th>
										<th scope="col">메뉴명</th>
										<th scope="col">칼로리</th>
										<th scope="col">음식량</th>
										<th scope="col">총 칼로리</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody>
									<!-- <tr>
										<th scope="row">아침</th>
										<td>미역국</td>
										<td>200kcal</td>
										<td>100g</td>
										<td></td>
										<td><button type="button" class="btn btn-outline-secondary btn-sm">삭제하기</button></td>
									</tr> -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




</body>
</html>