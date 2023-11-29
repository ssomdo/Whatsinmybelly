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
					<h4 class="modal-title" id="staticBackdropLabel">회원정보찾기</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h5>ID찾기</h5>
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
								id="inputDefault">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="searchCompleteBtn" class="btn btn-primary">찾기</button>
					</div>
					<br>
					<hr>
					<h5>PW찾기</h5>
					<div class="form-group">
						<label class="col-form-label mt-4" for="inputDefault">아이디</label>
						<div class="d-flex align-items-center justify-content-between">
							<input type="text" class="form-control" placeholder="ID"
								id="inputDefault">
						</div>
					</div>
					<div class="form-group">
						<label class="col-form-label mt-2" for="disabledInput">전화번호
						</label>
						<div class="d-flex align-items-center justify-content-between">
							<input type="text" class="form-control" placeholder="010"
								id="inputDefault" value="010"> - <input type="text"
								class="form-control" placeholder="" id="inputDefault"> -
							<input type="text" class="form-control" placeholder=""
								id="inputDefault">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="searchCompleteBtn" class="btn btn-primary">찾기</button>
					</div>
					<br> <br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="closeSearchModalBtn">취소</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>