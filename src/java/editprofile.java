/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mayank
 */
public class editprofile extends HttpServlet {


 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            HttpSession session= request.getSession(false);
           String uid= session.getAttribute("userid").toString();
            
            Class.forName("com.mysql.jdbc.Driver");
           ServletContext sc= request.getServletContext();
          Connection conn = DriverManager.getConnection(sc.getInitParameter("dbrootpath")+"/"+sc.getInitParameter("dbname"),sc.getInitParameter("dbuser"),sc.getInitParameter("dbpass"));
           
        Statement stm = conn.createStatement();
            int x = stm.executeUpdate("update user set address=\'"+request.getParameter("address")+"\', area=\'"+request.getParameter("area")+"\'  where userid =\'" +uid+ "\'");
            int y=stm.executeUpdate("update book set  area=\'"+request.getParameter("area")+"\'  where userid =\'" +uid+ "\'");
            if(x>0 || y>0)
            { 
                 RequestDispatcher rd= request.getRequestDispatcher("profile.jsp");
                      rd.include(request,response);
         session.setAttribute("address",request.getParameter("address") );
             session.setAttribute("area",request.getParameter("area") );
                       out.print("<html>");
                    out.println("<script>");
                    out.println("alert('Updated Successfully')");
                        out.println("</script>");
                    out.print("</html>");
                
             
            }
            else{
         
                       RequestDispatcher rd= request.getRequestDispatcher("editprofile.jsp");
                      rd.include(request,response);
         session.setAttribute("address",request.getParameter("address") );
             session.setAttribute("area",request.getParameter("area") );
                       out.print("<html>");
                    out.println("<script>");
                    out.println("alert('Something went wrong')");
                        out.println("</script>");
                    out.print("</html>");
            }
            } catch (ClassNotFoundException ex) {
            Logger.getLogger(editprofile.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(editprofile.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }

    
}
