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
    <%@ page import="Lab3.*" %>
    <%@ page import="java.util.ArrayList" %>

    <%

    DBentry DBentry=new DBentry();
    ResultSet getVariables = null;
    ResultSet count = null;
    
    //String condition = "area";
    String condition = "area";
    
    getVariables=DBentry.selectStatement("SELECT Distinct " + condition + " FROM sharkdata;");
    //results2=DBentry.selectStatement("SELECT COUNT(*) AS NumberOfOrders FROM sharkdata;");

    ArrayList <String> resultNames = new ArrayList<String>();
    ArrayList <Integer> resultCounts = new ArrayList<Integer>();

	for (int i=0; getVariables.next(); i++)
	{
		resultNames.add( getVariables.getString(1) );
	}
	
	for(int i=0; i<resultNames.size(); i++){
		count=DBentry.selectStatement("SELECT COUNT(*) AS total FROM sharkdata WHERE " + condition + " = '"+ resultNames.get(i) +"';");
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

    <div class="w3-container w3-dark-grey header">
        <h1 class="navIcon"><i class="fa fa-database w3-xxlarge navIcon"></i> Database Interface</h1> </div>
    <nav class="w3-sidenav w3-dark-grey" style="width:70px"> 
        <a href="index.html"><i class="fa fa-home w3-xxlarge navIcon"></i></a> 
        <a href="#"><i class="fa fa-search w3-xxlarge navIcon"></i></a> 
        <a href="tableChart.jsp"><i class="fa fa-table w3-xxlarge navIcon"></i></a> 
        <a href="barChart.jsp"><i class="fa fa-bar-chart w3-xxlarge navIcon"></i></a> 
        <a href="lineChart.html"><i class="fa fa-line-chart w3-xxlarge navIcon"></i></a> 
        <a href="pieChart.jsp"><i class="fa fa-pie-chart w3-xxlarge navIcon"></i></a> 
    </nav>
    
    <div class="row">
        <div class="col-md-1">
        </div>
        <div class="col-md-5">
            <div class="w3-card-8 chart">
                <canvas id="barChart" width="300" height="300"></canvas>
            </div>
        </div>
        <div class="col-md-5">
           <div class="w3-card-8 chart">
            <table class="table table-bordered table-hover">
                  <% for(int i=0; i<resultNames.size(); i++){ %>
                  	<tr>
	                  	<th> <%= resultNames.get(i) %> </th>
	                  	<td> <%= resultCounts.get(i) %></td>
                  	</tr>
                  <%	
      			} %>
    		</table>
         </div>
      </div>
    </div>
    <script src="barChart.js"></script>
</body>