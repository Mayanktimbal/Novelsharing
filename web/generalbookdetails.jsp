

<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">
        <title>Book details</title>
                 <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">
   
    </head>
    <body>
        <%
          String bid= request.getParameter("bookid");
         
           Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nosh","root","");
           Statement stm = conn.createStatement();
           ResultSet rs = stm.executeQuery("select * from book where bookid=" + "\""+bid+"\"" );
          if(rs.next())
          {out.print("<h1>Book Details</h1>");
        
          String rsid= rs.getString("userid")  ;
          
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
             out.print("<td>Author:</td><td>"+rs.getString("author") +"</td>");
              out.print("</tr>");
                   out.print("<tr>");
             out.print("<td>Total Pages:</td><td>"+rs.getString("tpage") +"</td>");
              out.print("</tr>");
                out.print("<tr>");
             out.print("<td>genre:</td><td>"+rs.getString("genre") +"</td>");
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
                   out.print("<td>");
            out.print("Area:");
              out.print("</td>");
                
                 out.print("<td>");
            out.print(rs.getString("area"));
             out.print("</td>");
            out.print("</tr>");
            out.print("<tr>");
            out.print("<td>");
            String bstatus=rs.getString("status").toString();
            if(session.getAttribute("uname")==null)
            {
             out.print(" <form method=\"POST\" action=\"login.jsp\"> ");
              out.print("<input type=\"hidden\" name=\"bid\" value=\""+bid+"\" /> ");
               out.print("For how many days you want? :");
         out.print("<input type=\"text\" name=\"rdays\" /> ");
            out.print("<button type=\"submit\" style=\"height:50px; width:100px \" >Request Book</button></form>");
        
            }
            else{
                
             String sid= session.getAttribute("userid").toString();
            if((!rsid.equalsIgnoreCase(sid)) && (!bstatus.equalsIgnoreCase("WAITING")) && (!bstatus.equalsIgnoreCase("ONLOAN")))
            {
                 out.print(" <form method=\"POST\" action=\"request\"> ");
              out.print("<input type=\"hidden\" name=\"bid\" value=\""+bid+"\" /> ");
               out.print("For how many days you want? :");
         out.print("<input type=\"text\" name=\"rdays\" /> ");
            out.print("<button type=\"submit\" style=\"height:50px; width:100px \" >Request Book</button></form>");
            }
            }
            
            out.print("</td></tr>");
                out.print("</table>");
          }

            %>
    </body>
</html>
