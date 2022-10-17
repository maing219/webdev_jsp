<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
Connection con = null;
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "shop";
String password = "1234";
Class.forName("oracle.jdbc.OracleDriver");
con = DriverManager.getConnection(url, user, password);
%>