<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.ListIterator"%>
<%@page import="example.servlet.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Medico</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/jquery-1.11.2.min.js"></script>
<link rel='stylesheet' type='text/css'
	href='<%=request.getContextPath()%>/styles/style.css' />
	<script type="text/javascript">
	
	function validate()
	{
	if( document.myForm.city.value == "-1" )
         {
            alert( "Please select city!" );
            return false;
         }
         
         if( document.myForm.disease.value == "-1" )
         {
            alert( "Please select disease!" );
            return false;
         }
         return( true );
     }

	
	</script>
	
	 <script type="text/javascript">
  
   $(document).ready(function() {
   	
   		$(document).on('change', '#cit', function(e){
    var thecomp = $('#cit').val();
    localStorage.thecomp=thecomp;
  //  alert(thecomp);
    });
        
        if(localStorage.getItem('thecomp')){
        // alert(localStorage.thecomp);   
        $("#cit").val(localStorage.thecomp);
        }
        
        $(document).on('change', '#dis', function(e){
    var thecomp2 = $('#dis').val();
    localStorage.thecomp2=thecomp2;
   // alert(thecomp2);
    });
        
        if(localStorage.getItem('thecomp2')){
         //alert(localStorage.thecomp2);   
        $("#dis").val(localStorage.thecomp2);
        }
        
         $(document).on('change', '#srt', function(e){
    var thecomp3 = $('#srt').val();
    localStorage.thecomp3=thecomp3;
    //alert(thecomp3);
    });
        
        if(localStorage.getItem('thecomp3')){
        // alert(localStorage.thecomp3);   
        $("#srt").val(localStorage.thecomp3);
        }
        
    	
   $('#err').hide();                 
//$('#res').hide();
            $('#form1').submit(function(event) {
                var durl = $("#contextPath").attr('value');
          $.ajax({
                type:'POST',
                url: durl +'/SimpleServlet',
                data:$(this).serialize()                            
              }).done(function(responseText){
                //alert("fjjsdfhk");
                if(responseText==="Success"){
                	 $('#err').hide();                 
$('#res').show();
                 //$('#success').text(responseText);
                 //$('#success').prepend("Entries have been validated successfully");
                 
                location.reload(true);
                 
                }
                else{
                  $('#res').hide();
                  $('#err').show();$('#err').empty();
                 $('#err').append(responseText); 
              
                }
                }).fail(function(){
                   alert("Waiting for Data Connection");
                   
                });
               
                return false;
                });
               
            });
            
  
    </script>

</head>
<body background="<%=request.getContextPath()%>/images/Latina-doctor.jpg">

	<center class="head">
		Medico !!!! <br /> <br />
		</center>
		<%
	/*	ArrayList<String> al1=null;
        ArrayList<String> al2=null;
        
	try{
		SimpleServlet o=new SimpleServlet(); 
al1=   o.searchCities();
al2= o.searchDiseases();
//out.println("Size"+al1.size()+al2.size());
}catch(Exception e){
	out.println("I am in Exception"+e.getMessage());

	
}
	  session.setAttribute("cities",al1);
     	  session.setAttribute("diseases",al2);   
*/		%>

		<form method="POST" id="form1"  name="myForm"  onsubmit="return validate()">

			<table >
				<tr>
					<td class="prompt">Select City<sup><span class="red">*</span></sup>:</td>
					
					
					
					<td><select name="city" id="cit">
							<option value="-1" > Select </option>
						<%
					 
ArrayList cal=(ArrayList)session.getAttribute("cities");
if(cal!=null)
{

ListIterator lit1=cal.listIterator();
					
	while(lit1.hasNext())
{
	String  ct=(String)lit1.next();
	
	 %>
							<option value="<%=ct%>"><%=ct%></option>	
		<%	
	

}
}%>
					</select></td>
					
				</tr>
				<tr>
					<td class="prompt">Select Disease<sup><span class="red">*</span></sup>:</td>
					<td><select name="disease" id="dis">
					<option value="-1" > Select </option>
					<%
ArrayList dal=(ArrayList)session.getAttribute("diseases");
if(dal!=null)
{

ListIterator lit2=dal.listIterator();
					
	while(lit2.hasNext())
{
	String  dt=(String)lit2.next();

%>
					
					
							<option value="<%=dt%>"><%=dt%></option>
							
				
							<%
}
}%>	
					
					
					</select></td>
				</tr>
				<tr>
					<td class="prompt">Sort by<sup><span class="red">*</span></sup>:</td>
					<td><select name="sort" id="srt">
							<option value="Ascending">Ascending</option>
							<option value="Descending">Descending</option>

					</select></td>
				</tr>

				<tr>
					<td colspan=2 align="center"><input type='submit' value='Find' /></td>
				</tr>

			</table>
			<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>"></input>
    
		</form>
		
		<div id="res">
		<table id='report' border=1 bgcolor="#f1f1f1">

<%
ArrayList rpt=(ArrayList)session.getAttribute("records");
if(rpt!=null && rpt.size()!=0)
{
ListIterator lit=rpt.listIterator();
%>

<tr><th>Disease</th><th>Hospital name</th><th>Hospital street</th><th>Hospital city</th><th>Hospital state</th><th>Hospital zip</th><th>Avg amount<th>Total Patients</th></tr>
<%
while(lit.hasNext())
{
	HospDetails ss=(HospDetails)lit.next();

%>

<tr><td align=center><%=ss.getDisease()%></td><td align=center><%=ss.getHospName()%></td><td align=center><%=ss.getStreet()%></td><td align=center><%=ss.getCity()%></td><td align=center><%=ss.getState()%></td><td align=center><%=ss.getZip()%></td><td align=center><%=ss.getAvgAmount()%></td><td align=center><%=ss.getNoOfPat()%></td></tr>
<%
}
}%>
</table>

</div>

<div id="err" class="prompt">

</div>








	



</body>
</html>