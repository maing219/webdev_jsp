<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String shipping_cartId = "";
	String shipping_shippingDate = "";

	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie thisCookie : cookies) {
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
		}
	}
	%>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
			<p> 주문은 <%= shipping_shippingDate %>에 배송 될 예정입니다.
			<p> 주문번호 <%= shipping_cartId %>
			<p> <a href="products.jsp" class="btn btn-secondary">상품목록&raquo;</a>
		</div>
	</div>
</body>
</html>
<%
session.invalidate();
for(int i=0; i<cookies.length; i++) {
	Cookie thisCookie = cookies[i];
	String n= thisCookie.getName();
	if(n.equals("Shipping_cartId"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_name"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_shippingDate"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_country"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_zipCode"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_addressName"))
		thisCookie.setMaxAge(0);
		response.addCookie(thisCookie);
}
%>