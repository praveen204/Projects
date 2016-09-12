<%@page import="cs.dao.UsersDao"%>
<%@page import="cs.beans.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ChloroSense-User</title>

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

	 <script src = "http://maps.googleapis.com/maps/api/js"></script>
      
      <script type="text/javascript">
         function loadMap() {
			
            var mapOptions = {
               center:new google.maps.LatLng(37.0902,-120.74061666666667), zoom:7,
               mapTypeId:google.maps.MapTypeId.ROADMAP
            };
				
            var map = new google.maps.Map(document.getElementById("sample"),mapOptions);
			 var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(35.17013333333333,-120.74061666666667), zoom:4,
    title: 'SensorLocation:San Luis Bay - Cal Poly Pier Shore, SensorType:ChlorophyllSensor'
	
  });
  
  		 var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(35.17013333333333,-120.8), zoom:4,
    title: 'SensorLocation:San Luis Bay - Cal Poly Pier Shore, SensorType:Water Temperature Sensor'
	
  });
  
  var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(36.9603,-122.0203), zoom:4,
    title: 'SensorLocation:Santa Cruz, SensorType:ChlorophyllSensor'
	
  });
  
  		 var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(36.6,-122.0203), zoom:4,
    title: 'SensorLocation:San Santa Cruz, SensorType:Water Temperature Sensor'
	
  });
  
  var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(40.7775,-124.19652), zoom:4,
    title: 'SensorLocation:Humboldt, SensorType:ChlorophyllSensor'
	
  });
  
  		 var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(40,-124.19652), zoom:4,
    title: 'SensorLocation:Humboldt, SensorType:Water Temperature Sensor'
	
  });
  
  var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(36.60513,-121.88935), zoom:4,
    title: 'SensorLocation:Monterey, SensorType:ChlorophyllSensor'
	
  });
  
  		 var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(36.60513,-121.88935), zoom:4,
    title: 'SensorLocation:Monterey, SensorType:Water Temperature Sensor'
	
  });
  
   var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(38.0657,-122.2302), zoom:4,
    title: 'SensorLocation:Carquinez, SensorType:ChlorophyllSensor'
	
  });
  
  		 var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(38.2657,-122.2302), zoom:4,
    title: 'SensorLocation:Carquinez, SensorType:Water Temperature Sensor'
	
  });
  
  var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(37.8915,-122.4467), zoom:4,
    title: 'SensorLocation:(TIBC1) Tiburon, SensorType:ChlorophyllSensor'
	
  });
  
  		 var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(37.9,-122.4467), zoom:4,
    title: 'SensorLocation:(TIBC1) Tiburon, SensorType:Water Temperature Sensor'
	
  });
  
   var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(38.31652,-123.0709), zoom:4,
    title: 'SensorLocation:Bodega Bay, SensorType:ChlorophyllSensor'
	
  });
  
  		 var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(38.5,-123.0709), zoom:4,
    title: 'SensorLocation:(TIBC1) Tiburon, SensorType:Water Temperature Sensor'
	
  });
  
  var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(38.31652,-123.0709), zoom:4,
    title: 'SensorLocation:Bodega Bay, SensorType:ChlorophyllSensor'
	
  });
  
  		 var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(38.5,-123.0709), zoom:4,
    title: 'SensorLocation:Bodega Bay, SensorType:Water Temperature Sensor'
	
  });
  var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(37.80663,-122.4662), zoom:4,
    title: 'SensorLocation:Fort Point, SensorType:ChlorophyllSensor'
	
  });
  
  		 var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(38,-122.4662), zoom:4,
    title: 'SensorLocation:Fort Point, SensorType:Water Temperature Sensor'
	
  });
  var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(37.80663,-122.4662), zoom:4,
    title: 'SensorLocation:Fort Point, SensorType:ChlorophyllSensor'
	
  });
  
  		 var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(38,-122.4662), zoom:4,
    title: 'SensorLocation:Fort Point, SensorType:Water Temperature Sensor'
	
  });
   var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(32.867,-117.257), zoom:4,
    title: 'SensorLocation:Scripps Pier, SensorType:ChlorophyllSensor'
	
  });
  
  		 var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(33,-117.257), zoom:4,
    title: 'SensorLocation:Scripps Pier, SensorType:Water Temperature Sensor'
	
  });
  var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(34.408,-119.685), zoom:4,
    title: 'SensorLocation:Stearns Wharf, SensorType:ChlorophyllSensor'
	
  });
  
  		 var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(34.6,-119.685), zoom:4,
    title: 'SensorLocation:Stearns Wharf, SensorType:Water Temperature Sensor'
	
  });
  var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(35.365,-120.8575), zoom:4,
    title: 'Morro Bay - T Pier, SensorType:ChlorophyllSensor'
	
  });
  
  		 var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(35.1,-120.8575), zoom:4,
    title: 'Morro Bay - T Pier, SensorType:Water Temperature Sensor'
	
  });
  
  
  
		
			
         }
      
      </script>	
</head>

<body>
<%
String gst=request.getParameter("guest")==null?null:request.getParameter("guest").toString();
String gst2=session.getAttribute("guest")==null?null:session.getAttribute("guest").toString();

 if (gst2==null&&gst==null&&session.getAttribute("userid") == null) {
	
		response.sendRedirect(request.getContextPath()+"/lumino/userlogin.jsp");
	}  
if(gst!=null)
	session.setAttribute("guest", "guest");
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
				<!-- <ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> User <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Profile</a></li>
							<li><a href="#"><svg class="glyph stroked gear"><use xlink:href="#stroked-gear"></use></svg> Settings</a></li>
							<li><a href="#"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Logout</a></li>
						</ul>
					</li>
				</ul> -->
			<%if((session.getAttribute("userid")!=null)||((gst2==null)&gst==null)){ %>	<a href="<%=request.getContextPath()%>/LoginServlet?option=logout" class="user-menu">Logout</a><%} %>
				
			</div>
							
		</div><!-- /.container-fluid -->
	</nav> -->
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<!-- <input type="text" class="form-control" placeholder="Search"> -->
			   <br />
			   
		<label style=" color: #30a5ff;">Menu</label>
			</div>
		</form>
		<ul class="nav menu">
			<li class="active"><a href="index.jsp"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> Dashboard</a></li>
		<%if((gst2==null&& gst==null)||(session.getAttribute("userid")!=null)){ %>	<li><a href="SensorMgmt.jsp"><svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg>Cloud Components</a></li>
			<li><a href="<%=request.getContextPath()%>/MenuServlet?option=analyze"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg>Sensor Monitoring</a></li><%} %>
		<%-- 	<%if((gst2==null&& gst==null)||(session.getAttribute("userid")!=null)){ %>	<li><a href="PostProduct.jsp"><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg>Post your Product</a></li><%} %> --%>
			 <%  
			 
			 if(session.getAttribute("state")!=null)
			 out.println("<img  src="+request.getContextPath()+"/DisplayPhotoServlet?pid=" +session.getAttribute("state").toString() + " height=200 width=220></img>"); %>
			
		
			<li class="parent ">
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
				<h1 class="page-header">Welcome <%=session.getAttribute("userid")==null?"Guest,":UsersDao.getUserName(Integer.parseInt(session.getAttribute("userid").toString()))+"," %></h1>
			</div>
		</div><!--/.row--><table>
		<tr><td><button onclick="loadMap()">Click here to view check all sensors we provide</button></td></tr>
		<tr><td> <div id = "sample" style ="width:700px; height:700px;"></div></td>
		</table>
	</div>	<!--/.main-->
	
	

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script>
		$('#calendar').datepicker({
		});

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
