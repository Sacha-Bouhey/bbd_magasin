package magasin;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BDD {

    private Connection connection = null;
    private Statement statement = null;
    private ResultSet resultSet = null;
        
    public boolean Connexion(String url, String username, String password) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        try {
            connection = DriverManager.getConnection(url, username, password);
            statement = connection.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } 
        
        return true;
    }
    
    public boolean RequeteSQL(String sql) {
        try {                     
            resultSet = statement.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } 
        
        return true;
    }
    
    public ResultSet getResultSet() { return resultSet; }
}

