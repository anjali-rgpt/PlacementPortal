<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>"
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="CSS\companies_list_constyle.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Exo+2:wght@300&family=Philosopher:wght@700&display=swap">
    </head>
    <body>
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
    
        ps2=con.prepareStatement("select RollNumber,CGPA from Student where EmailID = ?");
        ps2.setString(1,email);
        System.out.println("Email set to:"+email);
    
        ResultSet rs2 = ps2.executeQuery();
        System.out.println("Executed");
        String rollnum="C";
        float cgpa=0;
        while(rs2.next()){
            rollnum = rs2.getString(1);
            cgpa=rs2.getFloat(2);
        }
        if(rollnum!=null)
        session.putValue("rollnum",rollnum);
    
        ps1 = con.prepareStatement("select distinct CompanyName from Companies");
        System.out.println("Statement");
        ResultSet rs = ps1.executeQuery();
        System.out.println("Got the companies");
    
            %>
        <div class="row justify-content-center" id="companycolumn">
            <div class = "col-auto" id="companies">
                
               <% while(rs.next()){
                   System.out.println(rs.getString(1));%>
                <form method="GET" action="http://localhost:8080/companydetails_serve" name="form_"+"<%=rs.getString(1)%>">
                <table border="1"></table>
                <tr>
                    <td id="<%=rs.getString(1)%>" name="x"><%=rs.getString(1)%></td>
                    <input type="hidden" name="compnametable" value="<%=rs.getString(1)%>"/>
                    <td><input type="submit" value="Details"/></td>
                </tr>
               </table>
                </form>
                <%}
            con.close();}
                catch(Exception e){
                    System.out.println("Some db retrieval error"+e);
                } %>
            </div>
        </div>
    </body>
</html>