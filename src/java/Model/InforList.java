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
 * @author admin
 */
public class InforList {

    public Infor getInforArrayList(String acc, String pass) {
        ResultSet resultSet;
        String stm = "select * from infor where userAcc = ? and userPassword = ? and type = 'user'";
        PreparedStatement p;
        try {
            Connection connection = DB.makeConnection();

            p = connection.prepareStatement(stm);
            p.setString(1, acc);
            p.setString(2, pass);
            resultSet = p.executeQuery();
            while (resultSet.next()) {
                return new Infor(resultSet.getString(1), resultSet.getString(2),
                        resultSet.getString(3), resultSet.getString(4),
                        resultSet.getString(5), resultSet.getString(6),
                        resultSet.getString(7), resultSet.getString(8),
                        resultSet.getString(9), resultSet.getString(10),
                        resultSet.getString(11));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountList.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void update(String id, String name, String dob, String gender, String phone, String id_card, String address, String email, String maxDate, String id_branch) throws ClassNotFoundException {
        try (Connection conn = DB.makeConnection()) {
            String query = "UPDATE infor SET userName = ?, dob = ?, gender = ?, phone = ?, id_card = ?, address = ?, email = ?, id_branch= ?, maxDate = ? WHERE user_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, dob);
            ps.setString(3, gender);
            ps.setString(4, phone);
            ps.setString(5, id_card);
            ps.setString(6, address);
            ps.setString(7, email);
            ps.setString(8, id_branch);
            ps.setString(9, maxDate);
            ps.setString(10, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
    }

    public Infor getInforById(String id) throws ClassNotFoundException {
        try (Connection conn = DB.makeConnection()) {
            String query = "SELECT * FROM infor WHERE user_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return new Infor(rs.getString(1), rs.getString(2),
                    rs.getString(3), rs.getString(4),
                    rs.getString(5), rs.getString(6),
                    rs.getString(7), rs.getString(8),
                    rs.getString(9), rs.getString(10),
                    rs.getString(11));
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return null;
    }

    public ArrayList<Infor> getUsers() throws ClassNotFoundException {
        ArrayList<Infor> users = new ArrayList<>();
        PreparedStatement p;
        ResultSet resultSet;

        String stm = "select * from infor where user_id=ANY (select user_id from account where type='user')";

        try {
            Connection connection = DB.makeConnection();
            p = connection.prepareStatement(stm);
            resultSet = p.executeQuery();
            while (resultSet.next()) {
                users.add(new Infor(resultSet.getString(1), resultSet.getString(2)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }
//    public ArrayList<User> getUserInfor

    public ArrayList<Infor> getUserWithPage(String pageBegin) throws ClassNotFoundException {
        ArrayList<Infor> users = new ArrayList<>();
        String stm = "select * from infor where user_id=ANY (select user_id from account where type='user') Order by user_id Offset " + "? " + "rows fetch next 5 rows only";

        try {
            Connection connection = DB.makeConnection();
            PreparedStatement p1 = connection.prepareStatement(stm);
            p1.setInt(1, (Integer.parseInt(pageBegin) - 1) * 5);
            ResultSet resultSet = p1.executeQuery();
            while (resultSet.next()) {
                users.add(new Infor(resultSet.getString(1), resultSet.getString(2)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }

    public Infor getUserById(String id) throws ClassNotFoundException {
        ResultSet resultSet;

        String stm = "select * from infor where user_id ='" + id + "'";
        try {
            Connection connection = DB.makeConnection();
            PreparedStatement p1 = connection.prepareStatement(stm);
//            p1.setString(1,id);
            resultSet = p1.executeQuery();
            return new Infor(resultSet.getString(1), resultSet.getString(2),
                    resultSet.getString(3), resultSet.getString(4),
                    resultSet.getString(5), resultSet.getString(6),
                    resultSet.getString(7), resultSet.getString(8),
                    resultSet.getString(9), resultSet.getString(10),
                    resultSet.getString(11));

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteUser(String id) throws ClassNotFoundException {
        String stm3 = "DELETE FROM account WHERE user_id ='" + id + "'" + "DELETE FROM infor WHERE user_id ='" + id + "'";
        PreparedStatement p1;
        try {
            Connection connection = DB.makeConnection();
            p1 = connection.prepareStatement(stm3);
//            p1.setString(2, id);
            p1.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getMaxPage(int pageSize, int Listsize) {
        try {
            int size = Listsize / pageSize;
            if (Listsize % pageSize != 0) {
                size++;
            }
            if (size == 0) {
                return 1;
            }
            return size;
        } catch (Exception ex) {
            Logger.getLogger(InforList.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
