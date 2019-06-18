/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import static java.awt.image.BufferedImage.TYPE_INT_RGB;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.imageio.*;






public class bstore extends HttpServlet {

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
     PrintWriter out= response.getWriter();
        
         try {
               
        Random randomno = new Random();
        
        byte[] bid = new byte[30];
        randomno.nextBytes(bid);
       
             HttpSession session=request.getSession(false);
            
             
            Part p1=request.getPart("pic1");
             Part p2=request.getPart("pic2");
      BufferedImage im1= ImageIO.read(p1.getInputStream());
      BufferedImage im2= ImageIO.read(p2.getInputStream()); 
       /* BufferedImage resizedImage1= new BufferedImage(50,50,TYPE_INT_RGB);
        Graphics2D g= resizedImage1.createGraphics();
        g.drawImage(im1, 0, 0,50,50,null);
        g.dispose();
          BufferedImage resizedImage2= new BufferedImage(50,50,TYPE_INT_RGB);
        Graphics2D g2= resizedImage2.createGraphics();
        g2.drawImage(im2, 0, 0,50,50,null);
        g2.dispose();
*/
        

             String bname=request.getParameter("name");
             String author=request.getParameter("Author");
             String publisher=request.getParameter("publisher");
             String eyear=request.getParameter("Edition");
             String tpage=request.getParameter("totalpage");
             String genre=request.getParameter("genre");
             String bcon=request.getParameter("bcon");
            String lang= request.getParameter("lang");
             String bdesc= request.getParameter("bdesc");
             String mobileno = session.getAttribute("mobile").toString();
             String email = session.getAttribute("email").toString();
             String username = session.getAttribute("uname").toString();
             String userid=session.getAttribute("userid").toString();
             String area = session.getAttribute("area").toString();
              
             databaseconnection db= new databaseconnection();
             Connection conn=db.connection();
             
             String Query= "insert into book(bookid,bookname,author,tpage,genre,publisher,bcon,userid,username,eyear,email,mobileno,i1,i2,language,bdesc,area) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
             
                            
             PreparedStatement stm = conn.prepareStatement(Query);
             
             stm.setString(1,bid.toString());
             stm.setString(2,bname);
             stm.setString(3,author);
             stm.setString(4,tpage);
             stm.setString(5,genre);
             stm.setString(6,publisher);
             stm.setString(7,bcon);
             stm.setString(8,userid);
             stm.setString(9,username);
            
             stm.setString(10,eyear);
             stm.setString(11,email);
             stm.setString(12,mobileno);
        
    InputStream is1= p1.getInputStream();
         InputStream is2= p2.getInputStream();
             stm.setBinaryStream(13, is1);   
              stm.setBinaryStream(14, is2); 
             stm.setString(15, lang);
             stm.setString(16, bdesc);
            stm.setString(17, area);
              
           
             int x = stm.executeUpdate();
            
             if(x==0)
             {   RequestDispatcher rd= request.getRequestDispatcher("bookupload.jsp");
                      rd.include(request,response);
                      
                       out.print("<html>");
                    out.println("<script>");
                    out.println("alert('Book Upload failed.')");
                        out.println("</script>");
                    out.print("</html>");}
             
             else
             {
               
                  RequestDispatcher rd= request.getRequestDispatcher("shared.jsp");
                      rd.include(request,response);
                      
                       out.print("<html>");
                    out.println("<script>");
                    out.println("alert('Book Uploaded Successfully.')");
                        out.println("</script>");
                    out.print("</html>");
                    
             }
         } catch (SQLException ex) {
                  } 
         catch (ClassNotFoundException ex) { 
            Logger.getLogger(bstore.class.getName()).log(Level.SEVERE, null, ex);
        } 
         
         
        }
   }    
                    



                       
