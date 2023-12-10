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
<title>회원 정보 찾기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<script type="text/javascript">



</script>

</head>
<body>
	<div class="modal fade" id="infoSearchResultModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="staticBackdropLabel">회원정보찾기</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h5 id="find_info">ID찾기</h5>
					<div class="form-group">
						<label class="col-form-label mt-4" for="disabledInput" id="findinfo_content">
							사용자이름</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="closeSearchResultModalBtn">확인</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>