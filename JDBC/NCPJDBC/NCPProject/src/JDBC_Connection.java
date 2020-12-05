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

        Connection con=DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/6dO9xvYDBl","6dO9xvYDBl","uBQpS0PirH");
        
        String query="USE 6dO9xvYDBl";
        Statement stmt=con.createStatement();
        stmt.executeQuery(query);
        
        PreparedStatement prepInsert1=con.prepareStatement("insert into Student values(?,?,?,?,?,?,?,?,?,?,?)",ResultSet.TYPE_SCROLL_SENSITIVE, 
                ResultSet.CONCUR_UPDATABLE);
        
        PreparedStatement prepInsert2=con.prepareStatement("insert into Registrations values(?,?,?,?,?,?,?)",ResultSet.TYPE_SCROLL_SENSITIVE, 
                ResultSet.CONCUR_UPDATABLE);
        
        PreparedStatement prepInsert3=con.prepareStatement("insert into Users values(?,?)", ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        
        PreparedStatement prepSelect1=con.prepareStatement("select RollNumber from Student where RollNumber=?",ResultSet.TYPE_SCROLL_SENSITIVE, 
                ResultSet.CONCUR_UPDATABLE);
        
        PreparedStatement prepSelect2=con.prepareStatement("select RollNumber from Registrations where (RollNumber=?) AND (CompanyName=?)",ResultSet.TYPE_SCROLL_SENSITIVE, 
                ResultSet.CONCUR_UPDATABLE);
        
        PreparedStatement prepSelect3=con.prepareStatement("select EmailID from Users where (EmailID=?)",ResultSet.TYPE_SCROLL_SENSITIVE, 
                ResultSet.CONCUR_UPDATABLE);
        
        NodeList listOfPersons=doc.getElementsByTagName("Student");
		for ( int i=0; i<listOfPersons.getLength();i++){
			//System.out.println("Here");
			Node firstPerson=listOfPersons.item(i);
			if(firstPerson.getNodeType()==Node.ELEMENT_NODE){
				Element firstPersonElement = (Element)firstPerson;
				
				NodeList firstNames=firstPersonElement.getElementsByTagName("FirstName");
				Element fnameElement=(Element)firstNames.item(0);
				NodeList textFNList=fnameElement.getChildNodes();
				String fname=((Node)textFNList.item(0)).getNodeValue().trim();
				System.out.println(fname); 
				
				String mname="";
				try{
				NodeList middleNames=firstPersonElement.getElementsByTagName("MiddleName");
				Element mnameElement=(Element)middleNames.item(0);
				NodeList textMNList=mnameElement.getChildNodes();
				mname=((Node)textMNList.item(0)).getNodeValue().trim();
				System.out.println(mname);
				}
				catch(Exception e){
					mname="";
				}
				
				NodeList lastNames=firstPersonElement.getElementsByTagName("LastName");
				Element lnameElement=(Element)lastNames.item(0);
				NodeList textLNList=lnameElement.getChildNodes();
				String lname=((Node)textLNList.item(0)).getNodeValue().trim();
				System.out.println(lname);
				
				NodeList rollnums=firstPersonElement.getElementsByTagName("RollNumber");
				Element rollElement=(Element)rollnums.item(0);
				NodeList textRollList=rollElement.getChildNodes();
				String rollnum=((Node)textRollList.item(0)).getNodeValue().trim();
				
				NodeList emails=firstPersonElement.getElementsByTagName("EmailID");
				Element emailElement=(Element)emails.item(0);
				NodeList textEmailList=emailElement.getChildNodes();
				String email=((Node)textEmailList.item(0)).getNodeValue().trim();
				
				NodeList phones=firstPersonElement.getElementsByTagName("PhoneNumber");
				Element phoneElement=(Element)phones.item(0);
				NodeList textPhoneList=phoneElement.getChildNodes();
				String phone=((Node)textPhoneList.item(0)).getNodeValue().trim();
				
				NodeList addresses=firstPersonElement.getElementsByTagName("Address");
				Element addElement=(Element)addresses.item(0);
				NodeList textAddList=addElement.getChildNodes();
				String address=((Node)textAddList.item(0)).getNodeValue().trim();
				
				NodeList degrees=firstPersonElement.getElementsByTagName("Degree");
				Element degreeElement=(Element)degrees.item(0);
				NodeList textDList=degreeElement.getChildNodes();
				String degree=((Node)textDList.item(0)).getNodeValue().trim();
				
				NodeList depts=firstPersonElement.getElementsByTagName("Department");
				Element deptElement=(Element)depts.item(0);
				NodeList textDeptList=deptElement.getChildNodes();
				String department=((Node)textDeptList.item(0)).getNodeValue().trim();
				
				NodeList gradyears=firstPersonElement.getElementsByTagName("GradYear");
				Element gradyearElement=(Element)gradyears.item(0);
				NodeList textGYList=gradyearElement.getChildNodes();
				String gradyear=((Node)textGYList.item(0)).getNodeValue().trim();
				
				NodeList cgpas=firstPersonElement.getElementsByTagName("CGPA");
				Element cgpaElement=(Element)cgpas.item(0);
				NodeList textCList=cgpaElement.getChildNodes();
				String cgpa=((Node)textCList.item(0)).getNodeValue().trim();
				float cg=Float.parseFloat(cgpa);
				
				NodeList passVals=firstPersonElement.getElementsByTagName("Password");
				Element passElement=(Element)passVals.item(0);
				NodeList textPassList=passElement.getChildNodes();
				String pass=((Node)textPassList.item(0)).getNodeValue().trim();
				System.out.println(pass);
				
				prepSelect1.setString(1,rollnum);
				prepSelect2.setString(1,rollnum);
				prepSelect3.setString(1,email);
				ResultSet rs = prepSelect1.executeQuery();
				//System.out.println("Hi");
				if(!rs.last()){

					System.out.println("Hello");

						prepInsert1.setString(1,fname);
						prepInsert1.setString(2,mname);
						prepInsert1.setString(3, lname);
						prepInsert1.setString(4, rollnum);
						prepInsert1.setString(5, email);
						prepInsert1.setString(6, phone);
						prepInsert1.setString(7, address);
						prepInsert1.setString(8, degree);
						prepInsert1.setString(9, department);
						prepInsert1.setString(10, gradyear);
						prepInsert1.setFloat(11, cg);
						int c = prepInsert1.executeUpdate();
						System.out.println("Number of rows updated:"+c);

				}
				
				ResultSet newrs = prepSelect3.executeQuery();
				if(!newrs.last()){
					
					System.out.println("New user added");
					prepInsert3.setString(1,email);
					prepInsert3.setString(2,pass);
					int c=prepInsert3.executeUpdate();
					System.out.println("Number of rows updated for Users:"+c);
				}
				
				
				String compName="";
				String RoleName="";
				String RoleType="";
				String Question="";
				String ResumeLink="";
				String status="";
				
				NodeList companies=firstPersonElement.getElementsByTagName("Company");
				for (int j=0;j<companies.getLength();j++){
					System.out.println("Company "+j);
					
					
					
					Node compNode=companies.item(j);
					if(compNode.getNodeType()==Node.ELEMENT_NODE){
						
						Element compElement = (Element)compNode;
						
						NodeList compNames=compElement.getElementsByTagName("CompanyName");
						Element cnameElement=(Element)compNames.item(0);
						NodeList textCNList=cnameElement.getChildNodes();
						compName=((Node)textCNList.item(0)).getNodeValue().trim();
						System.out.println(compName);
						
						prepSelect2.setString(2,compName);
						
						NodeList roleNames=compElement.getElementsByTagName("RoleName");
						Element rolenameElement=(Element)roleNames.item(0);
						NodeList textRNList=rolenameElement.getChildNodes();
						RoleName=((Node)textRNList.item(0)).getNodeValue().trim();
						System.out.println(RoleName);
						
						NodeList roletypes=compElement.getElementsByTagName("Type");
						Element typeElement=(Element)roletypes.item(0);
						NodeList textTList=typeElement.getChildNodes();
						RoleType=((Node)textTList.item(0)).getNodeValue().trim();
						//System.out.println(RoleType);
						
						NodeList questions=compElement.getElementsByTagName("Question");
						Element questElement=(Element)questions.item(0);
						NodeList textQList=questElement.getChildNodes();
						Question=((Node)textQList.item(0)).getNodeValue().trim();
						//System.out.println(Question);
						
						NodeList resumes=compElement.getElementsByTagName("ResumeLink");
						Element resumeElement=(Element)resumes.item(0);
						NodeList textResList=resumeElement.getChildNodes();
						ResumeLink=((Node)textResList.item(0)).getNodeValue().trim();
						//System.out.println(ResumeLink);
						
						NodeList stat=compElement.getElementsByTagName("Status");
						Element statElement=(Element)stat.item(0);
						NodeList textSList=statElement.getChildNodes();
						status=((Node)textSList.item(0)).getNodeValue().trim();
						System.out.println(status);
						
						ResultSet rs2=prepSelect2.executeQuery();
						if(!rs2.last()){
						prepInsert2.setString(1,rollnum);
						prepInsert2.setString(2, compName);
						prepInsert2.setString(3, RoleName);
						prepInsert2.setString(4, RoleType);
						prepInsert2.setString(5, Question);
						prepInsert2.setString(6, ResumeLink);
						prepInsert2.setString(7, status);
						
						int c = prepInsert2.executeUpdate();
						System.out.println("Number of rows updated for Registrations:"+c);
						}
						
						
					}
					
					
				}
				
				
				

				
			}
			

			
		}
        
        }
        catch(Exception e){
        	System.out.println(e);
        	
        }
        
        
    }
}
