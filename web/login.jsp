<%-- 
    Document   : index.jsp
    Created on : Jun 1, 2019, 12:47:18 PM
    Author     : Ram_Mayank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">
        <title>main page</title>
        
    </head>
    <body bgcolor="cyan">
  <h1> <center>Novel Sharing </center></h1>
  <h2><center> welcome <center> </h2>
              <% 
                  if(session.getAttribute("userid") != null )
                  {
                      response.sendRedirect("index.jsp");
                  }
                
                  
              
                  %>
  <form method="post" action="store.jsp">
  Enter Email: <input type="text" name="email"> <br><br>
  Enter Password: <input type="password" name="pass"> <br><br>
  
  <button type="submit" style="width:100px; height:50px;"> submit </button> &nbsp &nbsp
  <button type="reset" style="width:100px; height:50px;"> reset </button>
  </form><br>
   <a href="forgot.jsp"> forgot password? </a> <br><br>
  <a href="signup.jsp"> Click here to register </a>
        
    
    
    
    </body> 
  
</html>
