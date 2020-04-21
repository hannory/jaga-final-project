<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인!</title>

<style>
.userId {
	position: auto;
	width: 500px;
	height: 50px;
	left: 430px;
	top: 263px;
	background: #FFFFFF;
	border: 1px solid gray;
	box-sizing: border-box;
	border-radius: 5px;
}

.userPwd {
	position: auto;
	width: 500px;
	height: 50px;
	left: 430px;
	top: 328px;
	background: #FFFFFF;
	border: 1px solid gray;
	box-sizing: border-box;
	border-radius: 5px;
}

.business_registry_number {
	position: auto;
	width: 500px;
	height: 50px;
	left: 430px;
	top: 393px;
	background: #FFFFFF;
	border: 1px solid #000000;
	box-sizing: border-box;
}

.loginBtn {
	position: auto;
	width: 500px;
	height: 50px;
	left: 430px;
	top: 500px;
	background: #1B5748;
	border: 1px solid #000000;
	box-sizing: border-box;
	border-radius: 15px;
}

.join_id_pwd{
	left: 300px;
	top: 950px;
	
}

.jagalogo {
	width: 350px;
	height: 300px;
	left: auto;
}


.join_id_pwd2 {
	position: absolute;
	width: 100px;
	height: 50px;  
	left: 630px;
	top: 705px;
}

.join_id_pwd3 {
	position: absolute;
	width: 100px;
	height: 50px;
	left: 730px;
	top: 705px;
}

.blank {
	height: 75px;
}
</style>

</head>

<body>

	<c:set var ="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
	
	<br>
	<div style="height:250px;"></div>
	<div align="center">
		<img src="${contextPath }/resources/images/logo_vertical.PNG" style="max-width: 100%; height: auto;" class="jagalogo">
	</div>
	
	<div class="loginArea" align="center">
	 	<c:if test="${empty sessionScope.loginCompany }">
		
		<form action ="login.co" method="post">
			<table id="loginTable" style="text-align:center">
				<tr>
					<td><input type="text" name="companyId" class="userId" placeholder="아이디"></td>
					<td class="blank"></td>
					<td></td>
				</tr>
				
				<tr>
					<td><input type="password" name="companyPwd" class="userPwd" placeholder="비밀번호"></td>
					<td class="blank"></td>
					<td></td>
				</tr>
				
				<tr>
					<td colspan="3">
						<button class="loginBtn" style="color:white; font-size:25px"> 로그인 </button>
					</td>
					<td class="blank"></td>
					<td class="blank"></td>
				</tr>
				
			</table>
					<div class="join_id_pwd"><a href="companyJoinView.co"> 회원가입 </a></div> 
		</form>
 		</c:if> 
 
			<button onclick="logout()">로그아웃</button>  
	</div>
	
	<script>
		function logout(){
			location.href="${contextPath}/logout.co"
		}
	</script>
	
</body>
</html>