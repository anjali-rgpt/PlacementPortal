<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calendar</title>
    <link rel="stylesheet" type="text/css" href="CSS\calendar_stylesheet.css">
    <link rel="stylesheet" type="text/css" href="CSS\navstyles.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
        href="https://fonts.googleapis.com/css2?family=Exo+2:wght@300&family=Philosopher:wght@700&display=swap">
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
            <a href="http://localhost:8080/companies_list.jsp" class="nav-item nav-link" id="companies" name="companies">Companies</a>
            <a href="http://localhost:8080/companyregistration.jsp" class="nav-item nav-link " id="register" name="register">Registration</a>
            <a href="#" class="nav-item nav-link disabled" id="calendar" name="calendar" >Calendar</a>
        </nav>
    </div>
    <div id="calendar_body">
        <div class="row" id="main_row">
            <section class="col-md-8 " id="col1">
                <img class="img-fluid rounded mx-auto" src="Images\September-Calendar-2020.jpeg" alt="placeholder-calendar" />
            </section>

            <section class="col-md-4" id="col2">

                <section class="row" id="rowofevents">
                    <section class="col">
                    <h2>Event Reminder</h2>
                    <div class="card event">
                        <div class="card-body">
                            <a href="#" class="event-link">SAP Labs reminder</a>
                            <section class="card-text">Coding round</section>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <a href="#" class="event-link">Google reminder</a>
                            <section class="card-text">Interview</section>
                        </div>
                    </div>
                </section>
                </section>

                <section class="row" id="rowofnotes">
                    <section class="col">
                        <h2>Notes</h2>
                        <div class="card border-light mb-3 notes">
                            <div class="card-header">Attend talk</div>
                            <div class="card-body">
                            <p class="card-text">Preplacement talk requires absence from NCP class </p>
                            </div>
                            <div class="row buttons justify-content-center">
                                <div class="col">
                                <button class="btn btn-light btn-block" id="Edit" name="Edit">Edit</button>
                            </div>
                            <div class="col">
                                <button class="btn btn-outline-danger btn-block" id="Delete" name="Delete">Delete</button>
                            </div>
                            </div>
                        </div>
                    </section>
                </section>

            </section>
        </div>
    </div>
</body>

</html>