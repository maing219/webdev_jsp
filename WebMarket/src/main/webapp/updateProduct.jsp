<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script src="./resources/js/validation.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
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
	%>
	<div class="container">
		<div class="row" align="center">
			<div class="col-md-5">
				<img src="/upload/<%=rs.getString("p_fileName")%>"
					style="width: 100%;">
			</div>
			<div class="col-md-7">
				<form name="newProduct" action="./processUpdateProduct.jsp"
					method="post" class="form-horizontal" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">상품코드</label>
						<div class="col-sm-3">
							<input type="text" id="productId" name="productId"
								class="form-control" value='<%=rs.getString("p_id")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품명</label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control"
								value='<%=rs.getString("p_name")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" id="unitPrice" name="unitPrice"
								class="form-control" value='<%=rs.getInt("p_unitPrice")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상세정보</label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2"
								class="form-control"><%=rs.getString("p_description")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">제조사</label>
						<div class="col-sm-3">
							<input type="text" name="manufacturer" class="form-control"
								value='<%=rs.getString("p_manufacturer")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">분류</label>
						<div class="col-sm-3">
							<input type="text" name="category" class="form-control"
								value='<%=rs.getString("p_category")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">재고 수</label>
						<div class="col-sm-3">
							<input type="text" id="unitsInStock" name="unitsInStock"
								class="form-control" value='<%=rs.getLong("p_unitsInStock")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상태</label>
						<div class="col-sm-5">
							<c:set var="condition" value='<%= rs.getString("p_condition") %>' />
							<input type="radio" name="condition" value="New" <c:if test="${ condition.equals('new') }">checked</c:if>>신규 제품
							<input type="radio" name="condition" value="Old" <c:if test="${ condition.equals('old') }">checked</c:if>>중고 제품
							<input type="radio" name="condition" value="Refurbished" <c:if test="${ condition.equals('refurbished') }">checked</c:if>>재생 제품
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="productImage" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="button" onclick="checkAddProduct()"
								class="btn btn-primary" value="등록">
						</div>
					</div>
				</form>
			</div>
		</div>
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
	<hr>
	<jsp:include page="footer.jsp" />
</body>
</html>