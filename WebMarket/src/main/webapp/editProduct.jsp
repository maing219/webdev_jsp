<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 편집</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script>
	function deleteConfirm(id) {
		if(confirm("해당 상품을 삭제합니다!!") == true) {
			location.href="./deleteProduct.jsp?p_id=" + id;
		} else {
			return;
		}
	}
</script>
</head>
<%
String edit = request.getParameter("edit");
%>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 편집</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<div class="container">
		<div class="row" align="center">
			<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from product";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="/upload/<%=rs.getString("p_fileName")%>"
					style="width: 100%;">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><%=rs.getInt("p_unitPrice")%>
				<p>
					<%
					if (edit.equals("update")) {
					%>
					<a href="./updateProduct.jsp?p_id=<%=rs.getString("p_id")%>"
						class="btn btn-success">수정&raquo;</a>
					<%
					} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%= rs.getString("p_id") %>')" class="btn btn-danger">삭제&raquo;</a>
					<%
					}
					%>
				
			</div>
			<%
			}

			if (rs != null)
			rs.close();
			if (con != null)
			con.close();
			if (pstmt != null)
			pstmt.close();
			%>

		</div>
	</div>
	<hr>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>