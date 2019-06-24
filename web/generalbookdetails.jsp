

<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
        <title>Book details</title>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css"> 
      <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bookshow.css"/> 
   
    </head>
    <body>
         <div class="backbutton"  >
        
             <input type="image" src="back.png" width="50" height="50" onClick="history.back()"> </input>
        </div>
        
                  <div class="row" style="margin-left:0px;">
 <div class="navbar">
     <div class="col-md-4 sm-12">
                      
                    <a href="index.jsp"> <img src="a.png" height="40" width="50"><big>Novel Sharing<big> </a>
                       </div>       
                
    
       
            
     <div  class="col-md-6 sm-12">                  
     <a href="myorder.jsp">Requested</a> 
    <a href="shared.jsp">Share </a>
    <a href="profile.jsp">profile</a>
    <a href="orders.jsp">My order </a>
                        <%
      if(session.getAttribute("userid") == null)
      {
          out.print("<a href='login.jsp'>Login </a>");
      
      }
else
      {
        out.print("<a href='signout.jsp'>Logout </a>");
      }
      %>
      
  
     </div><div class="col-md-2 sm-12">
 <%
            if(session.getAttribute("userid") == null)
            {
         out.println("<a>Hello Guest</a>");
             }
            
            else
            {
                 out.println("<a>Hello "+ session.getAttribute("uname") +"</a>");
            
            }
            %>    
      
     </div>     </div>          
 
    <%-- <li onclick="JavaScript:window.location='signout.jsp';"><a> Logout</a></li> --%>
  </div>
        
        <%
          String bid= request.getParameter("bookid");
         
           Class.forName("com.mysql.jdbc.Driver");
              ServletContext sc= request.getServletContext();
           Connection conn = DriverManager.getConnection(sc.getInitParameter("dbrootpath")+"/"+sc.getInitParameter("dbname"),sc.getInitParameter("dbuser"),sc.getInitParameter("dbpass"));
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
            
          out.print("&nbsp&nbsp&nbsp&nbsp</td>");
         
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
            
             out.print("</td></tr>");
                out.print("</table>");
                
            String bstatus=rs.getString("status").toString();
            if(session.getAttribute("uname")==null)
            {
             out.print(" <form method=\"POST\" action=\"login.jsp\"> ");
              out.print("<input type=\"hidden\" name=\"bid\" value=\""+bid+"\" /> ");
               out.print("For how many days you want? :");
         out.print("<input type=\"text\" name=\"rdays\" required=\"required\" /> ");
            out.print("<button type=\"submit\" style=\"height:50px;  \"  >Request Book</button></form>");
        
            }
            else{
                
             String sid= session.getAttribute("userid").toString();
            if((!rsid.equalsIgnoreCase(sid)) && (!bstatus.equalsIgnoreCase("WAITING")) && (!bstatus.equalsIgnoreCase("ONLOAN")))
            {
                 out.print(" <form method=\"POST\" action=\"request\"> ");
              out.print("<input type=\"hidden\" name=\"bid\" value=\""+bid+"\" /> ");
               out.print("For how many days you want? :");
         out.print("<input type=\"text\" name=\"rdays\" required=\"required\"  />");
            out.print("<button type=\"submit\" style=\"height:50px;  \" >Request Book</button></form>");
            }
            }
            
           
          }

            %>
    </body>
</html>
