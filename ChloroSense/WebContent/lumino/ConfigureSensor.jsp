<%@page import="cs.beans.RegisteredSensor"%>
<%@page import="cs.beans.SensorType"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.util.ListIterator"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ChloroSense- Configure Sensor</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
%>
<!--Icons-->
<script src="js/lumino.glyphs.js"></script>

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/jquery-1.11.2.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	
	  $('[id^="status"]').on('change',function(event) {
		 // alert("hi");
          var durl = $("#contextPath").attr('value');
          var st = $(this).attr('checked');
          var id=$(this).attr('id');
         // alert('recognized vars'+st+','+id);
    $.ajax({
          type:'GET',
          url: durl +'/ConfigureServlet',
          data:'status='+st+'&id='+id                            
        }).done(function(responseText){
          //alert("fjjsdfhk");
          
          console.log('Hi'+responseText);
        $('#result').empty();
         $('#result').html(responseText);
        
          }).fail(function(){
           //  alert("Waiting for Data Connection");
             
          });
         
          return false;
          });
	
});

</script>
</head>

<body >
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>"></input>
<%
String gst=session.getAttribute("guest")==null?null:session.getAttribute("guest").toString();

if (gst==null&&session.getAttribute("userid") == null) {
	
		response.sendRedirect(request.getContextPath()+"/lumino/userlogin.jsp");
	} 

%>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>Chloro</span>Sense</a>
			<!-- 	<ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> User <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Profile</a></li>
							<li><a href="#"><svg class="glyph stroked gear"><use xlink:href="#stroked-gear"></use></svg> Settings</a></li>
							<li><a href="#"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Logout</a></li>
						</ul>
					</li>
				</ul> -->
		<%if((session.getAttribute("userid")!=null)||(gst==null)){ %>	<a href="<%=request.getContextPath()%>/LoginServlet?option=logout" class="user-menu">Logout</a> <%} %>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<!-- <input type="text" class="form-control" placeholder="Search"> -->
			   <br />
			   <label style=" color: #30a5ff;">Menu</label>
			</div>
		</form>
		<ul class="nav menu">
			<li ><a href="index.jsp"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> Dashboard</a></li>
			<li class="active" ><a href="SensorMgmt.jsp"><svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg>Cloud Components</a></li>
			<li ><a href="<%=request.getContextPath()%>/MenuServlet?option=analyze" ><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg>Sensor Monitoring</a></li>
		<%-- <%if((session.getAttribute("userid")!=null)||(gst==null)){ %>		<li><a href="PostProduct.jsp"><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg>Post your Product</a></li><%} %> --%>
				 <%  
			 
			 if(session.getAttribute("state")!=null)
			 out.println("<img  src="+request.getContextPath()+"/DisplayPhotoServlet?pid=" +session.getAttribute("state").toString() + " height=200 width=220></img>"); %>
			<li class="parent ">
				<a href="#">
					 
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li>
						<a class="" href="#">
							<svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg> Sub Item 1
						</a>
					</li>
					<li>
						<a class="" href="#">
							<svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg> Sub Item 2
						</a>
					</li>
					<li>
						<a class="" href="#">
							<svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg> Sub Item 3
						</a>
					</li>
				</ul>
			</li>
			<li role="presentation" class="divider"></li>
			
		</ul>
		
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="<%=request.getContextPath() %>/index.jsp"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
				<!-- <li class="active">Icons</li> -->
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Configure Sensors</h1>
				
			</div>
		
	<%ArrayList al=(ArrayList)session.getAttribute("regsensors");
	%> 
<div class="row">

<form id="monitorForm" name="monitorForm" style="margin: 120px" >
<table style="border-spacing: 15px;padding:10px;" class="report">
<tr><th class="cell">Sensor Name</th><th class="cell">Sensor Type</th><th class="cell">Sensor Hub</<th><th class="cell">Location</th><th class="cell">Status</th></tr>
<%if(al!=null&&al.size()!=0) {
RegisteredSensor rs=null;
ListIterator lit=al.listIterator();

while(lit.hasNext())
{
	rs=(RegisteredSensor)lit.next();%>

<tr><td align="center"><%=rs.getSensorName() %></td><td align="center"><%=rs.getSensorType() %></td><td align="center"><%=rs.getHubName()%></td><td align="center"><%=rs.getLocation() %></td><td align="center">
<label class="switch">
  <input type="checkbox" id="status<%=rs.getSensorId()+","+rs.getUserId()%>" <%if(rs.getStatus().equals("yes")){%>checked<%}else {%> <%}%>>
  <div class="slider round"></div>
</label></td></tr>

<%}}%>


</table>



<div id="result" ></div><%if(request.getParameter("msg")!=null) {
if(request.getParameter("msg").toString().equals("lack"))
{%>
<span style="color:red"> Only registered users can configure their users</span>

<%}} %>

</form>
</div>	</div>											
	</div>	<!--/.main-->
	  

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script>
		!function ($) {
		    $(document).on("click","ul.nav li.parent > a > span.icon", function(){          
		        $(this).find('em:first').toggleClass("glyphicon-minus");      
		    }); 
		    $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>	
</body>

</html>
