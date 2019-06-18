<%-- 
    Document   : profile
    Created on : Jun 12, 2019, 10:45:59 AM
    Author     : mayank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">
         
        <title>Profile</title>
    </head>

    
    
    <body>
        
             <%
                  
                if(session.getAttribute("userid") == null)
                  {
                      response.sendRedirect("login.jsp");
                  }

                  %>
        
        
        
          <ul>
        <li onclick="JavaScript:window.location='signout.jsp';"><a> Logout</a></li>
   <li ><a href="bookupload.jsp">share</a></li>
      <li ><a href="myorder.html">request</a></li>
        </ul>
         
                  
                    <%
                  
                    if(session.getAttribute("userid") != null)
                  {
                   
                  
                                                String mono = session.getAttribute("mobile").toString();
                                                 String email = session.getAttribute("email").toString();
                                                String uname = session.getAttribute("uname").toString();
                                                String area= session.getAttribute("area").toString();
                                                String address= session.getAttribute("address").toString();
                
                        out.print(" <table><thead><tr><td><h2>Profile details</h2></td></tr></thead><tbody id='table_body'>");
                         out.print("  <tr></tr><tr></tr><tr></tr> <tr><td>Username:</td>");                 
                              out.print( "<td>"+uname+"</td></tr><tr><td>Email:</td>");               
 out.print( "<td>"+email+"</td></tr><tr><td>Phone no.:</td>  <td>"+mono+"</td></tr> <tr><td>Area</td><td> ");  
     out.print( area+"</td></tr> <tr><td>Address</td><td>"+address+"</td></tr>");                
                  
                  
                  }
                    
                    %>
      
  							
                                                       
  						
                                                      
                                               
                                            
                                                 <tr>
  							
                                                     <td><button onclick="JavaScript:window.location='editprofile.jsp'" >Edit</button></td> 
  						</tr> 
                                                
  					</tbody>
 </table>

        
    </body>
</html>
