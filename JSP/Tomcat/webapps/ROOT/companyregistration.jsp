<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>"

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register for Company</title>
    <link rel="stylesheet" type="text/css" href="CSS\regform.css" />
    <link rel="stylesheet" type="text/css" href="CSS\navstyles.css" />
    <link rel="stylesheet" type="text/css" href="CSS\companylink.css" />
    <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@300&family=Philosopher:wght@700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

    <script src="JS\Student\registrationvalidation.js" type="text/javascript"></script>
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
            <a href="http://localhost:8080/companyregistration.jsp" class="nav-item nav-link disabled" id="register"
                name="register">Registration</a>
            <a href="http://localhost:8080/calendar.jsp" class="nav-item nav-link" id="calendar"
                name="calendar">Calendar</a>
        </nav>
    </div>
    <%
    Connection con;
    PreparedStatement ps1,ps2;
    System.out.println("Entered Company Registration JSP");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        System.out.println("Class not found. " + e);
    }
    System.out.println("Class found");
    try{
    con = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/6dO9xvYDBl", "6dO9xvYDBl", "uBQpS0PirH");
    String query = "USE 6dO9xvYDBl";
    Statement stmt = con.createStatement();
    stmt.executeQuery(query);
    
    
    String email = (String)session.getAttribute("email");

    ps2=con.prepareStatement("select * from Student where EmailID = ?");
    ps2.setString(1,email);
    System.out.println("Email set to:"+email);

    ResultSet rs2 = ps2.executeQuery();
    System.out.println("Query done to select all details");
    String firstname = "X";
    String mname="X";
    String lname="Y";
    String rollnumber = "0";
    String phonenumber= "1";
    String address="Address";
    int gradyear=2020;
    float cgpa=10;

    while (rs2.next()){
        firstname = rs2.getString(1);
        mname = rs2.getString(2);
        lname = rs2.getString(3);
        rollnumber=rs2.getString(4);
        phonenumber=rs2.getString(6);
        address=rs2.getString(7);
        gradyear=Integer.parseInt(rs2.getString(10).split("-")[0]);
        cgpa=rs2.getFloat(11);
        System.out.println(firstname+lname+rollnumber+phonenumber+address+gradyear+cgpa);
    }

    session.putValue("rollnum",rollnumber);

    ps1 = con.prepareStatement("select distinct Companies.CompanyName from Companies where CompanyName not in (select CompanyName from Registrations where RollNumber = ?)");
    System.out.println("Statement");
    ps1.setString(1,rollnumber);
    ResultSet rs = ps1.executeQuery();
    System.out.println("Got the companies");


        %>


    <div id="c_registration_pagebody">
        <div id="selection" class="row align-items-center justify-content-center">
            <select name="company_name" onchange="populate(this)">
                <option selected>---</option>
                <% while (rs.next()){%>
                <option><%= rs.getString(1)%></option>
                <%System.out.println("Company:"+rs.getString(1));%>
                <% } %>
            </select>
        </div>

        <div class="row align-items-center justify-content-center">
            <form id="register_form" method="POST" action="http://localhost:8080/company_register_serve"
                onsubmit="return validate()">
                <h1>Registration Form</h1>

                <fieldset name="Personal" class="border-light pl-2 m-3">
                    <legend>Personal Details:</legend>

                    <section id="name" class="row">
                        <div class="col-md-4">
                            <label for="fname">First Name<span>*</span></label><br />
                            <input type="text" name="fname" id="fname" value="<%=firstname%>" required />
                        </div>
                        <div class="col-md-4">
                            <label for="mname">Middle Name</label><br />
                            <input type="text" name="mname" id="mname" value="<%=mname%>" />
                        </div>
                        <div class="col-md-4 ">
                            <label for="lname">Last Name<span>*</span></label><br />
                            <input type="text" name="lname" id="lname" value="<%=lname%>" required />
                        </div>
                    </section>

                    <div id="rollnum" class="row">
                        <div class="col-md-4">
                            <label for="rollnum">Roll Number<span>*</span></label><br />
                            <input type="text" name="rollnum" id="rollnumber" value="<%=rollnumber%>" required>
                        </div>
                    </div>

                    <section id="contact" class="row justify-content-between">

                        <div class="col-md-4 col-sm-12">
                            <label for="email">EMail ID<span>*</span></label><br />
                            <input type="email" name="email" id="email" value="<%=email%>" required>
                        </div>
                        <div class="col-md-4">
                            <label for="phonenum">Phone Number<span>*</span></label><br />
                            <input type="number" name="phonenum" id="phonenum" value="<%=phonenumber%>" required>
                        </div>
                    </section>

                    <section id="location" class="row">
                        <div class="col-md-4">
                            <label for="address">Address<span>*</span></label><br />
                            <textarea name="address" id="address" placeholder="<%=address%>" required></textarea>
                        </div>
                    </section>

                </fieldset>

                <fieldset name="Academic" class="border-light pl-2 m-3">
                    <legend>Academic Details</legend>
                    <section id="degree-details" class="row">
                        <div class="col-md-4">
                            <label>Degree<span>*</span></label><br />

                            <label for="btech">B.Tech.</label>
                            <input type="radio" id="btech" name="degree" value="btech" required>

                            <label for="mtech">M.Tech.</label>
                            <input type="radio" id="mtech" name="degree" value="mtech">
                        </div>
                        <div class="col-md-4">
                            <label for="department">Department<span>*</span></label><br />
                            <select name="department" id="department" required>
                                <option value="cse">Computer Science and Engineering</option>
                                <option value="eee">Electronic and Electrical Engineering</option>
                                <option value="che">Chemical Engineering</option>
                                <option value="civ">Civil Engineering</option>
                                <option value="mee">Mechanical Engineering</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="gradyear">Year of Graduation<span>*</span></label><br />
                            <input type="number" id="gradyear" name="gradyear" min=2021 max=2023 value="<%=gradyear%>"
                                required>
                        </div>
                    </section>
                    <section id="markdetails" class="row">
                        <div class="col-md-4">
                            <label for="cgpa">CGPA<span>*</span></label><br />
                            <input type="number" id="cgpa" name="cgpa" min=0.0 max=10.0 step=0.01 value="<%=cgpa%>"
                                required>
                        </div>
                    </section>
                </fieldset>
                <fieldset name="company-details" class="border-light pl-2 m-3">
                    <legend>Company Questions</legend>
                    <section id="company-role" class="row justify-content-between">
                        <div class="col-md-4">
                            <label for="companybox">Company<span>*</span></label><br />
                            <input type="text" name="companybox" id="companybox" value="Selected company" readonly
                                required>
                        </div>
                        <div class="col-md-4">
                            <label for="type">Type<span>*</span></label><br />
                            <select name="type" id="type" required>
                                <option value="Intern">Intern</option>
                                <option value="FTE">FTE</option>
                                <option value="Combined">Combined</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="role">Role<span>*</span></label><br />
                            <select name="role" id="role" required>
                                <option value="SWE">Software Engineer</option>
                                <option value="RD">Research and Dev</option>
                                <option value="Sec">System Security Engineer</option>
                            </select>
                        </div>
                    </section>
                    <section id="company-question" class="row">
                    
                        <div class="col-md-4">
                            <label for="question">Why do you want to join this company?</label><br />
                            <textarea id="question" name="question" minlength=50></textarea>
                        </div>
                    </section>
                    <section id="resume-upload" class="row">
                        <div class="col-md-4">
                            <label for="r-upload">Upload your resume<span>*</span></label><br />
                            <input type="file" id="r-upload" name="r-upload" required/>
                        </div>
                    </section>

                </fieldset>
                <% 
                ps1.close();
                con.close();}
        catch(Exception e){
            System.out.println("Exception while retrieving values:\n"+e);
        }
        
        %>
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
    

    <script>
        function populate(selectedVal) {
            document.getElementById('companybox').value = selectedVal.value;
            console.log(selectedVal.value);
            if ((selectedVal.value) != 'Amazon') {
                console.log('Here')
                document.getElementById("company_link").style.visibility = "hidden";
            } else {
                document.getElementById("company_link").style.visibility = "visible";
            }

        }
    </script>

</body>

</html>