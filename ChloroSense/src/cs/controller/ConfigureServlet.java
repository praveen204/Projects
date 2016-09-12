package cs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.dao.RegSensorDao;

/**
 * Servlet implementation class ConfigureServlet
 */
public class ConfigureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfigureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
String id=request.getParameter("id")==null?null:request.getParameter("id").toString();
String status=request.getParameter("status")==null?null:request.getParameter("status").toString();
response.setContentType("text/html");PrintWriter out=response.getWriter();

if(id!=null &&id!="" && status!="" && status!=null)
{
	RegSensorDao rsd=new  RegSensorDao();
	id=id.substring(6);
	StringTokenizer st=new StringTokenizer(id, ",");
	String sensorId=st.nextToken();
     String  userId=st.nextToken();
System.out.println(sensorId);
System.out.println(userId);
	
	int i=rsd.updateStatus(Integer.parseInt(sensorId), Integer.parseInt(userId));
if(i>0)
	out.println("<center><span style=\"color:green\">Status updated successfully</span></center>");
}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
