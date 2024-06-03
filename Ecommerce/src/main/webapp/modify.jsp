<!DOCTYPE html>
<%@page import="java.sql.*" %>
<html lang="en">
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
</style>
<body>
<%
try{
	String id=(String)request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");	
	Statement sp = con.createStatement();
	ResultSet rs=sp.executeQuery("Select * from user where uid="+id);
	while(rs.next()){
%>
    <div class="container">
        <h2>Register</h2>
        <form action="reg1.jsp" method="post">
            <div class="form-group">
            <input type="hidden" id="id" name="uid" value="<%=rs.getInt(1) %>" required>
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="<%=rs.getString(2) %>" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%=rs.getString(3) %>" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="<%=rs.getString(4) %>" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="number" id="phone" name="phone" value="<%=rs.getString(5) %>" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address"  value="<%=rs.getString(6) %>" required>
            </div>
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" id="image" name="image" required>
            </div>
            <div class="form-group">
                <label for="type">User Type:</label>
                <select name="type">
                <option>select</option>
                <option value="admin">admin</option>
                <option value="seller">seller</option>
                <option value="user">user</option>
                </select>
            </div>
            <button type="submit">Register</button> 
        </form>
    </div>
    <%}
	}catch(Exception e){System.out.println(e);}
	%>
</body>
</html>
