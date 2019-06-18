<%-- 
    Document   : forgot
    Created on : Jun 1, 2019, 3:37:18 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">
        <title>forgot Page</title>
    </head>
    <body>
        <form action="forgot2.jsp" method="post">
            <br><br><br>
           &nbsp &nbsp Enter your registered Emailid:  <input type="text" name="forgot"> <br><br><br>
            <button input type="submit" style="width:100px; height:50px; align-content:center "> submit </button>
        </form>   
    </body>
</html>
