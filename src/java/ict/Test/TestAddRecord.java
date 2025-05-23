/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.Test;

import ict.db.AccountDB;

/**
 *
 * @author a1
 */
public class TestAddRecord {

    public static void main(String[] arg) {
        String url = "jdbc:mysql://localhost:3306/system_db";
        String username = "root";
        String password = "";
        AccountDB AccountDb = new AccountDB(url, username, password);
        AccountDb.createAccountTable();

        String name = "John Doe";
        String email = "johndoe@example.com";
        String pw = "jo22@123";
        String role = "Technician(Administrator)";
        String day = "01";
        String month = "01";
        String year = "2000";
        String gender = "Male";

        boolean isSuccess = AccountDb.addAccount(name, email, pw, role, day, month, year, gender);
        if (isSuccess) {
            System.out.println("Record added successfully");
        } else {
            System.out.println("Failed to add record");
        }

    }
}
