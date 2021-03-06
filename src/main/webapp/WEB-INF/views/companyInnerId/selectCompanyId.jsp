<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jaga.companyInnerId.model.vo.SelectCompanyIdVo"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가 경리</title>
<style>
	.div-menuTap{
		display: inline-block;
		background: #24574A;
		color:white;
		width:200px;
		height:30px;
		border-top-left-radius:10px;
		border-top-right-radius:10px;
		text-align:center;
		line-height:30px;
	}
	.div-menuTap:hover{
		cursor:pointer;
		opacity:80%;
	}
	
	.div-subjectName{
		background: #24574A;
		color:white;
		width:200px;
		height:30px;
	}
	input{
		width:200px;
	}
	.div-menuTap-no{
		opacity:50%;
	}
	.div-menuTap-no:hover{
		opacity:80%;
	}
	
	#tableMain td{
		height:33px;
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
		
		
		<!-- 로딩화면 -->
	   <div id="loading">
	        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
	    </div>
	   <!-- 로딩화면 끝-->
		
		
		<h2 class="mt-4">사내계정생성</h2>
		<div style="margin-left:68%; height:50px;">
		
		<select name="searchType">
			<option value="number">번호</option>
			<option value="position">직급</option>
			<option value="name">이름</option>
		</select>
		
		<select name="orderType">
			<option value="asc">오름차순</option>
			<option value="desc">내림차순</option>
		</select>
		
		</div>
		<div class="div-menuTap div-menuTap-no" onclick="createId()"><span>직원 계정 생성</span></div>
		<div class="div-menuTap"><span>직원 계정 조회</span></div>
		<script>
			function createId(){
				location.href="showViewCeateCompanyId.vi";
			}
			
		</script>
		<form action="" method="post">
		<table id="tableMain" border="1" style="width:80%; text-align:center;">
		
			<tr style="background:#24574A; color:white; height:33px;">
				<td style="width:10%">번호</td>
				<td style="width:20%">아이디</td>
				<td style="width:30%">이메일</td>
				<td style="width:15%">이름</td>
				<td style="width:15%">직급</td>
				<td style="width:10%">비고</td>
			</tr>
			
			<c:forEach var="target" items="${ list }">
			<tr>
				<td><c:out value="${ target.comInnerIdNum }"></c:out></td>
				<td><c:out value="${ target.id }"></c:out></td>
				<td><c:out value="${ target.email }"></c:out></td>
				<td><c:out value="${ target.name }"></c:out></td>
				<td><c:out value="${ target.positionCode }"></c:out></td>
				<td><button style="background:#24574A; color:white; border-radius:5px; border:1px solid white;">정보수정</button></td>
			</tr>
			</c:forEach>
			
			
		</table>
		</form>
		
		<div class="page-area" style="margin-left:420px; margin-top:30px;">
			
			<button style="background:#24574A; width:35px; height:35px; border:3px solid #24574A; background:white; color:black;"><a href="${ pagePath }"><span><c:out value="<"></c:out></span></a></button>
			
			<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" step="1" var="n">
				
				<c:if test="${ pi.currentPage != n}">
					<c:url value="showViewComInnerIdList.comInId" var="pagePath">
						<c:param name="currentPage" value="${ n }"></c:param>
					</c:url>
					<button style="background:#24574A; width:35px; height:35px; border:3px solid #24574A; background:white; color:black;"><a href="${ pagePath }"><span><c:out value="${ n }"></c:out></span></a></button>
				</c:if>
				
				<c:if test="${ pi.currentPage eq n }">
					<button style="background:#24574A; width:35px; height:35px; border:3px solid #24574A; background:white; color:black;"><b><span><c:out value="${ n }"></c:out></span></b></button>
				</c:if>
				
			</c:forEach>

			<button style="background:#24574A; width:35px; height:35px; border:3px solid #24574A; background:white; color:black;"><a href="${ pagePath }"><span><c:out value=">"></c:out></span></a></button>
			
		</div>
		
		
		
	<!-- //작업공간 -->
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>