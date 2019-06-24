<%-- 
    Document   : store
    Created on : Jun 1, 2019, 1:45:12 PM
    Author     : ADMIN
--%>
<%@page import="java.sql.*"%>
<%@page import ="javax.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">       
        <meta name="viewport" content="width=device-width">
        <title>store Page</title>
    </head>
    <body>
            <div class="backbutton"  >
        
             <input type="image" src="back.png" width="50" height="50" onClick="history.back()"> </input>
        </div>
<%  
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
                    
Class.forName("com.mysql.jdbc.Driver");
    ServletContext sc= request.getServletContext();
 Connection conn1 = DriverManager.getConnection(sc.getInitParameter("dbrootpath"),sc.getInitParameter("dbuser"),sc.getInitParameter("dbpass"));
String databaseq= "CREATE DATABASE IF NOT EXISTS "+sc.getInitParameter("dbname");
Statement stm1= conn1.createStatement();
stm1.execute(databaseq);
String areatableq= "CREATE TABLE IF NOT EXISTS "+sc.getInitParameter("dbname")+".area (pincode VARCHAR(500) NOT NULL,areaname VARCHAR(500) NOT NULL,PRIMARY KEY(pincode)) ";          
stm1.execute(areatableq);
String usertableq= "CREATE TABLE IF NOT EXISTS "+sc.getInitParameter("dbname")+".user (username VARCHAR(100) NOT NULL,email VARCHAR(500) NOT NULL,password VARCHAR(200) NOT NULL,userid VARCHAR(500) NOT NULL,mobile VARCHAR(200) NOT NULL,area VARCHAR(200) NOT NULL,address  VARCHAR(500) NOT NULL,UNIQUE(email),PRIMARY KEY(userid)) ";
stm1.execute(usertableq);
String booktableq= "CREATE TABLE IF NOT EXISTS "+sc.getInitParameter("dbname")+".book (  bookid VARCHAR(200) NOT NULL,  bookname VARCHAR(200) NULL,  author VARCHAR(200) NULL,  tpage VARCHAR(200) NULL, genre VARCHAR(200) NULL, publisher VARCHAR(200) NULL,  bcon VARCHAR(200) NULL, userid VARCHAR(200) NOT NULL, username VARCHAR(200) NOT NULL, eyear VARCHAR(200) NULL,  email VARCHAR(200) NOT NULL, mobileno VARCHAR(200) NULL, i1 BLOB NOT NULL,  i2 BLOB NOT NULL,status VARCHAR(500) DEFAULT\'AVAILABLE\',bid VARCHAR(500) NULL,bdesc MEDIUMTEXT NOT NULL,language VARCHAR(500) NOT NULL,area VARCHAR(200) NULL ,PRIMARY KEY (bookid)); ";
stm1.execute(booktableq); 
 String ordertableq= "CREATE TABLE IF NOT EXISTS "+sc.getInitParameter("dbname")+".ordertable (  orderid VARCHAR(200) NOT NULL,  sid VARCHAR(200) NULL,  reqid VARCHAR(200) NULL,  sbookid VARCHAR(200) NULL, reqbookid VARCHAR(200) NULL, odate TIMESTAMP NULL,rdate TIMESTAMP NULL,rdays VARCHAR(200) NULL,sremark VARCHAR(6000) NULL,orderstatus VARCHAR(200) NOT NULL DEFAULT 'REQUESTED' ,PRIMARY KEY (orderid)); ";
  stm1.execute(ordertableq);               
               
  Connection conn = DriverManager.getConnection(sc.getInitParameter("dbrootpath")+"/"+sc.getInitParameter("dbname"),sc.getInitParameter("dbuser"),sc.getInitParameter("dbpass"));
           
           Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("select * from user where email=\'"+email+ "\' and password= \'"+pass+"\'");
           if(email.equalsIgnoreCase("admin@gmail.com") && pass.equalsIgnoreCase("admin") )
           { session.setAttribute("uname","admin");
           
           response.sendRedirect("admin.jsp");
           }
                  
            
            else if(!rs.next())
            {
                    RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
                      rd.include(request,response);
                      
                       out.print("<html>");
                    out.println("<script>");
                    out.println("alert('username or password wrong!')");
                        out.println("</script>");
                    out.print("</html>");
           
            }
             
       else
            { 
             String uid=  rs.getString("userid");
           session.setAttribute("uname",rs.getString("username"));
           session.setAttribute("email",rs.getString("email"));
           session.setAttribute("mobile",rs.getString("mobile"));
                session.setAttribute("area",rs.getString("area"));
                 session.setAttribute("address",rs.getString("address"));
                  session.setAttribute("userid", uid);
                    session.setAttribute("sessionid", session.getId());
               RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
               rd.forward(request,response);
               
            }

        %>               
         
        
    </body>
</html>
