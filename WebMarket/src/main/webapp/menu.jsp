<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="sessionId" value="${ sessionScope.sessionId }" />
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href='<c:url value="/index.jsp"/>'>Home</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<c:choose>
					<c:when test="${ empty sessionId }">
						<li class="nav-item"><a
							href='<c:url value="/member/loginMember.jsp"/>' class="nav-link">로그인</a></li>
						<li class="nav-item"><a
							href='<c:url value="/member/addMember.jsp"/>' class="nav-link">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: white;">[${ sessionId }]님</li>
						<li class="nav-item"><a
							href='<c:url value="/member/logoutMember.jsp"/>' class="nav-link">로그아웃</a></li>
						<li class="nav-item"><a
							href='<c:url value="/member/updateMember.jsp"/>' class="nav-link">회원수정</a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a href='<c:url value="/products.jsp"/>'
					class="nav-link">상품 목록</a></li>
				<li class="nav-item"><a href='<c:url value="/addProduct.jsp"/>'
					class="nav-link">상품 등록</a></li>
				<li class="nav-item"><a
					href='<c:url value="/editProduct.jsp?edit=update"/>'
					class="nav-link">상품 수정</a></li>
				<li class="nav-item"><a
					href='<c:url value="/editProduct.jsp?edit=delete"/>'
					class="nav-link">상품 삭제</a></li>
				<li class="nav-item"><a
					href='<c:url value="/BoardListAction.do?pageNum=1"/>'
					class="nav-link">게시판</a></li>
				<c:choose>
					<c:when test="${ sessionId.equals('admin') }">
						<li class="nav-item"><a
							href='<c:url value="/MemberListAction.member"/>' class="nav-link">회원관리</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>