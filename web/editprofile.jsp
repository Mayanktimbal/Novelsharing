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
         <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">
         
        <title>Profile</title>
    </head>
    
    
    
    <body>
        
          <ul>
        <li onclick="JavaScript:window.location='signout.jsp';"><a> Logout</a></li>
   <li ><a href="bookupload.jsp">share</a></li>
      <li ><a href="myorder.html">request</a></li>
        </ul>
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
                                                
  					</tbody>
 </table>

 </form>    
    </body>
</html>
