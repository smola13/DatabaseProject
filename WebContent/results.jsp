<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lab 3</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap.css" />
</head>
<body>

<body BGCOLOR="#FDF5E6">

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %> 
<%@ page import="Lab3.*" %>

<%

DBentry DBentry=new DBentry();
ResultSet results = null;
//results=DBentry.selectStatement("SELECT * FROM customer");
results=DBentry.selectStatement("SELECT * FROM sharkdata");

%>

<table class="table table-bordered table-hover">
	<tr>
		<th>Date</th>
		<th>Year</th>
		<th>Type</th>
		<th>Country</th>
		<th>Area</th>
		<th>Location</th>
		<th>Activity</th>
		<th>Name</th>
		<th>Gender</th>
		<th>Age</th>
		<th>Injury</th>
		<th>Fatal</th>
		<th>Time</th>
		<th>Species</th>
		<th>Source</th>
	</tr>

<%
while (results.next()) {
	 %>
	 <tr>
	 	<td><%= results.getString(2)%></td>
	 	<td><%= results.getString(3)%></td>
	 	<td><%= results.getString(4)%></td>
	 	<td><%= results.getString(5)%></td>
	 	<td><%= results.getString(6)%></td>
	 	<td><%= results.getString(7)%></td>
	 	<td><%= results.getString(8)%></td>
	 	<td><%= results.getString(9)%></td>
	 	<td><%= results.getString(10)%></td>
	 	<td><%= results.getString(11)%></td>
	 	<td><%= results.getString(12)%></td>
	 	<td><%= results.getString(13)%></td>
	 	<td><%= results.getString(14)%></td>
	 	<td><%= results.getString(15)%></td>
	 	<td><%= results.getString(16)%></td>
	 </tr>
	<%
}

DBentry.closeDB();

%>
</table>
</body>
</html>