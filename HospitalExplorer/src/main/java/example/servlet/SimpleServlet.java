package example.servlet;

import java.io.IOException;
import example.servlet.HospDetails;
import java.util.*;
import javax.servlet.ServletException;
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
 * Servlet implementation class SimpleServlet
 */
@WebServlet("/SimpleServlet")
public class SimpleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Resource(lookup = "jdbc/Medico12-sqldb")
	private DataSource myDataSource;
	
	String str;
	
	

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.getWriter().print("Hello World!");
        
    }
    
      @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        //response.getWriter().print("Hello World!");
        
        
        
        String dis=request.getParameter("disease").toString();
	String city=request.getParameter("city").toString();
	String sort =request.getParameter("sort").toString();
	//response.getWriter().println("Test"+city+dis+sort);
	ArrayList<HospDetails> al=null;
	try{
al=   searchDetails(city,dis,sort);
}catch(Exception e){}
	  session.setAttribute("records",al);
     response.getWriter().print(str);  
    }

public ArrayList<HospDetails> searchDetails(String city,String disease,String sort) throws Exception
{
	
ArrayList<HospDetails> al=new ArrayList<HospDetails>(); 
String nvlvar="-1";
		//Connection con= ConnectionDao.connect();
	
	 Connection con = myDataSource.getConnection();
		 PreparedStatement ptmt=null;
		 if(sort.equals("Ascending"))
		  ptmt = con.prepareStatement("select Disease,Hospital_name,Hospital_street,Hospital_city,Hospital_state,Hospital_zip,Avg_amount,TOTAL_PATIENTS from Hosp where Hospital_city =? and Disease =? order by Avg_amount");
		  else
		 ptmt = con.prepareStatement("select Disease,Hospital_name,Hospital_street,Hospital_city,Hospital_state,Hospital_zip,Avg_amount,TOTAL_PATIENTS from Hosp where Hospital_city =? and  Disease =? order by Avg_amount desc");
  
		  ptmt.setString(1,city);
		  ptmt.setString(2,disease);
		  ResultSet rs = ptmt.executeQuery();
		  
		  if (rs.next()) {
					do {

		
						HospDetails hd=new HospDetails();
						
					 hd.setDisease(rs.getString(1));
					 hd.setHospName(rs.getString(2));
					 hd.setStreet(rs.getString(3));
					 hd.setCity(rs.getString(4));
					 hd.setState(rs.getString(5));
					 hd.setZip(rs.getString(6));
					hd.setAvgAmount(rs.getDouble(7));
					hd.setNoOfPat(rs.getInt(8));
					al.add(hd);	
					}while(rs.next());
					str="Success";
	}
	else
	str="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No data available for the selected criteria";

	
	return al;

			
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