
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mayank
 */
public class request extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out= response.getWriter();
            HttpSession session= request.getSession(false);
            String sbookid=(String) request.getParameter("bid");
            String requesterid=(String) session.getAttribute("userid");
             String orderid = UUID.randomUUID().toString();
            
            
            String shareridq = "select userid from book where bookid=\'"+sbookid+"\'";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nosh","root","");
            Statement stmt = conn.createStatement();
            
            
            ResultSet rs = stmt.executeQuery(shareridq);
            String sharerid="";
            while(rs.next())
            {sharerid=rs.getString("userid");}
            
            
            
            try {
           
                int x = stmt.executeUpdate("update book set status='WAITING' , bid='"+ requesterid +"'   where bookid =  '" +sbookid+"'");
              
                  String ordertablequery = "insert into ordertable(orderid,sid,reqid,sbookid,odate,rdays) values (\""+orderid+"\",\""+sharerid+"\",\""+requesterid+"\",\""+ sbookid+"\",CURRENT_TIMESTAMP,\" "+ request.getParameter("rdays") + "\" )"; 
       
      
                
                
                int y = stmt.executeUpdate(ordertablequery);
                   
                        
                        if(x>0 && y>0)
                        {
                            out.print("<h1>requested Successfully</h1>");
                            out.println("<meta http-equiv='refresh' content='1;URL=homepage.jsp'>");
                        }
                        else
                            out.print("<h1> Something went wrong</h1>");
            
            } catch (SQLException ex) {
                Logger.getLogger(request.class.getName()).log(Level.SEVERE, null, ex);
            } 
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(request.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(request.class.getName()).log(Level.SEVERE, null, ex);
        }
 
          
        
      
    }

   
}
