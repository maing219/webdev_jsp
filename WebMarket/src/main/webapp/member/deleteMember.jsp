<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="dbconn.jsp"%>
<c:set var="sessionId" value="${ sessionScope.sessionId }"/>
<sql:update var="resultSet" dataSource="${ dataSource }">
	delete from member where id=?
	<sql:param value="${ sessionId }" />
</sql:update>
<c:if test="${ resultSet >= 1 }">
	<c:import url="logoutMember.jsp"/>
	<c:redirect url="resultMember.jsp"/>
</c:if>