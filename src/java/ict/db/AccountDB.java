package ict.db;

import ict.Bean.AccountBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class AccountDB {

    private String url = "";
    private String username = "";
    private String password = "";
    private ArrayList customer;

    public AccountDB(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public Connection getConnection() throws SQLException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Database connection success"); // For debugging
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return DriverManager.getConnection(url, username, password);
    }

    public void createAccountTable() {
        Statement stmnt = null;
        Connection cnnct = null;
        try {
            cnnct = getConnection();
            stmnt = cnnct.createStatement();
            String sql = "CREATE TABLE IF NOT EXISTS account ("
                    + "id int(10) NOT NULL AUTO_INCREMENT,"
                    + "name varchar(50) NOT NULL,"
                    + "email varchar(255) NOT NULL,"
                    + "password varchar(20) NOT NULL,"
                    + "role varchar(255) NOT NULL,"
                    + "date_of_birth date NOT NULL,"
                    + "gender varchar(10) NOT NULL,"
                    + "PRIMARY KEY (id)"
                    + ")";
            stmnt.execute(sql);
            stmnt.close();
            cnnct.close();

        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public boolean addAccount(String name, String email, String password, String role, String day, String month, String year, String gender) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String date_of_birth = year + "-" + month + "-" + day; // Combine day, month, and year into a single date string
            String preQueryStatement = "INSERT INTO account (name, email, password, role, date_of_birth, gender) VALUES (?, ?, ?, ?, ?, ?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, name);
            pStmnt.setString(2, email);
            pStmnt.setString(3, password);
            pStmnt.setString(4, role);
            pStmnt.setString(5, date_of_birth); // Use the combined date string here
            pStmnt.setString(6, gender);
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }

    public boolean isValidUser(String user, String pwd) throws SQLException, IOException {
        boolean isValid = false;
        try (Connection cnnct = getConnection(); PreparedStatement pStmnt = cnnct.prepareStatement("SELECT * FROM account WHERE name=? and password=?")) {
            pStmnt.setString(1, user);
            pStmnt.setString(2, pwd);

            try (ResultSet rs = pStmnt.executeQuery()) {
                if (rs.next()) {
                    // Check if the user's role is 'user'
                    String role = rs.getString("role");
                    isValid = "user".equals(role) || "staff".equals(role);
                }
            }
        }
        return isValid;
    }

    public boolean isValidCourier(String user, String pwd) throws SQLException, IOException {
        boolean isValid = false;
        try (Connection cnnct = getConnection(); PreparedStatement pStmnt = cnnct.prepareStatement("SELECT * FROM account WHERE name=? and password=?")) {
            pStmnt.setString(1, user);
            pStmnt.setString(2, pwd);

            try (ResultSet rs = pStmnt.executeQuery()) {
                if (rs.next()) {
                    // Check if the user's role is 'user'
                    String role = rs.getString("role");
                    isValid = "courier".equals(role);
                }
            }
        }
        return isValid;
    }

    public boolean isValidTechnician(String user, String pwd) throws SQLException, IOException {
        boolean isValid = false;
        try (Connection cnnct = getConnection(); PreparedStatement pStmnt = cnnct.prepareStatement("SELECT * FROM account WHERE name=? and password=?")) {
            pStmnt.setString(1, user);
            pStmnt.setString(2, pwd);

            try (ResultSet rs = pStmnt.executeQuery()) {
                if (rs.next()) {
                    // Check if the user's role is 'user'
                    String role = rs.getString("role");
                    isValid = "technician".equals(role) || "Technician(Administrator)".equals(role);
                }
            }
        }
        return isValid;
    }

    public String getUserRole(String username) throws SQLException, IOException {
        String role = null;
        try (Connection cnnct = getConnection();
        PreparedStatement pStmnt = cnnct.prepareStatement("SELECT role FROM account WHERE name=?")) {
            pStmnt.setString(1, username);
            ResultSet rs = pStmnt.executeQuery();
            if (rs.next()) {
                role = rs.getString("role");
            }
        }
        return role;
    }
    public String getUserEmail(String username) throws SQLException, IOException {
        String email = null;
        try (Connection cnnct = getConnection();
        PreparedStatement pStmnt = cnnct.prepareStatement("SELECT email FROM account WHERE name=?")) {
            pStmnt.setString(1, username);
            ResultSet rs = pStmnt.executeQuery();
            if (rs.next()) {
                email = rs.getString("email");
            }
        }
        return email;
    }
    public String getUserdate_of_birth(String username) throws SQLException, IOException {
        String date_of_birth = null;
        try (Connection cnnct = getConnection();
        PreparedStatement pStmnt = cnnct.prepareStatement("SELECT date_of_birth FROM account WHERE name=?")) {
            pStmnt.setString(1, username);
            ResultSet rs = pStmnt.executeQuery();
            if (rs.next()) {
                date_of_birth = rs.getString("date_of_birth");
            }
        }
        return date_of_birth;
    }
   

}
