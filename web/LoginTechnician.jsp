<%-- 
    Document   : LoginTechnician
    Created on : Apr 5, 2024, 11:46:05 AM
    Author     : a1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Login.css"/>
    </head>
    <body>
        <div class="container">
            <div class="message signup">
                <div class="btn-wrapper">
                    <a href="LoginUser.jsp"><button class="button" id="Loginbtn1">User Login</button></a>
                    <a href="LoginTechnician.jsp"><button class="button" id="Loginbtn2">Technician Login</button></a>
                    <a href="LoginCourier.jsp"><button class="button" id="Loginbtn3">Courier Login</button></a>
                </div>
            </div>
            <div class="form form--signup">
                <div class="form--heading">Technician Login</div>
                <form autocomplete="off" action="LoginTechnician" method="post">
                    <input type="hidden" name="action" value="authenticate">
                    <input type="text" placeholder="Name" name="name">
<!--                <input type="email" placeholder="Email" name="email">-->
                    <input type="password" placeholder="Password" name="pw">
                    <button class="button" id="login">Login</button>
                </form>
            </div>
        </div>
    </body>
</html>
