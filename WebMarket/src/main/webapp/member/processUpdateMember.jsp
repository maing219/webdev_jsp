<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="dbconn.jsp"%>
<fmt:requestEncoding value="utf-8" />
<c:set var="birth"
	value="${ param.birthyy }/${ param.birthmm }/${ param.birthdd }" />
<c:set var="mail" value="${ param.mail1 }@${ param.mail2 }" />
<sql:update var="resultSet" dataSource="${ dataSource }">
	update member set password=?, name=?, gender=?, birth=?, mail=?, phone=?, address=? where id=?
	<sql:param value="${ param.passwd }" />
	<sql:param value="${ param.name }" />
	<sql:param value="${ param.gender }" />
	<sql:param value="${ birth }" />
	<sql:param value="${ mail }" />
	<sql:param value="${ param.phone }" />
	<sql:param value="${ param.address }" />
	<sql:param value="${ param.id }" />
</sql:update>
<c:if test="${ resultSet>=1 }">
	<c:redirect url="resultMember.jsp?msg=0" />
</c:if>