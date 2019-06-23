<%-- 
    Document   : requesterbooks
    Created on : Jun 13, 2019, 11:28:06 AM
    Author     : mayank
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>requester books</title>
         <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">
  
    </head>
    <body>
        <h1>Requester Books</h1>
        <%   
        try{
            String bid= request.getParameter("bookid");
            session.setAttribute("currentbook", bid);
            Class.forName("com.mysql.jdbc.Driver");
            ServletContext sc= request.getServletContext();
           Connection conn = DriverManager.getConnection(sc.getInitParameter("dbrootpath")+"/"+sc.getInitParameter("dbname"),sc.getInitParameter("dbuser"),sc.getInitParameter("dbpass"));
           Statement stm = conn.createStatement();
             ResultSet rs = stm.executeQuery("select * from book where bookid=" + "\""+bid+"\"" );       
            
            if(rs.next()){
                
            String buyerid= rs.getString("bid");
     
              ResultSet rs2 = stm.executeQuery("select * from book where userid=" + "\""+buyerid+"\" and status=\"AVAILABLE\"" );
            
               
               if(rs2.next())
             { out.println("Select Any book from requster's books<br><br>"); 
               out.println("<table id=\"books\" name=\"books\">"); 
           
                    out.println("<tr >"); 
             out.print("<td>select</td> <td>&nbsp &nbsp</td> <td> bookname</td> <td>&nbsp &nbsp</td> <td> images</td><td>Status</td></tr>");
             out.print("<form id='form' action='accept' method='POST' >");
             int i=0;
              do
            {
                
            out.println("<tr>"); 
           
               String url= "requesterbookdetails.jsp"+"?bookid="+rs2.getString(1) ;
             
               if(i==0)
           {
               out.print("<td><input type='radio' name='select' value='"+ rs2.getString("bookid") +"' checked='checked'  ></td> <td></td>   <td><a href=\" "+url+ "\">"+rs2.getString("bookname")+"</td><td></td>");
               i++;
           }
               else
               {
                out.print("<td><input type='radio' name='select' value=\""+ rs2.getString("bookid") +"\"></td> <td></td>   <td><a href=\" "+url+ "\">"+rs2.getString("bookname")+"</td><td></td>");    
               
               }
            
               Blob blob = rs2.getBlob("i1");
             byte[ ] imgData = null ;
            imgData = blob.getBytes(1,(int)blob.length());
            
         request.setAttribute("encode",imgData);
           

            String encode1 = Base64.getEncoder().encodeToString(imgData);
          out.print("<td> <img src=\"data:image/jpeg;base64,"+ encode1 +" \" height=\"100\" width=\"100\" /></td>");
out.print("<td>"+rs2.getString("status")+"</td>");
out.print("</tr>");
   

}while(rs2.next());
             
             out.print("</table>");
             
             out.print("<textarea name='remark' form='form' placeholder='enter remark ' cols=40></textarea><br>");
             out.print("<button value='accept' name='button1' >accept</button>");
              out.print("<button value='deny' name='button1' >deny</button>");
             out.print("</form>");
                   
             }
             else
             {
                 out.println("Buyer has no novels to share!");
             }
            }
        }
          catch(Exception e)
            {
                out.print(e);
            }
            
          
            
              
              
              
            
            %>
    </body>
    
    
</html>
