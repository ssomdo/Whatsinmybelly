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

$(document).ready(function()
{
	$("#searchIdBtn").click(function()
	{
		$(".Err").css("display", "none"); 
		
		if ($("#idUser_name").val() == "")
		{
			$("#idNameErr").css("display", "inline");
			$("#idUser_name").focus();
			return;
		}
		if ($("#idTel2").val()== "" || $("#idTel2").val() == null)
		{
			$("#idTelErr").html("전화번호를 입력해주세요.");
			$("#idTelErr").css("display", "inline");
			$("#idTel2").focus();
			return;
		}
		if ($("#idTel3").val()== "" || $("#idTel3").val() == null)
		{
			$("#idTelErr").html("전화번호를 입력해주세요.");
			$("#idTelErr").css("display", "inline");
			$("#idTel3").focus();
			return;
		}
		if ($("#idTel2").val()!= "" || $("#idTel2").val() != null || $("#idTel3").val()!= "" || $("#idTel3").val() != null) 
		{
			var originIdTel = $.trim($("#idTel1").val() + $("#idTel2").val() + $("#idTel3").val());
			if (checkIfNumeric(originIdTel) != 0)
			{
				$("#idTelErr").html("전화번호에는 숫자만 입력가능합니다.");
				$("#idTelErr").css("display", "inline");
				$("#idTel2").focus();
				return;
			}
			
			var Tel = originIdTel.replace(/\s/g, '');
			
			if (originIdTel.length !== 11)
			{					
				$("#idTelErr").html("전화번호 11자리를 입력해주세요.");
				$("#idTelErr").css("display", "inline");
				$("#idTel2").focus();
				return;
			}
		}
		
		
		$.ajax(
		{
			type: "POST"
			, url:"findid.action" 
            , data: {
            	"user_name": $.trim($("#idUser_name").val())
            	,"user_tel": $.trim(originIdTel)
            	}
			, dataType: "json"
			, success:function(data)
			{
				
				if (data.count == "0")
				{
					$("#idUser_name").val("")
					$("#idTel2").val("")
					$("#idTel3").val("")
					
					$("#find_info").text("ID찾기");
					$("#findinfo_content").text("사용자 정보를 찾을 수 없습니다.");
					
					$('#infoSearchModal').modal('hide');
					$('#infoSearchResultModal').modal('show');
				}
				else
				{
					$("#idUser_name").val("")
					$("#idTel2").val("")
					$("#idTel3").val("")
					
					$("#find_info").text("ID찾기");
					$("#findinfo_content").text("찾으시는 아이디는 "+data.count+" 입니다.");
					
					$('#infoSearchModal').modal('hide');
					$('#infoSearchResultModal').modal('show');
				}
			}
			, err:function(e)
			{
				alert(e.responseText);
			}
		});
	});
	
	$("#searchPwBtn").click(function()
	{		
		$(".Err").css("display", "none"); 
		
		if ($("#pwUser_id").val() == "")
		{
			$("#pwIdErr").css("display", "inline");
			$("#pwUser_id").focus();
			return;
		}
		if ($("#pwTel2").val()== "" || $("#pwTel2").val() == null)
		{
			$("#pwTelErr").html("전화번호를 입력해주세요.");
			$("#pwTelErr").css("display", "inline");
			$("#pwTel2").focus();
			return;
		}
		if ($("#pwTel3").val()== "" || $("#pwTel3").val() == null)
		{
			$("#pwTelErr").html("전화번호를 입력해주세요.");
			$("#pwTelErr").css("display", "inline");
			$("#pwTel3").focus();
			return;
		}
		if ($("#pwTel3").val()!= "" || $("#pwTel3").val() != null || $("#pwTel2").val()!= "" || $("#pwTel2").val() != null)
		{
			var originPwTel = $.trim($("#pwTel1").val() + $("#pwTel2").val() + $("#pwTel3").val());
			if (checkIfNumeric(originPwTel) != 0)
			{
				$("#pwTelErr").html("전화번호에는 숫자만 입력가능합니다.");
				$("#pwTelErr").css("display", "inline");
				$("#pwTel2").focus();
				return;
			}
			
			var Tel = originPwTel.replace(/\s/g, '');
			
			if (originPwTel.length !== 11)
			{					
				$("#pwTelErr").html("전화번호 11자리를 입력해주세요.");
				$("#pwTelErr").css("display", "inline");
				$("#pwTel2").focus();
				return;
			}
		}
		
		
		$.ajax(
		{
			type: "POST"
			, url:"findpw.action" 
            , data: {
            	"user_id": $.trim($("#pwUser_id").val())
            	,"user_tel": $.trim(originPwTel)
            	}
			, dataType: "json"
			, success:function(data)
			{
				
				if (data.count == "0")
				{
					$("#pwUser_id").val("")
					$("#pwTel2").val("")
					$("#pwTel3").val("")
					
					$("#find_info").text("PW찾기");
					$("#findinfo_content").text("사용자 정보를 찾을 수 없습니다.");
					
					$('#infoSearchModal').modal('hide');
					$('#infoSearchResultModal').modal('show');
				}
				else
				{
					$("#pwUser_id").val("")
					$("#pwTel2").val("")
					$("#pwTel3").val("")
					
					$("#find_info").text("PW찾기");
					$("#findinfo_content").html("비밀번호를 1234로 초기화 했습니다.<br>로그인 후 반드시 변경해주세요.");
					
					$('#infoSearchModal').modal('hide');
					$('#infoSearchResultModal').modal('show');
				}
			}
			, err:function(e)
			{
				alert(e.responseText);
			}
		});
	});
});

$(function()
{
	
	$('#infoSearchResultModal').on('hidden.bs.modal', function ()
	{
	    $('.modal-backdrop').remove();
	});
	//모달 안의 취소 버튼에 이벤트를 건다.  
	$('#closeSearchResultModalBtn').on('click', function()
	{
		$('#infoSearchResultModal').modal('hide');
	});
	
})

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
							id="idUser_name">
					</div>
					<span class="Err" id="idNameErr">이름을 입력해주세요.</span>
					<div class="form-group">
						<label class="col-form-label mt-2" for="disabledInput">전화번호
						</label>
						<div class="d-flex align-items-center justify-content-between">
							<input type="text" class="form-control" placeholder="010"
								id="idTel1" value="010"> - <input type="text"
								class="form-control" placeholder="" id="idTel2"> -
							<input type="text" class="form-control" placeholder=""
								id="idTel3">
						</div>
						<span class="Err" id="idTelErr">전화번호를 입력해주세요.</span>
					</div>
					<div class="modal-footer">
						<button type="button" id="searchIdBtn" class="btn btn-primary">찾기</button>
					</div>
					<br>
					<hr>
					<h5>PW찾기</h5>
					<div class="form-group">
						<label class="col-form-label mt-4" for="inputDefault">아이디</label>
						<div class="d-flex align-items-center justify-content-between">
							<input type="text" class="form-control" placeholder="ID"
								id="pwUser_id">
						</div>
						<span class="Err" id="pwIdErr">아이디를 입력해주세요.</span>
					</div>
					<div class="form-group">
						<label class="col-form-label mt-2" for="disabledInput">전화번호
						</label>
						<div class="d-flex align-items-center justify-content-between">
							<input type="text" class="form-control" placeholder="010"
								id="pwTel1" value="010"> - <input type="text"
								class="form-control" placeholder="" id="pwTel2"> -
							<input type="text" class="form-control" placeholder=""
								id="pwTel3">
						</div>
						<span class="Err" id="pwTelErr">전화번호를 입력해주세요.</span>
					</div>
					<div class="modal-footer">
						<button type="button" id="searchPwBtn" class="btn btn-primary">찾기</button>
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