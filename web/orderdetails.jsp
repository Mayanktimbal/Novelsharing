 <%-- 
    Document   : orderdetails
    Created on : Jun 17, 2019, 10:45:30 PM
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
        <title>Order Details</title>
    </head>
    <body>
        <h1>Your Order</h1>
        <%
            
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nosh","root","");
                 String orderid =request.getParameter("orderid");
                 Statement stm3 = conn.createStatement();
         ResultSet rs3= stm3.executeQuery("select * from `ordertable` where orderid='"+ orderid+"'");
 if(rs3.next())
 {
     
   //if order is running   
     
if(rs3.getString("orderstatus").equalsIgnoreCase("ACCEPTED"))   
{

//order is running and user is sharer
if(rs3.getString("sid").equalsIgnoreCase(session.getAttribute("userid").toString()))
{
     Statement stm4 = conn.createStatement();
 ResultSet buyerdetails= stm4.executeQuery("select * from user where userid='"+ rs3.getString("reqid")+"'");
     Statement stm5 = conn.createStatement();
 ResultSet buyerbookdetails= stm5.executeQuery("select * from book where bookid='"+ rs3.getString("reqbookid")+"'");
    Statement stm6 = conn.createStatement();
 ResultSet sharerbookdetails= stm6.executeQuery("select * from book where bookid='"+ rs3.getString("sbookid")+"'");
   

 //out.println("<h1>You are sharer<h1>");
 if(sharerbookdetails.next() && buyerdetails.next() )
 {
     out.print("Your "+sharerbookdetails.getString("bookname")+" in exchange with "+buyerdetails.getString("username")+"");
     out.print("<br>");
     out.print(" "+rs3.getString("odate")+" ");
    out.println("<br><br><br>");
 }
 //buyerdetails.first();
 
    if(buyerbookdetails.next())
    {
    out.print("<table> ");
     out.println("<tr> <td>");
    out.print("Book name:</td><td>"+buyerbookdetails.getString("bookname"));
    out.print("</td> </tr>");
    out.println("<tr> <td>");
    out.println("Author name: </td><td>"+buyerbookdetails.getString("author"));
    out.println("</td> </tr>"); 
    
      out.println("<tr><td>Genre: </td><td>"+buyerbookdetails.getString("genre"));
    out.println("</td> </tr>"); 
    
      out.println("<tr><td>Book condition: </td><td>"+buyerbookdetails.getString("bcon"));
    out.println("</td> </tr>"); 
      out.println("<tr><td> Requester Area: </td><td>"+buyerdetails.getString("area"));
    out.println("</td> </tr>"); 
      out.println("<tr><td>Mobile no: </td><td>"+buyerdetails.getString("mobile"));
    out.println("</td> </tr>"); 
     out.println("<tr><td>Email id: </td><td>"+buyerdetails.getString("email"));
    out.println("</td> </tr>"); 
     out.println("</table>");
    out.println("<br><a href='https://api.whatsapp.com/send?phone=91"+buyerdetails.getString("mobile")+"&text=Hey! I am sharer i need  help with "+buyerbookdetails.getString("bookname") +" '>contact requester </a>");
       out.println("<form action='completed' method='post' >"); 
     out.println("<input type='submit' value='completed'>Completed( means got your book back)</input>"); 
       out.println("<input type='hidden' name='orderid' value="+orderid+" ></input>"); 
            out.println("<input type='hidden' name='requesterbookid' value="+buyerbookdetails.getString("bookid")+" ></input>"); 
      out.println("<input type='hidden' name='sharerbookid' value="+sharerbookdetails.getString("bookid")+" ></input>"); 
            out.println("</form>"); 
    }

}
// order is running  and user is requester

else {
  //  out.println("u r requester");
        Statement stm7 = conn.createStatement();
 ResultSet sharerdetails = stm7.executeQuery("select * from user where userid='"+ rs3.getString("sid")+"'");
     Statement stm8 = conn.createStatement();
 ResultSet sharerbookdetails = stm8.executeQuery("select * from book where bookid='"+ rs3.getString("sbookid")+"'");
   Statement stm9 = conn.createStatement();
 ResultSet buyersbookdetails= stm9.executeQuery("select * from book where bookid='"+ rs3.getString("reqbookid")+"'");
   

 //out.println("<h1>You are sharer<h1>");
 if(buyersbookdetails.next() && sharerdetails.next())
 {
     out.print("Your "+buyersbookdetails.getString("bookname")+" in exchange with "+sharerdetails.getString("username")+"");
     out.print("<br>");
     out.print(" "+rs3.getString("odate")+" ");
    out.println("<br><br><br>");
 
 }
 
 
    if(sharerbookdetails.next())
    {
   out.print("<table> ");
     out.println("<tr> <td>");
    out.print("Book name:</td><td>"+sharerbookdetails.getString("bookname"));
    out.print("</td> </tr>");
    out.println("<tr> <td>");
    out.println("Author name: </td><td>"+sharerbookdetails.getString("author"));
    out.println("</td> </tr>"); 
    
      out.println("<tr><td>Genre: </td><td>"+sharerbookdetails.getString("genre"));
    out.println("</td> </tr>"); 
    
      out.println("<tr><td>Book condition: </td><td>"+sharerbookdetails.getString("bcon"));
    out.println("</td> </tr>"); 
      out.println("<tr><td> Requester Area: </td><td>"+sharerdetails.getString("area"));
    out.println("</td> </tr>"); 
      out.println("<tr><td>Mobile no: </td><td>"+sharerdetails.getString("mobile"));
    out.println("</td> </tr>"); 
     out.println("<tr><td>Email id: </td><td>"+sharerdetails.getString("email"));
    out.println("</td> </tr>"); 
     out.println("</table>");
    
    out.println(sharerbookdetails.getString("bookname")+"<br>");    
out.println("<a href='https://api.whatsapp.com/send?phone=91"+sharerdetails.getString("mobile")+"&text=Hey! I am sharer i need  help with "+sharerbookdetails.getString("bookname") +" '>contact requester </a>");

    }

}

}
 }

        %>
        
        
    </body>
</html>
