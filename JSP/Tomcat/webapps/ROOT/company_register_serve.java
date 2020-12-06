import java.sql.*;
import java.util.*;
import java.io.*;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import javax.servlet.http.Cookie;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebServlet("/company_register_serve")
public class company_register_serve extends HttpServlet {

    Connection con;
    PreparedStatement ps1;
    PrintWriter out;

    public company_register_serve() {
        super();
        System.out.println("Entered Company Register Serve Servlet");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Class not found. " + e);
        }
        System.out.println("Class found");
        try {
            con = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/6dO9xvYDBl", "6dO9xvYDBl",
                    "uBQpS0PirH");
            String query = "USE 6dO9xvYDBl";
            Statement stmt = con.createStatement();
            stmt.executeQuery(query);
        } catch (Exception e) {
            System.out.println("Exception for loading DB");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fname = request.getParameter("fname");
        String mname = request.getParameter("mname");
        String lname = request.getParameter("lname");

        System.out.println("Name:" + fname + " " + mname + " " + lname);

        String rollnum = request.getParameter("rollnumber");
        String company = request.getParameter("companybox");
        String rolename = request.getParameter("role");
        String roletype = request.getParameter("type");

        System.out.println("Company:" + company);
        System.out.println("Role:" + rolename + " Type:" + roletype);

        String question = request.getParameter("question");
        String resumelink = request.getParameter("r-upload");
        System.out.println("Question Answer:" + question);
        System.out.println("Link:" + resumelink);

        HttpSession session = request.getSession();
        String storedroll = (String)session.getAttribute("rollnum");
        session.setAttribute("registeredCompany", company);

 try{       ps1 = con.prepareStatement("select CompanyLink from Companies where CompanyName = ?",ResultSet.TYPE_SCROLL_SENSITIVE, 
 ResultSet.CONCUR_UPDATABLE);
        ps1.setString(1, company);
        ResultSet rs = ps1.executeQuery();
        int rows = 0;

        if (rs.last()) {
            rows = rs.getRow();
            rs.beforeFirst();
        }

        if (storedroll == rollnum) {
            System.out.println("Successful Registration");
            con.close();
            if (rows > 0)
                response.sendRedirect("http://localhost:8080/stage2.jsp");
            else
                response.sendRedirect("http://localhost:8080/success.jsp");

        }
    }
    catch(Exception e){
        System.out.println("DB Related? :"+e);
    }

    }

}
