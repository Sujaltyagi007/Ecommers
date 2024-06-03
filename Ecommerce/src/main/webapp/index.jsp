<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@ page import="filter.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Luxurious</title>
</head>
<style>
body{
background:url(https://c4.wallpaperflare.com/wallpaper/533/463/577/abstract-texture-simple-simple-background-wallpaper-preview.jpg);
background-color:red;
color:black;
}
.card-text b{
margin-right:15px;
}
</style>
<body>
<jsp:include page="navbar.jsp"/>
<%
String filter;
String uid=(String)session.getAttribute("user");

filter=request.getParameter("fil");
if(filter==(null)){
	filter="all";
}
String query= Fill.fil(filter);
try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");
		Statement st= con.createStatement();
		ResultSet rs = st.executeQuery(query);
%>
       
<br>
<div class="container">
<div class="row row-cols-1 row-cols-md-4 g-4">
<%while(rs.next()){
	%>
  <div class="col">
    <a href ="product.jsp?id=<%=rs.getString("pid") %>" style="text-decoration:none;
    color:black;"><div class="card">
      <img src="productimages/<%=rs.getString("pimg") %>" class="card-img-top" alt="..." style="height:170px">
      <div class="card-body">
        <h5 class="card-title" style="align-items:center;"><%=rs.getString("pname") %></h5>
        <p class="card-text"><%=rs.getString("pdesc") %></p>
        <p><b>Price</b>   <%=rs.getString("pprice") %></p>
      </div>
    </div></a>
  </div>
  <%} %>
</div>
</div>
<% }catch(Exception e){System.out.println(e);}%>
</body>
</html>