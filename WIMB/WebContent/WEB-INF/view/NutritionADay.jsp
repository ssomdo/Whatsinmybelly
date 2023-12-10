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



<style>
/* 스타일링을 위한 CSS 코드 */
.calendar {
    display: flex;
    flex-wrap: wrap;
    max-width: 600px;
    height: 440px;
    margin: 20px auto;
}

.day {
    width: calc(100% / 7);
    box-sizing: border-box;
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}

.prev, .next {
    cursor: pointer;
    padding: 8px;
    background-color: #4CAF50;
    color: #fff;
    margin: 10px 0;
}
</style>

<script type="text/javascript">
// 모달 버튼에 이벤트를 건다.  
$('#joinBtn').on('click', function()
{
	$('#joinModal').modal('show');
});
// 모달 안의 취소 버튼에 이벤트를 건다.  
$('#closeModalBtn').on('click', function()
{
	$('#joinModal').modal('hide');
});

//모달 버튼에 이벤트를 건다.  
$('#infoSearchBtn').on('click', function()
{
	$('#infoSearchModal').modal('show');
});
// 모달 안의 취소 버튼에 이벤트를 건다.  
$('#closeSearchModalBtn').on('click', function()
{
	$('#infoSearchModal').modal('hide');
});


$(function()
{
	window.history.forward(); function noBack()
	{
		window.history.forward();
	}
	
	var failValue = "${fail}";
	
	// 로그인 실패 후 페이지 로딩시 로그인 실패 문구 출력
	if(failValue == 'fail')
	{
		alert('아이디 혹은 비밀번호를 잘못 입력했습니다.');
	}
	
	// 로그인 실행
	$('#loginBtn').on('click', function()
	{
		if ($("#user_id").val() == "")
		{
			alert("아이디를 입력해주세요.");
			$("#user_id").focus();
			return;
		}
		if ($("#user_pw").val() == "")
		{
			alert("비밀번호를 입력해주세요.");
			$("#user_pw").focus();
			return;
		}
		
		$("#mainForm").attr("action", "whatsinmybelly/login.action");
		$("#mainForm").submit();
		
	});
});


function enterkey() 
{
	if (window.event.keyCode == 13) 
	{
		if ($("#user_id").val() == "")
		{
			alert("아이디를 입력해주세요.");
			$("#user_id").focus();
			return;
		}
		if ($("#user_pw").val() == "")
		{
			alert("비밀번호를 입력해주세요.");
			$("#user_pw").focus();
			return;
		}
		
		$("#mainForm").attr("action", "whatsinmybelly/login.action");
		$("#mainForm").submit();
	}
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
					<form class="row d-flex justify-content-end" id="mainForm" method="post">
						<div class="col-md-7 p-0">
							<div class="d-flex">
								<input class="form-control me-sm-2" type="search" placeholder="ID" id="user_id" name="user_id" onkeyup="enterkey()">
								<input class="form-control me-sm-2" type="search" placeholder="PW" id="user_pw" name="user_pw" onkeyup="enterkey()">
							</div>
						</div>
						<div class="col-md-4 p-0 me-2">
							<div class="d-flex">
								<button type="button" class="btn btn-primary my-0 my-sm-0" id="loginBtn">LOGIN</button>
								<!-- 회원가입 -->						
								<button type="button" class="btn btn-primary ms-1 my-2 my-sm-0"
									id="joinBtn" data-bs-toggle="modal"
									data-bs-target="#joinModal">JOIN</button>
								<!-- 정보수정 -->
								<button type="button" class="btn btn-primary p-1 ms-1 my-2 my-sm-0"
									id="infoSearchBtn" data-bs-toggle="modal"
									data-bs-target="#infoSearchModal"><small>정보찾기</small></button>
							</div>
						</div>
					</form>
					<div>
						<c:import url="join_modal.jsp"></c:import>
					</div>
					<div>
						<c:import url="info_search_modal.jsp"></c:import>
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
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-5 p-0">
				<div class="container-fluid">
					<div class="card mb-3">
						<h3 class="card-header">2023.11</h3>
						<div class="card-body p-2">
							<h5 class="card-title">한달 하루 영양 달력</h5>
							<h6 class="card-subtitle text-muted">날짜를 클릭하여 하루를 채우고
								확인해보세요!</h6>
						</div>
						<div class="card-body p-0">
							<!-- 달력자리 -->
							<div class="calendar">
								<c:forEach var="day" begin="1" end="3" step="1">
									<div class="day"></div>
								</c:forEach>
								<c:forEach var="day" begin="1" end="30" step="1">
									<div class="day">${day}</div>
								</c:forEach>
								<c:forEach var="day" begin="1" end="2" step="1">
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
							<h3 class="card-title text-center text-decoration-underline">2023.11.28</h3>
							<br>
							<div class="row d-flex align-items-stretch justify-content-between">
								<div class="col-md-3 pe-1 ps-5">
									<b>식사종류</b>
									<div class="btn-group d-flex" role="group"
										aria-label="Basic radio toggle button group">
										<input type="radio" class="btn-check" name="btnradio"
											id="btnradio1" autocomplete="off" checked="checked">
										<label class="btn btn-outline-primary p-1" for="btnradio1">아침</label>
										<input type="radio" class="btn-check" name="btnradio"
											id="btnradio2" autocomplete="off" checked=""> <label
											class="btn btn-outline-primary p-1" for="btnradio2">점심</label>
										<input type="radio" class="btn-check" name="btnradio"
											id="btnradio3" autocomplete="off" checked=""> <label
											class="btn btn-outline-primary p-1" for="btnradio3">저녁</label>
										<input type="radio" class="btn-check" name="btnradio"
											id="btnradio4" autocomplete="off" checked=""> <label
											class="btn btn-outline-primary p-1" for="btnradio4">간식</label>
									</div>
								</div>
								<div class="col-md-4">
									<b>음식명</b>
									<div class="d-flex">
										<input class="form-control me-sm-2" type="search"
											placeholder="음식명 입력란">
										<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
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
										<input class="form-control me-sm-2" type="search"
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
									<tr>
										<th scope="row">아침</th>
										<td>미역국</td>
										<td>200kcal</td>
										<td>100g</td>
										<td></td>
										<td><button type="button" class="btn btn-outline-secondary btn-sm">삭제하기</button></td>
									</tr>
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