<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company Details</title>
    <link rel="stylesheet" type="text/css" href="CSS\companydetails.css">
    <link rel="stylesheet" type="text/css" href="CSS\navstyles.css" />


    <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@300&family=Philosopher:wght@700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

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
                <button type="button" class="btn" id="signinout" value="logout" name="signinout">Logout</button>
            </div>
        </header>
        <nav class="nav nav-pills nav-justified">
            <a href="http://localhost:8080/mainpage.jsp" class="nav-item nav-link" target="mainframe" id="home"
                name="home">Home</a>
            <a href="http://localhost:8080/companies_list.jsp" class="nav-item nav-link" id="companies"
                name="companies">Companies</a>
            <a href="http://localhost:8080/companyregistration.jsp" class="nav-item nav-link " id="register"
                name="register">Registration</a>
            <a href="http://localhost:8080/calendar.jsp" class="nav-item nav-link" id="calendar"
                name="calendar">Calendar</a>
        </nav>
    </div>
    <div class="details_pagebody col text-center text-md-center">
        <h1>Successful Submission</h1>
    </div>



</body>

</html>