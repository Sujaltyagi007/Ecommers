``````````
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.nav-link:hover{
transform: scale(1.2);
transition: 0.3s;
}
.form-control{
display:flex;
justify-content:center;
align-items:center;
}
.btn-info{
margin-left:8px;
}
li{
list-style:none;
}
</style>
<body>
<%
String uid=(String)session.getAttribute("uid");
String role=(String)session.getAttribute("role");
String name=(String)session.getAttribute("name");
session.setAttribute("user", uid);
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Luxurious style</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" 
    aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp ">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Mens</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Womens</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Kids</a>
        </li>
        <li class="nav-item dropdown">
         <% if(name!=null){%>
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"><%out.print(name);%></a><%} 
        else{ %>
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-user"></i></a><% }	%>
               <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
            <li><a class="dropdown-item" href="
            <%if(role==null){out.print("#");}
            else{out.print(role);}
            %>.jsp
            ">Dash board</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="<%if(role==null){
            	out.print("Login_page.jsp");
            }else{
            	out.print("logout.jsp");
            } %>"><%if(role==null){
            	out.print("login");
            }else{
            	out.print("logout");
            } %></a></li>
          </ul>
        </li>
        
        <li class="nav-item">
        <%if(name!=null) {%>
          <a class="nav-link" href="showcart.jsp"><i class="fa-solid fa-cart-shopping"></i>
          <%}else{ %>
          <a class="nav-link disabled" href="showcart.jsp"><i class="fa-solid fa-cart-shopping"></i>
          <%} %>
          <sup>
          <%
          try{
        	  Class.forName("com.mysql.jdbc.Driver");
        	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");
        	  Statement stmt=con.createStatement();
        	  ResultSet rs=stmt.executeQuery("select count(uid) as count from cart where uid="+uid);
        	  rs.next();
        	  out.print(rs.getInt("count"));
          }catch(Exception e){System.out.println(e);}
          %>
          
          
          
          </sup></a>
        </li>
         <% if (name!=null){%>
        <li class="nav-item">
          <a class="nav-link" href="order.jsp">Order</a>
        </li>
       <%  }%>
      </ul>
       <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Filter
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item active" href="index.jsp?fil=all">All Price</a></li>
            <li><a class="dropdown-item" href="index.jsp?fil=l2000">less than 2000</a></li>
            <li><a class="dropdown-item" href="index.jsp?fil=l3000">Greater than 3000</a></li>
          </ul>
        </li>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
     
    </div>
  </div>
</nav>
</body>
</html>