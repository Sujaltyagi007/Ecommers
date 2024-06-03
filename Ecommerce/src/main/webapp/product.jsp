<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style>
.icon-hover:hover {
  border-color: #3b71ca !important;
  background-color: white !important;
  color: #3b71ca !important;
}

.icon-hover:hover i {
  color: #3b71ca !important;
}
body{
background-color:#d2c9ff;
}
</style>
<body>
<jsp:include page="navbar.jsp"/>
<% 
String id= request.getParameter("id");
String uid=(String)session.getAttribute("uid");
System.out.println(uid);
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");	
	Statement sp = con.createStatement();
	ResultSet rs=sp.executeQuery("Select * from product where pid="+id);	
    while(rs.next()){
%>
<section class="py-5">
  <div class="container">
    <div class="row gx-5">
      <aside class="col-lg-6">
        <div class="border rounded-4 mb-3 d-flex justify-content-center">
          <a data-fslightbox="mygalley" class="rounded-4" target="_blank" data-type="image" href="#" >
            <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-4 fit" src="productimages/<%=rs.getString("pimg") %>" />
          </a>
        </div>
      </aside>
      <main class="col-lg-6">
        <div class="ps-lg-3">
          <h4 class="title text-dark">
          <b><%=rs.getString("pname")%></b>
          </h4>
          <div class="d-flex flex-row my-3">
            <div class="text-warning mb-1 me-2">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fas fa-star-half-alt"></i>
              <span class="ms-1">
                4.5
              </span>
            </div>
            <span class="text-muted"><i class="fas fa-shopping-basket fa-sm mx-1"></i>154 orders</span>
            <span class="text-success ms-2">In stock</span>
          </div>

          <div class="mb-3">
            <span><%=rs.getString("pdesc") %></span>
          </div>
          <div class="mb-3">
            <span class="h5">Rs. <%=rs.getString("pprice") %></span>
            <span class="text-muted">/per piece</span>
          </div> 
          <div class="mb-3">
           <a href="addcart.jsp?pid=<%=rs.getString("pid")%>&uid=<%out.print(uid);%>"><button type="button" class="btn btn-info">Add Cart  <i class="fa-solid fa-cart-shopping"></i></button></a>
          </div>
          <%}}catch(Exception e){System.out.println(e);} %>
          <div>
          <p>${successMessage} </p>
          </div>
      </div>
     </main>
     </div>  
     </div>
   </section>
 </body>
</html>
