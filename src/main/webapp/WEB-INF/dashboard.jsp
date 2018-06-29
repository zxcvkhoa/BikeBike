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
              	<li><a href="/addPart">Add New Part</a></li>
              	</ul>
              	<ul class="nav navbar-nav pull-right">
              		<li><a href="/logout">Log out</a></li>
              	</ul>
              	<ul class="nav navbar-nav pull-right">
              		<li><a href="/shoppingCart">My Cart</a></li>
              	</ul>
            </div>
          </div>
        </nav>

      </div>
    </div>

    <div class="container-wrapper">
		<div class="container">
			<div class="page-header">
				<div>
					<h3>Available Parts</h3>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>Name</th>
								<th>Type</th>
								<th>Price</th>
								<th>Make</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${notMyParts}" var="part">
							<tr>
								<td><a href="/parts/<c:out value="${part.id}"/>"><c:out value="${part.name}"/></a></td>
								<td><c:out value="${part.type}"/></td>
								<td>$<c:out value="${part.price}"/></td>
								<td><c:out value="${part.makeOfBike}"/></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<div>		
					<h3>Your Parts</h3>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>Name</th>
								<th>Type</th>
								<th>Price</th>
								<th>Make</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${myParts}" var="part">
							<tr>
								<td><a href="/parts/<c:out value="${part.id}"/>"><c:out value="${part.name}"/></a></td>
								<td><c:out value="${part.type}"/></td>
								<td>$<c:out value="${part.price}"/></td>
								<td><c:out value="${part.makeOfBike}"/></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
			
			
			</div>
			
			
      <!-- FOOTER -->
      <footer>
        <p>&copy; 2018 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>
	</div>
    </div><!-- /.container -->



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="<c:url value="/resources/js/jquery-1.11.3.min.js"/>"><\/script>')</script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

  </body>
</html>