
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author mayank
 */
public class databaseconnection {
    Connection conn;
    Connection connection () throws ClassNotFoundException, SQLException
    {
      Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nosh","root","");
       
       return conn;
    }
    
}
