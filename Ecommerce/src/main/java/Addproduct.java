import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
@MultipartConfig
public class Addproduct extends HttpServlet{
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
@Override

protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException  {
	response.getWriter().append("Served at: ").append(request.getContextPath());}
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request, response);
	String name = request.getParameter("name");
	String desc = request.getParameter("desc");
	String size = request.getParameter("size");
	String price = request.getParameter("price");	
	Part file = request.getPart("image");
	String img=file.getSubmittedFileName();
	String type = request.getParameter("type");
	System.out.println("name");
	System.out.println("desc");
	System.out.println("size");
	System.out.println("price");
	System.out.println("img");
	System.out.println("type");
	
	try{
		String uploadpath = "C:/Users/Dell/eclipse-workspace/Ecommerce/src/main/webapp/productimages/"+img;
		FileOutputStream fos = new FileOutputStream(uploadpath);
		InputStream is = file.getInputStream();
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
	}catch(Exception e){System.out.println(e);}
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");
		PreparedStatement ps = con.prepareStatement("INSERT INTO `ecommers`.`product` (`pname`, `pdesc`, `psize`, `pprice`, `pimg`, `pcat`) VALUES (?,?,?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2, desc);
		ps.setString(3, size);
		ps.setString(4, price);
		ps.setString(5, img);
		ps.setString(6, type);
		int  i = ps.executeUpdate();
		if(i>0)System.out.println("Data Inserted Successful");
		response.sendRedirect("addproduct.html");		
		}catch(Exception e) {System.out.print(e);}
	
	
	
}
  
}
