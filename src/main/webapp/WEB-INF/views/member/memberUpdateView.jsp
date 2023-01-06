<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원정보</title>
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
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancle").on("click", function(){
				location.href = "/";
			})
			
			$(".del_btn").on("click", function() {
				location.href = "memberDeleteView"
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				$.ajax({
					url : "/member/passChk",
					type : "POST",
					dateType : "json",
					data : $("#updateForm").serializeArray(),
					success: function(data){
						
						if(data==true){
							if(confirm("회원수정하시겠습니까?")){
								$("#updateForm").submit();
							}
							
						}else{
							alert("패스워드가 틀렸습니다.");
							return;
							
						}
					}
				})
			});
		})
	</script>
	<body>
		<div class="container">
			<section id="container">
				<h2><b><a href="/">자유 커뮤니티</a></b></h2><hr>
				<form id="updateForm" action="/member/memberUpdate" method="post">
					<div class="form-group has-feedback">
						<label class="control-label" for="userId">아이디</label>
						<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userPass">새로운 패스워드</label>
						<input class="form-control" type="password" id="userPass" name="userPass" />
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userName">새로운 성명</label>
						<input class="form-control" type="text" id="userName" name="userName" value="${member.userName}"/>
					</div>
				</form>
					<div id="btn_group" class="form-group has-feedback">
						<button class="btn" type="button" id="submit">회원정보수정</button>
						<button class="del_btn" type="button">회원탈퇴</button>
						<button class="cancle" type="button">취소</button>
					</div>
			</section>
		</div>
		
	</body>
	
</html>