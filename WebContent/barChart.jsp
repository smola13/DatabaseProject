<!doctype html>
<html>

<head>
    <title>Home Screen Admin</title>
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.bundle.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
</head>

<body>
	<%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %> 
    <%@ page import="java.util.*" %>
    <%@ page import="Lab3.*" %>
    <%@ page import="java.util.ArrayList" %>
    
    <%

    
    String caseNumber = request.getParameter("caseNumber");
    String gender = request.getParameter("sex");
    String age = request.getParameter("age");
    String date = request.getParameter("date");
    String year = request.getParameter("year");
    String species = request.getParameter("speciesName");
    String fatal = request.getParameter("fatal");
    String country = request.getParameter("country");
    String state = request.getParameter("area");

    
%>

    <%
    DBentry DBentry=new DBentry();
    ResultSet getVariables = null;
    ResultSet count = null;
    
    String condition = "country";
    
    
    
    getVariables=DBentry.selectStatement("SELECT Distinct " + condition + " FROM combinedShark;");

    ArrayList <String> resultNames = new ArrayList<String>();
    ArrayList <Integer> resultCounts = new ArrayList<Integer>();

	for (int i=0; getVariables.next(); i++)
	{
		if(!getVariables.getString(1).equals("unknown")){
			resultNames.add(getVariables.getString(1));
		}
	}
	
	for(int i=0; i<resultNames.size(); i++){
		count=DBentry.selectStatement("SELECT COUNT(*) AS total FROM combinedShark WHERE " + condition + " = '"+ resultNames.get(i) +"';");
		while(count.next()){
	    	resultCounts.add(count.getInt("total"));
	    }
	}
      %>
	        <script>
	         var labels = new Array();
	         var values = new Array();
	       	</script>
	       	
	       	<% for(int i=0; i<resultNames.size(); i++){ %>
	       	
	       		<script>
	       			labels.push('<%= resultNames.get(i) %>');
	       			values.push(<%= resultCounts.get(i)%>);
	       		</script>
	       	<%	
	       	} %>	
	    <%
	DBentry.closeDB();
	%>

    <nav class="w3-sidenav w3-dark-grey" style="width:70px"> 
        <a href="index.html"><i class="fa fa-home w3-xxlarge navIcon"></i></a> 
        <a href="#"><i class="fa fa-search w3-xxlarge navIcon"></i></a> 
        <a href="tableChart.jsp"><i class="fa fa-table w3-xxlarge navIcon"></i></a> 
        <a href="barChart.jsp"><i class="fa fa-bar-chart w3-xxlarge navIcon"></i></a> 
        <a href="lineChart.html"><i class="fa fa-line-chart w3-xxlarge navIcon"></i></a> 
        <a href="pieChart.jsp"><i class="fa fa-pie-chart w3-xxlarge navIcon"></i></a> 
    </nav>
    <div class="w3-container w3-dark-grey header">
        <h1 class="navIcon"><i class="fa fa-database w3-xxlarge navIcon"></i>Global Shark Attacks</h1> </div>
    
    <div class="row">
        <div class="col-md-1">
        </div>
        <div class="col-md-6">
            <div class="w3-card-8 chart">
                <canvas id="barChart" width="300" height="300"></canvas>
            </div>
        </div>
        <div class="col-md-4">
           <div class="w3-card-8 chart">
            <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>Shark Name</th>
                <th class="sortable">Total Attacks</th>
            </tr>
        </thead>
        
        <tbody>
                 <% 
                  for(int i=0; i<resultNames.size(); i++) { %>
                  	<tr>
	                  	<td> <%= resultNames.get(i) %> </td>
	                  	<td> <%= resultCounts.get(i) %></td>
                  	</tr>
                  <%	
      			} %>
        </tbody>
    </table>
         </div>
      </div>
    </div>
    <script src="barChart.js"></script>
</body>
</html>