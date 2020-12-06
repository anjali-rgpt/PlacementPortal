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
    <title>Company Details</title>
    <link rel="stylesheet" type="text/css" href="CSS\companydetails.css">
    <link rel="stylesheet" type="text/css" href="CSS\navstyles.css" />
    <link rel="stylesheet" type="text/css" href="CSS\companylink.css" />
   
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
            <a href="http://localhost:8080/mainpage.jsp" class="nav-item nav-link" target="mainframe" id="home" name="home">Home</a>
            <a href="http://localhost:8080/companies_list.jsp" class="nav-item nav-link" id="companies" name="companies">Companies</a>
            <a href="http://localhost:8080/companyregistration.jsp" class="nav-item nav-link " id="register" name="register">Registration</a>
            <a href="http://localhost:8080/calendar.jsp" class="nav-item nav-link" id="calendar" name="calendar">Calendar</a>
        </nav>
    </div>
    <div class="details_pagebody">
        <h1>Successful Submission - Page 2</h1>
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


String company = (String)session.getAttribute("registeredCompany");

ps1 = con.prepareStatement("select CompanyLink from Companies where CompanyName = ?");
ps1.setString(1,company);
ResultSet rs = ps1.executeQuery();

String complink="link";

while (rs.next()){
    complink=rs.getString(1);
}%>
<section class="optional row" id="company_link">


<div class="col text-center text-md-center">
    <p>The company you have selected requires you to complete registration by going on its site at the
        link mentioned below.</p>

    <a href="<%=complink%>" target="_blank">Complete registration</a>
</div>
</section>
       
    </div>
    <%
ps1.close();
con.close();}
    catch(Exception e){
        System.out.println("Exception "+ e);
    }
</body>

</html>