<%@page import="mvc.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
List memberList = (List) request.getAttribute("memberlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">회원관리</h1>
		</div>
	</div>
	<div class="container">
		<form method="post">
			<div style="padding-top: 50px;">
				<table class="table table-hover">
					<tr>
						<th>ID</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>성별</th>
						<th>생일</th>
						<th>이메일</th>
						<th>휴대폰</th>
						<th>주소</th>
						<th>계정생성일</th>
					</tr>
					<%
					for (int i = 0; i < memberList.size(); i++) {
						MemberDTO notice = (MemberDTO) memberList.get(i);
					%>
					<tr>
						<td><a href="./MemberViewAction.member?id=<%=notice.getId()%>"><%=notice.getId()%></a></td>
						<td><%=notice.getPassword()%></td>
						<td><%=notice.getName()%></td>
						<td><%=notice.getGender()%></td>
						<td><%=notice.getBirth()%></td>
						<td><%=notice.getMail()%></td>
						<td><%=notice.getPhone()%></td>
						<td><%=notice.getAddress()%></td>
						<td><%=notice.getRegist_day()%></td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
		</form>
	</div>
	<hr>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>