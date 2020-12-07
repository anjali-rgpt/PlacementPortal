<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register for Company</title>
    <link rel="stylesheet" type="text/css" href="static\CSS\regform.css" />
    <link rel="stylesheet" type="text/css" href="static\CSS\navstyles.css" />
    <link rel="stylesheet" type="text/css" href="static\CSS\companylink.css" />
    <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@300&family=Philosopher:wght@700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

    <script src="static\JS\Student\registrationvalidation.js" type="text/javascript"></script> 
</head>

<body>
    <div id="navigationbar" class="sticky-top">
        <header class="row ">
            <div class="col-md-4 col-sm-12 my-auto">
                <img src="static\Images\amritalogo.png" />
            </div>
            <div class="col-md-4 col-sm-12 my-auto">
                <h1>Student Portal</h1>
            </div>
            <div class="col-md-4 col-sm-12 my-auto">
                <button type="button" class="btn" id="signinout" value="logout" name="signinout"><a href="http://localhost:8080/">Logout</a></button>
            </div>
        </header>
        <nav class="nav nav-pills nav-justified">
            <a href="mainpage.html" class="nav-item nav-link" target="mainframe" id="home" name="home">Home</a>
            <a href="companies_list.html" class="nav-item nav-link" id="companies" name="companies">Companies</a>
            <a href="companyregistration.html" class="nav-item nav-link disabled" id="register" name="register">Registration</a>
            <a href="calendar.html" class="nav-item nav-link" id="calendar" name="calendar">Calendar</a>
        </nav>
    </div>
    <div id="c_registration_pagebody">
        <div id="selection" class="row align-items-center justify-content-center">
            <select name="company_name" onchange="populate(this)">
                <option value="---" selected>---</option>
                <option value="Mr.Cooper">Mr.Cooper</option>
                <option value="Amazon">Amazon</option>
                <option value="Microsoft">Microsoft</option>
            </select>
        </div>
        <div class="row align-items-center justify-content-center">
            <form id="register_form" method="POST" action="register.java" onsubmit="return validate()">
                <h1>Registration Form</h1>

                <fieldset name="Personal" class="border-light pl-2 m-3">
                    <legend>Personal Details:</legend>

                    <section id="name" class="row">
                        <div class="col-md-4">
                            <label for="fname">First Name</label><br />
                            <input type="text" name="fname" id="fname" required />
                        </div>
                        <div class="col-md-4">
                            <label for="mname">Middle Name</label><br />
                            <input type="text" name="mname" id="mname" />
                        </div>
                        <div class="col-md-4 ">
                            <label for="lname">Last Name</label><br />
                            <input type="text" name="lname" id="lname" required />
                        </div>
                    </section>

                    <div id="rollnum" class="row">
                        <div class="col-md-4">
                            <label for="rollnum">Roll Number</label><br />
                            <input type="text" name="rollnum" id="rollnumber" required>
                        </div>
                    </div>

                    <section id="contact" class="row justify-content-between">

                        <div class="col-md-4 col-sm-12">
                            <label for="email">EMail ID</label><br />
                            <input type="email" name="email" id="email" required>
                        </div>
                        <div class="col-md-4">
                            <label for="phonenum">Phone Number</label><br />
                            <input type="number" name="phonenum" id="phonenum" required>
                        </div>
                    </section>

                    <section id="location" class="row">
                        <div class="col-md-4">
                            <label for="address">Address</label><br />
                            <textarea name="address" id="address" required></textarea>
                        </div>
                    </section>

                </fieldset>

                <fieldset name="Academic" class="border-light pl-2 m-3">
                    <legend>Academic Details</legend>
                    <section id="degree-details" class="row">
                        <div class="col-md-4">
                            <label>Degree</label><br />

                            <label for="btech">B.Tech.</label>
                            <input type="radio" id="btech" name="degree" value="btech" required>

                            <label for="mtech">M.Tech.</label>
                            <input type="radio" id="mtech" name="degree" value="mtech">
                        </div>
                        <div class="col-md-4">
                            <label for="department">Department</label><br />
                            <select name="department" id="department" required>
                                <option value="cse">Computer Science and Engineering</option>
                                <option value="eee">Electronic and Electrical Engineering</option>
                                <option value="che">Chemical Engineering</option>
                                <option value="civ">Civil Engineering</option>
                                <option value="mee">Mechanical Engineering</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="gradyear">Year of Graduation</label><br />
                            <input type="number" id="gradyear" name="gradyear" min=2021 max=2023 required>
                        </div>
                    </section>
                    <section id="markdetails" class="row">
                        <div class="col-md-4">
                            <label for="cgpa">CGPA</label><br />
                            <input type="number" id="cgpa" name="cgpa" min=0.0 max=10.0 step=0.01 required>
                        </div>
                    </section>
                </fieldset>
                <fieldset name="company-details" class="border-light pl-2 m-3">
                    <legend>Company Questions</legend>
                    <section id="company-role" class="row justify-content-between">
                        <div class="col-md-4">
                            <label for="companybox">Company</label><br />
                            <input type="text" name="companybox" id="companybox" value="Selected company" readonly required>
                        </div>
                        <div class="col-md-4">
                            <label for="role">Role</label><br />
                            <select name="role" id="role" required>
                                <option value="SWE">Software Engineer</option>
                                <option value="RD">Research and Dev</option>
                                <option value="Sec">System Security Engineer</option>
                            </select>
                        </div>
                    </section>
                    <section id="company-question" class="row">
                        <div class="col-md-4">
                            <label for="question">Answer the following</label><br />
                            <textarea id="question" name="question" minlength=50></textarea>
                        </div>
                    </section>
                    <section id="resume-upload" class="row">
                        <div class="col-md-4">
                            <label for="r-upload">Upload your resume</label><br />
                            <input type="file" id="r-upload" name="r-upload"/>
                        </div>
                    </section>

                </fieldset>
                <section class="container" id="buttons">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="reset" class="btn btn-outline-info btn-block">
                        </div>
                        <div class="col-md-6">
                            <input type="submit" class="btn btn-outline-dark btn-block">
                        </div>
                    </div>
                </section>

            </form>
        </div>
    </div>
    <section class="optional row" id="company_link">
        <div class="col text-center text-md-center">
            <p>The company you have selected requires you to complete registration by going on its site at the
                link mentioned below.</p>
            
            <a href="http://amazon.com">Complete registration</a>
        </div>
    </section>

    <script>
        function populate(selectedVal) {
            document.getElementById('companybox').value = selectedVal.value;
            console.log(selectedVal.value);
            if ((selectedVal.value)!='Amazon'){
                console.log('Here')
                document.getElementById("company_link").style.visibility="hidden";
            }
            else{
                document.getElementById("company_link").style.visibility="visible";
            }
           
        }
    </script>

</body>

</html>