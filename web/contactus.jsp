<%-- 
    Document   : contactus
    Created on : Jun 21, 2019, 3:27:09 PM
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
        <title>contact us Page</title>
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">  
   <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bookshow.css"/> 

       
    </head>
   
    <body>
          <div class="backbutton"  >
        
             <input type="image" src="back.png" width="50" height="50" onClick="history.back()"> </input>
        </div>
     <div class="row" style="margin-left:0px;">
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

          <p style="text-align: center; font-size: 40px; color: green">you have any questions or feedback, don't hesitate to contact us<br></p>
              <p style="text-align: center; font-size: 40px; color:blue; text-decoration: underline">novelSharing@gmail.com</p></centre>
 
    <br>
        <br>
    <br>
    <br>
    <br>
    <br>
    <br>
     <br>
    <br>
    <br>
    <br>
    <br
    <br>
  <br>
    <br>
    <br>
     <br>
    <%@include file="footer.jsp" %>
    </body>
</html>
