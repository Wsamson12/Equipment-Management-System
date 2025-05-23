/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import ict.Bean.AccountBean;
import ict.db.AccountDB;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author plksa
 */
@WebServlet(name = "LoginTechnician", urlPatterns = {"/LoginTechnician"})
public class LoginTechnician extends HttpServlet {

    private AccountDB db;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ServletContext context = getServletContext();
        String dbUser = context.getInitParameter("username");
        String dbPassword = context.getInitParameter("password");
        String dbUrl = context.getInitParameter("url");
        db = new AccountDB(dbUrl, dbUser, dbPassword);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (!isAuthenticated(request) && !("authenticate".equals(action))) {
            doLogin(request, response);
            return;
        }
        if ("authenticate".equals(action)) {
            try {
                doAuthenticate(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(LoginUser.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if ("logout".equals(action)) {
            doLogout(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED);
        }
    }

    private void doAuthenticate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String username = request.getParameter("name");
        String password = request.getParameter("pw");

        try {
            boolean isValid = db.isValidUser(username, password);
            if (isValid) {
                HttpSession session = request.getSession(true);
                AccountBean bean = new AccountBean();
                bean.setUsername(username);

                // Assuming you have a method in AccountDB to get the role, or you modify isValidUser to also fetch the role
                String role = db.getUserRole(username); // You need to implement this method in AccountDB
                bean.setRole(role);
                
                String email = db.getUserEmail(username); 
                bean.setEmail(email);
                
                String dateOfBirth = db.getUserdate_of_birth(username);
                bean.setDateOfBirth(dateOfBirth);
                

                session.setAttribute("AccountBean", bean);
                response.sendRedirect("Technician/home.jsp"); // Use "Courier/home.jsp" for LoginCourier
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "Invalid username/password or role incorrect!");
                response.sendRedirect("loginError.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginUser.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", "Database error occurred.");
            request.getRequestDispatcher("loginError.jsp").forward(request, response);
        }
    }

    private boolean isAuthenticated(HttpServletRequest request) {
        boolean result = false;
        HttpSession session = request.getSession();
        if (session.getAttribute("AccountBean") != null) {
            result = true;
        }
        return result;
    }

    private void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String targetURL = "LoginUser.jsp";
        RequestDispatcher rd;
        rd = request.getRequestDispatcher(targetURL);
        rd.forward(request, response);
    }

    private void doLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("AccountBean");
            session.invalidate();
        }
        doLogin(request, response);
    }
}
