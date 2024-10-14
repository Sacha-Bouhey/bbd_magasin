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
import java.util.ArrayList;

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
    
    public ArrayList<Object[]> transformResult(ResultSet resultSet) {
        ArrayList<Object[]> results = new ArrayList<>();
        try {
            ResultSetMetaData metaData = resultSet.getMetaData();
            int compteColone = metaData.getColumnCount();

            // Add column names as the first row
            String[] nomColone = new String[compteColone];
            for (int i = 1; i <= compteColone; i++) {
                nomColone[i - 1] = metaData.getColumnName(i);
            }
            results.add(nomColone);

            // Add the rest of the rows
            while (resultSet.next()) {
                Object[] row = new Object[compteColone];
                for (int i = 1; i <= compteColone; i++) {
                    row[i - 1] = resultSet.getObject(i);
                }
                results.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }
    
    public ResultSet getResultSet() { return resultSet; }
    
    
}

