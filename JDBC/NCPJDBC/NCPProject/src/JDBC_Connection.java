import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class JDBC_Connection {
    public static void main(String[] args){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

        }
        catch(ClassNotFoundException e){
            System.out.println("Class not found. "+e);
        }
        System.out.println("JDBC Class Found");

        try{
        DocumentBuilderFactory docBuilderFactory=DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder=docBuilderFactory.newDocumentBuilder();
		Document doc = docBuilder.parse(new File("D:\\4th Year\\NCP\\NCPProject\\XML\\student_company_reg.xml"));
		doc.getDocumentElement().normalize();
		System.out.println("Root element of doc is:"+doc.getDocumentElement().getNodeName());
        }

        catch(Exception e){
            System.out.println("Error related to XML");
        }
        
        try{
        	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncp","root","RC7pA9vB");
        }
        catch(Exception e){
        	System.out.println("Could not find DB");
        }
    }
}
