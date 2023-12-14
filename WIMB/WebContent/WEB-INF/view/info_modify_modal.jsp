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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>


</head>
<body>
	<div class="modal fade" id="infoModifyModal" data-bs-backdrop="static"
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
							id="user_name" disabled="disabled">
					</div>
					<div class="form-group">
						<label class="col-form-label mt-2" for="disabledInput">전화번호
						</label>
						<div class="d-flex align-items-center justify-content-between">
							<input type="text" class="form-control" placeholder="010"
								id="tel1" value="010"> - <input type="text"
								class="form-control" placeholder="" id="tel2"> -
							<input type="text" class="form-control" placeholder=""
								id="tel3" disabled="disabled">&nbsp;
							<button type="button" class="btn btn-outline-primary btn-sm">✓</button>
						</div>
					</div>
					<div class="form-group">
						<label class="col-form-label mt-4" for="disabledInput">아이디</label>
						<div class="d-flex align-items-center justify-content-between">
							<input type="text" class="form-control" placeholder=""
								id="user_id" disabled="disabled">&nbsp;
							<button type="button" class="btn btn-outline-primary btn-sm">✓</button>
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1" class="form-label mt-4">기존 비밀번호</label>
						<input type="password" class="form-control"
							id="exampleInputPassword1" placeholder="Password"
							autocomplete="off">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1" class="form-label mt-4">새로운 비밀번호</label>
						<input type="password" class="form-control"
							id="exampleInputPassword1" placeholder="Password"
							autocomplete="off">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1" class="form-label mt-4">새로운 비밀번호확인</label>
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
						data-bs-dismiss="modal" id="closeModifyModalBtn">취소</button>
					<button type="button" id="searchCompleteBtn" class="btn btn-primary">수정완료</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>