<!DOCTYPE html>
<html lang="en">
<%@page import="java.sql.*" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <link rel="stylesheet" href="styles.css">
</head>

<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.container {
    max-width: 400px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    margin-bottom: 5px;
}

input[type="text"],
input[type="email"],
input[type="password"],
input[type="file"] {
    width: 95%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

button {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #0056b3;
}
.logo img{
width:150px;
height:auto;
}
select{
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}
#phone{
   height:30px;
   width:100%;
}
.center{
   display:flex;
   justify-content:center;
}
button{
   margin-bottom:5px;
}
</style>
<body>
<%
String id = (String)request.getParameter("id");
System.out.print(id);
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from product where pid='"+id+"'");
	while(rs.next()){ 

%>

    <div class="container">
        <h2>Modify Product</h2>
        <form action="Modifypro" method="post" enctype="multipart/form-data">
            <div class="form-group">
            <input type="hidden" id="id" name="pid" value="<%=rs.getInt("pid") %>" required>
                <label for="product name">Product Name :</label>
                <input type="text" id="name" value="<%=rs.getString("pname") %>" name="name" required>
            </div>
            <div class="form-group">
                <label for="productdescription">Product Description :</label>
                <input type="text" id="product" value="<%=rs.getString("pdesc") %>" name="desc" required>
            </div>
            <div class="form-group">
                <label for="phone">Product Size :</label>
                <select name="size">
                  <option value="<%=rs.getString("psize")%>"><%=rs.getString("psize")%></option>
                  <option value="s">S</option>
                  <option value="m">M</option>
                  <option value="l">L</option>
                  <option value="xl">XL</option>
                  </select>
            </div>
            <div class="form-group">
                <label for="address">Product Price :</label>
                <input type="text" id="price"  value="<%=rs.getFloat("pprice") %>"name="price" required>
            </div>
            <div class="form-group">
                <label for="image">Product Image:</label>
                <input type="file" id="image" value="<%=rs.getString("pimg") %>" name="image" >
            </div>
            <div class="form-group">
                <label for="type">Product Categories :</label>
                <select name="type">
                <option value="<%=rs.getString("pcat") %>"><%=rs.getString("pcat") %></option>
                <option value="mens">Mens</option>
                <option value="women">Womens</option>
                <option value="sports">Sports</option>
                </select>
            </div>
            <button type="submit">Register</button> 
        </form>
    </div>
    <% }
	}

catch(Exception e){System.out.println(e);} %>
</body>
</html>
