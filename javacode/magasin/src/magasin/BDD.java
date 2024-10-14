package magasin;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    
    public Object transformResult(ResultSet resultSet) {
        try {
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();
            
            while (resultSet.next()) {
                Object[] rowData = new Object[columnCount];
                
                // Récupération des valeurs de chaque colonne
                for (int i = 1; i <= columnCount; i++) {   
                    rowData[i - 1] = resultSet.getObject(i);
                } return rowData;
            } 
        } catch (SQLException ex) {
            Logger.getLogger(BDDmagasin.class.getName()).log(Level.SEVERE, null, ex);
        } return null;
    }
    
    public ResultSet getResultSet() { return resultSet; }
    
    
}

