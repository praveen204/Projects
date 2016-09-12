<%@page import="im.dao.UsersDao"%>
<%@page import="im.beans.Users"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Industrial Marketplace-User</title>

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
				<a class="navbar-brand" href="#"><span>Industrial&nbsp;</span>Marketplace</a>
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
			<li class="active"><a href="index.jsp"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> Home</a></li>
			<li><a href="Analyze.jsp"><svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg>Analyze Trend</a></li>
			<li><a href="Shop.jsp"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg>Shopping Catalog</a></li>
			<%if((gst2==null&& gst==null)||(session.getAttribute("userid")!=null)){ %>	<li><a href="PostProduct.jsp"><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg>Post your Product</a></li><%} %>
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
		<tr><img alt="Image" src="<%=request.getContextPath()%>/lumino/images/Analysis.jpg" height="450" width="1050"></img></td>
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
