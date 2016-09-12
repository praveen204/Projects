package cs.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.beans.Sensor;
import cs.beans.SensorHub;
import cs.beans.SensorType;
import cs.beans.Users;
import cs.dao.SensorDao;
import cs.dao.SensorHubDao;
import cs.dao.SensorTypeDao;
import cs.dao.UsersDao;

/**
 * Servlet implementation class SensorServlet
 */
public class SensorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SensorServlet() {
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
			SensorDao sd=new SensorDao();
			
			
			int i=sd.deleteSensor(Integer.parseInt(sensorhub), Integer.parseInt(sensorType), Integer.parseInt(user));
			if(i!=0){
				SensorHubDao shd=new SensorHubDao();
				 ArrayList<SensorHub> al2=shd.selectAllHubs();
				 SensorTypeDao std=new SensorTypeDao();
				 ArrayList<SensorType> al=std.viewAllSensorTypes();
				   session.setAttribute("sensorhubs", al2);
				   session.setAttribute("sensortypes", al);
				response.sendRedirect(request.getContextPath()+"/lumino/DeleteSensor.jsp?msg=yes");
			}else if(i==0)
				response.sendRedirect(request.getContextPath()+"/lumino/DeleteSensor.jsp?msg=no");
			
			
			
			
			}
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String sname=request.getParameter("sname")==null?null:request.getParameter("sname").toString();
		String desc=request.getParameter("desc")==null?null:request.getParameter("desc").toString();
		String sensorhub=request.getParameter("sensorhub")==null?null:request.getParameter("sensorhub").toString();
		String mftr=request.getParameter("mftr")==null?null:request.getParameter("mftr").toString();
		String sensorType=request.getParameter("sensortype")==null?null:request.getParameter("sensortype").toString();
		
	if(sname!=""&&desc!=""&&sensorhub!=""&&mftr!=""&&sensorType!=""&&sname!=null&&desc!=null&&sensorhub!=null&&mftr!=null&&sensorType!=null)
	{
		SensorDao sd=new SensorDao();
		Sensor s=new Sensor();
		s.setSensorName(sname);
		s.setDescription(desc);
		s.setManufacturer(mftr);
		s.setSensorTypeId(Integer.parseInt(sensorType));
		s.setHubId(Integer.parseInt(sensorhub));
		sd.addSensor(s);
		response.sendRedirect(request.getContextPath()+"/lumino/AddSensor.jsp?msg=yes");
	}
		
		
	}

}
