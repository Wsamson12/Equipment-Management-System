<%-- 
    Document   : navbar
    Created on : 2024年4月11日, 下午11:33:19
    Author     : plksa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>

<head>
  <title>Responsive Table Design - Easy Tutorials</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="navbar.css">
  <script src="https://kit.fontawesome.com/61b76a306e.js" crossorigin="anonymous"></script>
  <style>  * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    .hero {
      width: 100%;
      min-height: 100vh;
      background: yellow;
      color: #525252
    }

    nav {
      background: #1a1a1a;
      width: 100%;
      padding: 10px 10%;
      display: flex;
      align-items: center;
      justify-content: space-between;
      position: relative;
    }

    .logo {}

    .user-pic {
      width: 40px;
      border-radius: 50;
      cursor: pointer;
      margin-left: 30px;
    }

    nav ul {
      width: 100%;
      text-align: right;
    }

    nav ul li {
      display: inline-block;
      list-style: none;
      margin: 10px 20px;
    }

    nav ul li a {
      color: #fff;
      text-decoration: none;
    }

    .sub-menu-wrap {
      position: absolute;
      top: 100%;
      right: 10%;
      width: 320px;
      max-height: 0px;
      overflow: hidden;
      transition: max-height 0.5s;
    }

    .sub-menu-wrap.open-menu {
      max-height: 400px;
    }

    .sub-menu {
      background: #fff;
      padding: 20px;
      margin: 10px;
    }

    .user-info {
      display: flex;
      align-items: center;
    }

    .user-info img {
      width: 60px;
      border-radius: 50%;
      margin-right: 15px;
    }

    .info-text {
      display: flex;
      flex-direction: column;
    }

    .info-text h3 {
      font-weight: 500;
      margin-bottom: 5px;
    }

    .info-text p {
      font-size: 14px;
      color: #888;
    }

    hr {
      border: 0;
      height: 1px;
      width: 100%;
      background: #ccc;
      margin: 15px 0 10px;

    }

    .sub-menu-link {
      display: flex;
      align-items: center;
      text-decoration: none;
      color: #525252;
      margin: 12px 0;

    }

    .sub-menu-link p {
      width: 100%;
    }

    .sub-menu-link img {
      width: 40px;
      background: #d0d0e1;
      border-radius: 50%;
      padding: 8px;
      margin-right: 15px;
    }

    .sub-menu-link span {
      font-size: 22px;
      transition: transform 0.5s;
    }

    .sub-menu-link:hover span {
      transform: translateX(5px);
    }

    .sub-menu-link:hover p {
      font-weight: 600;
    }</style>
</head>

<body>
  <div class="hero">
    <nav>
      <div class="logo">
            <i class="fas fa-graduation-cap" style="color: red;"></i>
            <span class="header-text">HKITI system</span>
        </div>
      <ul>
        <li><a href="">Home</a></li>
        <li><a href="">Home</a></li>
        <li><a href="">Home</a></li>
        <li><a href="">Home</a></li>
      </ul>
      <img src="icons8-user-48.png" alt="" class="user-pic" onclick="toggleMenu()">

      <div class="sub-menu-wrap" id="subMenu">
        <div class="sub-menu">
          <div class="user-info">
            <img src="icons8-user-48.png" alt="">
            <div class="info-text">
              <h3> <%= session.getAttribute("AccountBean") != null ? ((ict.Bean.AccountBean) session.getAttribute("AccountBean")).getUsername() : "Guest"%></h3>
              <p>role</p>
            </div>
          </div>
          <hr>

          <a href="" class="sub-menu-link">
            <img src="edit_profie.png" alt="">
            <p>Edit</p>
            <span>></span>
          </a>
          <a href="" class="sub-menu-link">
            <img src="icons8-logout-48.png" alt="">
            <p>Logout</p>
            <span>></span>
          </a>

        </div>
      </div>
    </nav>
  </div>
  <script>
    let subMenu = document.getElementById("subMenu");

    function toggleMenu() {
      subMenu.classList.toggle("open-menu");
    }

  </script>
</body>

</html>

