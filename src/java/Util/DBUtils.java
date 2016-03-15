/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Ictworx
 */
public class DBUtils {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost/isodb";

    public Connection getConnection()throws SQLException{
        String username = "root";
        String password = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection con = DriverManager.getConnection(DB_URL, username, password);
        if(con!= null){
            System.out.println("------Connection established-----------");
            return con;
        }
        else{
            System.out.println("Problem establishing connection");
            return null;
        }
    }
    
    public void closeConnection(Connection con)throws SQLException{
        
        if(con == null){
            System.out.println("Connection can not close,\nConnection is null");
        }
        else if(!con.isClosed()){
            con.close();
            System.out.println("Connection closed successfully");
        }
        else{
            System.out.println("We having problems with our system");
        }
    }
}