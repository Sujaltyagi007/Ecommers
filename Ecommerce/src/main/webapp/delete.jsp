<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import= "java.sql.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 try{
	 String uid=request.getParameter("id");
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");
	 Statement st=con.createStatement();
	 int i=st.executeUpdate("DELETE FROM user WHERE uid="+uid);
	 out.println("Data Deleted Successfully!");
	 response.sendRedirect("userinfo.jsp");
 }catch(Exception e){System.out.println(e);}
%>
</body>
</html>