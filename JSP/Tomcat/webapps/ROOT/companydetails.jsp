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
   
    <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@300&family=Philosopher:wght@700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

</head>

<body>
    <%
    String companyName = (String)request.getAttribute("companyName");
    String about = (String)request.getAttribute("about");
    String[] criteria=((String)request.getAttribute("criteria")).split("&");
    String cgpa = (String)request.getAttribute("cgpa");
    ArrayList rolenames=(ArrayList)request.getAttribute("roles");
    ArrayList descps=(ArrayList)request.getAttribute("roledescrip");
    ArrayList ctcs=(ArrayList)request.getAttribute("ctcs");
%>
    <div class="details_pagebody">
        <section id="header" class="row align-items-center">
            <div id="title" class="col-md-8 text-center text-md-left">
                <h1><%=companyName%></h1>
            </div>
            <div id="logo" class="col-md-4 text-center text-md-center">
                <img src="Images\warrior.png" width=75px height=75px />
            </div>
        </section>
        <section id="content" class="row">
            <section id="details" class="col-md-8">
                <section id="about" class="row">
                    <h1>About Company</h1>
                    <p><%=about%></p>

                </section>
                <section id="criteria" class="row">
                    <h1>Criteria</h1>
                    <ul>
                        <%for (String element:criteria){%>
                            <li><%=element%></li>
                        <%}%>
                    </ul>
                </section>

            </section>
            <section id="roles" class="col-md-4 text-center text-md-center">
                <h1>Roles</h1>
                <dl>
                <%for (int i=0;i < rolenames.size();i++){%>
                    <dt><%=(String)rolenames.get(i)%></dt>
                    <dd><%=(String)descps.get(i)%></dd>
                    <dd>CTC: <%=(Integer)ctcs.get(i)%></dd>
<%}%>
                </dl>
            </section>
    
        </section>
       
    </div>
</body>

</html>