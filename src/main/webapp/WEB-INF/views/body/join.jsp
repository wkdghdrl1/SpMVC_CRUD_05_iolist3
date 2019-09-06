<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="${rootPath}/resources/css/input.css?ver=20190723">
<link rel="stylesheet" type="text/css" href="${rootPath}/resources/css/button.css?ver=20190723">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
$(function() {
	/// 입력박스에서 focus가 벗어났을 때
	$("#m_userid").blur(function() {
		let m_userid = $(this).val()
		//alert(m_userid)
		$("#check_id").css("display", "none")
		if(m_userid == ""){
			let msg = "회원 ID는 반드시 입력해야 합니다."
			$("#check_id").text(msg)
			$("#check_id").css("display", "block")
			$("#check_id").css("color", "red")
			$("#m_userid").focus()
			return false;
		}
		
		$.ajax({
			url : '${rootPath}/member/check_id?m_userid=' + m_userid,
			method : 'GET'
		})
		.done(function(result) {
			if(result == m_userid){
				let msg = "이미 가입된 ID입니다."
				$("#check_id").text(msg)
				$("#check_id").css("display", "block")
			//alert("이미 가입된 ID입니다. \n" + "다른 ID를 입력해주세요 ")
			$("#m_userid").focus()
			$("#m_userid").select()
			return false;
			}
		})
		
	})
	
	$("#btn-join").click(function() {
		let pass = $("#m_password").val()
		let re_pass = $("#m_re_password").val()
		
		if(pass == ""){
			alert("비밀번호를 입력하세요")
			$("#m_password").focus()
			return false
			
		}
		if(re_pass == ""){
			alert("비밀번호를 입력하세요")
			$("#m_re_password").focus()
			return false
		}
		
		if(pass != re_pass){
		 alert("비밀번호가 다릅니다.")
		 $("#m_password").val("")
		 $("#m_re_password").val("")
		 $("#m_password").focus()
		 return false
		}
		
		$('form').submit()
		
		
	})
})
</script>
<style>
	div.in-box label.join-label{
		width: 230px;
	}
</style>

<form action="${rootPath}/member/join" method="POST">
<fieldset>
	<legend>회원가입</legend>
	<div class="in-box">
		<label for="m_userid" class="join-lable">ID</label> <input type="text" name="m_userid"
			id="m_userid" placeholder="사용자 아이디를 입력하세요.">
			<span id="check_id"></span>
	</div>
	<div class="in-box">
		<label for="m_password" class="join-lable">비밀번호</label><input type="password"
			name="m_password" id="m_password" placeholder="비밀번호를 입력하세요.">
	</div>
		<div class="in-box">
		<label for="m_password" class="join-lable">비밀번호 확인</label><input type="password"
			name="m_re_password" id="m_re_password" placeholder="비밀번호 확인">
	</div>
	
	
	<div class="in-box">
		<label for="m_name" class="join-lable">name</label><input type="text" name="m_name"
			id="m_name" placeholder="이름 주소를 입력하세요.">
	</div>
	<div class="in-box">
		<label for="m_email" class="join-lable">email</label><input type="text" name="m_email"
			id="m_email" placeholder="이메일 주소를 입력하세요.">
	</div>
	<div class="in-box">
		<label for="m_tel" class="join-lable">mobile</label> <input type="text" name="m_tel"
			id="m_tel" placeholder="전화번호를 입력해주세요.">
	</div>
	<div class="btn_box center">
		<button id="btn-join" type="button" class="bz-btn save">회원가입</button>
	</div>

</fieldset>
</form>