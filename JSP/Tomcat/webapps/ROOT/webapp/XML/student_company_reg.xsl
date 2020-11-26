<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        
        <html>
            
            <head>
                <style> 
                    th,td{
                    padding:1em;
                    }
                    #registrations th{
                        font-weight:bold;
                        font-size:16pt;
                    }

                    #registrations td{
                        font-weight:bold;
                        font-size:14pt;
                    }
                </style>
            </head>
            
            <body>
                
                <h1>All Student Details</h1>
                
                <table border="2">
                    <tr>
                        <th>First Name</th>
                        <th>Middle Name</th>
                        <th>Last Name</th>
                        <th>Roll Number</th>
                        <th>Email ID</th>
                        <th>Phone Number</th>
                        <th>Address</th>
                        <th>Degree</th>
                        <th>Department</th>
                        <th>Graduation Year</th>
                        <th>CGPA</th>
                    </tr>
                    <xsl:for-each select="/Registrations/Student">
                        <xsl:sort select="RollNumber" order="ascending"/>
                        
                        <tr>
                            <td><xsl:value-of select="FirstName"/></td>
                            <td><xsl:value-of select="MiddleName"/></td>
                            <td><xsl:value-of select="LastName"/></td>
                            <td><xsl:value-of select="RollNumber"/></td>
                            <td><xsl:value-of select="EmailID"/></td>
                            <td><xsl:value-of select="PhoneNumber"/></td>
                            <td><xsl:value-of select="Address"/></td>
                            <td><xsl:value-of select="Degree"/></td>
                            <td><xsl:value-of select="Department"/></td>
                            <td><xsl:value-of select="GradYear"/></td>
                            <td><xsl:value-of select="CGPA"/></td>
                        </tr>    
                    </xsl:for-each>
                </table>
                
                <br/>
                
                <h1>Registrations</h1>
                <table border="1" id="registrations">
                    <tr>
                        <th>Roll Number</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Company Name</th>
                        <th>Role</th>
                        <th>Type</th>
                        <th>Question</th>
                        <th>Resume Link</th>
                        <th>Status of Selection</th>
                    </tr>
                    
                    <xsl:for-each select="/Registrations/Student/Companies/Company">
                        <xsl:sort select="ancestor::RollNumber" order="ascending"/>
                        
                        <tr>
                            <xsl:choose>
                                <xsl:when test="Status='Registered'">
                                    <td bgcolor="#f2efe9"><xsl:value-of select="ancestor::Student/RollNumber"/></td>
                                    <td bgcolor="#f2efe9"><xsl:value-of select="ancestor::Student/FirstName"/></td>
                                    <td bgcolor="#f2efe9"><xsl:value-of select="ancestor::Student/LastName"/></td>
                                    <td bgcolor="#f2efe9"><xsl:value-of select="CompanyName"/></td>
                                    <td bgcolor="#f2efe9"><xsl:value-of select="RoleName"/></td>
                                    <td bgcolor="#f2efe9"><xsl:value-of select="Type"/></td>
                                    <td bgcolor="#f2efe9"><xsl:value-of select="Question"/></td>
                                    <td bgcolor="#f2efe9"><xsl:value-of select="ResumeLink"/></td>
                                    <td bgcolor="#f2efe9"><xsl:value-of select="Status"/></td>
                                </xsl:when>
                                <xsl:when test="Status='Selected'">
                                    <td bgcolor="#c3f3c0"><xsl:value-of select="ancestor::Student/RollNumber"/></td>
                                    <td bgcolor="#c3f3c0"><xsl:value-of select="ancestor::Student/FirstName"/></td>
                                    <td bgcolor="#c3f3c0"><xsl:value-of select="ancestor::Student/LastName"/></td>
                                    <td bgcolor="#c3f3c0"><xsl:value-of select="CompanyName"/></td>
                                    <td bgcolor="#c3f3c0"><xsl:value-of select="RoleName"/></td>
                                    <td bgcolor="#c3f3c0"><xsl:value-of select="Type"/></td>
                                    <td bgcolor="#c3f3c0"><xsl:value-of select="Question"/></td>
                                    <td bgcolor="#c3f3c0"><xsl:value-of select="ResumeLink"/></td>
                                    <td bgcolor="#c3f3c0"><xsl:value-of select="Status"/></td>
                                </xsl:when>
                                <xsl:when test="Status='Rejected'">
                                    <td bgcolor="#bc4b51"><xsl:value-of select="ancestor::Student/RollNumber"/></td>
                                    <td bgcolor="#bc4b51"><xsl:value-of select="ancestor::Student/FirstName"/></td>
                                    <td bgcolor="#bc4b51"><xsl:value-of select="ancestor::Student/LastName"/></td>
                                    <td bgcolor="#bc4b51"><xsl:value-of select="CompanyName"/></td>
                                    <td bgcolor="#bc4b51"><xsl:value-of select="RoleName"/></td>
                                    <td bgcolor="#bc4b51"><xsl:value-of select="Type"/></td>
                                    <td bgcolor="#bc4b51"><xsl:value-of select="Question"/></td>
                                    <td bgcolor="#bc4b51"><xsl:value-of select="ResumeLink"/></td>
                                    <td bgcolor="#bc4b51"><xsl:value-of select="Status"/></td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td bgcolor="#f8e16c"><xsl:value-of select="ancestor::Student/RollNumber"/></td>
                                    <td bgcolor="#f8e16c"><xsl:value-of select="ancestor::Student/FirstName"/></td>
                                    <td bgcolor="#f8e16c"><xsl:value-of select="ancestor::Student/LastName"/></td>
                                    <td bgcolor="#f8e16c"><xsl:value-of select="CompanyName"/></td>
                                    <td bgcolor="#f8e16c"><xsl:value-of select="RoleName"/></td>
                                    <td bgcolor="#f8e16c"><xsl:value-of select="Type"/></td>
                                    <td bgcolor="#f8e16c"><xsl:value-of select="Question"/></td>
                                    <td bgcolor="#f8e16c"><xsl:value-of select="ResumeLink"/></td>
                                    <td bgcolor="#f8e16c"><xsl:value-of select="Status"/></td>
                                </xsl:otherwise>
                            </xsl:choose>
                        </tr>    
                    </xsl:for-each>
                </table>
            </body>
        </html>
        
    </xsl:template>
    
</xsl:stylesheet>