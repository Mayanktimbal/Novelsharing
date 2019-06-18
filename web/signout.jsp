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
         <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">
      
    </head>
    <body>
        <%
            
            session.setMaxInactiveInterval(0);
response.sendRedirect("index.jsp");
%>
    </body>
</html>
