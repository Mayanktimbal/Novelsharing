<%-- 
    Document   : homepage
    Created on : Jun 3, 2019, 2:58:33 PM
    Author     : ADMIN
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">
            <title>Homepage</title>
    </head>
    <body>
        
     
                   <ul>

  
    <%-- <li onclick="JavaScript:window.location='signout.jsp';"><a> Logout</a></li> --%>
  <li><a href="orders.jsp">My order </a></li>
  <%
      if(session.getAttribute("userid") == null)
      {
          out.print("<li><a href='login.jsp'>Login </a></li>");
      
      }
else
      {
        out.print("<li><a href='signout.jsp'>Logout </a></li>");
      }
      %>
    
 <li> <a href="profile.jsp">profile</a> </li>
      <li> <a href="myorder.jsp">requested</a> </li>
      <li> <a href="shared.jsp">Share </a></li>
      
</ul>
        
         <%
            if(session.getAttribute("userid") == null)
            {
         out.println("<h1>Hello Guest</h1>");
             }
            
            else
            {
                 out.println("<h1>Hello "+ session.getAttribute("uname") + "</h1>");
            
            }
            %>
            <h1>Available Category</h1> 
            <ul class="x">
              <li><a href="categorybookshow.jsp?category=LOVE">Love</a></li>
              <li><a href="categorybookshow.jsp?category=KIDS">Kids</a></li>
              <li><a href="categorybookshow.jsp?category=ADVENTURE">Adventure</a></li>
              <li><a href="categorybookshow.jsp?category=CRIME">Crime</a></li>
              <li><a href="categorybookshow.jsp?category=MYSTRY">mystry</a></li>
              <li><a href="categorybookshow.jsp?category=COMEDY">comedy</a></li>
            </ul>
       
             
             
        
        
   
    </body>
</html>
