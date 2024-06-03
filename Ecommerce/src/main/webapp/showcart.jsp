<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
@media (min-width: 1025px) {
.h-custom {
height: 100vh !important;
}
}

.card-registration .select-input.form-control[readonly]:not([disabled]) {
font-size: 1rem;
line-height: 2.15;
padding-left: .75em;
padding-right: .75em;
}

.card-registration .select-arrow {
top: 13px;
}

.bg-grey {
background-color: #eae8e8;
}

@media (min-width: 992px) {
.card-registration-2 .bg-grey {
border-top-right-radius: 16px;
border-bottom-right-radius: 16px;
}
}
.text-uppercase b{
margin-left:60px;
}
.apply a{
text-decoration:none;
color:black;}

.apply a:hover{
text-decoration:none;
color:black;}

@media (max-width: 991px) {
.card-registration-2 .bg-grey {
border-bottom-left-radius: 16px;
border-bottom-right-radius: 16px;
}
}
</style>
<body>
<jsp:include page="navbar.jsp" />
<section class="h-100 h-custom" style="background-color: #d2c9ff;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12">
        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
          <div class="card-body p-0">
            <div class="row g-0">
           <%
String uid= (String)session.getAttribute("uid");
try{
	int sum=0;
  Class.forName("com.mysql.jdbc.Driver");
  Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");
  Statement stmt = Con.createStatement();
  Statement stmt1 = Con.createStatement();
  Statement stmt2 = Con.createStatement();
  Statement stmt3 = Con.createStatement();
  ResultSet rs = stmt.executeQuery("select * from product inner join cart where product.pid = cart.pid and cart.uid='"+uid+"'");
  ResultSet rs1 = stmt1.executeQuery("select count(uid) from cart where uid="+uid);
  ResultSet rs2 = stmt2.executeQuery("select cart.* from cart join product on product.pid=cart.pid where uid='"+uid+"' order by product.pid");
  ResultSet rs3 = stmt3.executeQuery("select (product.pprice * cart.qty) as total from product join cart on product.pid=cart.pid where cart.uid='"+uid+"' order by product.pid");
  rs1.next();
%>
              <div class="col-lg-8">
                <div class="p-5">
                  <div class="d-flex justify-content-between align-items-center mb-5"> 
                    <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                    <h6 class="mb-0 text-muted"><%out.print(rs1.getInt("count(uid)")); %> items	</h6>
                  </div>
                  <hr class="my-4">
                  <%while(rs.next() && rs2.next() && rs3.next()){
                  sum = sum+rs3.getInt("total");
                  System.out.println(sum);
                  %>
                  <div class="row mb-4 d-flex justify-content-between align-items-center">
                    <div class="col-md-2 col-lg-2 col-xl-2">
                      <img
                        src="productimages/<%=rs.getString("pimg") %>"
                        class="img-fluid rounded-3" alt="Cotton T-shirt">
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-3">
                      <h6 class="text-muted"><%=rs.getString("pname") %></h6>
                      <h6 class="text-black mb-0">Cotton T-shirt</h6>
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                     <a href="Quantity?pid=<%=rs2.getInt("pid")%>&act=dec" data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                        onclick="">
                        <i class="fas fa-minus"></i>
                      </a>

                      <input id="form1" name="quantity" value="<%=rs2.getInt("qty")%>" type="text"
                        class="form-control form-control-sm" />

                      <a href="Quantity?pid=<%=rs2.getInt("pid")%>&act=inc" data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                        onclick="">
                        <i class="fas fa-plus"></i>
                      </a>
                    </div>
                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                      <h6 class="mb-0"><%=rs3.getInt("total")%></h6>
                    </div>
                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                      <a href="removecart.jsp?uid=<%out.print(uid);%>&pid=<%=rs.getInt("pid")%>" ><i class="fas fa-times"></i></a>
                    </div>
                  </div>
                              <%} %>      

                  <hr class="my-4">
                  
                  <div class="pt-5">
                    <h6 class="mb-0"><a href="index.jsp" class="text-body"><i
                          class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 bg-grey">
                <div class="p-5">
                  <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                  <hr class="my-4">

                  <div class="d-flex justify-content-between mb-4">
                    <h5 class="text-uppercase">Grand Total <b><%out.print(sum);%></b></h5>
                    <h5></h5>
                  </div>

                  <h5 class="text-uppercase mb-3">Shipping</h5>

                  <div class="mb-4 pb-2">
                    <select data-mdb-select-init>
                      <option value="1">Standard-Delivery- Rs 5.00</option>
                      <option value="2">Two</option>
                      <option value="3">Three</option>
                      <option value="4">Four</option>
                    </select>
                  </div>

                  <h5 class="text-uppercase mb-3">Give code</h5>

                  <form action="Discount" method="get"><div class="mb-5">
                    <div data-mdb-input-init class="form-outline">
                    <input type="hidden" id="form3Examplea2" value="discount" name="action" />
                     <input type="hidden" id="form3Examplea2" value="<%out.print(sum); %>" name="price" />
                      <input type="text" id="form3Examplea2" class="form-control form-control-lg"  name="discount" />
                      <label class="form-label" for="form3Examplea2">Enter your code</label>
                    </div>
                    <input type="submit" class="btn btn-outline-success apply" value="APPLY" />
                  </div></form>

                  <hr class="my-4">

                  <div class="d-flex justify-content-between mb-5">
                    <h5 class="text-uppercase">Total price</h5>
                    <h5>${successMessage}</h5>
                  </div>

                  <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-block btn-lg"
                    data-mdb-ripple-color="dark">Order Now</button>

                </div>
              </div><%
              }catch(Exception e){System.out.println(e);}
				%>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>