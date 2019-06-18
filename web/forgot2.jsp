
<%@page import="java.sql.*"%>
<%@page import ="javax.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">
        <title>forgot2 Page</title>
    </head>
    <%
       String email2 = request.getParameter("forgot");
       Class.forName("com.mysql.jdbc.Driver");
       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nosh","root","");
       Statement stm = conn.createStatement();
       ResultSet rs = stm.executeQuery("select * from user where email=\'"+email2+"\'");
       
       
       if(!rs.next()){
            out.println("email is not yet registered");
            }
            else
            {
                 out.println("we have sent an email on your registred email id");
            }
            
      %> 
    
</html>
