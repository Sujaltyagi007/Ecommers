<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
String pid = request.getParameter("pid");
String name = request.getParameter("name");
String desc = request.getParameter("desc");
String size = request.getParameter("size");
String price = request.getParameter("price");	
//Part file = request.getPart("image");
//String img=file.getSubmittedFileName();
String type = request.getParameter("type");
System.out.println(name);
System.out.println(desc);
System.out.println(size);
System.out.println(price);
//System.out.println(image);
System.out.println(type);

/*try{
	String uploadpath = "C:/Users/Dell/eclipse-workspace/Ecommerce/src/main/webapp/productimages/"+img;
	FileOutputStream fos = new FileOutputStream(uploadpath);
	InputStream is = file.getInputStream();
	byte[] data=new byte[is.available()];
	is.read(data);
	fos.write(data);
	fos.close();
}catch(Exception e){System.out.println(e);}*/

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");
	PreparedStatement ps = con.prepareStatement("update product set pname= ? , pdesc= ? , psize=? , pprice=? , pcat=? where pid='"+pid+"'");
	ps.setString(1, name);
	ps.setString(2, desc);
	ps.setString(3, size);
	ps.setString(4, price);
	//ps.setString(5, img);
	ps.setString(5, type);
	int  i = ps.executeUpdate();
	if(i>0)System.out.println("Data Inserted Successful");
	response.sendRedirect("addproduct.html");		
	}catch(Exception e) {System.out.print(e);}






%>
</body>
</html>