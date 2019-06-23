<%-- 
    Document   : aboutus
    Created on : Jun 21, 2019, 3:13:49 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css"> 
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bookshow.css"/> 
        <title> Aboout us </title>
    </head>
    <body> <div class="row" style="margin-left:0px;">
 <div class="navbar">
     <div class="col-md-6 sm-12">
                      
                    <a href="index.jsp"> <img src="a.png" height="40" width="50"><big>Novel Sharing<big> </a>
                       </div>       
                
    
       
            
     <div  class="col-md-4 sm-12">                  
     <a href="myorder.jsp">Requested</a> 
    <a href="shared.jsp">Share </a>
    <a href="profile.jsp">profile</a>
    <a href="orders.jsp">My order </a>
                        <%
      if(session.getAttribute("userid") == null)
      {
          out.print("<a href='login.jsp'>Login </a>");
      
      }
else
      {
        out.print("<a href='signout.jsp'>Logout </a>");
      }
      %>
      
  
     </div><div class="col-md-2 sm-12">
 <%
            if(session.getAttribute("userid") == null)
            {
         out.println("<a>Hello Guest</a>");
             }
            
            else
            {
                 out.println("<a>Hello "+ session.getAttribute("uname") +"</a>");
            
            }
            %>    
      
     </div>    
 </div>          
  </div>
            <div style="text-align:center">
            <p style="font-size: 50px"> About Novel Sharing </p>
     <h1> Developer & Designer </h1> 
        <h2>    Ram  Desai </h2>
         <h2>   Mayank  Timbal </h2>
          <h2>  Bhavdip  Jamod </h2>
            </div>
    <%@include file="footer.jsp" %>     
    </body>
</html>
