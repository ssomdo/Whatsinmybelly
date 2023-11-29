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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<div class="modal fade" id="infoSearchModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="staticBackdropLabel">회원정보수정</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h5>필수사항</h5>
					<div class="form-group">
						<label class="col-form-label mt-4" for="disabledInput">사용자
							이름</label> <input type="text" class="form-control" placeholder="사용자이름"
							id="inputDefault" disabled="disabled">
					</div>
					<div class="form-group">
						<label class="col-form-label mt-2" for="disabledInput">전화번호
						</label>
						<div class="d-flex align-items-center justify-content-between">
							<input type="text" class="form-control" placeholder="010"
								id="inputDefault" value="010"> - <input type="text"
								class="form-control" placeholder="" id="inputDefault"> -
							<input type="text" class="form-control" placeholder=""
								id="inputDefault" disabled="disabled">&nbsp;
							<button type="button" class="btn btn-outline-primary btn-sm">✓</button>
						</div>
						<span><i><small>중복검사를 진행해주세요.</small></i></span>
					</div>
					<div class="form-group">
						<label class="col-form-label mt-4" for="disabledInput">아이디</label>
						<div class="d-flex align-items-center justify-content-between">
							<input type="text" class="form-control" placeholder="ID"
								id="inputDefault" disabled="disabled">&nbsp;
							<button type="button" class="btn btn-outline-primary btn-sm">✓</button>
						</div>
						<span><i><small>중복검사를 진행해주세요.</small></i></span>
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
						<label class="col-form-label mt-4" for="inputDefault">사용자
							설정 일일 총 칼로리</label> <input type="number" class="form-control"
							placeholder="kcal" id="inputDefault">
					</div>
					<br> <br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="closeSearchModalBtn">취소</button>
					<button type="button" id="searchCompleteBtn" class="btn btn-primary">수정완료</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>