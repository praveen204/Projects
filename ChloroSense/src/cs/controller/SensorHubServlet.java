package cs.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.beans.SensorHub;
import cs.dao.SensorHubDao;

/**
 * Servlet implementation class SensorHubServlet
 */
public class SensorHubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SensorHubServlet() {
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
		if(sensorhub!=""&&sensorhub!=null)
		{
			SensorHubDao shd=new SensorHubDao();
			shd.deleteSensorHub(Integer.parseInt(sensorhub));
			   ArrayList<SensorHub> al2=shd.selectAllHubs();
			   session.setAttribute("sensorhubs", al2);
			response.sendRedirect(request.getContextPath()+"/lumino/DeleteSenHub.jsp?msg=yes");
		}
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	String location=request.getParameter("location")==null?null:request.getParameter("location").toString();
	String description=request.getParameter("description")==null?null:request.getParameter("description").toString();
	String sensorhub=request.getParameter("sensorhub")==null?null:request.getParameter("sensorhub").toString();
	if(location!=""&& sensorhub!=""&&description!="")
	{
	SensorHubDao shd=new SensorHubDao();
	SensorHub sh=new SensorHub();
	sh.setHubName(sensorhub);
	sh.setLocation(location);
	sh.setHubDesc(description);
	shd.addSensorHub(sh);
	response.sendRedirect(request.getContextPath()+"/lumino/AddSenHub.jsp?msg=yes");
	}
	
	}

}
