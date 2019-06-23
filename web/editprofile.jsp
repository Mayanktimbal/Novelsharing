<%-- 
    Document   : editprofile
    Created on : Jun 12, 2019, 11:05:08 AM
    Author     : mayank
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css"> 
           <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bookshow.css"/> 
         
        <title>Profile</title>
    </head>
    
    
    
    <body>
        
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
                  if(session.getAttribute("userid") == null)
                  {
                      response.sendRedirect("index.jsp");
                     
                  }

                  %>
                  
                    <%
                   
                                                String mono = session.getAttribute("mobile").toString();
                                                 String email = session.getAttribute("email").toString();
                                                String uname = session.getAttribute("uname").toString();
                                                String area= session.getAttribute("area").toString();
                                                String address= session.getAttribute("address").toString();
                                                 Class.forName("com.mysql.jdbc.Driver");
           ServletContext sc= request.getServletContext();
          
          Connection conn = DriverManager.getConnection(sc.getInitParameter("dbrootpath")+"/"+sc.getInitParameter("dbname"),sc.getInitParameter("dbuser"),sc.getInitParameter("dbpass"));
           
       Statement stm = conn.createStatement();
       ResultSet rs = stm.executeQuery("select * from area");
                                                %>
       <table >
  					<thead>
  						<tr>
                                                    <td><h2>Profile details</h2></td>
  						</tr>
  					</thead>

  					<tbody id="table_body">
                                            <tr></tr><tr></tr><tr></tr>
                                               <tr>
  							<td>Username:</td>
                                                        <td><%=uname%></td>
  						</tr>  
                                                   <tr>
  							<td>Email:</td>
                                                        <td><%=email%></td>
  						</tr>  
                                                  <tr>
  							<td>Phone no.:</td>
                                                        <td><%=mono%></td>
  						</tr> 
                                                 <tr>
                                        <form id="form2" action="editprofile" method="POST">
  							<td>Select area:</h3></td><td><select class="row" id="areamenu" name="area">

 <%
    
       
while(rs.next())
{
 out.print("<option value=\""+rs.getString(2)+"\" >"+ rs.getString(2)+"</option>");
}
     
     %>
     
     </select>
             </td>
      
         <tr>
  						</tr> 
                                                  <tr>
  							<td>Address</td>
                                                        <td><textarea id="address" name="address" form="form2" ><%=address%></textarea></td> 
  						</tr> 
                                                 <tr>
  							
                                                     <td><button type="submit" >Edit</button></td> 
  						</tr> 
                                                   </form>  
  					</tbody>
                                     
 </table>

   
    </body>
</html>
