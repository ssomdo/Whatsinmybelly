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

<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>

</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><img src="image/wimb_logo.png"
				style="max-width: 100px;"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor04"
				aria-controls="navbarColor04" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="d-flex">
				<div class="collapse navbar-collapse" id="navbarColor04">
					<form class="d-flex">
						<input class="form-control me-sm-2" type="search" placeholder="ID">
						<input class="form-control me-sm-2" type="search" placeholder="PW">
						<button class="btn btn-primary my-2 my-sm-0" type="submit">LOGIN</button>
						<!-- 	<button class="btn btn-primary ms-1 my-2 my-sm-0" type="submit">JOIN</button> -->
						<button type="button" class="btn btn-primary ms-1 my-2 my-sm-0"
							id="joinBtn" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop">JOIN</button>

						<div class="modal fade" id="staticBackdrop"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel">Modal
											title</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<h5>필수사항</h5>
										<div class="form-group">
											<label class="col-form-label mt-4" for="inputDefault">사용자 이름</label>
											<input type="text" class="form-control" placeholder="사용자이름"
												id="inputDefault">
										</div>
										<div class="form-group">
											<label class="col-form-label mt-4" for="inputDefault">아이디</label>
											<input type="text" class="form-control" placeholder="ID"
												id="inputDefault">
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1" class="form-label mt-4">비밀번호</label>
											<input type="password" class="form-control"
												id="exampleInputPassword1" placeholder="Password"
												autocomplete="off">
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1" class="form-label mt-4">비밀번호확인</label>
											<input type="password" class="form-control"
												id="exampleInputPassword1" placeholder="Password"
												autocomplete="off">
										</div>
										<br>
										<hr>
										<h5>선택사항</h5>
										<div class="form-group">
											<label class="col-form-label mt-4" for="inputDefault">사용자 설정 일일 총 칼로리</label>
											<input type="text" class="form-control" placeholder="kcal"
												id="inputDefault">
										</div>
										<br>
										<br>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal" id="closeModalBtn">취소</button>
										<button type="button" id="joinCompleteBtn" class="btn btn-primary">회원가입</button>
									</div>
								</div>
							</div>
						</div>

						<script>
							// 모달 버튼에 이벤트를 건다.  
							$('#joinBtn').on('click', function()
							{
								alert("모달");
								$('#staticBackdrop').modal('show');
							});
							// 모달 안의 취소 버튼에 이벤트를 건다.  
							$('#closeModalBtn').on('click', function()
							{
								$('#staticBackdrop').modal('hide');
							});
						</script>
					</form>
				</div>
			</div>
		</div>
	</nav>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4">
				<div class="container-fluid">
					<div class="card mb-3">
						<h3 class="card-header">2023.11</h3>
						<div class="card-body">
							<h5 class="card-title">한달 하루 영양 달력</h5>
							<h6 class="card-subtitle text-muted">날짜를 클릭하여 하루를 채우고
								확인해보세요!</h6>
						</div>
						<!-- 달력자리 -->
						<svg xmlns="http://www.w3.org/2000/svg"
							class="d-block user-select-none" width="100%" height="200"
							aria-label="Placeholder: Image cap" focusable="false" role="img"
							preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180"
							style="font-size: 1.125rem; text-anchor: middle">
				    <rect width="100%" height="100%" fill="#868e96"></rect>
				    <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
				    </svg>
						<div class="card-body">
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="container-fluid">
					<div class="card">
						<div class="card-body">
							<h3 class="card-title text-center text-decoration-underline">2023.11.28</h3>
							<br>
							<div class="row d-flex align-items-end justify-content-between">
								<div class="col-md-3">
									<div class="btn-group" role="group"
										aria-label="Basic radio toggle button group">
										<input type="radio" class="btn-check" name="btnradio"
											id="btnradio1" autocomplete="off" checked="checked">
										<label class="btn btn-outline-primary p-2" for="btnradio1">아침</label>
										<input type="radio" class="btn-check" name="btnradio"
											id="btnradio2" autocomplete="off" checked=""> <label
											class="btn btn-outline-primary p-2" for="btnradio2">점심</label>
										<input type="radio" class="btn-check" name="btnradio"
											id="btnradio3" autocomplete="off" checked=""> <label
											class="btn btn-outline-primary p-2" for="btnradio3">저녁</label>
										<input type="radio" class="btn-check" name="btnradio"
											id="btnradio4" autocomplete="off" checked=""> <label
											class="btn btn-outline-primary p-2" for="btnradio4">간식</label>
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