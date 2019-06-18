

<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>orders Page</title>
       <link rel="stylesheet"  href="${pageContext.request.contextPath}/css/homepage.css"/>
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Navigation.css">  
    </head>
    <body>
        <h1> Your Orders </h1>
        <h2> Running Order </h2>
        
     <%
            
                  
                if(session.getAttribute("userid") == null)
                  {
                      response.sendRedirect("login.jsp");
                  }

               
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nosh","root","");
                 Statement stm = conn.createStatement();
                 
                 
                 //for requested by user and showing sharer id
       out.print( "<h5> requested orders </h5>");
        ResultSet rrequested= stm.executeQuery("select * from `ordertable` where reqid=\""+ session.getAttribute("userid")+"\" and orderstatus='ACCEPTED' ");    
       if(!rrequested.next())
              out.println("<p> currently no order from requester side</p>");
       else{
             rrequested.first();
       
        
        do
            {
                Statement stm2 = conn.createStatement();
                ResultSet rs1 = stm2.executeQuery("select * from book where bookid=\""+ rrequested.getString("sbookid") +"\" ");
      
                if(rs1.next())
                {
                
               out.println("<table id=\"books\" name=\"books\">"); 
               out.println("<tr >"); 
               out.print("<td> bookname</td> <td> images</td><td>Status</td></tr>");
     
          
           out.println("<tr>"); 
           
               String url= "orderdetails.jsp"+"?orderid="+rrequested.getString("orderid") ;
             out.print("<td><a href=\" "+url+ "\">"+rs1.getString(2)+"</td>");
             
             Blob blob = rs1.getBlob("i1");
             byte[ ] imgData = null ;
            imgData = blob.getBytes(1,(int)blob.length());
            
         request.setAttribute("encode",imgData);
           

            String encode = Base64.getEncoder().encodeToString(imgData);
          out.print("<td> <img src=\"data:image/jpeg;base64,"+ encode +" \" height=\"100\" width=\"100\" /></td>");
out.print("<td>"+rs1.getString("status")+"</td>");

out.print("</tr>");
out.print("</table>");
   
                
}   
                
                rs1.close();
       }
        while(rrequested.next());
       }
        

        //for shared by user and showing buyer book id
        out.print( "<h5> shared orders </h5>");
        Statement stm3 = conn.createStatement();
        ResultSet rshared= stm3.executeQuery("select * from `ordertable` where sid=\""+ session.getAttribute("userid")+"\" and orderstatus='ACCEPTED' ");    
        if(!rshared.next())   
               out.print("<p>currently no order from your side </p>");
        else{
            rshared.first();
         
        do
            {
                Statement stm4 = conn.createStatement();
                ResultSet rs4 = stm4.executeQuery("select * from book where bookid=\""+ rshared.getString("reqbookid") +"\" ");
      
                if(rs4.next())
                {
                
               out.println("<table id=\"books\" name=\"books\">"); 
               out.println("<tr >"); 
               out.print("<td> bookname</td> <td> images</td><td>Status</td></tr>");
    
          
           out.println("<tr>"); 
           
               String url= "orderdetails.jsp"+"?orderid="+rshared.getString("orderid") ;
             out.print("<td><a href=\" "+url+ "\">"+rs4.getString(2)+"</td>");
             
             Blob blob = rs4.getBlob("i1");
             byte[ ] imgData = null ;
            imgData = blob.getBytes(1,(int)blob.length());
            
         request.setAttribute("encode",imgData);
           

            String encode = Base64.getEncoder().encodeToString(imgData);
          out.print("<td> <img src=\"data:image/jpeg;base64,"+ encode +" \" height=\"100\" width=\"100\" /></td>");
out.print("<td>"+rs4.getString("status")+"</td>");

out.print("</tr>");
 out.print("</table>");  
           
}     
        }
          while(rshared.next());
        }
        
    
        // for completed orders
      out.print( "<h2> Completed orders </h2>");
 //for requested by user and showing sharer book
 out.print( "<h5> requested orders </h5>");
            Statement stm5 = conn.createStatement();
        ResultSet crequested= stm5.executeQuery("select * from `ordertable` where reqid=\""+ session.getAttribute("userid")+"\" and orderstatus='COMPLETED' ");    
       if(!crequested.next())    
            out.print("<p>currently no compted order</p>");
       else{ 
           crequested.first();
       
       do
            {
     Statement stm6 = conn.createStatement();
                ResultSet rs6 = stm6.executeQuery("select * from book where bookid=\""+ crequested.getString("sbookid") +"\" ");
      
                if(rs6.next())
                {
                
               out.println("<table id=\"books\" name=\"books\">"); 
               out.println("<tr >"); 
               out.print("<td> bookname</td> <td> images</td><td>Status</td></tr>");
    
          
           out.println("<tr>"); 
           
               String url= "orderdetails.jsp"+"?orderid="+crequested.getString("orderid") ;
             out.print("<td><a href=\" "+url+ "\">"+rs6.getString(2)+"</td>");
             
             Blob blob = rs6.getBlob("i1");
             byte[ ] imgData = null ;
            imgData = blob.getBytes(1,(int)blob.length());
            
         request.setAttribute("encode",imgData);
           

            String encode = Base64.getEncoder().encodeToString(imgData);
          out.print("<td> <img src=\"data:image/jpeg;base64,"+ encode +" \" height=\"100\" width=\"100\" /></td>");
out.print("<td>"+rs6.getString("status")+"</td>");

out.print("</tr>");
   
     out.print("</table>");      
}     
        }
       while(crequested.next());
       }
        

 //for shared by user and showing buyer bookid
 out.print( "<h5> shared orders </h5>");
         Statement stm7 = conn.createStatement();
        ResultSet cshared= stm7.executeQuery("select * from `ordertable` where sid=\""+ session.getAttribute("userid")+"\" and orderstatus='COMPLETED' ");    
       if(!cshared.next())
           out.print("<p>currently no comleted order from your side </p>");
       else{
          cshared.first();
        do
            {
     Statement stm8 = conn.createStatement();
      ResultSet rs8 = stm8.executeQuery("select * from book where bookid=\""+ cshared.getString("reqbookid") +"\" ");
      
                if(rs8.next())
                {
                
               out.println("<table id=\"books\" name=\"books\">"); 
               out.println("<tr >"); 
               out.print("<td> bookname</td> <td> images</td><td>Status</td></tr>");
    
          
           out.println("<tr>"); 
           
               String url= "orderdetails.jsp"+"?orderid="+cshared.getString("orderid") ;
             out.print("<td><a href=\" "+url+ "\">"+rs8.getString(2)+"</td>");
             
             Blob blob = rs8.getBlob("i1");
             byte[ ] imgData = null ;
            imgData = blob.getBytes(1,(int)blob.length());
            
         request.setAttribute("encode",imgData);
           

            String encode = Base64.getEncoder().encodeToString(imgData);
          out.print("<td> <img src=\"data:image/jpeg;base64,"+ encode +" \" height=\"100\" width=\"100\" /></td>");
out.print("<td>"+rs8.getString("status")+"</td>");

out.print("</tr>");
   
   out.print("</table>");        
}     
        }
        while(cshared.next());
       }



        %>
       
    </body>
</html>
