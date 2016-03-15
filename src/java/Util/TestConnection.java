/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Bulumko
 */
public class TestConnection {
    public static void main(String [] args) throws SQLException{
        DBUtils n = new DBUtils();
        Connection con = n.getConnection();
        n.closeConnection(con);
    }
}
