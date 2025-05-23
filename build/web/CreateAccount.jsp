<%-- 
    Document   : CreateAccount.jsp
    Created on : 2024年4月2日, 下午8:43:51
    Author     : plksa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
        <script src="https://kit.fontawesome.com/61b76a306e.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="CreateAccount.css"/>
    </head>
    <body>

        <div class="container">
            <form action="CreateAccount" method="post">
                <div class="row">
                    <h4>Account</h4>
                    <div class="input-group input-group-icon">
                        <input type="text" name="name" placeholder="Full Name" />
                        <div class="input-icon"><i class="fa fa-user"></i></div>
                    </div>
                    <div class="input-group input-group-icon">
                        <input type="email" name="email" placeholder="Email Adress"/>
                        <div class="input-icon"><i class="fa fa-envelope"></i></div>
                    </div>
                    <div class="input-group input-group-icon">
                        <input type="password" name="pw" placeholder="Password" />
                        <div class="input-icon"><i class="fa fa-key"></i></div>
                    </div>

                    <div class="input-group input-group-icon">
                        <select name="role" id="role">
                            <option value="">Please select roles</option>
                            <option value="user">User</option>
                            <option value="technician">Technician</option>
                            <option value="courier">Courier</option>
                            <option value="staff">Staff</option>
                        </select>
                        <div class="input-icon"><i class="fa-solid fa-address-card"></i></div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-half">
                        <h4>Date of Birth</h4>
                        <div class="input-group">
                            <div class="col-third">
                                <input type="text" name="day" placeholder="DD" />
                            </div>
                            <div class="col-third">
                                <input type="text" name="month" placeholder="MM" />
                            </div>
                            <div class="col-third">
                                <input type="text" name="year" placeholder="YYYY" />
                            </div>
                        </div>
                    </div>
                    <div class="col-half">
                        <h4>Gender</h4>
                        <div class="input-group">
                            <input id="gender-male" type="radio" name="gender" value="male" />
                            <label for="gender-male">Male</label>
                            <input id="gender-female" type="radio" name="gender" value="female" />
                            <label for="gender-female">Female</label>
                        </div>

                    </div> 
                    <button type="submit" >Register</button>
                </div>
            </form>
        </div>
    </body>
</html>
