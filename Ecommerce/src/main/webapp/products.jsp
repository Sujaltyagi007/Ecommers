<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Luxuirous</title>
<style>
  button a{
   text-decoration: none;
  }
.heading{
margin:20px;
}
button{

}
</style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<body>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");	
	Statement sp = con.createStatement();
	Statement stmt=con.createStatement();
	ResultSet rs=sp.executeQuery("Select * from product");

%>
<div class="heading">
	<h3>Products</h3></div>
<table class="table table-dark table-striped">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">NAME</th>
      <th scope="col">DESCRIPTION</th>
      <th scope="col">SIZE</th>
      <th scope="col">PRICE</th>
      <th scope="col">CATEGORIE</th>
      <th scope="col">ACTION</th>
    </tr>
    <%while(rs.next()){ %>
    <tr>
      <td><%=rs.getString(1) %></td>
      <td><%=rs.getString(2) %></td>
      <td><%=rs.getString(3) %></td>
      <td><%=rs.getString(4) %></td>
      <td><%=rs.getString(5) %></td>
      <td><%=rs.getString(7) %></td>
      <td>
      <span>
      <button type="button" class="btn btn-outline-secondary" style="padding:2%;">
         <a href="deleteproduct.jsp?pid=<%=rs.getInt(1)%>">Delete</a>
       </button>
      <button type="button" class="btn btn-outline-secondary" style="padding:2%;">
         <a href="modifyproduct.jsp?id=<%=rs.getInt(1)%>">Modify</a>
      </button>
      </span>
      </td>
    </tr>
    <%}
    
    }catch(Exception e){System.out.println(e);}%>
  </thead>
</table>
<a href="addproduct.html" type="button" class="btn btn-primary">Add Product</a>

</body>
</html>