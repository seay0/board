<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<style type="text/css">
	li {list-style: none; display:inline; margin-right:15px;}
</style>

<html>
	<head>
		<title>Home</title>
		<style>
	 		#btn_group button{
	 			border-radius:5px 5px 5px 5px;
	 			border:1px solid skyblue;
	 			backgroung-color:white;
	 			color:skyblue;
	 			margin-left:10px;
	 			padding:5px 10px}
	 		#btn_group button:hover{
	 			color:white;
	 			background-color:skyblue}
	 	</style>
			<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#logoutBtn").on("click", function(){
				location.href="member/logout";
			})
			$("#registerBtn").on("click", function(){
				location.href="member/register";
			})
			$("#memberUpdateBtn").on("click", function(){
				location.href="member/memberUpdateView";
			})
			$("#memberDeleteBtn").on("click", function(){
				location.href="member/memberDeleteView";
			})
		})
	</script>
	<body>
		<div class="container">
			<h2><b><a href="/">자유 커뮤니티</a></b></h2><hr>
			<ul>
				<li>
					<a href="/board/list">게시판</a>
				</li>
				<li>
					<c:if test="${member == null}">
						<a href="/member/register">회원가입</a>
					</c:if>
				</li>
			</ul>
			<hr>
			<form name='homeForm' method="post" action="/member/login">
				<c:if test="${member == null}">
					<div style="margin-top:15px">
						<label for="userId" class="col-sm-2 control-label">ID : </label>
						<input type="text" style="width:200px" class="chk form-control" id="userId" name="userId" required="required" placeholder="아이디를 입력하세요.">
					</div>
					<div id="btn_group" style="margin-top:15px">
						<label for="userPass" class="col-sm-2 control-label">PASSWORD : </label>
						<input type="password" style="width:200px" class="chk form-control" id="userPass" required="required" name="userPass" placeholder="비밀번호를 입력하세요.">
						<button id="loginBtn" type="submit" style="margin-top:15px" class="btn">로그인</button>
					</div>
				</c:if>
				<c:if test="${member != null }">
					<div>
						<p style="margin-left:30px">${member.userName}님 환영 합니다.</p>
						<div id="btn_group">
							<button id="logoutBtn" type="button">로그아웃</button>
							<button id="memberUpdateBtn" type="button">회원정보수정</button>
							<button id="memberDeleteBtn" type="button">회원탈퇴</button>
						</div>
					</div>
				</c:if>
				<c:if test="${msg == false}">
					<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
				</c:if>
			</form>
		</div>
	</body>
</html>