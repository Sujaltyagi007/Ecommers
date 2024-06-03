import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Quantity extends HttpServlet{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
/**
 * 
 */
public static final long serialversionUID = 1l;
@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException  {
	response.setContentType("text/html;charset=UTF-8");
		String action = request.getParameter("act");
		int pid = Integer.parseInt(request.getParameter("pid"));
		System.out.println(action+" "+pid);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommers","root","root");
			if(action.equals("inc")) {
				Statement stmt = cn.createStatement();
				int i= stmt.executeUpdate("update cart set qty = qty+1 where pid= "+pid);
				if(i>0) {System.out.println("Update Successfully");
				response.sendRedirect("showcart.jsp");
				}
				} 
			if(action.equals("dec")) {
			Statement stmt = cn.createStatement();
			int i= stmt.executeUpdate("update cart set qty = case when qty>1 then qty-1 else 1 end where pid="+pid);
			if(i>0) {System.out.println("Update Successfully");
			response.sendRedirect("showcart.jsp");
			}
		}
			else {response.sendRedirect("showcart.jsp");
			
			}
			
	
		}catch(Exception e) {System.out.println(e);	
}
}
  protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException  {
	response.setContentType("text/html;charset=UTF-8");
	
  }}
