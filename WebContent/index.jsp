<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap.css" />
<title>Lab 3</title>
</head>
<body>

<body BGCOLOR="#FDF5E6">

<%@ page import="java.io.*" %> 
<%@ page import="Lab3.*" %>

<h1 align="center"> A Sample FORM</h1>
<form action="index.jsp" method="post" class="form-horizontal">
	<div class="form-group">
	    <label class="col-sm-2 control-label">Item Number:</label>
	    <div class="col-xs-4">
	      <input class="form-control" id="itemNumber" type="text" name="itemNumber">
	    </div>
  	</div>
	<br>
	<div class="form-group">
	    <label class="col-sm-2 control-label">Price Each:</label>
	    <div class="col-xs-4">
	      <input class="form-control" id="priceEach" type="text" name="priceEach">
	    </div>
  	</div>
	<hr>
	<br>
	<div class="form-group">
	    <label class="col-sm-2 control-label">First Name:</label>
	    <div class="col-xs-4">
	      <input class="form-control" id="firstName" type="text" name="firstName">
	    </div>
  	</div>
	<br>
	<div class="form-group">
	    <label class="col-sm-2 control-label">Last Name:</label>
	    <div class="col-xs-4">
	      <input class="form-control" id="lastName" type="text" name="lastName">
	    </div>
  	</div> 
	<br>
	<div class="form-group">
	    <label class="col-sm-2 control-label">Shipping Address:</label>
	    <div class="col-xs-4">
	      <input class="form-control" id="shippingAddress" type="text" name="shippingAddress">
	    </div>
  	</div>
	<br>
	<div class="form-group">
		<label class="col-sm-2 control-label">Card Type:</label>
		<div class="col-sm-offset-2 col-sm-10">
		    <div class="radio">
			  <label><input type="radio" name="creditCard" value="Visa">MasterCard</label>
			</div>
			<div class="radio">
			  <label><input type="radio" name="creditCard" value="MasterCard">Visa</label>
			</div>
		</div>
  	</div>
	<br>
	<div class="form-group">
	    <label class="col-sm-2 control-label">Card Number:</label>
	    <div class="col-xs-4">
	      <input class="form-control" id="cardNumber" type="text" name="cardNumber">
	    </div>
  	</div>
	<br>
	<div class="col-sm-offset-2 col-xs-4">
		<input type="submit" class="btn btn-primary btn-lg btn-block" value="Submit Order">
	</div>
	<br>
	<br>
</form>
<%
String itemNumber=request.getParameter("itemNumber");
String priceEach=request.getParameter("priceEach");
String firstName=request.getParameter("firstName");
String lastName=request.getParameter("lastName");
String shippingAddress=request.getParameter("shippingAddress");
String creditCard=request.getParameter("creditCard");
String cardNumber=request.getParameter("cardNumber");

if (itemNumber!= null&&!itemNumber.trim().equals("")){
	String encryptedCardNumber = PWCrypto.encrypt(cardNumber);
	DBentry DBentry=new DBentry();
	boolean flag;
	flag=DBentry.entry(itemNumber, priceEach, firstName, lastName, shippingAddress, creditCard, encryptedCardNumber);
	if(flag) {%>
		<script type="text/javascript">
			alert("Entry Success"); 
			window.location = "http://localhost:8080/Lab3/results.jsp";
		</script>
	<%
	}
	else { %>
	<script type="text/javascript">
		alert("Entry Failure"); dbClose();
	</script>
	<% 
	}
}

%>
</body>
</html>