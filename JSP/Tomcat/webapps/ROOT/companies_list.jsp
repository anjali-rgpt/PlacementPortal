<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="CSS\companies_list_stylesheet.css">
    <link rel="stylesheet" type="text/css" href="CSS\navstyles.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
        href="https://fonts.googleapis.com/css2?family=Exo+2:wght@300&family=Philosopher:wght@700&display=swap">
    <script>
        var but_list = {
            foot_but_1: "http://localhost:8080/companies_list_1.jsp",
            foot_but_2: "http://localhost:8080/companies_list_2.jsp",
            enable: "foot_but_1"
        };

        function PageHandler(but_dis) {
            var but_en = document.getElementById(but_list["enable"]);
            var frame = document.getElementById("body_frame");
            but_list["enable"] = but_dis.id;
            but_dis.disabled = true;
            but_en.disabled = false;
            frame.src = but_list[but_dis.id];
        }
    </script>
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
            <a href="http://localhost:8080/mainpage.jsp" class="nav-item nav-link" target="mainframe" id="home" name="home">Home</a>
            <a href="http://localhost:8080/companies_list.jsp" class="nav-item nav-link disabled" id="companies" name="companies">Companies</a>
            <a href="http://localhost:8080/companyregistration.jsp" class="nav-item nav-link " id="register" name="register">Registration</a>
            <a href="http://localhost:8080/calendar.jsp" class="nav-item nav-link" id="calendar" name="calendar">Calendar</a>
        </nav>
    </div>

    <section class="companylist_body">
        <h1> List of Companies</h1>

        <section class="embed-responsive embed-responsive-21by9">
            <iframe src="http://localhost:8080/companies_list_1.jsp" id="body_frame" class="body embed-responsive-item"></iframe>
        </section>


        <footer class="row justify-content-center">
            <div class="col-md-3">
                <button class="btn btn-outline-dark btn-block" id="foot_but_1" disabled onclick="PageHandler(foot_but_1)">1</button>
            </div>
            <div class="col-md-3">
                <button class="btn btn-outline-dark btn-block" id="foot_but_2" onclick="PageHandler(foot_but_2)">2</button>
            </div>
        </footer>
    </section>
</body>
</html>