package im.controller;

import im.beans.Category;
import im.beans.SubCategory;
import im.dao.CategoryDao;
import im.dao.SalesDao;
import im.dao.SubCategoryDao;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.MappedByteBuffer;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.ListIterator;
import java.util.Map;
import java.util.TreeMap;

import im.awt.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
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
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.xy.XYDataset;

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
		response.setContentType("text/html");
	PrintWriter out=response.getWriter();
		String option = (request.getParameter("option")==null)?null:request.getParameter("option").toString();
	if(option.equals("analyze"))
	{
		String catId = (request.getParameter("category")==null)?null:request.getParameter("category").toString();
		String subCatId = (request.getParameter("subcategory")==null)?null:request.getParameter("subcategory").toString();
        System.out.println("Inside OPtion");
							if(catId!=null&&catId!=""&&(subCatId==""||subCatId==null))
							{
								System.out.println("Inside if cat");
								SalesDao sd=new SalesDao();
							HashMap<String,Integer> ahm=sd.viewCurrSalByCategory(Integer.parseInt(catId));
						    //request.setAttribute("categorydata", ahm);
							//out.print(ahm);
							if(ahm.size()==0)
								{
								out.println("No Data available for selected criteria");
								return;
								}
								DefaultCategoryDataset bardataset = new DefaultCategoryDataset();
								DefaultPieDataset piedataset=new DefaultPieDataset();
								
							
								for(Map.Entry<String, Integer> entry : ahm.entrySet()){
								    System.out.printf("Key : %s and Value: %s %n", entry.getKey(), entry.getValue());
								    bardataset.setValue(entry.getValue(),"Sales" ,entry.getKey() );
								   piedataset.setValue(entry.getKey(),entry.getValue());
								}
									drawBarChart("Current market Trend in SubCategories","Subcategories","Sales", bardataset, catId+subCatId+"1.jpg");						
								out.print("<img src=\""+request.getContextPath()+"/lumino/images/"+catId+subCatId+"1.jpg\" height=200 width=400 style='float:left;text-align: center;float: left;margin: 10px;' ></img>");
								drawPieChart("Current market Trend in SubCategories",piedataset, catId+subCatId+"1p.jpg");						
								out.print("<img src=\""+request.getContextPath()+"/lumino/images/"+catId+subCatId+"1p.jpg\" height=200 width=400 style='float:left;text-align: center;float: left;margin: 10px;' ></img>");
								/*drawLineChart("Current market Trend in SubCategories","Subcategories","Sales", bardataset, catId+subCatId+"1l.jpg");						
								out.print("<img src=\""+request.getContextPath()+"/lumino/images/"+catId+subCatId+"1l.jpg\" height=200 width=400 style='float:left;text-align: center;float: left;margin: 10px;' ></img>");
								*/			
							
							}
							
							if(subCatId!=null&& subCatId!=""&&(catId!=null||catId!=""))
							{
							System.out.println("Inside");
								SalesDao sd2=new SalesDao();
								HashMap<String,Integer> ahm2=sd2.viewCurrSalByArea(Integer.parseInt(catId),Integer.parseInt(subCatId));
							    
								//request.setAttribute("categorydata", ahm);
								//out.print(ahm);
								/*if(ahm2.size()==0)
								{
								out.println("<br />No Data available for selected criteria");
								return;
								}*/
								
								DefaultCategoryDataset bardataset2 = new DefaultCategoryDataset();  
								DefaultPieDataset piedataset2=new DefaultPieDataset();
									for(Map.Entry<String, Integer> entry : ahm2.entrySet()){
									    System.out.printf("Key : %s and Value: %s %n", entry.getKey(), entry.getValue());
									    bardataset2.setValue(entry.getValue(),"Sales" ,entry.getKey() );
									    piedataset2.setValue(entry.getKey(),entry.getValue());
									}
									
									drawBarChart("Current market Trend  Areawise","Areas","Sales", bardataset2, catId+subCatId+"2.jpg");						
								
									drawPieChart("Current market Trend  Areawise",piedataset2, catId+subCatId+"2p.jpg");						
									
									drawLineChart("Current market Trend in SubCategories","Subcategories","Sales", bardataset2, catId+subCatId+"2l.jpg");						
									
									
									
							//YearWise
							
							SalesDao sd3=new SalesDao();
							HashMap<Integer,Integer> ahm3=sd3.viewSalesByYear(Integer.parseInt(catId),Integer.parseInt(subCatId));
						    
							//request.setAttribute("categorydata", ahm);
							//out.print(ahm);
							if(ahm2.size()==0 &&ahm3.size()==0)
							{
							out.println("<br />No Data available for selected criteria");
							return;
							}
							 TreeMap<Integer,Integer> map = new TreeMap<Integer, Integer>(ahm3); 
						        
							Map<Integer,Integer> m=map.descendingMap();
							DefaultCategoryDataset bardataset3 = new DefaultCategoryDataset();  
							DefaultPieDataset piedataset3=new DefaultPieDataset();
								for(Map.Entry<Integer, Integer> entry : m.entrySet()){
								    System.out.printf("Key : %s and Value: %s %n", entry.getKey(), entry.getValue());
								    bardataset3.setValue(entry.getValue(),"Sales" ,entry.getKey() );
								    piedataset3.setValue(entry.getKey(),entry.getValue());
								}
								drawBarChart("Current market Trend  Yearwise","Years","Sales", bardataset3, catId+subCatId+"3.jpg");						
								out.print("<img src=\""+request.getContextPath()+"/lumino/images/"+catId+subCatId+"2.jpg\" height=200 width=400 style='float:left;text-align: center;float: left;margin: 10px;' ></img>");
								out.print("<img src=\""+request.getContextPath()+"/lumino/images/"+catId+subCatId+"3.jpg\" height=200 width=400 style='float:left;text-align: center;float: left;margin: 10px;' ></img>");
								drawPieChart("Current market Trend  Yearwise",piedataset3, catId+subCatId+"3p.jpg");						
								out.print("<img src=\""+request.getContextPath()+"/lumino/images/"+catId+subCatId+"2p.jpg\" height=200 width=400 style='float:left;text-align: center;float: left;margin: 10px;' ></img>");
								out.print("<img src=\""+request.getContextPath()+"/lumino/images/"+catId+subCatId+"3p.jpg\" height=200 width=400 style='float:left;text-align: center;float: left;margin: 10px;' ></img>");
								
								drawLineChart("Current market Trend in SubCategories","Subcategories","Sales", bardataset3, catId+subCatId+"3l.jpg");						
								out.print("<img src=\""+request.getContextPath()+"/lumino/images/"+catId+subCatId+"2l.jpg\" height=200 width=400 style='float:left;text-align: center;float: left;margin: 10px;' ></img>");
								out.print("<img src=\""+request.getContextPath()+"/lumino/images/"+catId+subCatId+"3l.jpg\" height=200 width=400 style='float:left;text-align: center;float: left;margin: 10px;' ></img>");
								
							
							
							
							}
									
		                if(subCatId=="" && catId=="")
		                	out.println("<br/>No data avaialable for selected criteria");
		
	}

	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String output="";
	String catId=request.getParameter("category")==null?null:request.getParameter("category").toString();
	response.setContentType("text/html");
	System.out.println("Outside Writer"+catId);	
	PrintWriter out=response.getWriter();
				if(catId!=null&& catId!="")
				{
				  	SubCategoryDao scd=new SubCategoryDao();
				    ArrayList<SubCategory> al=scd.selectAllSubCategories(Integer.parseInt(catId));
				
				ListIterator<SubCategory> lit=al.listIterator();
				System.out.println("Outside"+catId);	
				output=output+"<option value=''>Select</option>";
							while(lit.hasNext())
							{
								System.out.println(catId);
								 SubCategory sc=lit.next();
								 output=output+"<option value="+sc.getSubcategoryId()+">"+sc.getSubcategoryName()+"</option>";
								 
							}
						
							
				out.println(output);
				}	else
					{
					output+="<option value=''>Select a Category first</option>";
					out.println(output);
					}
	
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
