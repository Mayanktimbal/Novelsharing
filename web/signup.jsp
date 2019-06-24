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
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
         <link href="${pageContext.request.contextPath}/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
  
    <link href="${pageContext.request.contextPath}/vendor/select2/select2.min.css" rel="stylesheet" media="all">
  
   
    <link href="${pageContext.request.contextPath}/css/signup.css" rel="stylesheet" media="all">
        <title>signup Page</title>
       
    </head>
    
   
<body>
    
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Registration Form</h2>
                    <form method="POST" name="signup" id="signup" method="post" action="signup1" onsubmit="return validate()" >
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">user name</label>
                                    <input class="input--style-4" type="text" NAME="uname"  placeholder=" Enter Your Username" width="30"   pattern="[A-Za-z0-9]{1,20}">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    
                                </div>
                            </div>
                        </div>
                          <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <input class="input--style-4"  type="email" NAME="email"  placeholder=" Email">
                                </div>
                            </div>
                        
                          </div>
                        
                        
                           <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Password</label>
                                    <input class="input--style-4" type="password" id="pass" NAME="pass" placeholder=" Password" required>
                                </div>
                            </div>
                        
                          </div>
                        
                        
                          <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Confirm Password</label>
                                    <input class="input--style-4" type="password" id="pass2" NAME="pass2"  placeholder=" Confirm password" required>
                                </div>
                            </div>
                        
                          </div>
                        
                        
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Phone Number</label>
                                    <input class="input--style-4" type="tel" pattern="\d{10}$" name="number" >
                                </div>
                            </div>
                       
                        <div class="input-group">
                            <label class="label">Area</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                   <p id="pappu">  </p>
                                <select name="area" id="areamenu" >
                                   
 <%
     Class.forName("com.mysql.jdbc.Driver");
      ServletContext sc= request.getServletContext();
  Connection conn1 = DriverManager.getConnection(sc.getInitParameter("dbrootpath"),sc.getInitParameter("dbuser"),sc.getInitParameter("dbpass"));
String databaseq= "CREATE DATABASE IF NOT EXISTS "+sc.getInitParameter("dbname");
Statement stm2= conn1.createStatement();
stm2.execute(databaseq);

     
           Connection conn = DriverManager.getConnection(sc.getInitParameter("dbrootpath")+"/"+sc.getInitParameter("dbname"),sc.getInitParameter("dbuser"),sc.getInitParameter("dbpass"));
           
      String areatableq= "CREATE TABLE IF NOT EXISTS "+sc.getInitParameter("dbname")+".area (pincode VARCHAR(500) NOT NULL,areaname VARCHAR(500) NOT NULL,PRIMARY KEY(pincode)) ";          
Statement stm1= conn.createStatement();
      stm1.execute(areatableq);
       
       
       
       Statement stm = conn.createStatement();
       ResultSet rs = stm.executeQuery("select * from area");
       
while(rs.next())
{
 out.print("<option value=\""+rs.getString(2)+"\" >"+ rs.getString(2)+"</option>");
}
     
     %>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                               <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Address</label>
                                  
                                     <textarea class="input--style-4" id="signup" name="address" id="address"></textarea>
                                </div>
                            </div>
                        
                          </div> 
                                
                                
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/match.js"> </script>
    <!-- Jquery JS-->
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
   
    <script src="${pageContext.request.contextPath}/vendor/select2/select2.min.js"></script>
   
   

  
    <script src="${pageContext.request.contextPath}/js/global.js"></script>


    </body>
</html>
