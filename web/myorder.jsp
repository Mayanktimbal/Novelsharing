<%-- 
    Document   : myorder
    Created on : Jun 9, 2019, 10:44:00 PM
    Author     : RAM
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">
        <title>requested Page</title>
    </head>
    <body>
        <h1> <center>  Novel Sharing </center></h1>
        <%
            
               if(session.getAttribute("userid") == null)
                  {
                      response.sendRedirect("login.jsp");
                  }
            
            
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nosh","root","");
                 Statement stm = conn.createStatement();
                 ResultSet rs= stm.executeQuery("select * from book where bid=\""+ session.getAttribute("userid")+"\" and status='WAITING' ");
      
  int x=0;
                    if(rs.last())
                    {
                       x= rs.getRow();
                    }
                   
            if(x==0)
            {
                out.println("You haven't requested any novel yet!");
                out.println("<a href=\"homepage.jsp\">Request Now,Click here!</a>");
            }
            else{
            
                rs.first();
               out.println("<table id=\"books\" name=\"books\">"); 
           
               
                    out.println("<tr >"); 
             out.print("<td> bookname</td> <td> images</td><td>Status</td></tr>");
            
             
             
       
            do
            {
           out.println("<tr>"); 
           
               String url= "generalbookdetails.jsp"+"?bookid="+rs.getString(1) ;
             out.print("<td><a href=\" "+url+ "\">"+rs.getString(2)+"</td>");
             Blob blob = rs.getBlob("i1");
             byte[ ] imgData = null ;
            imgData = blob.getBytes(1,(int)blob.length());
            
         request.setAttribute("encode",imgData);
           

            String encode = Base64.getEncoder().encodeToString(imgData);
          out.print("<td> <img src=\"data:image/jpeg;base64,"+ encode +" \" height=\"100\" width=\"100\" /></td>");

          if(rs.getString("status").equalsIgnoreCase("WAITING"))
          { out.print("<td>WAITING FOR SHARER CONFIRMATION</td>");}
          else
          {
  out.print("<td> SHARER HAS DENIED YOUR REQUEST,FOR MORE INFO GO TO MYORDERS</td>");
          }
out.print("</tr>");
   

}while(rs.next());
 
         
            
            }
        
        %>
        
            <script type="text/javascript" src="${pageContext.request.contextPath}/match.js"> </script>
        
        
        
        
        
    </body>
</html>
