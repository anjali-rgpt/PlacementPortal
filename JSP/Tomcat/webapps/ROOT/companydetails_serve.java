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

import java.util.ArrayList;
import java.util.List;

@WebServlet("/companydetails_serve")
public class companydetails_serve extends HttpServlet{

    Connection con;
    PreparedStatement ps1, ps2;
    PrintWriter out;

    public companydetails_serve() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String companyName="";
        try{
        companyName = request.getParameter("compnametable");
        if (companyName==null)
        throw new SQLException();
        System.out.println("Company Name:" + companyName);
        }
        catch(Exception e){
            System.out.println("Not stored");
        }

        try {
            System.out.println("Entered Company Details Serve Servlet");
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

        try{
            ps1=con.prepareStatement("select * from Companies where CompanyName = ?");
            ps1.setString(1,companyName);
            ResultSet rs = ps1.executeQuery();

            ps2=con.prepareStatement("select * from Roles where CompanyName = ?");
            ps2.setString(1,companyName);
            ResultSet rs2 = ps2.executeQuery();

            request.setAttribute("companyName",companyName);
            String about="";
            String criteria="";
            String cgpa="";
            List<String> rolenames=new ArrayList<>();
            List<Integer> ctcs=new ArrayList<>();
            List<String> roledescps=new ArrayList<>();


            while (rs.next()){
                about=rs.getString(6);
                criteria=rs.getString(4);
                cgpa=rs.getString(2);
                System.out.println(about+" "+criteria+" "+cgpa);
            }

            while (rs2.next()){
                rolenames.add(rs2.getString(2));
                roledescps.add(rs2.getString(3));
                ctcs.add(rs2.getInt(4));
            }

            request.setAttribute("about",about);
            request.setAttribute("criteria",criteria);
            request.setAttribute("cgpa",cgpa);
            request.setAttribute("roles",rolenames);
            request.setAttribute("ctcs",ctcs);
            request.setAttribute("roledescrip",roledescps);

            con.close();
            RequestDispatcher dispatcher = request.getRequestDispatcher("http://localhost:8080/companydetails.jsp");
            dispatcher.forward(request, response);

        }
        catch(Exception e){
            System.out.println("New error:"+e);
        }
    }
}
