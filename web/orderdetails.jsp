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
   

 out.println("<h1>You are sharer<h1>");
 if(sharerbookdetails.next())
 {
     out.print("Your "+sharerbookdetails.getString("bookname")+" in exchange with ");
 
 }
 
 
    if(buyerdetails.next() && buyerbookdetails.next())
    {
    out.println(buyerdetails.getString("mobile")+"<br>");
    out.println(buyerbookdetails.getString("bookname")+"<br>");    
    out.println("<a href='https://api.whatsapp.com/send?phone=91"+buyerdetails.getString("mobile")+"&text=Hey! I am sharer i need  help with "+buyerbookdetails.getString("bookname") +" '>contact requester </a>");
    }

}
// order is running  and user is requester

else {
    out.println("u r requester");
        Statement stm7 = conn.createStatement();
 ResultSet sharerdetails = stm7.executeQuery("select * from user where userid='"+ rs3.getString("sid")+"'");
     Statement stm8 = conn.createStatement();
 ResultSet sharerbookdetails = stm8.executeQuery("select * from book where bookid='"+ rs3.getString("sid")+"'");
   Statement stm9 = conn.createStatement();
 ResultSet buyersbookdetails= stm9.executeQuery("select * from book where bookid='"+ rs3.getString("reqbookid")+"'");
   

 //out.println("<h1>You are sharer<h1>");
 if(buyersbookdetails.next())
 {
     out.print("Your "+buyersbookdetails.getString("bookname")+" in exchange with ");
 
 }
 
 
    if(sharerdetails.next() && sharerbookdetails.next())
    {
   
    out.println(sharerbookdetails.getString("bookname")+"<br>");    
out.println("<a href='https://api.whatsapp.com/send?phone=91"+sharerdetails.getString("mobile")+"&text=Hey! I am sharer i need  help with "+sharerbookdetails.getString("bookname") +" '>contact requester </a>");
}

}

}
 }

        %>
        
        
    </body>
</html>
