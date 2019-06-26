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
                   
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css"> 
           <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bookshow.css"/> 
              
            
        <title>Books</title>
    </head>
    <body>  <div class="backbutton"  >
        
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
  
           
        
 
        
 <%
           Class.forName("com.mysql.jdbc.Driver");
           ServletContext sc= request.getServletContext();
           Connection conn = DriverManager.getConnection(sc.getInitParameter("dbrootpath")+"/"+sc.getInitParameter("dbname"),sc.getInitParameter("dbuser"),sc.getInitParameter("dbpass"));
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
                out.println("<a href=\"bookupload.jsp\">Upload NOw,Click here!</a><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>");
                }
                else 
                {
                out.println("<a href=\"login.jsp\">Upload NOw,Click here!</a><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>");
                }
                
            }
            else{
            
                rs.first();
               out.println(" <table id=\"books\" name=\"books\" >"); 
           
               
        
            
             
             
       
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
         out.print("<td rowspan='3'>&nbsp&nbsp&nbsp</td>");
          out.print("<td ><a href=\" "+ url + "\">"+rs.getString("bookname")+"</a> by "+rs.getString("author")+"</td>");
             out.print("</tr>");
             
                  out.print("   <tr><td>"+rs.getString("bdesc")+"</td></tr><tr></tr>");
          
     out.print("  </table>");
          

}while(rs.next());
 
            
            }
        
        %>
         
        <br><br><br>  <br><br><br>  <br><br><br>  <br><br><br>
         <br><br><br> <br><br><br>
        
          <%@include file="footer.jsp" %>  
          </div>
              </body>
                  

</html>
