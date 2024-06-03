import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Discount extends HttpServlet {
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
	double sum = 0.0;
	String disc = request.getParameter("discount");
	int price = Integer.parseInt(request.getParameter("price"));
	System.out.println(disc);	
	System.out.println(price);
	if(disc.equals("Get50")) {
		sum= 0.5*price;
		System.out.println(sum);
	}
	else if(disc.equals("Get30")){
		sum= price -(0.3*price);
		System.out.println(sum);
	}
	 request.setAttribute("successMessage",sum);
	  request.getRequestDispatcher("showcart.jsp").forward(request,response);
}
}
