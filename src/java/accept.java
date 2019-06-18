
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mayank
 */
@WebServlet(urlPatterns = {"/accept"})
public class accept extends HttpServlet {

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    try {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print("<html> <body bgcolor=cyan>" );
        HttpSession hs = request.getSession(false);
        String uid = hs.getAttribute("userid").toString();
        String orderid="";
        
        
        databaseconnection db = new  databaseconnection();
        Connection con=db.connection();
        Statement stmt=con.createStatement();
        String buyerbookid = request.getParameter("select");
     
       String reqid = "select userid from book where bookid=\'"+buyerbookid+"\'";
      ResultSet rs = stmt.executeQuery(reqid);
     String requestid="";
      while(rs.next())
      {requestid=rs.getString("userid");}
      
       String orderidta = "select * from ordertable where sid=\'"+uid+"\' and sbookid='"+ hs.getAttribute("currentbook").toString()+"' and orderstatus='REQUESTED' ";
            ResultSet ordertable = stmt.executeQuery(orderidta);
            
         if(ordertable.next())
         {
        orderid=ordertable.getString("orderid");
         
         }
            
 String orderquery=" update `ordertable` SET orderstatus ='ACCEPTED' , reqbookid='"+buyerbookid +"' WHERE orderid = '"+orderid+"' ";  
      String Query="update book set status='ONLOAN' where bookid='"+ hs.getAttribute("currentbook").toString()+"' ";
       String Query2="update book set status='ONLOAN' where  bookid='"+buyerbookid+"' ";
      
       
      
      if(request.getParameter("button1").equalsIgnoreCase("accept"))
      {
      int z=  stmt.executeUpdate(orderquery);
      int x=  stmt.executeUpdate(Query);
      int  y=  stmt.executeUpdate(Query2);
        if(x>0 && y>0 && z>0)
        {
              
                    out.println("<meta http-equiv='refresh' content='3;URL=index.jsp'>");
                    out.println("<p >Congratulation your book has shared</p>");
                    out.print("</html>");  
        }
        
      }
      else
      {
           String orderquery1=" update `ordertable` SET orderstatus ='DENIED' , sremark='"+request.getParameter("remark") +"' WHERE orderid = '"+orderid+"' ";  
      String Query1="update book set status='AVAILABLE' where bookid='"+ hs.getAttribute("currentbook").toString()+"' ";
      
         int x=  stmt.executeUpdate(orderquery1);
      int  y=  stmt.executeUpdate(Query1);
      if(x>0 && y>0)
      {
     out.println("<meta http-equiv='refresh' content='1;URL=index.jsp'>");
                    out.println("<p >Denied</p>");
                    out.print("</html>");  
      }
      
      
      
      }
      
      
      
    } catch (ClassNotFoundException | SQLException ex) {
        Logger.getLogger(accept.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

}
