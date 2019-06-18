<%-- 
    Document   : bookupload
    Created on : Jun 4, 2019, 11:37:25 AM
    Author     : mayank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book details</title>
         <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">
  
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
                                                %>
                  
             
      <form id="form1" name="mainform" method="POST" action="bstore" enctype="multipart/form-data" >
<div  id="form">

<h5> Select Book image(First image should be front of book)<h5>
	Image1:<input type="file" id="file1" name="pic1" accept="image/*">
	<br><br>
 Image2:<input type="file" id="file2"  name="pic2" accept="image/*">
 <br>
 Note:both image should be less than 200kb and in jpg format

 <h5 style="display: inline-block;">Book Condition:</h5>

 <select id="menu" name="bcon">
  <option value="Good" selected="true">Good</option>
  <option value="Medium">Medium</option>
  <option value="Poor">Poor</option>
</select>
<br>


 <h5 style="display: inline-block;">Genre:</h5>
 <select id="genreselection" name="genre">
 	 <option disabled selected value> -- SELECT GENRE-- </option>
  <option value="KIDS" >KIDS</option>
  <option value="LOVE">LOVE</option>
  <option value="COMEDY">COMEDY</option>
  <option value="ADVENTURE">ADVENTURE</option>
   <option value="CRIME">CRIME</option>
   <option value="MYSTRY">MYSTRY</option>
</select>
 
 <h5 style="display: inline-block;">LANGUAGE:</h5>
  <select id="langselection" name="lang">
 	 <option disabled selected value> -- SELECT LANGUAGE-- </option>
  <option value="ENGLISH" >ENGLISH</option>
  <option value="HINDI">HINDI</option>
  <option value="GUJARATI">GUJARATI</option>
  
</select>
 

<br>



<br>

 <h5 style="display: inline-block;">Bookname:</h5>
 <input type="text" NAME="name" id="bookname" placeholder=" Enter Your bookname..." width="30"  required="required" pattern="[A-Za-z0-9]{1,20}" ><br><br> 

 
   <h5 style="display: inline-block;">Book description:</h5>

 <textarea form="form1" name="bdesc"  placeholder=" Entet book description..."  required="required" ></textarea>
 <br><br> 
 
   <h5 style="display: inline-block;">Author name:</h5>
    <input type="text" NAME="Author" id="Author" placeholder=" Enter book Author name" width="30"  required="required" ><br><br>

    
      <h5 style="display: inline-block;">Publisher:</h5>
 <input type="text" NAME="publisher" id="publisher" placeholder="Publisher" width="30"  required="required" ><br><br>

 <h5 style="display: inline-block;">Edition year:</h5>
 <input type="text" NAME="Edition" id="Edition" placeholder="Ex: Second edition 2019" width="30"  required="required" ><br><br>

 
   <h5 style="display: inline-block;">Total pages:</h5>
   <input type="text" NAME="totalpage" id="totalpage" placeholder="Total pages" width="30"  required="required" ><br><br> 
   
<table>
  					<thead>
  						<tr>
  							<td>User details</td>
  						</tr>
  					</thead>

  					<tbody id="table_body">
                                          
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
  							<td>Area</td>
                                                        <td><%=area%></td> 
  						</tr> 
                                                  <tr>
  							<td>Address</td>
                                                        <td><%=address%></td> 
  						</tr> 
                                                
  					</tbody>
 </table>

 

</div>
                                                <button type="submit" onclick="" >Submit</button>
</form>      
                  
                  
                  
                  
    </body>
</html>
