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

/**
 *
 * @author mayank
 */
public class completed extends HttpServlet {

  
  
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String orderid= request.getParameter("orderid");
            PrintWriter out= response.getWriter();
          Class.forName("com.mysql.jdbc.Driver");
           ServletContext sc= request.getServletContext();
            Connection conn = DriverManager.getConnection(sc.getInitParameter("dbrootpath")+"/"+sc.getInitParameter("dbname"),sc.getInitParameter("dbuser"),sc.getInitParameter("dbpass"));
           
         Statement stm = conn.createStatement();
          int x= stm.executeUpdate(" update `ordertable` SET orderstatus = 'COMPLETED' , rdate= CURRENT_TIMESTAMP WHERE orderid = '"+orderid+"' ");
          String Query="update book set status='AVAILABLE' where bookid='"+request.getParameter("requesterbookid") +"' ";
       String Query2="update book set status='AVAILABLE' where  bookid='"+request.getParameter("sharerbookid") +"' ";
        int y = stm.executeUpdate(Query);
                      int z = stm.executeUpdate(Query2);
       
       if(x>0)
         {
             RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
             rd.include(request, response);
                out.print("<html>");
                    out.println("<script>");
                    out.println("alert('order completed successfully')");
                        out.println("</script>");
                    out.print("</html>");  
         }
         else
               {
             RequestDispatcher rd= request.getRequestDispatcher("orders.jsp");
             rd.include(request, response);
                out.print("<html>");
                    out.println("<script>");
                    out.println("alert('order uncompleted try again later')");
                        out.println("</script>");
                    out.print("</html>");  
         }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(completed.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(completed.class.getName()).log(Level.SEVERE, null, ex);
        }
      
      
      
    }


}
