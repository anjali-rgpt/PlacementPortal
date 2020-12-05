<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
Connection con;
PreparedStatement ps1;
System.out.println("Entered Login JSP");
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
}
catch(ClassNotFoundException e){
    System.out.println("Class not found. "+e);
}
System.out.println("Class found");

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncp","root","RC7pA9vB");
String query="USE NCP";
Statement stmt=con.createStatement();
stmt.executeQuery(query);

String emailUser = request.getParameter("email");
String pass = request.getParameter("pass");

ps1 = con.prepareStatement("select count(*) from Users where EmailID = ? and PasswordVal = ?");
ps1.setString(1,emailUser);
ps1.setString(2,pass);
ResultSet rs = ps1.executeQuery();
int c = 0;
if(rs.next())
c = rs.getInt(1);

if(c==0)
out.println("<b>Invalid</b>");
else{
   session.putValue("email",emailUser);
   System.out.println("Session stored");
   response.sendRedirect("http://localhost:8080/mainpage.jsp");
}



%>

<%

        try
        {
            //close
            ps1.close();
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }

%>