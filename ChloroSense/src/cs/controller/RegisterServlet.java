package cs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.beans.SensorHub;
import cs.beans.SensorType;
import cs.beans.Users;
import cs.dao.RegSensorDao;
import cs.dao.SensorDao;
import cs.dao.SensorHubDao;
import cs.dao.SensorTypeDao;
import cs.dao.UsersDao;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		HttpSession session=request.getSession(true);
		String sensorhub=request.getParameter("sensorhub")==null?null:request.getParameter("sensorhub").toString();
		String sensorType=request.getParameter("sensortype")==null?null:request.getParameter("sensortype").toString();
		String user=session.getAttribute("userid")==null?null:session.getAttribute("userid").toString();
		if(sensorhub!=""&&sensorType!=""&&user!=null)
		{System.out.println(sensorhub);
		System.out.println("User is"+user);
			RegSensorDao sd=new RegSensorDao();
			int i=sd.addRegSensor(Integer.parseInt(user), Integer.parseInt(sensorType), Integer.parseInt(sensorhub));
			if(i>0){
			response.sendRedirect(request.getContextPath()+"/lumino/RegisterSensor.jsp?msg=yes");
			
			}
			else if(i==0)
				response.sendRedirect(request.getContextPath()+"/lumino/RegisterSensor.jsp?msg=no");	
			else if(i==-1)
				response.sendRedirect(request.getContextPath()+"/lumino/RegisterSensor.jsp?msg=dup");	
		}	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String uname=(request.getParameter("uname")==null)?null:request.getParameter("uname").toString();
	String pwd=(request.getParameter("pwd")==null)?null:request.getParameter("pwd").toString();
	String cpwd=(request.getParameter("cpwd")==null)?null:request.getParameter("cpwd").toString();
	String trinst=(request.getParameter("state")==null)?null:request.getParameter("state").toString();
	String email=(request.getParameter("email")==null)?null:request.getParameter("email").toString();
	String phone=(request.getParameter("phone")==null)?null:request.getParameter("phone").toString();
	String address=(request.getParameter("address")==null)?null:request.getParameter("address").toString();
	PrintWriter out=	response.getWriter();
	
	
	if(!cpwd.equals(pwd))
		out.println("<span style=\"color:red\">Passwords are not matching</span>");
	else if(uname==""||pwd==""||cpwd==""||trinst==""||email==""||phone==""||address=="")
		out.println("<span style=\"color:red\">Please fill all the details</span>");
	else
	{
		
		Users usr=new Users();
		usr.setUserName(uname);
		usr.setPassword(pwd);
		usr.setState(trinst);
		usr.setEmail(email);
		usr.setPhone(phone);
		usr.setAddress(address);
		UsersDao ud=new UsersDao();
	  int flag=ud.addUser(usr);
	
	  if(flag==1)
		  out.print("Success");
	  else if(flag==-1)
		  out.println("<span style=\"color:red\">User Exists already</span>");
	  else
		  out.println("<span style=\"color:red\">Error occured in Registration</span>");
	
	}
		
	
		
		
	}

}
