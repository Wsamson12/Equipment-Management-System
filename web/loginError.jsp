<%-- 
    Document   : loginError.jsp
    Created on : 2024年4月8日, 下午6:17:24
    Author     : plksa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Error</title>
    </head>
    <body>
        <p>${sessionScope.errorMessage}</p>
        <p><a href="LoginUser.jsp">Login again</a></p>
    </body>
</html>
