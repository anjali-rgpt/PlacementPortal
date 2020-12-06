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

import java.util.ArrayList;
import java.util.List;
 
import java.util.Date;
 
public class CompanyBean {
     
    public List<String> getItems() {
        Connection con;
        PreparedStatement ps1;
        List<String> list = new ArrayList<String>();

        System.out.println("Entered Model View Company List");
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
            ps1 = con.prepareStatement("select CompanyName from Companies");
            ResultSet rs = ps1.executeQuery();
            list.add("---");
            if (rs.next()) {
                String element = rs.getString("CompanyName");
                System.out.println(element);
                list.add(element);
            }
            ps1.close();
            con.close();

        } catch (Exception e) {
            System.out.println("Something went wrong while getting company names");
        }

        return list;

    }

 
}