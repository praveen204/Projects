package cs.controller;

import cs.awt.CustomRenderer;

import java.awt.Color;
import java.awt.Font;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.PieSectionLabelGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.CategoryItemRenderer;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

import cs.beans.RegisteredSensor;
import cs.beans.SensorHub;
import cs.beans.SensorType;
import cs.dao.RegSensorDao;
import cs.dao.SensorDataDao;
import cs.dao.SensorHubDao;
import cs.dao.SensorTypeDao;
import cs.dao.UsersDao;

/**
 * Servlet implementation class MenuServlet
 */
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String option=request.getParameter("option")==null?null:request.getParameter("option").toString();
	response.setContentType("text/html");
	HttpSession session=request.getSession(true);
	PrintWriter out=response.getWriter();
	if(option.equals("analyze")){
		SensorTypeDao st=new SensorTypeDao();
		ArrayList<SensorType> al1= st.viewAllSensorTypes();
		session.setAttribute("sensortypes", al1);	
	    SensorDataDao std=new SensorDataDao();
	  Integer i=null;
	    if(session.getAttribute("userid")!=null)
	    i=Integer.parseInt(session.getAttribute("userid").toString());
	    ArrayList<String> al2=std.selectAllRegHubs(i);
	    session.setAttribute("hubs", al2);
	    response.sendRedirect(request.getContextPath()+"/lumino/Analyze.jsp");
	}
	
	if(option.equals("monitor")){
		String sensorType=request.getParameter("sensortype")==null?null:request.getParameter("sensortype").toString();
	
		String hub=request.getParameter("sensorhub")==null?null:request.getParameter("sensorhub").toString();
	
		if(sensorType!=""&&hub!=""&&sensorType!=null&&hub!=null)
		{
			SensorDataDao sdd=new SensorDataDao();
			
			HashMap<String,String> ahm=sdd.viewCurrWeekReadings(hub,sensorType);
			
			if(ahm.size()==0)
			{
			out.println("<span style=\"color:red\">No Data available for selected criteria</span>");
			return;
			}
			DefaultCategoryDataset bardataset = new DefaultCategoryDataset();
			DefaultPieDataset piedataset=new DefaultPieDataset();
			for(Map.Entry<String,String> entry : ahm.entrySet()){
			    System.out.printf("Key : %s and Value: %s %n", entry.getKey(), entry.getValue());
			    bardataset.setValue(Double.parseDouble(entry.getValue()),"Values" ,entry.getKey() );
			   piedataset.setValue(entry.getKey(),Double.parseDouble(entry.getValue())); 
			}
			drawBarChart("Sensor readings current week","Date","Values", bardataset, hub+sensorType+"1.jpg");						
			out.print("<img src=\""+request.getContextPath()+"/lumino/images/"+hub+sensorType+"1.jpg\" height=200 width=400 style='float:left;text-align: center;float: left;margin: 10px;' ></img>");
			drawPieChart("Sensor readings current week",piedataset, hub+sensorType+"1p.jpg");						
			out.print("<img src=\""+request.getContextPath()+"/lumino/images/"+hub+sensorType+"1p.jpg\" height=200 width=400 style='float:left;text-align: center;float: left;margin: 10px;' ></img>");
			drawLineChart("Sensor readings current week","Subcategories","Sales", bardataset, hub+sensorType+"1l.jpg");						
			out.print("<img src=\""+request.getContextPath()+"/lumino/images/"+hub+sensorType+"1l.jpg\" height=200 width=400 style='float:left;text-align: center;float: left;margin: 10px;' ></img>");
			
			
			
			
		}
	
		if(sensorType=="")
			out.println("<span style=\"color:red\">Please select a Sensor Type</span>");
		else if(hub=="")
			out.println("<span style=\"color:red\">Please select a Sensor hub</span>");
	
	}
	else if(option.equals("addhub"))
	{
		
	   response.sendRedirect(request.getContextPath()+"/lumino/AddSenHub.jsp");
	
	}
	
	else if(option.equals("addsensor"))
	{
		SensorTypeDao std=new SensorTypeDao();
		
		  ArrayList<SensorType> al=std.viewAllSensorTypes();
		   session.setAttribute("sensortypes", al);
		   SensorHubDao shd=new SensorHubDao();
		   ArrayList<SensorHub> al2=shd.selectAllHubs();
		   session.setAttribute("sensorhubs", al2);
		   response.sendRedirect(request.getContextPath()+"/lumino/AddSensor.jsp");
	}
	
	else if(option.equals("delsenshub"))
	{
		 SensorHubDao shd=new SensorHubDao();
		   ArrayList<SensorHub> al2=shd.selectAllHubs();
		   session.setAttribute("sensorhubs", al2);
		   response.sendRedirect(request.getContextPath()+"/lumino/DeleteSenHub.jsp");
	}
	
	else if(option.equals("delsensor"))
	{
		SensorTypeDao std=new SensorTypeDao();
		
		  ArrayList<SensorType> al=std.viewAllSensorTypes();
		   session.setAttribute("sensortypes", al); 
		
		SensorHubDao shd=new SensorHubDao();
		   ArrayList<SensorHub> al2=shd.selectAllHubs();
		   session.setAttribute("sensorhubs", al2);
		   response.sendRedirect(request.getContextPath()+"/lumino/DeleteSensor.jsp");
	}
	else if(option.equals("regsensor"))
	{
		SensorTypeDao std=new SensorTypeDao();
		
		  ArrayList<SensorType> al=std.viewAllSensorTypes();
		   session.setAttribute("sensortypes", al); 
		
		SensorHubDao shd=new SensorHubDao();
		   ArrayList<SensorHub> al2=shd.selectAllHubs();
		   session.setAttribute("sensorhubs", al2);
		   response.sendRedirect(request.getContextPath()+"/lumino/RegisterSensor.jsp");
	}
	
	else if(option.equals("configsensor"))
	{
		RegSensorDao rsd=new RegSensorDao();
		String uid=session.getAttribute("userid")==null?null:session.getAttribute("userid").toString();
		if(uid!=null){
		ArrayList<RegisteredSensor> al=rsd.selectAllSensors(Integer.parseInt(uid));
		session.setAttribute("regsensors", al);
		response.sendRedirect(request.getContextPath()+"/lumino/ConfigureSensor.jsp");	
		}
		else
			response.sendRedirect(request.getContextPath()+"/lumino/ConfigureSensor.jsp?msg=lack");
	}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	public int  drawBarChart(String title,String xLabel,String yLabel,DefaultCategoryDataset bardataset,String fileName)
	{
		
		JFreeChart barchart = ChartFactory.createBarChart(  
		        title,      //Title  
		       xLabel,             // X-axis Label  
		        yLabel,               // Y-axis Label  
		     bardataset,             // Dataset  
		        PlotOrientation.VERTICAL,      //Plot orientation  
		        false,                // Show legend  
		        true,                // Use tooltips  
		        false                // Generate URLs  
		     );  
		  barchart.getTitle().setPaint(Color.BLUE);    // Set the colour of the title  
		    barchart.setBackgroundPaint(Color.WHITE);    // Set the background colour of the chart  
		    CategoryPlot cp = barchart.getCategoryPlot();  // Get the Plot object for a bar graph  
		    cp.setBackgroundPaint(Color.lightGray);       // Set the plot background colour  
		    CategoryItemRenderer renderer = new CustomRenderer(); 
		    
		 cp.setNoDataMessage("No data available");
		 cp.setNoDataMessageFont(new Font("SansSerif",Font.BOLD,14));
         cp.setNoDataMessagePaint(Color.red);
		    cp.setRenderer(renderer);
		    cp.setRangeGridlinePaint(Color.BLUE);
		   

		    
		  //  String fileame =request.getRealPath("barchart.jpg");
		  //  System.out.println(absoluteDiskPath);
		   File f=new File(getServletConfig().getServletContext().getRealPath("lumino/images"),fileName);
		
		    try {
				ChartUtilities.saveChartAsJPEG(f, barchart, 500, 300);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			return 0;
			}  
		    
			System.out.println(f.getPath());
		String path=f.getPath();
	
		
		
	return 1;	
	}
	
	public int drawPieChart(String title,DefaultPieDataset piedataset,String fileName)
	{
		JFreeChart piechart = ChartFactory.createPieChart3D(  
		        title,      //Title    
		     piedataset,             // Dataset  
		        true,                // Show legend  
		        true,                // Use tooltips  
		        false                // Generate URLs  
		     );  
		piechart.getTitle().setPaint(Color.BLUE);
		 PiePlot plot = (PiePlot) piechart.getPlot();
		File f=new File(getServletConfig().getServletContext().getRealPath("lumino/images"),fileName);
		// PieSectionLabelGenerator gen = new StandardPieSectionLabelGenerator("{0}: {1} ({2})", new DecimalFormat("0"), new DecimalFormat("0%"));
		 PieSectionLabelGenerator gen = new StandardPieSectionLabelGenerator("{0}: {2}", new DecimalFormat("0"), new DecimalFormat("0%"));
		plot.setLabelGenerator(gen);
	    try {
			ChartUtilities.saveChartAsJPEG(f, piechart, 500, 300);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		return 0;
		}  
	    
		System.out.println(f.getPath());
	String path=f.getPath();
		
	return 1;
	}
	
	public int drawLineChart(String title,String xLabel,String yLabel,DefaultCategoryDataset bardataset,String fileName)
	{
		JFreeChart barchart = ChartFactory.createLineChart(  
		        title,      //Title  
		       xLabel,             // X-axis Label  
		        yLabel,               // Y-axis Label  
		      bardataset,             // Dataset  
		        PlotOrientation.VERTICAL,      //Plot orientation  
		        true,                // Show legend  
		        true,                // Use tooltips  
		        false                // Generate URLs  
		     );  
		  barchart.getTitle().setPaint(Color.BLUE);    // Set the colour of the title  
		  barchart.setBackgroundPaint(Color.WHITE);
		  CategoryPlot cp = barchart.getCategoryPlot();  // Get the Plot object for a bar graph  
		    cp.setBackgroundPaint(Color.white); cp.setRangeGridlinePaint(Color.BLUE);
		       
		  //  String fileame =request.getRealPath("barchart.jpg");
		  //  System.out.println(absoluteDiskPath);
		   File f=new File(getServletConfig().getServletContext().getRealPath("lumino/images"),fileName);
		
		    try {
				ChartUtilities.saveChartAsJPEG(f, barchart, 500, 300);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			return 0;
			}  
		    
			System.out.println(f.getPath());
		String path=f.getPath();
	
		
		return 1;
	}
	
	
}
