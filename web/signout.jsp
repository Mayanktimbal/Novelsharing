<%-- 
    Document   : signout
    Created on : Jun 3, 2019, 11:30:58 PM
    Author     : mayank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
      
    </head>
    <body>
         <div class="backbutton"  >
        
             <input type="image" src="back.png" width="50" height="50" onClick="history.back()"> </input>
        </div>
        <%
            
            session.setMaxInactiveInterval(0);
response.sendRedirect("index.jsp");
%>
    </body>
</html>
