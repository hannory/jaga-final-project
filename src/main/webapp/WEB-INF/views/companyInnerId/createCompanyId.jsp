<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.div-menuTap{
		display: inline-block;
		background: darkgreen;
		color:white;
		width:200px;
		height:50px;
	}
	.div-menuTap:hover{
		cursor:pointer;
		opacity:80%;
	}
	
	.div-subjectName{
		/* background: darkgreen; */
		color:black;
		width:200px;
		height:30px;
	}
	input{
		width:200px;
		border-radius:10px;
	}
	select{
		border-radius:10px;
	}
	.div-box-area{
		/* background:red; */
		width:80%;
		height:50%;
		border:2px solid green;
	}
	.div-input-area{
		/* background:pink; */
		margin:50px;
	}
	.div-subjectName{
		text-align:center;
		border-radius:10px;
		border:2px solid green;
	}
	
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
	<main>
	<div class="container-fluid">
	<!-- 작업공간 -->
		
		<h2 class="mt-4">사내계정생성</h2>
		
		<div style="height:50px;">
		</div>
		
		
		
		<div class="div-menuTap"><span>직원 계정 생성</span></div>
		<div class="div-menuTap" onclick="selectId()" style="opacity:50%"><span>직원 계정 조회</span></div>
		<script>
			function selectId(){
				location.href="showViewSelectId.vi";
			}
			
		</script>
		
		<form action="zzzzzzzzzzzzz" method="post">
		<div class="div-box-area">
		<div class="div-input-area">
		<table cellpadding="20px">
		
			<tr>
				<td>
					<div class="div-subjectName">
						<label>아이디</label>
					</div>
				</td>
				<td><input type="text" name="companyInnerId"></td>
				
				<td>
					<div class="div-subjectName">
						<label>이메일</label>
					</div>
				</td>
				<td><input type="email" name="email"></td>
			</tr>
			
			<tr>
				<td>
					<div class="div-subjectName">
						<label>비밀번호</label>
					</div>
				</td>
				<td><input type="password" name="companyInnerPwd"></td>
				
					<td>
					<div class="div-subjectName">
						<label>이름</label>
					</div>
				</td>
				<td><input type="text" name="name"></td>
			</tr>
			
			<tr>
				<td>
					<div class="div-subjectName">
						<label>비밀번호 확인</label>
					</div>
				</td>
				<td><input type="password" name="companyInnerPwd2"></td>
				
				<td>
					<div class="div-subjectName">
						<label>직급</label>
					</div>
				</td>
				<td>
					<select name="position" style="width:200px;">
						<option value="sajang">사장</option>
						<option value="bujang">부장</option>
						<option value="gwajang">과장</option>					
					</select>
				</td>
			</tr>
			
			<tr>
				<td>
					<div class="div-subjectName">
						<label>서명 또는 도장</label>
					</div>
				</td>
				
				<td>
					<div id="fileArea" style="width:100px; height:100px; border:1px solid black;"></div>
				</td>
			</tr>
			
		</table>
			
			<input type="file" id="fileBtn">
		
			<div align="center" style="margin-top:100px;">
			<button type="submit">생성</button>
			<button type="reset">취소</button>
			</div>
		
		</div>
		</div>
		</form>
		
		<script>
			window.onload = function(){
				var fileArea = document.getElementById("fileArea");
				console.log(fileArea);
				fileBtn.onclick = function(event){
					console.log(event);
					console.log(fileBtn);
				}
			}
		</script>
		
		
		
		
	<!-- //작업공간 -->
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>