<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
h3.error-box {
	background-color: red;
	color: yellow;
	font-size: 20px;
	width: 90px;
	display: none;
}
</style>

<link rel="stylesheet" type="text/css"
	href='${rootPath}/css/login.css?ver=20190724'>

<article class="login-body">
	<form action="${rootPath}/member/login" class="login-form"
		method="POST">
		<h2>login</h2>
		<h3 id="error-msg" class="error-box"></h3>
		<input type="text" name="m_userid" id="m_userid" placeholder="사용자 ID">
		<input type="password" name="m_password" id="m_password"
			placeholder="비밀번호">
		<button id="btn-login">로그인</button>
		<button type="button" id="btn-join">회원가입</button>

	</form>
</article>