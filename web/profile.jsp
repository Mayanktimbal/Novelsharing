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
                    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css"> 
           <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bookshow.css"/> 
        <title>Profile</title>
    </head>

    
    
    <body> <div class="backbutton"  >
        
             <input type="image" src="back.png" width="50" height="50" onClick="history.back()"> </input>
        </div>
        
             <%
                  
                if(session.getAttribute("userid") == null)
                  {
                      response.sendRedirect("login.jsp");
                  }

                  %>
        
        
        
         <div class="row" style="margin-left:0px;">
 <div class="navbar">
     <div class="col-md-4 sm-12">
                      
                    <a href="index.jsp"> <img src="a.png" height="40" width="50"><big>Novel Sharing<big> </a>
                       </div>       
                
    
       
            
     <div  class="col-md-6 sm-12">                  
     <a href="myorder.jsp">Requested</a> 
  
   <a href="bookupload.jsp">share new</a>
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
