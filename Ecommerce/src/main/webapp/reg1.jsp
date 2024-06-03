<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String uname = request.getParameter("username");
String umail = request.getParameter("email");
String upass= request.getParameter("password");
String uphone= request.getParameter("phone");
String uadd= request.getParameter("address");
String uimg= request.getParameter("image");
String urole= request.getParameter("type");
String uid=request.getParameter("uid");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");
	PreparedStatement ps = con.prepareStatement("UPDATE `ecommers`.`user` SET `uname` = ?, `umail` = ?, `upass` = ?, `uphone` = ?, `uadd` = ?, `uimg`= ?, `urole` = ? where uid="+uid);
	ps.setString(1, uname);
	ps.setString(2, umail);
	ps.setString(3, upass);
	ps.setString(4, uphone);
	ps.setString(5, uadd);
	ps.setString(6, uimg);
	ps.setString(7, urole);
	
int  i = ps.executeUpdate();
if(i>0)System.out.println("Data Inserted Successful");
}catch(Exception e){System.out.println(e);}
%>
</body>
</html>