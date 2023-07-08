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
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class AccountList {

    private ArrayList<Account> result = new ArrayList<>();
    Connection connection;

    public AccountList() {
        try {
            connection = DB.makeConnection();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Account> getAccountArrayList(String acc, String pass, String type) {
        ResultSet resultSet;
        String stm = "select * from account where userAcc = ? and userPassword = ? and type = ?";
        PreparedStatement p;
        try {
            p = connection.prepareStatement(stm);
            p.setString(1, acc);
            p.setString(2, pass);
            p.setString(3, type);
            resultSet = p.executeQuery();
            while (resultSet.next()) {
                result.add(new Account(resultSet.getString(2), resultSet.getString(3), resultSet.getString(1), resultSet.getString(4)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public String getAccountByID(String id) {
        ResultSet resultSet;
        String stm = "select * from account where user_id = ?";
        PreparedStatement p;
        try {
            p = connection.prepareStatement(stm);
            p.setString(1, id);
            resultSet = p.executeQuery();
            while (resultSet.next()) {
                return resultSet.getString(3);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "Nothing";
    }

    public String randomString() {
        int leftLimit = 97; // letter 'a'
        int rightLimit = 122; // letter 'z'
        int targetStringLength = 6;
        Random random = new Random();
        StringBuilder buffer = new StringBuilder(targetStringLength);
        for (int i = 0; i < targetStringLength; i++) {
            int randomLimitedInt = leftLimit + (int) (random.nextFloat() * (rightLimit - leftLimit + 1));
            buffer.append((char) randomLimitedInt);
        }
        String generatedString = buffer.toString();
        System.out.println(generatedString);
        return generatedString;
    }

    public void createUser(String account, String password, String type, String phone, String email, String id_branch, String fullName) throws SQLException {
        String id = randomString();
        String stmt = "insert into infor values" + " (?,?,'','',?,'','',?,?,'','')"
                + " insert into account values" + " ( ?,?,?,?)";

        PreparedStatement ps = connection.prepareStatement(stmt);
        ps.setString(1, id);
        ps.setNString(2, fullName);
        ps.setString(3, phone);
        ps.setString(4, email);
        ps.setString(5, id_branch);

        ps.setString(6, id);
        ps.setString(7, account);
        ps.setString(8, password);
        ps.setString(9, type);
        ps.executeUpdate();
    }

    public void createAdmin(String account, String password, String type) throws SQLException {
        String id = randomString();
        String stm = "insert into infor values ('" + id + "','','','','','','','','','')"
                + " insert into account values" + " ( ?,?,?,?)";

        PreparedStatement preparedStatement1 = connection.prepareStatement(stm);
        preparedStatement1.setString(2, account);
        preparedStatement1.setString(3, password);
        preparedStatement1.setString(4, type);
        preparedStatement1.setString(1, id);
        preparedStatement1.executeUpdate();
    }

    public void changePassword(String id, String newPass) {
        String stm = "update account set userPassword = ? where user_id = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(stm);
            pt.setString(1, newPass);
            pt.setString(2, id);
            pt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountList.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateUserImg(String id, String file) {
        String stm = "update infor set imgPath = ? where user_id = ?";
        try {
            PreparedStatement pt = connection.prepareStatement(stm);
            pt.setString(1, file);
            pt.setString(2, id);
            pt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountList.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int countSearch(String search) {
        ResultSet resultSet;
        String stm = "select count(*) from infor where userName like N?";
        PreparedStatement p;
        int a = 5;
        try {
            p = connection.prepareStatement(stm);
            p.setString(1, "%" + search + "%");
            resultSet = p.executeQuery();
            resultSet.next();
            a = resultSet.getInt(1);

        } catch (Exception e) {
        }
        return a;
    }

    public List<Infor> search(String txtSearch, int index, int size) {
        ResultSet resultSet;
        try {
            String q = "with x as(select ROW_NUMBER() over (order by user_id asc) as r,"
                    + "* from infor where userName like ?)\n"
                    + "select * from x where r between ?*10-9 and ?*10";
            Connection connection = DB.makeConnection();
            PreparedStatement statement = connection.prepareStatement(q);
            statement.setString(1, "%" + txtSearch + "%");
            statement.setInt(2, index);
            statement.setInt(3, index);
            resultSet = statement.executeQuery();
            List<Infor> list = new ArrayList<>();
            while (resultSet.next()) {
                Infor i = new Infor(resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getString(6),
                        resultSet.getString(7),
                        resultSet.getString(8),
                        resultSet.getString(9),
                        resultSet.getString(10),
                        resultSet.getString(11),
                        resultSet.getString(12));
                list.add(i);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public Account checkExist(String user) {
        ResultSet resultSet;
        String q = "select * from account\n"
                + "where [userAcc] = ?\n";
        try {
            PreparedStatement statement = connection.prepareStatement(q);
            statement.setString(1, user);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return new Account(resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(1),
                        resultSet.getString(4));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public static void main(String[] args) {
        AccountList a = new AccountList();
        System.out.println(a.countSearch("hie"));
    }
}
