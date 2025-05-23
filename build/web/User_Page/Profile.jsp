<%-- 
    Document   : Profie
    Created on : 2024年4月12日, 上午12:51:25
    Author     : plksa
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <style>
            body {
                margin: 0;
                padding-top: 40px;
                color: #2e323c;
                background: #f5f6fa;
                position: relative;
                height: 100%;
            }

            .account-settings .user-profile {
                margin: 0 0 1rem 0;
                padding-bottom: 1rem;
                text-align: center;
            }

            .account-settings .user-profile .user-avatar {
                margin: 0 0 1rem 0;
            }

            .account-settings .user-profile .user-avatar img {
                width: 90px;
                height: 90px;
                -webkit-border-radius: 100px;
                -moz-border-radius: 100px;
                border-radius: 100px;
            }

            .account-settings .user-profile h5.user-name {
                margin: 0 0 0.5rem 0;
            }

            .account-settings .user-profile h6.user-email {
                margin: 0;
                font-size: 0.8rem;
                font-weight: 400;
                color: #9fa8b9;
            }

            .account-settings .about {
                margin: 2rem 0 0 0;
                text-align: center;
            }

            .account-settings .about h5 {
                margin: 0 0 15px 0;
                color: #007ae1;
            }

            .account-settings .about p {
                font-size: 0.825rem;
            }

            .form-control {
                border: 1px solid #cfd1d8;
                -webkit-border-radius: 2px;
                -moz-border-radius: 2px;
                border-radius: 2px;
                font-size: .825rem;
                background: #ffffff;
                color: #2e323c;
            }

            .card {
                background: #ffffff;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                border: 0;
                margin-bottom: 1rem;
            }

        </style>
        <script>
            function showContact() {
                var contactInfo = document.getElementById("contact-info");
                contactInfo.classList.toggle("hidden");
            }

        </script>
    </head>

    <body>
        <form action="">
            <div class="container">
                <div class="row gutters">
                    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="account-settings">
                                    <div class="user-profile">

                                        <h5 class="user-name"><%= session.getAttribute("AccountBean") != null ? ((ict.Bean.AccountBean) session.getAttribute("AccountBean")).getUsername() : "Guest"%></h5>
                                        <h6 class="user-email"><%= session.getAttribute("AccountBean") != null ? ((ict.Bean.AccountBean) session.getAttribute("AccountBean")).getEmail() : "No email"%></h6>
                                        <h6 class="user-role"><%= session.getAttribute("AccountBean") != null ? ((ict.Bean.AccountBean) session.getAttribute("AccountBean")).getRole() : "No role assigned"%></h6>
                                    </div>
                                    <div class="about">
                                        <h5>About</h5>
                                        <p>I'm Yuki. Full Stack Designer I enjoy creating user-centric, delightful and human experiences.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <h6 class="mb-2 text-primary">Personal Details</h6>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="fullName">Full Name</label>
                                            <input type="text" class="form-control" id="fullName" placeholder="Enter full name" value="<%= session.getAttribute("AccountBean") != null ? ((ict.Bean.AccountBean) session.getAttribute("AccountBean")).getUsername() : "Guest"%>">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="eMail">Email</label>
                                            <input type="email" class="form-control" id="eMail" value="<%= session.getAttribute("AccountBean") != null ? ((ict.Bean.AccountBean) session.getAttribute("AccountBean")).getEmail() : "No email"%>"" placeholder="Enter email">
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group"> <label for="role">Role</label> <input type="text" class="form-control" id="Role" value="<%= session.getAttribute("AccountBean") != null ? ((ict.Bean.AccountBean) session.getAttribute("AccountBean")).getRole() : "No role assigned"%>" readonly> </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group"> <label for="Gender">Gender</label> <input type="text" class="form-control" id="Gender" placeholder="Gender" readonly> </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                             <div class="col">
                                            <label for="birthday">Birthday</label>
                                            <div class="row gutters">
                                               <input type="text" class="form-control" name="date_of_birth" placeholder="yyyy-mm-dd" value="<%= session.getAttribute("AccountBean") != null ? ((ict.Bean.AccountBean) session.getAttribute("AccountBean")).getDateOfBirth() : "No date of birth"%>" readonly>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="pw">Password</label>
                                            <input type="password" class="form-control" id="pw" placeholder="password" maxlength="10">
                                        </div>
                                    </div>

                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                            <button id="submit" class="btn btn-secondary"><a href="home.jsp" style="text-decoration:none">Cancel</a></button>

                                            <button type="submit" id="submit" name="submit" class="btn btn-primary">Update</button>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                    </form>


                </div>
            </div>
    </body>