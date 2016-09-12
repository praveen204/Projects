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
<title>ChloroSense- Add Sensor Hub</title>

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
	
	
	  $('#find').on('click',function(event) {
          var durl = $("#contextPath").attr('value');
          var st = $("#sensortype").val();
          var hub=$("#sensorhub").val();
    $.ajax({
          type:'GET',
          url: durl +'/MenuServlet',
          data:'option=monitor&sensortype='+st+'&sensorhub='+hub                            
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
	<script type="text/javascript">
	function validateForm() {

		
		var x1 = document.forms["monitorForm"]["sensorhub"].value;
	    if (x1 == null || x1 == "") {
	        alert("Please give a name for Sensor Hub");
	        return false;
	    }
	    var x2 = document.forms["monitorForm"]["description"].value;
	    if (x2 == null || x2 == "") {
	        alert("Please give a Hub Description");
	        return false;
	    }
	    
	    var x2 = document.forms["monitorForm"]["location"].value;
	    if (x2 == null || x2 == "") {
	        alert("Please give a location");
	        return false;
	    }
	    
	 return true;
	}
	
	
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
			<li class="active"><a href="SensorMgmt.jsp"><svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg>Cloud Components</a></li>
			<li><a href="<%=request.getContextPath()%>/MenuServlet?option=analyze" ><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg>Sensor Monitoring</a></li>
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
				<h1 class="page-header">Add Sensor Hub</h1>
				
			</div>
		
	<%
	ArrayList al2=(ArrayList)session.getAttribute("sensortypes");
	%> 
<div class="row">

<form id="monitorForm" name="monitorForm" style="margin: 120px" method="post" action="<%=request.getContextPath() %>/SensorHubServlet" onsubmit="return validateForm()">
<table style="border-spacing: 15px;padding:10px;">
<tr><td>Enter Name of Sensor Hub :</td><td><input type="text" id="sensorhub"name="sensorhub"></td></tr>
<tr><td>Enter Description of Hub</td><td><input type="text" id="description"name="description"></td></tr>
<!-- <tr><td></td><td></td></tr>-->
<tr><td>Enter Location :</td><td><!-- <input type="text" id="location"name="location"> -->
<select id="location" name="location">
<option value="Abilene">Abilene</option>
<option value="Akron">Akron</option>
<option value="Albuquerque">Albuquerque</option>
<option value="Alexandria">Alexandria</option>
<option value="Allentown">Allentown</option>
<option value="Amarillo">Amarillo</option>
<option value="Anaheim">Anaheim</option>
<option value="Anchorage">Anchorage</option>
<option value="Ann Arbor">Ann Arbor</option>
<option value="Antioch">Antioch</option>
<option value="Arlington">Arlington</option>
<option value="Arlington">Arlington</option>
<option value="Arvada">Arvada</option>
<option value="Athens">Athens</option>
<option value="Atlanta">Atlanta</option>
<option value="Augusta">Augusta</option>
<option value="Aurora">Aurora</option>
<option value="Aurora">Aurora</option>
<option value="Austin">Austin</option>
<option value="Bakersfield">Bakersfield</option>
<option value="Baltimore">Baltimore</option>
<option value="Baton Rouge">Baton Rouge</option>
<option value="Beaumont">Beaumont</option>
<option value="Bellevue">Bellevue</option>
<option value="Berkeley">Berkeley</option>
<option value="Billings">Billings</option>
<option value="Birmingham">Birmingham</option>
<option value="Boise City">Boise City</option>
<option value="Boston">Boston</option>
<option value="Boulder">Boulder</option>
<option value="Brandon">Brandon</option>
<option value="Bridgeport">Bridgeport</option>
<option value="Broken Arrow">Broken Arrow</option>
<option value="Brownsville">Brownsville</option>
<option value="Buffalo">Buffalo</option>
<option value="Burbank">Burbank</option>
<option value="Cambridge">Cambridge</option>
<option value="Cape Coral">Cape Coral</option>
<option value="Carlsbad">Carlsbad</option>
<option value="Carrollton">Carrollton</option>
<option value="Cary">Cary</option>
<option value="Cedar Rapids">Cedar Rapids</option>
<option value="Centennial">Centennial</option>
<option value="Chandler">Chandler</option>
<option value="Charleston">Charleston</option>
<option value="Charlotte">Charlotte</option>
<option value="Chattanooga">Chattanooga</option>
<option value="Chesapeake">Chesapeake</option>
<option value="Chicago">Chicago</option>
<option value="Chula Vista">Chula Vista</option>
<option value="Cincinnati">Cincinnati</option>
<option value="Clarksville">Clarksville</option>
<option value="Clearwater">Clearwater</option>
<option value="Cleveland">Cleveland</option>
<option value="Clovis">Clovis</option>
<option value="College Station">College Station</option>
<option value="Colorado Springs">Colorado Springs</option>
<option value="Columbia">Columbia</option>
<option value="Columbia">Columbia</option>
<option value="Columbia">Columbia</option>
<option value="Columbus">Columbus</option>
<option value="Columbus">Columbus</option>
<option value="Concord">Concord</option>
<option value="Coral Springs">Coral Springs</option>
<option value="Corona">Corona</option>
<option value="Corpus Christi">Corpus Christi</option>
<option value="Costa Mesa">Costa Mesa</option>
<option value="Dallas">Dallas</option>
<option value="Daly City">Daly City</option>
<option value="Davenport">Davenport</option>
<option value="Dayton">Dayton</option>
<option value="Denton">Denton</option>
<option value="Denver">Denver</option>
<option value="Des Moines">Des Moines</option>
<option value="Detroit">Detroit</option>
<option value="Downey">Downey</option>
<option value="Durham">Durham</option>
<option value="East Los Angeles">East Los Angeles</option>
<option value="Edison">Edison</option>
<option value="El Cajon">El Cajon</option>
<option value="Elgin">Elgin</option>
<option value="Elizabeth">Elizabeth</option>
<option value="Elk Grove (incl. Laguna)">Elk Grove (incl. Laguna)</option>
<option value="El Monte">El Monte</option>
<option value="El Paso">El Paso</option>
<option value="Enterprise">Enterprise</option>
<option value="Escondido">Escondido</option>
<option value="Eugene">Eugene</option>
<option value="Evansville">Evansville</option>
<option value="Everett">Everett</option>
<option value="Fairfield">Fairfield</option>
<option value="Fargo">Fargo</option>
<option value="Fayetteville">Fayetteville</option>
<option value="Fontana">Fontana</option>
<option value="Fort Collins">Fort Collins</option>
<option value="Fort Lauderdale">Fort Lauderdale</option>
<option value="Fort Wayne">Fort Wayne</option>
<option value="Fort Worth">Fort Worth</option>
<option value="Fremont">Fremont</option>
<option value="Fresno">Fresno</option>
<option value="Frisco">Frisco</option>
<option value="Fullerton">Fullerton</option>
<option value="Gainesville">Gainesville</option>
<option value="Garden Grove">Garden Grove</option>
<option value="Garland">Garland</option>
<option value="Gilbert">Gilbert</option>
<option value="Glendale">Glendale</option>
<option value="Glendale">Glendale</option>
<option value="Grand Prairie">Grand Prairie</option>
<option value="Grand Rapids">Grand Rapids</option>
<option value="Green Bay">Green Bay</option>
<option value="Greensboro">Greensboro</option>
<option value="Gresham">Gresham</option>
<option value="Hampton">Hampton</option>
<option value="Hartford">Hartford</option>
<option value="Hayward">Hayward</option>
<option value="Henderson">Henderson</option>
<option value="Hialeah">Hialeah</option>
<option value="Highlands Ranch">Highlands Ranch</option>
<option value="High Point">High Point</option>
<option value="Hollywood">Hollywood</option>
<option value="Honolulu (Urban Honolulu CDP)">Honolulu (Urban Honolulu CDP)</option>
<option value="Houston">Houston</option>
<option value="Huntington Beach">Huntington Beach</option>
<option value="Huntsville">Huntsville</option>
<option value="Independence">Independence</option>
<option value="Indianapolis">Indianapolis</option>
<option value="Inglewood">Inglewood</option>
<option value="Irvine">Irvine</option>
<option value="Irving">Irving</option>
<option value="Jackson">Jackson</option>
<option value="Jacksonville">Jacksonville</option>
<option value="Jersey City">Jersey City</option>
<option value="Joliet">Joliet</option>
<option value="Kansas City">Kansas City</option>
<option value="Kansas City">Kansas City</option>
<option value="Kent">Kent</option>
<option value="Killeen">Killeen</option>
<option value="Knoxville">Knoxville</option>
<option value="Lafayette">Lafayette</option>
<option value="Lakeland">Lakeland</option>
<option value="Lakewood">Lakewood</option>
<option value="Lancaster">Lancaster</option>
<option value="Lansing">Lansing</option>
<option value="Laredo">Laredo</option>
<option value="Las Cruces">Las Cruces</option>
<option value="Las Vegas">Las Vegas</option>
<option value="Lewisville">Lewisville</option>
<option value="Lexington">Lexington</option>
<option value="Lincoln">Lincoln</option>
<option value="Little Rock">Little Rock</option>
<option value="Long Beach">Long Beach</option>
<option value="Los Angeles">Los Angeles</option>
<option value="Louisville">Louisville</option>
<option value="Lowell">Lowell</option>
<option value="Lubbock">Lubbock</option>
<option value="Macon">Macon</option>
<option value="Madison">Madison</option>
<option value="Manchester">Manchester</option>
<option value="McAllen">McAllen</option>
<option value="McKinney">McKinney</option>
<option value="Memphis">Memphis</option>
<option value="Mesa">Mesa</option>
<option value="Mesquite">Mesquite</option>
<option value="Metairie">Metairie</option>
<option value="Miami">Miami</option>
<option value="Miami Gardens">Miami Gardens</option>
<option value="Midland">Midland</option>
<option value="Milwaukee">Milwaukee</option>
<option value="Minneapolis">Minneapolis</option>
<option value="Miramar">Miramar</option>
<option value="Mobile">Mobile</option>
<option value="Modesto">Modesto</option>
<option value="Montgomery">Montgomery</option>
<option value="Moreno Valley">Moreno Valley</option>
<option value="Murfreesboro">Murfreesboro</option>
<option value="Murrieta">Murrieta</option>
<option value="Naperville">Naperville</option>
<option value="Nashville">Nashville</option>
<option value="Newark">Newark</option>
<option value="New Haven">New Haven</option>
<option value="New Orleans">New Orleans</option>
<option value="Newport News">Newport News</option>
<option value="New York">New York</option>
<option value="Norfolk">Norfolk</option>
<option value="Norman">Norman</option>
<option value="North Charleston">North Charleston</option>
<option value="North Las Vegas">North Las Vegas</option>
<option value="Norwalk">Norwalk</option>
<option value="Oakland">Oakland</option>
<option value="Oceanside">Oceanside</option>
<option value="Odessa">Odessa</option>
<option value="Oklahoma City">Oklahoma City</option>
<option value="Olathe">Olathe</option>
<option value="Omaha">Omaha</option>
<option value="Ontario">Ontario</option>
<option value="Orange">Orange</option>
<option value="Orlando">Orlando</option>
<option value="Overland Park">Overland Park</option>
<option value="Oxnard">Oxnard</option>
<option value="Palm Bay">Palm Bay</option>
<option value="Palmdale">Palmdale</option>
<option value="Paradise">Paradise</option>
<option value="Pasadena">Pasadena</option>
<option value="Pasadena">Pasadena</option>
<option value="Paterson">Paterson</option>
<option value="Pearland">Pearland</option>
<option value="Pembroke Pines">Pembroke Pines</option>
<option value="Peoria">Peoria</option>
<option value="Peoria">Peoria</option>
<option value="Philadelphia">Philadelphia</option>
<option value="Phoenix">Phoenix</option>
<option value="Pittsburgh">Pittsburgh</option>
<option value="Plano">Plano</option>
<option value="Pomona">Pomona</option>
<option value="Pompano Beach">Pompano Beach</option>
<option value="Portland">Portland</option>
<option value="Port St. Lucie">Port St. Lucie</option>
<option value="Providence">Providence</option>
<option value="Provo">Provo</option>
<option value="Pueblo">Pueblo</option>
<option value="Raleigh">Raleigh</option>
<option value="Rancho Cucamonga">Rancho Cucamonga</option>
<option value="Reno">Reno</option>
<option value="Rialto">Rialto</option>
<option value="Richardson">Richardson</option>
<option value="Richmond">Richmond</option>
<option value="Richmond">Richmond</option>
<option value="Riverside">Riverside</option>
<option value="Rochester">Rochester</option>
<option value="Rochester">Rochester</option>
<option value="Rockford">Rockford</option>
<option value="Roseville">Roseville</option>
<option value="Round Rock">Round Rock</option>
<option value="Sacramento">Sacramento</option>
<option value="Salem">Salem</option>
<option value="Salinas">Salinas</option>
<option value="Salt Lake City">Salt Lake City</option>
<option value="San Antonio">San Antonio</option>
<option value="San Bernardino">San Bernardino</option>
<option value="San Buenaventura">San Buenaventura</option>
<option value="San Diego">San Diego</option>
<option value="Sandy Springs">Sandy Springs</option>
<option value="San Francisco">San Francisco</option>
<option value="San Jose">San Jose</option>
<option value="San Mateo">San Mateo</option>
<option value="Santa Ana">Santa Ana</option>
<option value="Santa Clara">Santa Clara</option>
<option value="Santa Clarita">Santa Clarita</option>
<option value="Santa Maria">Santa Maria</option>
<option value="Santa Rosa">Santa Rosa</option>
<option value="Savannah">Savannah</option>
<option value="Scottsdale">Scottsdale</option>
<option value="Seattle">Seattle</option>
<option value="Shreveport">Shreveport</option>
<option value="Simi Valley">Simi Valley</option>
<option value="Sioux Falls">Sioux Falls</option>
<option value="South Bend">South Bend</option>
<option value="Spokane">Spokane</option>
<option value="Springfield">Springfield</option>
<option value="Springfield">Springfield</option>
<option value="Springfield">Springfield</option>
<option value="Spring Hill">Spring Hill</option>
<option value="Spring Valley">Spring Valley</option>
<option value="St. Louis">St. Louis</option>
<option value="St. Paul">St. Paul</option>
<option value="St. Petersburg">St. Petersburg</option>
<option value="Stamford">Stamford</option>
<option value="Sterling Heights">Sterling Heights</option>
<option value="Stockton">Stockton</option>
<option value="Sunnyvale">Sunnyvale</option>
<option value="Sunrise Manor">Sunrise Manor</option>
<option value="Surprise">Surprise</option>
<option value="Syracuse">Syracuse</option>
<option value="Tacoma">Tacoma</option>
<option value="Tallahassee">Tallahassee</option>
<option value="Tampa">Tampa</option>
<option value="Temecula">Temecula</option>
<option value="Tempe">Tempe</option>
<option value="The Woodlands">The Woodlands</option>
<option value="Thornton">Thornton</option>
<option value="Thousand Oaks">Thousand Oaks</option>
<option value="Toledo">Toledo</option>
<option value="Topeka">Topeka</option>
<option value="Torrance">Torrance</option>
<option value="Tucson">Tucson</option>
<option value="Tulsa">Tulsa</option>
<option value="Tyler">Tyler</option>
<option value="Vallejo">Vallejo</option>
<option value="Vancouver">Vancouver</option>
<option value="Victorville">Victorville</option>
<option value="Virginia Beach">Virginia Beach</option>
<option value="Visalia">Visalia</option>
<option value="Waco">Waco</option>
<option value="Warren">Warren</option>
<option value="Washington">Washington</option>
<option value="Waterbury">Waterbury</option>
<option value="West Covina">West Covina</option>
<option value="West Jordan">West Jordan</option>
<option value="Westminster">Westminster</option>
<option value="West Palm Beach">West Palm Beach</option>
<option value="West Valley City">West Valley City</option>
<option value="Wichita">Wichita</option>
<option value="Wichita Falls">Wichita Falls</option>
<option value="Wilmington">Wilmington</option>
<option value="Winston-Salem">Winston-Salem</option>
<option value="Worcester">Worcester</option>
<option value="Yonkers">Yonkers</option>


	</select>


</td></tr>

<tr><td colspan="2" align="center"> <input type="submit" id="save"  value="Add"></input></td></tr>
</table>



<div id="result" ><%if(request.getParameter("msg")!=null){ %>
<span style="color:green">Sensor Hub Added Successfully</span>
<%} %>
</div>

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
