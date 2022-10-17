<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String cartId = request.getParameter("cartId");
if (cartId == null || cartId.trim().equals("")) {
	response.sendRedirect("cart.jsp");
	return;
}

session.invalidate();
response.sendRedirect("cart.jsp");
%>