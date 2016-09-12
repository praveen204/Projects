package example.servlet;
import java.io.IOException;
import example.servlet.HospDetails;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.annotation.Resource;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Set;
import javax.sql.*;
import java.util.logging.*;

/**
 * Servlet implementation class WelcomeServlet
 */
@WebServlet("/WelcomeServlet")
public class WelcomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        @Resource(lookup = "jdbc/Medico12-sqldb")
	private DataSource myDataSource;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WelcomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	  HttpSession session = request.getSession();
        ArrayList<String> al1=null;
        ArrayList<String> al2=null;
	try{
al1=   searchCities();
al2= searchDiseases();
}catch(Exception e){}
	  session.setAttribute("cities",al1);
     	  session.setAttribute("diseases",al2);
     	
     	
     /*	RequestDispatcher rd = getServletConfig().getServletContext()
				.getRequestDispatcher("/Home.jsp");
		
		rd.forward(request, response);*/
		
		response.sendRedirect(request.getContextPath()+"/Home.jsp");
     	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

 public  ArrayList<String> searchCities() throws Exception
{
ArrayList<String> al=null;
	System.out.println("search called ");
	try{
al=new ArrayList<String>(); 
	 Connection con = myDataSource.getConnection();

		 PreparedStatement ptmt=null;
	
		  ptmt = con.prepareStatement("select distinct hospital_city from Hosp");
		
		  ResultSet rs = ptmt.executeQuery();
					while (rs.next()) {

		
					String s=new String();
					s=rs.getString(1);
						
					al.add(s);
				
					}
		}			
		catch(Exception ex) {
		
	System.out.println("threw exception searchCities ");
	ex.printStackTrace();
	throw ex;
}
		
	
	return al;

			
  }
  
  
    public  ArrayList<String> searchDiseases() throws Exception
{
	ArrayList<String> al=null;
	try {
al=new ArrayList<String>(); 
		
	
	 Connection con = myDataSource.getConnection();
	
		 PreparedStatement ptmt=null;
	
		  ptmt = con.prepareStatement("select distinct Disease from Hosp");
		
		  ResultSet rs = ptmt.executeQuery();
					while (rs.next()) {

		
					String s=new String();
					
					s=rs.getString(1);
						
					al.add(s);
				
					}
		
} catch(Exception ex) {
	
	System.out.println("threw exception searchDiseases ");
	ex.printStackTrace();
	throw ex;
}

	return al;

			
  }




}
