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
import javax.servlet.RequestDispatcher;

@WebServlet("/company_register_serve")
public class company_register_serve extends HttpServlet {

    Connection con;
    PreparedStatement ps1,ps2;
    PrintWriter out;

    public company_register_serve() {
        super();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
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
        } catch (Exception e) {
            System.out.println("Something in the loads" + e);
        }
        try {
            String fname = request.getParameter("fname");
            String mname = request.getParameter("mname");
            String lname = request.getParameter("lname");

            System.out.println("Name:" + fname + " " + mname + " " + lname);

            String rollnum = request.getParameter("rollnum");
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
            String storedroll = (String) session.getAttribute("rollnum");
            System.out.println("Stored:" + storedroll);
            session.setAttribute("registeredCompany", company);
            System.out.println("Company name stored");

            ps1 = con.prepareStatement("select CompanyLink from Companies where CompanyName = ?",
                    ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps1.setString(1, company);
            ResultSet rs = ps1.executeQuery();
            System.out.println("Executed Queries");

            ps2=con.prepareStatement("insert into Registrations values(?,?,?,?,?,?,?)");
            ps2.setString(1,rollnum);
            ps2.setString(2,company);
            ps2.setString(3,rolename);
            ps2.setString(4,roletype);
            ps2.setString(5,question);
            ps2.setString(6,resumelink);
            ps2.setString(7,"Registered");

            int rsinsert=ps2.executeUpdate();
           
            System.out.println(rsinsert+" rows updated");
            int rows = 0;

            while (rs.next()) {
                rows++;
                if (rs.getString(1)==null){
                    rows--;
                }
            }
            System.out.println("Number of rows:" + rows);
            System.out.println(storedroll.equals(rollnum));
            System.out.println(storedroll+" "+rollnum);
            if((storedroll.equals(rollnum))&&(rsinsert>0)) {
                System.out.println("Successful Registration");
                if (rows > 0)
                    response.sendRedirect("http://localhost:8080/stage2.jsp");
                else
                    response.sendRedirect("http://localhost:8080/success.jsp");

            }
            else{
                RequestDispatcher rd=request.getRequestDispatcher("http://localhost:8080/companyregistration.jsp");  
                rd.forward(request, response); 
            }
        } catch (Exception e) {
            System.out.println("DB Related? :" + e);
        }

    }

}
