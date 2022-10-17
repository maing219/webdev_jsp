<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet"
	href="./resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<div class="container">
		<div class="row" align="center">
			<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from product";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			%>
			<div class="col-md-4">
				<img src="/upload/<%= rs.getString("p_fileName") %>" style="width: 100%;">
				<h3><%= rs.getString("p_name") %></h3>
				<p><%= rs.getString("p_description") %>
				<p><%= rs.getInt("p_unitPrice") %>
					<!-- ./product.jsp?id=P1234 -->
				<p>
					<a href="./product.jsp?p_id=<%= rs.getString("p_id") %>" class="btn btn-secondary">상세정보&raquo;</a>
			</div>
			<%
			}
			
			if(rs != null)
				rs.close();
			if(con != null)
				con.close();
			if(pstmt != null)
				pstmt.close();
			%>

		</div>
	</div>
	<hr>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>