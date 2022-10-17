<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp"%>
<%
String productId = request.getParameter("p_id");
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = "select * from product where p_id=?";
pstmt = con.prepareStatement(sql);
pstmt.setString(1, productId);
rs = pstmt.executeQuery();
if (rs.next()) {
	sql = "delete from product where p_id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.executeUpdate();
} else {
	out.println("일치하는 상품이 없습니다.");
}

if (rs != null)
	rs.close();
if (con != null)
	con.close();
if (pstmt != null)
	pstmt.close();

response.sendRedirect("editProduct.jsp?edit=delete");
%>