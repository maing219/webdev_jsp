<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="dbconn.jsp"%>
<fmt:requestEncoding value="utf-8" />
<c:set var="birth"
	value="${ param.birthyy }/${ param.birthmm }/${ param.birthdd }" />
<c:set var="mail" value="${ param.mail1 }@${ param.mail2 }" />
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${ now }" pattern="yyy-MM-dd HH:mm:ss"
	var="timestamp" />
<sql:update var="resultSet" dataSource="${ dataSource }">
	insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ?)
	<sql:param value="${ param.id }" />
	<sql:param value="${ param.passwd }" />
	<sql:param value="${ param.name }" />
	<sql:param value="${ param.gender }" />
	<sql:param value="${ birth }" />
	<sql:param value="${ mail }" />
	<sql:param value="${ param.phone }" />
	<sql:param value="${ param.address }" />
	<sql:param value="${ timestamp }" />
</sql:update>
<c:if test="${ resultSet>=1 }">
	<c:redirect url="resultMember.jsp?msg=1" />
</c:if>