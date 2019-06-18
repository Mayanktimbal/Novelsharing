import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class chaddress extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            HttpSession hs = request.getSession(false);
            String uid2 = hs.getAttribute("userid").toString();
            String address = request.getParameter("address");
           
            databaseconnection db=new  databaseconnection();
            Connection con=db.connection();
            Statement stmt=con.createStatement();
        
            int x = stmt.executeUpdate("update book set address=\'"+address +"\'  where userid =\'" +uid2+ "\'");
            if(x>0)
            {  out.print("<h1>update Successfully</h1>");
              out.println("<meta http-equiv='refresh' content='1;URL=homepage.jsp'>");
                        
            }
            else
                 out.print("<h1> Something wrong</h1>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(chaddress.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(chaddress.class.getName()).log(Level.SEVERE, null, ex);
        }
    }



}
