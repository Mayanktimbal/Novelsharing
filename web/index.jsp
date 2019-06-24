<%-- 
    Document   : homepage
    Created on : Jun 3, 2019, 2:58:33 PM
    Author     : ADMIN
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
          <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css"> 
                       <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bookshow.css"/> 




            <title>Homepage</title>

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
 
  <div class="main">
        
            
            
<div class="bs-region--top-center">
<div class="container">
<div class="row">
<div class="col-xs-12">
<div class="block-region-top-center"><section class="block-content-bundle-grid block block-block-content block-block-content4d2bc638-b8b9-4342-b54a-24abaad680ba clearfix">
<div class="block-header">
<h2 class="block-title">Browse genres</h2>

</div>
<div class="block-content">
<div class="row field field--name-field-grid-item field--type-entity-reference-revisions field--label-hidden field--items">
<div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 field--item"> <div class="paragraph paragraph--type--simple-grid-item paragraph--view-mode--default">
<div class="field field--name-field-image field--type-image field--label-hidden field--item"> <img src="bookgenre/love.webp" alt="" typeof="foaf:Image" class="img-responsive" width="465" height="295">
</div>
<div class="field field--name-field-link field--type-link field--label-hidden field--item"><div class="form-group"><span>ROMANCE</span>
<a href="categorybookshow.jsp?category=LOVE"></a></div>
</div>
</div>
</div>
<div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 field--item"> <div class="paragraph paragraph--type--simple-grid-item paragraph--view-mode--default">
<div class="field field--name-field-image field--type-image field--label-hidden field--item"> <img src="bookgenre/action&adventure.webp" alt="" typeof="foaf:Image" class="img-responsive" width="465" height="295">
</div>
<div class="field field--name-field-link field--type-link field--label-hidden field--item"><div class="form-group"><span>ACTION &amp; ADVENTURE</span>
<a href="categorybookshow.jsp?category=ACTION"></a></div>
</div>
</div>
</div>
<div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 field--item"> <div class="paragraph paragraph--type--simple-grid-item paragraph--view-mode--default">
<div class="field field--name-field-image field--type-image field--label-hidden field--item"> <img src="bookgenre/mystery.jpg" alt="" typeof="foaf:Image" class="img-responsive" width="465" height="295">
</div>
<div class="field field--name-field-link field--type-link field--label-hidden field--item"><div class="form-group"><span>MYSTERY &amp; THRILLER</span>
<a href="categorybookshow.jsp?category=mystery"></a></div>
</div>
</div>
</div>
<div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 field--item"> <div class="paragraph paragraph--type--simple-grid-item paragraph--view-mode--default">
<div class="field field--name-field-image field--type-image field--label-hidden field--item"> <img src="bookgenre/biography.jpg" alt="" typeof="foaf:Image" class="img-responsive" width="465" height="295">
</div>
<div class="field field--name-field-link field--type-link field--label-hidden field--item"><div class="form-group"><span>BIOGRAPHIES &amp; HISTORY</span>
<a href="categorybookshow.jsp?category=biography"></a></div>
</div>
</div>
</div>
<div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 field--item"> <div class="paragraph paragraph--type--simple-grid-item paragraph--view-mode--default">
<div class="field field--name-field-image field--type-image field--label-hidden field--item"> <img src="bookgenre/children.jpg" alt="" typeof="foaf:Image" class="img-responsive" width="465" height="295">
</div>
<div class="field field--name-field-link field--type-link field--label-hidden field--item"><div class="form-group"><span>CHILDREN’S</span>
<a href="categorybookshow.jsp?category=CHILDREN"></a></div>
</div>
</div>
</div>
<div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 field--item"> <div class="paragraph paragraph--type--simple-grid-item paragraph--view-mode--default">
<div class="field field--name-field-image field--type-image field--label-hidden field--item"> <img src="bookgenre/young.jpg" alt="" typeof="foaf:Image" class="img-responsive" width="465" height="295">
</div>
<div class="field field--name-field-link field--type-link field--label-hidden field--item"><div class="form-group"><span>YOUNG ADULT</span>
<a href="categorybookshow.jsp?category=ADULT"></a></div>
</div>
</div>
</div>
<div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 field--item"> <div class="paragraph paragraph--type--simple-grid-item paragraph--view-mode--default">
<div class="field field--name-field-image field--type-image field--label-hidden field--item"> <img src="bookgenre/fantasy.jpg" alt="" typeof="foaf:Image" class="img-responsive" width="465" height="295">
</div>
<div class="field field--name-field-link field--type-link field--label-hidden field--item"><div class="form-group"><span>FANTASY</span>
<a href="categorybookshow.jsp?category=FANTASY"></a></div>
</div>
</div>
</div>
<div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 field--item"> <div class="paragraph paragraph--type--simple-grid-item paragraph--view-mode--default">
<div class="field field--name-field-image field--type-image field--label-hidden field--item"> <img src="bookgenre/hitoricalfiction.jpg" alt="" typeof="foaf:Image" class="img-responsive" width="465" height="295">
</div>
<div class="field field--name-field-link field--type-link field--label-hidden field--item"><div class="form-group"><span>HISTORICAL FICTION</span>
<a href="categorybookshow.jsp?category=HISTORICAL FICTION"></a></div>
</div>
</div>
</div>
<div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 field--item"> <div class="paragraph paragraph--type--simple-grid-item paragraph--view-mode--default">
<div class="field field--name-field-image field--type-image field--label-hidden field--item"> <img src="bookgenre/horror.jpg" alt="" typeof="foaf:Image" class="img-responsive" width="465" height="295">
</div>
<div class="field field--name-field-link field--type-link field--label-hidden field--item"><div class="form-group"><span>HORROR</span>
<a href="categorybookshow.jsp?category=HORROR"></a></div>
</div>
</div>
</div>
<div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 field--item"> <div class="paragraph paragraph--type--simple-grid-item paragraph--view-mode--default">
<div class="field field--name-field-image field--type-image field--label-hidden field--item"> <img src="bookgenre/literary fiction.jpg" alt="" typeof="foaf:Image" class="img-responsive" width="465" height="295">
</div>
<div class="field field--name-field-link field--type-link field--label-hidden field--item"><div class="form-group"><span>LITERARY FICTION</span>
<a href="categorybookshow.jsp?category=LITERARY FICTION"></a></div>
</div>
</div>
</div>
<div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 field--item"> <div class="paragraph paragraph--type--simple-grid-item paragraph--view-mode--default">
<div class="field field--name-field-image field--type-image field--label-hidden field--item"> <img src="bookgenre/non fiction.jpg" alt="" typeof="foaf:Image" class="img-responsive" width="465" height="295">
</div>
<div class="field field--name-field-link field--type-link field--label-hidden field--item"><div class="form-group"><span>NON-FICTION</span>
<a href="categorybookshow.jsp?category=NON FICTION"></a></div>
</div>
</div>
</div>
<div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 field--item"> <div class="paragraph paragraph--type--simple-grid-item paragraph--view-mode--default">
<div class="field field--name-field-image field--type-image field--label-hidden field--item"> <img src="bookgenre/science fiction.jpg" alt="" typeof="foaf:Image" class="img-responsive" width="465" height="295">
</div>
<div class="field field--name-field-link field--type-link field--label-hidden field--item"><div class="form-group"><span>SCIENCE FICTION</span>
<a href="categorybookshow.jsp?category=SCIENCE FICTION"></a></div>
</div>
</div>
</div>
</div>
</div>
</section>
</div>
</div>
</div>
</div>
</div> 
<%@include file="footer.jsp" %>
</div>
  
    </body>
</html>
