<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ListIterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="im.beans.Category"%>
<%@page import="im.dao.CategoryDao"%>
<%@page import="im.beans.Products"%>
<%@page import="im.dao.ProductDao"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Industrial Marketplace -Shopping Catalog</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
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
	
	
	  $('#category').on('change',function(event) {
          var durl = $("#contextPath").attr('value');
          var catId = $(this).val();
    $.ajax({
          type:'POST',
          url: durl +'/MenuServlet',
          data:'category='+catId                            
        }).done(function(responseText){
          //alert("fjjsdfhk");
          
          console.log('Hi'+responseText);
         $('#subcategory').html(responseText);
          }).fail(function(){
           //  alert("Waiting for Data Connection");
             
          });
         
          return false;
          });
	
	  $('#search').on('click',function(event) {
          var durl = $("#contextPath").attr('value');
          var catId = $("#category").val();
          var subCatId=$("#subcategory").val();
    $.ajax({
          type:'GET',
          url: durl +'/ProductServlet',
          data:'category='+catId+'&subcategory='+subCatId                            
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

<body>
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
				<a class="navbar-brand" href="#"><span>Industrial &nbsp;</span>Marketplace</a>
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
		<%if((session.getAttribute("userid")!=null)||(gst==null)){ %>		<a href="<%=request.getContextPath()%>/LoginServlet?option=logout" class="user-menu">Logout</a><%} %>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<!-- <input type="text" class="form-control" placeholder="Search"> -->
			   <br />
			   <label style=" color: #30a5ff;">Menu</label>	</div>
		</form>
		<ul class="nav menu">
				<li><a href="index.jsp"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> Home</a></li>
			<li><a href="Analyze.jsp"><svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg>Analyze Trend</a></li>
			<li class="active"><a href="Shop.jsp" ><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg>Shopping Catalog</a></li>
		<%if((session.getAttribute("userid")!=null)||(gst==null)) {%>	<li><a href="PostProduct.jsp"><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg>Post your Product</a></li><%} %>
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
		</div>
		<div class="row">
<div class="col-lg-12">
				<h1 class="page-header">Shopping Catalog</h1>
			</div>
		<%ArrayList al=(ArrayList)session.getAttribute("categories");%>
		<div class="row">	
		<form id="shopForm" name="shopForm" style="margin: 120px">
<table style="border-spacing: 10px;padding:10px;"  cellpadding=5>
<tr ><td>Category:</td><td><select id="category" name="category"><option value="">Select</option>
<%
if(al==null||al.size()==0)
{%>
	<option value=""><span style="color:red">No Data Available</span></option>
<%}
else{
ListIterator lit= al.listIterator();
while(lit.hasNext())
{
Category c=(Category)lit.next();%>
<option value="<%=c.getCategoryId()%>"><%=c.getCategoryName() %></option>
<%}} %>

</select></td>
<td>Subcategory:</td><td><select id="subcategory" name="subcategory"><option value="">Select a Category first</option></select></td><td colspan="2" align="center"> <input type="button" value="Filter" id="search"></input></td></tr>
<!-- <tr><td></td><td></td></tr>-->

</table>
<div id="result">
 <%ProductDao pd =new  ProductDao();
ArrayList<Products> al2=pd.listAllProducts(null,null);
//out.print(al);
ListIterator<Products> lit=al2.listIterator();

out.println("");
	  
while(lit.hasNext()){
   out.print("<div class='card-layout'>");
   Products p=lit.next();
out.print("<img  src="+request.getContextPath()+"/DisplayPhotoServlet?pid=" +p.getProductId() + "></img>");
out.print(p.getProductName()+"<br />");
out.print("Price: Rs"+p.getPrice()+"<br />");
out.print("<input type='button' value='Add to Cart' onclick=\"alert('Added to Cart');\"></button>");  
out.print("</div>"); }%> 

</div>
</form>
</div>

	</div><!--/.row-->
		
	</div><!--/.main-->

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/bootstrap-table.js"></script>
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
