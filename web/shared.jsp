<%-- 
    Document   : shared
    Created on : Jun 6, 2019, 10:52:04 AM
    Author     : mayank
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="javax.swing.JFrame"%>
<%@page import="javax.swing.JLabel"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.awt.Image"%>
<%@page import="java.awt.Toolkit"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.InputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shared Novels</title>
        <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">
   
    </head>
    <body>
        
        
           <%
                if(session.getAttribute("userid") == null)
                  {
                      response.sendRedirect("login.jsp");
                  }

                  %>
                  
                  <ul>        
    <li><a href="signout.jsp">Logout </a></li>
    
   <li ><a href="bookupload.jsp">share new</a>
      
 
</ul>        
                  
       <h1>Your Sharing</h1>           
        
        <%
                 Class.forName("com.mysql.jdbc.Driver");
                  ServletContext sc= request.getServletContext();
           Connection conn = DriverManager.getConnection(sc.getInitParameter("dbrootpath")+"/"+sc.getInitParameter("dbname"),sc.getInitParameter("dbuser"),sc.getInitParameter("dbpass"));
             Statement stm = conn.createStatement();
                 ResultSet rs= stm.executeQuery("select * from book where userid=\""+ session.getAttribute("userid")+"\" ");
    
  int x=0;
                    if(rs.last())
                    {
                       x= rs.getRow();
                    }
                   
            if(x==0)
            {
                out.println("You haven't shared any novel yet!");
                out.println("<a href=\"bookupload.jsp\">Upload NOw,Click here!</a>");
            }
            else{
            
                rs.first();
               out.println("<table id=\"books\" name=\"books\">"); 
           
               
                    out.println("<tr >"); 
             out.print("<td> bookname</td> <td> images</td><td>Status</td><td></td></tr>");
            
             
             
       
            do
            {
           out.println("<tr>"); 
           
               String url= "ubookdetail.jsp"+"?bookid="+rs.getString("bookid") ;
             out.print("<td><a href=\" "+url+ "\">"+rs.getString("bookname")+"</td>");
             
               String url2= "requesterbooks.jsp"+"?bookid="+rs.getString("bookid") ;
                
               
             Blob blob = rs.getBlob("i1");
             byte[ ] imgData = null ;
            imgData = blob.getBytes(1,(int)blob.length());
            
         request.setAttribute("encode",imgData);
           

            String encode = Base64.getEncoder().encodeToString(imgData);
          out.print("<td> <img src=\"data:image/jpeg;base64,"+ encode +" \" height=\"100\" width=\"100\" /></td>");
out.print("<td>"+rs.getString("status")+"</td>");
if(rs.getString("status").toString().equalsIgnoreCase( "WAITING"))
{
       Statement stm2 = conn.createStatement();
    ResultSet rs2= stm2.executeQuery("select * from  ordertable where sid= '"+ session.getAttribute("userid") + "' and sbookid= '"+rs.getString("bookid")+"' and orderstatus='REQUESTED' ");
              
 if(  rs2.last())
           {

           
out.println("<td>Requester need it for "+rs2.getString("rdays")+" days</td>");
           }
out.println("<td><button onclick=\"JavaScript:window.location=' "+url2+" ';\" type='submit' > click to accept</button></td>");
     

}
out.print("</tr>");
   

}while(rs.next());
 
         
            
            }
        
        %>
        
            <script type="text/javascript" src="${pageContext.request.contextPath}/match.js"> </script>
        
    </body>
</html>
