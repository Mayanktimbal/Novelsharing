<%-- 
    Document   : signup
    Created on : Jun 1, 2019, 3:36:55 PM
    Author     : ADMIN
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">
        <title>signup Page</title>
       
    </head>
    
    <body bgcolor="cyan">
 
    
        <h1> Novel Sharing </h1>
        
        <form name="signup" id="signup" method="post" action="signup1" onsubmit="return validate()"  >
<br><br><br>
<input type="text" NAME="uname"  placeholder=" Enter Your Username" width="30"   pattern="[A-Za-z0-9]{1,20}" ><br><br> 
<input type="email" NAME="email"  placeholder=" Email" <br><br> <br>
<input type="password" id="pass" NAME="pass" placeholder=" Password" required ><br><br> 
<input type="password" id="pass2" NAME="pass2"  placeholder=" Confirm password" required>
   <p id="pappu">  </p>
   <br><br> 
  
   
	
 <img src="whatapp.jpeg" style="width:50px; height:50px;" ><span>+91</span> <input    style="width: 300px;margin-left: 0px;" type="tel" pattern="^\d{10}$" name="number"  placeholder=" What's app number" required></div><br>
 <div><table ><tr><td>Select area:</h3></td><td><select class="row" id="areamenu" name="area">

 <%
     Class.forName("com.mysql.jdbc.Driver");
     Connection  conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","");
String databaseq= "CREATE DATABASE IF NOT EXISTS nosh";
     Statement stm1= conn1.createStatement();
stm1.execute(databaseq);
     
       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nosh","root","");
String areatableq= "CREATE TABLE IF NOT EXISTS nosh.area (pincode VARCHAR(500) NOT NULL,areaname VARCHAR(500) NOT NULL,PRIMARY KEY(pincode)) ";          
stm1.execute(areatableq);
       
       
       
       Statement stm = conn.createStatement();
       ResultSet rs = stm.executeQuery("select * from area");
       
while(rs.next())
{
 out.print("<option value=\""+rs.getString(2)+"\" >"+ rs.getString(2)+"</option>");
}
     
     %>
     
     </select>
             </td>
         </tr>
         <tr>
                <td>Address:</td>
             <td>
         <textarea id="signup" name="address" id="address"></textarea>
             </td>
          
         </tr>
     </table>
 </div>
</div>
<br>
<button name="submit" style="width:100px; height:50px;" >submit</button>
<script type="text/javascript" src="${pageContext.request.contextPath}/match.js"> </script>
  
</form> 
<script>
    
    
    
</script>
    </body>
</html>
