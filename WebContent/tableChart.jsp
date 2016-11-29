<!doctype html>
<html>

<head>
    <title>Home Screen Admin</title>
<!--    <link rel="stylesheet" href="style.css">-->
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<!--    <link rel="stylesheet" href="bootstrap.min.css">-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.bundle.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}http://www.w3schools.com/lib/w3.css" />
</head>

<body>
   
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %> 
    <%@ page import="Lab3.*" %>
    <%@ page import="java.util.*" %>
    
    <%

    
    String caseNumber = request.getParameter("caseNumber");
    //String caseNumber = "1";
    String gender = request.getParameter("gender");
    //String gender = "";
    String age = request.getParameter("age");
    //String age = "";
    String date = request.getParameter("date");
    String year = request.getParameter("year");
    String species = request.getParameter("speciesName");
    String fatal = request.getParameter("fatal");
    String country = request.getParameter("country");
    String area = request.getParameter("state");
    
    String select1 = "";
    String select2 = "";
    String select3 = "";
    String select4 = "";
    String select5 = "";
    String select6 = "";
    
    int count = 0;
%>

    <%
    DBentry DBentry=new DBentry();
    ResultSet result = null; 
    
    String query = "SELECT * FROM combinedshark WHERE case_number < 3100 ";
    
    if( age != "" ) {
    	query += " AND age= '"+ age +"'";
    }
    if( gender != "" ) {
    	query += " AND sex= '"+ gender +"'";
    }
    if( date != "" ) {
    	query += " AND date= '"+ date +"'";
    }
    if( year != "" ) {
    	query += " AND year= '"+ year +"'";
    }
    if( species != "" ) {
    	query += " AND species like '%"+ species +"%'";
    }
    if( fatal != "" ) {
    	query += " AND fatal_yn= '"+ fatal +"'";
    }
    if( country != "" ) {
    	query += " AND country= '"+ country +"'";
    }
    if( area != "" ) {
    	query += " AND area= '"+ area +"'";
    }
    
    //getVariables=DBentry.selectStatement("SELECT Distinct " + condition + " FROM combinedShark;");
    if (caseNumber != ""){
    	result = DBentry.selectStatement("SELECT * FROM combinedshark WHERE case_number = '"+ caseNumber +"';");
    }
    else{
    	result = DBentry.selectStatement(query);
    }
    
   

    ArrayList <String> resultNames = new ArrayList<String>();
    ArrayList <Integer> resultCounts = new ArrayList<Integer>();

    %>
   
    <nav class="w3-sidenav w3-dark-grey" style="width:70px; height:130%"> 
        <a href="index.html"><i class="fa fa-home w3-xxlarge navIcon"></i></a> 
        <a href="#"><i class="fa fa-search w3-xxlarge navIcon"></i></a> 
        <a href="tableChart.jsp"><i class="fa fa-table w3-xxlarge navIcon"></i></a> 
        <a href="barChart.jsp"><i class="fa fa-bar-chart w3-xxlarge navIcon"></i></a> 
        <a href="lineChart.html"><i class="fa fa-line-chart w3-xxlarge navIcon"></i></a> 
        <a href="pieChart.jsp"><i class="fa fa-pie-chart w3-xxlarge navIcon"></i></a> 
    </nav>
    <div class="w3-container w3-dark-grey header">
        <h1 class="navIcon"><i class="fa fa-database w3-xxlarge navIcon"></i> Database Interface</h1> </div>
    <div class="row">
        <div class="col-md-1">
        </div>
        <div class="col-md-5">
           
            <table class="table table-bordered table-hover">
                <tr>

                    <% if (caseNumber != "" || (select1 == "" && select2 == "" && select3 == "" && select4 == "" && select5 == "" && select6 == "")){ %>
	                  	<th> Case Number </th>
	                  	<th> Date </th>
	                  	<th> Year </th>
	                  	<th> Type </th>
	                  	<th> Country </th>
	                  	<th> Area </th>
	                  	<th> Location </th>
	                  	<th> Activity </th>
	                  	<th> Name </th>
	                  	<th> Gender </th>
	                  	<th> Age </th>
	                  	<th> Injury </th>
	                  	<th> Fatal </th>
	                  	<th> Time </th>
	                  	<th> Species </th>
	                  	<th> Investigator </th>
	                 <% } %>
                    <% if (select1 != ""){ %>
	                  	<th>  <%= select1 %> </th>
	                 <% } %>
                    <% if (select2 != ""){ %>
	                  	<th>  <%= select2 %> </th>
	                 <% } %>
	                 <% if (select3 != ""){ %>
	                  	<th>  <%= select3 %> </th>
	                 <% } %>
	                 <% if (select4 != ""){ %>
	                  	<th>  <%= select4 %> </th>
	                 <% } %>
	                 <% if (select5 != ""){ %>
	                  	<th>  <%= select5 %> </th>
	                 <% } %>
	                 <% if (select6 != ""){ %>
	                  	<th>  <%= select6 %> </th>
	                 <% } %>
	                 

                </tr>

            <% 
            	for (int i=0; result.next(); i++) { %>
                  	<tr>
                  		<%for (int k=1; k<17; k++) { %>
                  		<% if (result.getString(k) != null){ %>
	                  		<td> <%= result.getString(k) %> </td>
	                  		
	                  	<% count++;} 
	                  	}%>
	                  	
                  	</tr>
                  <%	
      			} %>
            </table>
        </div>
        <div class="col-md-5">
            
        </div>
        <script>
        	function goHome(){
        		window.location = "http://localhost:8080/Lab3/index.html";
        	}
        </script>
        <% if(count == 0){%>
        <div class="w3-card-8" style="margin-top: 100px; width: 25%; margin-left: 650px; text-align: center; padding: 50px;">
        	<h3>NO RESULTS!</h3>
        	<button onclick="goHome()">Go Back to Search</button>
        </div>
       <% }%>
    </div>
</body>

</html>