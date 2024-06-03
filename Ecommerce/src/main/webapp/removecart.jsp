<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uid = (String)request.getParameter("uid");
String pid = (String)request.getParameter("pid");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");
	Statement stmt = cn.createStatement();
	int i = stmt.executeUpdate("Delete from cart where uid='"+uid+"'and pid='"+pid+"'");
	if(i>0){System.out.println("Delete Successfully");
	response.sendRedirect("showcart.jsp");
	}
} catch(Exception e){System.out.println(e);}
%>

</body>
</html>