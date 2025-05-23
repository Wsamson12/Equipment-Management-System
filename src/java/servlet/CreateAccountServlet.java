/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import ict.db.AccountDB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author plksa
 */
@WebServlet(urlPatterns = {"/CreateAccount"})
public class CreateAccountServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("pw");
        String role = request.getParameter("role");
        String day = request.getParameter("day");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        String gender = request.getParameter("gender");

        // Database connection details
        String url = "jdbc:mysql://localhost:3306/system_db";
        String username = "root";
        String dbPassword = "";

        // Create AccountDB object and insert account
        AccountDB accountDb = new AccountDB(url, username, dbPassword);
        boolean success = accountDb.addAccount(name, email, password, role, day, month, year, gender);

        // Redirect or forward based on success
        if (success) {
            response.sendRedirect("CreateAccount.jsp"); // Redirect to a success page
        } else {
            request.setAttribute("error", "Unable to create account.");
            request.getRequestDispatcher("error.jsp").forward(request, response); // Forward to an error page
        }
    }

}
