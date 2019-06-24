<%-- 
    Document   : admin
    Created on : Jun 23, 2019, 2:52:46 PM
    Author     : mayank
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <% if(!session.getAttribute("uname").toString().equalsIgnoreCase("admin"))
        {
             
           response.sendRedirect("login.jsp");
        }
            
            
            
            Class.forName("com.mysql.jdbc.Driver");
                  ServletContext sc= request.getServletContext();
           Connection conn = DriverManager.getConnection(sc.getInitParameter("dbrootpath")+"/"+sc.getInitParameter("dbname"),sc.getInitParameter("dbuser"),sc.getInitParameter("dbpass"));
             Statement stm = conn.createStatement();
                 ResultSet rs= stm.executeQuery("select * from ordertable order by odate DESC ");
                    out.print("<table>");
                    out.print("<tr><td>sharer</td><td>requester</td> <td>sharerbookid </td><td>reqbookid</td><td>order date</td><td>return daye</td><td>Sharer remark</td><td>Order Status</td></tr>");
   

   while(rs.next())
    {
            Statement stm2 = conn.createStatement();
    ResultSet rs2 = stm2.executeQuery( "select * from user where userid=\'"+rs.getString("sid")+"\' ");        
    while(rs2.next())
     {
    out.print("<tr><td>"+rs2.getString("username")+"<td>");
   // out.print("<tr><td>"+rs2.getString("username")+"<td></tr>");
    }
    
     Statement stm3 = conn.createStatement();
    ResultSet rs3 = stm3.executeQuery( "select * from user where userid=\'"+rs.getString("reqid")+"\' ");        
    while(rs3.next())
     {
    out.print("<td>"+rs3.getString("username")+"<td>");
   // out.print("<tr><td>"+rs2.getString("username")+"<td></tr>");
    }
    
    Statement stm4 = conn.createStatement();
    ResultSet rs4 = stm4.executeQuery( "select * from book where bookid=\'"+rs.getString("sbookid")+"\' ");        
    while(rs4.next())
     {
    out.print("<td>"+rs4.getString("bookname")+"<td>");
  
    }
    
     Statement stm5 = conn.createStatement();
    ResultSet rs5 = stm5.executeQuery( "select * from book where bookid=\'"+rs.getString("reqbookid")+"\' ");        
  if(rs5.next())
  {
        out.print("<td>"+rs5.getString("bookname")+"<td>");
  }
else
  {
       out.print("<td>"+"not Selected"+"<td>");
  }
    
    
    
        out.print("<td>"+rs.getString("odate")+"<td>");
        
    String s= rs.getString("rdate");
    
 if(s == null)      
  {
        out.print("<td>"+"Not returned"+"<td>");
  }
else
  {
       out.print("<td>"+rs.getString("rdate")+"<td>");
  }

        

        out.print("<td>"+rs.getString("rdays")+"<td>");
        
        if( rs.getString("sremark") == null)      
  {
        out.print("<td>"+"Not REMARKED"+"<td>");
  }
else
  {
       out.print("<td>"+rs.getString("sremark")+"<td>");
  }
         
         
         out.print("<td>"+rs.getString("orderstatus")+"<td></tr>");
 
    }
        %>
      
    </body>
</html>
