import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class Companies extends HttpServlet{
    String dburl="jdbc:mysql://localhost:3306/ncp";
    String dbUser="root";
    String dbPass="RC7pA9vB";


    public List<String> list() throws SQLException{
        List<String> listCategory = new ArrayList<>();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con= DriverManager.getConnection(dburl,dbUser,dbPass);
            Statement stmt=con.createStatement();
            stmt.executeQuery("USE NCP");

            HttpSession session=request.getSession(true);
            String userEmail=session.getAttribute("email");

            System.out.println("User email:"+userEmail);

            PreparedStatement ps1 = con.prepareStatement("select CGPA,RollNumber from Student where EmailID = ?");
            ps1.setString(1, userEmail);

            ResultSet rs1=ps1.executeQuery();
            float cgpa=0;
            String roll;
            while (rs1.next()){
                cgpa=rs1.getFloat("CGPA");
                roll=rs1.getString("RollNumber");
            }
            System.out.println("CGPA:"+cgpa);

            PreparedStatement ps2 = con.prepareStatement("select distinct CompanyName from Registrations where RollNumber = ? ");
            ps2.setString(1,roll);
            ResultSet rs2 = ps2.executeQuery();
            List<String> companiesRegistered = new ArrayList<String>();

            while(rs2.next()){
                String companyName=rs2.getString("CompanyName");
                companiesRegistered.add(companyName);
            }

            PreparedStatement ps3=con.prepareStatement("select CompanyName from Companies where CGPA = ?");
            ps3.setFloat(1, cgpa);
            ResultSet rs3=ps3.executeQuery();

            while (rs3.next()){
                String companyName=rs3.getString("CompanyName");
                if (!companiesRegistered.contains(companyName)){
                    listCategory.add(companyName);
                }
            }
        }

        catch(Exception e){
            System.out.println("Error:"+e);
        }

        return listCategory;

    }

}