
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Forgot extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
		response.getWriter().append("Served at:").append(request.getContextPath());
		String mail = request.getParameter("email");
		System.out.print(mail);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery("select * from user where umail='"+mail+"'");
			while(rs.next()) {
				String name=rs.getString("uname");
				String password =rs.getString("upass");
				System.out.print(name);
				System.out.print(password);
			}
		} catch(Exception e) {System.out.print(e);}
		
		
	}
	

}
