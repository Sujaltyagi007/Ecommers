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
String name = request.getParameter("name");
String pass = request.getParameter("password");
String role;
String uid;
String nam;
System.out.println(name);
System.out.println(pass);

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");	
	Statement sp = con.createStatement();
	ResultSet rs=sp.executeQuery("Select * from user where umail='"+name+"' and upass='"+pass+"'");	
	
	while(rs.next()){
		 role=rs.getString("urole");
		 uid=rs.getString("uid");
		 nam=rs.getString("uname");
		 System.out.println(uid+" "+role);
		 System.out.println("Login Successful");
			if("admin".equals(role)){
				session.setAttribute("uid", uid);
				session.setAttribute("role", role);
				session.setAttribute("name", nam);
		    response.sendRedirect("admin.jsp");
		    }else if("seller".equals(role)){
				session.setAttribute("uid", uid);
				session.setAttribute("role", role);
				session.setAttribute("name", nam);
			    response.sendRedirect("seller.jsp");
			}else if("user".equals(role)){
				session.setAttribute("uid",uid);
				session.setAttribute("role", role);
				session.setAttribute("name", nam);
				response.sendRedirect("user.jsp");
			}else{
				System.out.println("Error Found!");
				response.sendRedirect("Login_page.html");
			}
 	}
}catch(Exception e){System.out.println(e);}
%>
</body>
</html>