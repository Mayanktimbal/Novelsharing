/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;

public class signup1 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
                PrintWriter out = response.getWriter();
             
                try {
                    
                    
                    
                    String email = request.getParameter("email");
                    String pass = request.getParameter("pass");
                    String mono = request.getParameter("number");
                    String username= request.getParameter("uname");
                    String uid= UUID.randomUUID().toString();
                    String area= request.getParameter("area");
                    String address= request.getParameter("address") ;
                    
                     
Class.forName("com.mysql.jdbc.Driver");
Connection  conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","");
String databaseq= "CREATE DATABASE IF NOT EXISTS nosh";
Statement stm1= conn1.createStatement();
stm1.execute(databaseq);
String areatableq= "CREATE TABLE IF NOT EXISTS nosh.area (pincode VARCHAR(500) NOT NULL,areaname VARCHAR(500) NOT NULL,PRIMARY KEY(pincode)) ";          
stm1.execute(areatableq);
String usertableq= "CREATE TABLE IF NOT EXISTS nosh.user (username VARCHAR(100) NOT NULL,email VARCHAR(500) NOT NULL,password VARCHAR(200) NOT NULL,userid VARCHAR(500) NOT NULL,mobile VARCHAR(200) NOT NULL,area VARCHAR(200) NOT NULL,address  VARCHAR(500) NOT NULL,UNIQUE(email),PRIMARY KEY(userid)) ";
stm1.execute(usertableq);
String booktableq= "CREATE TABLE IF NOT EXISTS nosh.book (  bookid VARCHAR(200) NOT NULL,  bookname VARCHAR(200) NULL,  author VARCHAR(200) NULL,  tpage VARCHAR(200) NULL, genre VARCHAR(200) NULL, publisher VARCHAR(200) NULL,  bcon VARCHAR(200) NULL, userid VARCHAR(200) NOT NULL, username VARCHAR(200) NOT NULL, eyear VARCHAR(200) NULL,  email VARCHAR(200) NOT NULL, mobileno VARCHAR(200) NULL, i1 BLOB NOT NULL,  i2 BLOB NOT NULL,status VARCHAR(500) DEFAULT\'AVAILABLE\',bid VARCHAR(500) NULL,bdesc VARCHAR(500) NOT NULL,language VARCHAR(500) NOT NULL,area VARCHAR(200) NULL ,PRIMARY KEY (bookid)); ";
stm1.execute(booktableq); 
 String ordertableq= "CREATE TABLE IF NOT EXISTS nosh.ordertable (  orderid VARCHAR(200) NOT NULL,  sid VARCHAR(200) NULL,  reqid VARCHAR(200) NULL,  sbookid VARCHAR(200) NULL, reqbookid VARCHAR(200) NULL, odate TIMESTAMP NULL,rdate TIMESTAMP NULL,rdays VARCHAR(200) NULL,sremark VARCHAR(1000) NULL,orderstatus VARCHAR(200) NOT NULL DEFAULT 'REQUESTED' ,PRIMARY KEY (orderid)); ";
  stm1.execute(ordertableq);                
               
Connection  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nosh","root","");
 String Query= "insert into user(username,email,password,userid,mobile,area,address) values(?,?,?,?,?,?,?)";
                   
                      PreparedStatement stm = conn.prepareStatement(Query);
                    stm.setString(1,username);
                    stm.setString(2,email);
                    stm.setString(3,pass);
                  stm.setString(4,uid);
                    stm.setString(5,mono);
                    stm.setString(6, area);
                     stm.setString(7, address);
                    int x=stm.executeUpdate();
                    if(x<=0){
                        
           RequestDispatcher rd= request.getRequestDispatcher("signup.jsp");
                      rd.include(request,response);
                      
                       out.print("<html>");
                    out.println("<script>");
                    out.println("alert('Registration failed')");
                        out.println("</script>");
                    out.print("</html>");
                    
                    
                    
                    }
                    else
                    {
                      RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
                      rd.include(request,response);
                      
                       out.print("<html>");
                    out.println("<script>");
                    out.println("alert('Registration successfull!')");
                        out.println("</script>");
                    out.print("</html>");
                    
                    }
                   
                    
                
            } catch (ClassNotFoundException ex) {
           
        } catch (SQLException ex) {
                   RequestDispatcher rd= request.getRequestDispatcher("signup.jsp");
                      rd.include(request,response);
                      
                       out.print("<html>");
                    out.println("<script>");
                    out.println("alert('Registration failed')");
                        out.println("</script>");
                    out.print("</html>");
        }
            }




  

    


}
