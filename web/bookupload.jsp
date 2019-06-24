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
                        
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css"> 
           <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/bookshow.css"/> 
           
           
                 <link href="${pageContext.request.contextPath}/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
  
    <link href="${pageContext.request.contextPath}/vendor/select2/select2.min.css" rel="stylesheet" media="all">
  
   
    <link href="${pageContext.request.contextPath}/css/signup.css" rel="stylesheet" media="all">
       
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
                                                %>
                                                
                                                
                                                
                                                
                     <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w750">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Book Upload</h2>
                    <form id="form1" name="mainform" method="POST" action="bstore" enctype="multipart/form-data"  >
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Select Book image(First image should be front of book)</label>
                                    <input class="input--style-4" type="file" id="file1" name="pic1" accept="image/*" required="required">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    
                                </div>
                            </div>
                        </div>
                        
                          <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                               <label class="label"> Image2:</label>
                                    <input class="input--style-4"  type="file" id="file2"  name="pic2" accept="image/*" required="required">
                                <label class="label">Note:both image should be less than 200kb and in jpg format</label>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                        
                        
                        
                    
                        
                          <div class="row row-space">
                               <div class="col-2">
                         <div class="input-group">
                            <label class="label">Book Condition</label>
                           
                         
                                <select id="menu" name="bcon" required="required" >
  <option value="Good" selected="true">Good</option>
  <option value="Medium">Medium</option>
  <option value="Poor">Poor</option>

                                </select>
                        
                            </div>
                         </div>
                          </div>
                        
                         <br>
                               
                                       <div class="row row-space">
                                             <div class="col-2">
                                            <div class="input-group">
                             
                            <label class="label">Genre</label>
        
                                <select id="genreselection" name="genre" required="required" >
  <option disabled selected value> -- SELECT GENRE-- </option>
  <option value="LOVE" >ROMANCE</option>
  <option value="ACTION">ACTION & ADVENTURE</option>
  <option value="BIOGRAPHY">BIOGRAPHIES & HISTORY</option>
  <option value="CHILDREN">CHILDREN'S</option>
   <option value="ADULT">YOUNG ADULT</option>
   <option value="MYSTERY">MYSTERY & THRILLER</option>
      <option value="FANTASY">FANTASY</option>
       <option value="HISTORICAL FICTION">HISTORICAL FICTION</option>
        <option value="HORROR">HORROR</option>
         <option value="LITERARY FICTION">LITERARY FICTION</option>
          <option value="NON FICTION">NON-FICTION</option>
           <option value="SCIENCE FICTION">SCIENCE FICTION</option>
                                </select>
                                <div class="select-dropdown"></div>
                            
                                </div>
                                       </div>   </div>
                            <br>
                           
                         <div class="row row-space">
                               <div class="col-2">
                            <div class="input-group">
                            <label class="label">Language</label>
                            
                             <div class="select-dropdown">
                                <select id="langselection" name="lang" required="required" >
  <option disabled selected value> -- SELECT LANGUAGE-- </option>
  <option value="ENGLISH" >ENGLISH</option>
  <option value="HINDI">HINDI</option>
  <option value="GUJARATI">GUJARATI</option>
                                </select>
                            </div>
                           
                         </div>
                            </div>
                         </div>
                            
                            <br>
                            <div class="row row-space">
                              <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Book name</label>
                                    <input class="input--style-4" type="text" NAME="name" id="bookname" placeholder=" Enter Your bookname..." width="50"  required="required" > 
                                </div>
                            </div>
                            </div>
                            
                            <br>
                            
                              <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Book description</label>
                                  
                                     <textarea class="input--style-4" form="form1" name="bdesc"  placeholder=" Entet book description..."  required="required"></textarea>
                                </div>
                            </div>
                        
                          </div> 
                            <br>
                            
                            
                          <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Author name</label>
                                    <input class="input--style-4" type="text" NAME="Author" id="Author" placeholder=" Enter book Author name" width="30"  required="required">
                                </div>
                            </div>
                        
                          </div>
                          <br>
                          
                          
                                 <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Publisher</label>
                                    <input class="input--style-4" type="text" NAME="publisher" id="publisher" placeholder="Publisher" width="30"  required="required">
                                </div>
                            </div>
                        
                          </div>
                          
                          
                           <br>
                          
                          
                                 <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Edition Year</label>
                                    <input class="input--style-4" type="text" NAME="Edition" id="Edition" placeholder="Ex: Second edition 2019" width="30"  required="required">
                                </div>
                            </div>
                        
                          </div>
                          
                           <br>
                           
                           <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Total Pages</label>
                                    <input class="input--style-4" type="text" NAME="totalpage" id="totalpage" placeholder="Total pages" width="30"  required="required"  pattern="[0-9]{1,9}">
                                </div>
                            </div>
                        
                          </div>
                          
                           <br>
                                 <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                   
                                 <label class="label">  User Details:</label>
                                     <label class="label">Username: <%=uname%></label>
                                      <label class="label">Email: <%=email%></label>
                                       <label class="label">Phone no.: <%=mono%></label>
                                       <label class="label">  Area:  <%=area%></label>
                                       <label class="label">Address :<%=address%></label>
                                  
                              
                            </div>
                            </div>
                         </div>
                        
                          
                        

                       
                        <br>
                          <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                   <button class="btn btn--radius-2 btn--blue" type="submit">Submit</button>
                                  
                                </div>
                            </div>
                        
                          </div>
                        
                             
                                
                                
                       
                    </form>
                </div>
            </div>
        </div>
    </div>   
                                     
          
                  
                
    </body>
</html>
