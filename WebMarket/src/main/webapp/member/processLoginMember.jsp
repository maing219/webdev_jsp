<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="dbconn.jsp"%>
<fmt:requestEncoding value="utf-8" />
<sql:query var="resultSet" dataSource="${ dataSource }">
	select * from member where id=? and password=?
	<sql:param value="${ param.id }" />
	<sql:param value="${ param.password }" />
</sql:query>
<c:forEach var="row" items="${ resultSet.rows }">
	<c:set var="sessionId" value="${ param.id }" scope="session"/>
	<c:redirect url="resultMember.jsp?msg=2"/>
</c:forEach>
<c:redirect url="loginMember.jsp?error=1"/>