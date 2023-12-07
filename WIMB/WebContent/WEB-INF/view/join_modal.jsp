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

<style type="text/css">

span.Err
{
	display: none;
}

</style>

<script type="text/javascript">

$(document).ready(function()
{
	$("#idAccept").click(function()
	{
		var blank_pattern = /[\s]/g;
		$("#idErr").css("display", "none");
		
		
		var originId = $.trim($("#user_id").val());
		
		if (originId == "" || originId == null)
		{
			$("#idErr").html("아이디를 입력해주세요.");
			$("#idErr").css("display", "inline");
			$("#user_id").focus();
			return;
		}
		else 
		{
			var Id = originId.replace(/\s/g, '');
			
			if (originId.length !== Id.length)
			{					
				$("#idErr").html("아이디에는 공백을 사용할 수 없습니다.");
				$("#idErr").css("display", "inline");
				$("#user_id").focus();
				return;
			}
				
		}
		
		$.ajax(
		{
			type: "POST"
			, url:"idduplicheck.action" 
            , data: {
            	"user_id": $.trim($("#user_id").val())
            	}
			, dataType: "json"
			, success:function(data)
			{
				if (data.count == "0")
				{
					$("#idErr").html("사용 가능한 아이디 입니다.");
					$("#idErr").css("display", "inline");
					$("#idAccept").val("true");
				}
				else
				{
					$("#idErr").html("이미 존재하는 아이디 입니다.");
					$("#idErr").css("display", "inline");
					$("#idAccept").val("false");
					$("#user_id").focus();
				}
			}
			, err:function(e)
			{
				alert(e.responseText);
			}
		});
	});
	
	$("#user_id").keydown(function()
	{
		$("#idAccept").val("false");
		$("#idErr").css("display", "none");
	});
	
	
	$("#telAccept").click(function()
	{
		var blank_pattern = /[\s]/g;
		$("#telErr").css("display", "none");
		
		
		if ($("#tel2").val()== "" || $("#tel2").val() == null)
		{
			$("#telErr").html("전화번호를 입력해주세요.");
			$("#telErr").css("display", "inline");
			$("#tel2").focus();
			return;
		}
		else if ($("#tel3").val()== "" || $("#tel3").val() == null)
		{
			$("#telErr").html("전화번호를 입력해주세요.");
			$("#telErr").css("display", "inline");
			$("#tel3").focus();
			return;
		}
		else 
		{
			var originTel = $.trim($("#tel1").val() + $("#tel2").val() + $("#tel3").val());
			if (checkIfNumeric(originTel) != 0)
			{
				$("#telErr").html("전화번호에는 숫자만 입력가능합니다.");
				$("#telErr").css("display", "inline");
				$("#tel2").focus();
				return;
			}
			
			var Tel = originTel.replace(/\s/g, '');
			
			if (originTel.length !== 11)
			{					
				$("#telErr").html("전화번호 11자리를 입력해주세요.");
				$("#telErr").css("display", "inline");
				$("#tel2").focus();
				return;
			}
				
		}
		
		$.ajax(
		{
			type: "POST"
			, url:"telduplicheck.action" 
            , data: {
            	"user_tel": $.trim(originTel)
            	}
			, dataType: "json"
			, success:function(data)
			{
				if (data.count == "0")
				{
					$("#telErr").html("사용 가능한 전화번호 입니다.");
					$("#telErr").css("display", "inline");
					$("#tel").val(originTel)
					$("#telAccept").val("true");
				}
				else
				{
					$("#telErr").html("이미 존재하는 전화번호 입니다.");
					$("#telErr").css("display", "inline");
					$("#telAccept").val("false");
					$("#tel2").focus();
				}
			}
			, err:function(e)
			{
				alert(e.responseText);
			}
		});
	});
	
	$("#tel2").keydown(function()
	{
		$("#telAccept").val("false");
		$("#telErr").css("display", "none");
	});
	
	$("#tel3").keydown(function()
	{
		$("#telAccept").val("false");
		$("#telErr").css("display", "none");
	});
	
	$("#pwCheck").keyup(function()
	{
		$("#pwErr").css("display", "none");
		$("#pwCheckErr").css("display", "none");
		
		if ($("#user_pw").val() == "")
		{
			$("#pwErr").css("display", "inline");
			$("#pwCheck").val("");
			$("#user_pw").focus();
			return;
		}
		
		if ($("#pwCheck").val() == $("#user_pw").val())
		{
				$("#pwCheckErr").html("비밀번호가 일치합니다.");
				$("#pwCheckErr").css("display", "inline");
				$("#pwCheckVal").val("true");
		}		
		else
		{
			$("#pwCheckErr").html("비밀번호가 일치하지 않습니다.");
			$("#pwCheckErr").css("display", "inline");
			$("#pwCheckVal").val("false");
		}
	});
	
	$("#uer_pw").keydown(function()
	{
		$("#pwCheckVal").val("false");
		$("#pwCheckErr").css("display", "none");
	});
	
	$("#userJoinBtn").click(function()
	{
		if ($("#user_name").val() == "")
		{
			$("#nameErr").css("display", "inline"); 
			$("#user_name").focus();
			return;
		}
		else
			$("#nameErr").css("display", "none"); 
		if ($("#tel").val() == "")
		{
			$("#telErr").html("전화번호를 입력해주세요.");
			$("#telErr").css("display", "inline");
			$("#tel2").focus();
			return;
		}			
		if ($("#telAccept").val() == "false")
		{
			$("#telError").html("중복확인 버튼을 눌러주세요.");
			$("#telError").css("display", "inline");
			$("#telAccept").focus();
			return;
		}
		if ($("#user_id").val() == "")
		{
			$("#idErr").html("아이디를 입력해주세요.");
			$("#idErr").css("display", "inline");
			$("#user_id").focus();
			return;
		}
		if ($("#idAccept").val() == "false")
		{
			$("#idErr").html("중복 확인 버튼을 눌러주세요.");
			$("#idErr").css("display", "inline");
			$("#idAccept").focus();
			return;
		}
		if ($("#user_pw").val() == "")
		{
			$("#pwErr").html("비밀번호를 입력해주세요.");
			$("#pwErr").css("display", "inline");
			$("#user_pw").focus();
			return;
		}
		else
			$("#pwErr").css("display", "none");
		if ($("#pwCheck").val() == "")
		{
			$("#pwErr").html("비밀번호를 한번 더 입력해주세요.");
			$("#pwCheckErr").css("display", "inline");
			$("#pwCheck").focus();
			return;
		}
		else if ($("#pwCheckVal").val() != "true")
		{
			$("#pwCheckErr").html("비밀번호가 일치하지 않습니다.");
			$("#pwCheckErr").css("display", "inline");
			$("#userPwCheck").focus();
			return;
		}
		
		alert("회원가입이 완료되었습니다.");
		
    	$("#joinForm").attr("action", "joinsend.action");
		$("#joinForm").submit();
		
	});
});



function checkIfNumeric(tel_num)
{
	// 값이 숫자로 이루어져 있는지 확인
	if (!isNaN(tel_num))
		return 0;
	else 
		return 1;
}

</script>

</head>
<body>
<form id="joinForm" method="post">
	<div class="modal fade" id="joinModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="staticBackdropLabel">회원가입</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h5>필수사항</h5>
					<div class="form-group">
						<label class="col-form-label mt-4" for="user_name">사용자 이름</label>
						<input type="text" class="form-control" placeholder="사용자이름"
							id="user_name" name="user_name">
						<span class="Err" id="nameErr"><i><small>이름을 입력해주세요.</small></i></span>
					</div>
					<div class="form-group">
						<label class="col-form-label mt-2" for="tel">전화번호</label>
						<div class="d-flex align-items-center justify-content-between">
							<input type="text" class="form-control" placeholder="010"
								id="tel1" value="010"> - <input type="text"
								class="form-control" placeholder="" id="tel2"> -
							<input type="text" class="form-control" placeholder=""
								id="tel3">&nbsp;
							<button type="button" id="telAccept" class="btn btn-outline-primary btn-sm" value="false">
								✓</button>
						</div>
						<span class="Err" id="telErr"><i><small>중복검사를 진행해주세요.</small></i></span>
						<input type="hidden" name="tel" id="tel">
					</div>
					<div class="form-group">
						<label class="col-form-label mt-4" for="idAccept">아이디</label>
						<div class="d-flex align-items-center justify-content-between">
							<input type="text" class="form-control" placeholder="ID"
								id="user_id" name="user_id">&nbsp;
							<button type="button" id="idAccept" class="btn btn-outline-primary btn-sm" value="false">
								✓</button>
						</div>
						<span class="Err" id="idErr"><i><small>중복검사를 진행해주세요.</small></i></span>
					</div>
					<div class="form-group">
						<label for="user_pw" class="form-label mt-4">비밀번호</label>
						<input type="password" class="form-control"
							id="user_pw" name="user_pw" placeholder="Password"
							autocomplete="off">
						<span class="Err" id="pwErr"><i><small>비밀번호를 입력해주세요.</small></i></span>
					</div>
					<div class="form-group">
						<label for="pwCheck" class="form-label mt-4">비밀번호확인</label>
						<input type="password" class="form-control"
							id="pwCheck" placeholder="Password"
							autocomplete="off">
						<span class="Err" id="pwCheckErr"><i><small>비밀번호가 일치하지 않습니다.</small></i></span>
						<input type="hidden" id="pwCheckVal" value="false">
					</div>
					<br>
					<hr>
					<h5>선택사항</h5>
					<div class="form-group">
						<label class="col-form-label mt-4" for="inputDefault">사용자
							설정 일일 총 칼로리</label> <input type="number" class="form-control"
							placeholder="kcal" id="user_cal">
					</div>
					<br> <br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="closeModalBtn">취소</button>
					<button type="button" id="userJoinBtn" class="btn btn-primary">회원가입</button>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>