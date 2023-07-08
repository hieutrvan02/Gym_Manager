/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LAM
 */
public class BranchList {
    ArrayList<Branch> result = new ArrayList<>();

    public BranchList() {
    }

    public ArrayList<Branch> getResult() throws ClassNotFoundException {
        try(Connection conn = DB.makeConnection()) {
            String query = "SELECT * FROM branch";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result.add(new Branch(rs.getString(1), rs.getString(2), 
                        rs.getString(3), rs.getString(4).substring(0,5), rs.getString(5).substring(0,5)));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(BranchList.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public void setResult(ArrayList<Branch> result) {
        this.result = result;
    }
}
