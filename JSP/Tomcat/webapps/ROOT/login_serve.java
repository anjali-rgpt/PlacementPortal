import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.http.Cookie;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebServlet("/login_serve")
public class login_serve extends HttpServlet {
    Connection con;
    PreparedStatement ps1;

    public login_serve() {
        super();
        System.out.println("Entered Login JSP");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        try {
            String emailUser = request.getParameter("email");
            String pass = request.getParameter("pass");
            ps1 = con.prepareStatement("select count(*) from Users where EmailID = ? and PasswordVal = ?");
            ps1.setString(1, emailUser);
            ps1.setString(2, pass);
            ResultSet rs = ps1.executeQuery();
            int c = 0;
            if (rs.next())
                c = rs.getInt(1);
            if (c == 0) {
                System.out.println("Here");
                response.sendRedirect("http://localhost:8080/error.jsp");
            } else {
                HttpSession session = request.getSession();                
                session.setAttribute("email", emailUser);
                System.out.println("Session stored");               
                ps1.close();
                con.close();
                response.sendRedirect("http://localhost:8080/mainpage.jsp");
            }
        } catch (Exception e) {
            System.out.println("SQL Exception" + e);
        }

    }
}