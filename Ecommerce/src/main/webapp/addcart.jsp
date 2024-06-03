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
<jsp:include page="navbar.jsp"/>
<%
String pid = request.getParameter("pid");
String uid = request.getParameter("uid");
if(uid.equals("null")){
	  request.setAttribute("successMessage","Please LOGIN to add the product to the Cart.");
	  request.getRequestDispatcher("product.jsp?id="+pid).forward(request,response);
}else{
  try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");
	  PreparedStatement ps = con.prepareStatement("INSERT into cart(pid,uid) SELECT ?,? WHERE NOT EXISTS (select pid, uid  from cart where pid='"+pid+"' and uid='"+uid+"');");
	  ps.setString(1,pid);
	  ps.setString(2,uid);
	  int i = ps.executeUpdate();
	  if(i>0){System.out.println("Data insert Successfully");
	  request.setAttribute("successMessage","Product added Successfully");
	  request.getRequestDispatcher("product.jsp?id="+pid).forward(request,response);
	  }
	  else{
		  System.out.println("You Have an Error");
		  request.setAttribute("successMessage","Product already Added");
		  request.getRequestDispatcher("product.jsp?id="+pid).forward(request,response);
	  }
  }catch(Exception e){System.out.println(e);}
}
%>
</body>
</html>