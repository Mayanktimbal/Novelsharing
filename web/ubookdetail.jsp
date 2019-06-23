 <%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%-- 
    Document   : ubookdetail
    Created on : Jun 6, 2019, 3:26:25 PM
    Author     : mayank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Details</title>
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">
   
    </head>
    <body>
        <% 
            try{
            
            String bid= request.getParameter("bookid");
            Class.forName("com.mysql.jdbc.Driver");
             ServletContext sc= request.getServletContext();
          Connection conn = DriverManager.getConnection(sc.getInitParameter("dbrootpath")+"/"+sc.getInitParameter("dbname"),sc.getInitParameter("dbuser"),sc.getInitParameter("dbpass"));
              Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("select * from book where bookid=" + "\""+bid+"\"" );
      
         
              if(rs.next())
          {
                        
                   
String sid= session.getAttribute("userid").toString();
String rsid= rs.getString("userid")  ;
if(!rsid.equalsIgnoreCase(sid))
        {
            out.println("Sorry its not your book! please login");
            response.sendRedirect("homepage.jsp");
        }
              
      String status= rs.getString("status");
     
              
              
              out.print("<h1>Book Details</h1>");
              out.print("<table name=\"bookdetail\" >");
               out.print("<tr>");
               out.print("<td>");
              Blob blob = rs.getBlob("i1");
             byte[ ] imgData = null ;
            imgData = blob.getBytes(1,(int)blob.length());
            String img1 = Base64.getEncoder().encodeToString(imgData);
          out.print(" <img src=\"data:image/jpeg;base64,"+ img1 +" \" height=\"200\" width=\"200\" />");
            
          out.print("</td>");
          out.print("<td>");
             Blob blob2 = rs.getBlob("i2");
             byte[ ] imgData2 = null ;
            imgData2 = blob2.getBytes(1,(int)blob2.length());
            String img2 = Base64.getEncoder().encodeToString(imgData2);
     out.print("<img src=\"data:image/jpeg;base64,"+ img2 +" \" height=\"200\" width=\"200\" />");
              out.print("</tr>");
              
              out.print("<tr>");
             out.print("<td>Bookname:</td><td>"+rs.getString("bookname") +"</td>");
              out.print("</tr>");
               out.print("<tr>");
             out.print("<td>genre:</td><td>"+rs.getString("genre") +"</td>");
              out.print("</tr>");
              out.print("<tr>");
             out.print("<td>Language:</td><td>"+rs.getString("language") +"</td>");
              out.print("</tr>");
               out.print("<tr>");
             out.print("<td>Author:</td><td>"+rs.getString("author") +"</td>");
              out.print("</tr>");
              out.print("<tr>");
             out.print("<td>Description:</td><td>"+rs.getString("bdesc") +"</td>");
              out.print("</tr>");
              out.print("<tr>");
             out.print("<td>Total Pages:</td><td>"+rs.getString("tpage") +"</td>");
              out.print("</tr>");
               
                out.print("<tr>");
             out.print("<td>Publisher:</td><td>"+rs.getString("publisher") +"</td>");
              out.print("</tr>");
                out.print("<tr>");
             out.print("<td>Book Condition:</td><td>"+rs.getString("bcon") +"</td>");
              out.print("</tr>");
             out.print("<tr>");
             out.print("<td>Edition year</td><td>"+rs.getString("eyear") +"</td>");
             out.print("</tr>");
                out.print("<tr>");
             out.print("<td>Area</td><td>"+rs.getString("area") +"</td>");
             out.print("</tr>");
                
            
                out.print("</table>");
          
              }
            }
              catch(Exception e)
                      {
                      out.print(e);
                      }
      
      
      
           

            %>
    </body>
</html>
