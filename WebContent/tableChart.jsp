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
    
    List values = null;
    List count = null;
    
    Hibernate hibernate = new Hibernate();
    count = hibernate.countDistinct(null, null);
    values = hibernate.listRows("FROM Location", "Location");
    System.out.println(count.get(0));

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
           <div class="w3-card-8 chart">
            <table class="table table-bordered table-hover">
                <tr>
                    <th>Country</th>
                    <th>Area</th>
                    <th>Location</th>

                </tr>

            <%
            for (@SuppressWarnings("rawtypes") Iterator iterator = values.iterator(); iterator.hasNext();){
        		 Location location = (Location) iterator.next();
        	
                 %>
                 <tr>
                 
                    <td><%= location.getCountry() %></td>
                    <td><%= location.getArea() %></td>
                    <td><%= location.getLocation() %></td>

                 </tr>
                <%
            }

            %>
            </table>
            </div>
        </div>
        <div class="col-md-5">
            
        </div>
    </div>
</body>

</html>