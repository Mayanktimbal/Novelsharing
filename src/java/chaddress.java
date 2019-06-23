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
           
            Class.forName("com.mysql.jdbc.Driver");
           ServletContext sc= request.getServletContext();
           Connection con = DriverManager.getConnection(sc.getInitParameter("dbrootpath")+"/"+sc.getInitParameter("dbname"),sc.getInitParameter("dbuser"),sc.getInitParameter("dbpass"));
           
        
            Statement stmt=con.createStatement();
        
            int x = stmt.executeUpdate("update book set address=\'"+address +"\'  where userid =\'" +uid2+ "\'");
            if(x>0)
            { 
                RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
                      rd.include(request,response);
        
                       out.print("<html>");
                    out.println("<script>");
                    out.println("alert('Updated Successfully')");
                        out.println("</script>");
                    out.print("</html>");          
            }
            else{
                RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
                      rd.include(request,response);
        
                       out.print("<html>");
                    out.println("<script>");
                    out.println("alert('Something Went Wrong')");
                        out.println("</script>");
                    out.print("</html>");   
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(chaddress.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(chaddress.class.getName()).log(Level.SEVERE, null, ex);
        }
    }



}
