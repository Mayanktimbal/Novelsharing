<%-- 
    Document   : categorybookshow
    Created on : Jun 8, 2019, 1:32:38 PM
    Author     : mayank
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
       
           
        <title>Books</title>
    </head>
    <body>
 <%
           Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nosh","root","");
           String category= request.getParameter("category");
           Statement stm = conn.createStatement();
           ResultSet rs= stm.executeQuery("select * from book where genre=\""+category +"\" and status='AVAILABLE'");
      
  int x=0;
                    if(rs.last())
                    {
                       x= rs.getRow();
                    }
                   
            if(x==0)
            {
                out.println("No one has shared any novel of this category yet!");
                if(session.getAttribute("uname")!= null)
                {
                out.println("<a href=\"bookupload.jsp\">Upload NOw,Click here!</a>");
                }
                else 
                {
                out.println("<a href=\"login.jsp\">Upload NOw,Click here!</a>");
                }
                
            }
            else{
            
                rs.first();
               out.println("<table id=\"books\" name=\"books\">"); 
           
               
        
            
             
             
       
            do
            {
          
             Blob blob = rs.getBlob("i1");
             byte[ ] imgData = null ;
             imgData = blob.getBytes(1,(int)blob.length());
            
         request.setAttribute("encode",imgData);
           

          String encode = Base64.getEncoder().encodeToString(imgData);
          
          out.println("<tr>"); 
          out.print("<td rowspan='3'> <img src=\"data:image/jpeg;base64,"+ encode +" \" height=\"100\" width=\"100\" /></td>");
             String url= "generalbookdetails.jsp"+"?bookid="+rs.getString("bookid") ;
 
          out.print("<td ><a href=\" "+ url + "\">"+rs.getString("bookname")+"</td><td> by "+rs.getString("author")+"</td>");
             out.print("</tr>");
             
                  out.print("   <tr><td>"+rs.getString("bdesc")+"</td></tr><tr></tr>");
          
   

}while(rs.next());
 
            
            }
        
        %>
        
       
    </body>
</html>
