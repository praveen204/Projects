<%@page import="cs.dao.StateDao"%>
<%@page import="cs.beans.State"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ChloroSense</title>

    <!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/freelancer.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript"
	src="<%=request.getContextPath()%>/jquery-1.11.2.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	$('#err').hide();
	$('#res').hide();
	
	  $('#contactForm').submit(function(event) {
          var durl = $("#contextPath").attr('value');
    $.ajax({
          type:'POST',
          url: durl +'/RegisterServlet',
          data:$(this).serialize()                            
        }).done(function(responseText){
          //alert("fjjsdfhk");
          
          console.log(responseText);
          if(responseText==="Success"){
        	  console.log("if"+responseText);
        	  $('#err').hide();  

$('#res').show();
           //$('#success').text(responseText);
           //$('#success').prepend("Entries have been validated successfully");
           
      //    location.reload(true);
           
          }
          else{
        	  console.log("else"+responseText);
            $('#res').hide();
            $('#err').show();
            $('#err').empty();
           $('#err').append(responseText); 
        
          }
          }).fail(function(){
           //  alert("Waiting for Data Connection");
             
          });
         
          return false;
          });
	
	
	
});



</script>
</head>

<body id="page-top" class="index">
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>"></input>
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#page-top">ChloroSense</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#portfolio">Services</a>
                    </li>
                     <li class="page-scroll">
                        <a href="<%=request.getContextPath() %>/LoginServlet?option=guest">Proceed as Guest</a>
                    </li>
                    <li class="page-scroll">
                        <a href="lumino/userlogin.jsp">Sign-in</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#contact">Register</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <img class="img-responsive" src="img/Sensor.png" height=100 alt="">
                    <div class="intro-text">
                       <span class="name">ChloroSense</span>
                    </div>
                </div>
                
            </div>
        </div>
    </header>

   
    <!-- About Section -->
    <section class="success" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>About</h2>
                    <hr class="star-light">
                     <div class="col-lg-4 col-lg-offset-2">
                    <p>At ChloroSense we provide virtual sensors to check and observe the marine data which is highly essential to maintain a good marine life.</p>
                </div>
                <div class="col-lg-4">
                    <p>We provide unique services like sensor cloud management,Sensor cloud provision ,sensor data collection which can be useful for a individual or a organization working with sensor data.  </p>
                </div>
                </div>
            </div>
            <div class="row">
               
                
            </div>
        </div>
    </section>
	
	 <!-- Portfolio Grid Section -->
    <section id="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Services</h2>
                    <hr class="star-primary">
                </div>
            </div>
			
			
            <div class="row">
                <div class="col-sm-4 portfolio-item">
                    <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/analysis.png" class="img-responsive" alt="">
                    </a>
                </div>
                <div class="col-sm-4 portfolio-item">
                    <a href="#portfolioModal2" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                       <img src="img/portfolio/storahe.png" class="img-responsive" alt="">
                    </a>
                </div>
                <div class="col-sm-4 portfolio-item">
                    <a href="#portfolioModal3" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/monitor.png" class="img-responsive" alt="">
                    </a>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>SignUp	</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                    <form name="sentMessage" id="contactForm"   novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>User Name</label>
                                <input type="text" class="form-control" placeholder="User Name" id="uname" name="uname" required data-validation-required-message="Please enter your username.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Password</label>
                                <input type="password" class="form-control" placeholder="Password" id="pwd" name="pwd" required data-validation-required-message="Please enter your password">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                         <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Confirm Password</label>
                                <input type="password" class="form-control" placeholder="Confirm Password" id="cpwd" name="cpwd" required data-validation-required-message="Please confirm your password">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        
                          <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>State</label>
                              <%StateDao sd=new StateDao();
            		
            	ArrayList<State> al=sd.selectAllStates();
            	
            	%>
                              <select name="state" id="state" class="form-control"><option value="">Select</option>
                              
                              <%ListIterator lit=al.listIterator();State s=null;
                              while(lit.hasNext())
                              {
                            	s=(State)lit.next();
                            	%>
                            	<option value="<%=s.getStateName()%>"><%=s.getStateName() %></option>
                            	<%}%>
                              
                              </select>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div> 
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email Address</label>
                                <input type="email" class="form-control" placeholder="Email Address" id="email" name="email" required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Phone Number</label>
                                <input type="tel" class="form-control" placeholder="Phone Number" id="phone" name="phone" required data-validation-required-message="Please enter your phone number.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Address</label>
                                <textarea rows="1" class="form-control" placeholder="Address" id="address" name="address" required data-validation-required-message="Please enter your address."></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>                        
						<div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success btn-lg" id="submit">Sign Up</button>
                            </div>
                        </div>
                    </form>
                <div id="res"><span style="color:green">Registration Successful</span></div>
                 <div id="err"><span style="color:red">Registration Unsuccessful.</span></div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="text-center">
        <div class="footer-below">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        Copyright@Team 12 
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll visible-xs visible-sm">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>

    <!-- Portfolio Modals -->
    <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Data Analysis</h2>
                            <hr class="star-primary">
                            <img src="img/portfolio/analysis.png" class="img-responsive img-centered" alt="">
                            <p>We provide services to analyze the sensor data tha we collect through the sensors you add.  <a href="https://sellfy.com/p/8Q9P/jV3VZ/"></a></p>
                            <ul class="list-inline item-details">

                            </ul>
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Sensor Cloud</h2>
                            <hr class="star-primary">
                            <img src="img/portfolio/storahe.png" class="img-responsive img-centered" alt="">
                            <p>We store the sensor data collected on cloud so that you can use when ever you want. As the entire data is on cloud users are provisioned access to the sensors immediately whenever requested. <a href="https://sellfy.com/p/8Q9P/jV3VZ/"></a></p>
                            <ul class="list-inline item-details">
                              
                            </ul>
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Monitor</h2>
                            <hr class="star-primary">
                            <img src="img/portfolio/monitor.png" class="img-responsive img-centered" alt="">
                            <p>Sensors can be monitored and accessed from anywhere around the world.Adding,deleting,configuring sensors is made easy. <a href="https://sellfy.com/p/8Q9P/jV3VZ/"></a></p>
                            <ul class="list-inline item-details">
                                
                            </ul>
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
          </div>
     </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/freelancer.js"></script>

</body>

</html>
