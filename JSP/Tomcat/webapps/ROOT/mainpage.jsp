<%@ page import="java.util.*"%>
<%System.out.println("In the main page");%>
<%System.out.println("Email:"+session.getValue("email"));%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Student Homepage</title>
    <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@300&family=Philosopher:wght@700&display=swap"
    rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="CSS\navstyles.css" />
    <link rel="stylesheet" type="text/css" href="CSS\mainstyles.css" />
</head>
<body>
    <div id="navigationbar" class="sticky-top">
        <header class="row ">
            <div class="col-md-4 col-sm-12 my-auto">
                <img src="Images\amritalogo.png" />
            </div>
            <div class="col-md-4 col-sm-12 my-auto">
                <h1>Student Portal</h1>
            </div>
            <div class="col-md-4 col-sm-12 my-auto">
                <button type="button" class="btn" id="signinout" value="logout" name="signinout"><a href="http://localhost:8080/">Logout</a></button>
            </div>
        </header>
        <nav class="nav nav-pills nav-justified">
            <a href="http://localhost:8080/mainpage.jsp" class="nav-item nav-link disabled" target="mainframe" id="home" name="home">Home</a>
            <a href="http://localhost:8080/companies_list.jsp" class="nav-item nav-link" id="companies" name="companies">Companies</a>
            <a href="http://localhost:8080/companyregistration.jsp" class="nav-item nav-link" id="register" name="register">Registration</a>
            <a href="http://localhost:8080/calendar.jsp" class="nav-item nav-link" id="calendar" name="calendar">Calendar</a>
        </nav>
    </div>

<section id="marketing">
    <div class="jumbotron">
        <h1 class="text-center display-4">Welcome to the Placement Portal</h1>
        <p class="lead text-center"> Ready to Change Your Life?</p>
        
    </div>
</section>
<section id="placement_grid">
    <div class="row">
        <div class="col-md-3"><img src="Images\Carousel\amazonlogo.png" alt="amazonlogo"/></div>
        <div class="col-md-3"><img src="Images\Carousel\googlelogo.png" alt="googlelogo"/></div>
        <div class="col-md-3"><img src="Images\Carousel\mrcooperlogo.png" alt="mrcooperlogo"/></div>
        <div class="col-md-3"><img src="Images\Carousel\saplabslogo.jpg" alt="saplabslogo"/></div>
    </div>
</section>
</body>
</html>