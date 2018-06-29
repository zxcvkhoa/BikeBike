	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>BikeBike</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">


  </head>
<!-- NAVBAR
================================================== -->
  <body>
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="/">BikeBike</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="/dashboard">Dashboard</a></li>
              </ul>
              <ul class="nav navbar-nav pull-right">
              	<li><a href="/logout">Log out</a></li>
              </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>

		<div class="container-wrapper">
    	<div class="container">
        <div class="page-header">
        
            <h1>Add Part</h1>

            <p class="lead">Fill the below information to add a part:</p>
        </div>

			
		<c:out value="${error}"/>
		
        <form:form action="/addPart" method="post" modelAttribute="part" enctype="multipart/form-data">
        <div class="form-group">
	            <label for="name">Part</label>
	            <form:input path="name"/>
	            <form:errors path="name"/>
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <form:input path="price" id="price" class="form-Control"/>
        </div>
        <div class="form-group">
            <label for="type">Type</label>
            <label class="checkbox-inline"><form:radiobutton path="type" id="type" value="performance" />Performance</label>
            <label class="checkbox-inline"><form:radiobutton path="type" id="type" value="cosmetic" />Cosmetic</label>
            <label class="checkbox-inline"><form:radiobutton path="type" id="type" value="electronic" />Electronic</label>
            <label class="checkbox-inline"><form:radiobutton path="type" id="type" value="accessories" />Accessories</label>
        </div>
        <div class="form-group">
            <label for="makeOfBike">Make of bike</label>
	        <form:select path="makeOfBike">	
					<form:option value="Yamaha" label="Yamaha"/>
					<form:option value="Honda" label="Honda"/>
					<form:option value="Kawasaki" label="Kawasaki"/>
					<form:option value="Harley-Davidson" label="Harley-Davidson"/>
					<form:option value="BMW" label="BMW"/>		
					<form:option value="Suzuki" label="Suzuki"/>
					<form:option value="Aprilia" label="Aprilia"/>
					<form:option value="Triumph" label="Triumph"/>  
					<form:option value="Any" label="Any"/> 	
		   	</form:select>
        </div>
        <br><br>
        <input type="submit" value="Submit" class="btn btn-default">
        <a href="/dashboard" class="btn btn-default">Cancel</a>
        </form:form>



		</div>

			
		</div>
    </div><!-- /.container -->



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="<c:url value="/resources/js/jquery-1.11.3.min.js"/>"><\/script>')</script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

  </body>
</html>